Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9709D132CF
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 14:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AA9580E3A;
	Mon,  4 Nov 2024 14:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nw4KHufL5q-g; Mon,  4 Nov 2024 14:04:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E53E80EF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E53E80EF4;
	Mon,  4 Nov 2024 14:04:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3AEB723
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 14:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94B9D40151
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 14:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmPTbalMBuBY for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 14:04:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=adam.michaelis@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 32743400BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32743400BF
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32743400BF
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 14:04:05 +0000 (UTC)
Received: from pps.filterd (m0346909.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3Mt8tQ000706;
 Mon, 4 Nov 2024 14:04:03 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 42ndbxuk9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Nov 2024 14:04:03 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.135])
 by xusxph009rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A4E41tB008884
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Nov 2024 14:04:01 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 4A4E40eW013125
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 4 Nov 2024 14:04:01 GMT
X-Received: from kirk.rockwellcollins.lab (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 76F3A3026D69;
 Mon,  4 Nov 2024 08:04:00 -0600 (CST)
Date: Mon, 04 Nov 2024 08:03:32 -0600
MIME-Version: 1.0
Message-Id: <20241104-feature-linux-kmod-build-from-staging-sdk-v4-1-69dd47edc4ab@collins.com>
To: buildroot@buildroot.org
Cc: brandon.maier@collins.com, neal.buchmeyer@collins.com,
 thomas.petazzoni@bootlin.com, andriy.shevchenko@intel.com,
 Adam Michaelis <adam.michaelis@collins.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_11,2024-11-04_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_11,2024-11-04_01,2024-09-30_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411040122
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 suspectscore=0 mlxscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411040122
X-Proofpoint-GUID: xPqTUWJvT7NFna90Ly4wjtIIAplDAysU
X-Proofpoint-ORIG-GUID: xPqTUWJvT7NFna90Ly4wjtIIAplDAysU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_11,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411040123
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=yjt+ZVAvA26gE/osk75MeCqB67YUzgvsvr7wQWzup64=;
 b=rsYwefClLQNjQTG93zdJ8M/EmYau3q5rsmJTbtX2oAnZX6f4I+fCr4VLffMp8N+sErgY
 0suAoMLeMg/sWpM/sOxxrXvoey33dcy0baGYtiQuJeqpvWA9twOMGFk7qxyG7U40lA+d
 kWlr85wRxLqBlWmpboguHDDlg+/WNs1IEyGXWn15PA/YUdZHYggepi3jZrLHRzFcPfH0
 ZvweOvhDEvUxqOr9j96s8meQ9xeSvlAb/zof7H5Q42748oLBagQ2DD8TTDvxab4A/fDR
 a+kgV4Epg4a2xPmjUqqleWgUBHQaUgF890ki0AnMqSb38wN6cQs8qToSZGy+m7GlWo0M oQ== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=rsYwefCl
Subject: [Buildroot] [PATCH RESEND v4] linux: Install artifacts to staging
 for kmod build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Adam Michaelis via buildroot <buildroot@buildroot.org>
Reply-To: Adam Michaelis <adam.michaelis@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds an option to install the necessary kernel headers,
scripts, and build artifacts to the staging directory so that a user
could use the exported Buildroot SDK (make sdk) to build out-of-tree
kernel modules compatible with this kernel.

Signed-off-by: Adam Michaelis <adam.michaelis@collins.com>
---
This patch will allow the user to install the Linux build artifacts and sources
into the BR staging folder that is built into a SDK that is delivered to
upstream (application software) development teams. With these new Linux
artifacts, those teams will be able to build kernel modules compatible with the
BSP's kernel (built with BR) without having to run or maintain a full buildroot
environment and Linux build.

Similar kernel build export logic used by distribution maintainers to create
kernel-devel sort of packages use much-longer procedures to possibly make the
output smaller. To balance complexity and space savings, I have filtered-out
most build artifacts except what seems to be necessary, and a arm64 build of
Linux 5.15 adds 91 MiB to my staging folder (and SDK).

Arch: https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/blob/main/PKGBUILD?ref_type=heads#L133
Fedora: https://src.fedoraproject.org/rpms/kernel/blob/rawhide/f/kernel.spec#_3507
Yocto: https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-kernel/linux/kernel-devsrc.bb#L37

v4:
  - re-send v3 with b4 for proper formatting

v3:
  - Improve rsync excludes to reduce size of output

v2:
  - Add the certs folder for module signing
---
 linux/Config.in |  8 ++++++++
 linux/linux.mk  | 19 +++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index e8c0722de0f90e6752409a899abdcc3ea211e9d6..372cd9ddd7aa4ef1b0796011b62be000cb562669 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -454,6 +454,14 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
 	  /boot if DTBs have been generated by the kernel build
 	  process.
 
+config BR2_LINUX_KERNEL_INSTALL_STAGING
+	bool "Install kmod build files to staging"
+	help
+	  Select this option to have the kernel files required for
+	  out-of-tree module building installed to staging. This will
+	  then enable module building from an exported SDK without
+	  the full Linux build and Buildroot.
+
 config BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL
 	bool "Needs host OpenSSL"
 	help
diff --git a/linux/linux.mk b/linux/linux.mk
index 469a80db9f55fc4f890b219dcd5aac23a5bda487..a26e9374b39debdc9457b4e772b6c1bdd43637c7 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -585,6 +585,25 @@ define LINUX_RUN_DEPMOD
 endef
 LINUX_TARGET_FINALIZE_HOOKS += LINUX_RUN_DEPMOD
 
+ifeq ($(BR2_LINUX_KERNEL_INSTALL_STAGING),y)
+LINUX_INSTALL_STAGING=YES
+endif
+
+define LINUX_INSTALL_STAGING_CMDS
+	# Install artifacts needed for module builds into staging for SDK use
+	if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
+		install -d "$(STAGING_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build/arch" && \
+		rsync --exclude "*.o" --exclude "*.a" --exclude "*.dtb" --exclude "*.dtbo" \
+			--exclude "Image*" --exclude "*.c" --exclude "*.S" \
+			-a "$(@D)/arch/$(KERNEL_ARCH)" \
+			"$(STAGING_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build/arch/" && \
+		rsync --exclude "*.o" --exclude "*.a" -a "$(@D)/include" \
+			"$(@D)/scripts" "$(@D)/certs" "$(@D)/Makefile" \
+			"$(@D)/Module.symvers" "$(@D)/.config" \
+			"$(STAGING_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build/" ; \
+	fi
+endef
+
 # Include all our extensions.
 #
 # Note: our package infrastructure uses the full-path of the last-scanned

---
base-commit: 0ad7035fce67cbe91db9dea7d81e6a4bc0691ad1
change-id: 20241025-feature-linux-kmod-build-from-staging-sdk-72a494eca232

Best regards,
-- 
Adam Michaelis <adam.michaelis@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
