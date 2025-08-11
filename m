Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D15ACA0EC4
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 20:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F8C141720;
	Mon, 11 Aug 2025 20:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5Q9iSkktVq7; Mon, 11 Aug 2025 20:32:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F328D4177C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F328D4177C;
	Mon, 11 Aug 2025 20:32:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F391D98
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 20:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C67C615C8
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 20:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_qbuClJGDpq for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 20:32:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E1AA5615C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1AA5615C6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1AA5615C6
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 20:32:12 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-459ddf8acf1so40593895e9.0
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 13:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754944331; x=1755549131;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+RLjcFDcP9ps81pC5rfNYoiMfhZHOzEPAEtvDuKDgWU=;
 b=YByPTSGkHKALwbkgPqA6uZjMZI2x5Q0/pbuRY4wwuNzurFOfsHdo3ULW2oTA12WYA3
 G0nWnhyIEPAhnY5waOJS6woXHaNfWWzvhm/6ADBkbJ0N7plaIsuO07IERrPc+nLNrPJE
 T3pjIROLbUZJ5vUekBej3SeM5S8D+Pxl14bCeXZR0g9HttNd4XnjJ1litLlt0o81OKZ1
 1krbG4tJ62PAzIM7lYqoEdoiI8Zxw7EPVfJ+epw5UOUFqI69ex3o/tqVhw+o7BNYsasy
 aUIJLBMrn3IbYk6aFuq+UbzwjuxLI2fg5fDk4zwRivNIAsaxbil9kU+gLHgLakWw/dRV
 C77w==
X-Gm-Message-State: AOJu0YxVyJHCPUGE7RoiD3Gq2MqWon9EjZEfUs7AS1tDaPiwVkNKh2f5
 OlZq4HjFDWBn3uxeNDups9Rj/q6I46ba9KrRzph3DhrbrNduDUHkzIz50E6vumDpw7b5mheEDFS
 LeEAc
X-Gm-Gg: ASbGnctk5BYeqSp+KjUYadQieirdibRZb/ZTnkQgLnepi5PYA1kjkb1CYJ+L6M+zPik
 D4S141ElGLE6FL6SC8A4oHUOH2HBW5aG2LKJy58ZF/GrpQm2aIDfoqaz7h8rux4m/rclZnTSAEu
 Wj4nKmDrYKzywjahQ0MO9me+KmR/O4XzVEqyiZLtAYpob1SkS5OoBvd2DHYDIrMEUD9e27TWGEP
 waFuQ7gBHCvn5XRgO2Z+UP4XHy1KCvgvSm1PecnI48YTdJvynMC/eTVQ0qYQ1Az87E/f5F0kwZ/
 13YPVJPKbtOiB4D+UYsWs0JXGYjNhKiE+ASXW2k4xcut778x0V0R8IUk1ZRL17NkXDrHZE/WmyE
 VFN3RSDIL2MWzXRlBf6QMKW7yUq4rXnjbFcwbne3sd4XIYMt2QzIwvNUhkClosXvj9xEs2+hb5l
 jNd/nrSU5IhIlzCPNYTs1OxIQI1O5PQJM=
X-Google-Smtp-Source: AGHT+IGOLIiB97KXa8DPtu+d7I2fCA+vf/Zq2HSWEAVJphjrs+WpFJusPORNh6f+7TB42MmU7F4qnQ==
X-Received: by 2002:a05:600c:1c1f:b0:458:bb0e:8cda with SMTP id
 5b1f17b1804b1-45a10be7d65mr10781485e9.17.1754944330622; 
 Mon, 11 Aug 2025 13:32:10 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abed3sm41624078f8f.10.2025.08.11.13.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 13:32:10 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Mon, 11 Aug 2025 22:32:05 +0200
Message-ID: <20250811203206.1506378-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754944331; x=1755549131; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+RLjcFDcP9ps81pC5rfNYoiMfhZHOzEPAEtvDuKDgWU=;
 b=oe+TQp8Lyp7PAo1XpnVheB7yNEVmfM0DO8cfe4Z2Jg8qSGlbbpyMBgODIh5x0HdJNZ
 xJJxA1XDg2iVVPHEEDGkITNShFPGf0EBJTR99im+tx4FgtJ+A0lIsz3Ho6lk8Mph2ThW
 XlVJPTihGQ+agC7YC8DJP5GrQ2ej93lma1NcY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=oe+TQp8L
