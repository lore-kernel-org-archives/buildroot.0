Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5467C433EF
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 13:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55DD08428D;
	Wed, 25 May 2022 13:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JEQSSn_AnUxo; Wed, 25 May 2022 13:35:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75FFE84286;
	Wed, 25 May 2022 13:35:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A00EF1BF31F
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE0E561307
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:34:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GqxGEghGc_dW for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 13:34:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6D2E61313
 for <buildroot@buildroot.org>; Wed, 25 May 2022 13:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653485681; x=1685021681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ej14BLqtjWTJ2bhuNg/9RNXwlBIGfQPs8yqUqsAEZ+4=;
 b=JMKGWfbHXqa2qXsDkhZVvKThkY0rcRmxGW1psXDUMZZPjdS+l9WeztRt
 gMTtWpmJpskua6V8gjVZGIBKKepDR0FdJSaQQVoceLJnQgHSRMkUNVMde
 VD73F7toeaIwG1bcgShmq0l50J+olDYSADpz1m/SBCmijc/LRR2CQBujL
 kele5vy7EiFqEd6KXt1ndqZGCvni8qzER6RRry1RJB6Pf8woTaXhaU2Gv
 sWIxviag4w14yYIpALtU4EphWjRHMa0OKKwlaFvSOAW7UF3aj/Pfo43gb
 oXFlJIOORr+sP0HqoV24bEB7f2+03hsim79J87Kfr0d+J+tOb4FE6zd7F Q==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305635100"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 21:27:37 +0800
IronPort-SDR: gRDFvJx4nsej9j6HVTjUD/mRQaiDNBqabQgMkqGN/99wfI+ctkhNnJzkrdfk2j4KsQ4H7Qaubk
 9VduQ/TYQ+jgAgORcy6NqHrXnMvwpOSAUEmqQYCJcapldgP2TQ5inK9rUG2nm4STSuSQDRWRxE
 Yq+x7DJQZUxBQG2f/zVB8X+t2yVnTYdSMa3RBm9rQzE5aYOZFddgt98WB1kEz4aMPerKtZ8pf7
 YFuB0GL8YuXGgrrzKARfiL5MnDQj5rIkVjTkfDIn+4VPpWAg+6iuM08HyqMrz3U7WSVqaNDoRC
 Y1T2N6BdQhGnOCitFVk5YVn6
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 05:51:32 -0700
IronPort-SDR: MlEhgt14bxS4PqERuUl3jIIwApfFRvHOoxv7eiwGhJz4b/dxV4RFNTmMrYngEPOKm9UzdmCZJC
 +obyeCB6x+F3F2rOAv6bbgf4AIMpfzmY7ApEGmzIzIX6luII8k/dTua7xWxqahcUkaLMv3swMO
 MnlIFl0tqDnPH6W2dUBhfOYdrn49bAVrO2zRJRwZvY0qPHn0OY8ThlfJlJ22v4nzPlYIf8gOpx
 BhNxLukY3OK50HatC000S9Uu61m9YqC54SOjXNiH3KT3tAzzbp5La1yEfeJQsFPxh+wjoDHX2R
 Nzk=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.54])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 May 2022 06:27:36 -0700
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 May 2022 22:27:23 +0900
Message-Id: <20220525132729.2349105-6-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525132729.2349105-1-damien.lemoal@wdc.com>
References: <20220525132729.2349105-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 05/11] package: python-serial: Define host
 package
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
Reply-To: Damien Le Moal <damien.lemoal@wdc.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Add the definiton of the host python-serial package to gain access to
tools such as python-miniterm to easily open a serial console terminal
with some boards (e.g. Canaan Kendryte K210 SoC-based riscv boards).

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 package/Config.in.host                 | 1 +
 package/python-serial/Config.in.host   | 6 ++++++
 package/python-serial/python-serial.mk | 1 +
 3 files changed, 8 insertions(+)
 create mode 100644 package/python-serial/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index cd1c34b5a3..89e1f06d37 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -73,6 +73,7 @@ menu "Host utilities"
 	source "package/python-cython/Config.in.host"
 	source "package/python-greenlet/Config.in.host"
 	source "package/python-lxml/Config.in.host"
+	source "package/python-serial/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
 	source "package/python3/Config.in.host"
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
