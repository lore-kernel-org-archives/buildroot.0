Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9EEC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 10:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC3D581A46;
	Tue, 22 Feb 2022 10:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NagBdVrhdRPt; Tue, 22 Feb 2022 10:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBAE681570;
	Tue, 22 Feb 2022 10:23:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A46E11BF280
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A15F84089A
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:22:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JFR3eWdA8474 for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 10:22:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A612840892
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 10:22:26 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id x5so35596174edd.11
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 02:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y2Rn/wzuqm7iUIoVnOwUfVamzVsQdC3645Ke/e5XDSo=;
 b=ClI7I8hxcj/ya+SLc2siD73k2p7AEammMPIBcvm5N2Yz1+bdP51BlZ5I4UxFrwlddI
 KbdEFI+lkFbI9uPygLlb9b3mH91dC2fOBu6VlQxUK+MEEVsW4ItAxaE7ilVSPbJd5X/C
 YgXULaSoc7IDRpMo8MCOtKLJvDjWMWkb2qowzxb1huQfb/XvtfmVeU/24PDRis2rx3Lk
 dqa/4mrgDki15Q2fcP8oaZNiSGsWHyJp8TUEALnGYwOdfPaPy7fkr+TRvOdgPlyihoLE
 +1gUeys6wJT1r5+FeN/hoy+XQTQrDZ46nGV78EUp31gLYd4kCZV1IzqNez608enlg41v
 PYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y2Rn/wzuqm7iUIoVnOwUfVamzVsQdC3645Ke/e5XDSo=;
 b=iSWu3/+AZXWQUFK6umg41FDAZMwTMhqn5YtGpuYde23F4QzphoewjBHfXZrIZ0Wu9C
 lvdCZBp+rBslF2kh2G6C6H5VbosmpyohHY2B4LRwflmM9GHsAMw1ZyfaWDuD9iPW5Uwv
 oPn3omURzOoIPD5RQJ0QAETl9zHUjpXGDP9lY5ARzwZg/rJ3NK5vuiN+3eIIqmhaek9M
 3i9cv0xrL6/m6FUkiTKibWwZ9qkjoXZ7nmlDilCm8DmtPh/KLP/2gWDYhgHF7VfhzKE/
 3BmClAtZcY9lJnj5Lj7J0fUkvA6v+Zsm8eFLfWXnnz/XYIWaAHQ544Lib5F/XD8vDKtM
 6LJg==
X-Gm-Message-State: AOAM533l9ItSE2uhhXE7Noe82W3ZOQc0M5WXGYBeOp7lCOAaW0lovTZH
 QXiCZkFkHKrFeB9L8aIZuAnC/V9S3GnBUQ==
X-Google-Smtp-Source: ABdhPJygQ1gspuYngZTCOVXMAKBu0K2WM0zyQwe4aIbg4Wa5psVMWFF+9Y7LTKp9peVr3RWPsEGORA==
X-Received: by 2002:a50:cd01:0:b0:409:5438:deb6 with SMTP id
 z1-20020a50cd01000000b004095438deb6mr25741822edi.289.1645525344913; 
 Tue, 22 Feb 2022 02:22:24 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id c24sm6097032ejj.60.2022.02.22.02.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 02:22:24 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 11:22:06 +0100
Message-Id: <20220222102211.74573-4-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220222102211.74573-1-nolange79@gmail.com>
References: <20220222102211.74573-1-nolange79@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 3/7] package/systemd: use current tool for
 generating HWDB
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

udevadm has been deprecated for a while (for building the DB),
systemd-hwdb should be used in its place.

this tool further has a switch to generate the database in
/usr which is a better place for a one-time created file
than the default /etc/udev.

The HWDB source files have drop-in directories, which means
even if disabled in this package, other packages or users
could drop in stuff. So always delete those

Signed-off-by: Norbert Lange <nolange79@gmail.com>

---
v1 -> v2
-   fix removal of service
v2 -> v3
-   see https://lists.buildroot.org/pipermail/buildroot/2020-July/286310.html
-   use systemd-hwdb with --strict option
-   split removal of service in separate patch
-   improve commit message
-   always delete de HWDB source directories
---
 package/systemd/systemd.mk | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b07fac27d4..d2c28b5b60 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -307,13 +307,9 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
 SYSTEMD_CONF_OPTS += -Dhwdb=true
 define SYSTEMD_BUILD_HWDB
-	$(HOST_DIR)/bin/udevadm hwdb --update --root $(TARGET_DIR)
+	$(HOST_DIR)/bin/systemd-hwdb update --root $(TARGET_DIR) --strict --usr
 endef
 SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_BUILD_HWDB
-define SYSTEMD_RM_HWDB_SRV
-	rm -rf $(TARGET_DIR)/$(HOST_EUDEV_SYSCONFDIR)/udev/hwdb.d/
-endef
-SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_HWDB_SRV
 else
 SYSTEMD_CONF_OPTS += -Dhwdb=false
 endif
@@ -725,6 +721,11 @@ endef
 SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_UPDATE_CATALOGS
 endif
 
+define SYSTEMD_RM_HWDB_DATA
+	rm -rf $(TARGET_DIR)/usr/lib/udev/hwdb.d/ $(TARGET_DIR)/etc/udev/hwdb.d/
+endef
+SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_HWDB_DATA
+
 define SYSTEMD_RM_CATALOG_UPDATE_SERVICE
 	rm -rf $(TARGET_DIR)/usr/lib/systemd/catalog \
 		$(TARGET_DIR)/usr/lib/systemd/system/systemd-journal-catalog-update.service \
@@ -814,7 +815,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dsysusers=false \
 	-Dtmpfiles=true \
 	-Dimportd=false \
-	-Dhwdb=false \
+	-Dhwdb=true \
 	-Drfkill=false \
 	-Dman=false \
 	-Dhtml=false \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
