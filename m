Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCD7C25B74
	for <buildroot@archiver.kernel.org>; Sat, 18 May 2024 09:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95EAE60875;
	Sat, 18 May 2024 09:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUa6co3m_9qm; Sat, 18 May 2024 09:17:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C96D6086A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C96D6086A;
	Sat, 18 May 2024 09:17:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AADFA1BF842
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 09:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A27FD82165
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 09:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oieITFvlVD3V for <buildroot@lists.busybox.net>;
 Sat, 18 May 2024 09:17:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C7D482159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C7D482159
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C7D482159
 for <buildroot@buildroot.org>; Sat, 18 May 2024 09:17:15 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4202ca70318so7953175e9.1
 for <buildroot@buildroot.org>; Sat, 18 May 2024 02:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716023833; x=1716628633;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bi/RuMofu4s0bZegErE0sgxGFeRHuxwpl0ifLyyLpRw=;
 b=Of8TSENq035bk/gW/VpCiaEqcXiViIWyIP086/1j0j0OdGK4ZWpNP0FHzdjeSOTcYk
 no34lllr4Xo3sfw5Gy963UhWH46kZDTYrHplFouiyVaxg1Qw6YQxeXewKXMDgJ2Yhqiw
 mfgk+YQhfwlJYmUf/KgG5ip4N5Ca4N9amXm30aOhDRozmY8XPmpjK0Wo3EhymH7D1UlB
 JU71XamCYjEtxCtK/mIGPvU4QbTjD8LiAm6D+ZCG16xGNlMlkFqZgmGSeDLx/m25TjNp
 g5gyA9J37IbpK4aMqbDT29BlIKR0dGcrtpQ5DAQCJngs1egFAP+lwO2yO4BeJr8sCsKH
 Fdiw==
X-Gm-Message-State: AOJu0YxPQFhMQKiKYDsLAEhMMEDwmkwerCzZ4TZugqRrwX+hHgZpVHNS
 yvHDyRRGqt2ai5zHwbKtA2xnUt9UAL9pjA4zyAebGlG6VO6N+CWUD4Ty9A==
X-Google-Smtp-Source: AGHT+IFnvf3C4XvO7YDroDoAdRAUOBMc8oRei1g1ory5CnqyRU9qzjwY5zliMqr3/G2P7A+OUX8AVQ==
X-Received: by 2002:a05:600c:5101:b0:41f:e87b:45c2 with SMTP id
 5b1f17b1804b1-41fea5385f5mr203533205e9.0.1716023832542; 
 Sat, 18 May 2024 02:17:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4200e518984sm270536335e9.23.2024.05.18.02.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 02:17:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 18 May 2024 11:17:07 +0200
Message-ID: <20240518091707.267692-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716023833; x=1716628633; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bi/RuMofu4s0bZegErE0sgxGFeRHuxwpl0ifLyyLpRw=;
 b=BfifP6qHrYZBM65crPxJApqgD5JWAkVpIA4LIKYwEO1lLQouBmtYeetPwdSbqPzLCM
 cz/qPC6CAwgicM7FMtMHfT8TWd+sbse4M0mAg1gdfOUSSTSLXfc0ssSctZiIaCrhU8Jm
 4/B2OGpbtyVG7OsXgqruu+mevtx8d1fmt0nGatF4Gcni5jPsj/m5h04yO4PoUQq2FQOb
 S0SiX+i1u35jsCmBmyChHOqXvRj0S9/2k9/EUfCQtZjZd/ESC+UjXK8BXlcQShhY3EE6
 GOqZfe5hCQxTo/UEnzpAZ0wBjk9GuMUkOS43+3Gua/vl6Ej1//h+1XH1tx1/8aonOVEZ
 X+pg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BfifP6qH
Subject: [Buildroot] [PATCH 1/1] package/gpm: fix musl build with gcc 14
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Boibessot <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following musl build failure with gcc 14:

daemon/old_main.c: In function 'old_main':
daemon/old_main.c:56:11: error: implicit declaration of function 'strcmp' [-Wimplicit-function-declaration]
   56 |       if(!strcmp((which_mouse->opt_dev),"-")) fd=0; /* use stdin */
      |           ^~~~~~
