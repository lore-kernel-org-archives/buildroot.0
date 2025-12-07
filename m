Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14E7D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB13560B00;
	Sun,  7 Dec 2025 14:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDktkLFhXBW3; Sun,  7 Dec 2025 14:46:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0D7460B30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118810;
	bh=Qjz0TIe02FLwgNR/LELa9bc6MFoSR3R0RCoRYCrqbdo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Pfj2OS7yLknjCFLyikjTnnG6MQIiykRhef0HzcTIX5gybdkEO71xjZbpdl1k7Z6h/
	 n1693f11+FK3GFkBAGI0Jrg4ZylF9AKP8JP9bruggI1TpOYTYaHPIdbYO+SWTIS0Kn
	 fNc4h4Ixo4h3sFtE+9OIgtbAqemsJt4IjOHjxhoBuASWo0UAoSlJuCbOOwJCPHwoSS
	 MmI+lvCfrH7fbB/6BxGc5d3uCEvt3oC8/+Oz3STb4CuubE63knhoWKz0fElMhnUOj5
	 I3O76EmoPmghl9jDrymXozgwYHjTYfho8dPkF1bMpQ6ZsQFOADgqGY5w3nvVTrQQn5
	 MugSUPRLYXRPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0D7460B30;
	Sun,  7 Dec 2025 14:46:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B94552CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0447403B9
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PplNFFyzEHqa for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:46:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74AA040166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74AA040166
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74AA040166
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:46:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 048C8A4C0B8B;
 Sun,  7 Dec 2025 15:42:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyH-00000000416-2f8t;
 Sun, 07 Dec 2025 14:42:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:30 +0100
Message-ID: <20251207144243.3696572-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118578;
 bh=KUNga/aRzH8fHiqd0oxb41Q4IsiRidDA99wp/qG3S88=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=g0pyTX6//nyMBoII4GYkz6c62zisLIWzZ3CTPfADJ02ppEnSKl1f/SfgvhTc7/SkD
 W6jSbwXJ5tcWubrZKbCwznMoNZUoiUoHCKPaQedb2iojoT/fzUQsqqiMpyf6IL+kk3
 1qzX4iKk97a6JLF/zJcWwpkJgCodrhp7Mkc7sXIv2AYVKY/BRPCOx8OyODTrGHMQhl
 DhMHxTS9+DFFr8n3H1Bn9t0kTRXwS8fktuAixzVjdCGleGYNGLT3PveuYQWJMEks4C
 icRw6SSDiRhAStDYy5DwPwIY42ZH/T08bqOG7X2uungfw0IiboHE3kCLTwu5crSw3Z
 mKhijgpZILW/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=g0pyTX6/
Subject: [Buildroot] [PATCH/next 21/33] package/vlc: bump to version 3.0.22
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://code.videolan.org/videolan/vlc/-/blob/3.0.22/NEWS

Rebased patch 0005.

Removed patch 0011 which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...Don-t-assume-strerror_l-is-available.patch |  8 ++--
 ...5-fix-build-with-versions-2024.11.28.patch | 47 -------------------
 package/vlc/vlc.hash                          |  8 ++--
 package/vlc/vlc.mk                            |  2 +-
 4 files changed, 9 insertions(+), 56 deletions(-)
 delete mode 100644 package/vlc/0011-live555-fix-build-with-versions-2024.11.28.patch

diff --git a/package/vlc/0005-Don-t-assume-strerror_l-is-available.patch b/package/vlc/0005-Don-t-assume-strerror_l-is-available.patch
index cd839b7379..e860f56ac4 100644
--- a/package/vlc/0005-Don-t-assume-strerror_l-is-available.patch
+++ b/package/vlc/0005-Don-t-assume-strerror_l-is-available.patch
@@ -11,8 +11,8 @@ Fix compile error
 Code for #else condition was taken from
 http://patches.osdyson.org/patch/series/view/vlc/2.2.0~rc2-1+dyson2/dyson.patch
 
-[Bernd: rebased for vlc-3.0.6 & 3.0.9.2]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for 3.0.22]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac      | 2 +-
  src/posix/error.c | 4 ++++
@@ -22,13 +22,13 @@ diff --git a/configure.ac b/configure.ac
 index dfb4c1c329..bfe43512a2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -590,7 +590,7 @@ dnl Check for system libs needed
+@@ -667,7 +667,7 @@
  need_libc=false
  
  dnl Check for usual libc functions
 -AC_CHECK_FUNCS([accept4 daemon fcntl flock fstatvfs fork getenv getmntent_r getpwuid_r isatty lstat memalign mkostemp mmap newlocale open_memstream openat pipe2 pread posix_fadvise posix_madvise posix_memalign setlocale stricmp strnicmp strptime uselocale])
 +AC_CHECK_FUNCS([accept4 daemon fcntl flock fstatvfs fork getenv getmntent_r getpwuid_r isatty lstat memalign mkostemp mmap newlocale open_memstream openat pipe2 pread posix_fadvise posix_madvise posix_memalign setlocale strerror_l stricmp strnicmp strptime uselocale])
