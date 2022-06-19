Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC88CCA480
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A59460E56;
	Sun, 19 Jun 2022 16:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A59460E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rtVO7tdQYzlE; Sun, 19 Jun 2022 16:37:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 577F460B15;
	Sun, 19 Jun 2022 16:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 577F460B15
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD6D01BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98CBE81C2F
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98CBE81C2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wRQlLm6I5KSX for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:37:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90F3481C21
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90F3481C21
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:37:00 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id a10so4629619wmj.5
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VRgRs3DYLcOkXrEKv+W+79ZC7bBTLPjSDYGC3Xehyy0=;
 b=nTSa/zPTsnmQrbl7Hq0C/zrWbeggCIkpvl5aiM5ROdzrwQve6HBz7LcNnqZVJJLyxh
 TpdceeUkgpuNdnOoWicWute3PjEiUZlqNC9p6rKpT3qdl8B8fKLq5U6ivrDK0EBjNowY
 NMch9wyhF3ISe6qayreMHquKtu1SIwlh5ETSaAUoyYmHHDTNYDYXiI/bIZ9GAYlOs0xX
 UkumS/JxQKGEWQDHq23/X8gqS7Q5BdLOO4tmzBlOxIqaa3ZJquIOdbkLrdAASLWxrJ0p
 isDWWV3flmxvLvoIq83rSSdjcHaPrkAOgs2ZgO/bmypDbwdWLmG0HDvST8JFQyWimqPG
 8TDQ==
X-Gm-Message-State: AJIora+/aqIPZCjLyxbB1+WCXa0MtkCPrgz8VQtMSRAjlQWr2qbApGm2
 dwGS0ZVc16NlDyM5BfvF6AZ24XP2wwM=
X-Google-Smtp-Source: AGRyM1sL2nHIU8C6n/kVFyn1dZU5jL17bQ2wozBBkv3NxdiHwqlbVS2rNwkJCEwKfGhRRr0C1yYAEg==
X-Received: by 2002:a05:600c:4fc6:b0:39c:9417:a8bf with SMTP id
 o6-20020a05600c4fc600b0039c9417a8bfmr20133263wmq.26.1655656618616; 
 Sun, 19 Jun 2022 09:36:58 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p33-20020a05600c1da100b0039ef836d841sm5460946wms.42.2022.06.19.09.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 09:36:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:34:15 +0200
Message-Id: <20220619163415.636262-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VRgRs3DYLcOkXrEKv+W+79ZC7bBTLPjSDYGC3Xehyy0=;
 b=UTi2Z/iidaSRzVZZsutq/RCOM5y1KhxaKSG+/UPAD6vxXph4tDmnWyWvFRJa3mHJmS
 cKu+bsjJjM6ZHd6FEDOPpuFPxG/VoX7+ZkCrwSc47v1uVsWl/L8NeDuRt+55O5WR2YQT
 OdDeaxCD6RVVN370CrHKawNABGiWHFV74N9kghsSDpfL2CNdqMS2r9kwmU7s0uCs5vxh
 bpJug63F9q/QiYkNHe8WjDKmrp00/xFKb0y0qpjAtCEuXPLUVmIfrnUC3qSLFWz6E8ZT
 WVJ+MSpHwC+w+5e6AyIgRN01nyZp3M2bc7GMenpstPNbOxHmS2eckOZA4UnSRPhqXSOm
 VM0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UTi2Z/ii
Subject: [Buildroot] [PATCH 1/1] package/systemd: replace
 SYSTEMD_CPE_ID_VENDOR
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

freedesktop has been replaced by systemd_project since January 2022:

<cpe-item name="cpe:/a:freedesktop:systemd:247:rc1" deprecated="true" deprecation_date="2022-01-28T19:09:42.747Z">
    <title xml:lang="en-US">freedesktop systemd 247 Release Candidate 1</title>
      <reference href="https://github.com/systemd/systemd/releases">Change Log</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:freedesktop:systemd:247:rc1:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:systemd_project:systemd:247:rc1:*:*:*:*:*:*" type="NAME_CORRECTION"/>

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asystemd_project%3Asystemd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b309507e12..46a4e8de2c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -44,7 +44,7 @@ SYSTEMD_LICENSE_FILES = \
 	LICENSES/murmurhash2-public-domain.txt \
 	LICENSES/OFL-1.1.txt \
 	LICENSES/README.md
-SYSTEMD_CPE_ID_VENDOR = freedesktop
+SYSTEMD_CPE_ID_VENDOR = systemd_project
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
