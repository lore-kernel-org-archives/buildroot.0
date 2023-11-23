Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537DDC61D99
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 00:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0135581F11;
	Thu, 23 Nov 2023 00:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0135581F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WMdD7DTXVisE; Thu, 23 Nov 2023 00:09:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F5BA81F7A;
	Thu, 23 Nov 2023 00:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F5BA81F7A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 649B11BF4D6
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C85681ED5
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C85681ED5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JejcILjTn9Ll for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 00:08:29 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44B1681EDD
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 00:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44B1681EDD
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6cb66f23eddso343750b3a.0
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 16:08:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700698108; x=1701302908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RAL1UQFtghHynqNzs1fIaJXaNsukLQVHpbqSNdGTogY=;
 b=W8AQD9xgYwzuy1K4kjfxMY8r6OovLhWBlSHIOL4zK5x5UV/ITuD2by6lMCGk5BpjWt
 kC1P7pSnQS88wFXs1OJcJQG+ewYx4rcP/2fv2wUPtrD2gIULc90MTyuMHNSD4ktkZ7+A
 tADuP4bhjFeO9q2MV7aVeQ71/fDooh1ObSlwNfpkDT6UDeLo1wdb9RwEMN+pvD3W6PPu
 BxIqqOX7s6lxhNcBo7VVQCFwBIMYDz6qWFuVTK3YF2lGpjiY2XpJZoMDBQsh+bTKC6xb
 TGkgJIPgxqhIB5meeEGNftYPI5VeEn5rHThwDeROBA9/U0KeDubWOKbxCmtcmzirSJsP
 iBIw==
X-Gm-Message-State: AOJu0YwWz5iB26KfMl6I2ILUR/T86Y2QYIh0+NU2zle9YvUzOGubs5Ap
 hQON0rU4BbgY7rzDWPak7IW9TNoUfZeafphlrUg=
X-Google-Smtp-Source: AGHT+IEbavCCq0VpUqT+d7Jvinw0OSdqUB/uWUu1Ip/MfyGXmABlbhmryXmwBTLoXgGTVP7zwkcOJw==
X-Received: by 2002:a05:6a00:1399:b0:6c9:892c:5916 with SMTP id
 t25-20020a056a00139900b006c9892c5916mr4458414pfg.9.1700698107353; 
 Wed, 22 Nov 2023 16:08:27 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 fb6-20020a056a002d8600b006cb907e8059sm56858pfb.9.2023.11.22.16.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 16:08:26 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 17:08:09 -0700
Message-ID: <20231123000819.488595-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
References: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700698108; x=1701302908;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RAL1UQFtghHynqNzs1fIaJXaNsukLQVHpbqSNdGTogY=;
 b=U6t2XD0QFi01vhNgkwqwyoD0/1SacjVqt9QWFfMux1VGiU7x0RWVSO4lwl2wV5iYX7
 TP2OGh3iGU8gNR47mRBR+kIY/wYR4JR2uFMRv7JpQ6YguJkmwt8yR2nULAHiQ5Hl8aJ4
 w/+R1Mm7funC5UVqZUrS9TBQ8vaMGuqreRJQs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=U6t2XD0Q
Subject: [Buildroot] [PATCH/next 03/13] package/tllist: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/tllist/Config.in   |  6 ++++++
 package/tllist/tllist.hash |  3 +++
 package/tllist/tllist.mk   | 16 ++++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/tllist/Config.in
 create mode 100644 package/tllist/tllist.hash
 create mode 100644 package/tllist/tllist.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 16be3896f8..6eec905365 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -40,6 +40,7 @@ F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/python-kmod/
 F:	package/python-versioneer/
+F:	package/tllist/
 F:	support/testing/tests/package/test_firewalld.py
 F:	support/testing/tests/package/test_flutter.py
 
diff --git a/package/Config.in b/package/Config.in
index 790ed3cbd3..c203876a84 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2200,6 +2200,7 @@ endif
 	source "package/tbb/Config.in"
 	source "package/tinycbor/Config.in"
 	source "package/tl-expected/Config.in"
+	source "package/tllist/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
 	source "package/uvw/Config.in"
diff --git a/package/tllist/Config.in b/package/tllist/Config.in
new file mode 100644
index 0000000000..879119d13e
--- /dev/null
+++ b/package/tllist/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TLLIST
+	bool "tllist"
+	help
+	  A C header file only implementation of a typed linked list.
+
+	  https://codeberg.org/dnkl/tllist
diff --git a/package/tllist/tllist.hash b/package/tllist/tllist.hash
new file mode 100644
index 0000000000..7858ab6298
--- /dev/null
+++ b/package/tllist/tllist.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  0e7b7094a02550dd80b7243bcffc3671550b0f1d8ba625e4dff52517827d5d23  1.1.0.tar.gz
+sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/tllist/tllist.mk b/package/tllist/tllist.mk
new file mode 100644
index 0000000000..88a28d2427
--- /dev/null
+++ b/package/tllist/tllist.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# tllist
+#
+################################################################################
+
+TLLIST_VERSION = 1.1.0
+TLLIST_SOURCE = $(TLLIST_VERSION).tar.gz
+TLLIST_SITE = https://codeberg.org/dnkl/tllist/archive
+TLLIST_LICENSE = MIT
+TLLIST_LICENSE_FILES = LICENSE
+# header only
+TLLIST_INSTALL_TARGET = NO
+TLLIST_INSTALL_STAGING = YES
+
+$(eval $(meson-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
