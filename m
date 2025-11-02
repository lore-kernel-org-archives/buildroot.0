Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC75CCFA05
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 19:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABEB44151C;
	Sun,  2 Nov 2025 19:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULM5OuUKjr14; Sun,  2 Nov 2025 19:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAB07415B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAB07415B0;
	Sun,  2 Nov 2025 19:47:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BEC142A3
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 19:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2EEE40224
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 19:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYmGcnSVEhWP for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 19:47:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 571CF400AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 571CF400AC
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 19:47:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 517EA83A5F; Sun,  2 Nov 2025 19:47:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 2 Nov 2025 20:44:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07ab60acd97a53ef212a0a04e166f44d56d79ff1
X-Git-Newrev: c6fb44c455936527dfcbb128dc0e3dac0d28e503
X-Patchwork-Hint: ignore
Message-Id: <20251102194704.517EA83A5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: disable internal ccache
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6fb44c455936527dfcbb128dc0e3dac0d28e503
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

WebKit's auto-configured ccache results in 100% cache misses.
Disable WebKit's internal ccache setup [1] since Buildroot
already manages the ccache in toolchain/toolchain-wrapper.c.

[1] https://github.com/WebKit/WebKit/blob/wpewebkit-2.48.3/Source/cmake/WebKitCCache.cmake

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/wpewebkit.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 796e271ecb..15a2ea93e8 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -21,6 +21,10 @@ WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby host-unifdef \
 
 WPEWEBKIT_CMAKE_BACKEND = ninja
 
+# Buildroot adds support for ccache through its
+# toolchain-wrapper, so tell wpewebkit not to mess with it.
+WPEWEBKIT_CONF_ENV = WK_USE_CCACHE=NO
+
 WPEWEBKIT_CONF_OPTS = \
 	-DPORT=WPE \
 	-DENABLE_API_TESTS=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
