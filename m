Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A47C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 15:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC85F405CB;
	Sun, 13 Sep 2026 15:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Do3MB0ugP7R; Sun, 13 Sep 2026 15:14:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4EB0B40576
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789312464;
	b=T1qW0ERNpMqGrgetxgkFxML2w65BlWPViZM7fmpKBhwTDRp05LsMSrH2mzEWab3gim7i
	 CyqwFsjTLRzFoy1XxSQR2Xav9g5oVKIvoc1JZPeRU8vJXS9H05zHs4J9NsG8jHut3wzmO
	 OjPVGTfMf6Ati2u3dy2T3dVzaKFvEQUS3Qr65qzIyARtEZKR1+t/7YBvLRaEAK2KD0SGr
	 JCm/9hiKNTfz4+1hpP62wNYg9FVUDh93X7sLlMdZIcnDO489Oi6fINNIXX82raaWSa8S0
	 iIc3OftGCMD3BwLKk0AEEswg+UIC9uNUziudyKKNUEouUA2Cwad5Q7UxfaHtWxW3erA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789312464;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FFRRY0v1bhm/N2DKIGezWyFO4YICjFyJVy8AebnoKp4=;
	b=tYg3qEtQCfR5qL0bWv896EoO2pac+WSFRdW68Jwzv68Kx5DO+5Cy/OMWQmQxYE/NIQ5S
	 45SQYmgXtk/cnb8JZGwLL1rfmggFM1GYChzGF1ArPF3JDEoV+y9RSF11QSP0mXT60ApQQ
	 gTmnX7laL157H7g5wpCDfmVJRcJd4rKL/fivnutF5shZ7wIXjfwju+FYny0C5exE7Mopk
	 Kht4zDOy01LuYnI9PJRH4YsR00npffp50+bvhRj+hD+q0rWa08IsGv58eDYRjFZV+ei8k
	 UWI6AH8Qe4dbaEgv+PjUuP+ToZtw5Nmo5rgL7wwptb4IpyCNW79Vk8QK6jRMfBQCPsw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789312464;
	bh=FFRRY0v1bhm/N2DKIGezWyFO4YICjFyJVy8AebnoKp4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pL0YjKjIpVFntXKDeqXiX2nYOh+7vk76Ap8ObEPhGNZ+4zdD0O3wM1sVVsTR1NXMJ
	 bFCEsvPy5i+ccxxNhyG1lctnEHGUHX17hWsmfDNKlUFqVrgcbd3aZL/mgHDzTYE8Pl
	 DLiYCh9fpN4onLmtNZ3i02xBscz/jbtFPQV1ZuK3aE0O+1Py/VzwucW3zo474Z7czR
	 D4Qe6UfDkJU5a1/+xJ2N2Bge4AFP2SWm1uXxgmrr81wzxmhHKFPbrx9Cdjm+boZI3M
	 gjMEcLyIXn7o2+aL5Mf1heK6WwQB9rn67stJI1vgFb+KLjoh4VvopV4kSFSerZYpxh
	 KWlYWpWKlNdmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EB0B40576;
	Sun, 13 Sep 2026 15:14:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 362733AF
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1323E605FF
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MRYIX-rSjFq for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 15:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0101A605F9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789312461;
 b=as5aQ5BhoM7z++kZIeOTDr87VqfwxKNw73cxxNmoG1+tWykIpkEvXdJkzZIOa7yuDbEt
 6n6yhKIWWDt/8VLx+qmS1/4qUhUBelXh9qU498zMBB4JokNQ7SljnaQplFGLd3e4sPgzr
 XK9Tpx9VnNsJEPwrlPi3VaOL4JPg6d7fYaDybvrZUqLG6tcdmC2RAFR3Yxa18L78hUUPp
 jUaR9aHDtAAm/Fd8Lxhiyytfh/RKIdv3hR8g30Y7DXpvR0g1JhwVP7PdYnLs/yR2iih+G
 KOLXPSu/em+3akWNYixEBcgq5FGhs063RomLrqDo3KeNcboJ3T1xGaYFEiKX8F0wVug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789312461;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=m54tPbQMfAuI+ug8+i/WFeOOBOA9gLOjmDdl4UGFRw0=;
 b=lF3TGrNxHKcxy77UyicWdsa95EguobB0mnSkCdIjbI8fo4j9XsMLFxesYIqmfvQMWVmv
 BX3yGLTD1NIvseQr4O+Q53lJDd2x/41IKn8fycUCT3B4jOgjqpt9I7HrsBpKSWVlQH3JD
 PslBvVlHrD3HFdt9b/M7LWr67XfiYjTwh8/6YX+Vugfrtoflh1t6VfQQyBFdXHP4u4Q8Y
 H3SwOcAOkGkl9MWXmZka9ozwRvX+PX6g0/4VQH5CabrpNChO36fDg0mI51skVYRcXZVof
 5I26wgWv/8LsXcABU5w7ITxe6IHzprfQaGHrwsjdozxUSbBnzIGXWvWdbphXVjV2paA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0101A605F9
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:14:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B04795C10; Sun, 13 Sep 2026 15:13:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 16:57:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0aeecbb88949b1ca0a4768750d9ddecdaba7dc3d
X-Git-Newrev: 74def2cdd46b44ede4d768026480291f56ccea87
X-Patchwork-Hint: ignore
Message-Id: <20260913151316.0B04795C10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hidapi: propagate dependencies of
 libgudev
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/74def2cdd46b44ede4d768026480291f56ccea87
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since hidapi was introduced in commit
6267f34afdd06ad848bbf7a2975cb279132b6ba0, it forgot to propagate some
dependencies of libgudev (which existed back then). Initially libgudev
was only needed when BR2_INIT_SYSTEMD=y, but still the dependencies
were not propagated for the systemd case.

