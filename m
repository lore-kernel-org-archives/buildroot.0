Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736D6C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43609847E4;
	Fri, 28 Feb 2025 17:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKh1LY-GIf0d; Fri, 28 Feb 2025 17:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28A18847E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28A18847E9;
	Fri, 28 Feb 2025 17:06:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1816E711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9762D42EDB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRuz6wg_5t-B for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0860542EE7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0860542EE7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03348867B4; Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 29 Jan 2025 00:22:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fd29fee3a3ac0ce45404ed256d2059836c352728
X-Git-Newrev: 15891236dbfb20ea971877918e9579b246f7c43c
X-Patchwork-Hint: ignore
Message-Id: <20250228163023.03348867B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nodejs: security bump
 to version 22.13.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=15891236dbfb20ea971877918e9579b246f7c43c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following security vulnerabilities:

Worker permission bypass via InternalWorker leak in diagnostics
(CVE-2025-23083) - (high)

With the aid of the diagnostics_channel utility, an event can be hooked into
whenever a worker thread is created.  This is not limited only to workers
but also exposes internal workers, where an instance of them can be fetched,
and its constructor can be grabbed and reinstated for malicious usage.

This vulnerability affects Permission Model users (--permission) on Node.js
v20, v22, and v23.

GOAWAY HTTP/2 frames cause memory leak outside heap (CVE-2025-23085) - (medium)

A memory leak could occur when a remote peer abruptly closes the socket
without sending a GOAWAY notification.  Additionally, if an invalid header
was detected by nghttp2, causing the connection to be terminated by the
peer, the same leak was triggered.  This flaw could lead to increased memory
consumption and potential denial of service under certain conditions.

This vulnerability affects HTTP/2 Server users on Node.js v18.x, v20.x, v22.x and v23.x.

For more details, see the announcement:
https://nodejs.org/en/blog/vulnerability/january-2025-security-releases

Update the LICENSE hash for a an addition of the (MIT licensed) nlohmann
JSON library:

https://github.com/nodejs/node/commit/27bcd103e775e00eb8d03ac37052bbd4ccb6d239

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nodejs/nodejs.hash | 14 +++++++-------
 package/nodejs/nodejs.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index aaa9e4619a..6d2bdfb704 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,8 +1,8 @@
-# From https://nodejs.org/dist/v20.15.1/SHASUMS256.txt.asc
-sha256  6031d04b98f59ff0f7cb98566f65b115ecd893d3b7870821171708cdbaf7ae6e  node-v22.11.0-linux-arm64.tar.xz
-sha256  9de0fdcfb1cccbe03f72f939e4e6f03867aef3da8223f90606cd93757704dae0  node-v22.11.0-linux-armv7l.tar.xz
-sha256  d1d49d7d611b104b6d616e18ac439479d8296aa20e3741432de0e85f4735a81e  node-v22.11.0-linux-ppc64le.tar.xz
-sha256  83bf07dd343002a26211cf1fcd46a9d9534219aad42ee02847816940bf610a72  node-v22.11.0-linux-x64.tar.xz
-sha256  bbf0297761d53aefda9d7855c57c7d2c272b83a7b5bad4fea9cb29006d8e1d35  node-v22.11.0.tar.xz
+# From https://nodejs.org/dist/v22.13.1/SHASUMS256.txt.asc
+sha256  0a237c413ccbab920640438bf6e1a32edb19845bdc21f0e1cd5b91545ce1c126  node-v22.13.1-linux-arm64.tar.xz
+sha256  f2be8dca2a7a518f6d187aa4b18abbeeafd71096a6d95f73f4d8bc0f8d2394ea  node-v22.13.1-linux-armv7l.tar.xz
+sha256  377a7a1ea66f39251e1657f419e9404d526fcca9910620d0ecf0a870c6308f6b  node-v22.13.1-linux-ppc64le.tar.xz
+sha256  0d2a5af33c7deab5555c8309cd3f373446fe1526c1b95833935ab3f019733b3b  node-v22.13.1-linux-x64.tar.xz
+sha256  cfce282119390f7e0c2220410924428e90dadcb2df1744c0c4a0e7baae387cc2  node-v22.13.1.tar.xz
 # Locally calculated
-sha256  f0cb1ad806ba5d681f378a8cc2e539fe4b54839290eda3c814ec8994af2b8422  LICENSE
+sha256  9d72cce9b104ecb67feb8af38618511685190ae5a119cc0488ecae66b221000d  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index bf0764136e..6dc0e501b4 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 22.11.0
+NODEJS_COMMON_VERSION = 22.13.1
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
 NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
