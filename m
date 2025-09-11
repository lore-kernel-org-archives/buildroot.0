Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFADCAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 204816F497;
	Thu, 11 Sep 2025 19:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bOsYIglLcp10; Thu, 11 Sep 2025 19:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 301446F54C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 301446F54C;
	Thu, 11 Sep 2025 19:01:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CF73E20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F8944089D
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dIwi_VixihF for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60FD0408FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60FD0408FD
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DEF4842A1; Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 18:01:15 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: dfe009868bce02b9cf4fc8d37f511706422eface
X-Git-Newrev: 3c67d118820e5cf8f2e6ad4fc2dd74dc8cf223f8
X-Patchwork-Hint: ignore
Message-Id: <20250911190109.5DEF4842A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] support/testing:
 test_hardening: update toolchain to aarch64 for checksec tests
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3c67d118820e5cf8f2e6ad4fc2dd74dc8cf223f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

TestRelroPartial is broken since the last checksec update to 2.7.1 [1]
(Buildroot 2024.08) due to a relro check fix [2] that doesn't work for
powerpc architecture where .got.plt doesn't exist for some reasons
(that's why the expected result "full" is replaced by "Partial").

From [3]:

  if ${readelf} -d "${1}/exe" 2> /dev/null | grep -q 'BIND_NOW' || ! ${readelf} -l "${1}/exe" 2> /dev/null | grep -q '\.got\.plt'; then
    echo_message '\033[32mFull RELRO   \033[m   ' 'Full RELRO,' ' relro="full"' '"relro":"full",'
  else
    echo_message '\033[33mPartial RELRO\033[m   ' 'Partial RELRO,' ' relro="partial"' '"relro":"partial",'

checksec tool is problably tested upstream on more common architectures
like x86_64 or aarch64 than powerpc64 e5500. This may explain why
checksec broke on powerpc64 e5500 target.

Also, the Booltin powerpc64-e5500--glibc--stable-2018.02-2 toolchain
used by test_hardening tests was not updated since the hardening tests
were introduced back in 2018.11 release.

So, switch to the current Bootling aarch64 stable toolchain
(currently Bootlin aarch64 glibc stable 2025.08-1).

Checked that all 6 hardening tests pass with this new toolchain:

  tests.core.test_hardening.TestFortifyConserv
  tests.core.test_hardening.TestFortifyNone
  tests.core.test_hardening.TestRelro
  tests.core.test_hardening.TestRelroPartial
  tests.core.test_hardening.TestSspNone
  tests.core.test_hardening.TestSspStrong

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11176773995 (TestRelroPartial)

[1] 61505649746cb4d0dd57e35ff6139b7925bab72d
[2] https://github.com/slimm609/checksec/commit/1c80e39c4956f902ed15c4baa8d9c17851096900
[3] https://github.com/slimm609/checksec/commit/1c80e39c4956f902ed15c4baa8d9c17851096900#diff-9e8d1b28dfaf1c704560ac51a5613b70d70de2dcd84e87b9fa20f28811e6484aL1491

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 10e289e0a970d2852fea18e3d9833f0f37b2959b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/core/test_hardening.py | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/support/testing/tests/core/test_hardening.py b/support/testing/tests/core/test_hardening.py
index e9d30f3a38..2daafbd883 100644
--- a/support/testing/tests/core/test_hardening.py
+++ b/support/testing/tests/core/test_hardening.py
@@ -7,16 +7,10 @@ import infra.basetest
 class TestHardeningBase(infra.basetest.BRTest):
     config = \
         """
-        BR2_powerpc64=y
-        BR2_powerpc_e5500=y
+        BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2018.02-2.tar.bz2"
-        BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
-        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-        BR2_TOOLCHAIN_EXTERNAL_CXX=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
         BR2_PACKAGE_LIGHTTPD=y
         BR2_PACKAGE_HOST_CHECKSEC=y
         # BR2_TARGET_ROOTFS_TAR is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
