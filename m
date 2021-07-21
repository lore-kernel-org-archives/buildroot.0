Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A44C07E9B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 07:26:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0698B60230
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 07:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0698B60230
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4A22405A0;
	Wed, 21 Jul 2021 07:26:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 51NgczXPjytn; Wed, 21 Jul 2021 07:26:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABCD7405AE;
	Wed, 21 Jul 2021 07:26:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A7A7A1BF423
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 07:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 174DF40138
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 07:26:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PcFFqwhm6v3n for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 07:25:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D030400D7
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 07:25:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EB1B48872D; Wed, 21 Jul 2021 06:51:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 09:25:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68d886c4ea74601aca1f9ed0249f4a71f74d8aa3
X-Git-Newrev: 9070a7355b443c01760876bd8870a8ab7cc87286
X-Patchwork-Hint: ignore
Message-Id: <20210721065149.EB1B48872D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bird: add rpki support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=9070a7355b443c01760876bd8870a8ab7cc87286
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rpki support optionally depends on libssh

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bird/Config.in | 5 +++++
 package/bird/bird.mk   | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/bird/Config.in b/package/bird/Config.in
index e78dfdf90f..866fc65617 100644
--- a/package/bird/Config.in
+++ b/package/bird/Config.in
@@ -73,6 +73,11 @@ config BR2_PACKAGE_BIRD_RIP
 	help
 	  Enable RIP protocol.
 
+config BR2_PACKAGE_BIRD_RPKI
+	bool "rpki"
+	help
+	  Enable RPKI protocol.
+
 config BR2_PACKAGE_BIRD_STATIC
 	bool "static"
 	help
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index 4d4dfe1dca..4d6159b075 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -19,6 +19,13 @@ else
 BIRD_CONF_OPTS += --disable-client
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSSH),y)
+BIRD_CONF_OPTS += --enable-libssh
+BIRD_DEPENDENCIES += libssh
+else
+BIRD_CONF_OPTS += --disable-libssh
+endif
+
 BIRD_PROTOCOLS = \
 	$(if $(BR2_PACKAGE_BIRD_BFD),bfd) \
 	$(if $(BR2_PACKAGE_BIRD_BABEL),babel) \
@@ -29,6 +36,7 @@ BIRD_PROTOCOLS = \
 	$(if $(BR2_PACKAGE_BIRD_PIPE),pipe) \
 	$(if $(BR2_PACKAGE_BIRD_RADV),radv) \
 	$(if $(BR2_PACKAGE_BIRD_RIP),rip) \
+	$(if $(BR2_PACKAGE_BIRD_RPKI),rpki) \
 	$(if $(BR2_PACKAGE_BIRD_STATIC),static)
 
 BIRD_CONF_OPTS += --with-protocols=$(subst $(space),$(comma),$(strip $(BIRD_PROTOCOLS)))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
