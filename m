Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AD8E77199
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 09:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C90E0405DB;
	Thu,  9 Jan 2025 09:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qhln4xFRnECF; Thu,  9 Jan 2025 09:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDCD8403ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDCD8403ED;
	Thu,  9 Jan 2025 09:24:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 21AA3942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DFF940103
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id om4Qizn5Bm38 for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 09:24:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D663240B23
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D663240B23
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:24:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D199484241; Thu,  9 Jan 2025 09:24:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jan 2025 10:05:10 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 0ad5993c480f3b1c50f9a32d486e9d9f96f37bfc
X-Git-Newrev: e74d8d11990bded1b7d7b40bf8e2962dc557046c
X-Patchwork-Hint: ignore
Message-Id: <20250109092421.D199484241@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/opensc: fix build
 issue since bump to 0.26
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e74d8d11990bded1b7d7b40bf8e2962dc557046c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Buildroot commit
1f4b4ccde7ceb379010aeb93458792202622d64b ("package/opensc: security
bump to version 0.26.0") bumped opensc from 0.24 to 0.26, and the
build started failing with:

pkcs11-tool.c:7854:45: warning: implicit declaration of function 'EVP_bf_cbc'; did you mean 'EVP_sm4_cbc'? [-Wimplicit-function-declaration]

on configurations that have BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH
disabled (it is not explicitly selected by this package).

Our initial fix was to simply select
BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH, but when investigating when
EVP_bf_cbc() started being used in OpenSC, we discovered it has been
in use for a while... but in code that kept being disabled from
version to version as it was broken (upstream bug
https://github.com/OpenSC/OpenSC/issues/1796), but it was apparently
forgotten to be disabled again for 0.26 (the issue is still
open). Therefore, we opted to continue disabling this known broken
part of the code, and submit an upstream PR for that
https://github.com/OpenSC/OpenSC/pull/3303, which ultimately will
clarify what is the right fix.

In the mean time, this allows to fix the build issue.

Fixes:

  http://autobuild.buildroot.net/results/ca51b3e8e3ac83e2a69814caa84d9862385b956f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5d7ab604d24e13cfd6dd57ee95171fac0bf45b63)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-disable-wrap-unwrap-test-until-OpenSC-17.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/opensc/0001-pkcs11-tool-disable-wrap-unwrap-test-until-OpenSC-17.patch b/package/opensc/0001-pkcs11-tool-disable-wrap-unwrap-test-until-OpenSC-17.patch
new file mode 100644
index 0000000000..9bf601370a
--- /dev/null
+++ b/package/opensc/0001-pkcs11-tool-disable-wrap-unwrap-test-until-OpenSC-17.patch
@@ -0,0 +1,41 @@
+From 768c9bfcd91206f0d85cd4757fde48e00850a014 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Mon, 6 Jan 2025 22:36:10 +0100
+Subject: [PATCH] pkcs11-tool: disable wrap/unwrap test until OpenSC#1796 is
+ resolved
+
+Similar to ab74fae4d71d1705b77b9459141987a95dcfc91e ("pkcs11-tool:
+disable wrap/unwrap test until OpenSC#1796 is resolved"), but for
+0.26, since OpenSC#1796 is still open.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/OpenSC/OpenSC/pull/3303
+---
+ src/tools/pkcs11-tool.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/tools/pkcs11-tool.c b/src/tools/pkcs11-tool.c
+index d701d76d6..871a39977 100644
+--- a/src/tools/pkcs11-tool.c
++++ b/src/tools/pkcs11-tool.c
+@@ -7681,7 +7681,7 @@ static int test_verify(CK_SESSION_HANDLE sess)
+ 	return errors;
+ }
+ 
+-#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 25
++#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 26
+ #else
+ #ifdef ENABLE_OPENSSL
+ static int wrap_unwrap(CK_SESSION_HANDLE session,
+@@ -7805,7 +7805,7 @@ static int wrap_unwrap(CK_SESSION_HANDLE session,
+  */
+ static int test_unwrap(CK_SESSION_HANDLE sess)
+ {
+-#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 25
++#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 26
+ 	/* temporarily disable test, see https://github.com/OpenSC/OpenSC/issues/1796 */
+ 	return 0;
+ #else
+-- 
+2.47.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
