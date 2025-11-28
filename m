Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA1ACFD376
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 12:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CC7461701;
	Fri, 28 Nov 2025 12:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXIoFJx0jbcp; Fri, 28 Nov 2025 12:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C521E60B46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C521E60B46;
	Fri, 28 Nov 2025 12:14:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D4381A9
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 12:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 442EB4180B
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 12:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6R7HN_qTa99G for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 12:14:29 +0000 (UTC)
X-Greylist: delayed 430 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 28 Nov 2025 12:14:28 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1C0E41805
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1C0E41805
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1C0E41805
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 12:14:28 +0000 (UTC)
X-CSE-ConnectionGUID: uis0k3PORt+PgfWQiBsusw==
X-CSE-MsgGUID: ewKCcQ6lRqW/Dc/nTnFlYw==
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 28 Nov 2025 13:07:15 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Nov 2025 13:07:14 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61;
 Fri, 28 Nov 2025 13:07:12 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 28 Nov 2025 13:07:12 +0100
X-CSE-ConnectionGUID: V0K0nQpbT1Okjtvx2CKPlQ==
X-CSE-MsgGUID: IUADeJdFSd2JH7vG69xYeg==
X-IronPort-AV: E=Sophos;i="6.20,232,1758578400"; d="scan'208";a="366182649"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Fri, 28 Nov 2025 13:07:12 +0100
Message-ID: <87faaefbd593a016f9c7c8489f3c8e41ba5fc315.1764331632.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX204.corporate.adroot.infra.ftgroup (10.115.26.9)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1764332069; x=1795868069;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+txAObDD2B6/FIqOHTbhcQKSxxOKhAPaKl9fTyBlOHo=;
 b=Rd+4uBytYJ1/uyP4GBjGobYj5P1Im+yLr00Y1rbTwnewlkK7PgMupJ9R
 x1c05MmPvf/LRZbLmqE1tpPQCcJvSLMdS+FQpPyE8ajhMXo2R8qgtNBK3
 OXNKqUCs6Sl+VotsqXErWMGo+f97e1WbnLZWZW+QyOnLe4LpQPXLh6fOn
 cyeQKSC6Muuiib4UiTWxuCICvervXCWZIVswgNzy+2qlNQkwZtFovSggy
 6YM/PNPXj3qzLUUVENGdf1lA9ZH82T39P98a41F7326ZS/MYeX07ZBZKV
 SBJ7Zj8NG9oBYGYk4tJiZyqI4dKX0zTz1D6dUl1wsHocCCnrrSjeNQ64W
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=Rd+4uByt
Subject: [Buildroot] [PATCH] fs/rootfs-common: depend on host-mkpasswd if
 enabled
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

From: "Yann E. MORIN" <yann.morin@orange.com>

CUrrently, we opportunistically depend on host-mkpasswd from the common
fs parts, based on whether we have package-defined users, or user-tables
(files with user definitions). This allows to transparently depend on it
without requiring packages to select BR2_PACKAGE_HOST_MKPASSWD.

Dependencies of rootfs-common are acted upon right when fs/common.mk us
parsed. Adding dependencies to the list afterwards does not actualyy add
them to the make rule.

However, by the time we parse the fs/common.mk file, not all packages
have been parsed yet: packages from br2-external trees are only parsed
later.

This means that users defined by packages in br2-external trees do not
have the opportunity to actually contribute to the list of users before
the rootfs-common dependencies are created.

So, the obvious solution would be to move parsing the fs/common.mk after
br2-externall trees are parsed. However, this may open another can of
worms: br2-external trees may define filesystems of their own, and they
need to be able to evaluate the rootfs macros, with : $(eval $(rootfs))
which is provided in... fs/common.mk itself!

So, rather than trying to be too smart, just add the dependency also
when the host package is enabled. That way, people using br2-external
trees can either select host-mkpasswd from packages therein, or they can
add it to their defconfig files.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 2f3f8bcc7e..3787658f90 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -41,7 +41,7 @@ ROOTFS_COMMON_TYPE = rootfs
 ROOTFS_COMMON_DEPENDENCIES = \
 	host-fakeroot host-makedevs \
 	$(BR2_TAR_HOST_DEPENDENCY) \
-	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
+	$(if $(BR2_PACKAGE_HOST_MKPASSWD)$(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
 
 ifeq ($(BR2_REPRODUCIBLE),y)
 define ROOTFS_REPRODUCIBLE
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
