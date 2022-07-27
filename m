Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A453C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 302F3402D7;
	Wed, 27 Jul 2022 07:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 302F3402D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VxyW_Zma9l1n; Wed, 27 Jul 2022 07:33:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1386F4028E;
	Wed, 27 Jul 2022 07:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1386F4028E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8188A1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64CE940292
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64CE940292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZMcCLO-o3mFn for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:33:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8619C4028E
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8619C4028E
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F12BD86444; Wed, 27 Jul 2022 07:19:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 09:33:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fe93a688a49ecba734cb9d6b8735d441e8e8715
X-Git-Newrev: 35a06eb6fff506093f7208fadf9d8aaf757e3426
X-Patchwork-Hint: ignore
Message-Id: <20220727071938.F12BD86444@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gensio: add openipmi support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=35a06eb6fff506093f7208fadf9d8aaf757e3426
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gensio/gensio.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 266ac137a2..b27158c61f 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -11,10 +11,16 @@ GENSIO_LICENSE_FILES = COPYING.LIB COPYING
 GENSIO_INSTALL_STAGING = YES
 GENSIO_DEPENDENCIES = $(if $(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),avahi)
 GENSIO_CONF_OPTS = \
-	--without-openipmi \
 	--without-swig \
 	--without-python
 
+ifeq ($(BR2_PACKAGE_OPENIPMI),y)
+GENSIO_DEPENDENCIES += openipmi
+GENSIO_CONF_OPTS += --with-openipmi
+else
+GENSIO_CONF_OPTS += --without-openipmi
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 GENSIO_DEPENDENCIES += host-pkgconf openssl
 GENSIO_CONF_OPTS += --with-openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
