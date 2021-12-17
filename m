Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9555FC433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 22:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30DE984E1D;
	Fri, 17 Dec 2021 22:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w-9CqZou75Mn; Fri, 17 Dec 2021 22:48:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E08984E1A;
	Fri, 17 Dec 2021 22:48:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E51B1BF5AA
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 22:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CCFE61173
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 22:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UJbXa8_PdoSr for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 22:48:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DDA360ED4
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 22:48:42 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id c4so6680090wrd.9
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 14:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xDHjdq+/iyNAMTFuzDZMnFVpXGnRVle5jA56aR5fsLc=;
 b=EQLOv/F1L5fUAsAQCZmsFVfWCsmGQi7r4APatSWkN7DnjtfAQEavHG3O/lAuUd+XT+
 Orbh6yz7ztFplcMLW0OvY8zWHWtrXZ8Qbkt72xMkq+iYCwI5Nk55q7D0aljFZ5yxzu8R
 gBq6amKcuq3bPGeUPoX4KZnAwWLgh17j7ma8UO9gMfuiW+r+yRlA1iN2YxaNLK7PnFuz
 bjboOWe1VksR4XeRN8/kOdlPA6+ECfsu9/hZ/DEdIUBSo2vsBDOdx0c33WHNm+GIPNQq
 43FEfdE8btQVGh5CJRmCfBDuLFSlhT5F1z1GFguihDOXybIVlWPw6+67g2jy0NnQIjFA
 d1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xDHjdq+/iyNAMTFuzDZMnFVpXGnRVle5jA56aR5fsLc=;
 b=KMR26FQGlHPLfY0jgyKAuI0QkBhqjwIYFZVo+IMlmQf9UA9m+Db0ma736EMe5qc/Y6
 y0RnsrHlTheHf23Fouc9qkRc+ZyED3lsIIyHRGJGqwUxKTjvs2F01u75D/U0qnnUlhn2
 76T9nucRzTOvvJ//rPjcCDyvbDmrgd/PcUjpWskUnNXbxwEhld9U89uU+RrKYJjNoKOZ
 JQ91l2Hz8PwqQYyqCUX4d6IylerM1x6C9pcKsw9iSm711/9Vlwj1B9p6Dh4a2TG6WChy
 5yI9rvhEGbJPAPl2C+TAsuEIEBk5vGKhIs0ibL1MpUO45sgo5kwo9HIfpDviFvUh9FsL
 MPxQ==
X-Gm-Message-State: AOAM530dSzGx3x0NNhXTDb5brZUIXZwQmXyJNvUxXJMwW6d7p83r2l30
 3Jx5c8h9CZFgAf+Fy+cDDL8bdNbaMU38dg==
X-Google-Smtp-Source: ABdhPJwAKCa6aU9TzqvvPfPjieG8ehz2cYUpsLrxlf1PFqyDCtcNSixsEj9kJjaEAIISyJPtK7ooSw==
X-Received: by 2002:adf:c74f:: with SMTP id b15mr4057365wrh.276.1639781320104; 
 Fri, 17 Dec 2021 14:48:40 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id j14sm8134632wrn.88.2021.12.17.14.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 14:48:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 23:48:14 +0100
Message-Id: <20211217224814.107305-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/lsscsi: bump to version 0.32
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
Cc: Antony Pavlov <antonynpavlov@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

http://sg.danny.cz/scsi/lsscsi.ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix hash

 package/lsscsi/lsscsi.hash | 2 +-
 package/lsscsi/lsscsi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lsscsi/lsscsi.hash b/package/lsscsi/lsscsi.hash
index d444c7e059..d2df600523 100644
--- a/package/lsscsi/lsscsi.hash
+++ b/package/lsscsi/lsscsi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  12bf1973014803c6fd6d547e7594a4c049f0eef3bf5d22190d4be29d7c09f3ca  lsscsi-0.31.tgz
+sha256  0a800e9e94dca2ab702d65d72777ae8cae078e3d74d0bcbed64ba0849e8029a1  lsscsi-0.32.tgz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/lsscsi/lsscsi.mk b/package/lsscsi/lsscsi.mk
index e9a5255397..716b6b74fb 100644
--- a/package/lsscsi/lsscsi.mk
+++ b/package/lsscsi/lsscsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSSCSI_VERSION = 0.31
+LSSCSI_VERSION = 0.32
 LSSCSI_SOURCE = lsscsi-$(LSSCSI_VERSION).tgz
 LSSCSI_SITE = http://sg.danny.cz/scsi
 LSSCSI_LICENSE = GPL-2.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
