Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F57C77B61
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 13:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D95F541771;
	Sun, 16 Apr 2023 13:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D95F541771
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8oWkzRiAw5Up; Sun, 16 Apr 2023 13:13:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C44841747;
	Sun, 16 Apr 2023 13:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C44841747
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82D0B1BF343
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 13:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C50D41747
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 13:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C50D41747
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 75EZNYjj9nj1 for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 13:13:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9ADFA400E2
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 13:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9ADFA400E2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 822D8842A0; Sun, 16 Apr 2023 13:13:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Apr 2023 15:10:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4468f828859de1f4be82655d63e96d59e760db7d
X-Git-Newrev: 115d362e079a2c733508f5d1b37fafabcdd27370
X-Patchwork-Hint: ignore
Message-Id: <20230416131314.822D8842A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ghostscript: add pdf support
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

commit: https://git.buildroot.net/buildroot/commit/?id=115d362e079a2c733508f5d1b37fafabcdd27370
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PDF support was disabled in commit 7a4944569ce8 (package/ghostscript:
bump to version 9.55.0) as it was then a new option which broke the
build.

PDF support depends on both openjpeg and jbig2dec. There is already a
conditional block for each, but it is not trivial to merge sanely, so we
introduce a third conditionl block to enable PDF. AS explained in the
comment, the dependencies are duplicated in that conditional block: in
case the other conditions get dropped in the future, we will still want
to depend on both for PDF support (unless that changes too, in which
case it will also be easier to spot and update).

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14976

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - move to its own conditional block
  - add a comment about duplicated dependencies
  - expadn commit log.
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ghostscript/ghostscript.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 5bf8b08966..364fa1469a 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -43,7 +43,6 @@ GHOSTSCRIPT_CONF_OPTS = \
 	--enable-freetype \
 	--disable-gtk \
 	--without-libpaper \
-	--without-pdf \
 	--with-system-libtiff
 
 ifeq ($(BR2_PACKAGE_JBIG2DEC),y)
@@ -67,6 +66,15 @@ else
 GHOSTSCRIPT_CONF_OPTS += --disable-openjpeg
 endif
 
+ifeq ($(BR2_PACKAGE_OPENJPEG)$(BR2_PACKAGE_JBIG2DEC),yy)
+# Dependencies already handle on per-package basis above,
+# but duplicated here for consistency.
+GHOSTSCRIPT_DEPENDENCIES += openjpeg jbig2dec
+GHOSTSCRIPT_CONF_OPTS += --with-pdf
+else
+GHOSTSCRIPT_CONF_OPTS += --without-pdf
+endif
+
 ifeq ($(BR2_PACKAGE_CUPS),y)
 GHOSTSCRIPT_DEPENDENCIES += cups
 GHOSTSCRIPT_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
