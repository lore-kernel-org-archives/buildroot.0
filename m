Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C03C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 07:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BCA44038E;
	Sun, 19 Dec 2021 07:31:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yyof0HI4f6Jr; Sun, 19 Dec 2021 07:31:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36C234014C;
	Sun, 19 Dec 2021 07:31:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45A9F1BF2C2
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 07:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30E174202A
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 07:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mEqD0W-Q4Xj2 for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 07:31:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E656D42021
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 07:31:28 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7EFCE240005;
 Sun, 19 Dec 2021 07:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1639899085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PyFm7cExmLGcs1ZqGotSC5g6Pme82zyLjlCs6nyzGcs=;
 b=JJtSiNgAEPwFbFqRZBRaCLDTfDtPT9wkh1kaK11BQDtPhSTndlMkzfxPCECjdsDAIm5KVw
 ibQwovIeMa9DvKdFejgrl7tjma/CldgJlhluvFFPU/Q6qbkBXsejDQjAU/u7aEqlbDbtOI
 rkWdSJ+a3Bw76EEZEciplL/jOjPf4N8tg/FpYtghiSWmczU05TS+6eOZCf3XfQMFsaZelL
 IWegXW4ttg4TnRgtbghSarSxla0WKXQhR/1WgCwnKX6OvpGoBZQO9CA+XkqI6x/Ui/K6Kn
 Vz1FD8gLmYmWr2giS4CZT6pIwQeudjlRoiaCfh3+atvBGJvuW9E2JvrnlCnrnw==
From: Thierry Bultel <thierry.bultel@linatsea.fr>
To: buildroot@buildroot.org
Date: Sun, 19 Dec 2021 08:31:17 +0100
Message-Id: <20211219073119.1087539-1-thierry.bultel@linatsea.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/3] package/cross-ldd: new package
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
---
 package/Config.in              |  1 +
 package/cross-ldd/Config.in    |  7 +++++++
 package/cross-ldd/cross-ldd.mk | 15 +++++++++++++++
 3 files changed, 23 insertions(+)
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
index 0000000000..6b507a651a
--- /dev/null
+++ b/package/cross-ldd/cross-ldd.mk
@@ -0,0 +1,15 @@
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
+define HOST_CROSS_LDD_INSTALL_CMDS
+	install -m 755 $(@D)/cross-compile-ldd $(TARGET_CROSS)ldd
+endef
+
+$(eval $(host-generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
