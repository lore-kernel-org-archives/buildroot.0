Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFA4C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 11:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E4C640145;
	Thu, 23 Dec 2021 11:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WyLBlWcLYoPD; Thu, 23 Dec 2021 11:14:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8D2140223;
	Thu, 23 Dec 2021 11:14:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EED7D1BF427
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 11:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9EB940994
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 11:14:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SB5iYCungLYw for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 11:14:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61E054096F
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 11:14:00 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id F0092FF80B;
 Thu, 23 Dec 2021 11:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1640258037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=YJwtJtUyEEdCAchqYgmXb+KvoexEZK4lqqM1QXiXJVo=;
 b=Xc5dCkYSJPFxo2jAom2LEG0e2xDT8gw8fVYlVuwmxCEY4sP9eOcn7LxAP81DWQfo5yjO2L
 31JTlMTKeesoxyGU4lev0EX9JER5UcwM+XgR4RzOg0jBWDOlmpDZcXOxByAbTEMgImQxQB
 SIOQWO9yIA7YwurQ4of/KlwFMPGOYTj+ILGxLPAKXBB+jN42Lvm0WsBRDuD8Qc2UX8jGRq
 RESiAVuFnQMnPZktOtWEJQ7pEwGX1O59YOoTMSrXTcXVIjMr3NNmWXGA6y4KCjN2jupHEY
 n86paYzYTeQw5SqVdpGN+8MeM+CA9G25arMG/crt7JjYweuixDDSFfpPhfGv1g==
From: Thierry Bultel <thierry.bultel@linatsea.fr>
To: buildroot@buildroot.org
Date: Thu, 23 Dec 2021 12:13:46 +0100
Message-Id: <20211223111348.3532601-1-thierry.bultel@linatsea.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/3] package/cross-ldd: new package
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
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cross-ldd works just as ldd, but supports
other architectures. It is needed by dracut, for instance.

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
---
Changes v1 -> v2:
  - simplified the download (suggested by Arnoult)
Changes v2 -> v3
  - changed the name to -ldd-cross, in order to avoid
    a conflict with the external toolchains that implement it

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
---
 package/Config.in              |  1 +
 package/cross-ldd/Config.in    |  7 +++++++
 package/cross-ldd/cross-ldd.mk | 19 +++++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/cross-ldd/Config.in
 create mode 100644 package/cross-ldd/cross-ldd.mk

diff --git a/package/Config.in b/package/Config.in
index bcb23132c9..5d0f858c03 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -162,6 +162,7 @@ menu "Development tools"
 	source "package/check/Config.in"
 	source "package/cmake/Config.in"
 	source "package/cppunit/Config.in"
+	source "package/cross-ldd/Config.in"
 	source "package/cukinia/Config.in"
 	source "package/cunit/Config.in"
 	source "package/cvs/Config.in"
diff --git a/package/cross-ldd/Config.in b/package/cross-ldd/Config.in
new file mode 100644
index 0000000000..3858fbc5fe
--- /dev/null
+++ b/package/cross-ldd/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_CROSS_LDD
+	bool "cross-ldd"
+	help
+	  ldd drop-in replacement for cross-compilation
+	  toolchains.
+	  This is the officially supported version mentioned
+	  in the dracut documentation
diff --git a/package/cross-ldd/cross-ldd.mk b/package/cross-ldd/cross-ldd.mk
new file mode 100644
index 0000000000..fc0752adff
--- /dev/null
+++ b/package/cross-ldd/cross-ldd.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# cross-ldd
+#
+################################################################################
+
+CROSS_LDD_VERSION = 6c9c724ebd6a29c279c6e5734e44c07f067808ec
+CROSS_LDD_SOURCE = $(CROSS_LDD_VERSION).tar.gz
+CROSS_LDD_SITE = https://gist.github.com/jerome-pouiller/c403786c1394f53f44a3b61214489e6f/archive
+
+# Notice that we change the name to '-ldd-cross', in order to avoid conflict
+# with some external toolchains that implement it
+
+define HOST_CROSS_LDD_INSTALL_CMDS
+	$(SED) 's/-ldd}/-ldd-cross}'/g $(@D)/cross-compile-ldd
+	install -D -m 755 $(@D)/cross-compile-ldd $(TARGET_CROSS)ldd-cross
+endef
+
+$(eval $(host-generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
