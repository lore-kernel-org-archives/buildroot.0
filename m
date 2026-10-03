Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295DFCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0C6C60DA2;
	Sat,  3 Oct 2026 16:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7yyikjp3GdL; Sat,  3 Oct 2026 16:24:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AA7536068A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791044675;
	b=jBdiexlT+603HlvKy0+CW1XGAB6uH3QnruW5KRPPG126f6lnMte/ZRNgS7KT5M9fLKN9
	 Kk4oNtATIH7v4zLqJ7e8aMX2Ff73nnBLO2CosvDHSf7lBMwQaueLDpvgWZPBfMDwjvZvu
	 85FytwQZrUdY9jbCrFDFm3aYKwgP+o5zeuWRRLsowdz0/8b3Eod+OF9jGHlU9p8Qi/IMX
	 v+1EFbwPr8bXKQzbJhPX6+FjMyz7vFJIv4pBt83WFq0tLKH41qsw82geGUYMT78TvbuQU
	 S1T/BtmjN9GBnjSe+bbjRasav6YQ+cyY3dUqnZaNkvfYs8ahWmOIrerHhKRQYDSZbKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791044675;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zTZLjroDk3b5s4cXOMSSQA/ce3KdJwhy0TxpRBIPDLM=;
	b=lO6Yiq8PRQMDdwxgOBLBt+enm7X/GtGypzJujCVbyK3oM2GE6OGmyB5zg5HF9YKYWjt+
	 ZpMJ8wZC9uAYL0Q5E0SWcxs0is8dlceK7m3zBKcQxr0faqfIL3ZrOQrctAS4rG4pqsXdL
	 qlbD6Ktzyb49W/dqWItObw6r/5vlUqXw5ldaANoPoUjAPA/oRgqEruI6R0Cvt07GbMGFI
	 F4L+Cr2jqYbm4vDJvHSCcwVeNBj0jGK57eMrpRfLRgu7QK3fvzBQ6+IA+WI1knl5N3Iiz
	 FeB7aAwie1T+DL15ro8z7dwVktCS0bYEb9qjflgWSgnPJ9Qs/P/q4B8Sy8LTgY8eZww==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791044675;
	bh=zTZLjroDk3b5s4cXOMSSQA/ce3KdJwhy0TxpRBIPDLM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hJPVJNKVkvuS8SMMW9T9XDVCdEoXKL7rRj49mZoy+eOoV/G7F4YSkjSeHoBNFI5Zx
	 TjdZPEPzeZOOnrHTXw6rQDGl2D35oyOZ3lxLTLQ4dA2458EiotS8IIXfZH1+lC+gt6
	 v+O/dQNLnJwFvxSEKHI6+/vA+9JskSYu1x+DO/7Yo2shLgigvtxVlg3xB+SyLDW/fr
	 yAQt/hnaDAQ4iW/dLZgFsiRqMHU7/D5BeAYgTTRYKrVzfGbIda2kLT1yn0JTkjs5r6
	 W8M0X3t2Z7j4dFquRlf93ABYQ7WnMMrRlYskIcZHSBi+VjSGozDA1SdggUrQRXDYB2
	 1f3qRuGxvA0Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA7536068A;
	Sat,  3 Oct 2026 16:24:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E1760335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D341B40048
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcLxb2f2hn97 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:24:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0408440024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791044674;
 b=F+G2fy/OGbdeR31I2nOjykfGQ52+pvhWWTzSfJ1yBzaluGWmNK+QjnsXd6FW1jBg2JLl
 JLaZ759KglgRv35tpYtFlE8ozsjaFQeXjX4zicK0eA1w9e8+hWY4MC9X/uf2AuNtCOwsS
 CnKEi1uBsHyLtjfsvT7ELi4NadLTsim2/BMww+m19OVWiCucs1PxcZ7ekd8XDaXcoaObf
 fHIdoH1QB4vzAfZvQ0hBt2FtMj/PjFhd6t2bgr6oBjk7azwBj1UPy7LciQdh/u2SLyxz/
 PZoIlLFHK54SUweS23B0KSsIqH7msnOth1LGYAoFWIohatzsXXt3ZoR+qN8u46ma6dg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791044674;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=oKCLggJHG+gtfEKiu47ZMSli3QOTjfjBxop6jXyo0iE=;
 b=ix9fVC16fVkRz0M6VPzRKyYHacbZSc/xJ5cshZeWz/Eg0lmHT3qg7SRUGk/0zK4f77lU
 E5nmB1Fbx2abfGmPLZk9QvZdJHPjcPIUsrpsShQgA2PZKtNe6P2a9WjJ2Fs1Xa231R3Xw
 1y7x/X8aGgxrLskPb6QRhBoAcBLtbJ+7uw80hCEMwH8Ae7tkKPnHu75Dh+e9faHtIZHyK
 S4CaIy9tc/8tVNaMBXH5RAqodDxGa2PpbeAOc/B5XfxFcY73raBCsFVSoz+phyC9WASKs
 gvmEKhwkv+l331dVq1LzB8gYvu4XM3FpcThVBD6BluHzUA/+t+6iwoGY6K8i5QnGSkQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0408440024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:24:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21902886F7; Sat,  3 Oct 2026 16:23:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 18:17:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ed738bf5d3cb7a3184a2c4e4ac61258fbe6d012
X-Git-Newrev: f6c2c6a086ae1a5857f99514324ebf4038dab31a
X-Patchwork-Hint: ignore
Message-Id: <20261003162319.21902886F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eudev: bump version to 3.2.15
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f6c2c6a086ae1a5857f99514324ebf4038dab31a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- bump version to 3.2.15 (for details see [1])
- move group 'render' back from systemd to common udev (see [1] and [2])

[1] https://github.com/eudev-project/eudev/releases/tag/v3.2.15
[2] https://github.com/eudev-project/eudev/commit/dbfd3002979539a3dc9a1f20250e3229b048d090

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/eudev/eudev.hash   | 2 +-
 package/eudev/eudev.mk     | 2 +-
 package/systemd/systemd.mk | 1 -
 package/udev/udev.mk       | 1 +
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index c41bf5992d..0e24957621 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8da4319102f24abbf7fff5ce9c416af848df163b29590e666d334cc1927f006f  eudev-3.2.14.tar.gz
+sha256  eb69809fc0d1187f2463ab2149c53aa9f42a78e59f14ebea68eae6cb6b4fc1c3  eudev-3.2.15.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index a060e8f0d8..0deb0e53c6 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.14
+EUDEV_VERSION = 3.2.15
 EUDEV_SITE = https://github.com/eudev-project/eudev/releases/download/v$(EUDEV_VERSION)
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1f1b5823a2..52c434b28e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -700,7 +700,6 @@ endef
 define SYSTEMD_USERS
 	# udev user groups
 	- - clock -1 * - - - PTP and RTC device group
-	- - render -1 * - - - DRI rendering nodes
 	# systemd user groups
 	- - systemd-journal -1 * - - - Journal
 	$(SYSTEMD_REMOTE_USER)
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 21c1a71f5a..3518e874a5 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -8,6 +8,7 @@
 define UDEV_USERS
 	- - input -1 * - - - Input device group
 	- - kvm -1 * - - - kvm nodes
+	- - render -1 * - - - DRI rendering nodes
 	- - sgx -1 * - - - SGX device nodes
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
