Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4182C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 17:53:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E320260F70
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 17:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E320260F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A650340001;
	Sun, 14 Nov 2021 17:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5owvvTnpkUDK; Sun, 14 Nov 2021 17:53:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B433940156;
	Sun, 14 Nov 2021 17:53:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C5531BF2BA
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 17:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4984080B32
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 17:53:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hcyzFcm_cew2 for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 17:53:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-16-i2.italiaonline.it [213.209.12.16])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 174B380B28
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 17:53:27 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it ([79.24.99.64])
 by smtp-16.iol.local with ESMTPA
 id mJgvm8Jrt7VizmJgzmVUbC; Sun, 14 Nov 2021 18:53:25 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1636912405; bh=jbQcCv3LSbGidLlnx/vlwGnfqqPAisnn7H/PY4Avwi4=;
 h=From;
 b=QXK3wBhNDyb/xF5NcxCPLpT1ky4PrzMdijGhPVbSA5tTDfEIlRr0ZZaHrhjuVGYNt
 DmnxDUvrMH4OKcU74Zemoc1okfxtFThqDGhi1LHGh5o6yLpJnJuquUq0mDSZxvaV0R
 Ezd/u5P3/PosIFjESPAD1XqcPkj7AtvKVGQGDOAz0RnTWuFDTEsGekcWnQexp68kTE
 2cnLn8MTx26I+susdJQqfnEhSA+i5U+EZxBYTo2UfJADEZDoO9yBuASxZJXUhtSMjB
 69ca9ykWxTW1cCn6MhE6PjsgwmL/OZlgUMFGQvuMVq2rSQ1gEPSI61A6RlYhpo6i90
 S6OCwWeD6NGEw==
X-CNFS-Analysis: v=2.4 cv=ftYZ2H0f c=1 sm=1 tr=0 ts=61914d15 cx=a_exe
 a=8X6arsqDvdvtpvHbdcPR/Q==:117 a=8X6arsqDvdvtpvHbdcPR/Q==:17 a=NEAV23lmAAAA:8
 a=LEi2CFszbyRZP9qXSM0A:9
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 18:53:10 +0100
Message-Id: <20211114175310.30573-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfH+X5tIqrU4AurhP2ao+imT4UoP+s4I5ZGz1zCxUTVPvT81kg+TXKT91jb4DJeqwji3xl5aN/xhVefMCFhdcHyB5nRNkeIohpERvt83kN7XnB7UHLjdg
 6gomdzaQNOUF5tcRxWToOu8mS0wQv+rw1aNDK/BMDJmvW6LloaRTjto91YPbGN2x/2JqwklvdxZp5WHZ3HK+TlWmwUTshnHkt/s4kzdl0zvp1aDwRCMVmtPb
 fC2bHMoIcFGDYgoUSgiN2tk1z5/aQAscCBnRmcXQLPttq+TFbLvs6V31sQYk2+JnPAJGY8qoy9Hoi95xzMAlzg==
Subject: [Buildroot] [RESEND,1/1] package/davinci-bootcount: new package
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Dario Binacchi <dariobin@libero.it>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U-Boot implements a boot count scheme that can be used to detect
multiple failed attempts to boot Linux. On Davinci platform (TI AM 335x)
the `bootcount' value is stored in the RTC SCRATCH2 register. This tool
allows to read and write this register from userspace.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 package/Config.in                                |  1 +
 package/davinci-bootcount/Config.in              | 11 +++++++++++
 package/davinci-bootcount/davinci-bootcount.hash |  2 ++
 package/davinci-bootcount/davinci-bootcount.mk   | 15 +++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/davinci-bootcount/Config.in
 create mode 100644 package/davinci-bootcount/davinci-bootcount.hash
 create mode 100644 package/davinci-bootcount/davinci-bootcount.mk

diff --git a/package/Config.in b/package/Config.in
index cb94e30be3..49a53d44da 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -452,6 +452,7 @@ endmenu
 	source "package/cwiid/Config.in"
 	source "package/dahdi-linux/Config.in"
 	source "package/dahdi-tools/Config.in"
+	source "package/davinci-bootcount/Config.in"
 	source "package/dbus/Config.in"
 	source "package/dbus-cpp/Config.in"
 	source "package/dbus-glib/Config.in"
diff --git a/package/davinci-bootcount/Config.in b/package/davinci-bootcount/Config.in
new file mode 100644
index 0000000000..da3b3605a0
--- /dev/null
+++ b/package/davinci-bootcount/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DAVINCI_BOOTCOUNT
+	bool "davinci bootcount"
+	default n
+	help
+	  U-Boot implements a boot count scheme that can be used to
+	  detect multiple failed attempts to boot Linux. On Davinci
+	  platform (TI AM 335x) the `bootcount' is stored in the RTC
+	  SCRATCH2 register. This tool allows to read and write this
+	  register from userspace.
+
+	  https://github.com/VoltServer/uboot-davinci-bootcount
diff --git a/package/davinci-bootcount/davinci-bootcount.hash b/package/davinci-bootcount/davinci-bootcount.hash
new file mode 100644
index 0000000000..32140c6e62
--- /dev/null
+++ b/package/davinci-bootcount/davinci-bootcount.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 4e4243bfc773cf983db4b901520b0eb2728934d52d26fcf99f5e22f673373f6a  davinci-bootcount-0973689c7556a953d2b468e4d8d46758c6d467b4-br1.tar.gz
diff --git a/package/davinci-bootcount/davinci-bootcount.mk b/package/davinci-bootcount/davinci-bootcount.mk
new file mode 100644
index 0000000000..434da494d7
--- /dev/null
+++ b/package/davinci-bootcount/davinci-bootcount.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# davinci-bootcount
+#
+################################################################################
+
+DAVINCI_BOOTCOUNT_VERSION = 0973689c7556a953d2b468e4d8d46758c6d467b4
+DAVINCI_BOOTCOUNT_SITE = "https://github.com/VoltServer/uboot-davinci-bootcount"
+DAVINCI_BOOTCOUNT_SITE_METHOD = git
+DAVINCI_BOOTCOUNT_INSTALL_TARGET = YES
+DAVINCI_BOOTCOUNT_LICENSE = GPL-3.0
+DAVINCI_BOOTCOUNT_LICENSE_FILES = COPYING
+DAVINCI_BOOTCOUNT_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
