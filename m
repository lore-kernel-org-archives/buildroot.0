Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98C8C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 20:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6034A83022;
	Sun, 29 May 2022 20:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iKjoo8dpoOOX; Sun, 29 May 2022 20:41:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 479A282CB7;
	Sun, 29 May 2022 20:41:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D01E31BF3D7
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 20:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE7A440B0D
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 20:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwupKtxb_sLa for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 20:41:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C77234090E
 for <buildroot@buildroot.org>; Sun, 29 May 2022 20:41:41 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 p5-20020a1c2905000000b003970dd5404dso5461980wmp.0
 for <buildroot@buildroot.org>; Sun, 29 May 2022 13:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a8alpTUDvIf23oVHtJMhaQqcYL2ROv5MgVDo9oKkCw8=;
 b=LTJNt8P2atd5AaojgAG+nId4xF8jEeIwEhLjgomqgjE9cZGy5xpW3/hUwZSEZjq1eg
 lUxmbHMx6DXGpmox7z4wiXAJ71eNi7a7XVDL2fNfDMAPKtNnqd5YqxbO6wtQBkr1qmSo
 nyOfpUEfcTE40iRLLdbEkPKLd3OdeZhynIGAP/VdCvEHqrEW+dKUSFGlB39dhDVcNjCG
 M9H6jafIcg00op9RvHngexijIMt+q7P+jwjYRpH9JSvHxzNC9eR3qbLBPgksXAU7lHuo
 Zl7sKBX0c6hcO4//eyMaQeHL4w7gjh75ZDgkmjmRAn+9pThEnMJxAgHJnyOHwXs8s1KF
 eKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a8alpTUDvIf23oVHtJMhaQqcYL2ROv5MgVDo9oKkCw8=;
 b=HzfpJNx6loxwWHKoaYIVRSgda2kQtclL1v/v7J30rpKMtxHis6Nngbc7mM8WKbYc70
 6jtRo4/eGIK7d55dA9LlyrszX6/+CVdNVRU5DXzjHNJ82gk9UdodzcRQX564Bx3ad4yQ
 DHMMu/J4VUhakg2kT8M7icIqPNc82ykmbznH1W33pDQWASkE4LV3D4HDmSyR+hx4Mwyi
 IKQG96HzUVlUfZaSk9R1Py5qKQBi5VMyhui5QzxPelACb/uioKfO2WTLiBCJ9ixfoP28
 MYmPf9ZAX7wZWlxt6MhxchjpHZWbIJCKevHC4SRQmnqI3P6VIBAQTd1sysEeaKxPHmCj
 wqvw==
X-Gm-Message-State: AOAM5301obLgucB8e9ktR9pEL2xH5ZTvJZmoGs4R9o/lt7yTFEXnyLq2
 N2YZn8yUmfHNdCbAdM3z2xu6/xx/8t8=
X-Google-Smtp-Source: ABdhPJx7kXFqNC11yVgSNPaVKkzLIg+zGI23JVZc/29lepdQTsLMD5615tNfdJVnDXVLOKfDbGn4QQ==
X-Received: by 2002:a05:600c:4fce:b0:397:84e3:2297 with SMTP id
 o14-20020a05600c4fce00b0039784e32297mr14266906wmq.197.1653856899740; 
 Sun, 29 May 2022 13:41:39 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u1-20020adfae41000000b0020c5253d926sm7272239wrd.114.2022.05.29.13.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 13:41:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 22:39:10 +0200
Message-Id: <20220529203910.2905393-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ntfs-3g: security bump to version
 2022.5.17
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2021-46790, CVE-2022-30784, CVE-2022-30786, CVE-2022-30788 and
CVE-2022-30789:
https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-xchm-ph5h-hw4x

https://github.com/tuxera/ntfs-3g/releases/tag/2022.5.17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ntfs-3g/ntfs-3g.hash | 2 +-
 package/ntfs-3g/ntfs-3g.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ntfs-3g/ntfs-3g.hash b/package/ntfs-3g/ntfs-3g.hash
index 668e11a800..89bce73559 100644
--- a/package/ntfs-3g/ntfs-3g.hash
+++ b/package/ntfs-3g/ntfs-3g.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  55b883aa05d94b2ec746ef3966cb41e66bed6db99f22ddd41d1b8b94bb202efb  ntfs-3g_ntfsprogs-2021.8.22.tgz
+sha256  0489fbb6972581e1b417ab578d543f6ae522e7fa648c3c9b49c789510fd5eb93  ntfs-3g_ntfsprogs-2022.5.17.tgz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  COPYING.LIB
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 21f7cfc46d..64800c5eeb 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTFS_3G_VERSION = 2021.8.22
+NTFS_3G_VERSION = 2022.5.17
 NTFS_3G_SOURCE = ntfs-3g_ntfsprogs-$(NTFS_3G_VERSION).tgz
 NTFS_3G_SITE = http://tuxera.com/opensource
 NTFS_3G_CONF_OPTS = --disable-ldconfig
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