daemon/old_main.c:35:1: note: include '<string.h>' or provide a declaration of 'strcmp'
   34 | #include "headers/gpmInt.h"         /* daemon internals */
  +++ |+#include <string.h>
   35 |

While at it, add Upstream tags to other patches

Fixes:
 - http://autobuild.buildroot.org/results/3192740863d57e72e90e622683e7b9fcc057fa8b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  6 -----
 ...usl-support-to-libgpm-and-the-daemon.patch |  4 +--
 .../0002-Install-unversioned-solibrary.patch  |  4 +--
 ...Really-install-unversioned-solibrary.patch |  3 +--
 ...mptyset-API-instead-of-__sigemptyset.patch |  1 +
 .../gpm/0005-fix-building-w-newer-glibc.patch |  1 +
 ...on.h-avoid-redefinition-of-last_sele.patch |  1 +
 package/gpm/0007-Add-include-string-h.patch   | 27 +++++++++++++++++++
 8 files changed, 33 insertions(+), 14 deletions(-)
 create mode 100644 package/gpm/0007-Add-include-string-h.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 070b97116a..ab792709b2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -748,12 +748,6 @@ package/gob2/0001-dont-include-from-prefix.patch lib_patch.Upstream
 package/gobject-introspection/0001-disable-tests.patch lib_patch.Upstream
 package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch lib_patch.Upstream
 package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch lib_patch.Upstream
-package/gpm/0001-Added-musl-support-to-libgpm-and-the-daemon.patch lib_patch.Upstream
-package/gpm/0002-Install-unversioned-solibrary.patch lib_patch.Upstream
-package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch lib_patch.Upstream
-package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch lib_patch.Upstream
-package/gpm/0005-fix-building-w-newer-glibc.patch lib_patch.Upstream
-package/gpm/0006-src-headers-daemon.h-avoid-redefinition-of-last_sele.patch lib_patch.Upstream
 package/gpsd/S50gpsd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch lib_patch.Upstream
 package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch lib_patch.Upstream
diff --git a/package/gpm/0001-Added-musl-support-to-libgpm-and-the-daemon.patch b/package/gpm/0001-Added-musl-support-to-libgpm-and-the-daemon.patch
index 1e1e919416..1e143e5031 100644
--- a/package/gpm/0001-Added-musl-support-to-libgpm-and-the-daemon.patch
+++ b/package/gpm/0001-Added-musl-support-to-libgpm-and-the-daemon.patch
@@ -3,9 +3,7 @@ From: Dima Krasner <dima@dimakrasner.com>
 Date: Wed, 12 Nov 2014 23:06:46 +0200
 Subject: [PATCH] Added musl support to libgpm and the daemon.
 
