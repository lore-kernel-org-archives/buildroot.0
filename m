Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E51E77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E56680AE5;
	Sat, 30 Sep 2023 13:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E56680AE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8nP5SeZ7AkwD; Sat, 30 Sep 2023 13:54:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AE8683D02;
	Sat, 30 Sep 2023 13:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AE8683D02
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8A621BF2F9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A14CB40C0A
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A14CB40C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XxEHOiRsJCK4 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:54:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D2CD4047B
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:54:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D2CD4047B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66FFE83A09; Sat, 30 Sep 2023 13:54:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 15:54:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 683446ed9f133d00c85ddfcf44094bcb3baeab56
X-Git-Newrev: 6fa4131de5a5a5b156eb110d5f40ac602f6c1d87
X-Patchwork-Hint: ignore
Message-Id: <20230930135439.66FFE83A09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdbus-cpp: add support to build
 the host stub generator
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=6fa4131de5a5a5b156eb110d5f40ac602f6c1d87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a host option to build the xml2cpp-codegen part of the
sdbus-cpp package for use in creating adaptor and proxy
implementations from the D-Bus IDL.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in.host           |  1 +
 package/sdbus-cpp/Config.in.host | 11 +++++++++++
 package/sdbus-cpp/sdbus-cpp.mk   |  9 +++++++++
 3 files changed, 21 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 387a28cff2..09dbf8308d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -99,6 +99,7 @@ menu "Host utilities"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
+	source "package/sdbus-cpp/Config.in.host"
 	source "package/sdbusplus/Config.in.host"
 	source "package/sentry-cli/Config.in.host"
 	source "package/sloci-image/Config.in.host"
diff --git a/package/sdbus-cpp/Config.in.host b/package/sdbus-cpp/Config.in.host
new file mode 100644
index 0000000000..d62a65ae84
--- /dev/null
+++ b/package/sdbus-cpp/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_SDBUS_CPP
+	bool "host sdbus-c++"
+	depends on BR2_HOST_GCC_AT_LEAST_7
+	help
+	  sdbus-c++ is a high-level C++ D-Bus library for Linux
+	  designed to provide expressive, easy-to-use API in modern C++.
+
+	  This will build the stub code generator for the adaptor and
+	  proxy interfaces from D-Bus IDL.
+
+	  https://github.com/Kistler-Group/sdbus-cpp
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index 52e5c50cd2..2a6b67d6e3 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -12,4 +12,13 @@ SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
 SDBUS_CPP_LICENSE = LGPL-2.1+ with exception (headers)
 SDBUS_CPP_LICENSE_FILES = COPYING COPYING-LGPL-Exception
 
+# Host build for sdbus-c++-xml2cpp
+HOST_SDBUS_CPP_DEPENDENCIES = host-pkgconf host-systemd
+HOST_SDBUS_CPP_CONF_OPTS = \
+	-DBUILD_CODE_GEN=ON \
+	-DBUILD_DOC=OFF \
+	-DBUILD_TESTS=OFF \
+	-DBUILD_LIBSYSTEMD=OFF
+
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
