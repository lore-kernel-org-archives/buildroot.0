Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E884C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A433F4014E;
	Sun, 12 Dec 2021 14:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H5yNBNou1Xae; Sun, 12 Dec 2021 14:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A21E40227;
	Sun, 12 Dec 2021 14:11:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 447681BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F6EF856E3
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:11:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bUaRWF2bCfyV for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:11:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 908BF856EB
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:11:14 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id l25so44645320eda.11
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=/3MkqZ1IRcppsW+PzQu3+tzJvjF8KhFwWLNwxcMy0Gg=;
 b=iV+phzGxilY53N+2mCbp7JUpsGp0OpVQdEejPmDNJq/T0HCt/9HI7fiqYiSjKcoohd
 OQkQfKeOQF6CPRK4N96DNoX0G5ligTXb5jiiLG3B3h9tUKT01lA2saqfqksN5TaTnbV4
 TK5/wpF7vbo53M2mn/oRtLibXAY0kFHQ5hD8hzHTXQP09BofBVa0eBAsg6XRQIr/hWCL
 GmBUbunUo+fj32i6yDK09gWu6oYM+gwu5QfZLpIuc8cpujPAp0MPlGf5VpwiNVBeTd5Y
 jjdeMRGJ70wX3HCyHHSJjcPdKa5W4AjmDeGeVLrzWFvfdFqL2CRe+gTb2ovmpJiym/l/
 hX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/3MkqZ1IRcppsW+PzQu3+tzJvjF8KhFwWLNwxcMy0Gg=;
 b=r5wVF7SpU8N1rDCehjWR9L8mGUCr28ziTBICBBzxr8ZM3uvPNESfmoiRwHYvGdHVKw
 a6mB4ws1aED2kRioz+07p+WsCYw8H2t3kjvWuXSh2qPAo+MBSaFx6+tikkN9QOzMRON3
 ciuaOKV1w+HNj7+jyPkl4oEeE7wK8z4GD4aY6DweN423z+f7Lkm3MIzyZ3X/BDUdhEW7
 R8BPIfxLFFQ9M1O4fUnyLVjZTPdgSHYVFTeiKHedaxuRBZ6yv7cdE8QirZy26vzWjLBz
 l4yc+9ApZz4xmWUWcFwLL7eGut8DgZhRkTtWQifDC6YtriVF+yfrMx1Up6RbaqXNjTYM
 BCfA==
X-Gm-Message-State: AOAM530XxoiF2RifIFufKH06X0r6TUZ82yw8WMkbFPaTx+JsPY6vvSK3
 fVV3cjmFHhuJ5r300PTM/joyzA==
X-Google-Smtp-Source: ABdhPJw0X6GIaPrbhTzl5g4w0M9aRGD96gWTYKbz7VizIQ7XKRWi4RdbLgJOmItl87KpwtrVATqKJw==
X-Received: by 2002:a17:906:2cd5:: with SMTP id
 r21mr38471835ejr.435.1639318272747; 
 Sun, 12 Dec 2021 06:11:12 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bm22sm4814514edb.48.2021.12.12.06.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:11:12 -0800 (PST)
