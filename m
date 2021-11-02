Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71660C433EF
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 10:21:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BBF860E74
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 10:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BBF860E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BC35400C7;
	Tue,  2 Nov 2021 10:21:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oAwWDc_OR7_B; Tue,  2 Nov 2021 10:21:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A64540287;
	Tue,  2 Nov 2021 10:21:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3863B1BF34D
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 10:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34E3C40327
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 10:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aXTj6nWDE-EV for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 10:21:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2628340326
 for <buildroot@buildroot.org>; Tue,  2 Nov 2021 10:21:11 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u18so32469596wrg.5
 for <buildroot@buildroot.org>; Tue, 02 Nov 2021 03:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D+KQfVn0VP/GLvYohAnJoP4xPI8XLV68HwoO1fVEWhk=;
 b=bKF0Hqz3bS4z4VhhW5WT0zgh9JIdh2Ck+qndk3eiSNCxWBuzasAVcvn7LbUgXhujl+
 x5okYRXtISWah/+wsNE8TuYCNZxwoJO/TGKX4Kz9YnbqcjBFyFI3V5DuAZ5YrJirOGQn
 FNftRfmktaeRNa9o+yr3ZeI+Mf6iLr7ZzzmU8sGKddbDUP5dYKBoCFS4ULKoyUzIWFut
 5VD97BxtGjKMd1SBN0dOJy4Awf20wWU+dSC0cK7FvMOl9YAgAS45Fpr+CmMRv9XEoSwu
 0U0Gffq0VVGlsWjJcP8BU4TMU8NGGrxu9JiixCEy5ohMmPUzV2h891VinOAt27Aw/pHP
 OYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D+KQfVn0VP/GLvYohAnJoP4xPI8XLV68HwoO1fVEWhk=;
 b=qhkvtb4hYZRZ2DZQjFZh7nkt1MO+TYZoMRCOhuUXoueimeCpnCkYwpR2AK943SjeTG
 H5jaEtklBC87ZH8q7b7y+fgXEVQY9MD5vFORkVFbOrTDSapzWJloslaDNJ9+re49aK0S
 s+alSo5sV001IZ1JAkPdfokBSnUbfiEBqrwoa765+pbrJq8PQewH6CDZJHe7sY9Iv8Pv
 NVvMLAdZexwiDZv3yGms11utIQXwhQBAu3MBSsggLwldxXfQQHa+dXCVX3ySDDjjfy+A
 BvSyIJnrXVI7KT+gRgEzep0WgjJeCtTzq2Jv+40SQl3Z6FsSi05QB86ZYJaljuYY8TCi
 SZ5g==
X-Gm-Message-State: AOAM532oiz4ALYTs1cxcGgsd5T54Cxt/DUtkagSjh6cff3cQpcv2MvgD
 +f9AN7eCX6sslqotv+ELBTrtjXOedN0=
X-Google-Smtp-Source: ABdhPJxNtmJX/auQY5Xt8F5YQxMQtMT2dAyLfHFbLeAy4EzTstkPDMrMrUoZ/0r2gw98e9TUYv40ug==
X-Received: by 2002:adf:f001:: with SMTP id j1mr40547392wro.351.1635848469146; 
 Tue, 02 Nov 2021 03:21:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id n4sm1236761wri.41.2021.11.02.03.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 03:21:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Nov 2021 11:19:20 +0100
Message-Id: <20211102101920.3859519-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libstrophe: bump to version 0.11.0
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
Cc: Denis Bodor <lefinnois@lefinnois.net>, Michael Vetter <jubalh@iodoru.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Use official tarball (and so drop autoreconf and first patch)
- gnutls is an optional dependency since
  https://github.com/strophe/libstrophe/commit/e490011b680633b3d4b734cd416b4ae2c21b3cc3

https://github.com/strophe/libstrophe/releases/tag/0.11.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../libstrophe/0001-make-autoreconfable.patch | 20 -------------------
 package/libstrophe/Config.in                  |  2 +-
 package/libstrophe/libstrophe.hash            |  2 +-
 package/libstrophe/libstrophe.mk              | 17 +++++++++++-----
 4 files changed, 14 insertions(+), 27 deletions(-)
 delete mode 100644 package/libstrophe/0001-make-autoreconfable.patch

