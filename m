Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81292C47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 17:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17CE360A92;
	Sun, 14 Jan 2024 17:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17CE360A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMRIagrn9LK0; Sun, 14 Jan 2024 17:07:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CC1C60838;
	Sun, 14 Jan 2024 17:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CC1C60838
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC5401BF2F9
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 17:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B92F8264C
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 17:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B92F8264C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ymk95RS8zHs3 for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 17:07:05 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A54B82640
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 17:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A54B82640
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3376ead25e1so6055248f8f.3
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 09:07:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705252023; x=1705856823;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+CQ20xBDxrSPHS1cOyvC1u2PYqlUrtj9qcGAaSzSsrk=;
 b=fEIZVEX8usfp5pbcuDogGpnnSSVa+u2qQHbqse3e2+Wg2/bgGuFA4mZNHAA/j++RuX
 qIrjEWo9PCkhfibStOi8v8zqxPBUyM0q+Gxev2ZNr01s44kYibfNgWEIL06WwrrvAinx
 fn7P2yzpGTHxM4CU1JojwtY2yNi7cngQtGtDiAcdhr1DNIvbykVb2cFqcydul8ChnnAp
 GulQQkkiZNEvrOdhmZmZ/OAxbzMaD582tMrm6OxS86JjwqBuAOAk7MrbSfxi5L0tzsRq
 Fl5j35roTb2ViGFWYnR+DxXOaYwdreWeSt5ictma/x1WTw/Sjch6B9ybvuRLbgnA18fT
 SYdg==
X-Gm-Message-State: AOJu0YwqyqZlEJam8RV45DnvAKARN3XqIbbz7+/O1KQEwuR/p8s8OzmR
 B30zC66B8ZRC0nyUv4MDlyd8qzwi6gY=
X-Google-Smtp-Source: AGHT+IHbKi/1N8jyRa2+B6tfIinLEATlvDackINkuX5KNuPBQ/QMg1nszYNmfJbnggt59zyQ4p5dxQ==
X-Received: by 2002:a5d:644f:0:b0:337:715b:6fce with SMTP id
 d15-20020a5d644f000000b00337715b6fcemr2480048wrw.93.1705252022737; 
 Sun, 14 Jan 2024 09:07:02 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a8-20020a5d5088000000b003364a0e6983sm9532378wrt.62.2024.01.14.09.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jan 2024 09:07:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 18:06:57 +0100
Message-ID: <20240114170657.1614071-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705252023; x=1705856823; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+CQ20xBDxrSPHS1cOyvC1u2PYqlUrtj9qcGAaSzSsrk=;
 b=VViVLJ5X4GdhYd55Ob3epcu3C2gy+IG5rTO+ES6lyqTUEJGdh6+dK2l0twyvclRBrf
 Fqy3Y7ZJc47WnrIOR7BbcBjecJcG0OTJg8yAmpcymV6RjqdEtjedBFd8DBu4G/EMA4od
 JdAm+vn4Ls8eJLcQWACQaUeYxE8JG1cWslFR0UaluX3WyvXn3RRr3Bqpu6lAG/ujmLEo
 wsN1OnLiNphMoXD8EKhOp15NZB1iZKONvb+OLqFZhMY9upm2rEgaWIuA54diiQEBNbqS
 XmJADX9qL4ZEz4RUbrYHAeWUEwNn2fAYAqYS+P6mu48w2knbulnv0l/OX5bru7HR/Qh8
 vk4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VViVLJ5X
Subject: [Buildroot] [PATCH 1/1] package/attr: bump to version 2.5.2
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

https://lists.nongnu.org/archive/html/acl-devel/2024-01/msg00011.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/attr/attr.hash | 2 +-
 package/attr/attr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/attr/attr.hash b/package/attr/attr.hash
index 334a438cae..f63c0e312a 100644
--- a/package/attr/attr.hash
+++ b/package/attr/attr.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  db448a626f9313a1a970d636767316a8da32aede70518b8050fa0de7947adc32  attr-2.5.1.tar.xz
+sha256  f2e97b0ab7ce293681ab701915766190d607a1dba7fae8a718138150b700a70b  attr-2.5.2.tar.xz
 
 # Locally calculated
 sha256  98f318493be6b08bff3cd295791cde06c54e17882a3c74a1ed245eaa02533d52  doc/COPYING
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 6cc38e05f9..d0c8cd97f7 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATTR_VERSION = 2.5.1
+ATTR_VERSION = 2.5.2
 ATTR_SOURCE = attr-$(ATTR_VERSION).tar.xz
 ATTR_SITE = http://download.savannah.gnu.org/releases/attr
 ATTR_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
