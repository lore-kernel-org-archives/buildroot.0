Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED557CE7A94
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 11:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99C2860FF2;
	Mon, 25 Sep 2023 11:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99C2860FF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 61z9TdzfhT4E; Mon, 25 Sep 2023 11:35:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE5AA60F96;
	Mon, 25 Sep 2023 11:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE5AA60F96
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73DBD1BF2C9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58F27416D9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58F27416D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nqfR3yKbFczH for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 11:35:44 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E84DC400EB
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 11:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E84DC400EB
Received: from unknown (HELO opfedv3rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 13:28:32 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Sep 2023 13:28:33 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 13:28:31 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Mon, 25 Sep 2023 13:28:30 +0200
X-IronPort-AV: E=Sophos;i="6.03,174,1694728800"; d="scan'208";a="44495453"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 25 Sep 2023 13:28:30 +0200
Message-ID: <9e52d2493ec60db3f2dafc9429171566b3ce4e38.1695641310.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX606.corporate.adroot.infra.ftgroup
 (10.115.27.30) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1695641744; x=1727177744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f2ZXI/Tbxmj935OddyWbUk5zTY62G7l6vrLe/WXe67g=;
 b=WfBiLoAkA8TEAdQpn5/iRubI1OHAiCj81pIN5+JFjAqNndAJr+5TWJfE
 wed5Z986OntGzRjgD0JO1+lpfi408vbUZJK1LK8tEnCUXlfcQRyT2J0+U
 gIG5k6jOPKUIOd5urz3WGSxq7VBN2flsJkUDeOTbGZd2OZV/ah5RFzgwW
 KviGPHtXhSl+qYEHjwpeyKXCzh0QDhjKhVLCp17fGPKXx/1WSqfeftYhF
 uSH/31I/9lBmuVeOnlVZh654d4SH9/AKm/Ql4aVnwG98VsHvLVvfnCggB
 pnIpn3tjRUfeuqxddLH9E/W7ce01mYiOsQep3iwC+ihNbgO4tRqmWOVpY
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=WfBiLoAk
Subject: [Buildroot] [PATCH] package/go: fix installation
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
Cc: yann.morin@orange.com, Anisse Astier <anisse@astier.eu>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

When building for a target architecture that go does not support, the
isntallation fails with:

    $ make host-go
    [...]
    ln -sf ../lib/go/bin/go /home/nyma7486/dev/work/5GCroCo/O/pouet/per-package/host-go/host/bin/
    ln: failed to create symbolic link '/home/nyma7486/dev/work/5GCroCo/O/pouet/per-package/host-go/host/bin/': No such file or directory

Indeed, the HOST_DIR/bin is not guaranteed to exist when we install a
host package, so it needs to be explicitly created before we can create
entries in there.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
Cc: Anisse Astier <anisse@astier.eu>
---
 package/go/go.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index aa5d7f97b5..76eaf6beb3 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -35,6 +35,9 @@ HOST_GO_COMMON_ENV = \
 
 ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
 
+# WIP: WHY?
+HOST_GO_DEPENDENCIES += toolchain
+
 ifeq ($(BR2_arm),y)
 GO_GOARCH = arm
 ifeq ($(BR2_ARM_CPU_ARMV5),y)
@@ -146,6 +149,7 @@ define HOST_GO_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_ROOT)/bin/go
 	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_ROOT)/bin/gofmt
 
+	mkdir -p $(HOST_DIR)/bin
 	ln -sf ../lib/go/bin/go $(HOST_DIR)/bin/
 	ln -sf ../lib/go/bin/gofmt $(HOST_DIR)/bin/
 
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
