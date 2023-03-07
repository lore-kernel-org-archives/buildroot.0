Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DC1C678D5
	for <buildroot@archiver.kernel.org>; Tue,  7 Mar 2023 21:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EA8F61108;
	Tue,  7 Mar 2023 21:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EA8F61108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3hy_HEe-lrAW; Tue,  7 Mar 2023 21:10:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2000600CD;
	Tue,  7 Mar 2023 21:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2000600CD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D1C241BF33B
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 21:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8CB061104
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 21:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8CB061104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cGPlzm9_IvhR for <buildroot@lists.busybox.net>;
 Tue,  7 Mar 2023 21:09:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3092600CD
 for <buildroot@buildroot.org>; Tue,  7 Mar 2023 21:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3092600CD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1EE686A16; Tue,  7 Mar 2023 21:09:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Mar 2023 22:05:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f255abdceabc3ebbff795c753f7a33d44e905369
X-Git-Newrev: a69ecf0e89b5f88dbd0bcadf9b8aabae10066289
X-Patchwork-Hint: ignore
Message-Id: <20230307210957.D1EE686A16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gensio: add alsa-lib optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=a69ecf0e89b5f88dbd0bcadf9b8aabae10066289
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

alsa-lib is an optional dependency which is enabled by default since
version 2.5.3 and
https://github.com/cminyard/gensio/commit/dc9bad87d47588dcdd92ce118fcc4f41d10b671c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gensio/gensio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index dafc0bf5d5..89c734eec0 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -14,6 +14,13 @@ GENSIO_CONF_OPTS = \
 	--without-swig \
 	--without-python
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
+GENSIO_DEPENDENCIES += alsa-lib
+GENSIO_CONF_OPTS += --with-alsa
+else
+GENSIO_CONF_OPTS += --without-alsa
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 GENSIO_DEPENDENCIES += host-pkgconf libglib2
 GENSIO_CONF_OPTS += --with-glib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
