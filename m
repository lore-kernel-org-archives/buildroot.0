Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01891C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 03:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEB1A40C17;
	Mon, 30 May 2022 03:39:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A84P86KD3OVQ; Mon, 30 May 2022 03:39:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F14B40C0B;
	Mon, 30 May 2022 03:39:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19E841BF834
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 03:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0877340C01
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 03:38:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wBJ51tY66ugn for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 03:38:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D4C24000B
 for <buildroot@buildroot.org>; Mon, 30 May 2022 03:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653881927; x=1685417927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IJnFQBNwN1WpR8zC3yjc+tOmEGnkTnHFG0hBbRT6aZY=;
 b=CCsQaYzV/luCA6fQRZrY+/tOGQgy0joMLfGpsQCWr5o6/7tO8bKtVQMA
 +leIs6uObhg58vBiZsu8P8eBdVz3BnMjNcvnkBh9Adk8tEjxb/OkSZYFt
 p2Cb+yE14IazFYrgvGkD7A4zjE/z3M/hh5GSkR9z6uZcPBBRBaWC4BP0J
 hDNFUaUWphvOaLh4gxoFAf99uDsxEGqA9jgrRi/+nJ6EucTlPadFDAQxA
 as0f1Zn9CyxqUoEQwPjQTKzbmU2fTwpWN67Rpx5v9Xgba/pfMwrO+rEr8
 DWIHTqe0AvbzdSWgmC4ZckgTSnpEEi9Y62G13VeyyxhvFy9TIMeFn7zR5 w==;
X-IronPort-AV: E=Sophos;i="5.91,261,1647273600"; d="scan'208";a="313781123"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 May 2022 11:38:47 +0800
IronPort-SDR: OrI26DVz0kVwLj4nOj4KVc7T603MHn3Ia1nVQUk1g4izuxLbyqWAJmufoMvdHkk9TizjS4WE1i
 tYEXBYUYjTuYPizbi77xdUcrsit3+4sH6gIlfToqiJuC2gyTazolRNQUC3UuK4EXyN5WJa9702
 txmWa2t0HuESS7RJ504ctjDVk+4tY/3rZe1c8CdsHp18Q0yf69UsSC/FzRG71wbAP7BYsiw5Zq
 sR1+4acrMTmQFfAT8Wpiv0Ed9hpLxBSn+q2F6Vj7T4QxcB+oxMiIegTzPuf4YMO/NceC0wYkX0
 sQro7KgADSPBk2h6jZn2Xsxt
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 May 2022 19:58:12 -0700
IronPort-SDR: UsZDzHwrU5zjr18fJ6KqYEw3sFCULmhhDqKaQSLHxwB9FEv8Dbl/p56zJUvZRlc1mDJP0dkqG2
 ZvB6laima0Jo/8D/4c5Wts4FSmp21lKA0kBcQlqYtywM/usyIFAJbBLeG+1L5lTExtf9QOJh7K
 p6GmPVs3tvyjMbo3g3clXOvlG/6qOFahbZ9Nas0tvRXPn4qpc6wXQvzxIFaqsbEy0ERG2LM11P
 qUEvAzv1iKvIIeZNammBEhEvmgmZudgD5t9nIx1TO2ZKffa5FNkGiGnwyZ1kPVkf+6WNSLVaLL
 6cU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 May 2022 20:38:47 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LBLjg1s25z1SVp3
 for <buildroot@buildroot.org>; Sun, 29 May 2022 20:38:47 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653881926; x=1656473927; bh=IJnFQBNwN1WpR8zC3y
 jc+tOmEGnkTnHFG0hBbRT6aZY=; b=Lx4DubDDrA+Tn9L5dCG4IaZtVifWWOqXKH
 MNlEodFTM1ZSmYjDC9PnMfECnfwMMZmZyAeu/viD2Gmu01SqNfE65miZS7IxMJ9G
 iC/jb559U/Mn0a3KYTNXSZyj3Z90Eq/ggepTG2OEehZk2v62wlibg8Ow52xb6iiB
 BvdggrQw7aW09EnQUYS/5Bm6dSJtYmXdOc8UUMFakXfnUTa3TI5UB/FGnZQ7hSVq
 A4iUuoa9RhOJAwmShu3H9BzUHhHjM25forGtdwSzD0Jh/tsL87Zeb44IeTzNdCvh
 WFHXyrb59inwQq/N7/vh///AncRKe/Bs/pchPeyw3E4Nusreh32g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3pzRw7ZBrTuG for <buildroot@buildroot.org>;
 Sun, 29 May 2022 20:38:46 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com
 [10.149.53.254])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LBLjd1q4mz1Rvlc;
 Sun, 29 May 2022 20:38:44 -0700 (PDT)
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 May 2022 12:38:30 +0900
Message-Id: <20220530033836.474926-6-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
References: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 05/11] package: python-kflash: Kendryte K210
 UART ISP Utility
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
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the kflash Kendryte K210 UART ISP Utility as a host package to allow
users to program their board boot ROM or SRAM with built images.

The kflash utility is available through the pypi.org python package
index. The project is homepage is: https://github.com/vowstar/kflash.py.

