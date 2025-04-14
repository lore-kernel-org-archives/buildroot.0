Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EE2C369B6
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 09:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61D0D610DB;
	Mon, 14 Apr 2025 09:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHkOGrY2UwNC; Mon, 14 Apr 2025 09:22:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB7F861071
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB7F861071;
	Mon, 14 Apr 2025 09:22:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B88C7250
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 09:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DF1661071
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 09:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YkrjnWAORJHr for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 09:22:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.43;
 helo=mail-wm1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 993FD60827
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 993FD60827
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 993FD60827
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 09:22:17 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so35509015e9.1
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 02:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744622536; x=1745227336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F3DK20ZzeZtkk/EIvXRZKbDLTdbiHKFfNZsLF9+kSE0=;
 b=lc9L4ys5GDu1TLllVGNYHI0gp45n+CY+ApQZ394PadqLaSr1YUZEBzt/Xue4You6pS
 qStYYfv1gqLz2cbK4jCuBKHiOFQZnXg0wejD0wygnsHqb1NaIAZPvZH8mb4zchLEB8TL
 FC8JuZWc9fJd6pNtiH0fanLqMQkiHzv/PbFVtf6khuw3WpCzDSMNuqpY8vkDD2bmbDV5
 XKXTc8IhpPNeIW0+MlMuZ+7VFD6DsKxIfKE4iIetyhgrV6z3tE3EAiIswrUi4FWgoa2O
 3VIuKCfWTo4Fr5DC2OBtWwqG6WYpWsHnl05kaAdsyHxUy6j2oKmupV3wjCAAMilRkIpf
 rJJA==
X-Gm-Message-State: AOJu0YwrDjaoV3SCITThqJ6dqTYnBD/cf0U+evSlvFdujiEhrMMELZhC
 e+4hrzHyjyt0m77BPGVNTxp1y6+70zCYou5Y99RK2Jvua7gmfvsy
X-Gm-Gg: ASbGnctjCFDrjOJ+W704Rhaty0e7fpFKEt8ifKx3ChE3/ZTicooKvteIJcN3owOq9Kl
 ZKEEWKATB4Ypl8CPbLxYoACOLQjen651oGu3X4SJ1OfxyTv2uK8UATYmC2bjI1KnYeMlvc6bmqm
 heNw/44prbuZfWA81Hs8j6WkSxBIcqQEeAAMzgdfEvTQyDAq+gjxLBs4OiHyviLKLo5Lyvb9PTM
 YZif1jgE+VtT1io+NX1cY9zYEWK00iQ8iQfzSHSuYxGBKV7FOhNGgexJ8aTW5xIPcolUvT8DLUw
 1FBf+CnjLmCrvIr4xKKPdMON8p2UG+VYodPQhF/XY6KviYfxA3jr4Fyy0SGMPgwNgyxQa6OUERR
 f44jprcVJni8wmhiF/Q==
X-Google-Smtp-Source: AGHT+IEN7q+oHQG0WK5dJEeGD2gKRe/XogkYS7xVJi16U243MzaAJxMh99KAHtg3Z/0yELPkohS+2g==
X-Received: by 2002:a05:600c:a53:b0:43d:fa59:af97 with SMTP id
 5b1f17b1804b1-43f3a9aedd2mr101960955e9.32.1744622535329; 
 Mon, 14 Apr 2025 02:22:15 -0700 (PDT)
Received: from thomas-Precision-7670.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205eccd8sm173647165e9.5.2025.04.14.02.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 02:22:14 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org,
	thomas.devoogdt@barco.com
Date: Mon, 14 Apr 2025 11:22:13 +0200
Message-ID: <20250414092213.1901858-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414090347.1895205-1-thomas@devoogdt.com>
References: <20250414090347.1895205-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v3] package/libfcgi: update to 2.4.4
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Announcement:
- https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.3
- https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.4

Notes:
- drop 0001-link-against-math.patch as it is upstream [1] (by @ffontaine)
- drop 0002-disable-examples.patch as it is upstream [2] (by @ffontaine), add --disable-examples now
- update LICENSE as the name has been changed [3]

[1] https://github.com/FastCGI-Archives/fcgi2/commit/214a7bc4da57ccbb0e8840a2f595cd99701b19f6
[2] https://github.com/FastCGI-Archives/fcgi2/commit/aa74aa7dcec5905de3bdee7f8f5a0a6d62c86cad
[3] https://github.com/FastCGI-Archives/fcgi2/commit/65571daaa538e9193fab5935e3ae69ff123da19d

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v2: fix patch format
v3: add forgotten --disable-examples
---
 package/libfcgi/0001-link-against-math.patch | 20 -----------------
 package/libfcgi/0002-disable-examples.patch  | 23 --------------------
 package/libfcgi/libfcgi.hash                 |  4 ++--
 package/libfcgi/libfcgi.mk                   |  5 +++--
 4 files changed, 5 insertions(+), 47 deletions(-)
 delete mode 100644 package/libfcgi/0001-link-against-math.patch
 delete mode 100644 package/libfcgi/0002-disable-examples.patch

