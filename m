Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7FCC79F8C
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 23:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06BC76062A;
	Sun,  6 Sep 2026 23:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLeriD_4zZ2F; Sun,  6 Sep 2026 23:31:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E743E605DA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788737499;
	b=FYhekEEHLhFpnzH4MKLsdIflAGj2+kEF3Z3sIVdTFNm/TxfIyVmiDdQQlsyMvvqh0MlH
	 7HUM3iQ+80Qjm5WPWkqc/yqk/YlCT2SDcn2Ery7n5vSxc0m4u83aBizWCC452Y7QOUiUo
	 hWTQKbOKC+Sdxt94LaFHUMKA0pVEBtSKVCoOz6nY7UEy01Yzk9JDknSCCRE2jwrBpwKhD
	 FmP+0WicSm4yMI9xNRNJmykLFYxUb70dfvtq6jYtbcDZz5mwyEvwZ96ljhBoYQhwoyZUe
	 fkWpEqPGZeenBbIkNa08o3I3svJj9XydoEmCg3UYHIlEhK0SApx1bYnZoRiW2f4M0ig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788737499;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8fLDeLIuuJ8uUKdaC2pfB8Eks1KIEdIPnTUx690HV0o=;
	b=e9ysQL3ZsnNBIFS1R16l0/nAAbD3sf9Xcf79F1G8lkor7qP8VWlvyy7Jf8uqe2w0rVWt
	 2tXapNsr1iU6vJMpNyo5zYSmKgS9lwTHiLHtKRD1tNADD5LzLDPlTDI1iDYctgyD0iIt6
	 ptr0wgkBaYO/JQD+lqiyBWv7/OH/5SrTEMMMFhDTvRWAed2K8SDrX5tobdOe29mrnaOW0
	 6nEGjcR1rdUdEVeOfrV1jiE3VtbRZtmLv9E4S/732TNECRDGytjQWh41uSP//kgnoyH6k
	 AlxzZ2HUdRfhrSg2Ds3+5SHalyJ6bDtUM2+2ZFtTHdaqV5jst8rkJAY6Vqv5gLmB4JA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788737499;
	bh=8fLDeLIuuJ8uUKdaC2pfB8Eks1KIEdIPnTUx690HV0o=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Anj8l42xuY4n/D5xp3avfKNDG2NbYpZbhioor2JMXFc47idfVh9tO8y7mymp8xnNB
	 AmYQ2ORjDHwMDpr3Smwbj/lmLg5sAtuu8Vp2vyWly9/4DfVvTewKMAxd+W/gobK0/C
	 msUgHD2FDxo4tIRILtohVGcx8XNtsLXfGIBiiyCCat/iqfXeDXM5+XJwO79tG8oNfN
	 5I8LmamKkuCYcn2Evp55VrH+ym6VruImWpKde3JPnzVWtSSJ2hJJYGg6SasDWh1eU3
	 b33HqCev7QsL275HwKfWu1xt471/ks9CwNiSA76EAdKZm8Iv/PJfakoea97hIiShSI
	 ISmPjJ01jKZJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E743E605DA;
	Sun,  6 Sep 2026 23:31:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03980118
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 23:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E94D24007C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 23:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPtRmY7maWNG for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 23:31:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 476CC40079
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788737495;
 b=QH6Mzl78xRr400aHazsLVB30rYxmI6fBgZWO0KjpGfsHiTCeevZ7gq06/uA3TNoGyIrY
 HxEifV4Veb2HP3knrTZwppO7jHzX++D+BcRCWt3tWmjjdQfbUa01vsakR11dxWLLi0mHS
 x0Wj8PgvhBX5jxLXyUt1sB1bS/G/Sn8jamSVK/uE5PjZCLEx626cin04Jrw2sI3lgnYyU
 P8IaD/E9w1Xm+cqjv3ttMzFf7NaZrBNezoVGfogMtWCuq2c6YGExHWOFd1ERTEVGIpM1X
 /inIYs4qb4gYwXfjHjqoKBzMhaEcB1eJH316tHiUT7tSBpCj6ITLuGoeE+tmro1ed0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788737495;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4sJSQN9N7RMpv5a8JEjun+rFY453RHW5jzJ5jcFSIVE=;
 b=jLfytTjPrkdbClunWDXHnHxf6vgw38TgY0O57uBBnsUIPXZQ4ajPy6j6e8JsKBTBYwtl
 8Vvhbdstz1UtuvLSDE/pJZlsRZy6CzJmuKE37nEizL3udHDNHbZ3PITfjf2eakSp1XeLm
 b6vm57MLUBOMOBGq6MCgP8fuLsdsIWMqd6lpVU70cUDqLQI8xDpemhMIN1uuJUQHqKQwC
 +/LmYKX46y1BNVD8PnisrrqbDvcb+r24++ujuASnvkoPHWe3Ok1lWLZe+DSZgQ0g5/WMD
 mw6Cl5q0NdUadRgesuqnd7glk0ztNqrnu1wF4aH/3Ubb73P/H/KfT/MMThlGvojFr8A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tn54VGjY; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tn54VGjY
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 476CC40079
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 23:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788737461;
 bh=4sJSQN9N7RMpv5a8JEjun+rFY453RHW5jzJ5jcFSIVE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tn54VGjYE6MgqbVTjR+T/Q3dJ39S0xYhVwLKP3R18iEXtpmP4LyvoHgmKbpH4F5yB
 0Bo/rM/ptEMN+bP3tRztNwdHTlnRJ2w9vaPQxn0iVMit8HvqeoslYUewKWEZoqMKDY
 bxRa2M25o5OpdRLlbU/mx8dmT+XmHntWe09DoJgs2lnXkt38ry9FPedRx7bmBde1Kl
 ic102JWiOw8Iz2uZ+/ggBntzaYSkugtm4YDfEt866wFGaQFhHpzXLUTLAGksY2F9tR
 lPhAXe2+yb58dO/dyk7QVuFztsjZC6mJ0FgukS1oD6vlguuRqmcnW31s49nCZyajg2
 UBHvBUpgCSKRg==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7D18EA4C2F62;
 Mon,  7 Sep 2026 01:31:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44132)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3MK1-000000007cf-0m0y;
 Sun, 06 Sep 2026 23:30:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Mon,  7 Sep 2026 01:30:47 +0200
