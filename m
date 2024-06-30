Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6D6C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 09:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8B98408D1;
	Sun, 30 Jun 2024 09:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lILBLqdxY0tA; Sun, 30 Jun 2024 09:29:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D743F408A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D743F408A5;
	Sun, 30 Jun 2024 09:29:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DCB41BF364
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 09:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3894040663
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 09:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELaT02dC-f_U for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 09:29:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3393040628
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3393040628
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3393040628
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 09:29:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8105F13F8A7;
 Sun, 30 Jun 2024 11:29:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Jun 2024 11:29:14 +0200
Date: Sun, 30 Jun 2024 11:29:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZoElaofFqV6r27Jb@landeda>
References: <20240629121828.12178-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240629121828.12178-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719739756;
 bh=W21nzqivIME1jtOlSlJeYETByj/l90ezhgjRgHBHRO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IjptQVRdzaefmyzqYQBHdRYICt4gNoV7PhF9v7uq2UyyLQHeIf1w0Bf5oUPSxqV/o
 3qmuyB/dJAQrJOHUcuLwi3INIy7eZTYV9QG3UOCszJffl6Wsxw4yPrJLhOf/EQr77T
 aU0hyTAp1vjTNG8Um33rZXn7X3hQilkEB52alIK9nHDouZg7JDV9rxtIFUeidGaDE+
 5c8T6XDLTgEdxWlQknAVPU73Sm3Um78LwyOXiGqZl2vCiEfDLOSusz/MDsMEOg4JMV
 z1N6R/635tTfqfRUo49KYeapsgUBdGcbJ+0SAklrWpCxi0Byu3Ic7cg9lYtD3zvOiu
 Ca3L+JdTB2U9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=IjptQVRd
