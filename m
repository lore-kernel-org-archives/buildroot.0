Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B04C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 20:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EBD982457;
	Mon, 10 Jan 2022 20:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4BlUXGyTgDTc; Mon, 10 Jan 2022 20:02:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 956528246F;
	Mon, 10 Jan 2022 20:02:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8B501BF488
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 20:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97C4040220
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 20:02:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BP5QJBoKn9B6 for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 20:02:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CAA24020A
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 20:02:06 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.34.241])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A42482003CC;
 Mon, 10 Jan 2022 21:01:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641844923;
 bh=I3zyMGJrpakRk4SLCnInsKgNjBydDcsgIbwW09nEjMk=;
 h=From:To:Cc:Subject:Date:From;
 b=vSdWqNm5SCyVSw0yuQcFBfKRHO8Qmt2cVtLPhAG12FEqO1C1ZptrjO/0Hbpk9MLzl
 Xe6ESFqT0Fht+eSrmAJYAWeE/Ott5idfYfhjy+L7c/LUUqQUNurz+ssPuahrQLyy3k
 z98v5UdaruQl9MemRERkkdE77Ndyp111nK5wHHqkJ+JH9ZHrtynZUAONst/sg96X5i
 Rq6huCH8an2V414Rp9wTVzMZmvWpRKkCjGBCnBR6hsIkAWflt4rmllJd5479TDQUWV
 g7+ch2qGJanILFVNCGOWoFhgWCBoH+DKRnWeDOxDYuF2FeC7QVtePahn0G684W7INX
 3Wy+adkD2vVRg==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 21:01:51 +0100
Message-Id: <20220110200151.830192-1-ju.o@free.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-gnupg: new package
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A wrapper for the Gnu Privacy Guard (GPG or GnuPG).

The gnupg module allows Python programs to make use of the functionality
provided by the GNU Privacy Guard (abbreviated GPG or GnuPG). Using this
module, Python programs can encrypt and decrypt data, digitally sign
documents and verify digital signatures, manage (generate, list and
delete) encryption keys, using Public Key Infrastructure (PKI)
encryption technology based on OpenPGP.

https://docs.red-dove.com/python-gnupg/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-gnupg/Config.in         | 15 +++++++++++++++
 package/python-gnupg/python-gnupg.hash |  5 +++++
 package/python-gnupg/python-gnupg.mk   | 13 +++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/python-gnupg/Config.in
 create mode 100644 package/python-gnupg/python-gnupg.hash
 create mode 100644 package/python-gnupg/python-gnupg.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 12777e8d61..036e752d84 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1595,6 +1595,7 @@ F:	package/fluidsynth/
 F:	package/glslsandbox-player/
 F:	package/ptm2human/
 F:	package/python-distro/
+F:	package/python-gnupg/
 F:	package/python-pyalsa/
 
 N:	Julien Viard de Galbert <julien@vdg.name>
diff --git a/package/Config.in b/package/Config.in
index 3a2ad30df9..af09209905 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1038,6 +1038,7 @@ menu "External python modules"
 	source "package/python-futures/Config.in"
 	source "package/python-git/Config.in"
 	source "package/python-gitdb2/Config.in"
+	source "package/python-gnupg/Config.in"
 	source "package/python-gobject/Config.in"
 	source "package/python-gpiozero/Config.in"
 	source "package/python-greenlet/Config.in"
diff --git a/package/python-gnupg/Config.in b/package/python-gnupg/Config.in
new file mode 100644
index 0000000000..54f8fb6a29
--- /dev/null
+++ b/package/python-gnupg/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_GNUPG
+	bool "python-gnupg"
+	select BR2_PACKAGE_GNUPG2 if !BR2_PACKAGE_GNUPG # runtime
+	help
+	  A wrapper for the Gnu Privacy Guard (GPG or GnuPG).
+
+	  The gnupg module allows Python programs to make use of the
+	  functionality provided by the GNU Privacy Guard (abbreviated
+	  GPG or GnuPG). Using this module, Python programs can
+	  encrypt and decrypt data, digitally sign documents and
+	  verify digital signatures, manage (generate, list and
+	  delete) encryption keys, using Public Key Infrastructure
+	  (PKI) encryption technology based on OpenPGP.
+
+	  https://docs.red-dove.com/python-gnupg/
diff --git a/package/python-gnupg/python-gnupg.hash b/package/python-gnupg/python-gnupg.hash
new file mode 100644
index 0000000000..fa0e8ae6e5
--- /dev/null
+++ b/package/python-gnupg/python-gnupg.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/python-gnupg/json
+md5  02c5d77b8db9dfba0741627560d89bd5  python-gnupg-0.4.8.tar.gz
+sha256  b64de1ae5cedf872b437201a566fa2c62ce0c95ea2e30177eb53aee1258507d7  python-gnupg-0.4.8.tar.gz
+# Locally computed sha256 checksums
+sha256  9620da3d3afdfca7dea53c4375c1507ab2d3a4af4e706827023acb49a9ec4a5e  LICENSE.txt
diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
new file mode 100644
index 0000000000..f16910e517
--- /dev/null
+++ b/package/python-gnupg/python-gnupg.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-gnupg
+#
+################################################################################
+
+PYTHON_GNUPG_VERSION = 0.4.8
+PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/b1/90/75e15ead9693028c05fc7abd25c756c0d1da27bf04a27d6f5c4139d8ee10
+PYTHON_GNUPG_LICENSE = BSD-3-Clause
+PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
+PYTHON_GNUPG_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
