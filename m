Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768E7F483F7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 20:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DB2781947;
	Mon, 23 Mar 2026 20:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AB1ZIgkV2v1F; Mon, 23 Mar 2026 20:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 639B1819BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774297042;
	bh=ipkhF1iwGXQaBJkiOZFQUFjLOPrAPjw191UbDeJnnFU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L/fIyZXUNM9gyAc7uOYmbfXMWcSAsr2+CgPgs7hatYcFOaWKwASd+2ee3u1xk9VD8
	 pWA24ekJqaafJLdeRxN0TYwOrTFSTnSWddP0dW1iPI4y3B0hpa23ejpIWOF+p7JYZY
	 YzaQ3QYbinbH4xE5pwkDDwe3s5EIA6v7f37W4ZWVxnp5JQfqWVI6sI7P5WUU3Gu0eG
	 JSN69kdjMXDlmUUn1+MDN/urHq1N2SfLbO91d//n5PDbZPoNKbK8Sjhwl6jOrU/4Of
	 xQs5fnBa5Y0BZlvBc0S3BKBW6ApNO0oLEytwNGaey3+3qP5ATPDKy3XakrGZOXoLNx
	 h2ZgkdqqlVI5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 639B1819BC;
	Mon, 23 Mar 2026 20:17:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EE2CF4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 201FF40A86
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QagFRouUmzmv for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 20:17:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54C8040A82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54C8040A82
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54C8040A82
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:17:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4E1BD13F86E;
 Mon, 23 Mar 2026 21:17:17 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 23 Mar 2026 21:17:17 +0100
MIME-Version: 1.0
Date: Mon, 23 Mar 2026 21:17:17 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260322090709.1150583-1-bernd@kuhls.net>
References: <20260322090709.1150583-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <cc6b8cb2640469530044ab6d689e93a4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774297038;
 bh=l8vRpatf71X6gYccxwADgQvTFLyLgoYg6h2BNOtnDFM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WPZP92RchOMXM38lCiqs2+EaDSotAvVcQI3I1BYW9BpvaaiMnqS71UHl5JiUvtUiG
 kaHm1IHLk0SOCSFr2DcMkuqdjV+ae1l64Xdo+hKDolQI59dZL5JEQxhPkq/0SX5emD
 i0NAXfvVlKfdQrViJE3LjLYOMPURjPa+EjiDNE8k0tQffNZCumZ2LMi/EpwFgSAmqa
 71m9yZdJ0+U2O9qRRedOj8wWIiWcDXuH3gw8SVKppftq9Z8QzN4enCg0bLPsE+ldXv
 XJoluw08V0DHWlrRzEwwyZxitYPA+nxFONju5ZA8i/ETzEVFqHKC7f5JeSZTXXrmJV
 G0L8Iu8KuR7dg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WPZP92Rc
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: fix build
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

On 22/03/2026 10:07, Bernd Kuhls wrote:
> Buildroot commit b08ac7636dc7b2753592989dc5fe73959e0f6507 bumped the
> package to version 0.3.31 and introduced a build error
> 
> linktest.c:(.text.startup+0x6f4):
>  undefined reference to `openblas_set_threads_callback_function'
> 
> which according to https://github.com/OpenMathLib/OpenBLAS/issues/5607
> was introduced by upstream commit
> https://github.com/OpenMathLib/OpenBLAS/commit/879497990f42e6dcfa370bcbf478cc5674158336
> that was first included in version 0.3.31.
> 
> This patch adds another upstream commit to fix the problem.
> 
> Fixes:
> https://autobuild.buildroot.net/results/7d8/7d80a912ddda01acd109786641df02ad826399f6/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
