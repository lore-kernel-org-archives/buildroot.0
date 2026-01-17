Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F9AC98321
	for <buildroot@archiver.kernel.org>; Sat, 17 Jan 2026 10:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E823D41448;
	Sat, 17 Jan 2026 10:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBVl8RJv5761; Sat, 17 Jan 2026 10:32:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9ED54144E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768645957;
	bh=P5GNHRsNqCC7q9kdU6h1dzn9ca480aS4lphYnMJHbJ8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=AhALgooTBW/0lCpk9wkiU5y8vfU+ykSVbhssmkxe/YmDu/Sguv069mRqcg3QLIozE
	 eAo3ejRqxKLhMGxnFvpdvwogUYiS3/RJE7zM4c7WNAxRKkOlyR1/K/wYnrBWFJFLcN
	 QZyv16WLxBfzA11/Nx6JQb9JmtlfHhwDpjMyI/1YY1LL8UC6GiKjzqF+A71m7Htnlp
	 tEZZhwkgYv4mrHYu2VpGxMVqa5Gs0Tzu4HTqUURSH4dP5VzF8GeTWtoIvj2Vg2BCWp
	 80h34lDOuKm2s08g7XhaxsoacV8qub5L4h97/NL1sBquVC92imonErR5eFov9JiITn
	 IGi4kL2r2eE9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9ED54144E;
	Sat, 17 Jan 2026 10:32:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13A942CC
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 10:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0328C84397
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 10:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EJx91vzEY81 for <buildroot@buildroot.org>;
 Sat, 17 Jan 2026 10:32:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CA2A8416D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CA2A8416D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CA2A8416D
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 10:32:33 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3D70519F576;
 Sat, 17 Jan 2026 11:32:28 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 17 Jan 2026 11:31:09 +0100
Message-ID: <20260117103109.12198-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768645950;
 bh=M3kjm50QZS1ezmz1Dv0j1O+TCcKr6xb9gYCzRGtPdRQ=;
 h=From:To:Cc:Subject:Date:From;
 b=YcHvtz/ktGr2XnvG+rS+JuBCQNIRhhA+jGQfaW9s+eSLs3KGLxFDG9Ph6Fseh/EGp
 JLBgGtiBAKHq4JHvWpLwxA50qsAiCV9lMIAy9gFBsMNtYwoCK31GLmi8WCX4NT0oEX
 ql9A9wVb6vEdoYdN/SFvhjUpGITxO2sYgvlPuIrd/UQxQTmn4mEkeyRhIfdo/hN92y
 eSrF32UuaYXN/uiSTzAoGGJdFOL2kwlMJO+NVkP4ouoc1DqpY8NCtu3ZOdOKo/Qh4t
 73rL3EJYsxiziJKhB9EPgDHE+Jf0gwq4aCTRygLWW9pa8CtOrAU1LrjIwZZht+zuw4
 FXkas6tilWf2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YcHvtz/k
Subject: [Buildroot] [PATCH 1/1] package/pkg-cmake.mk: add
 Platform/Buildroot-Initialize.cmake
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit [1] (core/pkg-cmake: provide our own platform
description), Buildroot is setting its own CMake platform
description. This description applies minor changes on top of
the CMake Linux platform, see [2] and [3]. The CMake system specific
script tries to include an initialization script, if present.
See [4].

Since in commit [1] we set the CMAKE_SYSTEM_NAME to "Buildroot"
(rather than "Linux"), CMake will search for a
"Platform/Buildroot-Initialize.cmake" which does not exist, and
continue normally, since the include is optional.

The "Platform/Linux-Initialize.cmake" file is the one setting the
LINUX [6] and UNIX [7] variables, which are expected to be true on
a linux compatible system. In Buildroot, it is currently not
included, so those variables are unset.

If a CMake package in Buildroot has a construct such as:

    if(LINUX)
        # ...do things...
    else()
        message(FATAL_ERROR "System not supported")
    endif()

It will fail at configuration time.

This situation happened when trying to add the btop++ package
in Buildroot. See [8].

Since the initial intent of commit [1] was to make the Buildroot
CMake system inherit from Linux plus some fixups, this commit simply
adds a Buildroot-Initialize.cmake file that includes the
Linux-Initialize.cmake one from CMake. This will have the effect
to properly define the LINUX and UNIX variables.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/c69b14fe2f72d8134057b115884c04a2bf27d410
[2] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/support/misc/Buildroot.cmake#L1-4
[3] https://cmake.org/cmake/help/v4.2/variable/CMAKE_SYSTEM_NAME.html
[4] https://gitlab.kitware.com/cmake/cmake/-/blob/v4.2.1/Modules/CMakeSystemSpecificInitialize.cmake#L35
[5] https://gitlab.kitware.com/cmake/cmake/-/blob/v4.2.1/Modules/Platform/Linux-Initialize.cmake
[6] https://cmake.org/cmake/help/v4.2/variable/LINUX.html
[7] https://cmake.org/cmake/help/v4.2/variable/UNIX.html
[8] https://github.com/aristocratos/btop/blob/v1.4.6/CMakeLists.txt#L76

Reported-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pkg-cmake.mk                    | 2 ++
 support/misc/Buildroot-Initialize.cmake | 1 +
 2 files changed, 3 insertions(+)
 create mode 100644 support/misc/Buildroot-Initialize.cmake

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index ba287d244a..f572bdebb3 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -287,6 +287,8 @@ define TOOLCHAIN_CMAKE_INSTALL_FILES
 		> $(HOST_DIR)/share/buildroot/toolchainfile.cmake
 	$(Q)$(INSTALL) -D -m 0644 support/misc/Buildroot.cmake \
 		$(HOST_DIR)/share/buildroot/Platform/Buildroot.cmake
+	$(Q)$(INSTALL) -D -m 0644 support/misc/Buildroot-Initialize.cmake \
+		$(HOST_DIR)/share/buildroot/Platform/Buildroot-Initialize.cmake
 endef
 
 TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_CMAKE_INSTALL_FILES
diff --git a/support/misc/Buildroot-Initialize.cmake b/support/misc/Buildroot-Initialize.cmake
new file mode 100644
index 0000000000..3451562f08
--- /dev/null
+++ b/support/misc/Buildroot-Initialize.cmake
@@ -0,0 +1 @@
+include(Platform/Linux-Initialize)
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
