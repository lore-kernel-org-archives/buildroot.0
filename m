Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4734C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3861E42A0F;
	Fri, 28 Feb 2025 16:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCj9hUEkIGEl; Fri, 28 Feb 2025 16:35:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E68EC4F1E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E68EC4F1E8;
	Fri, 28 Feb 2025 16:35:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13CBE1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCE624240C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oU7FwaiIVfkj for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46BD041812
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46BD041812
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42A8A874C1; Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Dec 2024 22:44:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ee65a2119aba93692970ae83e083974ef865c15b
X-Git-Newrev: 1eec67d164c7087aa0bed30599681e908fb2fb41
X-Patchwork-Hint: ignore
Message-Id: <20250228162932.42A8A874C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/android-tools: fix
 b64_pton() issue with GCC >= 14.x
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0402568697888156044=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0402568697888156044==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1eec67d164c7087aa0bed30599681e908fb2fb41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The android-tools code base uses the __b64_pton() function, which
isn't provided by all C libraries. So the Debian patch
debian/patches/add_adbd.patch adds an implementation of b64_pton(),
but doesn't actually use it, nor defines a prototype for it. Our
existing patch 0003-Fix-build-issue-with-uclibc.patch switches the
code to use the b64_pton() function... but still without providing a
prototype, causing the following build failures with GCC >= 14.x:

adb_auth_client.c:75:15: error: implicit declaration of function 'b64_pton'

To fix this, we rework 0003-Fix-build-issue-with-uclibc.patch into a
patch that:

 (1) Renames b64_pton() to adb_b64_pton() to make sure it won't clash
     with implementations provided by some C libraries, and adjusts
     the call sites accordingly.

 (2) Adds a prototype definition of adb_b64_pton() in places where
     this function is used.

Fixes:

  http://autobuild.buildroot.net/results/b25b25337c7ad89c33f8bd20b646850bd993ec53ae9/

Even though GCC 14.x support was merged in Buildroot in May 2024, this
particular b64_pton() only started appearing on July 15 2024, with the
first occurence being:

  http://autobuild.buildroot.net/results/1cbe87bbe3c56f28444b3aaba1ba1d05f947d36e/

