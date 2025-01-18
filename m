Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1C9C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 13:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3006584B81;
	Sat, 18 Jan 2025 13:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T6BOfKC1r4QF; Sat, 18 Jan 2025 13:20:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F011A84B83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F011A84B83;
	Sat, 18 Jan 2025 13:20:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13FEC69
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 13:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BFD6404EC
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 13:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtN6fvhyKyZ8 for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 13:19:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.43;
 helo=mail-wm1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E48A940131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E48A940131
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E48A940131
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 13:19:56 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso29629865e9.0
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 05:19:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737206394; x=1737811194;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8uE6l82/5vuTy4N//D70OpBhp+lEA4y9e+w6IHWDn64=;
 b=EVfV6sxA3yA0MXO8HBhNV3lyfFB+/ztQwC12onNqoYqpFo5D6Yrdinn3IKKLYzH7tW
 moiCrGPrmv5G6G1cT/s1kYM9f4FLu7ANcNoM14ExOJ1ClnmW1dl1LWkJpKo6kSx/JB7p
 gMGnAunV2If1NZn7M/h1Q6f5Fgq+bCp+J/5DR8N4vjCIq56hyo5d2rkSNTRxoQliSJCG
 oGY2xtfk2cIP+ayRaXo8KUdtzWlBQU+wxluKeyv4vt0poQZxGTHFw2ZTyzo0EXZPxdPp
 QVs5KHYz+Am/WYRHuCvjemPWPJ3F9XpUTND/R4IFTk1tbmuFMa9YzGlGvI8EutD5/sz4
 gTdQ==
X-Gm-Message-State: AOJu0YwFdWjyBhbEHiWiealUFgj6CeELfb7EyaO1HTStcrmpnRxEPWkt
 oR8gtxYP6v1a/kmRKHy3yJJ9wZh2Ntlr4kH9f0HSeDGp36UxeriytLeZLA==
X-Gm-Gg: ASbGncvFnp3hL30VDSsvtgMxr3NWEFXwTMWYNzDhqrp03YMEF/HGQ5XAlS4Juyncs6Y
 eJ2OHvvyEKtIX2JhjF/nSjFP4R6FRCZc2PAmTvI0t/XgNePsMg8Myli2hEq+k+nBhfH2zTcDS/t
 kXkHorXt4yISg1zWuVzH5ysz9qlKJYa8f/MfnVa4Ei9spVa12ffEVo3VSUOedtDxCR0j4ovV4do
 cEI2bQgCCIfK0vb1LaNoekxcijrEwNJLPWV/gzrvm6kRk3Pkn7FaCn2mJ2uk4RhzhPYc/xySI/V
 dKoUt6Pyx6Q9QM9LegJCgw0=
X-Google-Smtp-Source: AGHT+IEWWfTr7+bUA+4XZs4QPXn5wBo6n6XRuT9e+/MtYNXDTzTc/tVgoN4EzVFURU02u2pPPabjmg==
X-Received: by 2002:a05:600c:b8c:b0:435:330d:de86 with SMTP id
 5b1f17b1804b1-438912d2c48mr65425215e9.0.1737206393149; 
 Sat, 18 Jan 2025 05:19:53 -0800 (PST)
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:b22c:3bd:8c8e:f7ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74bf061sm127033465e9.17.2025.01.18.05.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2025 05:19:52 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 18 Jan 2025 14:19:10 +0100
Message-ID: <20250118131911.1954770-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH 1/2] package/lighttpd: bump to 1.4.77
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

News:
- https://www.lighttpd.net/2025/1/10/1.4.77/

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 ...lt-lighttpd-configuration-file-to-ha.patch | 30 ++++---
 ...ial-value-for-Linux-POLLRDHUP-on-SPA.patch | 34 --------
 ...ue-for-Linux-POLLRDHUP-on-SPARC-fixe.patch | 85 -------------------
 package/lighttpd/lighttpd.hash                |  8 +-
 package/lighttpd/lighttpd.mk                  |  2 +-
 5 files changed, 21 insertions(+), 138 deletions(-)
 delete mode 100644 package/lighttpd/0002-Revert-core-special-value-for-Linux-POLLRDHUP-on-SPA.patch
 delete mode 100644 package/lighttpd/0003-core-special-value-for-Linux-POLLRDHUP-on-SPARC-fixe.patch

diff --git a/package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch b/package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch
index 2eab2a84e5..61f58c609f 100644
--- a/package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch
+++ b/package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch
@@ -1,4 +1,4 @@
-From d9e1c9c4a95797c812dd4906ecbbc532ae459364 Mon Sep 17 00:00:00 2001
+From bb0a1cc656b2df4184a0794fb67ae74c634c1ecd Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Mon, 13 Dec 2021 22:07:17 +0100
 Subject: [PATCH] Modify the default lighttpd configuration file to have one a
@@ -15,16 +15,18 @@ Signed-off-by: Simon Dawson <spdawson@gmail.com>
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Thomas: update for 1.4.69 - drop server.use-ipv6]
 Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+[Thomas: update for 1.4.77 - move lighttpd.conf to lighttpd.annotated.conf]
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
 ---
