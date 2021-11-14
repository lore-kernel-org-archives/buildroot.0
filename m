Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5A4C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A32440635;
	Mon,  6 Dec 2021 18:19:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hof0m5LtVhdT; Mon,  6 Dec 2021 18:19:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 011AD40386;
	Mon,  6 Dec 2021 18:19:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 262901BF983
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF25C41C13
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PC-9qpoB8S3v for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDA1D41C08
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 70EF781468; Mon,  6 Dec 2021 18:07:37 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 14:15:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e87da5514c81a87736e3b8fc6dc1bc5077e4765c
X-Git-Newrev: 130a28d446564ce1053ddd977fcd4da9243e24c1
X-Patchwork-Hint: ignore
Message-Id: <20211206180737.70EF781468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: add gssapi support
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

commit: https://git.buildroot.net/buildroot/commit/?id=130a28d446564ce1053ddd977fcd4da9243e24c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bind/bind.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index ba32d6150a..e329c803a3 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -35,7 +35,6 @@ BIND_CONF_OPTS = \
 	--with-libjson=no \
 	--with-randomdev=/dev/urandom \
 	--enable-epoll \
-	--with-gssapi=no \
 	--enable-filter-aaaa \
 	--disable-backtrace
 
@@ -53,6 +52,13 @@ else
 BIND_CONF_OPTS += --disable-linux-caps
 endif
 
+ifeq ($(BR2_PACKAGE_LIBKRB5),y)
+BIND_CONF_OPTS += --with-gssapi=$(STAGING_DIR)/usr/bin/krb5-config
+BIND_DEPENDENCIES += libkrb5
+else
+BIND_CONF_OPTS += --with-gssapi=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 BIND_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr
 BIND_DEPENDENCIES += libxml2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
