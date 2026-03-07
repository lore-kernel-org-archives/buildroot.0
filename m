Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9887FC9ED3
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 10:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 829FD8226A;
	Sat,  7 Mar 2026 10:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRy3ehNZfF76; Sat,  7 Mar 2026 10:07:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0C6D82255
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772878075;
	bh=aqt8eJgO0ygGRa7PxLZ/oPMft8+4Fj9ewmQ8ZxuIavA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EzHPKV+IC4HQe4pBe3615CWukM8MB3Ey57WHccxfzjxmTeTG7Lq3Ha6tXUDxLOtlc
	 Z/IRzzfpoBWmSj+HeLNbe1wl30la9krr4IR+DH0BGhE3VkwkJEG+a3Si6Ru+Adp2/H
	 qsKxEm7LcXFgrZxGexgR+eoUkD5NTMmZQ3Ch9LOTqKJSxKq7L8iiFrO+KH+OVl7B8c
	 LpBkwJ6CQhzhR1BVfMV0jbbSLXi4KoJXKY4E/XPEuHefbUH3/VEJdetjpqz4Xt+GLq
	 CWhqvcPtC67ZEuq2SY/C42DhfUSkUALHTJg3GUzffiC3uOlMoH8x8+DoF2aPEL0C+V
	 rDsMFesxBz10Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0C6D82255;
	Sat,  7 Mar 2026 10:07:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 061D2223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03AA5418DA
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d4LWHILxbLSS for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 10:07:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F22D418D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F22D418D8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F22D418D8
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:07:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 767B519F57E;
 Sat,  7 Mar 2026 11:07:49 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 11:07:48 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 11:07:48 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260304172729.3622901-1-james.hilliard1@gmail.com>
References: <20260304172729.3622901-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <f4a182115fc51f7a7b721352473d2639@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772878070;
 bh=OXA8ItlIoLZV9NC0tbFgNMzQ9Udd6bkVI9iLnN/mwdM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UaIXVozSLvT0CGnCDe0eXIZZaJJp9VNQDIJ0Or171DvzyWch7w/rObIU68zfGFb+V
 4XjNM+M1C+ZmzpGaOdyuM91ZxX5WiGOqcdTZ3OvJ9mnlbFRZ7IrqkycBrTnf0K+qcE
 8RHkgfr0QerOmFA5gP+rFxVxgQose27fvuqZ5YCwcEqhUeb/DqyrNjDogsOlxJ6NLD
 y5yJ2myIVgHmEfo0sVIaCGWV+DW7AuFBJrcwNRB8DY53mmpPznPJA3/tZRyTpaQIlX
 SZt8Mzm/vVLe3ZLIeK2BCdKniGYRlb3JsAfr6gsLazTgsz5zKrEuxfp/Q+qyL+mdXH
 Hf1OqxKVE7S+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UaIXVozS
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiodns: bump to version
 4.0.0
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

On 04/03/2026 18:27, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
