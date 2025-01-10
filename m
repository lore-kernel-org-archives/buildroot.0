Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ACFE77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 15:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAAED60BD5;
	Fri, 10 Jan 2025 15:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKZfhSxBxowP; Fri, 10 Jan 2025 15:11:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D49D360BD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D49D360BD7;
	Fri, 10 Jan 2025 15:11:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8223C76C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 15:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 629DF835CF
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 15:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQL76PLhgvGe for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 15:10:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2BFE983657
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BFE983657
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BFE983657
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 15:10:57 +0000 (UTC)
X-CSE-ConnectionGUID: 7gCPped6QXq65/lHyDPbMA==
X-CSE-MsgGUID: sdfTGmkVSfS7WEqbVNT9bA==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 16:10:55 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jan 2025 16:10:52 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 10 Jan 2025 16:10:50 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 10 Jan 2025 16:10:50 +0100
X-CSE-ConnectionGUID: Pa02lI0oToipHEQE7TD2wA==
X-CSE-MsgGUID: zQlSqzaaTAC2tksNQiRm8g==
X-IronPort-AV: E=Sophos;i="6.12,303,1728943200"; d="scan'208";a="241155077"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 10 Jan 2025 16:10:50 +0100
Message-ID: <2e74286729fd798109e9c067c28e4a17af8522ed.1736521850.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX106.corporate.adroot.infra.ftgroup (10.115.27.3)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1736521858; x=1768057858;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QMSOlJKkfyTIx5HeAM4y/ZVlAdFM3WG6tJLBwZuppwc=;
 b=ESCAKgidi9+jKtkv3j01JN/pmQtczC45Ml3DB2pPgt9YnU2mYD+WmekM
 6VtktiXkmTDm+cIO6N7cc7Ft6Yto/3eWIWRICLu5SkL4aFZwSKG8KtVkF
 iA9ynLEVLa78Eemv1LKya+Bk0FbUU4XDyCGF4OMnw6qZEnjXsVkf2iGsQ
 aj2Bo4tTY/WqiBgk4KZxNkZOntMXEN4C7EGN95TsTwgx+qrCPR3tCRGHY
 jmub0LtWadm3FZSb2Z+1ARDZKtRQCdwHtE6i4HP1p/ld/gZbJe96Z3p2z
 tNZ/YjlJCMMGtpjVY2riuqgGcoh68qesw/+gehs5+ubZfytibC8RTqUs9
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=ESCAKgid
Subject: [Buildroot] [PATCH] package/gpsd: python support needs pyserial
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

Usually, ubxtool, a python-based too lto drive u-blox devices, connects
to a gpsd instance and delegates to it the responsibility to write to
and read from the actual device. This is sane, because a serial device
can only be opened once, and if gpsd is running, it has that device
open.

However, in some cases, ubxtool can be used to directly talk to the
device, to pre-configure it before gpsd runs, or even in the abscence of
gpsd altogether. This is not used very often, except when setting up an
RTK base, where gpsd is not needed.

In that case, ubxtool will directly talk to the serial device. It uses
the pyserial python module. Since this is not the traditional way to
talk to the device, failure to import the module is ignored, and the
error reporting is deferred until it is actually needed, which is why we
did not catch the issue earlier.

Fixes: f3ef0723cf71 (package/gpsd: enable python support and modules)

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
---
 package/gpsd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 92a124b8ac..fa4dc7a814 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -238,6 +238,7 @@ config BR2_PACKAGE_GPSD_PYTHON
 	bool "build Python support and modules"
 	depends on BR2_USE_WCHAR # python3
 	select BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_SERIAL # runtime
 	help
 	  Python libraries and tools for the gpsd service daemon
 	  including gpsfake test harness.
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