Message-ID: <20260906233048.692559-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260906233048.692559-1-bernd@kuhls.net>
References: <20260906233048.692559-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 5/6] package/mesa-libclc: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/mesa-libclc/Config.in        | 13 +++++++++
 package/mesa-libclc/mesa-libclc.hash |  3 ++
 package/mesa-libclc/mesa-libclc.mk   | 42 ++++++++++++++++++++++++++++
 5 files changed, 60 insertions(+)
 create mode 100644 package/mesa-libclc/Config.in
 create mode 100644 package/mesa-libclc/mesa-libclc.hash
 create mode 100644 package/mesa-libclc/mesa-libclc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1fd93b1de5..019b527f54 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -469,6 +469,7 @@ F:	package/libzippp/
 F:	package/linux-firmware/
 F:	package/mc/
 F:	package/mesa3d/
+F:	package/mesa-libclc/
 F:	package/minidlna/
 F:	package/mjpg-streamer/
 F:	package/mpg123/
diff --git a/package/Config.in b/package/Config.in
index 307f7ce86a..b4d7f3c133 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2271,6 +2271,7 @@ endif
 	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
+	source "package/mesa-libclc/Config.in"
 	source "package/mpc/Config.in"
 	source "package/mpdecimal/Config.in"
 	source "package/mpfr/Config.in"
diff --git a/package/mesa-libclc/Config.in b/package/mesa-libclc/Config.in
new file mode 100644
index 0000000000..620bfb13e8
--- /dev/null
+++ b/package/mesa-libclc/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_MESA_LIBCLC
+	bool "mesa-libclc"
+	depends on BR2_PACKAGE_LLVM
+	select BR2_PACKAGE_LLVM_AMDGPU
+	select BR2_PACKAGE_LLVM_RTTI
+	help
+	  This is a fork of LLVM's libclc applying some fixes of a
+	  known good state to be used by Mesa3D.
+
+	  https://gitlab.freedesktop.org/karolherbst/mesa-libclc
+
+comment "mesa-libclc needs llvm"
+	depends on !BR2_PACKAGE_LLVM
diff --git a/package/mesa-libclc/mesa-libclc.hash b/package/mesa-libclc/mesa-libclc.hash
new file mode 100644
index 0000000000..a03274867e
--- /dev/null
+++ b/package/mesa-libclc/mesa-libclc.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  c77fc1104fbc2d254a48d2176a33cbec915dde9a48beda7a274f2e837b796386  mesa-libclc-22.1.8.3-git4.tar.gz
+sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/mesa-libclc/mesa-libclc.mk b/package/mesa-libclc/mesa-libclc.mk
new file mode 100644
index 0000000000..62d7fef69e
--- /dev/null
+++ b/package/mesa-libclc/mesa-libclc.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# mesa-libclc
+#
+################################################################################
+
+MESA_LIBCLC_VERSION = 22.1.8.3
+MESA_LIBCLC_SITE = https://gitlab.freedesktop.org/karolherbst/mesa-libclc.git
+MESA_LIBCLC_SITE_METHOD = git
+MESA_LIBCLC_LICENSE = Apache-2.0 with exceptions or MIT
+MESA_LIBCLC_LICENSE_FILES = LICENSE.TXT
+MESA_LIBCLC_DEPENDENCIES = host-clang host-llvm host-spirv-llvm-translator
+HOST_MESA_LIBCLC_DEPENDENCIES = host-clang host-llvm host-spirv-llvm-translator
+MESA_LIBCLC_INSTALL_STAGING = YES
+
+# CMAKE_*_COMPILER_FORCED=ON skips testing the tools and assumes
+# llvm-config provided values
+#
+# CMAKE_*_COMPILER has to be set to the host compiler to build a host
+# 'prepare_builtins' tool used during the build process
+#
+# The headers are installed in /usr/share and not /usr/include,
+# because they are needed at runtime on the target to build the OpenCL
+# kernels.
+MESA_LIBCLC_CONF_OPTS = \
+	-DCMAKE_SYSROOT="" \
+	-DCMAKE_C_COMPILER_FORCED=ON \
+	-DCMAKE_INSTALL_DATADIR="share" \
+	-DCMAKE_FIND_ROOT_PATH="$(HOST_DIR)" \
+	-DCMAKE_C_FLAGS="$(HOST_CFLAGS)" \
+	-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
+	-DCMAKE_SHARED_LINKER_FLAGS="$(HOST_LDFLAGS)" \
+	-DCMAKE_MODULE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
+	-DCMAKE_C_COMPILER="$(CMAKE_HOST_C_COMPILER)" \
+	-DLLVM_CMAKE_DIR="$(HOST_DIR)/lib/cmake/llvm" \
+	-DLIBCLC_CUSTOM_LLVM_TOOLS_BINARY_DIR="$(HOST_DIR)/bin"
+
+HOST_MESA_LIBCLC_CONF_OPTS = \
+	-DLIBCLC_TARGETS_TO_BUILD=spirv64-mesa3d-
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
