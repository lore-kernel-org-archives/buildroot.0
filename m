Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33088C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 09:42:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEEE160F9D
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 09:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DEEE160F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A875E4050E;
	Sun, 10 Oct 2021 09:42:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3P4pYVKi5us; Sun, 10 Oct 2021 09:42:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24501404F4;
	Sun, 10 Oct 2021 09:42:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C0AA91BF476
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 09:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B034D404F4
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 09:42:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y7RdKaEgubVo for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 09:42:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F02F4404F1
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 09:42:33 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k7so45004942wrd.13
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 02:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yQesus0Ffr+4hhlHZMq47dKpL7ifEv3HkjAL4m4hrqg=;
 b=ET41Qbt/CL2NXY9RbMeq5A8oo7zf7LRwL7pWJu91CKMul198wUBxHPSJ+OsWbLsAi/
 OIVEso7x6vECN2kXZ5rWLaeaAsllSOB0z6KNXNV01I2PJjsOQhXRIzc0gHYKRnSV7RMN
 Cpw55ARERxW0gx4IG0uQq47LxUo+l7Jo/WkJAAIubwPLAYawygHLlFFIFb38VL0rnjEH
 3LVMP0oUPNXAvLfIBK2lcWSYbrGlgTf3aXx5jhGEsrai09EBcXInBB2XebVIeKJoGjDY
 02RTlIG+HPfZ/qC9BQUFMSW1+iSMIAM8fXdE6jpo/tBQeRePsXUDExjHTEKAxmyWMjwY
 4l9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yQesus0Ffr+4hhlHZMq47dKpL7ifEv3HkjAL4m4hrqg=;
 b=md80tcd4OxQYxwn+MJ8fdyCUgLdtDYWC2gxMRbyZ8HK0MNWyVpVBMuoSGOy0dsJP7r
 qlAnSq78KpmhjHlHNDk/q/TviYRJHn9GazsE0s4MBxn/JRHAOtmb4QIq3gPrFikmmYA/
 gU+6ii2mCCvjIP0I+pvyfvAz/SX4tkDOb35lVuN3gzdv03l+FBk6oXWClK9GrX7K5hNQ
 iQ9beFU3d44paqW7pvkEZcQXJox83YmLmTWYBivmVO+hgE+MuXFbjob3V+6I6m7lf/hU
 vQ9P8+wld+UWb5fpAhPl/F7+9VUQYClLFqytZLGwzfejtXVzHveJIDsJlat38LlFOsZZ
 iUZA==
X-Gm-Message-State: AOAM533LThh+14eQA0LxFs6T8C/PMIkNXQ171+eb5B16/gzwpDsrk7Aw
 3/aOAa3SxWmfXrztiUDAqO88oSkRhXg=
X-Google-Smtp-Source: ABdhPJxhHzodAic3U5HqqiymOHZimr+SoOMxYEu69tr8NiE9zjOH4oV8flA3+UYgtP9vMud3nNMlDQ==
X-Received: by 2002:a1c:f609:: with SMTP id w9mr14439956wmc.24.1633858951907; 
 Sun, 10 Oct 2021 02:42:31 -0700 (PDT)
Received: from localhost.localdomain (138.23.87.79.rev.sfr.net. [79.87.23.138])
 by smtp.gmail.com with ESMTPSA id z6sm258939wro.25.2021.10.10.02.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 02:42:31 -0700 (PDT)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 11:42:23 +0200
Message-Id: <20211010094224.109154-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libosip2: bump to version 5.2.1
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/libosip2/libosip2.hash | 2 +-
 package/libosip2/libosip2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libosip2/libosip2.hash b/package/libosip2/libosip2.hash
index 400158cd7f..7a08bf26a7 100644
--- a/package/libosip2/libosip2.hash
+++ b/package/libosip2/libosip2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  4fb48b2ea568bb41c6244b0df2bb7175849ca93e84be53ceb268fdf9351bb375  libosip2-5.2.0.tar.gz
+sha256  ee3784bc8e7774f56ecd0e2ca6e3e11d38b373435115baf1f1aa0ca0bfd02bf2  libosip2-5.2.1.tar.gz
 
 # Hash for license file:
 sha256  8d9e95ed0e48df46dc758eb0d86df611f771eab4eed94bebb77dca87f1c897de  COPYING
diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index b86a72479e..967602b426 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSIP2_VERSION = 5.2.0
+LIBOSIP2_VERSION = 5.2.1
 LIBOSIP2_SITE = $(BR2_GNU_MIRROR)/osip
 LIBOSIP2_INSTALL_STAGING = YES
 LIBOSIP2_LICENSE = LGPL-2.1+
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