diff --git a/package/libstrophe/0001-make-autoreconfable.patch b/package/libstrophe/0001-make-autoreconfable.patch
deleted file mode 100644
index 76ca6f25e8..0000000000
--- a/package/libstrophe/0001-make-autoreconfable.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Make the package autoreconfigurable
-
-Signed-off-by: Denis Bodor <lefinnois@lefinnois.net>
-[Gustavo: update for 0.8.8]
-
-diff -Nura libstrophe-0.8.8.orig/m4/.empty libstrophe-0.8.8/m4/.empty
---- libstrophe-0.8.8.orig/m4/.empty	1969-12-31 21:00:00.000000000 -0300
-+++ libstrophe-0.8.8/m4/.empty	2015-09-23 19:29:37.893688227 -0300
-@@ -0,0 +1,2 @@
-+
-+
-diff -Nura libstrophe-0.8.8.orig/Makefile.am libstrophe-0.8.8/Makefile.am
---- libstrophe-0.8.8.orig/Makefile.am	2015-09-23 19:26:10.960492781 -0300
-+++ libstrophe-0.8.8/Makefile.am	2015-09-23 19:29:17.265970964 -0300
-@@ -1,4 +1,4 @@
--AUTOMAKE_OPTIONS = subdir-objects
-+AUTOMAKE_OPTIONS = subdir-objects foreign
- 
- ACLOCAL_AMFLAGS = -I m4
- AM_CFLAGS = -g -Wall
diff --git a/package/libstrophe/Config.in b/package/libstrophe/Config.in
index 5fdb918d7a..6ddc70b9f9 100644
--- a/package/libstrophe/Config.in
+++ b/package/libstrophe/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBSTROPHE
 	bool "libstrophe"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBXML2 if !BR2_PACKAGE_EXPAT
 	help
 	  libstrophe is a lightweight XMPP client library written in C.
diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
index d5f151660f..9551b191c6 100644
--- a/package/libstrophe/libstrophe.hash
+++ b/package/libstrophe/libstrophe.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  5bf0bbc555cb6059008f1b748370d4d2ee1e1fabd3eeab68475263556405ba39  libstrophe-0.10.1.tar.gz
+sha256  feafee545403d26a44aa573d4adf327d6d07ad3f3466370634d22bbac5bd49ee  libstrophe-0.11.0.tar.xz
 sha256  82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index e078eb25cd..04ba0a69d0 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-LIBSTROPHE_VERSION = 0.10.1
-LIBSTROPHE_SITE = $(call github,strophe,libstrophe,$(LIBSTROPHE_VERSION))
-LIBSTROPHE_DEPENDENCIES = openssl host-pkgconf
-# Doesn't ship configure
-LIBSTROPHE_AUTORECONF = YES
+LIBSTROPHE_VERSION = 0.11.0
+LIBSTROPHE_SOURCE = libstrophe-$(LIBSTROPHE_VERSION).tar.xz
+LIBSTROPHE_SITE = https://github.com/strophe/libstrophe/releases/download/$(LIBSTROPHE_VERSION)
+LIBSTROPHE_DEPENDENCIES = host-pkgconf
 LIBSTROPHE_LICENSE = MIT or GPL-3.0
 LIBSTROPHE_LICENSE_FILES = MIT-LICENSE.txt GPL-LICENSE.txt
 LIBSTROPHE_INSTALL_STAGING = YES
@@ -21,4 +20,12 @@ LIBSTROPHE_CONF_OPTS += --with-libxml2
 LIBSTROPHE_DEPENDENCIES += libxml2
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBSTROPHE_CONF_OPTS += --with-tls --without-gnutls
+LIBSTROPHE_DEPENDENCIES += openssl
+else
+LIBSTROPHE_CONF_OPTS += --with-gnutls --without-tls
+LIBSTROPHE_DEPENDENCIES += gnutls
+endif
+
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
