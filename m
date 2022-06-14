Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE108C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BFA283299;
	Tue, 14 Jun 2022 18:49:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9RwnFZYlvU02; Tue, 14 Jun 2022 18:49:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 844EC82F11;
	Tue, 14 Jun 2022 18:49:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 179581BF306
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 437CA40A17
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ql_1MVdjepXZ for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:48:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86EA140A67
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:48:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 75567870DF; Tue, 14 Jun 2022 18:36:34 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 20:10:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19f7a19d6b8672838f73892478e7abfc8e0d8821
X-Git-Newrev: 0eadc83b9f20de6dfd24ae02ddf174e947dbb331
X-Patchwork-Hint: ignore
Message-Id: <20220614183634.75567870DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: add brotli as optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=0eadc83b9f20de6dfd24ae02ddf174e947dbb331
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/90e/90e3a2aaf0ce0451b80c71743209797abeb83d0a/
http://autobuild.buildroot.net/results/006/006f94bb216a77f073a5670fa2f393c43f15a977/
http://autobuild.buildroot.net/results/dd6/dd69e665e51ce6b30e303a4d4670e9edbb159aea/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/apache/apache.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index b2c855aa36..a6fb59d26b 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -45,6 +45,13 @@ APACHE_CONF_OPTS = \
 	--with-mpm=$(APACHE_MPM) \
 	--disable-luajit
 
+ifeq ($(BR2_PACKAGE_BROTLI),y)
+APACHE_CONF_OPTS += --enable-brotli
+APACHE_DEPENDENCIES += brotli
+else
+APACHE_CONF_OPTS += --disable-brotli
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 APACHE_DEPENDENCIES += libxml2
 # Apache wants the path to the header file, where it can find
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
