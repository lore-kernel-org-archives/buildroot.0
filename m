Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796D7C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30F754379D;
	Wed, 10 Jan 2024 20:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30F754379D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h_einqGHnRcs; Wed, 10 Jan 2024 20:23:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD58C4378A;
	Wed, 10 Jan 2024 20:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD58C4378A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09CEA1BF983
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE507613FF
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE507613FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 70JNPtkBh87Z for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:22:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA01661493
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA01661493
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E75DD85D61; Wed, 10 Jan 2024 20:22:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:08:33 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 030d5daa7de21548039d0691768182ba9ee03008
X-Git-Newrev: 9558592688caa45f1367efaf66b3f76492b5c997
X-Patchwork-Hint: ignore
Message-Id: <20240110202203.E75DD85D61@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] boot/edk2: unset
 MAKEFLAGS in build environment
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

commit: https://git.buildroot.net/buildroot/commit/?id=9558592688caa45f1367efaf66b3f76492b5c997
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Yann reported in [1] that edk2 build could sometimes fail. The issue
can be reproduced when per-package directories is enabled, or also
when building on a system with GNU Make >= 4.4 using the
"--shuffle=reverse" option (such as Fedora 39). Those are pointing
toward a Makefile dependency issue.

The issue can be reproduced with commands:

    cat > .config <<EOF
    BR2_riscv=y
    BR2_RISCV_64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TARGET_EDK2=y
    EOF
    make olddefconfig

Then, building either with:

    make --shuffle=reverse

Or:

    utils/config -e BR2_PER_PACKAGE_DIRECTORIES
    make olddefconfig
    make -j$(nproc)

It is interesting to mention that when using "make --shuffle=reverse"
to build, the build can be completed if restarted only with "make". It
will not pull any other Buildroot package. This fact hints toward a
Makefile dependency issue internal to the EDK2 build system, rather
than in the Buildroot recipe.

The EDK2 build system is quite unique. See [2]. It generates files,
makefiles and internally uses GNU Make to compile code. This system is
likely not tested as being a sub-Make process in a complex Makefile
such as Buildroot.

In order to prevent Buildroot to pass unexpected Make flags to the
EDK2 sub-Make, this commit unset the MAKEFLAGS variable in the EDK2
build environment. This will put the EDK2 build script in a more
common and tested state. See GNU Make documentation about recursive use
of Make, more specifically [3].

Note: as mentioned, the build failure is likely due to an internal
issue of the EDK2 build system. The failure points to a missing
dependency in the EDK2 generator itself. This commit does not fix this
issue, but rather put the EDK2 build system in a normalized
environment, avoiding Buildroot flags being passed to the internal
EDK2 sub-Make invocation. The upstream EDK2 build system most likely
need a fix too.

Fixes:

    make[2]: *** No rule to make target '/buildroot/output/build/edk2-edk2-stable202308/Build/RiscVVirtQemu/RELEASE_GCC5/RISCV64/MdeModulePkg/Application/UiApp/UiApp/DEBUG/UiApp.efi', needed by '/buildroot/output/build/edk2-edk2-stable202308/Build/RiscVVirtQemu/RELEASE_GCC5/FV/Ffs/462CAA21-7614-4503-836E-8AB6F4662331UiApp/UiApp.offset'.  Stop.

    build.py...
     : error 7000: Failed to execute command
	    make tbuild [/buildroot/output/build/edk2-edk2-stable202308/Build/RiscVVirtQemu/RELEASE_GCC5/RISCV64/MdeModulePkg/Application/UiApp/UiApp]

    build.py...
     : error F002: Failed to build module
	    /buildroot/output/build/edk2-edk2-stable202308/MdeModulePkg/Application/UiApp/UiApp.inf [RISCV64, GCC5, RELEASE]

[1] https://lists.buildroot.org/pipermail/buildroot/2023-December/681507.html
[2] https://tianocore-docs.github.io/edk2-BuildSpecification/draft/4_edk_ii_build_process_overview/42_build_process_overview.html
[3] https://www.gnu.org/software/make/manual/make.html#Options_002fRecursion

Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 44af6938fb7f3e19492cdf722534e5e8a9fff0d0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/edk2/edk2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index fb6b9a3280..69a0d7ca57 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -137,7 +137,13 @@ EDK2_BASETOOLS_OPTS = \
 
 EDK2_PACKAGES_PATH = $(subst $(space),:,$(strip $(EDK2_PACKAGES_PATHS)))
 
+# EDK2 "build" script internally uses and calls "make", which controls
+# its own flags. It is mainly tested while not being a sub-make. In
+# order to stay in that configuration, we avoid leaking top-level
+# Buildroot make flags into EDK2 build by clearing the MAKEFLAGS
+# environment variable.
 EDK2_BUILD_ENV += \
+	MAKEFLAGS= \
 	WORKSPACE=$(@D) \
 	PACKAGES_PATH=$(EDK2_PACKAGES_PATH) \
 	PYTHON_COMMAND=$(HOST_DIR)/bin/python3 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
