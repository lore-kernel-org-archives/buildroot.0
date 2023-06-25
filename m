Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B251EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CB1E6125E;
	Sun, 25 Jun 2023 19:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CB1E6125E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id quAQ6DVF1nwt; Sun, 25 Jun 2023 19:19:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4074F6112A;
	Sun, 25 Jun 2023 19:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4074F6112A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC5621BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C66B08164B
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C66B08164B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W0QlEhYa9I0S for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:19:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00D8E81638
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00D8E81638
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E176584BD7; Sun, 25 Jun 2023 19:19:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 21:18:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43ec76496316275c53ffbe67cb72903ad334eb98
X-Git-Newrev: cf3b6ea551f1116a87d173c447162480052a171a
X-Patchwork-Hint: ignore
Message-Id: <20230625191950.E176584BD7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/raptor: fix build with newer
 versions of libxml2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cf3b6ea551f1116a87d173c447162480052a171a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/6a5/6a5139fe86b8370477dc6cb044bf29180bd145df/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...access-to-entities-checked-private-symbol.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/raptor/0002-Remove-the-access-to-entities-checked-private-symbol.patch b/package/raptor/0002-Remove-the-access-to-entities-checked-private-symbol.patch
new file mode 100644
index 0000000000..cd9542a9a9
--- /dev/null
+++ b/package/raptor/0002-Remove-the-access-to-entities-checked-private-symbol.patch
@@ -0,0 +1,35 @@
+From 4dbc4c1da2a033c497d84a1291c46f416a9cac51 Mon Sep 17 00:00:00 2001
+From: David Anes <david.anes@suse.com>
+Date: Thu, 4 May 2023 11:54:02 +0200
+Subject: [PATCH] Remove the access to entities 'checked' private symbol for
+ libxml2 2.11.0
+
+Since version 2.11.0, some private symbols that were never intended
+as public API/ABI have been removed from libxml2, therefore the field
+'checked' is no longer present and raptor fails to build in this
+scenario.
+
+Upstream: https://github.com/dajobe/raptor/commit/4dbc4c1da2a033c497d84a1291c46f416a9cac51
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/raptor_libxml.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/raptor_libxml.c b/src/raptor_libxml.c
+index 538c2c8e..8bcee139 100644
+--- a/src/raptor_libxml.c
++++ b/src/raptor_libxml.c
+@@ -246,10 +246,11 @@ raptor_libxml_getEntity(void* user_data, const xmlChar *name)
+     
+     ret->owner = 1;
+ 
+-#if LIBXML_VERSION >= 20627
++#if LIBXML_VERSION >= 20627 && LIBXML_VERSION < 21100
+     /* Checked field was released in 2.6.27 on 2006-10-25
+      * http://git.gnome.org/browse/libxml2/commit/?id=a37a6ad91a61d168ecc4b29263def3363fff4da6
+      *
++     * and was later removed in version 2.11.0
+      */
+ 
+     /* Mark this entity as having been checked - never do this again */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