- doc/config/conf.d/access_log.conf |  2 +-
- doc/config/lighttpd.conf          | 14 +++++++-------
+ doc/config/conf.d/access_log.conf  |  2 +-
+ doc/config/lighttpd.annotated.conf | 14 +++++++-------
  2 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/doc/config/conf.d/access_log.conf b/doc/config/conf.d/access_log.conf
-index e685d437..92cff4f0 100644
+index f8294802..9886cddf 100644
 --- a/doc/config/conf.d/access_log.conf
 +++ b/doc/config/conf.d/access_log.conf
-@@ -9,7 +9,7 @@ server.modules += ( "mod_accesslog" )
+@@ -7,7 +7,7 @@ server.modules += ( "mod_accesslog" )
  ##
  ## Default access log.
  ##
@@ -33,10 +35,10 @@ index e685d437..92cff4f0 100644
  
  ##
  ## The default format produces CLF compatible output.
-diff --git a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf
-index d45a284d..4e926d5a 100644
---- a/doc/config/lighttpd.conf
-+++ b/doc/config/lighttpd.conf
+diff --git a/doc/config/lighttpd.annotated.conf b/doc/config/lighttpd.annotated.conf
+index c94f703b..35263a1e 100644
+--- a/doc/config/lighttpd.annotated.conf
++++ b/doc/config/lighttpd.annotated.conf
 @@ -13,8 +13,8 @@
  ## if you add a variable here. Add the corresponding variable in the
  ## chroot example as well.
@@ -48,9 +50,9 @@ index d45a284d..4e926d5a 100644
  var.state_dir   = "/run"
  var.home_dir    = "/var/lib/lighttpd"
  var.conf_dir    = "/etc/lighttpd"
-@@ -97,8 +97,8 @@ server.port = 80
+@@ -97,8 +97,8 @@ include conf_dir + "/modules.conf"
  ## Run as a different username/groupname.
- ## This requires root permissions during startup. 
+ ## This requires root permissions during startup.
  ##
 -server.username  = "lighttpd"
 -server.groupname = "lighttpd"
@@ -76,10 +78,10 @@ index d45a284d..4e926d5a 100644
 +server.errorlog             = log_root + "/lighttpd-error.log"
  
  ##
- ## If you want to log to syslog you have to unset the 
+ ## If you want to log to syslog you have to unset the
 @@ -187,7 +187,7 @@ include conf_dir + "/conf.d/debug.conf"
  ## and write(). Every modern OS provides its own syscall to help network
- ## servers transfer files as fast as possible 
+ ## servers transfer files as fast as possible
  ##
 -#server.network-backend = "sendfile"
 +server.network-backend = "writev"
@@ -87,5 +89,5 @@ index d45a284d..4e926d5a 100644
  ##
  ## As lighttpd is a single-threaded server, its main resource limit is
 -- 
-2.39.0
+2.43.0
 
