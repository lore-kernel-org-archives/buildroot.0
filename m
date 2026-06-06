Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE849CD8C89
	for <buildroot@archiver.kernel.org>; Sat,  6 Jun 2026 02:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C1DA84557;
	Sat,  6 Jun 2026 02:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8Llyq_cMbaU; Sat,  6 Jun 2026 02:42:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EE5984558
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780713776;
	bh=3mT6bFYZlTnImDsEs5nV/g/Nfk51xUM5IXH7zh0wHZ8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=poIhWsC3rDDPVaSbO6IlU6b2sC0VG1fELxT6xCDOjY/auPyV9LWjCyLKJoMokXVQP
	 yvm6g9+mO/lvMDBbAD8B2j7onltmszNBrnn3mfMS5cUtOJJDCriuXUiYCpO/lJkoyO
	 +AGOLAmJMIWfg9p+rCwYFrA0ugvYsITQfU1PuTFAlUU4tlHZFXRVdNMT15PzGdJbYq
	 CKYUY2OHtHHR5cJ8bnpM/ZjeRAEvmLe8fvsRqngH0F1Eyp6qiv+Tm1qAE6QqF9S2Ar
	 L6iAE5BDC0E742tp/Ypryg8nUCwpzx70N9tKFFIjZNwmOpPS6twkSJN6374innirgw
	 n/qtZmgr2ooEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EE5984558;
	Sat,  6 Jun 2026 02:42:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1647B2EF
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 02:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1109942660
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 02:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rQYQoIQ47JF for <buildroot@buildroot.org>;
 Sat,  6 Jun 2026 02:42:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.5;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 581A34265A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 581A34265A
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 581A34265A
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 02:42:52 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [])
 by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id
 _____wAnkambiCNq9wCtBg--.28636S2; 
 Sat, 06 Jun 2026 10:40:28 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Date: Fri,  5 Jun 2026 19:40:11 -0700
Message-ID: <20260606024011.4645-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CM-TRANSID: _____wAnkambiCNq9wCtBg--.28636S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFykZw18try7WFWfAFW5Jrb_yoW8Ww1Upr
 ZxCF10kayjgr1F9F1xGr1S9a4fuFs5J345WwnFk3W0qw45Wr1DKr92kFs8Z398W34rAas8
 ArWUXr15uryUXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR_HUhUUUUU=
X-Originating-IP: [223.102.87.76]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbC-h6sOmojiJ4qCQAA3K
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=EK
 qlb0+qiLCrpcs+DT3MzRxLkjARJvyLW7HaNqPhwKk=; b=YEsxLtPgtE6iJYTsFH
 P2+h62eptosKEEBDKrSej5qKnPMYi+8peiN79uBSegivAi6ATyZXjlLZnVdVwzDN
 4zXUKcYOZ42+rD9/zfmdc6Wj+/ygQSG3vC7d2jsHzZDHC7Q7HTWlwhF38zqDYE/W
 prfYXm8KZRZ/DImNtLkL/9Xaw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=YEsxLtPg
Subject: [Buildroot] [PATCH 1/1] package/network-manager: remove initrd
 specific service files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NetworkManager upstream added initrd-specific service files in 1.54:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/2089

These services are intended for use inside an initrd, not a rootfs.
When present in a rootfs, they conflict with the main NetworkManager
service since both claim the same D-Bus name
org.freedesktop.NetworkManager, leading to confusing error messages:

  systemd[1]: Failed to put bus name to hashmap: File exists
  systemd[1]: NetworkManager-initrd.service: Two services allocated
  for the same bus name org.freedesktop.NetworkManager, refusing
  operation.

Remove them to avoid these issues.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/network-manager/network-manager.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 301c1ad43e..2dd40980e7 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -191,4 +191,12 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
 
 endef
 
+define NETWORK_MANAGER_REMOVE_INITRD_SERVICES
+	$(RM) $(TARGET_DIR)/usr/lib/systemd/system/NetworkManager-config-initrd.service
+	$(RM) $(TARGET_DIR)/usr/lib/systemd/system/NetworkManager-initrd.service
+	$(RM) $(TARGET_DIR)/usr/lib/systemd/system/NetworkManager-wait-online-initrd.service
+endef
+
+NETWORK_MANAGER_POST_INSTALL_TARGET_HOOKS += NETWORK_MANAGER_REMOVE_INITRD_SERVICES
+
 $(eval $(meson-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