-[Upstream patch backported from the github repository,
-https://github.com/telmich/gpm/commit/d88fb1de5803c366ab62f7de9ee5d83207fb2afe.]
-
+Upstream: https://github.com/telmich/gpm/commit/d88fb1de5803c366ab62f7de9ee5d83207fb2afe
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  src/daemon/open_console.c  | 1 +
diff --git a/package/gpm/0002-Install-unversioned-solibrary.patch b/package/gpm/0002-Install-unversioned-solibrary.patch
index 27e97acb32..5f184daba2 100644
--- a/package/gpm/0002-Install-unversioned-solibrary.patch
+++ b/package/gpm/0002-Install-unversioned-solibrary.patch
@@ -6,9 +6,7 @@ Subject: [PATCH] Install unversioned solibrary
 Unversioned solibraries are shipped with -devel packages in Linux
 distros. Generate and install it for the consistency.
 
-[Upstream patch backported from the github repository,
-https://github.com/telmich/gpm/commit/06b00d53d8bd513ad5d262dc94a016c6fbf2d3aa]
-
+Upstream: https://github.com/telmich/gpm/commit/06b00d53d8bd513ad5d262dc94a016c6fbf2d3aa
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  src/Makefile.in | 7 +++----
diff --git a/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch b/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch
index 2591801976..857bb5c2ba 100644
--- a/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch
+++ b/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch
@@ -7,8 +7,7 @@ This commit is a follow-up to
 https://github.com/telmich/gpm/commit/06b00d53d8bd513ad5d262dc94a016c6fbf2d3aa
 which created libgpm.so but failed to include it in the install target.
 
-Patch sent upstream: https://github.com/telmich/gpm/pull/11
-
+Upstream: https://github.com/telmich/gpm/pull/11
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  src/Makefile.in | 1 +
diff --git a/package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch b/package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch
index 01c7424a9d..5820d21f51 100644
--- a/package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch
+++ b/package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch
@@ -7,6 +7,7 @@ __sigemptyset has been removed from glibc public
 API headers in upcoming (2.26) release onwards
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream: https://github.com/telmich/gpm/commit/fdc42770596e25749f7e2ce0ea97882177397167
 Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 ---
  src/prog/gpm-root.y | 4 ----
diff --git a/package/gpm/0005-fix-building-w-newer-glibc.patch b/package/gpm/0005-fix-building-w-newer-glibc.patch
index b451d975e0..839f92f37b 100644
--- a/package/gpm/0005-fix-building-w-newer-glibc.patch
+++ b/package/gpm/0005-fix-building-w-newer-glibc.patch
@@ -7,6 +7,7 @@ Linux C libraries are looking to disentangle sysmacros.h from the
 sys/types.h include, so make sure we pull in the header when it is
 found.
 
+Upstream: https://github.com/telmich/gpm/commit/b350aee4ea5785a75cb6ad770f6b768c506ebb70
 Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 ---
  src/daemon/open_console.c | 4 ++++
diff --git a/package/gpm/0006-src-headers-daemon.h-avoid-redefinition-of-last_sele.patch b/package/gpm/0006-src-headers-daemon.h-avoid-redefinition-of-last_sele.patch
index 36a8ddc5bb..0c8428df2c 100644
--- a/package/gpm/0006-src-headers-daemon.h-avoid-redefinition-of-last_sele.patch
+++ b/package/gpm/0006-src-headers-daemon.h-avoid-redefinition-of-last_sele.patch
@@ -20,6 +20,7 @@ https://gcc.gnu.org/PR85678.
 The error also happens if CFLAGS=-fno-common passed explicitly.
 
 Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
+Upstream: https://github.com/telmich/gpm/commit/f04f24dd5ca5c1c13608b144ab66e2ccd47f106a
 Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
 ---
  src/headers/daemon.h | 2 +-
diff --git a/package/gpm/0007-Add-include-string-h.patch b/package/gpm/0007-Add-include-string-h.patch
new file mode 100644
index 0000000000..dd7e736e7b
--- /dev/null
+++ b/package/gpm/0007-Add-include-string-h.patch
@@ -0,0 +1,27 @@
+From 2085cab74a0a84df8b965addf007775a7225c9ec Mon Sep 17 00:00:00 2001
+From: Kurt Nalty <46026992+kurtnalty@users.noreply.github.com>
+Date: Sat, 29 Dec 2018 23:47:17 -0600
+Subject: [PATCH] Add include <string.h>
+
+Added
+ line 28, #include <string.h>                 /* strcpy, bzero     */
+for musl compilation
+
+Upstream: https://github.com/telmich/gpm/commit/2085cab74a0a84df8b965addf007775a7225c9ec
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/daemon/old_main.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/daemon/old_main.c b/src/daemon/old_main.c
+index 2581e26..ab7a87f 100644
+--- a/src/daemon/old_main.c
++++ b/src/daemon/old_main.c
+@@ -25,6 +25,7 @@
+ #include <signal.h>                 /* guess again       */
+ #include <errno.h>                  /* guess again       */
+ #include <unistd.h>                 /* unlink            */
++#include <string.h>                 /* strcpy, bzero     */
+ #include <sys/stat.h>               /* chmod             */
+
+ #include <linux/kd.h>               /* linux hd*         */
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