diff --git a/package/lighttpd/0002-Revert-core-special-value-for-Linux-POLLRDHUP-on-SPA.patch b/package/lighttpd/0002-Revert-core-special-value-for-Linux-POLLRDHUP-on-SPA.patch
deleted file mode 100644
index eebfa3a113..0000000000
--- a/package/lighttpd/0002-Revert-core-special-value-for-Linux-POLLRDHUP-on-SPA.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 88ff3763dae65371eab9f8a22ac1c95c96fe4490 Mon Sep 17 00:00:00 2001
-From: Glenn Strauss <gstrauss@gluelogic.com>
-Date: Tue, 23 Apr 2024 00:16:29 -0400
-Subject: [PATCH] Revert "[core] special value for Linux POLLRDHUP on SPARC"
- (fixes #3251)
-
-This reverts commit f14f9142f4487704e2ce0f196263c091accdb12c.
-
-x-ref:
-  "[1.4.76] buildroot compile error with bootlin-sparc{64-g,-uc}libc"
-  https://redmine.lighttpd.net/issues/3251
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/88ff3763dae65371eab9f8a22ac1c95c96fe4490
----
- src/fdevent.h | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/fdevent.h b/src/fdevent.h
-index e9c380b0..1b0a062f 100644
---- a/src/fdevent.h
-+++ b/src/fdevent.h
-@@ -40,8 +40,6 @@ struct fdnode_st {
- #if (defined(__sun) && defined(__SVR4)) /* Solaris */ \
-  || defined(__FreeBSD__)
- #define FDEVENT_RDHUP  0x4000
--#elif (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
--#define FDEVENT_RDHUP  0x0800
- #else
- #define FDEVENT_RDHUP  0x2000
- #endif
--- 
-2.30.2
-
diff --git a/package/lighttpd/0003-core-special-value-for-Linux-POLLRDHUP-on-SPARC-fixe.patch b/package/lighttpd/0003-core-special-value-for-Linux-POLLRDHUP-on-SPARC-fixe.patch
deleted file mode 100644
index f3996d185e..0000000000
--- a/package/lighttpd/0003-core-special-value-for-Linux-POLLRDHUP-on-SPARC-fixe.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 524614455554163ec78b27b89ff52bbf7fe96958 Mon Sep 17 00:00:00 2001
-From: Glenn Strauss <gstrauss@gluelogic.com>
-Date: Wed, 24 Apr 2024 03:07:37 -0400
-Subject: [PATCH] [core] special value for Linux POLLRDHUP on SPARC (fixes
- #3251)
-
-x-ref:
-  "[1.4.76] buildroot compile error with bootlin-sparc{64-g,-uc}libc"
-  https://redmine.lighttpd.net/issues/3251
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/524614455554163ec78b27b89ff52bbf7fe96958
----
- src/fdevent.h      |  2 ++
- src/fdevent_impl.c | 18 ++++++++++++++++++
- 2 files changed, 20 insertions(+)
-
-diff --git a/src/fdevent.h b/src/fdevent.h
-index 1b0a062f..556a1445 100644
---- a/src/fdevent.h
-+++ b/src/fdevent.h
-@@ -40,6 +40,8 @@ struct fdnode_st {
- #if (defined(__sun) && defined(__SVR4)) /* Solaris */ \
-  || defined(__FreeBSD__)
- #define FDEVENT_RDHUP  0x4000
-+#elif (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
-+#define FDEVENT_RDHUP  0x2800 /*(0x2000 EPOLLRDHUP | 0x0800 POLLRDHUP)*/
- #else
- #define FDEVENT_RDHUP  0x2000
- #endif
-diff --git a/src/fdevent_impl.c b/src/fdevent_impl.c
-index 8bfc1cc6..c84c8df5 100644
---- a/src/fdevent_impl.c
-+++ b/src/fdevent_impl.c
-@@ -338,6 +338,11 @@ fdevent_linux_sysepoll_event_set (fdevents *ev, fdnode *fdn, int events)
-     struct epoll_event ep;
-   #ifndef EPOLLRDHUP
-     events &= ~FDEVENT_RDHUP;
-+  #elif (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
-+    if (events & FDEVENT_RDHUP) {
-+        events &= ~FDEVENT_RDHUP;
-+        events |= EPOLLRDHUP;
-+    }
-   #endif
-     ep.events = events | EPOLLERR | EPOLLHUP;
-     ep.data.ptr = fdn;
-@@ -376,7 +381,11 @@ fdevent_linux_sysepoll_init (fdevents *ev)
-     ck_static_assert(EPOLLERR   == FDEVENT_ERR);
-     ck_static_assert(EPOLLHUP   == FDEVENT_HUP);
-   #ifdef EPOLLRDHUP
-+   #if (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
-+    ck_static_assert(EPOLLRDHUP  & FDEVENT_RDHUP);
-+   #else
-     ck_static_assert(EPOLLRDHUP == FDEVENT_RDHUP);
-+   #endif
-   #endif
- 
-     ev->type      = FDEVENT_HANDLER_LINUX_SYSEPOLL;
-@@ -770,6 +779,11 @@ fdevent_poll_event_set (fdevents *ev, fdnode *fdn, int events)
- 
-   #ifndef POLLRDHUP
-     events &= ~FDEVENT_RDHUP;
-+  #elif (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
-+    if (events & FDEVENT_RDHUP) {
-+        events &= ~FDEVENT_RDHUP;
-+        events |= POLLRDHUP;
-+    }
-   #endif
- 
-     if (k >= 0) {
-@@ -854,7 +868,11 @@ fdevent_poll_init (fdevents *ev)
-     ck_static_assert(POLLHUP   == FDEVENT_HUP);
-     ck_static_assert(POLLNVAL  == FDEVENT_NVAL);
-   #ifdef POLLRDHUP
-+   #if (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
-+    ck_static_assert(POLLRDHUP  & FDEVENT_RDHUP);
-+   #else
-     ck_static_assert(POLLRDHUP == FDEVENT_RDHUP);
-+   #endif
-   #endif
- 
-     ev->type      = FDEVENT_HANDLER_POLL;
--- 
-2.30.2
-
diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index c5545150b0..d4742b5746 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,6 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.76.sha512sum
-sha512  940f00f2d84e3424c389108d09756a0af41db3559474135b6c502deccd08ad051b5184f3f7907436384964d2b05045e27dca463af98c889cee69b0ae6e202782  lighttpd-1.4.76.tar.xz
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.76.sha256sum
-sha256  8cbf4296e373cfd0cedfe9d978760b5b05c58fdc4048b4e2bcaf0a61ac8f5011  lighttpd-1.4.76.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.77.sha512sum
+sha512  696fd4fd8486a6c3fd1131c7e8a935a02b5384882b74ddc19bf79d085e2a0abed9184a30f97e3a7aafb816d3589e110e8d70115daa15cdc52cf61aa4129e3565  lighttpd-1.4.77.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.77.sha256sum
+sha256  acafabdbfa2267d8b6452d03d85fdd2a66525f3f05a36a79b6645c017f1562ce  lighttpd-1.4.77.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index b54f5dd213..3f97e84585 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).76
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).77
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
