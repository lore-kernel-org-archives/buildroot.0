Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E61C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 21:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D9034068E;
	Sat, 12 Sep 2026 21:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uh4TwhUZUCTS; Sat, 12 Sep 2026 21:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B181640699
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789247896;
	b=A+2Klgzeifbe4PkaDydpegsGuU3Srl9dLCIRgzAh+deQ9tA3p+5ATzc9nLU0rT3/NXoJ
	 ZjGz3U+quBodsPUeGilLhcf6pLqe+moZGKBluG2DiF+yIx4d6wI0GAk9NxQ9lcDNHC7Ke
	 NXish9s0GDJsppmn3NDyVABjgelLQWk8OdKKk7e4bTZueQgx4lQdAvzPLk9udBsnu6Q7/
	 xpw/ZJNpe8TrI1q3AvLJAo0vvqlWr9h632Y/ItnYta0mhQh2r3/zCZ6NsFqYeFXxQPF/N
	 IRP3bT/Z01q3GuGv1oT8Tcu6jPdKHXc0IclXfjfNUhxM1IbKEKYA/87gVZKq4ozpHSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789247896;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=4RZcWwae8em/0DJPDeUsjsorpq9og/HaKu1ugenruz4=;
	b=HcrebmMRJC2y2PmEKxFF9LDn0FsAlCOQNEF6VONlOse9excyrJ+NMDry69Rb1p55FDny
	 ozVLhYxjD2+jkqkikm4saMhEALd2Ct0a+1QRSqKbxJMIbFE6FZAQhu5LhZ+gDR5m7NPEW
	 96tSEk7FEHDuL/v2t6eHtdgKJcWoPYrGCVmkigS+asri8ifjR76EVjhOl/qFG7mhqhGrw
	 4gzM0EONrotbZrxsnph2nvsNb6yRBDvN8FfXxbnxx3vF0A784ewyCLjTR0ziY84f0/MOW
	 pjm1KPRMYBHF+Po6/9oy0IAlGQ2GV7xVkPmynqfdJxzw9KL75B7LEhQKlnmuHJJrclQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789247896;
	bh=4RZcWwae8em/0DJPDeUsjsorpq9og/HaKu1ugenruz4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=i4TtCduUmPrBeVHwI56RUcIlyfohO8WQ0C/PZfzrfykUgDINaDqCMbDPI0Q4vWClC
	 wW+4xQgguT0PNWttOkAEOf2gVG5FrZRDOP/elE09jJYqRxtMMz1GmueV/ni8BTZ1F5
	 DEhXlDCB7DSKVTsJmSU3EkB/JJkp3lputhyAyWT1GqDmZl9TIPQ9VEYcr7dwWgdJQW
	 B0cc22K43pYY2jY1wqfgpc0A4IY04AK6EIdKTJj5rpA0Ann96RQ2atoEixq4WEUSon
	 R38b7trfFpW2m2/9c4fTzWqpnPykottVzdZ+VLQlyGChkLd+bckzTxtGEDke2+aw1W
	 QF8wAfmuser1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B181640699;
	Sat, 12 Sep 2026 21:18:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BB8C701
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E6F540070
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0gPxo1ojPid3 for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 21:18:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 601F740067
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789247893;
 b=N6aSX9YexYDNn4Wiov0I3M2quotYDtfhM1aad+xLK3A0b4IXVkDvoyjGxQc/cQlWgzD8
 HET6d8kc1OBhTsMoV8TLu51dJOU1/wMh0Bq8rx9IYbzcePrqwDgdlEO2/+NU/3z4/oA5t
 p5/+4sEo0B5RwkS1F4QKomfmbLwjdXcReOqZc/RC/3MHWwKDItfxJtIXS1Tp0ljWh5Rmf
 DQev4teHiX84R2Wyl7g+NxO/yGwxkgLkM4LMxKfeFy4exmdEYdL0yWnlMMFH3uRwwPjeY
 YxnIq3/yuGHfksIoyV5BHspt8eNQjquuNe2+1nlnWEcYE4m9fA5VlZ/u9u5RNfzy3wQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789247893;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=/tglfbju+vZvnlJxaTnow3sNyUUlYT7xK3Cy9JM6DZc=;
 b=pU2/1Nfblz6HEBs9KsX05Q/wGrFk3HXExwGoMtEDeT9XoEXpPgc6LKvHZMNm7NjoILHr
 Euy9uWGcOvoVjwDe6BwzyWOS5SFAKacAhuy0GGAIllZNdr0TL10vrkWDwrGJoFWEIpKNH
 hyghIW/1aOPmqa49VATY4CbHSHRM5CHm5rbUJFthzVr46lm0McyGWgjhTqBfukXsdOcUY
 a0vC1MG2bNUxcidmcr66Q4ExhT5Vh8DbesQf3JHMQ42xd7jxZrGEirgrKW4zXihcBBC9w
 wrffXPp3yollAPXihsGu4f35AbjCtZCSgJjWvLEsQPUd/uweCABc1jmaiGDVLCygbNQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=nqM8pr8N; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 601F740067
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:18:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 81898C63449;
 Sat, 12 Sep 2026 21:18:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F18A960580;
 Sat, 12 Sep 2026 21:18:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8AEB911C7AFB3; 
 Sat, 12 Sep 2026 23:18:03 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Sat, 12 Sep 2026 23:18:00 +0200
Message-ID: <20260912211801.1557569-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/*/Config.in: harmonize select of
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
