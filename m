Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770A9C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4217D40BFA;
	Fri, 18 Sep 2026 13:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2Wx54K20u8R; Fri, 18 Sep 2026 13:07:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 104BC40CE9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736872;
	b=M927IaJZci0fX8FigW+abbo2YKw2vgJpJZgQhHPv4FreWVZcB1nln4MY6uU+Vm4PSR5V
	 eYo3I4hWMTJsC3AUQQZaBIgQdME9L47xm0Jb2K6CSOdJIF7NVBHe0FtxT+7vyLWMe7gfI
	 zU3lHksXold0bZHqgdCYmkb19DULurbRUjjsDoPotNJ+oEa6bKPFKG8c+O/+wr2tABis1
	 n2Aly+XGp8+1QK5VdjlDsrCow23OvWgSWXGH/3f53r94GhbOcB1DhirUeoNSYeYshs6cV
	 AIbdPbn8BvitrJGf6uRUWQ1zED36X6+J7JG4pD3PNPV8fh182hdos6jbvsoVR+LHXFA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736872;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hI75UDY0dXclbpIUMtnavIBysKYUr1UiQgkrElToILg=;
	b=fDywgSnbyi5r0NnxpXHp07FOAAFONeAR9TrfSLty7tNLtdic7SBCisKOacgfzCH1f6qC
	 Z62qSsrcZNe+04aX6O3330uCYpN00oiOMt2M3LYzO8QskpFF6tiFVzrJSuDKnDVa3rSnK
	 Q//qYqiamp4xlLRzKDovigjb9CNj9ezMkizyLktxnIiyku1jxQXId+66k5N9zc3g/0yNG
	 /pLfr5LINKYb07SVyhN96fYHqUKU150ZSNlGtei8rpw2dSxrQwK0kJXPBAmpaOGOrA5Ww
	 IS95LvUhzgjVbMqbmfuVEM6/VqGttRnp9DvswAmqYBaDNmhcDGVjhOJHklDdht+UNlQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736872;
	bh=hI75UDY0dXclbpIUMtnavIBysKYUr1UiQgkrElToILg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=On+bKQfq+Yb3GB6JkdNB/mv13VyYqVZchkXmmINRvxyxXeBwA2AyUjlpzW2elr6E4
	 E1AVwAtvRm4P/Rx1UcVdIoUOiVCcX7qNmV8mSA5SK2m2x1dK3YQMuwKarkDIqs3A63
	 ID5sQvKnOEJG4OYYzQ9YxyP5YbEp2ZxXZKPj6/EjTfeVN2VSCcgwOfVYYt6y7CF4jX
	 VFjJYLCHOvlfy2vsL5M3sNFwWRHsssK8d1MvoRXg+ReBKX+ltld2AaqelqsZjMaxpP
	 hVG8o7JfwfaF2zg1Amq6x6sHsPzY27XGrqxURmEFyjn7FIU91/VgDZDwmgCn8h2lIc
	 5N/UnoffBW+9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 104BC40CE9;
	Fri, 18 Sep 2026 13:07:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 27F8CB0C
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 248BD60DA1
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id muNJvVxYgxWZ for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 409AD60E21
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736812;
 b=R3Aazm0kn2NOQMzmzpQs7ajUjFzdQFmL6mFM4smfM3VdTZwln21iaA6F5Y78al3rWm8U
 R+OiFrEO25FCBZVCSiAc6L2Mw5SVZaMNa5ZJz6D4nKShwouXZPNuIP1B+7P85Uz0Dk6kk
 ZAylbjCGUGJP9WdvtfMKgsiweJ4bTMkQOeYv99qkDCvsMzFaF7eKDhlsDaSVJLMFrzeuK
 z6vKuyAJbq+5JqDVFtSiPfzIBF96GJbmb2ONgkqdTUl6A8I5PRYKb3/Lx9rJBEbX2Ccxy
 eSBdGWlBHIFN2mGWXkf5hZMh56VGadn18rfH+dV3NsFPZAOYDOBRXhGAHp+jUKEG69A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736812;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/Cda7JYKgNXQ4hIZTdeBeCjnNbg05XHhgFac2s7oRnc=;
 b=C0tC37hhBe0Z7uUNWJuNLpEfPg/QfMqMltcmKB2uUTZjLcKK9CyANJzTkF2cohq9HeHN
 MmU5WRclDgfH9x71OjbXDDarpfXRNdQ9u8A52bnAb9eGp8qY+1N9lRNo030XPbMv1ndnS
 OlSlodUXkeEtG9YcfrtVCTzuy0HwpvFd5+XwufttbmITONoNZN/+PxSvt/Qlac85Zvh9u
 XuJh6SyfySPlhzWdH+KKpLf7ia6/CUGQe8eJ0RnscENie34kWOgPbtZermtBSX7IEIxSK
 5p7c3snr6+sIte8rygSB8fMbaI8DDYnG9uv2QRD/8XDrE3j/phlvvP8cIKxqqOc2Ggw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 409AD60E21
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDAA89718A; Fri, 18 Sep 2026 13:05:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 12:05:30 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: dbf1a06be76ecd6aed07e066c63b467b4a27494d
X-Git-Newrev: 31e728d32a057c71622e7347e427c1a3b3b63ee7
X-Patchwork-Hint: ignore
Message-Id: <20260918130544.EDAA89718A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/*/Config.in:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/31e728d32a057c71622e7347e427c1a3b3b63ee7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
