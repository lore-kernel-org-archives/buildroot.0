Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA0AD6AB01
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 20:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F96F40B54;
	Thu,  2 Apr 2026 20:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yz8RWXpHw-4L; Thu,  2 Apr 2026 20:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC43940B22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775161323;
	bh=rwBKVI1BPGBkbSd0wlp4yNPUdAyZlGLPJ+a1ZgtBLpk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=If3i9XnOr3ejDgNpA0IROnnt3WEAJqFgQ++M6no8l/GKh+p+NJuuDyAg9XnQydgoL
	 gzg41PTSv8PP/NqUMNH+rKPd3JctIPAewCaR+lOGCkCnpwH761VH453Mfvrh5aHZIV
	 KAgTLTVDFBAzRdX35aP+x+ASDMSn+4mE0v9w0AvwPFQj5fy2lK3nb374w7jwBe/KIP
	 c0xXN/B8wSngYyAg0WVX+RgIKVZNyM+Pj0oDkQ9VB6IyMwT5A/TvgBWOl0BSwnKD1s
	 z2uIY7x0d6eECjBdsPCLsMZUouqYMONeWyELcJttyA0Mn7+alISrUrZz7wJw5f0aQz
	 7QZsbYpzStgww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC43940B22;
	Thu,  2 Apr 2026 20:22:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 258692CC
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 20:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 179F240B22
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 20:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UzV24vMFf_LL for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 20:22:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1AA4A40B14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AA4A40B14
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AA4A40B14
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 20:22:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D0F8C60129;
 Thu,  2 Apr 2026 22:21:56 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 02 Apr 2026 22:21:56 +0200
MIME-Version: 1.0
Date: Thu, 02 Apr 2026 22:21:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260402175910.2779634-1-bernd@kuhls.net>
References: <20260402175910.2779634-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <121c99bd537788afaa219151a23f5455@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775161318;
 bh=XB/dhR22BzDUUKxIyvHdCX96PrSjEJtKxQggMG6TPW8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=r/wVLI5WjrJvKWti0jfrG5F187BX1aycw9oDqyNThOFCptNDU9DeZv7bGtWUPIUN2
 vyGkbdgRRUiKRDbJiGtupulCgZcxabXqlfK9q6a4lBOn7swAT4wThiRDbe7VAq7IDH
 cYSf78MDgZyWWTTAI6mf9rOLHme/veRxWlbjFc1zhhr7K1Cg9mAUxqj9oZj8Uc+k+B
 Z8xCyW5ADPdQaP6k4dmmR1uG6dyY0iC5Ol0pjfXl+weGE1832T5ZWQsKTSJVHA32ch
 jsOXdDrnE69H7SCSok7dgazslmGObw7Qpg1SxWt/R85GGu9jQ/8ARvnAEKamIFfFC2
 cp7EfVgXkglQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=r/wVLI5W
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6, 12,
 18, 19}.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 02/04/2026 19:59, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