Message-ID: <09a381e7-1ffd-944d-1eaa-779a7cbbce28@mind.be>
Date: Sun, 12 Dec 2021 15:11:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20211210115602.1332880-1-romain.naour@smile.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211210115602.1332880-1-romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH] package/poke: bump to version 1.4
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/12/2021 12:56, Romain Naour wrote:
> Remove upstream patches:
> 0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
> 0002-tentatively-change-cppflags-to-omit-I-prefix-on-cros.patch
> 
> See:
> http://www.jemarch.net/poke-1.4-relnotes.html
> 
> Tested:
> https://gitlab.com/kubu93/buildroot/-/pipelines/426866708
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> test-pkg config:
> BR2_PACKAGE_POKE=y
> ---
>   ...ck-for-Tcl-Tk-if-disable-gui-is-spec.patch | 43 ------------
>   ...2MAN-replace-by-true-when-cross-com.patch} |  6 +-
>   ...ndom.c-fix-build-with-uclibc-1.0.35.patch} |  0
>   ...ge-cppflags-to-omit-I-prefix-on-cros.patch | 67 -------------------
>   package/poke/poke.hash                        |  2 +-
>   package/poke/poke.mk                          |  5 +-
>   6 files changed, 6 insertions(+), 117 deletions(-)
>   delete mode 100644 package/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
>   rename package/poke/{0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch => 0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch} (88%)
>   rename package/poke/{0004-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch => 0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch} (100%)
>   delete mode 100644 package/poke/0002-tentatively-change-cppflags-to-omit-I-prefix-on-cros.patch
> 
> diff --git a/package/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch b/package/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
> deleted file mode 100644
> index 3bd041a0e7..0000000000
> --- a/package/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From cef3fc90f02ef4fc49515745194bac3d81a2265b Mon Sep 17 00:00:00 2001
> -From: "Jose E. Marchesi" <jose.marchesi@oracle.com>
> -Date: Fri, 30 Apr 2021 13:17:05 +0200
> -Subject: [PATCH] build: do not check for Tcl/Tk if --disable-gui is specified
> -
> -2021-04-30  Jose E. Marchesi  <jemarch@gnu.org>
> -
> -	* configure.ac: Do not check for tcl/tk if --disable-gui is
> -	specified at configure time.
> -
> -(cherry picked from commit 280a5e154287e43c0a40d9530a9cc658a7367a9c)
> -[Romain: remove Changelog entry]
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ----
> - configure.ac | 9 ++++++---
> - 1 file changed, 6 insertions(+), 3 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index c7205513..c2f0760a 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -214,12 +214,15 @@ fi
> - dnl The GUI is optional, and depends on the availability of Tcl and
> - dnl Tk.
> -
> --POKE_TCLTK
> --
> - AC_ARG_ENABLE([gui],
> -               AS_HELP_STRING([--enable-gui],
> -                              [Enable the GUI (default is YES)]),
> --              [gui_enabled=$enableval], [gui_enabled=$has_tcltk])
> -+              [gui_enabled=$enableval], [gui_enabled=yes])
> -+
> -+if test "x$gui_enabled" = "xyes"; then
> -+ POKE_TCLTK
> -+ gui_enabled=$has_tcltk
> -+fi
> -
> - AM_CONDITIONAL([GUI], [test "x$gui_enabled" = "xyes"])
> -
> ---
> -2.30.2
> -
> diff --git a/package/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch b/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
> similarity index 88%
> rename from package/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
> rename to package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
> index f217c917f1..c169516153 100644
> --- a/package/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
> +++ b/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
> @@ -1,4 +1,4 @@
> -From 8ba76a5a7ce311f67890199c5595bc1f626495ad Mon Sep 17 00:00:00 2001
> +From b35dadae6371c3727cac46ae5bd348b66aa411fc Mon Sep 17 00:00:00 2001
>   From: Romain Naour <romain.naour@gmail.com>
>   Date: Fri, 30 Apr 2021 15:43:59 +0200
>   Subject: [PATCH] configure.ac: HELP2MAN replace ':' by 'true' when
> @@ -17,7 +17,7 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
>    1 file changed, 1 insertion(+), 1 deletion(-)
>   
>   diff --git a/configure.ac b/configure.ac
> -index c2f0760a..93769ef9 100644
> +index 2c6f1aef..9c4c9be2 100644
>   --- a/configure.ac
>   +++ b/configure.ac
>   @@ -74,7 +74,7 @@ gl_LIBTEXTSTYLE_OPTIONAL([0.20.5])
> @@ -30,5 +30,5 @@ index c2f0760a..93769ef9 100644
>    
>    dnl recfix is part of the GNU recutils suite, and is used in cfg.mk to
>   --
> -2.30.2
> +2.31.1
>   
> diff --git a/package/poke/0004-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch b/package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
> similarity index 100%
> rename from package/poke/0004-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
> rename to package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
> diff --git a/package/poke/0002-tentatively-change-cppflags-to-omit-I-prefix-on-cros.patch b/package/poke/0002-tentatively-change-cppflags-to-omit-I-prefix-on-cros.patch
> deleted file mode 100644
> index 8fae85eb20..0000000000
> --- a/package/poke/0002-tentatively-change-cppflags-to-omit-I-prefix-on-cros.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -From ac9d057895f1e61f63cbecafcc3e3820fdb10f84 Mon Sep 17 00:00:00 2001
> -From: Luca Saiu <positron@gnu.org>
> -Date: Fri, 30 Apr 2021 22:42:57 +0200
> -Subject: [PATCH] tentatively change --cppflags to omit -I prefix on
> - cross-compilation
> -
> -The autoconf macros defined from jitter --cppflags get automatically changed, of
> -course.
> -
> -* configure.ac (JITTER_CROSS_COMPILING): New substitution.
> -
> -* bin/jitter-config.in.m4sh (main loop) <--cppflags>: Introduce conditional on
> -the new substitution.
> -
> -Suggested by Romain Naour, after his difficulties with building GNU poke with
> -buildroot.
> -
> -(cherry picked from commit 428406c7b8d4c20f3472d41ed57c12c1a88ad37e)
> -[Romain:
> -  patch jitter-config.in instead of jitter-config.in.m4sh since
> -  there is an issue while converting the M4sh m4sh script ( .in.m4sh )
> -  into a portable shell script ( .in ) ready to be processed by aclocal
> -  for @-substitutions.]
> -
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ----
> - jitter/bin/jitter-config.in | 10 +++++++---
> - jitter/configure.ac         |  1 +
> - 2 files changed, 8 insertions(+), 3 deletions(-)
> -
> -diff --git a/jitter/bin/jitter-config.in b/jitter/bin/jitter-config.in
> -index 5e124f0..4bc508d 100644
> ---- a/jitter/bin/jitter-config.in
> -+++ b/jitter/bin/jitter-config.in
> -@@ -999,10 +999,14 @@ while test "$#" != "0"; do
> -         --cppflags)
> -             no_option_argument
> -             append_to_output cppflags
> --            # Append a -I argument.  This is defined separately from the rest,
> --            # as the installation prefix can be decided very late, at Jitter
> -+            # Unless cross-compiling, append a -I argument referring the
> -+            # installation path.  This is defined separately from the rest, as
> -+            # the installation prefix can be decided very late, at Jitter
> -             # installation time.
> --            output="$output -I $includedir";;
> -+            # (When cross-compiling this would be difficult to do correctly.)
> -+            if test "x@JITTER_CROSS_COMPILING@" != 'xyes'; then
> -+              output="$output -I $includedir"
> -+            fi;;
> -         --ldadd)
> -             no_option_argument
> -             append_to_output ldadd;;
> -diff --git a/jitter/configure.ac b/jitter/configure.ac
> -index 21d6937..fb12349 100644
> ---- a/jitter/configure.ac
> -+++ b/jitter/configure.ac
> -@@ -308,6 +308,7 @@ else
> -    AC_MSG_RESULT([yes, cross-compiling from $build to $host .])
> -    jitter_cross_compiling=yes
> - fi
> -+AC_SUBST([JITTER_CROSS_COMPILING], [$jitter_cross_compiling])
> -
> - # I never test on weird systems not supporting shebangs.
> - AC_SYS_INTERPRETER
> ---
> -2.31.1
> -
> diff --git a/package/poke/poke.hash b/package/poke/poke.hash
> index b3a79d90dc..1367262f54 100644
> --- a/package/poke/poke.hash
> +++ b/package/poke/poke.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  f61cf8da5b64c01a1359373725aad1ca257f35c1c9269e4d50dd0664183ddf62  poke-1.2.tar.gz
> +sha256  ce054df29560c921230132703ee449fe130b6e25ab03aa6cc796bb401506aa24  poke-1.4.tar.gz
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  jitter/COPYING
> diff --git a/package/poke/poke.mk b/package/poke/poke.mk
> index 406acf15e0..fed023e954 100644
> --- a/package/poke/poke.mk
> +++ b/package/poke/poke.mk
> @@ -4,14 +4,13 @@
>   #
>   ################################################################################
>   
> -POKE_VERSION = 1.2
> +POKE_VERSION = 1.4
>   POKE_SITE = $(BR2_GNU_MIRROR)/poke
>   # gnulib license is a mix/mess of public-domain and various GPL and LGPL versions.
>   POKE_LICENSE = GPL-3.0+, GPL-3.0+ (jitter), gnulib license (gnulib)
>   POKE_LICENSE_FILES = COPYING jitter/COPYING
>   
> -# 0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
> -# 0003-configure.ac-HELP2MAN-replace-by-false-when-cross-co.patch
> +# 0001-configure.ac-HELP2MAN-replace-by-false-when-cross-co.patch
>   POKE_AUTORECONF = YES
>   
>   POKE_DEPENDENCIES = host-flex host-bison host-pkgconf bdwgc readline
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
