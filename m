Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB9EC54734
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 13:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B27AB408E2;
	Tue, 27 Aug 2024 13:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgwRe2Vc91RV; Tue, 27 Aug 2024 13:05:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C45B4090F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C45B4090F;
	Tue, 27 Aug 2024 13:05:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77D3F1BF21A
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 13:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6526060808
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 13:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-hilb1fLR2Q for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 13:05:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7DD5D607B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DD5D607B6
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DD5D607B6
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 13:05:00 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RClYwK030522;
 Tue, 27 Aug 2024 13:04:57 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 419f4106ja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2024 13:04:57 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 47RD4u6W009705
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2024 13:04:56 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 47RD4ulr012783
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 27 Aug 2024 13:04:56 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 1BA213026D78;
 Tue, 27 Aug 2024 08:04:56 -0500 (CDT)
Date: Tue, 27 Aug 2024 13:04:55 +0000
MIME-Version: 1.0
Message-Id: <20240827-package-dirclean-rdep-v1-1-d5e4f79a4241@collins.com>
References: <20240827-package-dirclean-rdep-v1-0-d5e4f79a4241@collins.com>
In-Reply-To: <20240827-package-dirclean-rdep-v1-0-d5e4f79a4241@collins.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-27_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-27_01,2024-05-17_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=726
 phishscore=0
 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408270096
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=754 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408270096
X-Proofpoint-GUID: FBrHuboNrFnXUa7nuQ5Tw9ieD0pufui6
X-Proofpoint-ORIG-GUID: FBrHuboNrFnXUa7nuQ5Tw9ieD0pufui6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 mlxlogscore=814
 suspectscore=0 clxscore=1015 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408270096
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=+jpVhAdDdSclwu2QQ7Vhm2mW/Fot/Pgwb/rysz3ggoI=;
 b=OM9UzF+5H3vkRo4N26k1yXBWZ5LmWpRh9EcH23pTuLVoGmxCVzyD0FRBKDNAP7TdQe6J
 8dH9tFnpw5e2dSz6uLVpi4flZGChrAKcJR/FcJnJlvQw9VhjRgfMh1UcP0HV+vuzCrRW
 +sq/LsbQz/ZLdPGzS1FXQkhB5pNyGAGSY5CmzyGkI9WHkWZMv4vBpQ/yI7zkwC1blb3K
 D96cZTF316YAYn1aaZysYJxDvvPRMVjuVOWPdoVYLG9aAk8n9/aLX1ODlrXSth5j7Ccc
 iu53b2EVASMOi8cZj4QhXU2h2dxuff/fc9VVgiCA5jKOYxGAmU59OiSB0258TWxeORkg +Q== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=OM9UzF+5
Subject: [Buildroot] [PATCH 1/2] package/pkg-generic.mk: add
 '<pkg>-dirclean-rdepends' command
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
Cc: Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a build target similar to '<pkg>-dirclean' that cleans a package and
all of its reverse dependencies (rdepends).

This is useful for resyncing the target/ and host/ directories of a
package when using per-package directory. And to force a rebuild of any
packages depending on a package.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/pkg-generic.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 171163dcb4..3c17c5418d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -407,6 +407,13 @@ $(BUILD_DIR)/%/.stamp_dircleaned:
 	$(if $(BR2_PER_PACKAGE_DIRECTORIES),rm -Rf $(PER_PACKAGE_DIR)/$(NAME))
 	rm -Rf $(@D)
 
+# Remove package and reverse-dependencies sources
+$(BUILD_DIR)/%/.stamp_rdepends_dircleaned:
+	$(foreach rdep,$(NAME) $($(PKG)_FINAL_RECURSIVE_RDEPENDENCIES), \
+		$(if $(BR2_PER_PACKAGE_DIRECTORIES), \
+			rm -Rf $(PER_PACKAGE_DIR)/$(rdep)$(sep)) \
+		rm -Rf $($(call UPPERCASE,$(rdep))_BUILDDIR)$(sep))
+
 ################################################################################
 # virt-provides-single -- check that provider-pkg is the declared provider for
 # the virtual package virt-pkg
@@ -858,6 +865,7 @@ $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
 $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
 $(2)_TARGET_ACTUAL_SOURCE =	$$($(2)_DIR)/.stamp_actual_downloaded
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
+$(2)_TARGET_DIRCLEAN_RDEPENDS =	$$($(2)_DIR)/.stamp_rdepends_dircleaned
 
 # default extract command
 $(2)_EXTRACT_CMDS ?= \
@@ -1055,6 +1063,7 @@ $(1)-all-legal-info:	$(1)-legal-info
 $(1)-all-legal-info:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-legal-info)
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
+$(1)-dirclean-rdepends:	$$($(2)_TARGET_DIRCLEAN_RDEPENDS)
 
 $(1)-clean-for-reinstall:
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
@@ -1100,6 +1109,8 @@ $$($(2)_TARGET_ACTUAL_SOURCE):		PKG=$(2)
 $$($(2)_TARGET_ACTUAL_SOURCE):		PKGDIR=$(pkgdir)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		NAME=$(1)
+$$($(2)_TARGET_DIRCLEAN_RDEPENDS):	PKG=$(2)
+$$($(2)_TARGET_DIRCLEAN_RDEPENDS):	NAME=$(1)
 
 # Compute the name of the Kconfig option that correspond to the
 # package being enabled.
@@ -1293,6 +1304,7 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-system-dependency,$$($(2)_SOURCE))
 	$(1)-configure \
 	$(1)-depends \
 	$(1)-dirclean \
+	$(1)-dirclean-rdepends \
 	$(1)-external-deps \
 	$(1)-extract \
 	$(1)-graph-depends \

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
