Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D623DC88E65
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 12:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F853605F3;
	Sun, 13 Sep 2026 12:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuERADtu2jOf; Sun, 13 Sep 2026 12:45:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 48BFA60601
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789303524;
	b=E3vqhQ0QDdgv3au/LD4zCAwTlF5QkD2Hm5WwBng4WN+/TMVsunjNls5l6RP+ITNPYZPF
	 2pKDSjhJpP2ff20JjRzWXOPAsrlMWFFyLSLmfLg7NysleWPTo3THuKbGlj++a8/nrD0F2
	 PlLqHo8Gx8Ws0wI1yfOanpVDCL1pFW3xOsZRt7clYEV3rgS8uTrA9ISE+PVcf9ROaBMNo
	 aoXipLPspBjgfI87XQsLbh2bXdF90wGmGraJmKT3X6jA2JCRXVgju7o2EXH8Hc3H5eGnt
	 xz+DTAtmK/AGciXbog/5uas7N0vwB7kP8XNSMjFNAa66xjH7k1jXfMm0oQRgsDMZUEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789303524;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=T9Kxnv8y0npYNpLYS4IB5ry8Uwk1+DUb6+o6FR90UVY=;
	b=sUleFfZfV+RdJFA6No/w8TQcB08LjH1ns4XgiPCf7uAXljgeJ2eRTK7amd6blpePsIOF
	 9ynRzTB6mS4zrG1trhcJOFXYQBwPEh4vZBOus8N8m8mTzHSKqs/QvqojCL9cn4NXPUCOm
	 su1zWzIFtCySFup9fbxkZdFqbM6fKDAceYni32IIVEhu5tKXTjgsFXctNl6/wmL/yOzGg
	 Q5qXFWKYQ4fpHkjdtp+pez/MHNJIDdRm0AKdexiVWrsXeBuC/NU7+1KWkpx2qu175bjKU
	 1xgjoqPH5Cqyu+Rqm828rYprRPmet+dfc+j66ROglNOov8IyO3ckBXHi2+f0j0M3ZaA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789303524;
	bh=T9Kxnv8y0npYNpLYS4IB5ry8Uwk1+DUb6+o6FR90UVY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sl5BkzOHWAtO4yw4L2Xk+EMzeFrZl/PVmgy8oKFfPoehZs5AZEMVPCC/ucXYOVzuO
	 GCVVuzKuG7yUGiPZkAOR5y5n7HAMbtov/0xtEEKYcpkuCkBQDGkDZWPGfwsEtsEcd3
	 Vje9BLKGvkpKigdB25YeIQtUs+xzr4jRheOPbWyT3vvWrg07S8k5dB52xIs1FHVdHo
	 OJP094d19RX/Zs9FqSUj/9YDCmCE4X1ROE+zrtdA5aIMITZTmChf0L/7dE4uON5lHc
	 9RQMP6QbHpU1kh5H9z1Bc3GRO8B7JquX0IguZaeVIQU/YdQNOmA76+j7f7RSaGsZae
	 jTmWGY4sFRVtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48BFA60601;
	Sun, 13 Sep 2026 12:45:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09EC3362
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E41EB60601
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGyxHv7Mn9r4 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 12:45:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C7AD960600
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789303520;
 b=rmheukPAViddeLn1i2GrGDeyvescAbwEZNYyQ4YLvIqj0kcD2SrMSTg5EhJrHhpUvHj5
 hNaUspaW3tS6hyFY+LrV0zo8Ve2q22iuVAsivmObkA1JbIaUrzj7t2+stsBa5wzWgsaAN
 l7rp5l7nSIoApC0BzpcUK+T4zgUafUn7Ko/08ZpM65VY5/c+3KL0DviKy21oH6qK5X80C
 JjpgXbqrSNG4vAeUFTpssUln4mvMe0Y0j6Wyl2BhdijXGWWeot/OO8vzCbjKOurntGJfk
 KhOpobVhz44djv/za9stqUGNeJoGI4uN6guWeXHrZa8E/ooMYgr2wRRMY3aIWlyQjCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789303520;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sBxZKEG453WeqSdRwfkCEFtvznuUwD1aif3HWhGy73o=;
 b=STgVyPA0YLgW2uHG5lGail45XxJmUeK8L7zYRCbTYco3pk+dV8tZcPNn/IcrsRPgK294
 aUaAV2NVB4jc4lepGgrNfqWMTpe6/T/X6Z8dUvXl85zv26HdsErEv0AoZARUOGnZrOWZu
 eeMnECj+OiHPO0S180OeT0Ms889cBclmmdkVztnK3apwj8ef0pNP0R7yKdNdj/nt4Nlf0
 MK8W6VQcDE3lOiBveRObH0xASNKNjamTtDHkdWOneTWIRQBn3MdG7nJxYFPTKHr58hOeK
 BGWAGRcabgr91GlgpoAdvYdGMIFoR9indFAKF9fjbCa+8dpptaTKFJ2GeKrPUFzN9Kg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7AD960600
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:45:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C894995BDD; Sun, 13 Sep 2026 12:44:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 14:28:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6dc29e431fb4105692cce08ed48eba2fe4a6e03e
X-Git-Newrev: 0aeecbb88949b1ca0a4768750d9ddecdaba7dc3d
X-Patchwork-Hint: ignore
Message-Id: <20260913124415.C894995BDD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atf: bump to version 0.25
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0aeecbb88949b1ca0a4768750d9ddecdaba7dc3d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The removed patch has been merged [1].

