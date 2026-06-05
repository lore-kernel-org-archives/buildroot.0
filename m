Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76162CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4720A40EC5;
	Fri,  5 Jun 2026 12:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mONesjnjwYFI; Fri,  5 Jun 2026 12:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51BBD40FB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663530;
	bh=Oil8YRtqdHnmIzeWM35fLNvYSRakvJcoeSSRWeyCyzw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Cv6OcFZILur2so0KRtMlSMajHh4vFrgCAX5af8z4thrbPOA33T9cqKPnXNdO/HIeY
	 Nfhvm0v0oVzZQ8Io4uvtjnOC7+rVQReZHe1Tb16U5IN003Tz/eTeGZ0XNAq+sEQwHR
	 ebbRXjNNlMr1/BvMRRbvUvCHRxJk6mE0vxDF73nHufTTgIGAt6pp0fJEv8NCEQa/uW
	 nqYCCgDtduyn295KG27GXB6Z9vfnVTK4z8wV6FilXW3fgV18mvVCsnyZMxVKZnQUTG
	 Mu/iytOxtLALnPtgHEzxap+7B/M16Jv3ZkpcBrWjOL3Xaw97LoiI8T76LV+b45MbNE
	 hoszc0WtNMzhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51BBD40FB0;
	Fri,  5 Jun 2026 12:45:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3729549B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3408140FB0
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gABlSVJzWq2H for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FB6E41E61
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FB6E41E61
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:45:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88AF387B40; Fri,  5 Jun 2026 12:45:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jun 2026 14:41:43 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: dee8d1caffa052f56aba9f07139ad307139f2130
X-Git-Newrev: 40a3986edb9f40cece98e12f26e07046e01c734f
X-Patchwork-Hint: ignore
Message-Id: <20260605124510.88AF387B40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/util-linux: fix
 LSMT_ROOT fallback definition
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/40a3986edb9f40cece98e12f26e07046e01c734f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The fallback definition for LSMT_ROOT was incorrectly guarded
with #ifdef instead of #ifndef, making it ineffective. This caused
build issues on configurations with musl 1.2.6, which defines
SYS_statmount making util-linux consider statmount() as available, but
having older kernel headers, not providing LSMT_ROOT.

Fixes:

  http://autobuild.buildroot.net/results/ac2bc633db0c605564c79bfdfa0e257a9b4f1b28/

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f0540ff5317db497510a6b5beec0e406d09373cf)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
