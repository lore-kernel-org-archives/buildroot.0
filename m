Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D6DC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 12:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47A914168B;
	Tue,  2 Jul 2024 12:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMbyL8ZBk291; Tue,  2 Jul 2024 12:21:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FC6E40A27
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FC6E40A27;
	Tue,  2 Jul 2024 12:21:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10C361BF30D
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 12:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2C166081B
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 12:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOcISl7iGNrs for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 12:21:54 +0000 (UTC)
X-Greylist: delayed 550 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 02 Jul 2024 12:21:53 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F14F460809
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F14F460809
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:272:3d5f:1::10; helo=mail.niyawe.de;
 envelope-from=niyawe@niyawe.de; receiver=<UNKNOWN> 
Received: from mail.niyawe.de (mail.niyawe.de [IPv6:2a01:4f8:272:3d5f:1::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F14F460809
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 12:21:53 +0000 (UTC)
From: Niklas Yann Wettengel <niyawe@niyawe.de>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 14:21:49 +0200
Message-ID: <20240702122149.1026781-1-niyawe@niyawe.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=niyawe.de; s=default; t=1719922911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SHEcpE56f/dF4iW7y+yyvyWPAicq9BDTUQ9QurteU9U=;
 b=Mte0cSC0VQioidkXfUDIwHtmhelIbBs2XNzwgKiqRFr+RH0BIzRDXtZvU6UnLmLXiCEMMs
 UOKjCN5z5WN42moiVPf9xMrS+T0ALVU0iOQGLPGHWigccxUawxxuUnMA+B13N8x7ZtW7Hf
 gJbJHWpbo8O185XNSDIA0mRUSoQ+74Y=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=niyawe.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=niyawe.de header.i=@niyawe.de header.a=rsa-sha256
 header.s=default header.b=Mte0cSC0
Subject: [Buildroot] [PATCH 1/1] packages/openssh: install sshd-session
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
Cc: Niklas Yann Wettengel <niyawe@niyawe.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In OpenSSH 9.8 the server is split into two processes: sshd and
sshd-session. This patch installs the sshd-session binary

Signed-off-by: Niklas Yann Wettengel <niyawe@niyawe.de>
---
 package/openssh/openssh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 6d846f64df..7065c3ae4f 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -117,6 +117,7 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSH_SERVER),y)
 define OPENSSH_INSTALL_SERVER_PROGRAMS
 	$(INSTALL) -D -m 0755 $(@D)/sshd $(TARGET_DIR)/usr/sbin/sshd
+	$(INSTALL) -D -m 0755 $(@D)/sshd-session $(TARGET_DIR)/usr/libexec/sshd-session
 	$(INSTALL) -D -m 0755 $(@D)/sftp-server $(TARGET_DIR)/usr/libexec/sftp-server
 endef
 OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SERVER_PROGRAMS
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