kflash depends on the python-serial and python-pyelftools packages.
These packages are modified to add the host package definition.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 DEVELOPERS                               |  3 +++
 package/Config.in.host                   |  3 +++
 package/python-kflash/Config.in.host     |  9 +++++++++
 package/python-kflash/python-kflash.hash |  5 +++++
 package/python-kflash/python-kflash.mk   | 15 +++++++++++++++
 package/python-pyelftools/Config.in.host |  7 +++++++
 package/python-serial/Config.in.host     |  6 ++++++
 package/python-serial/python-serial.mk   |  1 +
 8 files changed, 49 insertions(+)
 create mode 100644 package/python-kflash/Config.in.host
 create mode 100644 package/python-kflash/python-kflash.hash
 create mode 100644 package/python-kflash/python-kflash.mk
 create mode 100644 package/python-pyelftools/Config.in.host
 create mode 100644 package/python-serial/Config.in.host

diff --git a/DEVELOPERS b/DEVELOPERS
index 71cc3da6d7..14c6f02cce 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -627,6 +627,9 @@ N:	Damien Lanson <damien@kal-host.com>
 F:	package/libvdpau/
 F:	package/log4cpp/
 
+N:	Damien Le Moal <damien.lemoal@wdc.com>
+F:	package/python-kflash/
+
 N:	Daniel Nicoletti <dantti12@gmail.com>
 F:	package/cutelyst/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index cd1c34b5a3..6c9fd7c493 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -72,7 +72,10 @@ menu "Host utilities"
 	source "package/pwgen/Config.in.host"
 	source "package/python-cython/Config.in.host"
 	source "package/python-greenlet/Config.in.host"
+	source "package/python-kflash/Config.in.host"
 	source "package/python-lxml/Config.in.host"
+	source "package/python-pyelftools/Config.in.host"
+	source "package/python-serial/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
 	source "package/python3/Config.in.host"
diff --git a/package/python-kflash/Config.in.host b/package/python-kflash/Config.in.host
new file mode 100644
index 0000000000..a16857078f
--- /dev/null
+++ b/package/python-kflash/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_PYTHON_KFLASH
+	bool "host python-kflash"
+	depends on BR2_RISCV_64 && !BR2_USE_MMU
+	select BR2_PACKAGE_HOST_PYTHON_PYELFTOOLS
+	select BR2_PACKAGE_HOST_PYTHON_SERIAL
+	help
+	  Kendryte UART ISP Utility - programming code to k210.
+
+	  https://github.com/vowstar/kflash.py
diff --git a/package/python-kflash/python-kflash.hash b/package/python-kflash/python-kflash.hash
new file mode 100644
index 0000000000..722c4e879b
--- /dev/null
+++ b/package/python-kflash/python-kflash.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/kflash/json
+md5  85549bcc1faa0f2cd5ebe3b04759e7fa  kflash-1.1.5.tar.gz
+sha256  40a0976b52942c7a3bdfa2d9e2bdc8d7526cf6deb0759c8384281240c8fb404e  kflash-1.1.5.tar.gz
+# Locally computed sha256 checksums
+sha256  c48133d7a08d743c2c01c6190fc1860f7d73777afa2199ed8d0a035b754d8bf9  LICENSE
diff --git a/package/python-kflash/python-kflash.mk b/package/python-kflash/python-kflash.mk
new file mode 100644
index 0000000000..adbf6b30b0
--- /dev/null
+++ b/package/python-kflash/python-kflash.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-kflash
+#
+################################################################################
+
+PYTHON_KFLASH_VERSION = 1.1.5
+PYTHON_KFLASH_SOURCE = kflash-$(PYTHON_KFLASH_VERSION).tar.gz
+PYTHON_KFLASH_SITE = https://files.pythonhosted.org/packages/c4/b3/1c25a92922bfd3dbc05d972352c071167cad035c615f6f068f75c2f0fd01
+PYTHON_KFLASH_SETUP_TYPE = setuptools
+PYTHON_KFLASH_LICENSE = MIT
+PYTHON_KFLASH_LICENSE_FILES = LICENSE
+HOST_PYTHON_KFLASH_DEPENDENCIES = host-python-pyelftools host-python-serial
+
+$(eval $(host-python-package))
diff --git a/package/python-pyelftools/Config.in.host b/package/python-pyelftools/Config.in.host
new file mode 100644
index 0000000000..8f5829a964
--- /dev/null
+++ b/package/python-pyelftools/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_PYTHON_PYELFTOOLS
+	bool "host python-pyelftools"
+	help
+	  Pyelftools is a Python library for parsing and analyzing ELF
+	  files and DWARF debug information.
+
+	  https://github.com/eliben/pyelftools
diff --git a/package/python-serial/Config.in.host b/package/python-serial/Config.in.host
new file mode 100644
index 0000000000..3c071575d7
--- /dev/null
+++ b/package/python-serial/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PYTHON_SERIAL
+	bool "host python-serial"
+	help
+	  python-serial is a Python library to access serial ports.
+
+	  https://github.com/pyserial/pyserial
diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index 249ea9d5a3..87cd9392f1 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -12,3 +12,4 @@ PYTHON_SERIAL_LICENSE_FILES = LICENSE.txt
 PYTHON_SERIAL_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
