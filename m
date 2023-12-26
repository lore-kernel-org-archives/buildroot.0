Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C714C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 21:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEE044028D;
	Tue, 26 Dec 2023 21:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEE044028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V4DkGm5D_j-a; Tue, 26 Dec 2023 21:24:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C97D1409E6;
	Tue, 26 Dec 2023 21:24:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C97D1409E6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E44341BF20F
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 21:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9E4760F97
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 21:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9E4760F97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dzGQw8YIm5p7 for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 21:24:37 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE94E60669
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 21:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE94E60669
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d5aef534eso6353725e9.0
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 13:24:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703625875; x=1704230675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=26ZlRsIMiwQDdonV+1WBYpB4dJUaNrApo72T4H5k9sM=;
 b=ol1CFzwo2eezze9yFM3OTUlj+ZTV8AVvd8rXPYaoECwyJBDkkOG9ub9yeS2Ot5LbkW
 3aGpWZnxxrFHNuFh6ws04NZu9hA5GBgaTaHb0274XT3FoxiLaB6JZsFT1EgYsAr+7gf2
 DaqKyPJc4DQ59ADVa6s17skMKr3bH5BP2+bZARPe+40rNqmmueaAE19Z07N++3zasvw/
 Y+plOpDo17i5DVuW/fkx70349FwQTQmuvoe7wEvLoGgCQVKQeuLKh6KxCGAQIBDf0v6A
 aK5ieDnjYOOOdJOzXi5t8lU3MaDqui4EnTjiAnrHukeANKLn+KnRlF6fjvjmz4Iio2PA
 LwAA==
X-Gm-Message-State: AOJu0YzuhU3jmGkTmlaN5svCvIq/KgxcbwWXmJ1dHbwYQBtrrP5gUbcn
 9XUHIGPXZOLWFVHXmzP7mtyIUkYOXoM=
X-Google-Smtp-Source: AGHT+IH2e5EamNQ1rNR1YQ6qJ/D1qpZQeo+bBGMeH3Zhikw/ftuu2m2qOfSDhIsMEUUJ9rGmuCYIkA==
X-Received: by 2002:a05:600c:19d3:b0:40d:596e:f23c with SMTP id
 u19-20020a05600c19d300b0040d596ef23cmr1057125wmq.18.1703625874577; 
 Tue, 26 Dec 2023 13:24:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c450e00b003fe1fe56202sm21781236wmo.33.2023.12.26.13.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 13:24:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 22:24:31 +0100
Message-ID: <20231226212431.1723685-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703625875; x=1704230675; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=26ZlRsIMiwQDdonV+1WBYpB4dJUaNrApo72T4H5k9sM=;
 b=N2XjcvF7sBSE1c/eZOYDZ9zYoQwnmcUqJTUrH+z0VoaddqiDGluHUbKuYlhTIl80m9
 YU3zxzikpz3PODkmocYEy88b867a36v6CVoW+BhvRDsSHxQqJ4MLWGQYfKMe5DiCx1N2
 YafV5n7dqjTo4ayqABraGjjX87GsuXki31s1rDQ7yeToRbf86Ixe3PMH0C1piVA21xRA
 /KYf2zSf7G1/V0lDFOW8oFfMB7bjNH0REyFnhqeF+TUScRDFdYB0ARvL5WPzisNwILj4
 O42xGf4DX3TKemqMlBPdpRcyUEvTrAatlv69jz7rnT4CjFEV5qFRLTX8wgw2RPleAUV0
 YY3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=N2XjcvF7
Subject: [Buildroot] [PATCH 1/1] package/lldpd: bump to version 1.0.17
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

Drop patch (already in version)

https://github.com/lldpd/lldpd/blob/1.0.17/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-overflow-when-parsing-CDP-addresses.patch | 24 -------------------
 package/lldpd/lldpd.hash                      |  4 ++--
 package/lldpd/lldpd.mk                        |  5 +---
 3 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 package/lldpd/0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch

diff --git a/package/lldpd/0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch b/package/lldpd/0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch
deleted file mode 100644
index 05d882a07a..0000000000
--- a/package/lldpd/0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From a9aeabdf879c25c584852a0bb5523837632f099b Mon Sep 17 00:00:00 2001
-From: Vincent Bernat <vincent@bernat.ch>
-Date: Wed, 12 Apr 2023 07:38:31 +0200
-Subject: [PATCH] daemon: fix read overflow when parsing CDP addresses
-
-Upstream: https://github.com/lldpd/lldpd/commit/a9aeabdf879c25c584852a0bb5523837632f099b
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- NEWS                       | 4 ++++
- src/daemon/protocols/cdp.c | 1 +
- 2 files changed, 5 insertions(+)
-
-diff --git a/src/daemon/protocols/cdp.c b/src/daemon/protocols/cdp.c
-index 8a1be863..42861c0e 100644
---- a/src/daemon/protocols/cdp.c
-+++ b/src/daemon/protocols/cdp.c
-@@ -466,6 +466,7 @@ cdp_decode(struct lldpd *cfg, char *frame, int s, struct lldpd_hardware *hardwar
- 					goto malformed;
- 				}
- 				PEEK_DISCARD(address_len);
-+				addresses_len -= address_len;
- 				(void)PEEK_SAVE(pos_next_address);
- 				/* Next, we go back and try to extract
- 				   IPv4 address */
diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index 6db5ca98f1..e798e2beb2 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking gpg key
-# https://media.luffy.cx/files/lldpd/lldpd-1.0.15.tar.gz.gpg
+# https://media.luffy.cx/files/lldpd/lldpd-1.0.17.tar.gz.gpg
 # using key AEF2348766F371C689A7360095A42FE8353525F9
-sha256  f7fe3a130be98a19c491479ef60f36b8ee41a9e6bc4d7f2c41033f63956a3126  lldpd-1.0.15.tar.gz
+sha256  9343177f145d2bca66ef03d59528079d3f1663c624b1e2b9d08268efdc6127ce  lldpd-1.0.17.tar.gz
 sha256  0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index d4abfade81..75457a25e3 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 1.0.15
+LLDPD_VERSION = 1.0.17
 LLDPD_SITE = https://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CHECK),check) \
@@ -16,9 +16,6 @@ LLDPD_LICENSE = ISC
 LLDPD_LICENSE_FILES = LICENSE
 LLDPD_CPE_ID_VENDOR = lldpd_project
 
-# 0001-daemon-fix-read-overflow-when-parsing-CDP-addresses.patch
-LLDPD_IGNORE_CVES += CVE-2023-41910
-
 # Detection of c99 support in configure fails without WCHAR. To enable
 # automatic detection of c99 support by configure, we need to enable
 # WCHAR in toolchain. But actually we do not need WCHAR at lldpd
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
