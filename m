Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90202C433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47B0A61018;
	Wed, 26 Jan 2022 22:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jgEoYkSlX1VT; Wed, 26 Jan 2022 22:33:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53E8960BD3;
	Wed, 26 Jan 2022 22:33:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67DCD1BF475
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 568904168E
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XWW6ldmE4jNJ for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:33:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 803A040234
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:33:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 05A8E82626; Wed, 26 Jan 2022 22:26:28 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 23:33:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5312db2b1fbddaeb209ffaaefe611d32754a5382
X-Git-Newrev: 49bbf644d4acd3dfe6f3fd0db39e6fed78abf58f
X-Patchwork-Hint: ignore
Message-Id: <20220126222628.05A8E82626@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mongodb: security bump to version
 4.2.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=49bbf644d4acd3dfe6f3fd0db39e6fed78abf58f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2021-20330: An attacker with basic CRUD permissions on a
replicated collection can run the applyOps command with specially
malformed oplog entries, resulting in a potential denial of service on
secondaries. This issue affects MongoDB Server v4.0 versions prior to
4.0.25; MongoDB Server v4.2 versions prior to 4.2.14; MongoDB Server
v4.4 versions prior to 4.4.6.

Drop third patch (already in version)

https://docs.mongodb.com/master/release-notes/4.2/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch | 49 ----------------------
 package/mongodb/mongodb.hash                       |  2 +-
 package/mongodb/mongodb.mk                         |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)

diff --git a/package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch b/package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch
deleted file mode 100644
index 02b35c6e4f..0000000000
--- a/package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From ef08d0dbc99db8c4620512e92bfb3154282eb5d3 Mon Sep 17 00:00:00 2001
-From: Andrew Morrow <acm@mongodb.com>
-Date: Wed, 15 Sep 2021 15:23:42 -0400
-Subject: [PATCH] SERVER-59459 With glibc-2.34, MINSIGSTKSZ is no longer a
- constant
-
-[Retrieved (and backported) from:
-https://github.com/mongodb/mongo/commit/ef08d0dbc99db8c4620512e92bfb3154282eb5d3]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/mongo/stdx/thread.h | 14 ++++++++++----
- 1 file changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/src/mongo/stdx/thread.h b/src/mongo/stdx/thread.h
-index 7b15bb561bd9..6f1e16cdeb36 100644
---- a/src/mongo/stdx/thread.h
-+++ b/src/mongo/stdx/thread.h
-@@ -76,11 +76,19 @@ class SigAltStackController {
-     }
- 
- private:
-+    static size_t _getStackSize() {
-+        // It would be nice for this to be a constexpr, but
-+        // MINSIGSTKSZ became a macro that invoked `sysconf` in glibc
-+        // 2.34.
-+        static const std::size_t kMinSigStkSz = MINSIGSTKSZ;
-+        return std::max(kMongoMinSignalStackSize, kMinSigStkSz);
-+    }
-+
-     void _install() const {
-         stack_t ss;
-         ss.ss_sp = _stackStorage.get();
-         ss.ss_flags = 0;
--        ss.ss_size = kStackSize;
-+        ss.ss_size = _getStackSize();
-         if (sigaltstack(&ss, nullptr)) {
-             abort();
-         }
-@@ -107,9 +115,7 @@ class SigAltStackController {
-     //   ( https://jira.mongodb.org/secure/attachment/233569/233569_stacktrace-writeup.txt )
-     static constexpr std::size_t kMongoMinSignalStackSize = std::size_t{64} << 10;
- 
--    static constexpr std::size_t kStackSize =
--        std::max(kMongoMinSignalStackSize, std::size_t{MINSIGSTKSZ});
--    std::unique_ptr<std::byte[]> _stackStorage = std::make_unique<std::byte[]>(kStackSize);
-+    std::unique_ptr<std::byte[]> _stackStorage = std::make_unique<std::byte[]>(_getStackSize());
- 
- #else   // !MONGO_HAS_SIGALTSTACK
-     auto makeInstallGuard() const {
diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
index 3b2580cc43..02da8ad452 100644
--- a/package/mongodb/mongodb.hash
+++ b/package/mongodb/mongodb.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  ab5a8b6e967614a8ad67c0ca87124c4f380d4a476508973a7995d54ed902b02e  mongodb-src-r4.2.11.tar.gz
+sha256  5bbb9567cc1f358ac7d9f37d9fe749862728bdf9f742d1dfc5e35a8b6c2985ba  mongodb-src-r4.2.18.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  APACHE-2.0.txt
 sha256  09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27  LICENSE-Community.txt
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 92656dd7a4..311b9de14e 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGODB_VERSION = 4.2.11
+MONGODB_VERSION = 4.2.18
 MONGODB_SITE = https://fastdl.mongodb.org/src
 MONGODB_SOURCE = mongodb-src-r$(MONGODB_VERSION).tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
