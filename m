Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F40C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 14:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B27D340609;
	Mon, 12 Dec 2022 14:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B27D340609
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OUh3EC55VOX2; Mon, 12 Dec 2022 14:28:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8E43405F8;
	Mon, 12 Dec 2022 14:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8E43405F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C9AB1BF390
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 14:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 545688131B
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 14:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 545688131B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DPBRJyZt6T09 for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 14:28:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2856D81321
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2856D81321
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 14:28:11 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso5334538wmo.1
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 06:28:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Lcfvo/3H6yvUS6GBbvJRiRf4e+bgUGxRQD5XENNcaY=;
 b=7okV27gyFcifcPIv0u7shYF8hstVXCqbcIFBIhka2QYX8qDWhTuaDjnMrZlOA9qTwe
 gaZDU9EDysRGUjpSjBN+IFJNjgccHiaKHyD1mo5Q+r21ZlUZZmUVY8w9cG20All7atxH
 9xwtItAfG0m2u81aSO7q1whmcSs8mg2UCLzEt6IKgoNOQOQeV5FYPTe47W7qLpg4T293
 X1VVvgdozB7qCp4OOq7W1iZEPCc/LhvC6wRGNckqhERbZsToPufJwNqmkw4ngQZnfjyS
 tg4BLEyf46sp8zkNtNW8AJ2HEF1udfm25jYU6gAH7isdMY1qxMos0ZFUY+Y/1M5XhVgW
 A9BA==
X-Gm-Message-State: ANoB5plXkuvf3urDhnEFbvq5Tw0yxpdGH8VryaWuF/913WCbElRbWalK
 cBBZYQ/67M3ec5Uczr1WwF4BDAtB/1Unsg==
X-Google-Smtp-Source: AA0mqf6N9CxNv+2Jnx1ETHyjYJE/i79jA1tAHpBrXJwg/JA+NBkvtFHCb7jHHi6OdUIN7uiMEtENdg==
X-Received: by 2002:a7b:c406:0:b0:3cf:a0f6:1942 with SMTP id
 k6-20020a7bc406000000b003cfa0f61942mr13307234wmi.34.1670855288717; 
 Mon, 12 Dec 2022 06:28:08 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 m27-20020a05600c3b1b00b003b47ff307e1sm10341742wms.31.2022.12.12.06.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 06:28:08 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 15:28:02 +0100
Message-Id: <20221212142802.1708779-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=4Lcfvo/3H6yvUS6GBbvJRiRf4e+bgUGxRQD5XENNcaY=;
 b=o8pQ5CGq/Cate8gAOMyXS1dJZ74u27wRIM4i9uKgYXPhBcCPwvweXJMXormVB4cUO8
 vE+gwqW6H9cCiCdUClBvaevx/UYSi1pOgEj6K0bSWh6wS0vdfBYZd6+aTzusyzc6B96w
 tHA9y3kOeQrLDN+DDfSYdBpAwoo/0WxkvbNRx23nhJH/5Jc6gVvT4jg1twT0zm1Tyj86
 0NeQFtNMmKmrrh586wMbWnTfNFrB8yEMtCP8nnHr363auYzbgA+IxGzA5mCDD8/mi9Yc
 KbCAiYDP91JIljo3QDvSESRAfrnWGUgqfwplaLMyqv0FYS9ZtadVw9fMp5uUHyNxsWeV
 OTUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=o8pQ5CGq
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
 .../0001-Makefile-fix-error-on-install.patch  | 31 +++++++++++++++++++
 package/unifdef/unifdef.hash                  |  3 ++
 package/unifdef/unifdef.mk                    | 20 ++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 package/unifdef/0001-Makefile-fix-error-on-install.patch
 create mode 100644 package/unifdef/unifdef.hash
 create mode 100644 package/unifdef/unifdef.mk

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
