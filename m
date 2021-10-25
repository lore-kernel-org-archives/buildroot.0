Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE40C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 21:57:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D1AD60F92
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 21:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D1AD60F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1C844049B;
	Mon, 25 Oct 2021 21:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FXgN77KTHJWF; Mon, 25 Oct 2021 21:57:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 180854036A;
	Mon, 25 Oct 2021 21:57:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E9301BF2FA
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 21:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E00680F42
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 21:56:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bYl9FtnqeGGw for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 21:56:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21F1D80DF7
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 21:56:58 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d13so12873013wrf.11
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 14:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OsXQyLMskQ+866P0AOoJgjRxm9K+jdVI7rcXDdrDXQ4=;
 b=JmW7fojrZlPjcYRarB7jCcxhoCV/n+8oH/iNdYDawDgxZcpX7rIIyC0aMYjOY2o4mJ
 rIyKskKutfjuYT83ZZQ68cl1NEg0v5inr3D0ACEQLYURj4xWiWVnxMK39Je8Tj5u0Vzf
 ldmulgEE63yrfqrQAlf3eDhVmNXilvGohnX1gTnxRF4xPC0+TSqbPZb9ElnLSKLcKGdB
 Usa6tB0GWSdyFIRRlDXWhzg4h3peVa6KeWeAjQz4okooGZiFwncqZL579pHkawlFtcyl
 Wh52k6zQUe3BgXa4y/VBOddb4dr6sRXFrg37KfTHxIGZuEg8CGyDnEa/8aVBlKzafOgS
 Wigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OsXQyLMskQ+866P0AOoJgjRxm9K+jdVI7rcXDdrDXQ4=;
 b=ZtK6nSslgL8dhQ11J6hSxW3yohSAqd2ib0kPRpyIcrn/mgqZpeIkKoHgMWoKeQ2l/C
 gp6vLvazTu3dDmFOoNG0347X8SX0D7YkMdSygOtKhEsE1wQYx24U9PfeOcGbDB/1BfuX
 cd6vaxCbYdWT+8LszYonZ1OnHsaEKZYhTPf/xdRPcLahvIJt6hQO2mUUKOnwn8w5farS
 uhYx3+AdeSUDMK6O4p/gxm11PsQvZ5ZGJk6u3UBlRG+R0Yyl/M5tG+N4ZIsmExKiRq5G
 cVo3o+TbBo64uP8+hd+A3NTUZHUIpqnHSqS83UhSKmeBUHz4D72gS2ODnmwMyjJJ++4s
 0TUg==
X-Gm-Message-State: AOAM5308Y6txJ3WbWlEaV7kj7SdVXqvB7BK0DdefDaPsh3yLniYB3rp4
 5RvBua+JAmqvSkNkeq6nxkmhYLVR9dI=
X-Google-Smtp-Source: ABdhPJxdJVndL/7w0XEFB8luL9/GC7YbbmJVlbecv8unqtIYWuKgFzRtTeyNsyRJEf/jwXkXMCsoUA==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr26505023wrr.76.1635199016128; 
 Mon, 25 Oct 2021 14:56:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id o17sm11750371wmq.11.2021.10.25.14.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 14:56:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 23:55:20 +0200
Message-Id: <20211025215520.3712974-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/p7zip: add 7za support
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add 7za stand-alone executable as 7zr is a "light-version" of 7za that
only handles 7z archives and cannot handle encrypted archives.

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14266

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Add a dedicated option

 package/p7zip/Config.in | 22 ++++++++++++++++++++++
 package/p7zip/p7zip.mk  | 11 +++++++++--
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/package/p7zip/Config.in b/package/p7zip/Config.in
index badfb9b9e8..3b30fd71cc 100644
--- a/package/p7zip/Config.in
+++ b/package/p7zip/Config.in
@@ -12,6 +12,28 @@ config BR2_PACKAGE_P7ZIP
 
 	  http://sourceforge.net/projects/p7zip
 
+if BR2_PACKAGE_P7ZIP
+
+choice
+	prompt "p7zip binary"
+	default BR2_PACKAGE_P7ZIP_7ZR
+
+config BR2_PACKAGE_P7ZIP_7ZA
+	bool "7za"
+	help
+	  Stand-alone executable that handles fewer archive formats
+	  than 7z
+
+config BR2_PACKAGE_P7ZIP_7ZR
+	bool "7zr"
+	help
+	  Stand-alone executable which is a "light-version" of 7za that
+	  only handles 7z archives and cannot handle encrypted archives
+
+endchoice
+
+endif
+
 comment "p7zip needs a toolchain w/ threads, wchar, C++"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
index f94b55ecd2..b6c5adae26 100644
--- a/package/p7zip/p7zip.mk
+++ b/package/p7zip/p7zip.mk
@@ -10,6 +10,12 @@ P7ZIP_LICENSE = LGPL-2.1+ with unRAR restriction
 P7ZIP_LICENSE_FILES = DOC/License.txt
 P7ZIP_CPE_ID_VENDOR = 7-zip
 
+ifeq ($(BR2_PACKAGE_P7ZIP_7ZA),y)
+P7ZIP_TARGET = 7za
+else
+P7ZIP_TARGET = 7zr
+endif
+
 # p7zip buildsystem is a mess: it plays dirty tricks with CFLAGS and
 # CXXFLAGS, so we can't pass them. Instead, it accepts ALLFLAGS_C
 # and ALLFLAGS_CPP as variables to pass the CFLAGS and CXXFLAGS.
@@ -17,11 +23,12 @@ define P7ZIP_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ALLFLAGS_C="$(TARGET_CFLAGS)" \
 		CXX="$(TARGET_CXX)" ALLFLAGS_CPP="$(TARGET_CXXFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
-		-C $(@D) 7zr
+		-C $(@D) $(P7ZIP_TARGET)
 endef
 
 define P7ZIP_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/bin/7zr $(TARGET_DIR)/usr/bin/7zr
+	$(INSTALL) -D -m 0755 $(@D)/bin/$(P7ZIP_TARGET) \
+		$(TARGET_DIR)/usr/bin/$(P7ZIP_TARGET)
 endef
 
 $(eval $(generic-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
