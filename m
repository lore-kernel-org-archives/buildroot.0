Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6419C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76AC860D89;
	Wed, 27 Jul 2022 15:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76AC860D89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CcO1hLyHkmaP; Wed, 27 Jul 2022 15:10:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DD1360C2D;
	Wed, 27 Jul 2022 15:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DD1360C2D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 692731BF41A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 440B4824EF
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 440B4824EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m2dYARqiJm9Y for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:10:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 201F3824DD
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 201F3824DD
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:10:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q18so14377399wrx.8
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 08:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YlL3lGwXLaQiNOUHNItHHgckZdIhgUZ0wZ9W6udA+2c=;
 b=WyXYQy1eKqlpKJW7sT3ctl95rWMmBBMf/Gu7X4Jez9qGqfy5Ga+3+IziLT5bT1viEo
 CsPy9N8KXnaj452oFHpFIBje7Jue66Tg3jyJTJ1N7pqJAno/5g+jalnTtObjp8D1BIwC
 odNlUlCUJeXIkuxQRFHVaLtGf7PcCtVr+wyS9zMQnZWuTkrUDwRDAOY4XSgJAjC0EBti
 F2Fb9x+h/oSxLr9PVr9+S4tcGVXJEe1WlaVIJ8GW9Y+w/2IuRDZUH25fpNqFTzzZuCB8
 uXyMwMp2HLRlfC7gQE2WBsgcv9BTCALWCEki5/7OYMVsCBSGVZq+bthV0yaVUcHUoDTw
 z+6g==
X-Gm-Message-State: AJIora/C7ERTpRIwMliC2Hk1IEhtQNYlBUD0Snf9SeUIyu9KBVoecggF
 n5FClGALqGx3jPT7jddDqnsyUiE9YwY=
X-Google-Smtp-Source: AGRyM1tmbOVZ1EaWNNBj+hSzpcCvR5eb/jcSZdzKd0GgxsyAn580l/A66TKDyT9xlm2ghJZ5aCiJ5Q==
X-Received: by 2002:a05:600c:1083:b0:3a3:1964:fb14 with SMTP id
 e3-20020a05600c108300b003a31964fb14mr3426227wmd.203.1658934648124; 
 Wed, 27 Jul 2022 08:10:48 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c358e00b003a32297598csm2704022wmq.43.2022.07.27.08.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 08:10:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 17:10:36 +0200
Message-Id: <20220727151037.1362328-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YlL3lGwXLaQiNOUHNItHHgckZdIhgUZ0wZ9W6udA+2c=;
 b=b3pCgXmUHcVGpZxYpFdD+PKSXUdGUGsRCJp80XSzDbjOQKZyKlcLWObToE6wAlV+7m
 yGIOwOKRCGW7K5AYW3GKGfpJWv/ZzpCONY5Wkv6hURKnDilhfwSRQRpHu0NREusAQNf4
 7Sf3o1QyYDR/McCex0/U0itLwZpbBWDK+SEfX4TLo6sLrWvYavOk4U5eZRUiCxDzGiSe
 c1RzQJ39XY0m3Mn2mxWtrazfhIQVAx3f6u49z4CHiaFmDdZrtwgN1Q2Gum+xkWAz7zjr
 xWf6NjKQWZQm3Q+faxcJ2OUJds5tJ8oaYiW+PFzHZefxsz6xZBavcJ1hV8UKGwvQKs+v
 hjoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=b3pCgXmU
Subject: [Buildroot] [PATCH v2,1/2] package/minizip-zlib: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Legacy minizip provided in contrib/minizip of zlib.

https://www.winimage.com/zLibDll/minizip.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Drop virtual-package

 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/minizip-zlib/Config.in         |  7 +++++++
 package/minizip-zlib/minizip-zlib.hash |  4 ++++
 package/minizip-zlib/minizip-zlib.mk   | 20 ++++++++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/minizip-zlib/Config.in
 create mode 100644 package/minizip-zlib/minizip-zlib.hash
 create mode 100644 package/minizip-zlib/minizip-zlib.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3645a22fea..1e55f8e90c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -958,6 +958,7 @@ F:	package/mbedtls/
 F:	package/mbedtls3/
 F:	package/minissdpd/
 F:	package/minizip/
+F:	package/minizip-zlib/
 F:	package/mongodb/
 F:	package/motion/
 F:	package/mutt/
diff --git a/package/Config.in b/package/Config.in
index 654990ab97..a2ab473940 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1401,6 +1401,7 @@ menu "Compression and decompression"
 	source "package/lz4/Config.in"
 	source "package/lzo/Config.in"
 	source "package/minizip/Config.in"
+	source "package/minizip-zlib/Config.in"
 	source "package/snappy/Config.in"
 	source "package/szip/Config.in"
 	source "package/zchunk/Config.in"
diff --git a/package/minizip-zlib/Config.in b/package/minizip-zlib/Config.in
new file mode 100644
index 0000000000..fe9b337a86
--- /dev/null
+++ b/package/minizip-zlib/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MINIZIP_ZLIB
+	bool "minizip-zlib"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Legacy minizip provided in contrib/minizip of zlib.
+
+	  https://www.winimage.com/zLibDll/minizip.html
diff --git a/package/minizip-zlib/minizip-zlib.hash b/package/minizip-zlib/minizip-zlib.hash
new file mode 100644
index 0000000000..4d2c5c29d3
--- /dev/null
+++ b/package/minizip-zlib/minizip-zlib.hash
@@ -0,0 +1,4 @@
+# From http://www.zlib.net/
+sha256  4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066  zlib-1.2.11.tar.xz
+# License files, locally calculated
+sha256  7960b6b1cc63e619abb77acaea5427159605afee8c8b362664f4effc7d7f7d15  README
diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
new file mode 100644
index 0000000000..935877678d
--- /dev/null
+++ b/package/minizip-zlib/minizip-zlib.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# minizip-zlib
+#
+################################################################################
+
+MINIZIP_ZLIB_VERSION = 1.2.11
+MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
+MINIZIP_ZLIB_SITE = http://www.zlib.net
+MINIZIP_ZLIB_LICENSE = Zlib
+MINIZIP_ZLIB_LICENSE_FILES = README
+MINIZIP_ZLIB_INSTALL_STAGING = YES
+MINIZIP_ZLIB_SUBDIR = contrib/minizip
+# configure is not shipped in contrib/minizip
+MINIZIP_ZLIB_AUTORECONF = YES
+MINIZIP_ZLIB_DEPENDENCIES = zlib
+# demos must be disabled to avoid a conflict with BR2_PACKAGE_MINIZIP_DEMOS
+MINIZIP_ZLIB_CONF_OPTS = --disable-demos
+
+$(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
