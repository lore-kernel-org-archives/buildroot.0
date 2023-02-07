Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001FBC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC5E56FBC0;
	Tue, 21 Feb 2023 01:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC5E56FBC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IKJj-GgPTF7c; Tue, 21 Feb 2023 01:46:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D518870078;
	Tue, 21 Feb 2023 01:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D518870078
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EB5E1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C44B6FFFF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C44B6FFFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9TwB6RLZbRCd for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 829D86FFF4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 829D86FFF4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8040F828C8; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 23:23:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 90ab065162a35b8aa2c429903e3d59d4ad2c0d7f
X-Git-Newrev: f9a92ea1cb1dd2aa9b3f9c83c04d7d01c1f6e148
X-Patchwork-Hint: ignore
Message-Id: <20230220205254.8040F828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gcc: map debug prefix
 when reproducible
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9a92ea1cb1dd2aa9b3f9c83c04d7d01c1f6e148
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When building with BR2_REPRODUCIBLE the toolchain wrapper passes
-fdebug-prefix-map for all packages that are built.  But this doesn't
affect the target libraries (like libgcc) built by GCC's build system.

GCC 4.3 added a configure option to set the debug prefix map for these
libraries, which is used here to avoid encoding potentially
non-reproducible build paths into the debug data.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gcc/gcc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index ec6f3b550a..6dfd93f2a4 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -84,6 +84,10 @@ HOST_GCC_COMMON_CONF_OPTS = \
 	--with-bugurl="http://bugs.buildroot.net/" \
 	--without-zstd
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+HOST_GCC_COMMON_CONF_OPTS += --with-debug-prefix-map=$(BASE_DIR)=buildroot
+endif
+
 # Don't build documentation. It takes up extra space / build time,
 # and sometimes needs specific makeinfo versions to work
 HOST_GCC_COMMON_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
