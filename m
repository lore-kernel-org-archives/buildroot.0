Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E67C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96B6E4062A;
	Sun, 27 Mar 2022 16:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RjQHOG1xbEZt; Sun, 27 Mar 2022 16:00:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7000A40420;
	Sun, 27 Mar 2022 16:00:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18AA51BF20B
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BED18193E
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kNzvuhX647zY for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:59:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91285828A9
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:59:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 394D285DB9; Sun, 27 Mar 2022 15:50:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 17:55:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a960dbc5d5f68c7ffdded79e34f6739b0d90940e
X-Git-Newrev: 05bbdfa382ec8b26d9b2f98b1696cb884ed7c2ca
X-Patchwork-Hint: ignore
Message-Id: <20220327155020.394D285DB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jack1: libsamplerate is optional,
 not mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=05bbdfa382ec8b26d9b2f98b1696cb884ed7c2ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsamplerate is only needed to build the NetJack backend and internal
client

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/jack1/Config.in | 1 -
 package/jack1/jack1.mk  | 6 +++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/jack1/Config.in b/package/jack1/Config.in
index 1c67f10332..625afdf8c1 100644
--- a/package/jack1/Config.in
+++ b/package/jack1/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_JACK1
 	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
 	select BR2_PACKAGE_ALSA_LIB_SEQ
 	select BR2_PACKAGE_BERKELEYDB
-	select BR2_PACKAGE_LIBSAMPLERATE
 	select BR2_PACKAGE_LIBSNDFILE
 	help
 	  JACK Audio Connection Kit (JACK 1 implementation).
diff --git a/package/jack1/jack1.mk b/package/jack1/jack1.mk
index 311f7c9ba0..39183826a4 100644
--- a/package/jack1/jack1.mk
+++ b/package/jack1/jack1.mk
@@ -11,7 +11,11 @@ JACK1_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK1_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 JACK1_INSTALL_STAGING = YES
 
-JACK1_DEPENDENCIES = host-pkgconf alsa-lib berkeleydb libsamplerate libsndfile
+JACK1_DEPENDENCIES = host-pkgconf alsa-lib berkeleydb libsndfile
+
+ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
+JACK1_DEPENDENCIES += libsamplerate
+endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 JACK1_DEPENDENCIES += readline
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
