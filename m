Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F4EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 02:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DC3561C6D;
	Sat, 11 Dec 2021 02:52:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oLGUE-HbDftB; Sat, 11 Dec 2021 02:52:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2553E61C73;
	Sat, 11 Dec 2021 02:52:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E5A6D1BF3A8
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 02:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA64A4222D
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 02:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DanCXBXhUxR8 for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 02:52:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from sender3-of-o50.zoho.com (sender3-of-o50.zoho.com
 [136.143.184.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46C1F4224A
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 02:52:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1639191119; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CA8WYPAEDcCmNEREH1uOj6tm2VVEIHkMf2rtBR3caJtjY7FDsmXPfBcreIgLJ/IxbONxJzrx4cjFyuZV8lNlQbuFsX4+pSIsZLM2Da/fG1bFr0wJH4TGYjREXAVZv37qAl/wokvLpoSsMlx6Ve96D4RyNC/iDbH/sBtwwSsPLv0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1639191119;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=NTVbmwRO2t2zBfLHSuzFs8t3tMBXe8oz9wccAgBXB2Q=; 
 b=mhwx7FGnK0FAYyKWnZAh29QbXjrCCU7pn4WzdvdIGnCxRNUrF6BUUWX5nazxcZ9J0sG3MsMO0xxX6pVDG5JukP/zhPYiuCgOekvBDUsnzRk3yIgPDJn+tMai5LZQXlrnSMZ8gYP2OI7jgRHGXIu07vKIQKXRdAriGw3tPcrot3k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=admin@khoahoang.com;
 dmarc=pass header.from=<admin@khoahoang.com>
Received: from maximus-ryzen.home.arpa (104-136-063-107.res.spectrum.com
 [104.136.63.107]) by mx.zohomail.com
 with SMTPS id 1639191118304635.1420528940755;
 Fri, 10 Dec 2021 18:51:58 -0800 (PST)
From: Khoa Hoang <admin@khoahoang.com>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 18:50:34 -0800
Message-Id: <20211211025034.800367-1-admin@khoahoang.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-ZohoMailClient: External
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: fix install rule for
 alsactl
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Khoa Hoang <admin@khoahoang.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The copy command for /usr/share/alsa missing an asterisk cause it to copy to
/usr/share/alsa/alsa instead of /usr/share/alsa where it should be.

Signed-off-by: Khoa Hoang <admin@khoahoang.com>
---
 package/alsa-utils/alsa-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 427280c1e6..2603e52f18 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -77,7 +77,7 @@ define ALSA_UTILS_INSTALL_TARGET_CMDS
 	fi
 	if [ -x "$(TARGET_DIR)/usr/sbin/alsactl" ]; then \
 		mkdir -p $(TARGET_DIR)/usr/share/; \
-		cp -rdpf $(STAGING_DIR)/usr/share/alsa/ $(TARGET_DIR)/usr/share/alsa/; \
+		cp -rdpf $(STAGING_DIR)/usr/share/alsa/* $(TARGET_DIR)/usr/share/alsa/; \
 	fi
 endef
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
