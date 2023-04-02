Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6527C76196
	for <buildroot@archiver.kernel.org>; Sun,  2 Apr 2023 09:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B98D60F7F;
	Sun,  2 Apr 2023 09:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B98D60F7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IxcJsjnwhsyF; Sun,  2 Apr 2023 09:47:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A24C60F6C;
	Sun,  2 Apr 2023 09:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A24C60F6C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98F751BF365
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 09:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7186960F6C
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 09:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7186960F6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Al3RV2Cjk4jF for <buildroot@lists.busybox.net>;
 Sun,  2 Apr 2023 09:47:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC9CB60F67
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC9CB60F67
 for <buildroot@buildroot.org>; Sun,  2 Apr 2023 09:47:40 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r29so26395015wra.13
 for <buildroot@buildroot.org>; Sun, 02 Apr 2023 02:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680428858;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XtfkKSwvJsQLkx0koBfBi4I2D015WaOhiJGTIx79agA=;
 b=EKriLQQkyflG4rZ3qVVFNyInVR8LTo6F1BtpOZItvXSAYmuyrfd1nrmMMY5rTq/fes
 CUWREuTtlYKx2KWSvUMHTsDv3R/UNRKcX7fS9B5WaEe8LIUUZHzeX+VxAJkBDQemnHXM
 BMW7bBBaLLv71vDwRzsjtmCKeNHfv96lbtpG8H0uw0kviWKKIKP8dzegZmnPLPln5WLZ
 y3F0HhYkez3iLd1HLbGjO/XdpmWXAPAloS/hjtyVPjYqiyaE9ynhprgFcj69IOMcmsYt
 N/lt+5Qv8eq8FMGEhe3GxkP1p13mqKlUMbINs9v6G8U6yPe+tDt/lJv1etbgIIsUo3zR
 R0VQ==
X-Gm-Message-State: AAQBX9fFHfjnGVNUJvZYSTg8xBkGiw7E3QCNKhMnTvkDpD474e+7o6lv
 GQfk6ZSF16xoml9ozAe2mHpGZZr8+mM=
X-Google-Smtp-Source: AKy350bbDS6vmn3ZN+Zppm62fJgnUUtLjp02pPcMOfe8o/9YplyuLPG+Upn54NN63MBZpA/LZARojA==
X-Received: by 2002:a5d:5550:0:b0:2c9:1a3f:d5f8 with SMTP id
 g16-20020a5d5550000000b002c91a3fd5f8mr3044693wrw.41.1680428858469; 
 Sun, 02 Apr 2023 02:47:38 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s16-20020adfea90000000b002d21379bcabsm6844565wrm.110.2023.04.02.02.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Apr 2023 02:47:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Apr 2023 11:47:35 +0200
Message-Id: <20230402094735.169044-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680428858;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XtfkKSwvJsQLkx0koBfBi4I2D015WaOhiJGTIx79agA=;
 b=IIXSKIIM8q3q4TzdQifMcI6eaNA8QeiZvmCXc8fhpgowAvYdmT0uEoJaj1bDK5dlBG
 3o6LwpOE7dbLvGMvEwKVOc1UZaUWSwMvkSddY/ZAnyGJ7G3Zkr6Qt/YkiBnehIpT1JOc
 YDqBaga9y9bMtHkH71vM91JUDq0RQnPKcuPP1tCnVv7G9qMWtYKE+Gq2ntHfrrQeFkMp
 2qXEBSVOp9AU/C6Td8C1ryND0KakSXjX37OQf4kfwqhIES0A9FCA8wZ9q6a3Xy3Y9EiM
 RKxCyIlpRj7vrftIGX6b5gK6/v+PXCJjmWWoWNQxFpHLTDqmavMUXLhvD0Yt7l3HT0UT
 hMDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IIXSKIIM
Subject: [Buildroot] [PATCH 1/1] package/zeek: bump to version 5.2.0
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

