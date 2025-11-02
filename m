Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DDFCCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 19:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0ABC8515A;
	Sun,  2 Nov 2025 19:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOsj2kkJpTD5; Sun,  2 Nov 2025 19:47:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D26784F90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D26784F90;
	Sun,  2 Nov 2025 19:47:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 295AC436
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 19:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F850405B7
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 19:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCtlLLO9JKZ2 for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 19:47:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E71640224
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E71640224
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 19:47:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59FE983AAD; Sun,  2 Nov 2025 19:47:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 2 Nov 2025 20:44:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6fb44c455936527dfcbb128dc0e3dac0d28e503
X-Git-Newrev: 37d270262585709225a865c7a9ad6d7cd9008f39
X-Patchwork-Hint: ignore
Message-Id: <20251102194704.59FE983AAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: disable internal ccache
 configuration
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

commit: https://git.buildroot.net/buildroot/commit/?id=37d270262585709225a865c7a9ad6d7cd9008f39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

WebKit's auto-configured ccache results in 100% cache misses.
Disable WebKit's internal ccache setup [1] since Buildroot
already manages the ccache in toolchain/toolchain-wrapper.c.

[1] https://github.com/WebKit/WebKit/blob/webkitgtk-2.50.1/Source/cmake/WebKitCCache.cmake

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 0b6a1383ca..fecca3529d 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -19,6 +19,10 @@ WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf host-unifdef \
 
 WEBKITGTK_CMAKE_BACKEND = ninja
 
+# Buildroot adds support for ccache through its
+# toolchain-wrapper, so tell webkitgtk not to mess with it.
+WEBKITGTK_CONF_ENV = WK_USE_CCACHE=NO
+
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
 	-DENABLE_DOCUMENTATION=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