Indeed, it's not before July 15 2024 that we merged commit
d201f2f5cd0d1e0389430cda78adead37977a6cd ("package/android-tools: add
patches to fix build with GCC 14.x"), which fixed other GCC 14.x
issues, which were hiding this b64_pton() problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                                |  1 -
 .../0003-Adjust-base64-function-handling.patch     | 96 ++++++++++++++++++++++
 .../0003-Fix-build-issue-with-uclibc.patch         | 40 ---------
 3 files changed, 96 insertions(+), 41 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 11e410b4ea..0dcca5ebc7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -271,7 +271,6 @@ package/am33x-cm3/0004-Makefile-add-fno-builtin.patch lib_patch.Upstream
 package/am33x-cm3/S93-am335x-pm-firmware-load lib_sysv.Variables
 package/android-tools/0001-Fix-makefiles-for-out-of-tree-build.patch lib_patch.Upstream
 package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch lib_patch.Upstream
-package/android-tools/0003-Fix-build-issue-with-uclibc.patch lib_patch.Upstream
 package/android-tools/0004-Fix-build-issue-with-musl.patch lib_patch.Upstream
 package/android-tools/0005-makefiles-use-pkgconf-to-get-libs-deps.patch lib_patch.Upstream
 package/android-tools/0006-Fix-build-on-big-endian-systems.patch lib_patch.Upstream
diff --git a/package/android-tools/0003-Adjust-base64-function-handling.patch b/package/android-tools/0003-Adjust-base64-function-handling.patch
new file mode 100644
index 0000000000..30a6e680b9
--- /dev/null
+++ b/package/android-tools/0003-Adjust-base64-function-handling.patch
@@ -0,0 +1,96 @@
+From 946dbb00fe4b2a75c688a470fc0c3924aa018a24 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 14 Jul 2024 11:39:49 +0200
+Subject: [PATCH] Adjust base64 function handling
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In order to support libcs that do not provide b64_pton(), one of the
+Debian patches adds a copy of b64_pton() and b64_ntop(). However, no
+prototype is added for those functions, causing an "implicit
+declaration" warning... or error depending on the compiler version
+used:
+
+core/adbd/adb_auth_client.c:75:15: error: implicit declaration of function ‘b64_pton’ [-Wimplicit-function-declaration]
+
+This patch adds appropriate prototypes, but while at it, also renames
+the internal copy of b64_*() functions to have an adb_ prefix in order
+to clarify things and not clash with definitions potentially coming
+from the C library.
+
+Upstream: N/A, we're too far from upstream
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ core/adb/adb_auth_client.c  | 3 ++-
+ core/adbd/adb_auth_client.c | 3 ++-
+ core/adbd/base64.c          | 4 ++--
+ 3 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/core/adb/adb_auth_client.c b/core/adb/adb_auth_client.c
+index 0b4913e..25b9828 100644
+--- a/core/adb/adb_auth_client.c
++++ b/core/adb/adb_auth_client.c
+@@ -45,6 +45,7 @@ static char *key_paths[] = {
+ static fdevent listener_fde;
+ static int framework_fd = -1;
+ 
++extern int adb_b64_pton(char const *src, u_char *target, size_t targsize);
+ 
+ static void read_keys(const char *file, struct listnode *list)
+ {
+@@ -72,7 +73,7 @@ static void read_keys(const char *file, struct listnode *list)
+         if (sep)
+             *sep = '\0';
+ 
+-        ret = __b64_pton(buf, (u_char *)&key->key, sizeof(key->key) + 4);
++        ret = adb_b64_pton(buf, (u_char *)&key->key, sizeof(key->key) + 4);
+         if (ret != sizeof(key->key)) {
+             D("%s: Invalid base64 data ret=%d\n", file, ret);
+             free(key);
+diff --git a/core/adbd/adb_auth_client.c b/core/adbd/adb_auth_client.c
+index 0b4913e..25b9828 100644
+--- a/core/adbd/adb_auth_client.c
++++ b/core/adbd/adb_auth_client.c
+@@ -45,6 +45,7 @@ static char *key_paths[] = {
+ static fdevent listener_fde;
+ static int framework_fd = -1;
+ 
++extern int adb_b64_pton(char const *src, u_char *target, size_t targsize);
+ 
+ static void read_keys(const char *file, struct listnode *list)
+ {
+@@ -72,7 +73,7 @@ static void read_keys(const char *file, struct listnode *list)
+         if (sep)
+             *sep = '\0';
+ 
+-        ret = __b64_pton(buf, (u_char *)&key->key, sizeof(key->key) + 4);
++        ret = adb_b64_pton(buf, (u_char *)&key->key, sizeof(key->key) + 4);
+         if (ret != sizeof(key->key)) {
+             D("%s: Invalid base64 data ret=%d\n", file, ret);
+             free(key);
+diff --git a/core/adbd/base64.c b/core/adbd/base64.c
+index 7270703..91fc1b2 100644
+--- a/core/adbd/base64.c
++++ b/core/adbd/base64.c
+@@ -134,7 +134,7 @@ static const char Pad64 = '=';
+    */
+ 
+ int
+-b64_ntop(src, srclength, target, targsize)
++adb_b64_ntop(src, srclength, target, targsize)
+ 	u_char const *src;
+ 	size_t srclength;
+ 	char *target;
+@@ -212,7 +212,7 @@ b64_ntop(src, srclength, target, targsize)
+  */
+ 
+ int
+-b64_pton(src, target, targsize)
++adb_b64_pton(src, target, targsize)
+ 	char const *src;
+ 	u_char *target;
+ 	size_t targsize;
+-- 
+2.47.0
+
diff --git a/package/android-tools/0003-Fix-build-issue-with-uclibc.patch b/package/android-tools/0003-Fix-build-issue-with-uclibc.patch
deleted file mode 100644
index a951271873..0000000000
--- a/package/android-tools/0003-Fix-build-issue-with-uclibc.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 082ee80d3524fa3474644c09b441d7f7947675cc Mon Sep 17 00:00:00 2001
-From: Gary Bisson <gary.bisson@boundarydevices.com>
-Date: Sun, 1 Dec 2024 15:43:56 +0100
-Subject: [PATCH] Fix build issue with uclibc
-
-Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
----
- core/adb/adb_auth_client.c  | 2 +-
- core/adbd/adb_auth_client.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/core/adb/adb_auth_client.c b/core/adb/adb_auth_client.c
-index 0b4913e..068d837 100644
---- a/core/adb/adb_auth_client.c
-+++ b/core/adb/adb_auth_client.c
-@@ -72,7 +72,7 @@ static void read_keys(const char *file, struct listnode *list)
-         if (sep)
-             *sep = '\0';
- 
--        ret = __b64_pton(buf, (u_char *)&key->key, sizeof(key->key) + 4);
-+        ret = b64_pton(buf, (u_char *)&key->key, sizeof(key->key) + 4);
-         if (ret != sizeof(key->key)) {
-             D("%s: Invalid base64 data ret=%d\n", file, ret);
-             free(key);
-diff --git a/core/adbd/adb_auth_client.c b/core/adbd/adb_auth_client.c
-index 0b4913e..068d837 100644
---- a/core/adbd/adb_auth_client.c
-+++ b/core/adbd/adb_auth_client.c
-@@ -72,7 +72,7 @@ static void read_keys(const char *file, struct listnode *list)
-         if (sep)
-             *sep = '\0';
- 
--        ret = __b64_pton(buf, (u_char *)&key->key, sizeof(key->key) + 4);
-+        ret = b64_pton(buf, (u_char *)&key->key, sizeof(key->key) + 4);
-         if (ret != sizeof(key->key)) {
-             D("%s: Invalid base64 data ret=%d\n", file, ret);
-             free(key);
--- 
-2.47.0
-

--===============0402568697888156044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0402568697888156044==--
