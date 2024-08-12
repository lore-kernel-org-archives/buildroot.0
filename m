Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEA8C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 09:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB17B40404;
	Mon, 12 Aug 2024 09:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ts6I2g26rC7B; Mon, 12 Aug 2024 09:17:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 662914050D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 662914050D;
	Mon, 12 Aug 2024 09:17:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36BF51BF951
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2360C40198
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Dn2-L-zknyl for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 09:16:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 212DD40196
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 212DD40196
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 09:16:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E41484495; Mon, 12 Aug 2024 09:16:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 11:13:33 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 4be8ba1629b5ec8606806f4573d81bd37693106c
X-Git-Newrev: ef7cf5871451666a4bc1357a90f5798afd1d58a8
X-Patchwork-Hint: ignore
Message-Id: <20240812091657.0E41484495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/mupdf: fix
 building shared libraries
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
Content-Type: multipart/mixed; boundary="===============2231786478924963570=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2231786478924963570==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ef7cf5871451666a4bc1357a90f5798afd1d58a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

By default mupdf generates static libraries, shared libraries must be
enabled explicitely.

Also, when building shared libraries, mupdf's Makefile properly passes
-fPIC, so adding it manually to MUPDF_CFLAGS is not needed.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 401162d4a947184654d8202392425a625d000172)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mupdf/mupdf.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 4aef0f99e7..e3fe66e396 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -23,8 +23,7 @@ MUPDF_DEPENDENCIES = \
 	zlib
 
 MUPDF_CFLAGS = \
-	$(TARGET_CFLAGS) \
-	-fPIC # -fPIC is needed because the Makefile doesn't append it.
+	$(TARGET_CFLAGS)
 
 MUPDF_LDFLAGS = \
 	$(TARGET_LDFLAGS)
@@ -40,6 +39,12 @@ MUPDF_MAKE_OPTS = \
 	HAVE_OBJCOPY=no \
 	prefix="/usr"
 
+ifeq ($(BR2_STATIC_LIBS),y)
+MUPDF_MAKE_OPTS += shared=no
+else
+MUPDF_MAKE_OPTS += shared=yes
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFREEGLUT),y)
 MUPDF_DEPENDENCIES += libfreeglut
 else

--===============2231786478924963570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2231786478924963570==--
