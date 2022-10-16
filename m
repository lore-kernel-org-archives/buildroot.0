Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D00C4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 20:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26647408F3;
	Sun, 16 Oct 2022 20:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26647408F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AaYmhaiXFx32; Sun, 16 Oct 2022 20:53:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDBD64088E;
	Sun, 16 Oct 2022 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDBD64088E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5297C1BF37C
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 20:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B53560EF2
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B53560EF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FiMRnB-QcysI for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 20:53:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F5F160706
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F5F160706
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 20:53:00 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id a3so15679865wrt.0
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 13:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9dWz4rQf66PQJ7IV4QGK3UomW8QTXV/E4H1DKAb9gYM=;
 b=K1NQtUUgA1vefLImQlvFkH1dP0XGqkXIjTxmKyHBiAwuExPbYc8M+C/54fRHtwiiCs
 wsJkOygve5QXr/o55B5x5AVAerdLYH4UeCgrYfGgG0SeKkcLgGgoPCy+OYd4Mc9b+q3f
 6873ug4x92n2Zf20ESmkiXFJF+WTc9GdWgMjq3MJPqLv5Yl/MwE3+XzLULsL17fa24p5
 6AkF4+YHj5E/JUkoQvG5reGuXgelk7/o3fHGnqoBEoN0I1YeWQtjc2oXL3MRhp2ESvYc
 MlkQZCAKWY7NOVfv65zd/rOwiJfxv2O6yVjCLW3zq50+uHDnzVBeLLP5XJXjZj5LcT5J
 ZaDA==
X-Gm-Message-State: ACrzQf2GbzqvFbzuwdFSn7ZEkkUYmcJ9M+EL+NuiKG/5Ust89eVDPr0w
 g2+HmXdMnaHfOywwHvyamXgECgHnrBI=
X-Google-Smtp-Source: AMsMyM5d1gjIwlIMxWWsO0Ip8fNhSYROyAMErO/1ezqR2x72mLQhe/14UbdMnI6lG3iZrewh22lt7Q==
X-Received: by 2002:adf:e10f:0:b0:22a:43e8:969f with SMTP id
 t15-20020adfe10f000000b0022a43e8969fmr4726063wrz.292.1665953578097; 
 Sun, 16 Oct 2022 13:52:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 g16-20020a05600c311000b003c6237e867esm8514246wmo.0.2022.10.16.13.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 13:52:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 22:52:54 +0200
Message-Id: <20221016205254.13656-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9dWz4rQf66PQJ7IV4QGK3UomW8QTXV/E4H1DKAb9gYM=;
 b=c1AXeG1c1iyuEEOCvJdSlLHrRbtawO1ErLTEJc2XWuUK9QREycU+vIT+wB065bb16a
 vob0tWapQyWO2L2pj3KNWWPfXNOkz5GwWsBncGIYtb4JqgxYEa/j9+VZeUcz40LKJLf1
 XyKSJYWtVDa/1a0i5z/hoH8Q9BuOk99u1cGAwJB5cUPwWGKHoagLUWCy9IBkTdTv2aoX
 ueSuLp9ITtbx+HkK0q54HZpECD+VeAhYWgC6DQWtgjGpAfKKN29Sq6qZAx429L23DVls
 P2NjU1lHx6VC/0dyhfPOsRgUJTh6DybRDnDb906qLQRme0FZwDNGXbs2s4SUJAR/J+L3
 dGzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=c1AXeG1c
Subject: [Buildroot] [PATCH 1/1] package/libosip2: security bump to version
 5.3.1
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-41550: GNU oSIP v5.3.0 was discovered to contain an integer
overflow via the component osip_body_parse_header.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libosip2/libosip2.hash | 2 +-
 package/libosip2/libosip2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libosip2/libosip2.hash b/package/libosip2/libosip2.hash
index 071ad7e61a..a563f0c4cd 100644
--- a/package/libosip2/libosip2.hash
+++ b/package/libosip2/libosip2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  f4725916c22cf514969efb15c3c207233d64739383f7d42956038b78f6cae8c8  libosip2-5.3.0.tar.gz
+sha256  fe82fe841608266ac15a5c1118216da00c554d5006e2875a8ac3752b1e6adc79  libosip2-5.3.1.tar.gz
 
 # Hash for license file:
 sha256  8d9e95ed0e48df46dc758eb0d86df611f771eab4eed94bebb77dca87f1c897de  COPYING
diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index 2f9b7a9242..618d98a85c 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSIP2_VERSION = 5.3.0
+LIBOSIP2_VERSION = 5.3.1
 LIBOSIP2_SITE = $(BR2_GNU_MIRROR)/osip
 LIBOSIP2_INSTALL_STAGING = YES
 LIBOSIP2_LICENSE = LGPL-2.1+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