- Handle build and install of gen-zam
- Disable new spicy option (work is still needed to cross-compile it)
- Disable unit tests (as they are now enabled by default)
- Update hash of COPYING (year updated with
  https://github.com/zeek/zeek/commit/273126a87b8f7134b81439ae31343c7b45d2a421)
- Update hash of COPYING.3rdparty (path updated, filessystem added and
  file renamed with
  https://github.com/zeek/zeek/commit/72cbc7cd13b7c1bda98658104431c3b530ff68d6
  https://github.com/zeek/zeek/commit/b77f5fa14cc1b64572b70f80366e1ba56f87503c
  https://github.com/zeek/zeek/commit/4f6f46a4043b092b40c01d91a57c5ff273ab433a)

https://github.com/zeek/zeek/blob/v5.2.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zeek/zeek.hash |  6 +++---
 package/zeek/zeek.mk   | 13 +++++++++----
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/zeek/zeek.hash b/package/zeek/zeek.hash
index 05e57b5024..872ef8e14f 100644
--- a/package/zeek/zeek.hash
+++ b/package/zeek/zeek.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  8c0afc999a8dd1c1f677a5cf818479b99c2d527e679e1ef99fb1b03f989c0373  zeek-4.1.1.tar.gz
+sha256  511047400dd4539177542c84a5e80d7e97ad73d2a9986ffcd6cd85b4cc711fbf  zeek-5.2.0.tar.gz
 
 # Hash for license files:
-sha256  b2817e2fb935805ec9fc0e90c6b971efd810d9aedfc646bc5fcb535221e0266a  COPYING
-sha256  1a451eca7b3826a7df62991ba90dd6d23ff03d28c2eefb7f8c4f8b1eac97a61b  COPYING.3rdparty
+sha256  14c5057bb1f83c50db29323a9d5bb0f33db9c4d8b9806c070f5b0ca84f52694a  COPYING
+sha256  5be6b90c7a563e6ee8238354f3487206e19d8f299689ff2adce7bdd1a6919ab1  COPYING-3rdparty
diff --git a/package/zeek/zeek.mk b/package/zeek/zeek.mk
index 584bfb0778..9c599fc22d 100644
--- a/package/zeek/zeek.mk
+++ b/package/zeek/zeek.mk
@@ -4,19 +4,19 @@
 #
 ################################################################################
 
-ZEEK_VERSION = 4.1.1
+ZEEK_VERSION = 5.2.0
 ZEEK_SITE = https://download.zeek.org
 ZEEK_LICENSE = \
 	BSD-3-Clause (zeek, C++ Actor Framework, ConvertUTF.c, CardinalityCounter.cc, pybind11), \
 	Public Domain (sqlite), \
-	MIT (doctest, libkqueue, RapidJSON, tsl-ordered-map, bro_inet_ntop.c), \
+	MIT (doctest, filesystem, libkqueue, RapidJSON, tsl-ordered-map, bro_inet_ntop.c), \
 	LGPL-3.0+ (Multifast Project), \
 	BSD-2-Clause (event.h), \
 	BSD-3-Clause (in_cksum.cc) \
 	BSD-4-Clause (Patricia.c, strsep.c, bsd-getopt-long.c), \
 	Apache-2.0 (highwayhash, folly), \
 	MPL-2.0 (mozilla-ca-list.zeek)
-ZEEK_LICENSE_FILES = COPYING COPYING.3rdparty
+ZEEK_LICENSE_FILES = COPYING COPYING-3rdparty
 ZEEK_CPE_ID_VENDOR = zeek
 ZEEK_SUPPORTS_IN_SOURCE_BUILD = NO
 ZEEK_DEPENDENCIES = \
@@ -45,6 +45,9 @@ ZEEK_CONF_OPTS = \
 	-DBINPAC_EXE_PATH=$(HOST_DIR)/bin/binpac \
 	-DBROKER_DISABLE_DOCS=ON \
 	-DBROKER_DISABLE_TESTS=ON \
+	-DDISABLE_SPICY=ON \
+	-DENABLE_ZEEK_UNIT_TESTS=OFF \
+	-DGEN_ZAM_EXE_PATH=$(HOST_DIR)/bin/gen-zam \
 	-DINSTALL_AUX_TOOLS=ON \
 	-DZEEK_ETC_INSTALL_DIR=/etc
 
@@ -79,13 +82,15 @@ ZEEK_DEPENDENCIES += musl-fts
 ZEEK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lfts
 endif
 
-HOST_ZEEK_MAKE_OPTS = binpac bifcl
+HOST_ZEEK_MAKE_OPTS = binpac bifcl gen-zam
 
 define HOST_ZEEK_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/bifcl/bifcl \
 		$(HOST_DIR)/bin/bifcl
 	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/binpac/src/binpac \
 		$(HOST_DIR)/bin/binpac
+	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/gen-zam/gen-zam \
+		$(HOST_DIR)/bin/gen-zam
 endef
 
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