- AC_REPLACE_FUNCS([aligned_alloc atof atoll dirfd fdopendir ffsll flockfile fsync getdelim getpid lfind lldiv memrchr nrand48 poll recvmsg rewind sendmsg setenv strcasecmp strcasestr strdup strlcpy strndup strnlen strnstr strsep strtof strtok_r strtoll swab tdestroy tfind timegm timespec_get strverscmp pathconf])
+ AC_REPLACE_FUNCS([aligned_alloc atof atoll dirfd fdopendir flockfile fsync getdelim getpid lfind lldiv memrchr nrand48 poll recvmsg rewind sendmsg setenv strcasecmp strcasestr strdup strlcpy strndup strnlen strnstr strsep strtof strtok_r strtoll swab tdestroy tfind timegm timespec_get strverscmp pathconf])
  AC_REPLACE_FUNCS([gettimeofday])
  AC_CHECK_FUNC(fdatasync,,
 diff --git a/src/posix/error.c b/src/posix/error.c
diff --git a/package/vlc/0011-live555-fix-build-with-versions-2024.11.28.patch b/package/vlc/0011-live555-fix-build-with-versions-2024.11.28.patch
deleted file mode 100644
index 9708f680c9..0000000000
--- a/package/vlc/0011-live555-fix-build-with-versions-2024.11.28.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 8befcbfa834b809602db24c9ba7456d8cfc25cdb Mon Sep 17 00:00:00 2001
-From: Florian Albrechtskirchinger <falbrechtskirchinger@gmail.com>
-Date: Sun, 2 Mar 2025 08:30:43 +0100
-Subject: [PATCH] live555: fix build with versions >= 2024.11.28
-
-In the 2024.11.28 release (version 1732752000), live555 introduced
-`EventLoopWatchVariable` as a typedef for `std::atomic<char>`, replacing
-direct use of `char` in earlier versions. Add a conditional typedef to
-define it as `char` for older versions, and update `event_rtsp` and
-`event_data` to use `EventLoopWatchVariable`.
-
-Upstream: https://code.videolan.org/videolan/vlc/-/commit/8befcbfa834b809602db24c9ba7456d8cfc25cdb
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- modules/access/live555.cpp | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/modules/access/live555.cpp b/modules/access/live555.cpp
-index 461766661e49..cacea3c46952 100644
---- a/modules/access/live555.cpp
-+++ b/modules/access/live555.cpp
-@@ -194,6 +194,10 @@ class RTSPClientVlc;
- #define CAP_SUBSESSION_PAUSE    (1 << 3)
- #define CAPS_DEFAULT            CAP_RATE_CONTROL
- 
-+#if LIVEMEDIA_LIBRARY_VERSION_INT < 1732752000 // 2024.11.28
-+typedef char EventLoopWatchVariable;
-+#endif
-+
- struct demux_sys_t
- {
-     char            *p_sdp;    /* XXX mallocated */
-@@ -232,8 +236,8 @@ struct demux_sys_t
-     bool             b_no_data;     /* if we never received any data */
-     int              i_no_data_ti;  /* consecutive number of TaskInterrupt */
- 
--    char             event_rtsp;
--    char             event_data;
-+    EventLoopWatchVariable event_rtsp;
-+    EventLoopWatchVariable event_data;
- 
-     bool             b_get_param;   /* Does the server support GET_PARAMETER */
-     bool             b_paused;      /* Are we paused? */
--- 
-GitLab
-
diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index b3d9a083b9..6733a870b1 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,7 +1,7 @@
-# From https://get.videolan.org/vlc/3.0.21/vlc-3.0.21.tar.xz.sha256
-sha256  24dbbe1d7dfaeea0994d5def0bbde200177347136dbfe573f5b6a4cee25afbb0  vlc-3.0.21.tar.xz
-# From https://get.videolan.org/vlc/3.0.21/vlc-3.0.21.tar.xz.sha1
-sha1  be8557fc2f4be58caebe4a8b1d70f03dc6b95792  vlc-3.0.21.tar.xz
+# From https://get.videolan.org/vlc/3.0.22/vlc-3.0.22.tar.xz.sha256
+sha256  e2cc1cf0ae0902a09da5a37c249a8a4e4b5ec4dc095443b8e1493c6a7cc138ea  vlc-3.0.22.tar.xz
+# From https://get.videolan.org/vlc/3.0.22/vlc-3.0.22.tar.xz.sha1
+sha1  f9871439cdb281e18a78828c389cf7bf66d47d69  vlc-3.0.22.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index a597616470..81783c99ed 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.21
+VLC_VERSION = 3.0.22
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
