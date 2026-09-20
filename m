Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CFBC982D0
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 10:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB0F080FFA;
	Sun, 20 Sep 2026 10:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_vqcgRqr6AQ; Sun, 20 Sep 2026 10:14:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E0A6380FF3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789899279;
	b=K3MVGWfuUXLoLdZMlf2r+K5Uk/SZHpUyq1wihLBv/v2u/sSEQkK0HjjaPDBLsE5lmzsh
	 Jq7SdSkeaFwEqZSDUs+s4kTcO5u0xGSiiEx/XwX2lG7UTgxLw4d7eapuXUbCTv5LMujjO
	 IMBdR/EtPuk/WVz7inYcKUKMqhmYB97jOGZTcqMPo5POs0NuPjpkF69xocY4lBLTEPfip
	 7t7+zc2ryY6Sm+Xq5pDfhrr22uyA/fR6Zp1RSif4hoeTfse7t5sFbC/uVF5od8xUASvju
	 Yl1lw2Ots/kH/KTUl/c9vQdive+Hz4DQqnZpuZmy759eNeO2jIS0jt5/7RCu57c+rMw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789899279;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qv3JUbwF1WWKjSHOpe8lykt3L4wfICB7WxfCAgg2mcA=;
	b=LzD3CUoHmwmjmkMJqF6S3e3i5wXswfgQc37WDLe5azc2wSoqI2hk2HT+v4kt2Ig3g39e
	 EH+afOm45CyEpnxt1+d6ACWMKaa+wjzaTNWVEJraH8opLh8jr+aOab50fC1emryEmpANc
	 lJ2n342HkpTeE87IMxgJG7WRujf/FW6yTA5KZ/KqSnAgTKM4H2lcI7WNI5T94/BWfeOWb
	 L3wqP3BfYFkHBa8pXb4D5S6biebzVnDgF3tnXn8Ldfi+KD9+OTCWEdOUDAYYu3JybaYvV
	 2AbcPZDu1boiQoaZzX3z4X3MSU4JeMKTH1j2ynHLTVe8eFu0enCoi+kn7z2xhX4x5Iw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789899279;
	bh=qv3JUbwF1WWKjSHOpe8lykt3L4wfICB7WxfCAgg2mcA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dR2TQAcz0JrwTEYkPgYy4gqE15sdABadTeCfIdr8WZjthHiMF+LiIxNfz+P7zk6C5
	 OetXLCVRBXYenbicQQhNzUr4dfZB9ZgMwF+wbxyVtcXr1qSlZ1mrJ5MHVMHudCZbm0
	 ER82ZlBrbG7780sMt8Zf3U1LHM3iTMjWIqkzgCXk4U3tpdXIeyQ/8hhLG1nzYKPHwo
	 WszKIoQ2TWtPUovTa3tNhuLwtYmC0KS+B4xXbv/7lH82tRKeCPUCguKdWRQTv0riwc
	 qUH05A66GOhSuv9W/ny/GMkVJJaBxHV9LdiW3lU9LnXZQOdnjS/8lC5lvI5G1UiH9z
	 npnOd1NGB75ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0A6380FF3;
	Sun, 20 Sep 2026 10:14:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 013A0371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA92040A59
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5p9mM1UDe4a5 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 10:14:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F3D664080F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789899276;
 b=mwt5pqSQDfxIv3YGW0sMaJbJA2g1vbje/1vAptY3isXkdW5+l9bqHmp0gkfs/2aLYCFi
 IaPF/lHddlY7KiHfXA6dDYTFjNq2Tte0WHocrEeNfVFUWWWOpTiMDp+3g4e6QDu1Ga7hb
 UHVKtOJu6gFmY2WmE0ypOIVHtslZZdaSfAMxc4IKNiJhWR/zcBTReczwHR1nVtAEIe+ac
 PYfcQ1S9Ve1AMLArm/DkOHrVaUdA7/fTL4A4U/3lQxvtWFBhnB1+2OZA74iMoryamCDJW
 pibqMwZA0zs//Iwt30f+3Ner2I8OO7IW2iRLolZi8CAZZZLCuRspPUOF47YmyXM0J3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789899276;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=peGpY37iZipb7Wfz1TZzG2GkeaXC1OOnmjHL7HsvIm4=;
 b=BbzCUJ2mvZL3yVoKPun7rAQh3wGpqdA9Ks/cMgDq4IbR81WuGvFeD2vxr1iNk+GfZ65a
 ahGLsjR6NhjolSNQCWJFL2OuJzIrQ3nA2wTF6qCHjLfFhBBQIK+jaXZ4YKuYCDvA6ZVi5
 yb6yMZ1XBqz3T9sedUJ9ZN72kHOaCN2N9J3kfynhNDge2P9JAY6giVTFT5FRxVpFa5Vzy
 Nj+hoXAyLdSCLl/yFSzgeo/jvyru6bGXSXzK/hGtybuOtMrQoUY8kvihsXifWCHNKVxZR
 qFH3dQ6iwjYUEHd+J3vNcZOmsoML6mKWoU20khYNDSJin9N6H+95k677t/78XAOz/pA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3D664080F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:14:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE4718DAC6; Sun, 20 Sep 2026 10:13:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 12:12:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f472d08d87dadb4301db2afbb72088bf573d7c8
X-Git-Newrev: 7198cea534ac197c9047143cb76df267cc42cbf9
X-Patchwork-Hint: ignore
Message-Id: <20260920101327.AE4718DAC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/common.mk: add optional hook to build a
 verity hash tree
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7198cea534ac197c9047143cb76df267cc42cbf9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Using dm-verity may be useful for any read-only filesystem read from a
block device, the new hook will build the required hash tree if
enabled by a per-filesystem config option.

To use this hook, the filesystem config must define a boolean option
BR2_TARGET_ROOTFS_<FS>_VERITY, and a string option
BR2_TARGET_ROOTFS_<FS>_VERITY_EXTRA_ARGS. The latter option allows
users to override veritysetup defaults, e.g. to set a fixed hash
algorithm.

In the filesystem .mk file ROOTFS_<FS>_VERITY_EXTRA_ARGS must be
defined as the value of BR2_TARGET_ROOTFS_<FS>_VERITY_EXTRA_ARGS
without surrounding quotes, because utils/check-symbols warns about
the _EXTRA_ARGS symbol being unused if fs/common.mk uses
$(qstrip $(BR2_TARGET_ROOTFS_$(2)_VERITY_EXTRA_ARGS)) directly.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 fs/common.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 2f3f8bcc7e..4b4a0995df 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -215,6 +215,15 @@ TARGETS_ROOTFS += rootfs-$(1)
 PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_FINAL_RECURSIVE_DEPENDENCIES))
 endif
 
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_VERITY),y)
+ROOTFS_$(2)_DEPENDENCIES += host-cryptsetup
+define ROOTFS_$(2)_VERITY_FORMAT
+	@$$(call MESSAGE,"Generating verity hash tree $$(@F).verity")
+	$(HOST_DIR)/sbin/veritysetup format --root-hash-file $$@.verity.root-hash $$(ROOTFS_$(2)_VERITY_EXTRA_ARGS) $$@ $$@.verity
+endef
+ROOTFS_$(2)_POST_GEN_HOOKS += ROOTFS_$(2)_VERITY_FORMAT
+endif
+
 # Check for legacy POST_TARGETS rules
 ifneq ($$(ROOTFS_$(2)_POST_TARGETS),)
 $$(error Filesystem $(1) uses post-target rules, which are no longer supported.\
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
