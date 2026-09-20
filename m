Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A488AC982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49EAB40BE2;
	Sun, 20 Sep 2026 12:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhNgIc60Lg4D; Sun, 20 Sep 2026 12:56:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 45E3940BD5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789908965;
	b=k4y/czT9kxiHqwxWPpiaI5WY6pJ6vo0irMUzzrW9RMzhw3fr4a8Pfp7IJHNIZjqFz92S
	 Htth7ixONuH76xSSUNBnJrnAe/4sKJ8v//HGqBo4YPj+fi7xeE2wyP7EIIbDOvyLppTeR
	 SO03BZoUpZJ5B+gCrIz+ORg9aqh3OJKuTH1x7gz8oRnJFfO+jMnYU8OO0BbdIuAo5sAo0
	 Cm9wu+dyaT6LgEfdICH22z3YzIKj1e2DNOjKpF19PIsMnrt3whcX37pCvTWQ6X6CoSK5r
	 eLZkpKDAqw9EzYxn9M08+rtQSIYYqUfuF7e3LQ4PYgAB+Ubpcx21n3cEtM5B6ieMyWQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789908965;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ydSd/CCxqFocZMk82tUpMLG0Ei1vINfyx3KrX2X1LlI=;
	b=Fy0AftOSXaasrGCqwCkaxx9Kocq1/oft1cXAvqolWu/kWIOflPQCAsGS4iZYEOd/wqJu
	 4kOY/+oV7xW8GlM8RUAz1NdbF2SrsdqLLAOT0+C8WBs5njfWoAte1uBnmiRhhIA5Ss2/U
	 cb8MOSGb/M372lC5O9IBXtoSFj/5zHW9XKYxzuhgGwsydm7wOHs41yhY++jKRCLCKx8Ca
	 TSdHTorKc8fmy/K55NXyXp8QaqMBe4n1I1UQ9RWNTM+d2AXPd9K61Z3edZUHhV9k25jcn
	 /VJQQ9kiRo3TH9b+7pJpQF1eXatdFe6oEcHBznZcVI7EIVQzcqVlQXzOWAniGUAdpzg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789908965;
	bh=ydSd/CCxqFocZMk82tUpMLG0Ei1vINfyx3KrX2X1LlI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kr9vq0LnkOjDGDwVqBoqQS+2Y+xds3TOMTOXYDnJDbnw2dOwaTttiXcLnisnfBYoS
	 /rj+tWzc4ifdhKfl7gV/IQNKGHY2VAL1AlPSiVpf3MjvU29MC/7XYseJ9E+cOKpREg
	 1JT9nRH2pgs1/DqgfMXgeko+Dmbosf3hPp623tWDWbknUoBeVCuDJzfj9bJy9hW0Hz
	 LvYb1kljQdnU+ennnFTNSYknSoUyohDSBZTjFvj6Ue0PepR7jIZOUJdWawLTiJHsVX
	 kkpHbmUsXEOgVlSPUCE8ICF2I4Bu4rx5N29S3LxH+U8Gj2EO5NHXDcP8MrQNtErltF
	 pMWeuj7/hV3sA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45E3940BD5;
	Sun, 20 Sep 2026 12:56:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 55B45224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4707440BD0
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nb6_o1NfYJD5 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:56:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7DFED40BD5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789908960;
 b=pL/Al6qlrW+8q0rrNvlg+IaZMq3R6MkSiGoTKT+f9EB2WIvvvDrkBlD638VdWA7ga4Xc
 xVpvcDIIalCRpIkiTZ/1BGevSx//cFh9lFfapKD+mDzZBMHKJvI73Bgz+oFmLxDQ0aDiu
 6kxnjd9yGPlGC6FilLPf5rporbhOUoaKLcApFH4kwYaENVachm8VAMnzzsv2R8Zb/JhJG
 Ij5xVfcLP+g+jDGgFlQ3En+lIYn+R4HI547E03qm10TwdcvHziddetdEuKIKBbrcvQAcy
 lbrnMPkClDMy6bckj3yY4vN+xagX36uPwfTyHHRK9MfGQl/rsUbOmN6DvWIoTgS3Pzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789908960;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+Ju3WVkLvpg5ClM20P9ZF1FCH5nX+HJBsf0W5SywSxE=;
 b=pmJ5cMOQ+CWGmlLiOdo2eNWm7Stz5Ph+ys0iQvvA7L849KyrnTanZluclSYFCpfcJuUU
 +LIdPDE+BxhGMah3o+8Swg6yjCY6Ai07UqGMFhVTOEMmEXFKTV10N71GeCf57s+Nc1PrA
 Ud3zFGLFcJWBgVWnATGWq36z7Jo5Hyr+si80j+dmSaT8EIX6EBDUrqmgGO9z2FAzdoiFK
 gAdW6h7gh5xGDgLnaz5A0p2eOTXLDeslJTZ2zhCvP87isyMSJ0H7dFXH0aJdYUcNkxUPK
 5SV+86DWdc9po2guy/kJgo//jD20gB++PI/luf1JcLQ1g4ki2O8EW2C1gXz5Uu10aYQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DFED40BD5
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:56:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22D078C6B1; Sun, 20 Sep 2026 12:54:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 14:45:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 861b7cb9b2393c2fdf4174899f7920e7a9a581b4
X-Git-Newrev: e4253ee1a66a914714f67c427756980c064a9abd
X-Patchwork-Hint: ignore
Message-Id: <20260920125452.22D078C6B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jwt-cpp: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e4253ee1a66a914714f67c427756980c064a9abd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Needed for domoticz >= 2025.1:
https://github.com/domoticz/domoticz/commit/b30d9e9436ad428a2cbfd1fbb273461bdbf50a82

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  2 ++
 package/Config.in            |  1 +
 package/jwt-cpp/Config.in    | 13 +++++++++++++
 package/jwt-cpp/jwt-cpp.hash |  4 ++++
 package/jwt-cpp/jwt-cpp.mk   | 18 ++++++++++++++++++
 5 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 988a32a914..62e3eb278d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -410,6 +410,7 @@ F:	package/intel-mediasdk/
 F:	package/intel-microcode/
 F:	package/intel-vpl-gpu-rt/
 F:	package/jsoncpp/
