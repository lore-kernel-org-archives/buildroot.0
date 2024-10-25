Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCD0D0C617
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 14:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E622D80D7E;
	Fri, 25 Oct 2024 14:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OraGW2NH5Wdb; Fri, 25 Oct 2024 14:16:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB96C80DA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB96C80DA6;
	Fri, 25 Oct 2024 14:16:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 193462316
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07E5160652
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9apO8N8UePq for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 14:16:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=adam.michaelis@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 07A096064E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07A096064E
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07A096064E
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:16:28 +0000 (UTC)
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PA7lUj018300;
 Fri, 25 Oct 2024 14:16:26 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 42g9a9t4v4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Oct 2024 14:16:26 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.135])
 by xusxph004rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PEGOTh017690
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Oct 2024 14:16:24 GMT
Received: from crulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 49PEGO7B001463
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 25 Oct 2024 14:16:24 GMT
X-Received: from kirk.rockwellcollins.lab (unknown [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id 3B5353003ABF;
 Fri, 25 Oct 2024 09:16:24 -0500 (CDT)
Date: Fri, 25 Oct 2024 09:16:14 -0500
MIME-Version: 1.0
Message-Id: <20241025-feature-linux-kmod-build-from-staging-sdk-v4-1-f404842a22e4@collins.com>
X-B4-Tracking: v=1; b=H4sIAC2oG2cC/x3NwQrCMAyA4VcZORuYsSL6KuKhrmkN21pJ1jEYe
 3eLx+/y/zsYq7DBo9tBeRWTkhvcqYPh43NilNAM1JM793TFyH6pyjhJrhuOcwn4rjIFjFpmtMU
 nyQktjHgj7+6OB08Xgtb7KkfZ/q/n6zh+0YHZjXsAAAA=
X-Change-ID: 20241025-feature-linux-kmod-build-from-staging-sdk-72a494eca232
To: buildroot@buildroot.org
Cc: brandon.maier@collins.com, neal.buchmeyer@collins.com,
 thomas.petazzoni@bootlin.com, andriy.shevchenko@intel.com,
 Adam Michaelis <adam.michaelis@collins.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_12,2024-10-25_02,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_13,2024-10-25_02,2024-09-30_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410250111
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250110
X-Proofpoint-ORIG-GUID: 7R913q8YLf6NFZ10m6vrfwc5JFO1Zcu7
X-Proofpoint-GUID: 7R913q8YLf6NFZ10m6vrfwc5JFO1Zcu7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_13,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2409260000 definitions=main-2410250111
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=yjt+ZVAvA26gE/osk75MeCqB67YUzgvsvr7wQWzup64=;
 b=i0XnMIYt0iTOgwJJquME5Ic/OFQLtAh9vSycNMP9RxQdEf2I6DKSk0JLNwe61aVIjYWk
 5clymg+/y6EqE1I66y/HqBt9YI8qK+ZBGlxCZR6Ek24n3Ezw/s/MFd2f39ebkNbYRmdh
 78A4wNIH7E3skTEchfDxXk1A2YYH4DoQGHathlA8dhPrbF0QULSEm67V/bMBu/iuVM4R
 g5y2OtH5Y0rctcE6DYO8MuNL2CSpYrLRZPUm6hwVoU+dzkF6HdA4zPuL/0rEmlRhkSAo
 V3kiQpk0HsgR4C5dTQ3cdDZOxPOy8ThfJBz2YwY6UZc8TvBzVcp86dhAgu75igm1p9WW ZA== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=i0XnMIYt
Subject: [Buildroot] [PATCH v4] linux: Install artifacts to staging for kmod
 build
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
