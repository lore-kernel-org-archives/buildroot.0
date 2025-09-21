Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457B8CAC59A
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 15:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF51683E6C;
	Sun, 21 Sep 2025 15:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vj72rdZQsgys; Sun, 21 Sep 2025 15:16:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0045A83E48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0045A83E48;
	Sun, 21 Sep 2025 15:16:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC4E8E7
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 15:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9242D400E0
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 15:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iY_gCpAQadCv for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 15:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6090340071
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6090340071
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 15:16:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A0258608D; Sun, 21 Sep 2025 15:16:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Sep 2025 17:15:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d2abdc66ca687c926e1c4546c12aca7f7d72ca4
X-Git-Newrev: 5208b7a1bde348c60a40ca6a62526d95a9ce93f6
X-Patchwork-Hint: ignore
Message-Id: <20250921151655.5A0258608D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestZfsUclibc: use
 internal backend for uClibc-ng toolchain
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
Content-Type: multipart/mixed; boundary="===============6542602603748710665=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6542602603748710665==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5208b7a1bde348c60a40ca6a62526d95a9ce93f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported on the mailing list [1] while investigating the
TestZfsUclibc Gitlab-CI failure, the python 3.13 interpreter itsef
segfault at runtime:

  Fatal Python error: _PyThreadState_Attach: non-NULL old thread state
  Python runtime state: preinitialized
  Thread 0xSegmentation fault

This issue is related to the python 3.13 version bump [2] were several
internal changes were added [3] to support PEP 703 [4].
PEP 793 is about CPython’s global interpreter lock (“GIL”) removal
for multi-threads support that requires a working C11 "thread_local"
for thread-local storage [5].

The new uclibc-ng 1.0.55 release contains a fix for this issue [6].
This version is included in Buildroot commit [7].

Since the prebuilt Bootling aarch64 uclibc stable 2025.08-1 is based
on previous uClibc-ng release (1.0.54) we have to use the internal
toolchain backend to build a new uClibc-ng toolchain using uclibc-ng
1.0.55. Note: the toolchain config defined in this commit reflects
the options enabled in the Bootling aarch64 uclibc external
toolchains.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124859 (TestZfsUclibc)

[1] https://lore.kernel.org/buildroot/7a4d245d-1556-43c9-8997-6b1f791afbfe@gmail.com/ (TestZfsUclibc)
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/d63e207eb869063f82c867658676c2903beb08cb
[3] https://github.com/python/cpython/commit/6e97a9647ae028facb392d12fc24973503693bd6
[4] https://peps.python.org/pep-0703/
[5] https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Thread-Local.html
[6] https://github.com/wbx-github/uclibc-ng/commit/94c1297d52263e20cd9715601afa37f49d008d93
[7] https://gitlab.com/buildroot.org/buildroot/-/commit/5250bba8e5b1aaeb58977baf1d91e2be66656476

Cc: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Tested-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Julien:
 - add link to buildroot commit updating uclibc-ng to 1.0.55
 - add a note in the commit log about the toolchain config
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_zfs.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
index 1b907ac4de..c218cc36a8 100644
--- a/support/testing/tests/package/test_zfs.py
+++ b/support/testing/tests/package/test_zfs.py
@@ -74,9 +74,18 @@ class TestZfsGlibc(TestZfsBase):
 
 
 class TestZfsUclibc(TestZfsBase):
-    config = TestZfsBase.config + \
+    # The Bootling aarch64 uclibc stable 2025.08-1 needs to be
+    # rebuild with uClibc-ng 1.0.55.
+    # See: https://github.com/wbx-github/uclibc-ng/commit/94c1297d52263e20cd9715601afa37f49d008d93
+    config = TestZfsBase.config.replace('BR2_TOOLCHAIN_EXTERNAL=y\n', '')
+    config = config.replace('BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y\n', '') + \
         """
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE=y
+        BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
+        BR2_KERNEL_HEADERS_5_4=y
+        BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+        BR2_PTHREAD_DEBUG=y
+        BR2_TOOLCHAIN_BUILDROOT_CXX=y
+        BR2_GCC_ENABLE_OPENMP=y
         """
 
     def test_run(self):

--===============6542602603748710665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6542602603748710665==--
