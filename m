Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9EAC3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 31 Dec 2023 18:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2264440122;
	Sun, 31 Dec 2023 18:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2264440122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gVUp5QnEz4YP; Sun, 31 Dec 2023 18:14:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7D1540147;
	Sun, 31 Dec 2023 18:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7D1540147
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C71A81BF41D
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 18:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EE8B40890
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 18:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EE8B40890
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h1gtjFiyJn-A for <buildroot@lists.busybox.net>;
 Sun, 31 Dec 2023 18:14:51 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 582CC4088E
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 18:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 582CC4088E
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 419B013F8A7;
 Sun, 31 Dec 2023 19:14:44 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 31 Dec 2023 19:14:37 +0100
Message-ID: <20231231181437.582286-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704046488;
 bh=3PxoDafomfjKQckBYbA6RyVP8KYfI3S3dpCZsaBhyRU=;
 h=From:To:Cc:Subject:Date:From;
 b=bVtfoVJWuzeEZgrgOV0SAf+EWe2A8R9LUUinngbGtSFJrKe1iA97hCvVVHkNpMNUv
 vFdJV19Mc7Uipt+olrhAD47usroYJhwOZFoJv0PXj9xSJPQtyyKiJDga3N++vLvQtr
 jaWxWfiUK+jWvhI6Nr5iANluPGK/729B2IztgvODFYLfvh+VdcxfzwrjPTJbBxWWti
 raZFyFRjBd7YasAcFgv72xKCeh+/1oL97SS4kUG0WxPKI9xdhgw0u64aHLNRhu/M+Z
 dLXP41jhLG2e+zQpOL2rH054AoeVWpyAvhWqSiJeGI8rM/XHDSpbMRBab27ZVJgFMn
 TbTdQrua/iPOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bVtfoVJW
Subject: [Buildroot] [PATCH RFC 1/1] boot/edk2: unset MAKEFLAGS in build
 environment
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 boot/edk2/edk2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index efdb4d02ce..87ac80c88f 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -150,7 +150,13 @@ EDK2_BASETOOLS_OPTS = \
 
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
