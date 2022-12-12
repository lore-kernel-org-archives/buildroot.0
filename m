Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5E4C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 12:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C92B5410BB;
	Mon, 12 Dec 2022 12:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C92B5410BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CgqZfABzvt_o; Mon, 12 Dec 2022 12:56:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E273410C2;
	Mon, 12 Dec 2022 12:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E273410C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D7141BF39A
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 12:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85D5581438
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 12:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85D5581438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4p-IoMxWgpCM for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 12:56:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48A4B81413
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48A4B81413
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 12:56:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id m19so5193632wms.5
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 04:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jpsvm0vF2GZcGLloUwzPcHAcmur4SYZPjQrrp35rbGc=;
 b=XUHOCL77XdUiwtIw8eJWzoHV0JGmDlREc2ElaYUGA4RnDGg6C4ighew3fZmLdG2VV0
 89SFOLCetkuwgnivKL6toN76TfL0lhN6xRkVF3Jvq02YsjvlTjS+FHHQZIpazNFScz8M
 6V95SkJubL5ze2Iqwwf31Fz9JYrwJJXjFTbWGQNlU70t8PYe4KGh9WRInhe782Dw7j3V
 Cc0euyepy1frMU/oijOr/27D/FxZ6uovLd/Rv7XD2yjsHUpvuihQ9S4JbNxIYAcgmsWu
 HgIraOTMxl0vVDcNEwT5kGAYfRxeu9+NVM9e+ITBAPIPjp7v9XpGhyJl6deswdl64D+e
 1iBw==
X-Gm-Message-State: ANoB5pnbZPtlixotk48+xOKkAMV764E2mWRaxwIH/dYm4BiXbfoqn5sO
 iI2V64dHUwJUjS4slnUBuSihNMvJ/xc=
X-Google-Smtp-Source: AA0mqf7MSUruszMNLXC3Yku/H72tPHrr9iBTt9WFnQK3NPMw0sAHn6FCm9DeBh/OfXtvJVlMKVhBkQ==
X-Received: by 2002:a1c:6a04:0:b0:3c6:e63d:fce2 with SMTP id
 f4-20020a1c6a04000000b003c6e63dfce2mr12839039wmc.9.1670849797461; 
 Mon, 12 Dec 2022 04:56:37 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 f13-20020a05600c4e8d00b003c70191f267sm9946681wmq.39.2022.12.12.04.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 04:56:36 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 13:56:26 +0100
Message-Id: <20221212125626.1658492-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=jpsvm0vF2GZcGLloUwzPcHAcmur4SYZPjQrrp35rbGc=;
 b=X7IzYLjWOea9G88JdrPRqTWzX1LT5/QfSBpCRthyR17ElsqtSM66UR3+U9tTztgKB1
 2ZW6iwTZSOdh+L+DO/SPVZkojBGIz2wEZNbsnlHCUf/CMmtclMDqQixn7HW8QW5cYvlw
 qQzbTjoyfQ9qdZeOQjuKy8Xfpt6GyxUaMCP4tQCkGh3D62eVrXKDxRIFphFdGO8yHvml
 KsiGOIIklKvVTJc4RtKVxqPG23EexWy9yv4fMecXAf1ajLM25NvRdDPzA9mST+rvBa3z
 rU7U7JYS9VykVbckWWyBI0DmpTrAgIWeZQl/BSd/x0iyl64Fx3xDgbaZG2kzWM5z/7Lk
 zl4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=X7IzYLjW
Subject: [Buildroot] [PATCH 1/1] package/unifdef: add new package
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A small package that does "Selectively remove C preprocessor conditionals".

The package will be needed for the upcoming webkitgtk 2.40.0 release.
I personally added it to get started with 2.39.2.

See: https://github.com/WebKit/WebKit/commit/f76a7e30e5749af897b83cc75b2534b1afa32552
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/Config.in.host                        |  1 +
 .../0001-Makefile-fix-error-on-install.patch  | 31 +++++++++++++++++++
 package/unifdef/Config.in.host                |  6 ++++
 package/unifdef/unifdef.hash                  |  3 ++
 package/unifdef/unifdef.mk                    | 20 ++++++++++++
 5 files changed, 61 insertions(+)
 create mode 100644 package/unifdef/0001-Makefile-fix-error-on-install.patch
 create mode 100644 package/unifdef/Config.in.host
 create mode 100644 package/unifdef/unifdef.hash
 create mode 100644 package/unifdef/unifdef.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index b76bea60d0..dff6259d15 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -102,6 +102,7 @@ menu "Host utilities"
 	source "package/tegrarcm/Config.in.host"
 	source "package/ti-cgt-pru/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
+	source "package/unifdef/Config.in.host"
 	source "package/util-linux/Config.in.host"
 	source "package/utp_com/Config.in.host"
 	source "package/uuu/Config.in.host"
diff --git a/package/unifdef/0001-Makefile-fix-error-on-install.patch b/package/unifdef/0001-Makefile-fix-error-on-install.patch
new file mode 100644
index 0000000000..c959a41c5a
--- /dev/null
+++ b/package/unifdef/0001-Makefile-fix-error-on-install.patch
@@ -0,0 +1,31 @@
+From b5e4229918c13bc0c11a523105cdb3a464337b37 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Mon, 12 Dec 2022 12:59:59 +0100
+Subject: [PATCH] Makefile: fix error on install
+
+ln: failed to create symbolic link '/home/thomas/Documents/buildroot/output/host/share/man/man1/unifdefall.1': File exists
+
+Seen while trying to add this package to buildroot.org.
+
+(upstream: https://github.com/fanf2/unifdef/pull/16)
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 36c7028..485927a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -28,7 +28,7 @@ install: unifdef unifdefall.sh unifdef.1
+ 	: manual
+ 	install -m 755 -d  ${man1dest}
+ 	install -m 644 unifdef.1  ${man1dest}/
+-	ln -s unifdef.1  ${man1dest}/unifdefall.1
++	ln -f -s unifdef.1  ${man1dest}/unifdefall.1
+ 
+ clean:
+ 	rm -f unifdef version.h
+-- 
+2.38.1
+
diff --git a/package/unifdef/Config.in.host b/package/unifdef/Config.in.host
new file mode 100644
index 0000000000..c33dff3eaf
--- /dev/null
+++ b/package/unifdef/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_UNIFDEF
+	bool "unifdef"
+	help
+	  Selectively remove C preprocessor conditionals.
+
+	  https://dotat.at/prog/unifdef/
diff --git a/package/unifdef/unifdef.hash b/package/unifdef/unifdef.hash
new file mode 100644
index 0000000000..989235ed00
--- /dev/null
+++ b/package/unifdef/unifdef.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  37ed46a39446b15b08af418fda23b75c27a769d5aad236d817ee7522cc9caeee  COPYING
+sha256  fba564a24db7b97ebe9329713ac970627b902e5e9e8b14e19e024eb6e278d10b  unifdef-2.12.tar.gz
diff --git a/package/unifdef/unifdef.mk b/package/unifdef/unifdef.mk
new file mode 100644
index 0000000000..55713d82ec
--- /dev/null
+++ b/package/unifdef/unifdef.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# unifdef
+#
+################################################################################
+
+UNIFDEF_VERSION = 2.12
+UNIFDEF_SITE = https://dotat.at/prog/unifdef
+UNIFDEF_LICENSE = BSD-2-Clause
+UNIFDEF_LICENSE_FILES = COPYING
+
+define HOST_UNIFDEF_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define HOST_UNIFDEF_INSTALL_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) HOME=$(HOST_DIR) install
+endef
+
+$(eval $(host-generic-package))
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
