Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0845EC49EA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 14:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9ADB6084D;
	Tue,  6 Aug 2024 14:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jBknnpll81t; Tue,  6 Aug 2024 14:26:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA6EB60850
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA6EB60850;
	Tue,  6 Aug 2024 14:26:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 524C31BF2B0
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 14:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F71E81053
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 14:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QaZxT8hKwQAg for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 14:26:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D15380F16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D15380F16
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D15380F16
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 14:26:45 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 609FB4402D3;
 Tue,  6 Aug 2024 17:25:14 +0300 (IDT)
To: Woodrow Douglass via buildroot <buildroot@buildroot.org>
In-Reply-To: <20240806130553.981094-1-wdouglass@carnegierobotics.com> (Woodrow
 Douglass via buildroot's message of "Tue,
 6 Aug 2024 09:05:53 -0400")
References: <20240806130553.981094-1-wdouglass@carnegierobotics.com>
Date: Tue, 06 Aug 2024 17:26:39 +0300
Message-ID: <878qx93exs.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1722954314;
 bh=urkoDmJj9Wx3VHQK05wNmcdNq4Bs8aJnUyR0MxhcwJw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FsanK/9mJLLyBNUn8ct9s6j8dIW4c0IGJt1GTUCSP9EnXZLs5rxEZSgK5D4W/xow2
 6LUaf/P813mCX0Jvgiv2Q4KkT1f73zEg78mzlaepUtJ5Mrid+iQF1OMv+qjh5wNHUR
 yz603EbRKj7g+NWqfhbJ7QAZA1n3OPajaO2re+YEWQz8hF9Rp1ubF1DvHOLPQj1FPf
 fz+B532AGgV0aKRyaMCu2AfvRhAKsDSEbsTpZ3MJWhOjA9S6mfzsZSiMzyu0W2bznz
 pzK2f0tV7IEjzJkkGH+0RR1/3JQeAV9vsazzVjlf/fX/uOYJPVnRL2hpy2Dm/DxZDv
 7/tQyVW2qIllg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=FsanK/9m
Subject: Re: [Buildroot] [PATCH] package/chicken: pass TARGET_CFLAGS to
 chicken build system explicitly
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Woodrow,

On Tue, Aug 06 2024, Woodrow Douglass via buildroot wrote:
> diff --git a/package/chicken/chicken.mk b/package/chicken/chicken.mk
> index 0520280134..e7a2384f5a 100644
> --- a/package/chicken/chicken.mk
> +++ b/package/chicken/chicken.mk
> @@ -16,8 +16,6 @@ CHICKEN_INSTALL_STAGING = YES
>  # values that have an effect, or pass "unused" here
>  ifeq ($(NORMALIZED_ARCH),x86_64)
>  CHICKEN_ARCH = x86-64
> -else ifeq ($(NORMALIZED_ARCH),xtensa)
> -CHICKEN_ARCH = xtensa
>  else
>  CHICKEN_ARCH = unused
>  endif
> @@ -25,6 +23,7 @@ endif
>  CHICKEN_MAKE_OPTS = \
>  	ARCH="$(CHICKEN_ARCH)" \
>  	C_COMPILER="$(TARGET_CC)" \
> +	C_COMPILER_OPTIONS="$(TARGET_CFLAGS) -fwrapv -DHAVE_CHICKEN_CONFIG_H -DC_ENABLE_PTABLES" \

I think C_COMPILER_OPTIMIZATION_OPTIONS is better for this purpose.
C_COMPILER_OPTIMIZATION_OPTIONS usage is documented in README and
config.make, while C_COMPILER_OPTIONS looks like an internal
implementation detail. C_COMPILER_OPTIMIZATION_OPTIONS allows Buildroot
users to override upstream default optimization options via
BR2_OPTIMIZE_x, or debug options via BR2_DEBUG_x. Another advantage of
not using C_COMPILER_OPTIONS is that you won't have to copy its default
value here.

baruch

>  	CXX_COMPILER="$(TARGET_CXX)" \
>  	PREFIX=/usr \
>  	PLATFORM=linux \

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
