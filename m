Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A08DC7EE43
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 20:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF88260B8C;
	Tue,  6 Jun 2023 20:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF88260B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VU9JF-oC1eoV; Tue,  6 Jun 2023 20:27:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3082612F1;
	Tue,  6 Jun 2023 20:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3082612F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C975D1BF962
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 20:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFD4D82117
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 20:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFD4D82117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZaNaB3o72yX for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 20:27:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 855FE8210D
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 20:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 855FE8210D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DE5786D2E; Tue,  6 Jun 2023 20:27:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Jun 2023 22:06:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 620ce32227b0722c9c68c5d0cd42d8600a18ca6b
X-Git-Newrev: 53beb8fc1a4f3ba20ea6c856b4ec8506570f17c1
X-Patchwork-Hint: ignore
Message-Id: <20230606202724.6DE5786D2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/dependencies: introduce
 BR2_HOST_CMAKE_AT_LEAST
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=53beb8fc1a4f3ba20ea6c856b4ec8506570f17c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages (e.g. libjxl) requires a quite recent cmake version,
that is not yet available in most distributions, especially those
LTS versions.

Currently, when we bump the minimum cmake version we require, it gets
bumped for all packages, regardless of their own minimum required
version, which means that a given configuration will trigger the
build of our host-cmake even if the packages that require it are not
enabled and those that are would be content with the system-provided
cmake.

Since host-cmake can take quite some time to build, this can get a
bit annoying to pay the price of a host-cmake build that would
otherwise not be needed.

Some packages even use an alternative build system when available
since they requires a more recent version of cmake than the our
minimum cmake version
(wpewebkit use Ninja: 78d499409f71d8a22b0632c8ebc06f67ee6ae6dd).

We introduce config options that packages can select to indicate
what minimal cmake version they require, and use that version as the
required minimal version required by the current configuration [0].

We would like to ensure that the currently selected minimum cmake
version is indeed lower (or equal) to the cmake version we package,
but that is not possible: dependencies.mk is parsed before we parse
packages, so we do not yet know the cmake version we have, and we
can't invert the parsing order as we need to know the required
dependencies before we parse packages (so that we can build their
dependency rules in Makefile). So we can only add comments in both
places, that refer to the other location.

[0] note that this is yet not optimal, as in such a case, host-cmake
would be in the dependency chain of all cmake-based packages, even
for those packages that do not require it. The optimum would be for
each package to gain such a dependency on an as-needed basis, but
this is by far more complex to achieve, and would only speed up
cases where a single package is built from scratch (e.g. with:
make clean; make foo), which is not worth optimising (yet?)

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Julien Olivain <ju.o@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/Config.in.host             | 27 +++++++++++++++++++++++++++
 package/cmake/cmake.mk                   |  1 +
 support/dependencies/check-host-cmake.mk | 12 +++++++-----
 3 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index b2e210ee2c..5de076537b 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -9,3 +9,30 @@ config BR2_PACKAGE_HOST_CMAKE
 	  the compiler environment of your choice.
 
 	  http://www.cmake.org/
+
+# The minimum system cmake version we expect if 3.18 as provided by
+# Debian bullseye, that we use in our reference build docker image.
+config BR2_HOST_CMAKE_AT_LEAST_3_19
+	bool
+
+config BR2_HOST_CMAKE_AT_LEAST_3_20
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_19
+
+config BR2_HOST_CMAKE_AT_LEAST_3_21
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_20
+
+config BR2_HOST_CMAKE_AT_LEAST_3_22
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_21
+
+# This order guarantees that the highest version is set, as kconfig
+# stops affecting a value on the first matching default.
+config BR2_HOST_CMAKE_AT_LEAST
+	string
+	default "3.22"	if BR2_HOST_CMAKE_AT_LEAST_3_22
+	default "3.21"	if BR2_HOST_CMAKE_AT_LEAST_3_21
+	default "3.20"	if BR2_HOST_CMAKE_AT_LEAST_3_20
+	default "3.19"	if BR2_HOST_CMAKE_AT_LEAST_3_19
+	default "3.18"
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index dc92c8bb4e..b99877696a 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 3.22
 CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 5760e4ded1..e367690319 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -1,9 +1,11 @@
-# Set this to either 3.18 or higher, depending on the highest minimum
-# version required by any of the packages bundled in Buildroot. If a
-# package is bumped or a new one added, and it requires a higher
-# version, our cmake infra will catch it and build its own.
+# The cmake minimum version is set to either 3.18 or higher,
+# depending on the highest minimum version required by any
+# of the packages bundled in Buildroot. If a package is
+# bumped or a new one added, and it requires a higher
+# cmake version than the one provided by the host, our
+# cmake infra will catch it and build its own.
 #
-BR2_CMAKE_VERSION_MIN = 3.18
+BR2_CMAKE_VERSION_MIN = $(BR2_HOST_CMAKE_AT_LEAST)
 
 BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