+F:	package/jwt-cpp/
 F:	package/kodi*
 F:	package/lame/
 F:	package/lcms2/
@@ -1031,6 +1032,7 @@ F:	package/bitcoin/
 
 N:	Fabrice Fontaine <fabrice.fontaine@orange.com>
 F:	package/domoticz/
+F:	package/jwt-cpp/
 F:	package/libmediaart/
 F:	package/libmaxminddb/
 F:	package/openzwave/
diff --git a/package/Config.in b/package/Config.in
index 1e4b095883..8d9ec62bfa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1908,6 +1908,7 @@ menu "JSON/XML"
 	source "package/json-for-modern-cpp/Config.in"
 	source "package/json-glib/Config.in"
 	source "package/jsoncpp/Config.in"
+	source "package/jwt-cpp/Config.in"
 	source "package/libfastjson/Config.in"
 	source "package/libjson/Config.in"
 	source "package/libroxml/Config.in"
diff --git a/package/jwt-cpp/Config.in b/package/jwt-cpp/Config.in
new file mode 100644
index 0000000000..32fcdbe468
--- /dev/null
+++ b/package/jwt-cpp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_JWT_CPP
+	bool "jwt-cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	select BR2_PACKAGE_OPENSSL
+	help
+	  A header only library for creating and validating json web
+	  tokens in c++
+
+	  https://thalhammer.github.io/jwt-cpp/
+
+comment "jwt-cpp needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/jwt-cpp/jwt-cpp.hash b/package/jwt-cpp/jwt-cpp.hash
new file mode 100644
index 0000000000..38df18ced7
--- /dev/null
+++ b/package/jwt-cpp/jwt-cpp.hash
@@ -0,0 +1,4 @@
+# From https://github.com/Thalhammer/jwt-cpp/releases/tag/v0.7.2
+sha256  7c1b4f767bdd14f727f6114d9e35b761f10d00d6a27ef7650ee8c628f08df27c  jwt-cpp-v0.7.2.tar.gz
+# Locally calculated
+sha256  35c2d7d6824a1e1ed2b266ec334b7862726ae593855c3cfa68b952bb75f082c4  LICENSE
diff --git a/package/jwt-cpp/jwt-cpp.mk b/package/jwt-cpp/jwt-cpp.mk
new file mode 100644
index 0000000000..27e7d23691
--- /dev/null
+++ b/package/jwt-cpp/jwt-cpp.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# jwt-cpp
+#
+################################################################################
+
+JWT_CPP_VERSION = 0.7.2
+JWT_CPP_SITE = https://github.com/Thalhammer/jwt-cpp/releases/download/v$(JWT_CPP_VERSION)
+JWT_CPP_SOURCE = jwt-cpp-v$(JWT_CPP_VERSION).tar.gz
+JWT_CPP_LICENSE = MIT
+JWT_CPP_LICENSE_FILES = LICENSE
+JWT_CPP_INSTALL_STAGING = YES
+JWT_CPP_DEPENDENCIES = openssl
+JWT_CPP_CONF_OPTS = \
+	-DJWT_BUILD_EXAMPLES=OFF \
+	-DJWT_BUILD_TESTS=OFF
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
