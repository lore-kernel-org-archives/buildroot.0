Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8417FC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05C65703DE;
	Fri, 28 Feb 2025 17:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YshC_02ZnvAz; Fri, 28 Feb 2025 17:15:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E901970901
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E901970901;
	Fri, 28 Feb 2025 17:15:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03BD91DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7594442FD8
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrDu-w-E9xsP for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F13344398C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F13344398C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBFC586780; Fri, 28 Feb 2025 16:30:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 20:53:42 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c04f4b27c6ed93c52f2cd5e2df0c4fb8ae1ea9fc
X-Git-Newrev: 91f3e387fdb53c7b48044b53a11acf4954630d6c
X-Patchwork-Hint: ignore
Message-Id: <20250228163035.EBFC586780@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ola: fix protoc
 version checking
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=91f3e387fdb53c7b48044b53a11acf4954630d6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Backport patches fixing protoc version checking.

Fixes:
checking protoc version... expr: syntax error: unexpected argument '2'
configure: error: protoc version too old libprotoc 28.1 < 2.3.0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...2-Fix-protoc-version-checking-since-v20.x.patch | 35 ++++++++++++++++++++++
 ...k-correctly-match-multi-digit-major-versi.patch | 28 +++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/package/ola/0002-Fix-protoc-version-checking-since-v20.x.patch b/package/ola/0002-Fix-protoc-version-checking-since-v20.x.patch
new file mode 100644
index 0000000000..ee98c5569d
--- /dev/null
+++ b/package/ola/0002-Fix-protoc-version-checking-since-v20.x.patch
@@ -0,0 +1,35 @@
+From d4414feefd95adf9c91d7eaf1e94380296c35f7a Mon Sep 17 00:00:00 2001
+From: Peter Newman <peternewman@users.noreply.github.com>
+Date: Fri, 7 Jul 2023 15:57:35 +0100
+Subject: [PATCH] Fix protoc version checking, since v20.x (cherry picked from
+ commit 2e55aa88756718d8ab4a4c8fde97d620542c2c98)
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/OpenLightingProject/ola/commit/d4414feefd95adf9c91d7eaf1e94380296c35f7a
+---
+ config/ola.m4 | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/config/ola.m4 b/config/ola.m4
+index f838ab70a..51b6c825c 100644
+--- a/config/ola.m4
++++ b/config/ola.m4
+@@ -44,7 +44,14 @@ if test -z "$PROTOC" ; then
+   AC_MSG_ERROR([cannot find 'protoc' program]);
+ elif test -n "$1" ; then
+   AC_MSG_CHECKING([protoc version])
+-  [protoc_version=`$PROTOC --version 2>&1 | grep 'libprotoc' | sed 's/.*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/g'`]
++  # Since v20.x we only get effectively the minor and patch versions out of protoc.
++  # Treat them as major and minor and everything should keep working indefinitely.
++  # See https://protobuf.dev/support/version-support/
++  # So we've got either of these:
++  # libprotoc 2.4.1
++  # libprotoc 23.3
++  # The first sed ensures all versions have major, minor, patch, by adding a .0 on the end of ones missing it
++  [protoc_version=`$PROTOC --version 2>&1 | grep 'libprotoc' | sed 's/\([^\.0-9][0-9][0-9]*\.[0-9][0-9]*\)$/\1\.0/g' | sed 's/.*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/g'`]
+   [required=$1]
+   [required_major=`echo $required | sed 's/[^0-9].*//'`]
+   [required_minor=`echo $required | sed 's/[0-9][0-9]*\.\([0-9][0-9]*\)\.[0-9][0-9]*/\1/'`]
+-- 
+2.34.1
+
diff --git a/package/ola/0003-Protoc-check-correctly-match-multi-digit-major-versi.patch b/package/ola/0003-Protoc-check-correctly-match-multi-digit-major-versi.patch
new file mode 100644
index 0000000000..cee2c7eb43
--- /dev/null
+++ b/package/ola/0003-Protoc-check-correctly-match-multi-digit-major-versi.patch
@@ -0,0 +1,28 @@
+From 546d9ee8d970c4e5b33d9d28b4acf6eb34f27a5d Mon Sep 17 00:00:00 2001
+From: Peter Newman <peternewman@users.noreply.github.com>
+Date: Fri, 7 Jul 2023 16:14:21 +0100
+Subject: [PATCH] Protoc check - correctly match multi-digit major versions
+ (cherry picked from commit 69a2946622cdfce54cb6ed7f2210df2be0ec5576)
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/OpenLightingProject/ola/commit/546d9ee8d970c4e5b33d9d28b4acf6eb34f27a5d
+---
+ config/ola.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/ola.m4 b/config/ola.m4
+index 51b6c825c..eacee5d94 100644
+--- a/config/ola.m4
++++ b/config/ola.m4
+@@ -51,7 +51,7 @@ elif test -n "$1" ; then
+   # libprotoc 2.4.1
+   # libprotoc 23.3
+   # The first sed ensures all versions have major, minor, patch, by adding a .0 on the end of ones missing it
+-  [protoc_version=`$PROTOC --version 2>&1 | grep 'libprotoc' | sed 's/\([^\.0-9][0-9][0-9]*\.[0-9][0-9]*\)$/\1\.0/g' | sed 's/.*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/g'`]
++  [protoc_version=`$PROTOC --version 2>&1 | grep 'libprotoc' | sed 's/\([^\.0-9][0-9][0-9]*\.[0-9][0-9]*\)$/\1\.0/g' | sed 's/[^0-9]*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/g'`]
+   [required=$1]
+   [required_major=`echo $required | sed 's/[^0-9].*//'`]
+   [required_minor=`echo $required | sed 's/[0-9][0-9]*\.\([0-9][0-9]*\)\.[0-9][0-9]*/\1/'`]
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
