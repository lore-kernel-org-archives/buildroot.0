Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A65EC8739
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E516983487;
	Thu,  7 Sep 2023 15:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E516983487
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZrCMxYEvVjpm; Thu,  7 Sep 2023 15:26:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DB6D83B1A;
	Thu,  7 Sep 2023 15:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DB6D83B1A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 126071BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58EE441DA2
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58EE441DA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-CfSS0MVjLj for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AC5F41DDE
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AC5F41DDE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62D9D86A1F; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 23:21:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4fcbeb391a0c9cd701448a69026a937e1adf14e0
X-Git-Newrev: 2bc8e72bafed28c0a3ddc18ffdf9eec7d324e984
X-Patchwork-Hint: ignore
Message-Id: <20230907145130.62D9D86A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ca-certificates: create the bundle
 as target-finalize hook
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bc8e72bafed28c0a3ddc18ffdf9eec7d324e984
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other packages, or rootfs overlays, may install certificates, so only
create the certificate bundle as a target-finalize hook.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ca-certificates/ca-certificates.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 202d0b92ac..fe115209a7 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -20,7 +20,9 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/ssl/certs
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
 	rm -f $(TARGET_DIR)/usr/sbin/update-ca-certificates
+endef
 
+define CA_CERTIFICATES_GEN_BUNDLE
 	# Remove any existing certificates under /etc/ssl/certs
 	rm -f $(TARGET_DIR)/etc/ssl/certs/*
 
@@ -30,14 +32,15 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
 	for i in `find usr/share/ca-certificates -name "*.crt" | LC_COLLATE=C sort` ; do \
 		ln -sf ../../../$$i etc/ssl/certs/`basename $${i} .crt`.pem ;\
 		cat $$i ;\
-	done >$(@D)/ca-certificates.crt
+	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
 	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
-	$(INSTALL) -D -m 644 $(@D)/ca-certificates.crt \
+	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
 		$(TARGET_DIR)/etc/ssl/certs/ca-certificates.crt
 endef
+CA_CERTIFICATES_TARGET_FINALIZE_HOOKS += CA_CERTIFICATES_GEN_BUNDLE
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