Subject: Re: [Buildroot] [PATCH v2 1/1] package/sox: fix patch fuzz
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2024-06-29 14:18 +0200, Julien Olivain spake thusly:
> Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0" reduced the fuzz factor.
> 
> Due to this change, sox fails to build with output:
> 
>     Applying 0001-uclibc.patch using patch:
>     patching file src/formats.c
>     Hunk #1 FAILED at 409.
>     Hunk #2 succeeded at 477 (offset 60 lines).
>     1 out of 2 hunks FAILED -- saving rejects to file src/formats.c.rej
> 
> This commit refreshes the package patch on the current package version.
> Note 1: the failing patch 0001 was regenerated with "git format-patch".
> Since the patch file 0001 name changed in the regeneration, the
> ".checkpackageignore" entry is also updated accordingly.
> Note 2: patch 0002 did not require any update.
> 
> Fixes:
> http://autobuild.buildroot.org/results/1bc396386aa3321fe48101caf9635ae41feb057b
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Change v1 -> v2:
> - update .checkpackageignore entry
> ---
>  .checkpackageignore                           |  2 +-
>  ...-SoX-support-uclibc-based-toolchains.patch | 40 +++++++++++++++++++
>  package/sox/0001-uclibc.patch                 | 26 ------------
>  ...re.ac-fix-static-linking-with-id3tag.patch | 10 +++--
>  ...ure.ac-fix-static-linking-with-magic.patch | 10 +++--
>  ...e.ac-fix-static-linking-with-sndfile.patch | 10 +++--
>  6 files changed, 59 insertions(+), 39 deletions(-)
>  create mode 100644 package/sox/0001-Make-SoX-support-uclibc-based-toolchains.patch
>  delete mode 100644 package/sox/0001-uclibc.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 313201b0e68..1689b96e628 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1401,7 +1401,7 @@ package/softether/0008-librt.patch lib_patch.Upstream
>  package/softether/0009-uclibc-ai-addrconfig.patch lib_patch.Upstream
>  package/solarus/0001-cmake-remove-Werror.patch lib_patch.Upstream
>  package/solarus/0002-Add-a-basic-FindOpenGLES2.cmake.patch lib_patch.Sob lib_patch.Upstream
> -package/sox/0001-uclibc.patch lib_patch.Upstream
> +package/sox/0001-Make-SoX-support-uclibc-based-toolchains.patch lib_patch.Upstream
>  package/sox/0002-configure.ac-put-back-disable-stack-protector.patch lib_patch.Upstream
>  package/sox/0003-configure.ac-fix-static-linking-with-id3tag.patch lib_patch.Upstream
>  package/sox/0004-configure.ac-fix-static-linking-with-magic.patch lib_patch.Upstream
> diff --git a/package/sox/0001-Make-SoX-support-uclibc-based-toolchains.patch b/package/sox/0001-Make-SoX-support-uclibc-based-toolchains.patch
> new file mode 100644
> index 00000000000..3d21b570f18
> --- /dev/null
> +++ b/package/sox/0001-Make-SoX-support-uclibc-based-toolchains.patch
> @@ -0,0 +1,40 @@
> +From 5d51acafe9c38fb05939b4d2d6a9dcde12476458 Mon Sep 17 00:00:00 2001
> +From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +Date: Sat, 29 Jun 2024 12:28:54 +0200
> +Subject: [PATCH] Make SoX support uclibc-based toolchains
> +
> +From:
> +http://sourceforge.net/p/sox/bugs/179/
> +
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +[Julien: rebased patch on package git version 7524160,
> +and regenerated with git format-patch]
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +---
> + src/formats.c | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/src/formats.c b/src/formats.c
> +index 3fcf4382..9fc001bd 100644
> +--- a/src/formats.c
> ++++ b/src/formats.c
> +@@ -466,7 +466,7 @@ static void UNUSED rewind_pipe(FILE * fp)
> + #if defined _FSTDIO || defined _NEWLIB_VERSION || defined __APPLE__
> +   fp->_p -= PIPE_AUTO_DETECT_SIZE;
> +   fp->_r += PIPE_AUTO_DETECT_SIZE;
> +-#elif defined __GLIBC__
> ++#elif defined __GLIBC__ && ! defined __UCLIBC__
> +   fp->_IO_read_ptr = fp->_IO_read_base;
> + #elif defined _MSC_VER && _MSC_VER >= 1900
> +   #define NO_REWIND_PIPE
> +@@ -477,7 +477,6 @@ static void UNUSED rewind_pipe(FILE * fp)
> +   /* To fix this #error, either simply remove the #error line and live without
> +    * file-type detection with pipes, or add support for your compiler in the
> +    * lines above.  Test with cat monkey.wav | ./sox --info - */
> +-  #error FIX NEEDED HERE
> +   #define NO_REWIND_PIPE
> +   (void)fp;
> + #endif
> +-- 
> +2.45.2
> +
> diff --git a/package/sox/0001-uclibc.patch b/package/sox/0001-uclibc.patch
> deleted file mode 100644
> index 5c118fa4dca..00000000000
> --- a/package/sox/0001-uclibc.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Make SoX support uclibc-based toolchains, from:
> -http://sourceforge.net/p/sox/bugs/179/
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -
> -Index: sox-14.4.1/src/formats.c
> -===================================================================
> ---- sox-14.4.1.orig/src/formats.c
> -+++ sox-14.4.1/src/formats.c
> -@@ -409,7 +409,7 @@ static void UNUSED rewind_pipe(FILE * fp
> - #if defined _FSTDIO || defined _NEWLIB_VERSION || defined __APPLE__
> -   fp->_p -= PIPE_AUTO_DETECT_SIZE;
> -   fp->_r += PIPE_AUTO_DETECT_SIZE;
> --#elif defined __GLIBC__
> -+#elif defined __GLIBC__ && ! defined __UCLIBC__
> -   fp->_IO_read_ptr = fp->_IO_read_base;
> - #elif defined _MSC_VER || defined _WIN32 || defined _WIN64 || defined _ISO_STDIO_ISO_H
> -   fp->_ptr = fp->_base;
> -@@ -417,7 +417,6 @@ static void UNUSED rewind_pipe(FILE * fp
> -   /* To fix this #error, either simply remove the #error line and live without
> -    * file-type detection with pipes, or add support for your compiler in the
> -    * lines above.  Test with cat monkey.wav | ./sox --info - */
> --  #error FIX NEEDED HERE
> -   #define NO_REWIND_PIPE
> -   (void)fp;
> - #endif
> diff --git a/package/sox/0003-configure.ac-fix-static-linking-with-id3tag.patch b/package/sox/0003-configure.ac-fix-static-linking-with-id3tag.patch
> index 32d6f83b0cd..2bb574b319f 100644
> --- a/package/sox/0003-configure.ac-fix-static-linking-with-id3tag.patch
> +++ b/package/sox/0003-configure.ac-fix-static-linking-with-id3tag.patch
> @@ -1,4 +1,4 @@
> -From 8df3a56cfb104c84d4701562ae2e3c9dc4686798 Mon Sep 17 00:00:00 2001
> +From 06e5cc069dbdfa060c3d9e75a798ec121ecc9349 Mon Sep 17 00:00:00 2001
>  From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  Date: Sat, 6 Feb 2021 11:08:45 +0100
>  Subject: [PATCH] configure.ac: fix static linking with id3tag
> @@ -23,6 +23,8 @@ util.c:(.text+0x240): undefined reference to `uncompress'
>  Fixes:
>   - http://autobuild.buildroot.org/results/73efdacf237e3d567fa66f3b3f68e624f5e35bc7
>  
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +[Julien: rebased patch on package git version 7524160]
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  [Upstream status: https://sourceforge.net/p/sox/patches/123]
>  ---
> @@ -30,10 +32,10 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/configure.ac b/configure.ac
> -index 39306398..896714f5 100644
> +index a1665467..8f47a978 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -83,7 +83,7 @@ dnl Various libraries
> +@@ -88,7 +88,7 @@ dnl Various libraries
>   SOX_WITH_LIB([magic], [magic.h], [magic], [magic_open])
>   SOX_CHECK_LIB([ZLIB], [zlib.h], [z], [uncompress])
>   SOX_WITH_LIB([png], [png.h], [png], [png_set_rows], [], [], [], [$ZLIB_LIBS])
> @@ -43,5 +45,5 @@ index 39306398..896714f5 100644
>   
>   dnl Optional formats
>  -- 
> -2.29.2
> +2.45.2
>  
> diff --git a/package/sox/0004-configure.ac-fix-static-linking-with-magic.patch b/package/sox/0004-configure.ac-fix-static-linking-with-magic.patch
> index 7d2e390df11..ad36ecad57c 100644
> --- a/package/sox/0004-configure.ac-fix-static-linking-with-magic.patch
> +++ b/package/sox/0004-configure.ac-fix-static-linking-with-magic.patch
> @@ -1,4 +1,4 @@
> -From 4630e574e6c0269b94fd910e7c72b8ad1ee62ce7 Mon Sep 17 00:00:00 2001
> +From 76b78cb89cf8fc36b4ced568f3b34f778df53411 Mon Sep 17 00:00:00 2001
>  From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  Date: Wed, 3 Mar 2021 16:48:57 +0100
>  Subject: [PATCH] configure.ac: fix static linking with magic
> @@ -24,6 +24,8 @@ compress.c:(.text+0x1d0): undefined reference to `inflateInit_'
>  Fixes:
>   - http://autobuild.buildroot.org/results/d96f27cd96926060046e2e1115777f5bceda3741
>  
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +[Julien: rebased patch on package git version 7524160]
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  [Upstream status: not sent yet (waiting for feedback on third patch)]
>  ---
> @@ -31,10 +33,10 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/configure.ac b/configure.ac
> -index 896714f5..8ae3202c 100644
> +index 8f47a978..20454ed5 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -80,7 +80,7 @@ SOX_REPORT([other], [LADSPA effect plugins], [$HAVE_LADSPA])
> +@@ -85,7 +85,7 @@ SOX_REPORT([other], [LADSPA effect plugins], [$HAVE_LADSPA])
>   
>   dnl Various libraries
>   
> @@ -44,5 +46,5 @@ index 896714f5..8ae3202c 100644
>   SOX_WITH_LIB([png], [png.h], [png], [png_set_rows], [], [], [], [$ZLIB_LIBS])
>   SOX_WITH_LIB([id3tag], [id3tag.h], [id3tag], [id3_file_open], [], [], [], [$ZLIB_LIBS])
>  -- 
> -2.30.1
> +2.45.2
>  
> diff --git a/package/sox/0005-configure.ac-fix-static-linking-with-sndfile.patch b/package/sox/0005-configure.ac-fix-static-linking-with-sndfile.patch
> index 22334593317..46e5ca0ea13 100644
> --- a/package/sox/0005-configure.ac-fix-static-linking-with-sndfile.patch
> +++ b/package/sox/0005-configure.ac-fix-static-linking-with-sndfile.patch
> @@ -1,4 +1,4 @@
> -From 06109c84ab6930265287049c4bf9405e7ebc4986 Mon Sep 17 00:00:00 2001
> +From 7a2e270989037663e740487a8248db1227697c92 Mon Sep 17 00:00:00 2001
>  From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  Date: Wed, 4 Aug 2021 10:27:16 +0200
>  Subject: [PATCH] configure.ac: fix static linking with sndfile
> @@ -20,6 +20,8 @@ flac.c:(.text+0xfc): undefined reference to `FLAC__StreamDecoderErrorStatusStrin
>  Fixes:
>   - http://autobuild.buildroot.org/results/4bc58ed68b29642876bb02710d0cd4f31540de86
>  
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +[Julien: rebased patch on package git version 7524160]
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  [Upstream status: not sent yet (waiting for feedback on third patch)]
>  ---
> @@ -27,10 +29,10 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/configure.ac b/configure.ac
> -index 8ae3202c..26510769 100644
> +index 20454ed5..4330360b 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -117,7 +117,7 @@ SOX_FMT_REQ([mp3], [MAD LAME TWOLAME])
> +@@ -122,7 +122,7 @@ SOX_FMT_REQ([mp3], [MAD LAME TWOLAME])
>   SOX_FMT_PKG([oggvorbis], [ogg vorbis vorbisenc vorbisfile])
>   SOX_FMT_PKG([opus], [opusfile])
>   
> @@ -40,5 +42,5 @@ index 8ae3202c..26510769 100644
>   
>   SOX_FMT_LIB([wavpack], [wavpack/wavpack.h], [wavpack], [WavpackGetSampleRate])
>  -- 
> -2.30.2
> +2.45.2
>  
> -- 
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