Anyway, since e739dd5a11f5b2bd9648a45623bc174adae42b6e, libgudev is a
mandatory dependency of hidapi, independently from the selected init
system.

We make sure to propagate all dependencies of libgudev to hidapi, and
propagate them to the reverse dependencies of hidapi.

Fixes: 6267f34afdd06ad848bbf7a2975cb279132b6ba0 ("hidapi: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/hidapi/Config.in         | 8 ++++++--
 package/libmanette/Config.in     | 4 ++--
 package/openfpgaloader/Config.in | 9 +++++++--
 package/openocd/Config.in        | 9 +++++++++
 package/python-hid/Config.in     | 8 ++++++--
 5 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
index 1d3c86b677..fa44288917 100644
--- a/package/hidapi/Config.in
+++ b/package/hidapi/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_HIDAPI
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	depends on BR2_USE_MMU # libgudev
+	depends on BR2_USE_WCHAR # libgudev
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBGUDEV
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -15,7 +17,9 @@ config BR2_PACKAGE_HIDAPI
 
 	  http://github.com/libusb/hidapi/
 
-comment "hidapi needs udev /dev management and a toolchain w/ NPTL, gcc >= 4.9"
+comment "hidapi needs udev /dev management and a toolchain w/ NPTL, gcc >= 4.9, wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_PACKAGE_HAS_UDEV || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_USE_WCHAR
diff --git a/package/libmanette/Config.in b/package/libmanette/Config.in
index 873f8d8b0b..d4f45e25ad 100644
--- a/package/libmanette/Config.in
+++ b/package/libmanette/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBMANETTE
 	bool "libmanette"
-	depends on BR2_USE_MMU # libglib2
-	depends on BR2_USE_WCHAR # libglib2 -> gettext
+	depends on BR2_USE_MMU # libglib2, hidapi
+	depends on BR2_USE_WCHAR # libglib2, hidapi
 	depends on BR2_PACKAGE_HAS_UDEV # hidapi
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # hidapi
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
index bd83ad415b..80305f1eba 100644
--- a/package/openfpgaloader/Config.in
+++ b/package/openfpgaloader/Config.in
@@ -17,12 +17,17 @@ config BR2_PACKAGE_OPENFPGALOADER_CMSIS
 	depends on BR2_PACKAGE_HAS_UDEV # hidapi
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # hidapi
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # hidapi -> libusb
+	depends on BR2_USE_MMU # hidapi
+	depends on BR2_USE_WCHAR # hidapi
 	select BR2_PACKAGE_HIDAPI
 	help
 	  openfpgaloader CMSIS-DAP support
 
-comment "openfpgaloader CMSIS-DAP needs udev /dev management and a toolchain w/ NPTL threads"
-	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+comment "openfpgaloader CMSIS-DAP needs udev /dev management and a toolchain w/ NPTL threads, gcc >= 4.9, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_USE_WCHAR
 
 config BR2_PACKAGE_OPENFPGALOADER_LIBGPIOD
 	bool "libgpiod support"
diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index a7e068f10d..2c2f6fe7aa 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -16,12 +16,21 @@ config BR2_PACKAGE_OPENOCD_CMSIS_DAP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	depends on BR2_PACKAGE_HAS_UDEV # hidapi
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # hidapi
+	depends on BR2_USE_MMU # hidapi
+	depends on BR2_USE_WCHAR # hidapi
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_HIDAPI
 	help
 	  Enable support for CMSIS-DAP compliant debuggers (i.e
 	  Atmel/Microchip EDBG, etc.)
 
+comment "CMSIS-DAP support needs udev, toolchain w/ NPTL, gcc >= 4.9, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_UDEV || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_OPENOCD_FTDI
 	bool "MPSSE mode of FTDI based devices"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
diff --git a/package/python-hid/Config.in b/package/python-hid/Config.in
index 3a9e16c9f4..e46a5c2000 100644
--- a/package/python-hid/Config.in
+++ b/package/python-hid/Config.in
@@ -3,13 +3,17 @@ config BR2_PACKAGE_PYTHON_HID
 	depends on BR2_PACKAGE_HAS_UDEV # hidapi
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # hidapi
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # hidapi
+	depends on BR2_USE_MMU # hidapi
+	depends on BR2_USE_WCHAR # hidapi
 	select BR2_PACKAGE_HIDAPI
 	help
 	  ctypes bindings for hidapi.
 
 	  https://github.com/apmorton/pyhidapi
 
-comment "python-hid needs udev /dev management and a toolchain w/ NPTL, gcc >= 4.9"
+comment "python-hid needs udev /dev management and a toolchain w/ NPTL, gcc >= 4.9, wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_PACKAGE_HAS_UDEV || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
