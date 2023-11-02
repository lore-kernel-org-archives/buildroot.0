Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B51C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 22:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D07341871;
	Thu,  2 Nov 2023 22:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D07341871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0uZhMldNLJkW; Thu,  2 Nov 2023 22:22:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96FB441879;
	Thu,  2 Nov 2023 22:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96FB441879
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D5B81BF30F
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 22:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23249850A8
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 22:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23249850A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iizg6RImwsGQ for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 22:22:23 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61F5084F7F
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 22:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61F5084F7F
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-32fb1c35fe0so335639f8f.1
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 15:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698963740; x=1699568540;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TTSo4phs5kMLvKx28dZI/Gg0UfJOpmdc8xipgsvob/w=;
 b=d5j9kCq16CYaqsNNtxyDD94uNybR25aLo8bXSD02uzEwjmQmufcjJ6LrbMzRy1a9Ub
 gScyeEh+fYvphp8vHbVTkShqBJo72VrP2QobSDXWbBX9Cklm/5zAJYOnAX2/6mUXounI
 JNMUPfVLZsLq6Dg5CYCI4sNxFjuiJ0o86i/AXTVFzi5xnbOkMIr6MBUb68cG+0LiPW3m
 8CQHUF2SJzCMMiXg+WdRkDUSOwEYi3xMsKs9LDGR56mg1f25/4KgrLeyrQ7ybV5FyYyY
 KIF/F5C1iZ0HGA0E5G29HG0NzOlheEgOZmkttX7zYbMIVInZJ1fnGWYd3lG8Gx9T4Lga
 Jhbg==
X-Gm-Message-State: AOJu0Ywmh6Q4tyZez1bOjnAa3jf53FKYNgJ43knHRaq5lgPrhkkUcja+
 xnT1U6uI/zpgfWalAXhOMmzdL2EaFZA=
X-Google-Smtp-Source: AGHT+IEvOPTUnCvnfW7jm0eIE2klxI0Jn7Fj4zaOg1C12AznpZM7VLAkGgFkid9YeeJ5Zr6m0iYXVw==
X-Received: by 2002:adf:ea11:0:b0:329:6d09:61ff with SMTP id
 q17-20020adfea11000000b003296d0961ffmr14562418wrm.62.1698963740245; 
 Thu, 02 Nov 2023 15:22:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l4-20020adfa384000000b0032d2489a399sm384367wrb.49.2023.11.02.15.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 15:22:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 23:22:17 +0100
Message-ID: <20231102222217.239293-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698963740; x=1699568540; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TTSo4phs5kMLvKx28dZI/Gg0UfJOpmdc8xipgsvob/w=;
 b=AGxjItcKLwBrvy7H1UQsTOGcAy7PBiq3tWIouXaic2YhUcdZl2Rj2SLlyAecjTwicN
 Z8b9Uc4wzc8pl6QqSvFmzSNYvHBov6M/1UK8BKA2KWw6thQMYZaWuQksinjCE/fjsTyS
 oO1XfzT50RskD5aff06awkMycM0K/ecmCxgEfTheK5ZlSL5qgIkeXzbyxJ0MLUiWAMk6
 ptF8ASFueg8AZCQrl0bDqxxqUktuv7mGjwVRx8I8Wvq9vu6aDiiXBk5uxt/x95/PyxTl
 4omOG80CbIthNzlqe0Kw0pS927gMjXkk0WKI1SpR057Mb+A0NlRFevr8reS0VUq5m+7n
 JysA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AGxjItcK
Subject: [Buildroot] [PATCH 1/1] package/iodine: bump to version 0.8.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Replace non upstreamable patch
- Use LICENSE file added with
  https://github.com/yarrick/iodine/commit/721b7f0d9bae2997328d53fb6fc351cf67eb5d9d

https://github.com/yarrick/iodine/blob/v0.8.0/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 .../0001-disable-systemd-and-selinux.patch    | 29 --------------
 ...-osflags-fully-fix-cross-compilation.patch | 40 +++++++++++++++++++
 package/iodine/iodine.hash                    |  5 ++-
 package/iodine/iodine.mk                      |  8 +++-
 5 files changed, 49 insertions(+), 34 deletions(-)
 delete mode 100644 package/iodine/0001-disable-systemd-and-selinux.patch
 create mode 100644 package/iodine/0001-src-osflags-fully-fix-cross-compilation.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index fc4161225d..f72c0514a2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -583,7 +583,6 @@ package/input-event-daemon/S99input-event-daemon ConsecutiveEmptyLines Indent Va
 package/intel-gmmlib/0001-Drop-hardening-related-flags.patch Upstream
 package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch Upstream
 package/intltool/0001-perl-5.26-compatibility.patch Upstream
-package/iodine/0001-disable-systemd-and-selinux.patch Upstream
 package/iotop/0001-Fix-build-error-with-Python-3.patch Upstream
 package/iozone/0001-Add-new-targets-for-iozone.patch Upstream
 package/iperf/0001-fix-single-threaded-compile-breakage.patch Upstream
