Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071E9C0218A
	for <buildroot@archiver.kernel.org>; Sat,  1 Feb 2025 15:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B09096FBC2;
	Sat,  1 Feb 2025 15:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wi8ZRC1AD3pD; Sat,  1 Feb 2025 15:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7F646FB56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7F646FB56;
	Sat,  1 Feb 2025 15:07:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14F8B12A
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 15:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E883487DC
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 15:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7a9p6QsP9P4H for <buildroot@buildroot.org>;
 Sat,  1 Feb 2025 15:07:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B19A5485AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B19A5485AB
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 15:07:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CF8586595; Sat,  1 Feb 2025 15:07:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 1 Feb 2025 16:05:10 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5b5ee3de7127a8a21516ba60b263df471de26285
X-Git-Newrev: a34ad4d8304fd457f2609017c2a1f8d2e6297719
X-Patchwork-Hint: ignore
Message-Id: <20250201150733.9CF8586595@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/nodejs: security
 bump to version 20.18.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a34ad4d8304fd457f2609017c2a1f8d2e6297719
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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

Update the LICENSE hash for a reformatting and removal of the highlight.js license:

https://github.com/nodejs/node/commit/6ca0cfc6026aee0788132476215ec48d035ad633
https://github.com/nodejs/node/commit/1dfd238781bc7ac0f8e0be14bf88a9c61abeb0e9

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nodejs/nodejs.hash | 16 +++++++++-------
 package/nodejs/nodejs.mk   |  2 +-
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 61bda55098..486e5fce9a 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,8 +1,10 @@
-# From https://nodejs.org/dist/v20.15.1/SHASUMS256.txt.asc
-sha256  10d47a46ef208b3e4b226e4d595a82659123b22397ed77b7975d989114ec317e  node-v20.15.1-linux-arm64.tar.xz
-sha256  7bc120efdd8018f6915471b963d9b80adf4ed406d6dc9edb4ae944b85f505c4c  node-v20.15.1-linux-armv7l.tar.xz
-sha256  b33e684802251397ad62ad3f8a1836267ee8b7723f87f669470018ad0035287b  node-v20.15.1-linux-ppc64le.tar.xz
-sha256  26700f8d3e78112ad4a2618a9c8e2816e38a49ecf0213ece80e54c38cb02563f  node-v20.15.1-linux-x64.tar.xz
-sha256  fdd53a5729d936691a2a1151046fb4897721cb8b0fca2af957823a9b40fe0c34  node-v20.15.1.tar.xz
+# From https://nodejs.org/dist/v20.18.2/SHASUMS256.txt.asc
+sha256  05819d72dcc0aa788baab1066e18ede5f1ab6730a1925cd6b15c131b55fd4272  node-v20.18.2-headers.tar.xz
+sha256  5c1437aa16e7e6a2e0687a42c4d3f0a8f8a2039cda8880cb3be8cd983aeefb44  node-v20.18.2-linux-arm64.tar.xz
+sha256  63d4df56fb2e34a5077345f78941094204d2223ce03b8ebc9c1500e6e2aae68d  node-v20.18.2-linux-armv7l.tar.xz
+sha256  828a2635261ca225cd4a8a4b1a914003cdc7b30656c2e9092ac7aab02ac361db  node-v20.18.2-linux-ppc64le.tar.xz
+sha256  4e50f727ae09bdafecf2322c72faf7cd82bf3b8851a16b8bb63974e0d8d6eceb  node-v20.18.2-linux-x64.tar.xz
+sha256  69bf81b70f3a95ae0763459f02860c282d7e3a47567c8afaf126cc778176a882  node-v20.18.2.tar.xz
+
 # Locally calculated
-sha256  49cd410e0fe6a8879a40d0764092d1e6114cc85fe41d4efed990d028eec25582  LICENSE
+sha256  4f0e8660d7fe2f8f7759a54c53907300c555992b580e846b30b75121c53ad180  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 104d2cf258..2bdebcd853 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 20.15.1
+NODEJS_COMMON_VERSION = 20.18.2
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
 NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
