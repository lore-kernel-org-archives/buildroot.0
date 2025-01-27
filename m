Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B038BC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 738CC70988;
	Fri, 28 Feb 2025 17:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKPkJB1rALnS; Fri, 28 Feb 2025 17:06:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D754770980
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D754770980;
	Fri, 28 Feb 2025 17:06:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1899468
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B40B94253F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jlFrD-WgwgXK for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C69D342ED2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C69D342ED2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C131587A09; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 27 Jan 2025 21:15:42 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bf18fd4cd183eab2e91b91d275fc62e2707b9182
X-Git-Newrev: 71a7d6ff201522a216910eacc2f40467c8e7ab06
X-Patchwork-Hint: ignore
Message-Id: <20250228163021.C131587A09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fontconfig: fix
 compile issue if BR2_DEBUG_3 has been selected
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

commit: https://git.buildroot.net/buildroot/commit/?id=71a7d6ff201522a216910eacc2f40467c8e7ab06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When BR2_DEBUG_3=y, fontconfig fails to build with error:

    src/fcobjshash.gperf:568:7: error: stray '#' in program
    src/fcobjshash.gperf:1:18: error: expected '=', ',', ';', 'asm' or '__attribute__' before numeric constant
        1 | #define __STDC__ 1
          |                  ^

This issue has been raised upstream [1], and reported in buildroot [2].
Upstream has not yet defined a solution, so force it to -g2 for the time being.

Fixes:
 - https://autobuild.buildroot.org/results/6ae/6aef28611ad05d8db65105ab150ae980bc6bff4e/build-end.log
 - https://autobuild.buildroot.org/results/cc3/cc38846fdf63954422ec08d3ae57f2f09ebbf8c8/build-end.log
 - https://autobuild.buildroot.org/results/b7a/b7ad9a7ecb1d06b8a3d9e86d386195f3c212b9d8/build-end.log
 - ...

[1] https://gitlab.freedesktop.org/fontconfig/fontconfig/-/issues/436
[2] https://patchwork.ozlabs.org/comment/3450162/

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
[Julien: add a link to the issue in the .mk file]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fontconfig/fontconfig.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index cc6ca88585..21eba76a83 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -20,5 +20,12 @@ FONTCONFIG_CONF_OPTS = \
 	-Dcache-dir=/var/cache/fontconfig \
 	-Ddoc=disabled
 
+FONTCONFIG_CFLAGS = $(TARGET_CFLAGS)
+
+# See: https://gitlab.freedesktop.org/fontconfig/fontconfig/-/issues/436
+ifeq ($(BR2_DEBUG_3),y)
+FONTCONFIG_CFLAGS += -g2
+endif
+
 $(eval $(meson-package))
 $(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