diff --git a/package/iodine/0001-disable-systemd-and-selinux.patch b/package/iodine/0001-disable-systemd-and-selinux.patch
deleted file mode 100644
index 965abb7cff..0000000000
--- a/package/iodine/0001-disable-systemd-and-selinux.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Disable selinux and systemd support since they check for host headers.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura iodine-0.7.0.orig/src/osflags iodine-0.7.0/src/osflags
---- iodine-0.7.0.orig/src/osflags	2015-02-20 14:59:00.799958145 -0300
-+++ iodine-0.7.0/src/osflags	2015-02-20 15:05:54.791135141 -0300
-@@ -18,8 +18,8 @@
- 		;;
- 		Linux)
- 			FLAGS="";
--			[ -e /usr/include/selinux/selinux.h ] && FLAGS="$FLAGS -lselinux";
--			[ -e /usr/include/systemd/sd-daemon.h ] && FLAGS="$FLAGS -lsystemd-daemon";
-+			#[ -e /usr/include/selinux/selinux.h ] && FLAGS="$FLAGS -lselinux";
-+			#[ -e /usr/include/systemd/sd-daemon.h ] && FLAGS="$FLAGS -lsystemd-daemon";
- 			echo $FLAGS;
- 		;;
- 	esac
-@@ -34,8 +34,8 @@
- 		;;
- 		Linux)
- 			FLAGS="-D_GNU_SOURCE"
--			[ -e /usr/include/selinux/selinux.h ] && FLAGS="$FLAGS -DHAVE_SETCON";
--			[ -e /usr/include/systemd/sd-daemon.h ] && FLAGS="$FLAGS -DHAVE_SYSTEMD";
-+			#[ -e /usr/include/selinux/selinux.h ] && FLAGS="$FLAGS -DHAVE_SETCON";
-+			#[ -e /usr/include/systemd/sd-daemon.h ] && FLAGS="$FLAGS -DHAVE_SYSTEMD";
- 			echo $FLAGS;
- 		;;
- 	esac
diff --git a/package/iodine/0001-src-osflags-fully-fix-cross-compilation.patch b/package/iodine/0001-src-osflags-fully-fix-cross-compilation.patch
new file mode 100644
index 0000000000..c6dc321a6f
--- /dev/null
+++ b/package/iodine/0001-src-osflags-fully-fix-cross-compilation.patch
@@ -0,0 +1,40 @@
+From a5d71d076168f8ad1e7dd30b35f1569f180f429c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 2 Nov 2023 23:03:15 +0100
+Subject: [PATCH] src/osflags: fully fix cross-compilation
+
+Cross-compilation was only partially fixed by
+https://github.com/yarrick/iodine/commit/024481c94b97ef37981621cdc38f8b20f8919418
+as selinux was still enabled depending on host file existence
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/yarrick/iodine/pull/93
+---
+ src/osflags | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/osflags b/src/osflags
+index 9a437bd..39ca5fa 100755
+--- a/src/osflags
++++ b/src/osflags
+@@ -20,7 +20,7 @@ link)
+ 		;;
+ 		Linux)
+ 			FLAGS="";
+-			[ -e /usr/include/selinux/selinux.h ] && FLAGS="$FLAGS -lselinux";
++			"$PKG_CONFIG" --exists libselinux && FLAGS="$FLAGS $($PKG_CONFIG --libs libselinux)";
+ 			"$PKG_CONFIG" --exists libsystemd-daemon && FLAGS="$FLAGS $($PKG_CONFIG --libs libsystemd-daemon)";
+ 			"$PKG_CONFIG" --exists libsystemd && FLAGS="$FLAGS $($PKG_CONFIG --libs libsystemd)";
+ 			echo $FLAGS;
+@@ -40,7 +40,7 @@ cflags)
+ 		;;
+ 		Linux)
+ 			FLAGS="-D_GNU_SOURCE"
+-			[ -e /usr/include/selinux/selinux.h ] && FLAGS="$FLAGS -DHAVE_SETCON";
++			"$PKG_CONFIG" --exists libselinux && FLAGS="$FLAGS -DHAVE_SETCON";
+ 			"$PKG_CONFIG" --exists libsystemd-daemon && FLAGS="$FLAGS -DHAVE_SYSTEMD";
+ 			"$PKG_CONFIG" --exists libsystemd && FLAGS="$FLAGS -DHAVE_SYSTEMD";
+ 			echo $FLAGS;
+-- 
+2.42.0
+
diff --git a/package/iodine/iodine.hash b/package/iodine/iodine.hash
index 4ba7aa95b8..6f765a2462 100644
--- a/package/iodine/iodine.hash
+++ b/package/iodine/iodine.hash
@@ -1,4 +1,5 @@
 # From http://code.kryo.se/iodine/
-md5  fdbf3b81cd69caf5230d76a8b039fd99  iodine-0.7.0.tar.gz
+md5  6f2a53476cbc09bbffe7e07d6e9dd19d  iodine-0.8.0.tar.gz
 # Locally computed
-sha256  f41a252b2218759aa351270b7ad9791bdd323836b940e35c0614837a5d24dcb7  README
+sha256  546e92cf8617f7970ea81c850b1063eb189c68c406d0c6a67e02c55e72e714c6  iodine-0.8.0.tar.gz
+sha256  9541123931e4df4ec84612e056a92ecaab905fe201deaf932b895406565fbb85  LICENSE
diff --git a/package/iodine/iodine.mk b/package/iodine/iodine.mk
index 521ca3d927..499ed6512d 100644
--- a/package/iodine/iodine.mk
+++ b/package/iodine/iodine.mk
@@ -4,13 +4,17 @@
 #
 ################################################################################
 
-IODINE_VERSION = 0.7.0
+IODINE_VERSION = 0.8.0
 IODINE_SITE = http://code.kryo.se/iodine
 IODINE_DEPENDENCIES = zlib
 IODINE_LICENSE = MIT
-IODINE_LICENSE_FILES = README
+IODINE_LICENSE_FILES = LICENSE
 IODINE_CPE_ID_VENDOR = kryo
 IODINE_SELINUX_MODULES = iodine
+IODINE_DEPENDENCIES = \
+	host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBSELINUX),libselinux) \
+	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
 
 IODINE_CFLAGS = $(TARGET_CFLAGS)
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
