Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02607CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A31A060616;
	Sun, 11 Oct 2026 13:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Onv8Mmx4njFj; Sun, 11 Oct 2026 13:27:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CC6B760617
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791725228;
	b=I2Dfq96bGYyj5bFSyXDhs6m5ocGBPnZhHvB58aah7hyd8RKPDeayjas59aKB3ueB1GYF
	 erhOc6qOv9gbRBse/LB88IkbL6LuuPvsuFCg1utHThUflp3RBMKyuXGr57b3ATZfS2CIH
	 s08VqBgzc3HbTNXx6BtwWns9odtLCkd+cQwJtrM93szilpFE4iw0f2HRrzrllIXwL9Lmu
	 8djCufbM/MCUeyreTAsDgL7loQfs4guz+mc01ebi9cr1rzVyZ/Aotk+MDzzDcXFDfGYmZ
	 vcS8IQ9a1faNNQ+AxhTPi0AadAf5j9KB+vUkPMofPuwMPcnGoKxHNjooMw3Fw/SclOQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791725228;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3AeK3MDM2cPWnTgAtIE2CEKz/W2bSqHipV4tJKQSSHI=;
	b=IB3JkE42gMlri3sRZXdHVIUhwbu7I3QcqjNV/qzFFuvRiMnENzMJB7/OTbsbj9yygDH9
	 6YTHOLDwiK64uJOuhpU/mgTh/2CqnTOLbvMGsbNj/UdxFsb/krz/vCfb9C3N90xHPv/PH
	 btXIBPDf6iQAn1JDp75D+MbACN068g4RDLG+irKlMYH/dAzTxfn6kk6aLU6n0nJIeTHxG
	 2kvTTkAXa/RvPMwxaZnJaYkNN6FgfbqVzrKYXQAVls4NAHJOWfLU85EJ29Rawzs/PSI/K
	 +vdP1OVRIe9KqTzxyC819eSprkoyX2xO3olD69xRfe1j5kqcfSGlImj3sJ8eF4BVO6A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791725228;
	bh=3AeK3MDM2cPWnTgAtIE2CEKz/W2bSqHipV4tJKQSSHI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I6A2Xv1jyfFCjL235zu5u+KdIINGK2J5cb2hbpOVjdLN2cZrW/cu6GDEQ5YMyj0yK
	 2MJdfZQKYVWR1bkCBJpCyhd8s2W2aSNPdwSBiWa3UKGcRaFD0ME/OM0PqRFUGa5L3r
	 DVAyUmEmYFP1cGMWDD0mrkwhej4q6ZxI8+dlDezCEqE/tjGTWwKSM26fq6fxt+auba
	 HB4T5XonumEQj5p3vDzT2ur66BzNthz3O+qh18zJhNHQ5a/yTtU7qGNiZ05ylA8lbI
	 IP9vWdaL+FrN2J3yl87Vs4cl1k5I2lnB0QsBctlxGHYjChe9f/0QunVeSwR/GwZgHU
	 ikWxbxvrQ2PeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC6B760617;
	Sun, 11 Oct 2026 13:27:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1400C1A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 111D740071
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44kiqE8iNTRs for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:27:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4E4704002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791725226;
 b=bdTglQ6rKnCXmz0jrvPvxXPksKP1UlWl2vQv5eA3vIqSeEJeoR2JsO5VFIrJ92jHKgIQ
 vFIfDGNZv4buQavqcdG+dwKWFygJtXhUjZl1wrgf7SAgHbizdGv0E4cwjqnZHqPhXjJR2
 Q2YYohAzRMoDKhRl/knGTHnPfO0gny4zF3FjR0ZCZKqCASae2ILqrMyGajAkiWkqlJA1j
 vNLX/dtKPc4Hw3+ZZM5NLRY+//qrltXkgQzV2P9DRmOfg4+eWO8IwTiwP5ojlWGpDWsgR
 r0/PxtoS3cEsLnYEUXgy+z+VIDdGITqroiz1dmZH/22HYivpX2D/b0Z4di5kByFOlrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791725226;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8t6y6aq/OyFp+0lQstxRl/nKXSbledE2qB0tEGDF5gI=;
 b=MudtWH1onDGYRsXNeOYBkMebJLmdlDBI7lzOVkkU+/SAGlg6/kfzRVBltWUKMw8RUdyn
 z1bNnZ6JV/zfepAOIQ0Styby5O+EBHSeFEjhdgjnHCArVgD0IUOFfOTzKZxcPf9d6Mu5X
 QbYGkt5Lwn8MMtEduHiBBWL4r03BGYHbQ30ETCw6jM/BkjJimAFxXZZs2vgOxPVVg2Nny
 p8lVIsCdA7X8vt1ZTI0tkJXdlcMbfpiFl/15eEC+Z7rTPT1ltNihjJpvC85FKiKUFgS/f
 GfyvTJi9U/NSsbO7UzWl7Yy2C6xbxnLvvyhamRp+BZS9/fxQIaLwQW8fbdJYWmA22hg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E4704002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:27:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 944E592243; Sun, 11 Oct 2026 13:25:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:19:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e8705263cf4592d8c02fac71803053e17d4f83b
X-Git-Newrev: fa668003c0fdf5a9a51203ced70c715cdb841605
X-Patchwork-Hint: ignore
Message-Id: <20261011132547.944E592243@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/{orangepi-zero2w,
 orangepi-zero3}: set the hostname
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fa668003c0fdf5a9a51203ced70c715cdb841605
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Give both boards a recognizable hostname instead of the generic
"buildroot". The name is used for the login banner and sent as the
DHCP hostname (option 12), so the board is easy to identify on the
network.

Signed-off-by: Vladimir Savelev <anykey196@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/orangepi_zero2w_defconfig | 1 +
 configs/orangepi_zero3_defconfig  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/orangepi_zero2w_defconfig b/configs/orangepi_zero2w_defconfig
index c2030b05c2..b5702e48f0 100644
--- a/configs/orangepi_zero2w_defconfig
+++ b/configs/orangepi_zero2w_defconfig
@@ -4,6 +4,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero2w/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero2W"
+BR2_TARGET_GENERIC_HOSTNAME="orangepi-zero2w"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
diff --git a/configs/orangepi_zero3_defconfig b/configs/orangepi_zero3_defconfig
index c6aa9c991a..53c542ab1e 100644
--- a/configs/orangepi_zero3_defconfig
+++ b/configs/orangepi_zero3_defconfig
@@ -4,6 +4,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero3/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero3"
+BR2_TARGET_GENERIC_HOSTNAME="orangepi-zero3"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
