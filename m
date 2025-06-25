Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F48C7EE30
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 13:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2A8160F2C;
	Wed, 25 Jun 2025 13:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fy-anIY6cFmv; Wed, 25 Jun 2025 13:07:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22368614C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22368614C4;
	Wed, 25 Jun 2025 13:07:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45BBD43F
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36F1C84004
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJ7-ibWMhJvt for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 13:07:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DE99780EAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE99780EAE
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE99780EAE
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:07:02 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id 2BD784409E9;
 Wed, 25 Jun 2025 16:05:45 +0300 (IDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250625125220.104466-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 25 Jun 2025 14:52:19 +0200")
References: <20250625125220.104466-1-peter@korsgaard.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 25 Jun 2025 16:06:57 +0300
Message-ID: <87a55wj7gu.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1750856745;
 bh=5Fjez3uZmVTlvfyPAgK7OF8ahSCdB4zRKsgJoNo3trU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=DBjQAABgca06G4N1qWBMM2/7xQrvHCJms1kcy+ArkYK0yKg9Ryj7Vswy5r1vru9/f
 hsLD4f8Ut3Oe5fIsEPeWb5hiBB6/KohWLI69tG3vTZBWD99fZIhb6UeNbUx15RJnFM
 EkzFJ0OGA/BgUQfaD/GvE3Dgb/z6mu0TPvyzzEQdJhGGuzUYFDa5lvN/8QoQITcMRy
 tv4N9s6xOCsQOJr56Z4NzPMaW8nDLc2DDIBaLxAet2mJdrKOjeg2x54ET+PUNgg1AO
 cDNImFyMkNbByVNI4uX/unKsqrlHEA2NEGUurV6ackRFzvmYc3f4T7gKqDLeB1lYBx
 Jbz/TCWtvxdNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=DBjQAABg
Subject: Re: [Buildroot] [PATCH] package/libcurl: unbreak threads + c-ares
 conditional
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Wed, Jun 25 2025, Peter Korsgaard wrote:
> Commit 0fce7a9623 ("package/libcurl: fix build w/ threads + c-ares") added a
> conditional for threads + c-ares, but ended up with a end-parenthesis too
> many - so the condition is never true.  Fix that.
>
> Reported-by: Tibault Damman <tibault.damman@basalte.be>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  package/libcurl/libcurl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 5a3a668f06..e390c9d1bf 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -38,7 +38,7 @@ LIBCURL_IGNORE_CVES += CVE-2024-32928
>  
>  # threaded resolver cannot be used with c-ares
>  # https://github.com/curl/curl/commit/d364f1347f05c53eea5d25a15b4ad8a62ecc85b8
> -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES)),yx)
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES),yx)
>  LIBCURL_CONF_OPTS += --enable-threaded-resolver
>  else
>  LIBCURL_CONF_OPTS += --disable-threaded-resolver

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
