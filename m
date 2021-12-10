Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B6EC433FE
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 21:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1655361B01;
	Fri, 10 Dec 2021 21:16:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4qxpSnaioEF; Fri, 10 Dec 2021 21:16:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBAED61AFF;
	Fri, 10 Dec 2021 21:16:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E452A1BF487
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 21:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D13B141344
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 21:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id msTGzJPx-UxC for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 21:16:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A606D41343
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 21:16:14 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id a18so17082972wrn.6
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 13:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mr8jcgrbpQ6rDVUaoGAicIdNCwLxolKQvRPeuHlcuzw=;
 b=GUHpMlOyyoAWCFzonJqhkUnWGBTjeAksewz+rDjGXV2x8kMbCOTGJHDqMX4rYLAucQ
 9u5BW+D/7g2VPp/IvtZiSdx0T0/typwmY2r3RaeWPASxkbiTFjoH9M4LQuhX7HLri7hb
 mAcgfa/tVr6A581jaR75MMhTRit1pPVfccyUilbZClkB8hF6bsOAuhoEFfAog55DpbL+
 BoGZg+gYUgfIRBJ6FXbN9albutvoLK7SPZOGhmOMHbfaNAW9K82p1t7lKIJMbjYbJhd5
 1SJSv0Mb+8hnG0/dgiekUBd/84eEiAPAi0f2Q7LXoZJMv+a1PD5muDiiSgu48+Ib+F6T
 S2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mr8jcgrbpQ6rDVUaoGAicIdNCwLxolKQvRPeuHlcuzw=;
 b=D7TnOO0GEU3INJy7btwEtpA64oDfb8Y8HaXIyNXsmKhaTnyW52gC+GzjYtmx4n84ir
 W8cra1E0aO0GqaX0UIgDuD9MQ4vp5zRSiKWwvjupxaTeiQeV++7aINsxm2vOP+gEkDkO
 ln25j2bi82hDS8sRWPSeKE0ejSKzgV1mZKEDM9AOcFxbMj3uZ0OHBYk/WwdZsau9Rz5a
 ZOW8LyiIs1u/UKoJSQIUIb1i7nkkYjuERrPJxzAnnphj+8CLcyUih50ppyQTGePkFBin
 GRy/6uuKIJTW345yCYjZn732BRwlD8qJiax0Jle70JgrEqSz4KnhvEFNSJzYyC7vk3QT
 Fqpw==
X-Gm-Message-State: AOAM531QXxX+VeEe1HXf7wm4WqoGN+lWsT6xg/aDHwiN4nsaPGD7U2Mg
 236DyScqxckDdzvL4eL8o5FGmvFhPLBhqA==
X-Google-Smtp-Source: ABdhPJySsoUWCRzzS5NKawqgY3SP0kT/593NT22++7ukTG4MwrB3BUxSahh9vc7AVPe7grlXahGSsw==
X-Received: by 2002:a5d:668f:: with SMTP id l15mr16749053wru.182.1639170972587; 
 Fri, 10 Dec 2021 13:16:12 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id f15sm4803225wmg.30.2021.12.10.13.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 13:16:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 22:15:58 +0100
Message-Id: <20211210211558.4015391-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/containerd: security bump to
 version 1.5.8
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

The eighth patch release for containerd 1.5 contains a mitigation for
CVE-2021-41190 as well as several fixes and updates.

https://github.com/containerd/containerd/releases/tag/v1.5.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 594c56a819..f1a6709554 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  09be0cedea77568029aa0c7be9a323b89fa6886b402b5d223780a05b8c7cd45a  containerd-1.5.7.tar.gz
+sha256  a41ab8d39393c9456941b477c33bb1b221a29b635f1c9a99523aab2f5e74f790  containerd-1.5.8.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index fdbd2bf3e6..cd975db274 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.5.7
+CONTAINERD_VERSION = 1.5.8
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
