Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F527C433FE
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 21:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 297F083295;
	Mon,  6 Dec 2021 21:26:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_RwWPqLwZf8; Mon,  6 Dec 2021 21:26:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87D4E8308D;
	Mon,  6 Dec 2021 21:26:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BC9C1BF334
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE65E6062F
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C7t-6c6l-mZU for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 21:24:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99D7A60D7B
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 21:24:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EC1BB81422; Mon,  6 Dec 2021 21:19:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Dec 2021 22:12:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cca24db1dbbacdff458772d54907e8124d2f28d
X-Git-Newrev: fba568a16e9c994591b298d4f0111ed003d9fdc3
X-Patchwork-Hint: ignore
Message-Id: <20211206211935.EC1BB81422@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib/lib_mk.py: check
 typo in define
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

commit: https://git.buildroot.net/buildroot/commit/?id=fba568a16e9c994591b298d4f0111ed003d9fdc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Check typo in define to detect SMAKE_LINUX_CONFIG_FIXUPS in smack
(fixed by 41e2132fbe8a8fc237ca4a2cd2eff9bd9ced09a6)

The new expression will catch "SMAKE_CONF_OPTS" as well as
"define SMAKE_LINUX_CONFIG_FIXUPS"

Two modifications were made:
 - add (define\s+)? which will match "define " but also an empty value.
   Thanks to this, the second group will always contain the variable
   name.
 - remove \s*(\+|)= which seems superfluous

Also, add GCC_TARGET in ALLOWED variable to avoid the following
warnings:

arch/arch.mk:12: possible typo: GCC_TARGET_ARCH -> *ARCH*
arch/arch.mk:13: possible typo: GCC_TARGET_ABI -> *ARCH*
arch/arch.mk:14: possible typo: GCC_TARGET_NAN -> *ARCH*
arch/arch.mk:15: possible typo: GCC_TARGET_FP32_MODE -> *ARCH*
arch/arch.mk:16: possible typo: GCC_TARGET_CPU -> *ARCH*
arch/arch.mk:17: possible typo: GCC_TARGET_FPU -> *ARCH*
arch/arch.mk:18: possible typo: GCC_TARGET_FLOAT_ABI -> *ARCH*
arch/arch.mk:19: possible typo: GCC_TARGET_MODE -> *ARCH*

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_mk.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 0278354434..95501e5515 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -230,6 +230,7 @@ class TypoInPackageVariable(_CheckFunction):
         "BR_CCACHE_INITIAL_SETUP",
         "BR_LIBC",
         "BR_NO_CHECK_HASH_FOR",
+        "GCC_TARGET",
         "LINUX_EXTENSIONS",
         "LINUX_POST_PATCH_HOOKS",
         "LINUX_TOOLS",
@@ -242,7 +243,7 @@ class TypoInPackageVariable(_CheckFunction):
         "TARGET_FINALIZE_HOOKS",
         "TARGETS_ROOTFS",
         "XTENSA_CORE_NAME"]))
-    VARIABLE = re.compile(r"^([A-Z0-9_]+_[A-Z0-9_]+)\s*(\+|)=")
+    VARIABLE = re.compile(r"^(define\s+)?([A-Z0-9_]+_[A-Z0-9_]+)")
 
     def before(self):
         package, _ = os.path.splitext(os.path.basename(self.filename))
@@ -252,7 +253,7 @@ class TypoInPackageVariable(_CheckFunction):
         # linux extensions do not use LINUX_EXT_ prefix for variables
         package = package.replace("LINUX_EXT_", "")
         self.package = package
-        self.REGEX = re.compile(r"^(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(package))
+        self.REGEX = re.compile(r"(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(package))
         self.FIND_VIRTUAL = re.compile(
             r"^{}_PROVIDES\s*(\+|)=\s*(.*)".format(package))
         self.virtual = []
@@ -262,7 +263,7 @@ class TypoInPackageVariable(_CheckFunction):
         if m is None:
             return
 
-        variable = m.group(1)
+        variable = m.group(2)
 
         # allow to set variables for virtual package this package provides
         v = self.FIND_VIRTUAL.search(text)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
