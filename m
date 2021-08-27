Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E06C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 21:02:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AB0360F58
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 21:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2AB0360F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D430783EB6;
	Fri, 27 Aug 2021 21:01:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L0jA76thkaAl; Fri, 27 Aug 2021 21:01:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 550D583EB9;
	Fri, 27 Aug 2021 21:01:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3467D1BF4D6
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 21:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2440483EB3
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 21:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D6Z5CsL8f7IP for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 21:01:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from da1vs03.rockwellcollins.com (da1vs03.rockwellcollins.com
 [205.175.227.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F8DF83E9E
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 21:01:40 +0000 (UTC)
IronPort-SDR: UFKnPwTyg1Ht82Sdg0ySp9ArAeSMehUElXOl+KcNG6FxQdiMRTAfxujuyYKGT9i8zvIP6x8gwP
 52CpWxu1wSPLmXrZ4NiLlWNSrteIDiQ0h+DSRRAFPApK/44yOle11zYL8suz/X6iCe1O90IWfw
 sEkqjX3RzYU2FiJu4t8zuP3ejfVAxVEs8NPoD2H2HEDracyzd1Curs9SUWWYUBZJ99QRKLYGXq
 k8p7RvNowI8UTqeLF9tqYw3qLqX9s+TMmhFPteUi2Ns3hj+7KAZZ+tDm5yNDSu7FH6K+jpWn8S
 xDI=
Received: from ofwda1n02.rockwellcollins.com (HELO
 ciulimr02.rockwellcollins.com) ([205.175.227.14])
 by da1vs03.rockwellcollins.com with ESMTP; 27 Aug 2021 15:54:31 -0500
X-Received: from biscuits.rockwellcollins.com (biscuits.rockwellcollins.lab
 [10.148.119.137])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id D589720195;
 Fri, 27 Aug 2021 15:54:30 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri, 27 Aug 2021 15:54:28 -0500
Message-Id: <20210827205430.39745-2-matthew.weber@collins.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210827205430.39745-1-matthew.weber@collins.com>
References: <20210827205430.39745-1-matthew.weber@collins.com>
Subject: [Buildroot] [PATCH v3 1/3] package/sloci-image: new host package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Matthew Weber via buildroot <buildroot@busybox.net>
Reply-To: Matthew Weber <matthew.weber@collins.com>
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Matthew Weber <matthew.weber@collins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

From: Sergio Prado <sergio.prado@e-labworks.com>

sloci-image is a simple CLI tool for packing rootfs into a single-layer
OCI image.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Matthew Weber <matthew.weber@collins.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in.host                        |  2 +
 ...-from-the-contents-of-working-folder.patch | 37 +++++++++++++++++++
 package/sloci-image/Config.in.host            |  7 ++++
 package/sloci-image/sloci-image.hash          |  5 +++
 package/sloci-image/sloci-image.mk            | 19 ++++++++++
 6 files changed, 71 insertions(+)
 create mode 100644 package/sloci-image/0001-create-OCI-tar-from-the-contents-of-working-folder.patch
 create mode 100644 package/sloci-image/Config.in.host
 create mode 100644 package/sloci-image/sloci-image.hash
 create mode 100644 package/sloci-image/sloci-image.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 53448dd100..af684021f4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2425,6 +2425,7 @@ F:	package/curlpp/
 F:	package/daq/
 F:	package/libgdiplus/
 F:	package/pimd/
+F:	package/sloci-image/
 F:	package/snort/
 F:	package/stella/
 F:	package/tio/
diff --git a/package/Config.in.host b/package/Config.in.host
index 551352482e..209b1ff138 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -78,7 +78,9 @@ menu "Host utilities"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
+
 	source "package/sdbusplus/Config.in.host"
+	source "package/sloci-image/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
diff --git a/package/sloci-image/0001-create-OCI-tar-from-the-contents-of-working-folder.patch b/package/sloci-image/0001-create-OCI-tar-from-the-contents-of-working-folder.patch
new file mode 100644
index 0000000000..3d048e3843
--- /dev/null
+++ b/package/sloci-image/0001-create-OCI-tar-from-the-contents-of-working-folder.patch
@@ -0,0 +1,37 @@
+From 66c73c2ba3057634f19f37d3cfbbe752638c9f9f Mon Sep 17 00:00:00 2001
+From: Matthew Weber <matthew.weber@collins.com>
+Date: Fri, 27 Aug 2021 12:24:19 -0500
+Subject: [PATCH] create OCI tar from the contents of working folder
+
+When testing with containerd, it was found that the tarfile
+created with sloci can't import because the contents are inside
+a folder.  Looking around online, it seems that the an oci tar
+should container the blob/index.json/oci-layout in the . of the
+tarfile.
+
+Upstream: https://github.com/jirutka/sloci-image/pull/3
+
+Refs:
+https://snyk.io/blog/container-image-formats/
+https://github.com/opencontainers/image-spec/blob/main/image-layout.md
+
+Signed-off-by: Matthew Weber <matthew.weber@collins.com>
+---
+ sloci-image | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sloci-image b/sloci-image
+index 90dba26..7f3c775 100755
+--- a/sloci-image
++++ b/sloci-image
+@@ -425,6 +425,6 @@ if [ "$OUT_TYPE" = tar ]; then
+ 	file_name="$IMAGE_NAME-$CFG_REF_NAME-$CFG_ARCH"
+ 	file_name="$file_name${CFG_ARCH_VARIANT:+"-$CFG_ARCH_VARIANT"}-$CFG_OS.oci-image"
+ 
+-	tar ${DEBUG:+-v} -cf "$file_name.tar" "$IMAGE_NAME"
++	tar ${DEBUG:+-v} -cf "$file_name.tar" -C "$IMAGE_NAME" .
+ 	rm -Rf "$IMAGE_NAME"
+ fi
+-- 
+2.17.1
+
diff --git a/package/sloci-image/Config.in.host b/package/sloci-image/Config.in.host
new file mode 100644
index 0000000000..d809f1f3c7
--- /dev/null
+++ b/package/sloci-image/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_SLOCI_IMAGE
+	bool "host sloci-image"
+	help
+	  A simple CLI tool for packing rootfs into a single-layer OCI
+	  image.
+
+	  https://github.com/jirutka/sloci-image
diff --git a/package/sloci-image/sloci-image.hash b/package/sloci-image/sloci-image.hash
new file mode 100644
index 0000000000..117f0ba6e0
--- /dev/null
+++ b/package/sloci-image/sloci-image.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256  56fbc335c193eccc3992f0a723c6dabe762f6d4854fc52059be074bdf5060d9e  sloci-image-0.1.1.tar.gz
+
+# Hash for license files:
+sha256  8ea53673b084576813fc40cd63817c5a1619438942b5e6c30dac1d10707c27e4  LICENSE
diff --git a/package/sloci-image/sloci-image.mk b/package/sloci-image/sloci-image.mk
new file mode 100644
index 0000000000..f6db7e2060
--- /dev/null
+++ b/package/sloci-image/sloci-image.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# sloci-image
+#
+################################################################################
+
+SLOCI_IMAGE_VERSION = 0.1.1
+SLOCI_IMAGE_SITE = $(call github,jirutka,sloci-image,v$(SLOCI_IMAGE_VERSION))
+
+SLOCI_IMAGE_LICENSE = MIT
+SLOCI_IMAGE_LICENSE_FILES = LICENSE
+
+HOST_SLOCI_IMAGE_DEPENDENCIES = host-gawk
+
+define HOST_SLOCI_IMAGE_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) DESTDIR=$(HOST_DIR) PREFIX=/usr -C $(@D) install
+endef
+
+$(eval $(host-generic-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
