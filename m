Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32352CE79A9
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 17:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BFCF611DA;
	Tue, 19 Sep 2023 17:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BFCF611DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Phn1xCGA13LP; Tue, 19 Sep 2023 17:23:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA558610AD;
	Tue, 19 Sep 2023 17:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA558610AD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3DAF1BF409
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 17:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C34C83422
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 17:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C34C83422
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x3j01hsotusE for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 17:23:09 +0000 (UTC)
X-Greylist: delayed 467 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 19 Sep 2023 17:23:09 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 306A083417
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 306A083417
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 17:23:09 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38JFO25R006499; Tue, 19 Sep 2023 17:15:20 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3t793t4sr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Sep 2023 17:15:19 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 38JHFIcb018608
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Sep 2023 17:15:18 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 38JHFHws026182
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 19 Sep 2023 17:15:18 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id C0224603D2;
 Tue, 19 Sep 2023 12:15:17 -0500 (CDT)
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 17:15:05 +0000
Message-ID: <20230919171505.53268-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_09,2023-09-19_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_09,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=402
 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309190149
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=320
 adultscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309190149
X-Proofpoint-ORIG-GUID: xhT2VWjh0uMF-IboNRqdxW2bXrwVFQ49
X-Proofpoint-GUID: xhT2VWjh0uMF-IboNRqdxW2bXrwVFQ49
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 mlxlogscore=466 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1011 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309190149
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=QVbh0y9ev5GbQyTy+9Kg52P7zyfSj9D5NMlB6ewik1I=;
 b=l5XT+KcZ2rOTlSovSziOF/PNmaGaiBCaXEhv8y10ruUSXJ5J50zquoUGKUFBPLFP+tyr
 f7b2NvBwc0rvTnNm994N+SGHxQBCWRM9pmRQIra0udficw5/u+BNhuVJ7Kp/WdcJn+dD
 GhWCwSZA1GdIkIkaI4fGDMw0UNV74+AknOn6vo70hrD4Ik2aE4W0XMBhtDLVa0Rk/gx5
 C96VQiYndg6zn5RpWtoBmWHdbV6qrKsF8CplP+ASUlLU8nqzoldTezVb8OBCQo8apPPU
 +5Sq6WM+cpdvOi87OA9d/L2fsl8YGbM3GJ/TXscc1IJq0Qg0VRXroH/YRqNf6UOxHiTG Bw== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=l5XT+KcZ
Subject: [Buildroot] [PATCH 1/1] package/python-pysensors: new package
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pysensors 0.0.4 from https://pypi.org/project/PySensors/

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-pysensors/Config.in             |  9 +++++++++
 package/python-pysensors/python-pysensors.hash |  3 +++
 package/python-pysensors/python-pysensors.mk   | 13 +++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-pysensors/Config.in
 create mode 100644 package/python-pysensors/python-pysensors.hash
 create mode 100644 package/python-pysensors/python-pysensors.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e8b78a8d46..9fa91f5c89 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -513,6 +513,7 @@ F:	package/iftop/
 F:	package/ncdu/
 
 N:	Brandon Maier <brandon.maier@collins.com>
+F:	package/python-pysensors/
 F:	package/vmtouch/
 
 N:	Brock Williams <brock@cottonwoodcomputer.com>
diff --git a/package/Config.in b/package/Config.in
index e8dbadadf3..d9961268b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1245,6 +1245,7 @@ menu "External python modules"
 	source "package/python-pyroute2/Config.in"
 	source "package/python-pyrsistent/Config.in"
 	source "package/python-pysendfile/Config.in"
+	source "package/python-pysensors/Config.in"
 	source "package/python-pysftp/Config.in"
 	source "package/python-pysmb/Config.in"
 	source "package/python-pysmi/Config.in"
diff --git a/package/python-pysensors/Config.in b/package/python-pysensors/Config.in
new file mode 100644
index 0000000000..f8e056506b
--- /dev/null
+++ b/package/python-pysensors/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYSENSORS
+	bool "python-pysensors"
+	select BR2_PACKAGE_LM_SENSORS
+	help
+	  Python bindings for libsensors.so from the lm-sensors project
+	  via ctypes. Supports API version 4, i.e. libsensors version
+	  3.x.
+
+	  https://pypi.org/project/PySensors
diff --git a/package/python-pysensors/python-pysensors.hash b/package/python-pysensors/python-pysensors.hash
new file mode 100644
index 0000000000..b98c08602d
--- /dev/null
+++ b/package/python-pysensors/python-pysensors.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/PySensors/json
+md5  af5ca440297b45bd440d32a7c8341c0f  PySensors-0.0.4.tar.gz
+sha256  beb0def410d29ee46fe196a7811124772abf84cbe3a0d8b01d80b81fba31dae5  PySensors-0.0.4.tar.gz
diff --git a/package/python-pysensors/python-pysensors.mk b/package/python-pysensors/python-pysensors.mk
new file mode 100644
index 0000000000..b38c47f0c8
--- /dev/null
+++ b/package/python-pysensors/python-pysensors.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-pysensors
+#
+################################################################################
+
+PYTHON_PYSENSORS_VERSION = 0.0.4
+PYTHON_PYSENSORS_SOURCE = PySensors-$(PYTHON_PYSENSORS_VERSION).tar.gz
+PYTHON_PYSENSORS_SITE = https://files.pythonhosted.org/packages/76/31/d3383a192f31ce1d79f27ec3d047cca23dd82a1bf0939e774386aba37cf5
+PYTHON_PYSENSORS_SETUP_TYPE = setuptools
+PYTHON_PYSENSORS_LICENSE = LGPL-2.1
+
+$(eval $(python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
