Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C38CC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 18:47:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD714610A0
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 18:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD714610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8047C400CB;
	Sun,  1 Aug 2021 18:47:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I9e_-Si5zVQb; Sun,  1 Aug 2021 18:47:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D1FE400DD;
	Sun,  1 Aug 2021 18:47:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06AF51BF97D
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 18:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02B27400DD
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 18:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p-JEyyPoJaig for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 18:47:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18A96400CB
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 18:47:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 477628A4B1; Sun,  1 Aug 2021 18:47:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 20:47:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4f0a0d603176b45e52d7d6e695af269a356f413
X-Git-Newrev: c5ca521e232eae31276e7a12d17f0cf9d9c0108f
X-Patchwork-Hint: ignore
Message-Id: <20210801184724.477628A4B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openzwave: fix build with gcc 11
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5ca521e232eae31276e7a12d17f0cf9d9c0108f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set DEBUG_FLAGS and RELEASE_FLAGS to an empty value to remove -Werror
and fix the following build failure with gcc 11:

/tmp/instance-5/output-1/build/openzwave-62444b0f979c337d2091d77d89cf63c2ae9775cf/cpp/src/command_classes/AssociationCommandConfiguration.cpp: In member function 'virtual bool OpenZWave::Internal::CC::AssociationCommandConfiguration::HandleMsg(const uint8*, uint32, uint32)':
/tmp/instance-5/output-1/build/openzwave-62444b0f979c337d2091d77d89cf63c2ae9775cf/cpp/src/command_classes/AssociationCommandConfiguration.cpp:191:85: error: 'this' pointer is null [-Werror=nonnull]
  191 |                                                                 group->ClearCommands(nodeIdx);
      |                                                                 ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/05ad5cc1f593704ef032f3c5278695247450b94b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openzwave/openzwave.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
index 357d19f32e..9c28c0a13b 100644
--- a/package/openzwave/openzwave.mk
+++ b/package/openzwave/openzwave.mk
@@ -23,6 +23,7 @@ OPENZWAVE_INSTALL_STAGING = YES
 # the correct directory otherwise openzwave will install configuration files in
 # $(PREFIX)/etc/openzwave.
 # Disable doxygen documentation.
+# Set {DEBUG,RELEASE}_CFLAGS to an empty value to remove -Werror.
 OPENZWAVE_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	PREFIX=/usr \
@@ -30,6 +31,8 @@ OPENZWAVE_MAKE_OPTS = \
 	pkgconfigdir=/usr/lib/pkgconfig \
 	sysconfdir=/etc/openzwave \
 	DOXYGEN= \
+	DEBUG_CFLAGS= \
+	RELEASE_CFLAGS= \
 	USE_BI_TXML=0
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