diff --git a/package/libfcgi/0001-link-against-math.patch b/package/libfcgi/0001-link-against-math.patch
deleted file mode 100644
index 909a295bd6..0000000000
--- a/package/libfcgi/0001-link-against-math.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Link libfcgi against the math library.
-
-Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
-[Louis: rebase on top of 2.4.2]
-Signed-off-by: Louis Rannou <louis.rannou@smile.fr>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-
-Index: b/libfcgi/Makefile.am
-===================================================================
---- a/libfcgi/Makefile.am
-+++ b/libfcgi/Makefile.am
-@@ -19,6 +19,7 @@
-                      os_@SYSTEM@.c
- libfcgi_la_CC      = @PTHREAD_CC@
- libfcgi_la_CFLAGS  = @PTHREAD_CFLAGS@
-+libfcgi_la_LIBADD  = -lm
- libfcgi_la_LDFLAGS = @EXTRA_LIBS@ -no-undefined
-
- libfcgi___la_SOURCES = $(INCLUDE_FILES)       \
diff --git a/package/libfcgi/0002-disable-examples.patch b/package/libfcgi/0002-disable-examples.patch
deleted file mode 100644
index ccd01c0ce0..0000000000
--- a/package/libfcgi/0002-disable-examples.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Common subdirectories: libfcgi-2.4.0.orig/cgi-fcgi and libfcgi-2.4.0/cgi-fcgi
-Common subdirectories: libfcgi-2.4.0.orig/doc and libfcgi-2.4.0/doc
-Common subdirectories: libfcgi-2.4.0.orig/examples and libfcgi-2.4.0/examples
-Common subdirectories: libfcgi-2.4.0.orig/images and libfcgi-2.4.0/images
-Common subdirectories: libfcgi-2.4.0.orig/include and libfcgi-2.4.0/include
-Common subdirectories: libfcgi-2.4.0.orig/java and libfcgi-2.4.0/java
-Common subdirectories: libfcgi-2.4.0.orig/libfcgi and libfcgi-2.4.0/libfcgi
-diff -du libfcgi-2.4.0.orig/Makefile.am libfcgi-2.4.0/Makefile.am
---- libfcgi-2.4.0.orig/Makefile.am	2001-12-22 14:05:39.000000000 +0100
-+++ libfcgi-2.4.0/Makefile.am	2014-07-19 16:56:21.935216540 +0200
-@@ -10,7 +10,7 @@
- 		aclocal.m4 m4/libtool.m4 m4/lt*.m4 Makefile.in install-sh missing ltmain.sh \
- 		COPYING INSTALL
- 
--SUBDIRS = libfcgi cgi-fcgi examples include
-+SUBDIRS = libfcgi cgi-fcgi include
- 
- include_HEADERS = fcgi_config.h
- 
-Common subdirectories: libfcgi-2.4.0.orig/perl and libfcgi-2.4.0/perl
-Common subdirectories: libfcgi-2.4.0.orig/Win32 and libfcgi-2.4.0/Win32
diff --git a/package/libfcgi/libfcgi.hash b/package/libfcgi/libfcgi.hash
index 83860a4f3d..ca660c6ebd 100644
--- a/package/libfcgi/libfcgi.hash
+++ b/package/libfcgi/libfcgi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1fe83501edfc3a7ec96bb1e69db3fd5ea1730135bd73ab152186fd0b437013bc  libfcgi-2.4.2.tar.gz
-sha256  f0a8fe4513a43e8eebb24cdcf9d2e7efc52e4d8259178c6d76d3d84418397d81  LICENSE.TERMS
+sha256  c0e0d9cc7d1e456d7278c974e2826f593ef5ca555783eba81e7e9c1a07ae0ecc  libfcgi-2.4.4.tar.gz
+sha256  f0a8fe4513a43e8eebb24cdcf9d2e7efc52e4d8259178c6d76d3d84418397d81  LICENSE
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index ee61c22c45..3c90b30e39 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-LIBFCGI_VERSION = 2.4.2
+LIBFCGI_VERSION = 2.4.4
 LIBFCGI_SITE = $(call github,FastCGI-Archives,fcgi2,$(LIBFCGI_VERSION))
 LIBFCGI_LICENSE = OML
-LIBFCGI_LICENSE_FILES = LICENSE.TERMS
+LIBFCGI_LICENSE_FILES = LICENSE
 LIBFCGI_CPE_ID_VENDOR = fastcgi
 LIBFCGI_CPE_ID_PRODUCT = fcgi
 LIBFCGI_INSTALL_STAGING = YES
 LIBFCGI_AUTORECONF = YES
+LIBFCGI_CONF_OPTS = --disable-examples
 
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
