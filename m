Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE63C982CC
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 10:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EA6E60611;
	Sun, 20 Sep 2026 10:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsOuGwRg2Fox; Sun, 20 Sep 2026 10:14:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5DEED60622
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789899280;
	b=pgxSp8CRSOEaP93NRjDOWHPPjmoeusK5ZljRjUmyUo3wrUaNrTudN3aXtZoNWbJOy2PN
	 zqnWrztE7ZHTDtlE1zAV3QfLHv621RV1/VXPYsyNN3yfe7ZCW3Aqtv/Ic2K6goD5fKRCw
	 32cJrGwBLkdaCeO6snEGJASSIa7fOzpPkunVMvpY88vzIuAallWbphZIL+bcq7im1fxqt
	 ieuGbAgTgcwfy67zcehgY/Gc2z/+lxkV9l/yCBe9liqiZ6mgI+hLBj0lM1wlEBHSukQe0
	 knj0jpMREMILOIYXsfxZ8BKMqSZ1s05z+//poGCTCRy9oR1WZZxVOUiJs7LK408h1cw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789899280;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5bKlfi5h0cuvCYtrsT7Pa/tRcA8TvVdZxN2oIZhRT/M=;
	b=FQb8oHczko+mLVN0qXg2l1+2GEH4iJ76eUBSDWiBD8Wyn4R8BTPireMfn4g8gGUAb1kn
	 cguxc2j3S8noezn0DXwOYV2bIEPHIa1AaPldU/Whvk3irMFcGSJWKE89L3sB3eJEn85wx
	 5HlEz8UbK2+is40S1f4GAOLrr2SCagtlekh9yNT9nL/irsWPMT6cIeu6Dau75WiaXOv3n
	 7uhEG/3RduJ8DNCWkKWWucagEEoZdfG/lzdZ6lOcJT6UxXAbOpKtvdz5uN6Wj0+dAB/11
	 +850pua+GDdP4Btbm7AqFdxOcocv+drmO69c9oSXwFldFSKTs2Qa41xo0ekv+b3kimA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789899280;
	bh=5bKlfi5h0cuvCYtrsT7Pa/tRcA8TvVdZxN2oIZhRT/M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JQ/HMdbHcdq975a9Yl9oW0RgPF6jVlWGtpAsC5YKAL4CbsbYslrVJQu06RAum52tW
	 0e9Nldy6Jew/W6vxPJPaob3VRw7VrcmdLHAgUcw0u+pvgVj42xRHkhlWj2EBs6j+H7
	 1HBRoA7rlvzr+NAiPhuKncbxtgEZABVXK9Rpmm36I16OJ8sAidxF/DyqYk1auJuBgm
	 Q0r6WyQSkrWfs4nezPoXdS7L+Z1HjPxKMwX2llN2TitJ9FLUp/btmir99Q+6zMuaSf
	 5SlT7f0wfaZwonHQzOvyLh+hgPQAME8bKzln1bGqIOyyAyik1p3ULnSleD/yWcXdht
	 iXR3AR0UF4LkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DEED60622;
	Sun, 20 Sep 2026 10:14:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AA21B88
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0C0C40062
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vD6q5RQENJEW for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 10:14:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org EE6204005A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789899276;
 b=DXai3WWeTR9TSKObQl45oq+Et5aiTqNpOXXSxIlgkxe556BJjarlFiQhtQ45Bog/A452
 QLj1CdvwcVmB/ynT3oX0Ggni9BfAYxS2vAqwyLib6k5+rqod7JSRcl83nc/BD1J3ZD1cD
 RlF4hJxsbMvG2snTmYnVEI+lqOcaBck62i4tipMzd3mZkTUpB/8WADNYnXt0hrxToK8fm
 trhrpOfpMkwiZShlsHiBmyrqoDd5EzbxWefAOPOyOFjOMiGBp8hUeDyt6FJnWd17zFXc0
 AUQUy9S9YXhvec81RRrzI+Dki3epBPQkXztH0A6wuOw8y9AbMeC8fD0MHQ3L2OP7IPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789899276;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=aTE32fK4vGgHKPlcL9cpdFN9yU7RXWtlMGfRIolz7Ko=;
 b=RCWFBKPZ3ubc56h2aLLXsbmElNjlZkyfaT6EueJ59BzWGTkyau6cnWt00A2zINnntlkm
 2k/kgNaNDvClG5HGfO4ObFz0/Q0KeckfiD9tLEdAayOL3jyOq5bsTuhmjZxllo8/2e8IX
 0LaCRTA8hxCpEJkhT7FxZBlgHvk63IxvuFe6Zn3hyyK9P3CjNZAvLC4TKRpElaPeGEK8l
 aCt8qJDAxKuExnqP3G4XwDttLZiSemjocEoGk0r8d5BWvkyVp1mIw6FgY43f4TdqfCIOP
 +3FPU3tOprFw9znwkT+h8JuFFJpkVEMSn6DUsMkgKgtrPZJwSHZOroRPteJuBI5AnPQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE6204005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:14:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6A818DAD0; Sun, 20 Sep 2026 10:13:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 12:12:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7198cea534ac197c9047143cb76df267cc42cbf9
X-Git-Newrev: 036f8558c4608ca2055ba56b74e7c2c416ea7c9a
X-Patchwork-Hint: ignore
Message-Id: <20260920101327.B6A818DAD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/squashfs: add options to build verity
 tree
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/036f8558c4608ca2055ba56b74e7c2c416ea7c9a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 fs/squashfs/Config.in   | 23 +++++++++++++++++++++++
 fs/squashfs/squashfs.mk |  4 ++++
 2 files changed, 27 insertions(+)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index cb2f5ec969..9773f5af20 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -121,4 +121,27 @@ config BR2_TARGET_ROOTFS_SQUASHFS_COMP_OPTS
 	default "-Xcompression-level 22" if BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
 	depends on BR2_TARGET_ROOTFS_SQUASHFS_EXTREME_COMP
 
+config BR2_TARGET_ROOTFS_SQUASHFS_VERITY
+	bool "create verity hash data for root filesystem"
+	select BR2_PACKAGE_HOST_CRYPTSETUP
+	help
+	  Create verity hash tree for the root filesystem. This allows
+	  setting up a dm-verity device for the root filesystem, to
+	  ensure data integrity. The root hash must be provided from a
+	  trusted source, or with a kernel-verifiable signature.
+
+	  The verity hash image will be called rootfs.squashfs.verity,
+	  with the root hash in rootfs.squashfs.verity.root-hash.
+
+if BR2_TARGET_ROOTFS_SQUASHFS_VERITY
+
+config BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS
+	string "Additional arguments for veritysetup"
+	help
+	  Additional arguments for the "veritysetup format" call. Use
+	  this if you want to set options, e.g. the hash algorithm,
+	  instead of using defaults.
+
+endif # BR2_TARGET_ROOTFS_SQUASHFS_VERITY
+
 endif
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 3b9d0efbbe..bd283a6be5 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -32,6 +32,10 @@ else
 ROOTFS_SQUASHFS_ARGS += -comp gzip
 endif
 
+ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_VERITY),y)
+ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS = $(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS))
+endif
+
 define ROOTFS_SQUASHFS_CMD
 	$(HOST_DIR)/bin/mksquashfs $(TARGET_DIR) $@ $(ROOTFS_SQUASHFS_ARGS)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