Subject: [Buildroot] [PATCH 1/2] package/thttpd: port to C99
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Apply changes from Fedora [1] to fix gcc-15 issues.

Despite the last thttpd release 2.29 back in 2018, the package
doesn't build with modern compiler and Autoconf (newer than 2.13).

Fixes:
https://autobuild.buildroot.org/results/f65/f6564b144366a936e94555875141dfe0cca5d11b
https://gitlab.com/buildroot.org/buildroot/-/jobs/10972859338
https://gitlab.com/buildroot.org/buildroot/-/jobs/10972858979

[1] https://src.fedoraproject.org/rpms/thttpd/c/608a10e7758eb87556af5206abeedca1d3cd500f

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
thttpd package is used by TestWget and TestLibCurl, so we can't remove it
right now.
---
 .../0001-configure.in-Port-to-C99.patch       | 118 ++++++++++++++++++
 ...0002-libhttpd.c-thttpd.c-Port-to-C99.patch |  53 ++++++++
 2 files changed, 171 insertions(+)
 create mode 100644 package/thttpd/0001-configure.in-Port-to-C99.patch
 create mode 100644 package/thttpd/0002-libhttpd.c-thttpd.c-Port-to-C99.patch

diff --git a/package/thttpd/0001-configure.in-Port-to-C99.patch b/package/thttpd/0001-configure.in-Port-to-C99.patch
new file mode 100644
index 0000000000..34c11317f7
--- /dev/null
+++ b/package/thttpd/0001-configure.in-Port-to-C99.patch
@@ -0,0 +1,118 @@
+From 54f84c421b264d0d1bb6bfb9c7a4d903a787d190 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Mon, 11 Aug 2025 21:17:45 +0200
+Subject: [PATCH] configure.in: Port to C99
+
+configure.in is broken beyond repair since it still uses AC_LANG that
+was supported up-to Autoconf-2.13 [1].
+
+  AC_LANG, CPLUSPLUS
+
+[1] https://lists.gnu.org/archive/html/autoconf/2000-11/msg00101.html
+
+From:
+https://src.fedoraproject.org/rpms/thttpd/c/608a10e7758eb87556af5206abeedca1d3cd500f
+
+Upstream: n/a
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ configure    | 21 ++++++++-------------
+ configure.in |  4 ++--
+ 2 files changed, 10 insertions(+), 15 deletions(-)
+
+diff --git a/configure b/configure
+index bb2d78f..85c59cf 100755
+--- a/configure
++++ b/configure
+@@ -761,7 +761,7 @@ cat > conftest.$ac_ext << EOF
+ #line 762 "configure"
+ #include "confdefs.h"
+ 
+-main(){return(0);}
++int main(){return(0);}
+ EOF
+ if { (eval echo configure:767: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   ac_cv_prog_cc_works=yes
+@@ -880,7 +880,7 @@ if eval "test \"`echo '$''{'ac_cv_lbl_static_flag'+set}'`\" = set"; then
+   echo $ac_n "(cached) $ac_c" 1>&6
+ else
+   ac_cv_lbl_static_flag=unknown
+-    echo 'main() {}' > conftest.c
++    echo 'int main() {}' > conftest.c
+     if test "$GCC" != yes ; then
+ 	    trial_flag="-Bstatic"
+ 	    test=`$CC $trial_flag -o conftest conftest.c 2>&1`
+@@ -913,6 +913,7 @@ else
+   cat > conftest.$ac_ext <<EOF
+ #line 915 "configure"
+ #include "confdefs.h"
++#include <stdio.h>
+ 
+ int main() {
+ extern char *__progname; 
+@@ -2046,13 +2047,14 @@ else
+ #include <sys/types.h>
+ #include <fcntl.h>
+ #include <sys/mman.h>
++#include <stdlib.h>
++
++#ifdef HAVE_UNISTD_H
++# include <unistd.h>
++#endif
+ 
+ /* This mess was copied from the GNU getpagesize.h.  */
+ #ifndef HAVE_GETPAGESIZE
+-# ifdef HAVE_UNISTD_H
+-#  include <unistd.h>
+-# endif
+-
+ /* Assume that all systems that can run configure have sys/param.h.  */
+ # ifndef HAVE_SYS_PARAM_H
+ #  define HAVE_SYS_PARAM_H 1
+@@ -2088,12 +2090,6 @@ else
+ 
+ #endif /* no HAVE_GETPAGESIZE */
+ 
+-#ifdef __cplusplus
+-extern "C" { void *malloc(unsigned); }
+-#else
+-char *malloc();
+-#endif
+-
+ int
+ main()
+ {
+@@ -2111,7 +2107,6 @@ main()
+ 		exit(1);
+ 	for (i = 0; i < pagesize; ++i)
+ 		*(data + i) = rand();
+-	umask(0);
+ 	fd = creat("conftestmmap", 0600);
+ 	if (fd < 0)
+ 		exit(1);
+diff --git a/configure.in b/configure.in
+index 1209ddc..a15398d 100644
+--- a/configure.in
++++ b/configure.in
+@@ -27,7 +27,7 @@ dnl
+ AC_MSG_CHECKING(how to link static binaries)
+ AC_CACHE_VAL(ac_cv_lbl_static_flag,
+     ac_cv_lbl_static_flag=unknown
+-    echo 'main() {}' > conftest.c
++    echo 'int main() {}' > conftest.c
+     if test "$GCC" != yes ; then
+ 	    trial_flag="-Bstatic"
+ 	    test=`$CC $trial_flag -o conftest conftest.c 2>&1`
+@@ -52,7 +52,7 @@ fi
+ 
+ AC_MSG_CHECKING(for __progname)
+ AC_CACHE_VAL(ac_cv_extern__progname,
+-    AC_TRY_LINK([],
++    AC_TRY_LINK([#include <stdio.h>],
+ 	[extern char *__progname; 
+ 	puts(__progname)],
+ 	ac_cv_extern__progname=yes,
+-- 
+2.50.1
+
diff --git a/package/thttpd/0002-libhttpd.c-thttpd.c-Port-to-C99.patch b/package/thttpd/0002-libhttpd.c-thttpd.c-Port-to-C99.patch
new file mode 100644
index 0000000000..6af7b2ad8f
--- /dev/null
+++ b/package/thttpd/0002-libhttpd.c-thttpd.c-Port-to-C99.patch
@@ -0,0 +1,53 @@
+From 73edec5197d2beabaa383a50dd0d0f6fce0342e7 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Mon, 11 Aug 2025 21:43:17 +0200
+Subject: [PATCH] libhttpd.c, thttpd.c: Port to C99
+
+From:
+https://src.fedoraproject.org/rpms/thttpd/c/608a10e7758eb87556af5206abeedca1d3cd500f
+
+Upstream: n/a
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ libhttpd.c | 5 +++++
+ thttpd.c   | 5 +++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/libhttpd.c b/libhttpd.c
+index c6b1622..ca2b7af 100644
+--- a/libhttpd.c
++++ b/libhttpd.c
+@@ -47,7 +47,12 @@
+ #include <memory.h>
+ #endif /* HAVE_MEMORY_H */
+ #include <pwd.h>
++
+ #include <signal.h>
++/* Not available with glibc default feature test macros.  Kludge to
++   avoid extensive changes.  */
++extern __typeof (signal) sigset;
++
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/thttpd.c b/thttpd.c
+index 3be7546..c13541c 100644
+--- a/thttpd.c
++++ b/thttpd.c
+@@ -44,7 +44,12 @@
+ #ifdef HAVE_GRP_H
+ #include <grp.h>
+ #endif
++
+ #include <signal.h>
++/* Not available with glibc default feature test macros.  Kludge to
++   avoid extensive changes.  */
++extern __typeof (signal) sigset;
++
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-- 
+2.50.1
+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
