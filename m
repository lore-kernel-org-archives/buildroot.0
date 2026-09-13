Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B984C88E40
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 09:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECE5780E47;
	Sun, 13 Sep 2026 09:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uxXwKWbMU_N; Sun, 13 Sep 2026 09:27:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B6B4480E57
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789291661;
	b=YYCxt7A/b4I6QtCPKdQ4vmQD74u4J/YxxIkOtqf9WY9pvOPVSunAl9tZi6cXDW1kYRD8
	 fKxGlKTSxB3ZoMNr/iDYD7dSWXqkI1fIWNuGCrCGSb3an2rVX4+1aygaTN6KFc03Tyv3b
	 yUPXgi+8tIg4aH6IaL3XiXNk1exDZZ1PicB4dyK88tpt6F3R0Eo8Z4+pBURFdg5uMakCQ
	 ZLtLvRAZbGOIE2lG+37HAyrHVsdXl9WtjOFpX/2gS+RTnNWvmpg6xYFAq5VJd8LJYG+Sc
	 T2kpvr+dag67gkJoTakgujLFrvan2i9D1gOARKOwvGSxCZrHkRw7lQz+wKBz2vnhUCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789291661;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3xXsc8qBzMR3ndHsNipPLzyfw2xSgd1Valxwtz9UEW0=;
	b=mP1671gTz9t/TnK5uBVW0rtMynnbFwWk0vn/Z8RzecSymwKK52/MbQm1FlQevl9APxQX
	 r/1AoktdP/KZWPeIYdkUtfsekRJN2H/+OmjDKDaxggO6D+dS/oe8VsXydMaa+F7bdFazm
	 UrObWHMQlNMMdO8ktQ5L+6gyFi0+rObH0ZkpJcIL9Us/oNmaMtQwDaWnTCAyvngKH0Kd3
	 +rPWwZWhnlCIjhMxWuiYq88+Rg0g/ataClZmEbHBGHTAHKkrxZSewxEqzc/dwGNwiHMYA
	 yIRS+va0muMQszjiGCjKU67JQZM1e8bm4jecXypMwqMUu9xyiDbcTeGPaOkaC+0HSoQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789291661;
	bh=3xXsc8qBzMR3ndHsNipPLzyfw2xSgd1Valxwtz9UEW0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gYtY82b1y5bs+W4YbWSUf2e7VJHXaNc0d8l5h83MmeTsLFcXwH7J4XZBoGDlLdO8v
	 Nw/Ag5YUh8xkF1SO3CgAGNpnGvZvqUbthpNV7HmtoY/C9MpAlUKSNljb8YOFqzsghe
	 fLrSa8LwAsG/2RlGkk8vUYEvq8fkvE6dkmlQL7PVzi5TXDyHpBWV1DdziN3xsnyVJT
	 H+sluvP7IxNXD3q0pQpAAkU0G069Pbl02Qp7NY8cO/DCPH5IJttpU9HpTrCvUWoQyb
	 +AJHPb556931eXrnk56IfMEpvvPhPFmU3lz1CaAJceawp1tGqmb9tqGeHdg9p5hSJg
	 EFDBQrx1Gniig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6B4480E57;
	Sun, 13 Sep 2026 09:27:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1481023F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 066EE4062C
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gnU_Pdea61dZ for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 09:27:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 203D340608
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789291660;
 b=AUm0RILWgBpnZMlTGAkYoV+ndW4gU4M7yX3pI9RSRbqQw72CjTTmcA0zL0eU/XLIx66K
 DifmnLUyq2QY1yWvV5iDu9Bx+Ais9vCX3bAEvSHrO6uM8mgkswDg315SJpp7yD+Gb4616
 81hfZyRDWyd3GeRy70XH8rNJHaYpVVxkugRmq3brBYebBOPK9CdUdEnpUMg3dsvuczFCl
 DOVrpJ+M/Fo3/4OGyZWX6x62ZealvWbSKfIsROEoV5y3vxf7wJj3jk+db+mvH9BExO0pv
 59+zWeoEPadG/+mCXbnraSYhBvOUeMHJ+M6UcAWOk+vqokx64iX14gQtoyVdGYNFHQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789291660;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=y1Ldmexz0hIHYI9Rh/PLCitV3YCFLqpXH28ZtG4YfvU=;
 b=KxrhfzbRPuJEZ9B5JN4GkPzNtASFmH+tYKY4RDLaYpnckSgFpEiGUfMa6PdoS5t5BcrB
 OVtc2x514O2KFEIhaaPLD5UepWw7uODqKUXM3UUzSqMK7qYJTRDNssUfq33nN4660a5f/
 DpfMiFJ/iwDKkIesCImRMIJRYk+iGvElyTP/ThR88mzEROgLg2uwgeXlUNj4blupmoDUw
 kI+1tHRNQ4SkqDPOwziln4eBrTMIXbnLOkrnHmfGo18EeyLOgUd230CpqT4UhDoL6iPDW
 Ks74eAn/DLMQCRHuLC/ADibqoJV+V9OLzeM3HmHSIXlYiP4ZaSg03oz0z9FapV6avLQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 203D340608
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:27:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4ACB195B76; Sun, 13 Sep 2026 09:26:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 11:27:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f5620dbac2976973fb260fd78f9d76f0dc6fe66
X-Git-Newrev: 1799bf3680e3f50ff50b299d64c3c8ce533cf038
X-Patchwork-Hint: ignore
Message-Id: <20260913092635.4ACB195B76@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/*/Config.in: harmonize select of
 BR2_PACKAGE_ARGP_STANDALONE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1799bf3680e3f50ff50b299d64c3c8ce533cf038
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 package/bcusdk/Config.in      | 2 +-
 package/cpio/Config.in        | 2 +-
 package/cryptsetup/Config.in  | 3 +--
 package/freeipmi/Config.in    | 2 +-
 package/iucode-tool/Config.in | 3 +--
 package/libuio/Config.in      | 2 +-
 package/libv4l/Config.in      | 2 +-
 package/linknx/Config.in      | 3 +--
 package/rasdaemon/Config.in   | 2 +-
 package/rng-tools/Config.in   | 2 +-
 package/uftrace/Config.in     | 4 +---
 package/zchunk/Config.in      | 2 +-
 12 files changed, 12 insertions(+), 17 deletions(-)

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
index 00424af8b8..50fa2540ad 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -3,8 +3,7 @@ config BR2_PACKAGE_CRYPTSETUP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2, libargon2
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
diff --git a/package/rasdaemon/Config.in b/package/rasdaemon/Config.in
index 64ae4a8263..5e66bb55f7 100644
--- a/package/rasdaemon/Config.in
+++ b/package/rasdaemon/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_RASDAEMON
 	depends on !BR2_STATIC_LIBS # libtraceevent
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBTRACEEVENT
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  rasdaemon is a tool that collects all hardware error events
 	  reported by the Linux Kernel from several sources (EDAC, MCE
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
