Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AD1C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:58:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F420760F11
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F420760F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C770E4028A;
	Sun, 25 Jul 2021 21:58:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XiBiGpfMbNY4; Sun, 25 Jul 2021 21:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F0BB40281;
	Sun, 25 Jul 2021 21:58:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E10341BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0E914036E
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E2zlxmIg_uIY for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:58:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C60CF40359
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:58:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C8D0788FDB; Sun, 25 Jul 2021 21:23:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 23:57:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e43c0509442c746bea305aa2b0a5f7ff5adfd142
X-Git-Newrev: 5a189d3a24e66c8c1d5fd8e63714d2dd79f6c8ac
X-Patchwork-Hint: ignore
Message-Id: <20210725212333.C8D0788FDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open62541: cleanup tools files
 after installation
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a189d3a24e66c8c1d5fd8e63714d2dd79f6c8ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The open62541 tools directory is indeed 52 MiB, which built as a standalone package
named 'libopen62541-1-tools' in launchpad. Nothing is required at runtime.

See the official debian control file template:
https://raw.githubusercontent.com/open62541/open62541/master/debian/control-template

See https://launchpad.net/~open62541-team/+archive/ubuntu/ppa/+packages
libopen62541-1       Open source implementation of OPC UA - shared library
libopen62541-1-dev   Open source implementation of OPC UA - development files
libopen62541-1-tools Open source implementation of OPC UA - tools
open62541-doc        Open source implementation of OPC UA - documentation

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/open62541/open62541.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 102e09a429..3f75196817 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -54,4 +54,11 @@ else
 OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL=OFF
 endif
 
+# Remove unneeded files
+define OPEN62541_REMOVE_UNNEEDED_FILES
+	$(RM) -r $(TARGET_DIR)/usr/share/open62541
+endef
+
+OPEN62541_POST_INSTALL_TARGET_HOOKS += OPEN62541_REMOVE_UNNEEDED_FILES
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
