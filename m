Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD35C3DA47
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 12:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F892410CB;
	Tue,  9 Jul 2024 12:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZmVnFDTI6L1; Tue,  9 Jul 2024 12:33:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF115411B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF115411B3;
	Tue,  9 Jul 2024 12:33:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99D071BF275
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 12:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93D7F81CA5
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 12:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SgIxMae7eLhb for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 12:33:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4DADC81CE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DADC81CE1
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DADC81CE1
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 12:33:09 +0000 (UTC)
Received: from unknown (HELO opfedv3rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 14:33:07 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jul 2024 14:33:07 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 14:33:05 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 09 Jul 2024 14:33:05 +0200
X-IronPort-AV: E=Sophos;i="6.09,194,1716242400"; d="scan'208";a="171183742"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 9 Jul 2024 14:33:05 +0200
Message-ID: <b80fa61d1f85e2e418afa9eb105a3aeddaa6d588.1720528385.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX406.corporate.adroot.infra.ftgroup
 (10.115.27.15) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1720528390; x=1752064390;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Ge/cnAAwdUbwqSyMUSmkWoXD1HOBHBb7roy43lzCXQ=;
 b=nBaWzwWc4xp7L+GmMz8kJ137aqedHccCf5IQ1Aaq8HSRZz9402QQbuIc
 2rdnntFsA8I674+rKiWD9e7wKHD9qr+9/ylLze8lNdTHldVP0Bw9S+iQb
 Dt1ektMbDY/uBlKH5Tv1e/hxS9AErHsZM9QshiGxN39qOOOb2tcbRhegR
 xhsRp+/uCE10RjSHRHZ2cGxuEY98QSvwxIvztAwvpIFN8b3hUuiYJB2j2
 jEmxvz+cx32IPmECr2WlPx3uwYnzGtLWqZXEyNTil8WhuRCebYtN/b2Ok
 KNN72WnFmHLOO4ZRylmMfcru4Zntts/+HMF3umyqawTTA7z+TY/NhygwS
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=nBaWzwWc
Subject: [Buildroot] [PATCH] package/python-paho-mqtt: bump version
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
Cc: Davide Viti <zinosat@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 yann.morin@orange.com, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Version 2.1.0 is a major bump, with an API change that should be
backward compatible with version up to 1.6.1.

The runtime test failed in timeout because the crng init did not have
time to complete in the default 5-second timeout; tests showed that the
trip-off would be between 6s and 7s here, so increase it enough to leave
some margin on less-capable machines.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Davide Viti <zinosat@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-paho-mqtt/python-paho-mqtt.hash         | 2 +-
 package/python-paho-mqtt/python-paho-mqtt.mk           | 5 +++--
 support/testing/tests/package/test_python_paho_mqtt.py | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-paho-mqtt/python-paho-mqtt.hash b/package/python-paho-mqtt/python-paho-mqtt.hash
index 81b9dda81d..5fe91c5c54 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.hash
+++ b/package/python-paho-mqtt/python-paho-mqtt.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  6e35c1be242a901fc9c00bad7d37b5cc4a497f398dfceb4ed0d8018a959be650  python-paho-mqtt-1.6.1.tar.gz
+sha256  3602ce9d1ada58b063f2052ff013ff8cdd06d66cef918d5f6d048b6f68ccf049  python-paho-mqtt-2.1.0.tar.gz
 sha256  66408b049249c3bdb0ba1ed285f5422ce67e371d40151bebd4d806af454ffe7c  LICENSE.txt
 sha256  e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
 sha256  8c349f80764d0648e645f41ef23772a70c995a0924b5235f735f4a3d09df127c  epl-v20
diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
index f255a7847d..095d6e1f90 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.mk
+++ b/package/python-paho-mqtt/python-paho-mqtt.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PAHO_MQTT_VERSION = 1.6.1
+PYTHON_PAHO_MQTT_VERSION = 2.1.0
 PYTHON_PAHO_MQTT_SITE = $(call github,eclipse,paho.mqtt.python,v$(PYTHON_PAHO_MQTT_VERSION))
 PYTHON_PAHO_MQTT_LICENSE = EPL-2.0, EDLv1.0
 PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
-PYTHON_PAHO_MQTT_SETUP_TYPE = setuptools
+PYTHON_PAHO_MQTT_SETUP_TYPE = pep517
+PYTHON_PAHO_MQTT_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
diff --git a/support/testing/tests/package/test_python_paho_mqtt.py b/support/testing/tests/package/test_python_paho_mqtt.py
index 0fe7fa5904..217293e4ee 100644
--- a/support/testing/tests/package/test_python_paho_mqtt.py
+++ b/support/testing/tests/package/test_python_paho_mqtt.py
@@ -18,6 +18,7 @@ class TestPythonPahoMQTT(TestPythonPackageBase):
         self.check_sample_scripts_exist()
 
         cmd = "%s %s" % (self.interpreter, os.path.basename(self.sample_scripts[0]))
-        output, exit_code = self.emulator.run(cmd)
+        # Increase timeout to let the crng init complete
+        output, exit_code = self.emulator.run(cmd, timeout=15)
         self.assertEqual(exit_code, 0)
         self.assertEqual(output[0], "Hello, World!")
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
