Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1731DCE79AD
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 21:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0CAF80D20;
	Tue, 19 Sep 2023 21:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0CAF80D20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N0SS9Ga1Yth3; Tue, 19 Sep 2023 21:04:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E61EA82331;
	Tue, 19 Sep 2023 21:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E61EA82331
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F020C1BF401
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 21:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C860C41C3C
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 21:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C860C41C3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ksYLWtlts0t for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 21:04:24 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D78341BF0
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 21:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D78341BF0
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4051fea48a8so2215935e9.2
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 14:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695157462; x=1695762262;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pDk2faxMPYh0VmRqcltfDWhaqqBAlQh9dxEsf+I2dps=;
 b=c7RTk8NR3hH9uIPVY+KrjlbryQ+wJUJ3UM+UdlQvatIGxxx0fuES8dXsiNwzMGyYhI
 HgW09keHG/8uS8DLwed/RpulkAas/ThPXvljSnm5kMzMUMoj4mTJU4GAaUHgPknRqkTD
 djGD22P1T+Ffo/ltyrYK+lY2hdzwszX0BUjRmvVhR+bRk9dHsYhQDfULnG8/4VR7xnzB
 ajmbPo43xt+ZhVILxPHhNiC6OT+5XzJxzjiUiaUujxH07b9mHO/1d5P9pqzDt3T6tIHx
 Q7AjwZmyhp2COqKviZtOKIJtIg34Z+6kzIv23khwShOZCfwHsMTXrY/KI43ARkZIjbg/
 L7Tw==
X-Gm-Message-State: AOJu0Yw5BdxvtbQATE36dMv0CquGl48kka9wPOlzjyr3vPNe2oV1X6Jj
 pzs8inbWAze1OVdfl2O9Fo+dAnPQDPY=
X-Google-Smtp-Source: AGHT+IEGLUj4LzGJIDI2G0XclAXYRIuB3TDxodpAf3PSZez++4fGLkfkKE1mx1mukd30xMnrnnCcfA==
X-Received: by 2002:adf:f1cd:0:b0:321:4ecb:1935 with SMTP id
 z13-20020adff1cd000000b003214ecb1935mr574535wro.42.1695157462064; 
 Tue, 19 Sep 2023 14:04:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r6-20020a5d4e46000000b003198a9d758dsm16667906wrt.78.2023.09.19.14.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 14:04:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 23:04:05 +0200
Message-Id: <20230919210405.554008-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695157462; x=1695762262; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pDk2faxMPYh0VmRqcltfDWhaqqBAlQh9dxEsf+I2dps=;
 b=cagcR6HhFfrwh30ONk+g3dQY052wnCOnUX8FQRA2lK9Muzo3kDlND8Ge43I1l9fJQR
 m6uwjvnufZeEZPRef4LmNtKJnob9QU2rYS2FuKMlKYJQ4V7LztfAqXjM7aqibcl/o8D4
 1KARh5yr935L/cq0+AXySVEHBrxBdz5hi+txWEXcurkqVlVqvHxfuwX0sTpY8wW7cSU5
 RDzZ9IKYmMWHXv7KmAOg7HpThp4bu/ExIXYdY1aRGOA7A3koNQDxchesBvPQSYGmqHYN
 0idAbG5kiRUQ5d8mdvdCoO4Wxzoj52F4s7514T9jYk38d802RDQgNXkLR0V0lM6yRfYF
 TEGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cagcR6Hh
Subject: [Buildroot] [PATCH 1/1] package/xterm: bump to version 384
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

- Fix CVE-2023-40359: xterm before 380 supports ReGIS reporting for
  character-set names even if they have unexpected characters (i.e.,
  neither alphanumeric nor underscore), aka a pointer/overflow issue.
  This can only occur for xterm installations that are configured at
  compile time to use a certain experimental feature.
- Update COPYING hash (update in year and version)

https://invisible-island.net/xterm/xterm.log.html#xterm_384

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xterm/xterm.hash | 4 ++--
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index 12cd2e639b..1a2ad8fea0 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  1e5bb7aad068fb31d6d3cbb77f80c7ad1526cd4c956a4ddcf2c5cf28af5334e1  xterm-376.tgz
+sha256  31ef870740ceae020c3c4b4a9601c7f47bfd46672c1aaf2d213a565d64cbc373  xterm-384.tgz
 # Locally calculated
-sha256  9521ef761474cd31ea406f56a751646a7b42a9287cdc6f2f8e52ed4c4d2a73e7  COPYING
+sha256  98d02d0b7f7b8aabb742b05e6960caaa9ae20e26d2f0d0dc57808362f2ac79bc  COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index d01b608d99..2fc2f734c8 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 376
+XTERM_VERSION = 384
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
