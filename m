Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3A1C982DF
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1066260D99;
	Fri, 18 Sep 2026 13:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pfESf7d-m-2O; Fri, 18 Sep 2026 13:06:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E06F760DB9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736796;
	b=fIjwhSmo79uNl5WemSgaWxB1Qb60K1/oLaaIhibDGHJRY+RSvzHdMav06C/Ho0/kjtuu
	 Eznm5tV0hAFxUc/BwK/aCQI6BZa+MKtUQ9cIRtUR5xjfsiqvhXX+aMOQKDNpo8IcJWzKG
	 cqL4SUHhl4Cel8PeZHS68qwyKd/4Uk3hOAsia23x4Duqbu/xCsQhT3pozINtmt1E7mBmY
	 ufycsvuwl7QFcdsXz1dosMYW6TYGPZiZA4vtU1Uhvy8TeeVbyYRMCsNsoujmNDEvCT/FA
	 zhONoEh6PWTGIOIyX/cpj0q1WOq4fk2cqmMSBk1/V04Com8phq+LZwMTYMgsKev1XAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736796;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jQEjjkojDtqkWqKo5MbzEZOVY3gjl6cqmBcfdKg2zfA=;
	b=IgQJab6OTkK5nNaa9+kXDijROfcG1+OhsQJAP1XG2sMWUA9/8d9rZuFd75fbHNXYK00C
	 EgIh9ym0QxwOvt+vGbVTbZAcT21c5L0AyWH3eKMcRYruYfrCn/iId27cEv9q3slvzsp2e
	 KEOK4yhI0CVPss2LiHcCMlSfBXR8u7P36fLQHWGgM09jWT9Co954o+IbOaN5f0jEqJJ9V
	 5grLLeDS9djyes9GotCBTG3hdEXdxzeO3FBFsJuSuY8CFVVKNGr0EFd3S47xS1QRTjSUt
	 PtNvjV8EFZFueICimCjwev+4CSVS5N7nQDks7ev3Eh/66o/Hsqew/zl5/crtoki+08w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736796;
	bh=jQEjjkojDtqkWqKo5MbzEZOVY3gjl6cqmBcfdKg2zfA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UisevwNugMMUhkU9HsfA86MS+u7lwI09YjCDEu+TrXxbb+bjkAuREkygE74Pe5BbD
	 tHjvB9ds9D9UNcZOK05V2OEgHrmLvloM6zJzwLN/azRjSEBGh32mFVkzc0KgLe9hkN
	 k3AzfhQkeI3tYkQKaAtyWiibkSAN1ZPzGG0x/2GE6pFeVMJ69kDfb2pnCL9RDd31zR
	 mDXo+cRwsOrp04+OC85rRTaWPDpl3W9n3hjWZxCX2GxzlRYtTJ+nxpx1Mytk86BpWO
	 iFJuMEsAhDHapWOSJhnbqjx8G3bMg81o/6Y1kWnhJ5aeKpeZK5odejP57reaSEaipV
	 +AEwKMb1u4DtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E06F760DB9;
	Fri, 18 Sep 2026 13:06:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 350E11FFC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2779560D65
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_JGmW8pfd7V for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C3F8F60D71
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736747;
 b=C4U2WRvOSP2d6//8KlpUoBSeOss7mGSsfcPSS0JWz0v/0fUPzMBz+MDgdukRfeYFZAgL
 wf42/24GSAlj4/0bA1Wh5frH9zO9ROXNRic0qnu75GaZvxojBCrhy4SVytuKZOJtiqTht
 nSNYBqQJM1yOQmg3Xky5bcXl6eVR8BYyEaKQXL/o3icZY/vHOlTR8ScB6LxEFqCDC3pgX
 mvjcC0e9G7L4aTVkzIUmbyRJ5e1PBtYoyGe1dlODUyFFlK84hc837x9hggv8F7N8q1ThC
 GPDIEoCWb0aZOZr2bg88c9j5Rl/8uhji8lMXbREU2c33Hmb9ZN4vFsh+DClaWOiCrqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8fVdAiXVVfnHMPrdENvE87b0kH9TMrGlUBkxT3m61jI=;
 b=pXo/DjGSi64QtvqsGonIJWdJFsqTbXqH1gQ0bLyRy7CP9naFyCiYVvak58gGL7IXU7vj
 7M7FzCWQ2DElZhTq68Dn/EkUnn/h/WE1YI5pMauZQ1wSCxTO2on7Www39u1OtZz802yaL
 qItK1E26CHFsq/XY0Hrnb3e4qMJswt0KFQMir5Ra6Dg4MgqexA6nxjZiEsWdBlLg8+6JR
 DMA+UdGrwrF8dkgdLOXw5zrjRQRtb5XP+L2y8rmquFNsiGZ9aDmWKDCB6NT2YSx+bPn28
 5b/yiDa9z7ND+raIqUOFmnw7WehpWgc/5fYJTKoClHjq8TWGWtL0PtwOKV78hbFH1cw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3F8F60D71
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D15C9718A; Fri, 18 Sep 2026 13:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 11:19:12 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 650df664f0861b681d6c799ed78a1f0f7c3c6de7
X-Git-Newrev: 4d2f85fd017fbd0a260bbf1044bb606b15d8cdc8
X-Patchwork-Hint: ignore
Message-Id: <20260918130440.7D15C9718A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/*/Config.in:
 harmonize select of BR2_PACKAGE_ARGP_STANDALONE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4d2f85fd017fbd0a260bbf1044bb606b15d8cdc8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

BR2_PACKAGE_ARGP_STANDALONE is defined as follows:

config BR2_PACKAGE_ARGP_STANDALONE
	depends on !BR2_TOOLCHAIN_USES_GLIBC

Some packages did:

	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC

while a number of others did:

	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL

This commit harmonizes the situation, by settling on the first
solution ("if !BR2_TOOLCHAIN_USES_GLIBC") as it matches how
BR2_PACKAGE_ARGP_STANDALONE is defined in the first place.

No functional change.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1799bf3680e3f50ff50b299d64c3c8ce533cf038)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/bcusdk/Config.in      | 2 +-
 package/cpio/Config.in        | 2 +-
 package/cryptsetup/Config.in  | 3 +--
 package/freeipmi/Config.in    | 2 +-
 package/iucode-tool/Config.in | 3 +--
 package/libuio/Config.in      | 2 +-
 package/libv4l/Config.in      | 2 +-
 package/linknx/Config.in      | 3 +--
 package/rng-tools/Config.in   | 2 +-
 package/uftrace/Config.in     | 4 +---
 package/zchunk/Config.in      | 2 +-
 11 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/package/bcusdk/Config.in b/package/bcusdk/Config.in
index 8f9330e0d1..7131577eb2 100644
--- a/package/bcusdk/Config.in
+++ b/package/bcusdk/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_BCUSDK
 	depends on BR2_USE_MMU # libpthsem
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBPTHSEM
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  A free development environment for the Bus Coupling Units of
 	  the European Installation Bus.
diff --git a/package/cpio/Config.in b/package/cpio/Config.in
index 3ef0402c3b..f3637746d3 100644
--- a/package/cpio/Config.in
+++ b/package/cpio/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_CPIO
 	bool "cpio"
 	depends on BR2_USE_WCHAR
 	# Need argp.h support
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  cpio archive utility for creation and extraction.
 
diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index f36883ea47..3bde1b164d 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -4,8 +4,7 @@ config BR2_PACKAGE_CRYPTSETUP
 	depends on BR2_USE_MMU # lvm2, libargon2
 	depends on !BR2_STATIC_LIBS # lvm2, libargon2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_PACKAGE_LIBSSH && \
-		(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL)
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_PACKAGE_LIBSSH && !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/freeipmi/Config.in b/package/freeipmi/Config.in
index 8ef2e137fa..d4fda0e2f8 100644
--- a/package/freeipmi/Config.in
+++ b/package/freeipmi/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_FREEIPMI
 	bool "freeipmi"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  FreeIPMI provides in-band and out-of-band IPMI software based
 	  on the IPMI v1.5/2.0 specification.
diff --git a/package/iucode-tool/Config.in b/package/iucode-tool/Config.in
index f9f2521a42..d9c1120c68 100644
--- a/package/iucode-tool/Config.in
+++ b/package/iucode-tool/Config.in
@@ -3,8 +3,7 @@ config BR2_PACKAGE_IUCODE_TOOL
 	depends on BR2_x86_64 || BR2_i386
 	select BR2_PACKAGE_INTEL_MICROCODE
 	select BR2_PACKAGE_INTEL_MICROCODE_INSTALL_TARGET
-	select BR2_PACKAGE_ARGP_STANDALONE \
-	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Intel processor microcode tool
 
diff --git a/package/libuio/Config.in b/package/libuio/Config.in
index 97be1e3d57..6483cf7018 100644
--- a/package/libuio/Config.in
+++ b/package/libuio/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBUIO
 	bool "libuio"
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  libuio is a light-weight C programming library to handle UIO
 	  (Userspace I/O) device discovery and binding task.
diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index c88f280c3b..5d82fd59ba 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBV4L
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # media headers
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  libv4l is a collection of libraries which adds a thin
diff --git a/package/linknx/Config.in b/package/linknx/Config.in
index 3b62ce2f95..1cc5248df4 100644
--- a/package/linknx/Config.in
+++ b/package/linknx/Config.in
@@ -3,8 +3,7 @@ config BR2_PACKAGE_LINKNX
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # libpthsem
 	select BR2_PACKAGE_LIBPTHSEM
-	select BR2_PACKAGE_ARGP_STANDALONE \
-	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Linknx is an automation platform providing high level
diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index 7f08fa25fb..cb4034697a 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_RNG_TOOLS
 	# pthread_setaffinity_np
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # libcap
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_OPENSSL
 	help
diff --git a/package/uftrace/Config.in b/package/uftrace/Config.in
index 8f8c5d25fd..6ec2761fa8 100644
--- a/package/uftrace/Config.in
+++ b/package/uftrace/Config.in
@@ -10,9 +10,7 @@ config BR2_PACKAGE_UFTRACE
 	depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_ARGP_STANDALONE if \
-	       BR2_TOOLCHAIN_USES_UCLIBC || \
-	       BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  The uftrace tool is to trace and analyze execution of a
 	  program written in C/C++. It was heavily inspired by the
diff --git a/package/zchunk/Config.in b/package/zchunk/Config.in
index 11463dd4bd..2f80c25a8a 100644
--- a/package/zchunk/Config.in
+++ b/package/zchunk/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_ZCHUNK
 	bool "zchunk"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  A file format designed for highly efficient deltas while
 	  maintaining good compression.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
