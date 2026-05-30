Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C1ECD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9B628119C;
	Sat, 30 May 2026 09:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JndJABJSJGzE; Sat, 30 May 2026 09:59:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C87B6811DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780135187;
	bh=lnD8j/S+1b7r3GNjnTgv0rX01VdF/OaXyQMVXHxNVmM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N2c5CUVNLynU1nWC9Wdu6LLU+EOkp+1LY2Fe/bA47nrtifxxaDkG8KruU42Ifm/r+
	 DlSCmRwv83XJuN1KQg0ePgFnskS8nviReI04ezRVKJSTFb1O14uY5W7iuEtlzHBmPn
	 Rm6wQCQB1oXuJWFaV5EJoQIaaoNEKMLKY8K6mwSXiN+g9698XRPLK8VsIsWZ3mpjOl
	 cs4wnCurvwBbPVylIqxDmWYNHQxAFmejqN2lO5TUINtFIljl8EMHqBpbpLC5UzZopK
	 FNLrZiZfK6FLu8O3wDc+X7Pj28N6QL1M82RqLPoxe7L0Dyt1Wr/UAHW5CcImftq3hy
	 tbUXCFnsbsycg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C87B6811DD;
	Sat, 30 May 2026 09:59:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E755812F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C891B6F47F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdKsPtlX6Lhb for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:59:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0664F6F37B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0664F6F37B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:59:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 005F68705E; Sat, 30 May 2026 09:59:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 11:58:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c44987411c79256c47dfd34c0c48b2235c56cf4f
X-Git-Newrev: f0540ff5317db497510a6b5beec0e406d09373cf
X-Patchwork-Hint: ignore
Message-Id: <20260530095932.005F68705E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: fix LSMT_ROOT fallback
 definition
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f0540ff5317db497510a6b5beec0e406d09373cf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The fallback definition for LSMT_ROOT was incorrectly guarded
with #ifdef instead of #ifndef, making it ineffective. This caused
build issues on configurations with musl 1.2.6, which defines
SYS_statmount making util-linux consider statmount() as available, but
having older kernel headers, not providing LSMT_ROOT.

Fixes:

  http://autobuild.buildroot.net/results/ac2bc633db0c605564c79bfdfa0e257a9b4f1b28/

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ount-api-utils.h-fix-LSMT_ROOT-definition.patch | 44 ++++++++++++++++++++++
 ...ount-api-utils.h-fix-LSMT_ROOT-definition.patch | 44 ++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch b/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
new file mode 100644
index 0000000000..d98c225500
--- /dev/null
+++ b/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
@@ -0,0 +1,44 @@
+From 72ff3b8998a675900fcb7c18c0e03f1552b13a8b Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Tue, 14 Apr 2026 11:04:08 +0530
+Subject: [PATCH] include/mount-api-utils.h: fix LSMT_ROOT definition
+
+Commit
+ded434a63f3eee7fd7805b18d6c9bb912016c3c8 ("include/mount-api-utils:
+add statmount and listmount") introduce a fallback definition for the
+LSMT_ROOT defined, but a small typo makes this fallback definition
+ineffective:
+
+ #ifdef LSMT_ROOT
+ # define LSMT_ROOT ...
+ #endif
+
+Should obviously have been:
+
+ #ifndef LSMT_ROOT
+ # define LSMT_ROOT ...
+ #endif
+
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Upstream: https://lore.kernel.org/util-linux/20260530094932.2351791-1-thomas.petazzoni@bootlin.com/T/#u
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ include/mount-api-utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/mount-api-utils.h b/include/mount-api-utils.h
+index a916f99..87e173e 100644
+--- a/include/mount-api-utils.h
++++ b/include/mount-api-utils.h
+@@ -339,7 +339,7 @@ struct ul_statmount {
+ /*
+  * Special @mnt_id values that can be passed to listmount
+  */
+-#ifdef LSMT_ROOT
++#ifndef LSMT_ROOT
+ # define LSMT_ROOT              0xffffffffffffffff    /* root mount */
+ #endif
+ 
+-- 
+2.53.0
+
diff --git a/package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch b/package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
new file mode 100644
index 0000000000..d98c225500
--- /dev/null
+++ b/package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
@@ -0,0 +1,44 @@
+From 72ff3b8998a675900fcb7c18c0e03f1552b13a8b Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Tue, 14 Apr 2026 11:04:08 +0530
+Subject: [PATCH] include/mount-api-utils.h: fix LSMT_ROOT definition
+
+Commit
+ded434a63f3eee7fd7805b18d6c9bb912016c3c8 ("include/mount-api-utils:
+add statmount and listmount") introduce a fallback definition for the
+LSMT_ROOT defined, but a small typo makes this fallback definition
+ineffective:
+
+ #ifdef LSMT_ROOT
+ # define LSMT_ROOT ...
+ #endif
+
+Should obviously have been:
+
+ #ifndef LSMT_ROOT
+ # define LSMT_ROOT ...
+ #endif
+
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Upstream: https://lore.kernel.org/util-linux/20260530094932.2351791-1-thomas.petazzoni@bootlin.com/T/#u
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ include/mount-api-utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/mount-api-utils.h b/include/mount-api-utils.h
+index a916f99..87e173e 100644
+--- a/include/mount-api-utils.h
++++ b/include/mount-api-utils.h
+@@ -339,7 +339,7 @@ struct ul_statmount {
+ /*
+  * Special @mnt_id values that can be passed to listmount
+  */
+-#ifdef LSMT_ROOT
++#ifndef LSMT_ROOT
+ # define LSMT_ROOT              0xffffffffffffffff    /* root mount */
+ #endif
+ 
+-- 
+2.53.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
