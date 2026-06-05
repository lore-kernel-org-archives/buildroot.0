Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5998CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7207160BC4;
	Fri,  5 Jun 2026 12:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ra_PayxtHdcP; Fri,  5 Jun 2026 12:39:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EE1060BD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663144;
	bh=AupxFz23t5OX/BigcxLtXtownezB0T/u4yiMoFsb/Ac=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X0EJhM3IKPXMh62Ou9VSw4HrdhnRAKBFx6rtOFRYeSRpcUyqQnjCNmBpMNGPRprUN
	 8zpWUL4p0wJutllPESywRLSUs/4PYnzNJSOCQKRHBaZ3lv1GbAPqLON82/CKl169uj
	 q7bM6dd8tJOY10b5oxcfRj9dWuMtiplY/+RssHqVgT82/HoHzKgeDfTGSrVPS7o/tr
	 6FhEjwxklFIcXGR/k6tjajJpprdjyFx6pDu8NFlklAparM14+asH1O6wrBYq7kP53Q
	 Lg4ZakQMQsdG1oaugLbhT6wpXl/YO7WCCuenHBQM0l9vy4HOs5xKISpyPh9eqQi20u
	 02X/UhNJsiURA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EE1060BD1;
	Fri,  5 Jun 2026 12:39:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E8D6388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE32781ECF
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTWD09IWCTA7 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFB5681EC9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFB5681EC9
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA67D87B3D; Fri,  5 Jun 2026 12:37:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jun 2026 14:27:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2f825f1bf853adcd7dd231cb905889b0dc2da8b4
X-Git-Newrev: 94334f9d207d0fbe50d92e64669082538ca2442d
X-Patchwork-Hint: ignore
Message-Id: <20260605123714.DA67D87B3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/systemd: fix host
 build with 7.0+ kernel
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
Content-Type: multipart/mixed; boundary="===============1953276377343037277=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1953276377343037277==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/94334f9d207d0fbe50d92e64669082538ca2442d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Linux v7.0 introduced a few more errno values that are aliases of other
errnos. This causes the following error:

In file included from ../src/basic/errno-list.c:13:
src/basic/errno-to-name.h:71:23: error: initialized field overwritten [-Werror=override-init]
   71 |         [EFSBADCRC] = "EFSBADCRC",
      |                       ^~~~~~~~~~~
src/basic/errno-to-name.h:71:23: note: (near initialization for ‘errno_names[74]’)
src/basic/errno-to-name.h:114:26: error: initialized field overwritten [-Werror=override-init]
  114 |         [EFSCORRUPTED] = "EFSCORRUPTED",
      |                          ^~~~~~~~~~~~~~
src/basic/errno-to-name.h:114:26: note: (near initialization for ‘errno_names[117]’)
cc1: some warnings being treated as errors

For target systemd this is not an issue as we don't support v7.0,
however it also occurs for host-systemd when building on a system with
kernel v7.0+.

Backport an upstream patch that excludes these two errnos from the
errno-to-name array. The upstream patch was applied to v261 and
backported to v258.5, but it was not backported to v256-stable (which is
EOL).

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ist-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/systemd/0002-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch b/package/systemd/0002-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch
new file mode 100644
index 0000000000..38fd0baf45
--- /dev/null
+++ b/package/systemd/0002-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch
@@ -0,0 +1,37 @@
+From ad6a29985b6d78a37af5616338e51bafc8653c71 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Tue, 24 Feb 2026 20:19:45 +0900
+Subject: [PATCH] errno-list: filter out EFSBADCRC and EFSCORRUPTED
+
+These are introduced in kernel v7.0.
+
+Upstream: https://github.com/systemd/systemd/commit/3cfb16998808a6ec8012a6120d0a82f0e1a0c8bb
+Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
+---
+ src/basic/generate-errno-list.sh | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/basic/generate-errno-list.sh b/src/basic/generate-errno-list.sh
+index f756b2e020..491fa1b6e3 100755
+--- a/src/basic/generate-errno-list.sh
++++ b/src/basic/generate-errno-list.sh
+@@ -3,9 +3,13 @@
+ set -eu
+ set -o pipefail
+ 
+-# In kernel's arch/parisc/include/uapi/asm/errno.h, ECANCELLED and EREFUSED are defined as aliases of
+-# ECANCELED and ECONNREFUSED, respectively. Let's drop them.
++# In kernel's arch/parisc/include/uapi/asm/errno.h, The following aliases are defined:
++# ECANCELLED → ECANCELED
++# EREFUSED → ECONNREFUSED
++# EFSBADCRC → EBADMSG
++# EFSCORRUPTED → EUCLEAN
++# Let's drop them.
+ 
+ ${1:?} -dM -include errno.h - </dev/null | \
+-       grep -Ev '^#define[[:space:]]+(ECANCELLED|EREFUSED)' | \
++       grep -Ev '^#define[[:space:]]+(ECANCELLED|EREFUSED|EFSBADCRC|EFSCORRUPTED)' | \
+        awk '/^#define[ \t]+E[^ _]+[ \t]+/ { print $2; }'
+-- 
+2.54.0
+

--===============1953276377343037277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1953276377343037277==--
