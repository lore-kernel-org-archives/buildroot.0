Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1200C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 17:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60657400CD;
	Sun,  9 Jan 2022 17:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ls2wbUvlIGu; Sun,  9 Jan 2022 17:02:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FEEC40495;
	Sun,  9 Jan 2022 17:02:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 541B21BF48B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 17:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40F2F812B7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 17:02:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4e3mUE6Etyj2 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 17:02:18 +0000 (UTC)
X-Greylist: delayed 00:13:58 by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C124812B4
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 17:02:18 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.89.173])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5CDA2B0051E;
 Sun,  9 Jan 2022 18:02:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641747735;
 bh=BkoC6bjL1SiLY+a/isO0LCb21wrA9yXm1+QxPGfQONk=;
 h=From:To:Cc:Subject:Date:From;
 b=CTc+GQIf/lEBCcPpsy+ilxLihIwYPULStzCZiMJ7m8G9o7J2YYv/vjoARCtEUkBS8
 C2mcsIXG30rnJJjwZJZv1mPk/FTo6mWUDrXh7xlGBLzsgrb6MyJZDNaEvcwaJQoEw4
 H+vdoSgqx2gk57RJkMNkme3oh6aHedYa30+zPsohghdSSe0Td6j2F7A1Jtu8fgUnUD
 EQln9I9q82gDiyxFkzb2Z5vaUEzk2DxJS87c5xoBnqgEnBedEcTPFfWeuwQud8y3Iv
 AOmTDXNraBZOoku7vgCud+hinzw8LsEqzunMcKl0XU78vNY4SlPMo+lMT41B2K+CP0
 245CgjQL0h6eQ==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 18:02:00 +0100
Message-Id: <20220109170200.1315505-1-ju.o@free.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-distro: new package
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
Cc: Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-distro provides information about the OS distribution it runs on,
such as a reliable machine-readable ID, or version information.

It is the recommended replacement for Python's original
platform.linux_distribution function (removed in Python 3.8). It also
provides much more functionality which isn't necessarily Python bound,
like a command-line interface.

https://github.com/nir0s/distro

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-distro/Config.in          | 13 +++++++++++++
 package/python-distro/python-distro.hash |  3 +++
 package/python-distro/python-distro.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/python-distro/Config.in
 create mode 100644 package/python-distro/python-distro.hash
 create mode 100644 package/python-distro/python-distro.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2ad76a80e4..a44f07be97 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1590,6 +1590,7 @@ F:	package/fluid-soundfont/
 F:	package/fluidsynth/
 F:	package/glslsandbox-player/
 F:	package/ptm2human/
+F:	package/python-distro/
 F:	package/python-pyalsa/
 
 N:	Julien Viard de Galbert <julien@vdg.name>
diff --git a/package/Config.in b/package/Config.in
index edae7e4f62..47087f52cb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -999,6 +999,7 @@ menu "External python modules"
 	source "package/python-dialog/Config.in"
 	source "package/python-dialog3/Config.in"
 	source "package/python-dicttoxml/Config.in"
+	source "package/python-distro/Config.in"
 	source "package/python-django/Config.in"
 	source "package/python-django-enumfields/Config.in"
 	source "package/python-dnspython/Config.in"
diff --git a/package/python-distro/Config.in b/package/python-distro/Config.in
new file mode 100644
index 0000000000..bb4151541e
--- /dev/null
+++ b/package/python-distro/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_DISTRO
+	bool "python distro"
+	help
+	  distro provides information about the OS distribution it
+	  runs on, such as a reliable machine-readable ID, or version
+	  information.
+
+	  It is the recommended replacement for Python's original
+	  platform.linux_distribution function (removed in Python
+	  3.8). It also provides much more functionality which isn't
+	  necessarily Python bound, like a command-line interface.
+
+	  https://github.com/nir0s/distro
diff --git a/package/python-distro/python-distro.hash b/package/python-distro/python-distro.hash
new file mode 100644
index 0000000000..e2b3c0a444
--- /dev/null
+++ b/package/python-distro/python-distro.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  83f5e5a09f9c5f68f60173de572930effbcc0287bb84fdc4426cb4168c088424  distro-1.6.0.tar.gz
+sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-distro/python-distro.mk b/package/python-distro/python-distro.mk
new file mode 100644
index 0000000000..753e74d020
--- /dev/null
+++ b/package/python-distro/python-distro.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-distro
+#
+################################################################################
+
+PYTHON_DISTRO_VERSION = 1.6.0
+PYTHON_DISTRO_SITE = https://files.pythonhosted.org/packages/a5/26/256fa167fe1bf8b97130b4609464be20331af8a3af190fb636a8a7efd7a2
+PYTHON_DISTRO_SOURCE = distro-$(PYTHON_DISTRO_VERSION).tar.gz
+PYTHON_DISTRO_LICENSE = Apache-2.0
+PYTHON_DISTRO_LICENSE_FILES = LICENSE
+PYTHON_DISTRO_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
