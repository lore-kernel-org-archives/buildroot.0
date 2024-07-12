Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC0CC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 16:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CC1641955;
	Fri, 12 Jul 2024 16:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bV-yyN3Bp1nS; Fri, 12 Jul 2024 16:04:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD4704187C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD4704187C;
	Fri, 12 Jul 2024 16:04:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC82D1BF399
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 16:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C92AD410FB
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 16:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qxCL0D22NsMp for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 16:04:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F0D9240108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0D9240108
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0D9240108
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 16:04:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 281A11C0002;
 Fri, 12 Jul 2024 16:04:19 +0000 (UTC)
Date: Fri, 12 Jul 2024 18:04:18 +0200
To: Stephan Lukits <stephan.lukits@gmail.com>
Message-ID: <20240712180418.26d8a89c@windsurf>
In-Reply-To: <d94896a3-989a-429f-9c3d-f8b744aa91b8@gmail.com>
References: <d94896a3-989a-429f-9c3d-f8b744aa91b8@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720800259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1+NQ0O/JR1slHwCPZ5zOhzBSfc2pHlhcJEX4wN+drbM=;
 b=mO/i6Eg5WOPpLN4Hklgeg+QZRibtcWJCWZ9fO0hvkNuoYufJ2M4+/nTcUaa6hZLPex8eYX
 j8c3Ii1T9Wror/Q0Hb4PI2rpMZhMWMQLI+8xkQdjuPfQ+x8Ic8zl5E/hU3qkFgj9gN8K/e
 OO9G9RxBXX4WGC/Ida1pQu4gN51en1Lm961pmNhwSHbQM83zAyqjicdWAHX8s4ZBi0hryX
 UqoFhM42MIhMtae40zB6kuYj+LQZsan1gtEljKsqnn0VtWywKf1cHpdUxX0fJVZsg+XTC4
 CGlL5EZaz+as+mYYzk/IhnzqGAhkMYUg5NP3p1yKGCtwfD8evomOHWeXPdLMyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mO/i6Eg5
Subject: Re: [Buildroot] few patches for raspberrypi3_qt5we_defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Stephan,

Thanks a lot for your e-mail and your contribution! Please see below
some feedback.

On Thu, 6 Jun 2024 10:19:25 +0200
Stephan Lukits <stephan.lukits@gmail.com> wrote:

> Good afternoon, on my way to build raspberrypi3_qt5we_defconfig with
> buildroot 2024.02 I had to do the following patches in order to proceed.
> I did NOT do these patches as described in
> https://buildroot.org/downloads/manual/manual.html#submitting-patches
> (I'm not there yet) but with 'quilt' so I put them all in this mail to
> more aid the maintainer of 'raspberrypi3_qt5we_defconfig' then to
> actually provide patches.

Thanks, but unfortunately, it means we are unable to apply them :-/

> Following https://github.com/google/snappy/pull/169/files I made a
> 0001-check-NEON-for-ARMv8-CPUs.patch
> 
> Index: snappy-1.1.10/CMakeLists.txt
> ===================================================================
> --- snappy-1.1.10.orig/CMakeLists.txt
> +++ snappy-1.1.10/CMakeLists.txt
> @@ -194,9 +194,9 @@ int main() {
>   check_cxx_source_compiles("
>   #include <arm_neon.h>
>   int main() {
> -  uint8_t val = 3, dup[8];
> +  uint8_t val = 3;
>     uint8x16_t v = vld1q_dup_u8(&val);
> -  vst1q_u8(dup, v);
> +  val = vmaxvq_u8(v);
>     return 0;
>   }" SNAPPY_HAVE_NEON)

I am not 100% sure because it's not the same patch, but I believe this
snappy issue has been fixed
by https://gitlab.com/buildroot.org/buildroot/-/commit/01f35f8875acc98adb670d789b256790e2418be8
which we merged today.

> Following 
> https://lore.kernel.org/buildroot/20231025205233.1925727-1-kadir.c.yilmaz@gmail.com 
> I made a 0003-python3.11-regex-error.patch

When you say "following", do you mind "in addition to" ? Seems like no,
your patch is the same
as https://lore.kernel.org/buildroot/20231025205233.1925727-1-kadir.c.yilmaz@gmail.com/.

> Index: 
> qtwebengine-chromium-0ad2814370799a2161057d92231fe3ee00e2fe98/chromium/tools/metrics/ukm/ukm_model.py
> ===================================================================
> --- 
> qtwebengine-chromium-0ad2814370799a2161057d92231fe3ee00e2fe98.orig/chromium/tools/metrics/ukm/ukm_model.py
> +++ 
> qtwebengine-chromium-0ad2814370799a2161057d92231fe3ee00e2fe98/chromium/tools/metrics/ukm/ukm_model.py
> @@ -42,7 +42,7 @@ _INDEX_TYPE = models.ObjectNodeType(
>   _STATISTICS_TYPE =  models.ObjectNodeType(
>       'statistics',
>       attributes=[
> -      ('export', str, r'^(?i)(|true|false)$'),
> +      ('export', str, r'(?i)^(|true|false)$'),
>       ],
>       children=[
>           models.ChildType(_QUANTILES_TYPE.tag, _QUANTILES_TYPE, 
> multiple=False),
> @@ -94,7 +94,7 @@ _EVENT_TYPE =  models.ObjectNodeType(
>       'event',
>       attributes=[
>         ('name', str, r'^[A-Za-z0-9.]+$'),
> -      ('singular', str, r'^(?i)(|true|false)$'),
> +      ('singular', str, r'(?i)^(|true|false)$'),
>       ],
>       alphabetization=[
>           (_OBSOLETE_TYPE.tag, _KEEP_ORDER),
> 
> 
> Following 
> https://salsa.debian.org/qt-kde-team/qt/qtwebengine/-/commit/32198a3e0694401b745b4d01add18cdcddf658b4 
> I made a
> 0004-fix-building-with-gcc-12.patch

OK, thanks, need to fire up a build and reproduce the issue I guess.

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
