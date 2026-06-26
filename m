Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43277C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 15:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6D7F81A73;
	Fri, 26 Jun 2026 15:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_uHcnFLNh4F; Fri, 26 Jun 2026 15:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDAA4819BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782488364;
	bh=lyUYKSwbsM8aTQiC0uP3rzZc8Tv6/Sy4cEc4OlzqPuQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p7bWpntjeq5uyuT9M2t7ovy/Nmc45oAAVLHjx5mKHGdzGP1fKyzP7rLIl0fU+xjh7
	 HNMuq7lH/CVi7vIu4kZQyNJW2MwPH7/cnKw4Aw58QOY3gjeLbvHKISSNUIPDZFVaFK
	 t+J1Ijlfwh66wAWQTag6pbALVk9qGDebcCutvK9dziXJVfCLGaThok64sTiS80G6w0
	 JBmt1hey4ZgtqPmkMqz2X6RDIPG6qfx0NXw3feBL+vQse25uy3XuOSsK7gRQG/WiuD
	 pdft4F0h/v9d7q5nUfhx1RjfF0trQxTTk8vS9A3diIv5TuoLAwI6tpz5dHQhNB0Ru5
	 JDeYxevxcnQXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDAA4819BC;
	Fri, 26 Jun 2026 15:39:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DC18231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 15:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E740740B9B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 15:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XExONEl0p5rD for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 15:39:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7598440B9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7598440B9A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7598440B9A
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 15:39:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfpSb-1x5qdG1SXp-00hLDV; Fri, 26
 Jun 2026 17:39:15 +0200
Message-ID: <d3d478d2-ab49-40e3-94c1-4cd3f0a46ea7@gmx.de>
Date: Fri, 26 Jun 2026 17:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20260626093225.4121915-1-peter@korsgaard.com>
 <20260626124913.296693-1-thomas.perale@mind.be>
 <875x355u5y.fsf@dell.be.48ers.dk>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <875x355u5y.fsf@dell.be.48ers.dk>
X-Provags-ID: V03:K1:f475vsYkrQlThxgkanUgJb/H5lN55IVC88pxCx3pN8brTzFcqOv
 TQHOiGOWYrAb9+sppCLbReZZG4X06Ba3h/Q4II6qoeNUcAEb6+GFs44fUQahJmHsOBwYYs9
 ae03xWsuTnWTxs2UeTrTyrxZfkoGA58rnmAbyUJ7ApZaV2Dxl5uWh2XVuZe5feUCrDecTqt
 EdDpkYiBLObFVe9o8+D1w==
UI-OutboundReport: notjunk:1;M01:P0:QIUrdpTsvGM=;F7qipiNPoUNSP1WYVAnRwOs1wcr
 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
 uiDL9gwbM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782488355; x=1783093155; i=fiona.klute@gmx.de;
 bh=nNTd3MJWPZPfxXS57xQnoTKV3u+WLLZO2CiiDwOAimI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=m0e2Ofj3JXm1xMNAlE5iSWtpLITkLxmNuRX3KuMh9VmpxXUazt455sHAh3QTE2z6
 uRUBE1sTUj2U5Nw9WFp8u55trAITBgroEh/bZWd5zO2P5C7c4496QlRWJXlS4edL+
 Us/PDyRl8w22zmHbNBplf9uLp6cMiFdzf8XevpJ/NeH46iWAO5ZX28M8NgloSiKZK
 RS1mTNky4R6wgNyME9zsZ/Ui+izvjH3ylse80J70Og/U1VDgOf/l0XfZCn+CLsCSn
 gicwXkCLRy5gxb3Tg9RJlSmTeyvVEtFSITBm6qyZPg1rhLMsljGM5scskIdoMY+bg
 AzSTZn6TaqL6f5kLyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=m0e2Ofj3
Subject: Re: [Buildroot] [PATCH-2025.02.x] package/libglib2: backport
 security fixes for CVE-2025-14087
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

Am 26.06.26 um 15:05 schrieb Peter Korsgaard:
>>>>>> "Thomas" == Thomas Perale <thomas.perale@mind.be> writes:
> 
>   > Hi Peter,
>   > Thanks for the patch. I think there are a couple of others vulnerability that
>   > still affects libglib2. I can look at backports next week but everytime I look
>   > at libglib2 there is always something that bother me. I think some of those
>   > questions also applies to master branch so maybe you can give me guidance.
> 
> I'll try. I am also not a big libglib2 user, I just got tired of seeing
> the vulnerability showing up each time.
> 
> 
>   > - The `2.82.0` subdirectory, if I run the 'libglib2-patch' or
>   >   'libglib2-bootstrap-patch' the patch present in that directory is not applied
> 
> Presumably this was forgotten when Fiona bumped to 2.82.5. Fiona?

Seems likely, yes.

>> - libglib2 & libglib2-bootstrap. If we apply a patch to
>   >   libglib2, shouldn't it be applied as well on libglib2-bootstrap since it's used
>   >   to build gobject-introspection ?
> 
> I guess so. Fiona?

It's been a while so I don't remember, but looking at 
11aa1cfa5af9a77a0a9f726bd38f1b7db659c0bf that was definitely the 
intention. There is a symlink:

package/libglib2/libglib2-bootstrap/2.82.0 -> ../2.82.0

So except for the forgotten version update for the directory/symlink the 
patch would be applied. The idea was to only have to update that instead 
of symlinks for each patch (if there should be more than one in the future).

What gives me pause is that nobody complained about the missing patch 
causing issues. The patch description mentions specific packages that 
get their search paths for GIR files wrong without it: atk and libnice.

package/atk has been removed in 
2c3ca7bea1de76163aeef432412eb14551ed0581, with the stated reason that it 
has been merged into at-spi2-core. package/libnice was last updated in 
2023. For both at-spi2-core and libnice gobject-introspection is an 
optional dependency, without it those GIR files shouldn't be used, so 
the search path shouldn't matter.

I'm not using either package, so I wonder: Has the patch become 
obsolete, and both packages now find the GIR files without it using the 
defaults? Or has nobody built them with GOI enabled since? In the former 
case we should drop the patch on master, and for stable check when that 
happened. I'm going to do a test-pkg run with 
BR2_PACKAGE_GOBJECT_INTROSPECTION=y at least, we'll see if the error in 
the patch description shows up.

>> - The shared CPE between libglib2 & libglib2-bootstrap. If we don't apply the
>   >   same set of patch to libglib2-bootstrap then we should drop the CPE
>   >   for libglib2-bootstrap so it doesn't appear in security tracker with the same
>   >   CVEs as libglib2.

Side note: We should probably also set

LIBGLIB2_BOOTSTRAP_INSTALL_TARGET = NO

Only the primary package (bootstrapped or not) needs to be installed on 
the target. That way any security issues in libglib2-bootstrap would 
definitely only matter if exploitable during Buildroot build. The 
libglib2 package should overwrite them anyway, but this would guarantee it.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
