Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D423C7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC44261355;
	Thu, 26 Jun 2025 19:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjaLu4w9FQMm; Thu, 26 Jun 2025 19:50:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65C1061260
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65C1061260;
	Thu, 26 Jun 2025 19:49:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79D2410A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDF30843D3
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDAORU9EzPEI for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:49:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81FB5843DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81FB5843DD
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D79B84057; Thu, 26 Jun 2025 19:49:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 24 Jun 2025 20:44:16 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: ebe6cba2b13bf167bbbaf0f20ea2dcf0361f1b5d
X-Git-Newrev: 883c977c9a65432b408f33a7d445ba6b16a36647
X-Patchwork-Hint: ignore
Message-Id: <20250626194922.7D79B84057@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/python-glslang:
 bump to version 15.3.0
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
Content-Type: multipart/mixed; boundary="===============2414208273443717850=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2414208273443717850==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=883c977c9a65432b408f33a7d445ba6b16a36647
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

See changelog:
https://github.com/KhronosGroup/glslang/blob/15.3.0/CHANGES.md

Fixes build issue: error: ‘uint32_t’ has not been declared, encountered
on GCC v15, caused by cstdint not being implicitly included.

https://bugs.gentoo.org/937261

This commit also adds host-spriv-tools in _DEPENDENCIES to use the
version packaged in Buildroot. It also adds
ALLOW_EXTERNAL_SPIRV_TOOLS=ON in _CONF_OPTS, which was added in upstream
commit [1], introduced in version 13.0.0.

Also, when trying to build this python-glslang version 15.3.0 on a host
providing cmake < 3.26, the configuration fails with the error message:

    CMake Error at CMakeLists.txt:345 (add_test):
      Error evaluating generator expression:

        $<TARGET_RUNTIME_DLL_DIRS:spirv-remap>

      Expression did not evaluate to a known generator expression

This happens in the Buildroot docker reference image, which provides a
cmake version 3.25. To workaround this issue which happen in glslang
testing code, this commit disable those tests by adding
GLSLANG_TESTS=OFF in _CONF_OPTS.

[1] https://github.com/KhronosGroup/glslang/commit/3805888a57c07904b6bbdec639bfe5f078e26342

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
[Julien:
 - resolve merge conflict
 - update changelog link to use version tag
 - disable glslang tests
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 53076f0eba85c53bcbee43cdd81a0d584ba5be22)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-glslang/python-glslang.hash | 2 +-
 package/python-glslang/python-glslang.mk   | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/python-glslang/python-glslang.hash b/package/python-glslang/python-glslang.hash
index df9127939e..04ec5313a0 100644
--- a/package/python-glslang/python-glslang.hash
+++ b/package/python-glslang/python-glslang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  592c98aeb03b3e81597ddaf83633c4e63068d14b18a766fd11033bad73127162  python-glslang-11.13.0.tar.gz
+sha256  c6c21fe1873c37e639a6a9ac72d857ab63a5be6893a589f34e09a6c757174201  python-glslang-15.3.0.tar.gz
 sha256  adb783e734e906d1f46db5df29991dbde84bdb0ceab502ac2febb44fe3c2b5f4  LICENSE.txt
diff --git a/package/python-glslang/python-glslang.mk b/package/python-glslang/python-glslang.mk
index c3e87da94a..cda95eb8a2 100644
--- a/package/python-glslang/python-glslang.mk
+++ b/package/python-glslang/python-glslang.mk
@@ -4,10 +4,14 @@
 #
 ################################################################################
 
-PYTHON_GLSLANG_VERSION = 11.13.0
+PYTHON_GLSLANG_VERSION = 15.3.0
 PYTHON_GLSLANG_SITE = $(call github,KhronosGroup,glslang,$(PYTHON_GLSLANG_VERSION))
 PYTHON_GLSLANG_LICENSE = BSD-3-Clause
 PYTHON_GLSLANG_LICENSE_FILES = LICENSE.txt
-HOST_PYTHON_GLSLANG_DEPENDENCIES = host-python3
+HOST_PYTHON_GLSLANG_DEPENDENCIES = host-python3 host-spirv-tools
+
+HOST_PYTHON_GLSLANG_CONF_OPTS += \
+	-DALLOW_EXTERNAL_SPIRV_TOOLS=ON \
+	-DGLSLANG_TESTS=OFF
 
 $(eval $(host-cmake-package))

--===============2414208273443717850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2414208273443717850==--