Since version 0.24, a C++20 compiler is required [2], so add a
dependency on gcc >= 10 and propagate it to kyua, which selects atf.

Release notes:
https://github.com/freebsd/atf/releases/tag/atf-0.25
https://github.com/freebsd/atf/releases/tag/atf-0.24

[1] https://github.com/freebsd/atf/commit/67e7d350a15aff88c151b1fc838dac83d35be955
[2] https://github.com/freebsd/atf/commit/35134a317cdb486b4e7c0cdff20d1084d06159de
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien: add link to v0.24 release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../atf/0001-atf-check.cpp-include-time.h.patch    | 33 ----------------------
 package/atf/Config.in                              |  5 ++--
 package/atf/atf.hash                               |  2 +-
 package/atf/atf.mk                                 |  2 +-
 package/kyua/Config.in                             |  6 ++--
 5 files changed, 9 insertions(+), 39 deletions(-)

diff --git a/package/atf/0001-atf-check.cpp-include-time.h.patch b/package/atf/0001-atf-check.cpp-include-time.h.patch
deleted file mode 100644
index 359172c0e6..0000000000
--- a/package/atf/0001-atf-check.cpp-include-time.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 67e7d350a15aff88c151b1fc838dac83d35be955 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sat, 22 Nov 2025 23:47:41 +0100
-Subject: [PATCH] atf-check.cpp: include time.h
-
-Fixes build error with gcc 14 as reported by the buildroot autobuilders:
-https://autobuild.buildroot.net/results/41b/41b25ee8e66e34323eca011e4b5fe479ece9ed76/build-end.log
-
-atf-sh/atf-check.cpp: In function 'useconds_t get_monotonic_useconds()':
-atf-sh/atf-check.cpp:183:24: error: 'CLOCK_MONOTONIC' was not declared in this scope
-
-Upstream: https://github.com/freebsd/atf/commit/67e7d350a15aff88c151b1fc838dac83d35be955
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- atf-sh/atf-check.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/atf-sh/atf-check.cpp b/atf-sh/atf-check.cpp
-index 1354e3a..94da413 100644
---- a/atf-sh/atf-check.cpp
-+++ b/atf-sh/atf-check.cpp
-@@ -30,6 +30,7 @@ extern "C" {
- #include <limits.h>
- #include <signal.h>
- #include <stdint.h>
-+#include <time.h>
- #include <unistd.h>
- }
- 
--- 
-2.47.3
-
diff --git a/package/atf/Config.in b/package/atf/Config.in
index 800b488945..91e7364000 100644
--- a/package/atf/Config.in
+++ b/package/atf/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ATF
 	bool "atf"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	depends on BR2_USE_MMU # fork()
 	help
 	  ATF, or Automated Testing Framework, is a collection of
@@ -8,6 +9,6 @@ config BR2_PACKAGE_ATF
 
 	  https://github.com/freebsd/atf
 
-comment "atf needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "atf needs a toolchain w/ C++, gcc >= 10"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_USE_MMU
diff --git a/package/atf/atf.hash b/package/atf/atf.hash
index 6cd2323ab0..f979b8b052 100644
--- a/package/atf/atf.hash
+++ b/package/atf/atf.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a64e2427d021297f25b3f2e1798f8ec4dc3061ffb01a1cd3f66cc4cee486b10f  atf-0.23.tar.gz
+sha256  a52be96b5565733e71df8d0ecc8a4255a495e45183de7e3657491e0a8069423f  atf-0.25.tar.gz
 sha256  2a15172ddf6386297734c9800c899e6e8dc16c5a03931dcf95a9ab321a24cfe4  COPYING
diff --git a/package/atf/atf.mk b/package/atf/atf.mk
index 91d2fb5567..a49d32692d 100644
--- a/package/atf/atf.mk
+++ b/package/atf/atf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATF_VERSION = 0.23
+ATF_VERSION = 0.25
 ATF_SITE = https://github.com/freebsd/atf/releases/download/atf-$(ATF_VERSION)
 ATF_INSTALL_STAGING = YES
 ATF_LICENSE = BSD-2-Clause, BSD-3-Clause
diff --git a/package/kyua/Config.in b/package/kyua/Config.in
index 4fc5e098ad..925c42ed65 100644
--- a/package/kyua/Config.in
+++ b/package/kyua/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KYUA
 	bool "kyua"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # atf
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER # lutok
 	depends on !BR2_PACKAGE_LUAJIT # lutok
 	depends on !BR2_STATIC_LIBS # lutok
@@ -17,7 +18,8 @@ config BR2_PACKAGE_KYUA
 
 	  https://github.com/jmmv/kyua
 
-comment "kyua needs a toolchain w/ C++, dynamic library and full Lua"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_LUAJIT || BR2_STATIC_LIBS
+comment "kyua needs a toolchain w/ C++, dynamic library, full Lua, gcc >= 10"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_LUAJIT || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
