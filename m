Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F104C43458
	for <buildroot@archiver.kernel.org>; Tue, 30 Jun 2026 14:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21D4E61009;
	Tue, 30 Jun 2026 14:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FSXfU0dIQlyL; Tue, 30 Jun 2026 14:12:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0880460FFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782828726;
	bh=ZpBuILmQ2utFlzx7GfAoQo/xMm5ntDLApzxuhJnY4Ns=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=quK/vKNqDSRZWag8dvz7y5VcWzHyC+VF7ouPCs7QVOZKQ29VgXrHcr0bvOCjnDmlW
	 qSv9RYDhaOy/CjisBqZnc+xjU0moiCGFb8TxAfhzeJbT11XROJRLuWZ1TtAPNint0e
	 sEn6+AQ1u9w37KTSLM3TdSOg5QrKd1npOW9JlBwgTV6eCYsMMDOofcQ9WL9Ww0aX+L
	 4X4tWkz/Dx6wAz8a/RetoMdec/EbyS9gpQDfPXH1IC9H1zRczhxkYDCrypvW1O+kbq
	 irH7iwddyUL0RDdkoTTULq6KSvCsowRFhqpguIOgcPzWKMlRLaVY3/Y5gER4RSQ1T9
	 pLtqSagtrqscQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0880460FFA;
	Tue, 30 Jun 2026 14:12:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 05D63ED6
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 14:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBA5440487
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 14:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wW-rCrf1mS5F for <buildroot@buildroot.org>;
 Tue, 30 Jun 2026 14:12:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4EB034011A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EB034011A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EB034011A
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 14:12:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzQkE-1x0NMW0ujA-017RwB; Tue, 30
 Jun 2026 16:12:00 +0200
Message-ID: <4baec67b-bd02-4cd1-8292-33a759c838f6@gmx.de>
Date: Tue, 30 Jun 2026 16:11:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260629210003.623732-1-thomas.perale@mind.be>
 <20260629210003.623732-2-thomas.perale@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260629210003.623732-2-thomas.perale@mind.be>
X-Provags-ID: V03:K1:0tRSPRgn0el/22um/epJKU/R+FtvNEWZpcKvhE7QIVzITWASxyK
 jNsCcesQj1BWQEz/T4WbBpj45QCTvFFa5IgvCbXM2pa5ATD5MQcreXMOO2XqN+sDg11rdnn
 Tp6P7fvzEAu+xKagPLn4uWh5Ufpe4xEb24//O3AgGq/naff38EFUauPFfV3CQcf34nqdiTZ
 SBB4K5wfojcXAicX5hacw==
UI-OutboundReport: notjunk:1;M01:P0:UrdkVzKaLp0=;n3U1qmp3mOBz4IqpBigVymmJPxK
 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
 mba2CoImA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782828720; x=1783433520; i=fiona.klute@gmx.de;
 bh=I6onPSKlSVGT4TSeTbNwaXBuykW27baLt2PEu+SkPr4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=rdjywsAo6zNZjnjhPdySXLHYt2bFUtEJZyTN5Aco6cWKDTH2ZcdxB0AqObpKyhn5
 44/BEBSP9hPrL64SrVPXTv9kQcYM7rgHZRDbBEzJm8VFGwUZ0KKFD1AIPo3FsxWlr
 d2POiBvibDjOCvuBzwL87n3uXpfvbNDHTl/pvR55Df4sauuUFooE2TZ7/HsJRzEsg
 EOvsN1FUoDhibZRL03Y00i3v/XqVyQ6zx1PpSJCVDbEtWA+99CitB2nv9YnOVeWnw
 wfYiMWNtfyhNRFkOI8kBpI9SM4keov9BgV50C+nyvaYpuRuYrD0b7dKF6BaBrtP3U
 eECP3FEbcjYmYMbp0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=rdjywsAo
Subject: Re: [Buildroot] [PATCH 2/2] package/libssh2: backport upstream
 patch for CVE-2026-55200
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 29.06.26 um 23:00 schrieb Thomas Perale via buildroot:
> - CVE-2026-55200:
>      libssh2 through 1.11.1, fixed in commit 7acf3df contains an out-of-
>      bounds write vulnerability in ssh2_transport_read() that fails to
>      enforce upper bounds on packet_length field. Remote attackers can send
>      crafted SSH packets with excessively large packet_length values to
>      corrupt heap memory and achieve remote code execution.
> 
> For more information, see:
>    - https://www.cve.org/CVERecord?id=CVE-2026-55200
>    - https://github.com/uclouvain/openjpeg/commit/839936aa33eb8899bbbd80fda02796bb65068951

I think there's a mixup here with the openjpeg security patch you sent? 
I assume the URL should be: 
https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8

And it seems the CVE description also has a typo, missing the 9 at the 
beginning of the commit ID, but that's in the CVE directory, too. Not 
sure if we should fix that or add a "[sic!]"?

Best regards,
Fiona

> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   ...al-boundary-checks-for-packet-length.patch | 36 +++++++++++++++++++
>   package/libssh2/libssh2.mk                    |  3 ++
>   2 files changed, 39 insertions(+)
>   create mode 100644 package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch
> 
> diff --git a/package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch b/package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch
> new file mode 100644
> index 0000000000..ef54771afc
> --- /dev/null
> +++ b/package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch
> @@ -0,0 +1,36 @@
> +From 97acf3dfda80c91c3a8c9f2372546301d4a1a7a8 Mon Sep 17 00:00:00 2001
> +From: Will Cosgrove <will@panic.com>
> +Date: Fri, 12 Jun 2026 15:57:44 -0700
> +Subject: [PATCH] transport.c: Additional boundary checks for packet length
> + (#2052)
> +
> +Add additional bounds checking on packet length to prevent OOB write.
> +
> +Credit: [TristanInSec](https://github.com/TristanInSec)
> +
> +CVE: CVE-2026-55200
> +Upstream: https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8
> +[thomas: backport to 1.11.1, change ntohu32 call]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/transport.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/transport.c b/src/transport.c
> +index 869fc5a4fa..7925ad33d1 100644
> +--- a/src/transport.c
> ++++ b/src/transport.c
> +@@ -645,8 +645,12 @@ int ssh2_transport_read(LIBSSH2_SESSION *session)
> +                 total_num = 4;
> +
> +                 p->packet_length = _libssh2_ntohu32(block);
> +-                if(p->packet_length < 1)
> ++                if(p->packet_length < 1) {
> +                     return LIBSSH2_ERROR_DECRYPT;
> ++                }
> ++                else if(p->packet_length > LIBSSH2_PACKET_MAXPAYLOAD) {
> ++                    return LIBSSH2_ERROR_OUT_OF_BOUNDARY;
> ++                }
> +
> +                 /* total_num may include size field, however due to existing
> +                  * logic it needs to be removed after the entire packet is read
> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
> index c85129a7cd..0ccf5effb3 100644
> --- a/package/libssh2/libssh2.mk
> +++ b/package/libssh2/libssh2.mk
> @@ -19,6 +19,9 @@ LIBSSH2_IGNORE_CVES += CVE-2026-7598
>   # 0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
>   LIBSSH2_IGNORE_CVES += CVE-2026-55199
>   
> +# 0003-transport-c-Additional-boundary-checks-for-packet-length.patch
> +LIBSSH2_IGNORE_CVES += CVE-2026-55200
> +
>   ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
>   LIBSSH2_DEPENDENCIES += mbedtls
>   LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
