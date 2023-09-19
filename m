Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F05CE79A8
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 17:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8ECC610BA;
	Tue, 19 Sep 2023 17:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8ECC610BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DK-fUhZRVXtT; Tue, 19 Sep 2023 17:23:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11CBF61647;
	Tue, 19 Sep 2023 17:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11CBF61647
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6DD31BF409
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 17:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB03940990
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 17:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB03940990
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ghC_Pj2_0tDR for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 17:23:25 +0000 (UTC)
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D324F40193
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 17:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D324F40193
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38JHKFXW010652; Tue, 19 Sep 2023 17:23:22 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3t7cbruc3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Sep 2023 17:23:22 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 38JHNLxF020648
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Sep 2023 17:23:21 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 38JHNLv8004065
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 19 Sep 2023 17:23:21 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 2FD72200F1;
 Tue, 19 Sep 2023 12:23:21 -0500 (CDT)
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 17:23:00 +0000
Message-ID: <20230919172300.9901-2-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919172300.9901-1-brandon.maier@collins.com>
References: <20230919172300.9901-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_09,2023-09-19_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_09,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxlogscore=252 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309190150
X-Proofpoint-Spam-Details: rule=notspam policy=default score=1 mlxlogscore=188
 adultscore=0 mlxscore=1
 bulkscore=0 malwarescore=0 spamscore=1 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309190150
X-Proofpoint-ORIG-GUID: 0vxQ6AaABdmWGY5XLiYqf3PxwVYqWJdP
X-Proofpoint-GUID: 0vxQ6AaABdmWGY5XLiYqf3PxwVYqWJdP
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 phishscore=0 mlxlogscore=307 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309190150
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=4kOvaIH/7k19yde2weQlD5EIIDZ+hFosdKS4NKqzPvI=;
 b=nb1gmoUssNLeEIP30js2t5Ey9Exb0Svn5QK9t92jtNDFPb3xUZ+wtycMS+d8k10Rl0jG
 jv7psXse2Yxu0zjDu/A5sv2ZI+fSO/5vcmEoNk5f59GLiynOVC5hhAsga8kHJpaP1fkE
 U4cH429D3q4DovWUJX5ekiFKuJVtMVWdrFQluzwIzdaLH72tzFaZBH2hBcC39m9NBNWw
 NbgnnteLLGRnkF6ziRf26O3LzMIP0YOYKqEhiNla+ZFwZsMz+fqyHJwrkK9InFwhNkyM
 1dpSkUqAHT/rGFFAiEYPgvtTrv0+YUC3zrdprDH11KKmozCuA3dZ328iOPPyekko8MUa jg== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=nb1gmoUs
Subject: [Buildroot] [PATCH 2/2] unifdef: add target package
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 DEVELOPERS                 | 1 +
 package/Config.in          | 1 +
 package/unifdef/Config.in  | 9 +++++++++
 package/unifdef/unifdef.mk | 9 +++++++++
 4 files changed, 20 insertions(+)
 create mode 100644 package/unifdef/Config.in

diff --git a/DEVELOPERS b/DEVELOPERS
index e8b78a8d46..defeb502ab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -513,6 +513,7 @@ F:	package/iftop/
 F:	package/ncdu/
 
 N:	Brandon Maier <brandon.maier@collins.com>
+F:	package/unifdef/
 F:	package/vmtouch/
 
 N:	Brock Williams <brock@cottonwoodcomputer.com>
diff --git a/package/Config.in b/package/Config.in
index e8dbadadf3..1cf147c0fa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2267,6 +2267,7 @@ menu "Miscellaneous"
 	source "package/shared-mime-info/Config.in"
 	source "package/sunwait/Config.in"
 	source "package/taskd/Config.in"
+	source "package/unifdef/Config.in"
 	source "package/wine/Config.in"
 	source "package/xmrig/Config.in"
 	source "package/xutil_util-macros/Config.in"
diff --git a/package/unifdef/Config.in b/package/unifdef/Config.in
new file mode 100644
index 0000000000..a1a44d9f5a
--- /dev/null
+++ b/package/unifdef/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_UNIFDEF
+	bool "unifdef"
+	help
+	  The unifdef utility selectively processes conditional C
+	  preprocessor #if and #ifdef directives. It removes from a file
+	  both the #directives and the additional text that they
+	  delimit, while otherwise leaving the file alone.
+
+	  http://dotat.at/prog/unifdef/
diff --git a/package/unifdef/unifdef.mk b/package/unifdef/unifdef.mk
index fd74455894..6761e32b69 100644
--- a/package/unifdef/unifdef.mk
+++ b/package/unifdef/unifdef.mk
@@ -9,6 +9,14 @@ UNIFDEF_SITE = https://dotat.at/prog/unifdef
 UNIFDEF_LICENSE = BSD-2-Clause, BSD-3-Clause
 UNIFDEF_LICENSE_FILES = COPYING
 
+define UNIFDEF_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define UNIFDEF_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=$(TARGET_DIR) install
+endef
+
 define HOST_UNIFDEF_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
@@ -17,4 +25,5 @@ define HOST_UNIFDEF_INSTALL_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
 endef
 
+$(eval $(generic-package))
 $(eval $(host-generic-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
