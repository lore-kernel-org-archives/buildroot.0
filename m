Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3BAD59F67
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 21:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9708C80C73;
	Wed,  6 Nov 2024 21:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0IqrBud6PfBJ; Wed,  6 Nov 2024 21:21:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADBA6813DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADBA6813DA;
	Wed,  6 Nov 2024 21:21:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D22313B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0D7681362
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6YokhCqENv5 for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 21:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEBDB80C73
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEBDB80C73
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:21:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E67DF85E99; Wed,  6 Nov 2024 21:21:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Nov 2024 22:19:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bca077698f9c32775b31af554aaee068a1429479
X-Git-Newrev: b1ce2522b4e469ee738b1a141299ff99db70ef13
X-Patchwork-Hint: ignore
Message-Id: <20241106212112.E67DF85E99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/collectd: fix protoc version check
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b1ce2522b4e469ee738b1a141299ff99db70ef13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to add a patch fixing the protoc version check in collectd's
configure script, prior to bumping protobuf to a newer version.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...004-configure.ac-fix-protoc-version-check.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/collectd/0004-configure.ac-fix-protoc-version-check.patch b/package/collectd/0004-configure.ac-fix-protoc-version-check.patch
new file mode 100644
index 0000000000..edf5008f03
--- /dev/null
+++ b/package/collectd/0004-configure.ac-fix-protoc-version-check.patch
@@ -0,0 +1,48 @@
+From 77f33d05355b115d3384d94c1c4e36c56ea28b09 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Wed, 30 Oct 2024 12:45:51 -0600
+Subject: [PATCH] configure.ac: fix protoc version check
+
+The current version check for 3.0.0+ fails to handle cases where
+protoc is above version 3.0.0 but does not start with a 3, for
+example protoc may have a version of 28.1.
+
+To fix this use AX_COMPARE_VERSION to properly compare the version.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/collectd/collectd/pull/4332
+---
+ configure.ac | 17 ++++++++++-------
+ 1 file changed, 10 insertions(+), 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 86d2378b..1f7a9cdf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4897,13 +4897,16 @@ AC_PATH_PROG([PROTOC], [protoc])
+ have_protoc3="no"
+ if test "x$PROTOC" != "x"; then
+   AC_MSG_CHECKING([for protoc 3.0.0+])
+-  if $PROTOC --version | $EGREP libprotoc.3 >/dev/null; then
+-    protoc3="yes (`$PROTOC --version`)"
+-    have_protoc3="yes"
+-  else
+-    protoc3="no (`$PROTOC --version`)"
+-  fi
+-  AC_MSG_RESULT([$protoc3])
++  AC_SUBST([PROTOC_VERSION], [`$PROTOC --version | cut -d ' ' -f 2`])
++  AX_COMPARE_VERSION([$PROTOC_VERSION],[ge],[3],
++    [
++      have_protoc3="yes"
++      AC_MSG_RESULT([yes ($PROTOC_VERSION)])
++    ],
++    [
++      AC_MSG_RESULT([no ($PROTOC_VERSION)])
++    ]
++  )
+ fi
+ AM_CONDITIONAL([HAVE_PROTOC3], [test "x$have_protoc3" = "xyes"])
+ 
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
