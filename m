Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA2BC48BF6
	for <buildroot@archiver.kernel.org>; Mon, 26 Feb 2024 20:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EDD560B0E;
	Mon, 26 Feb 2024 20:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efyb-AgKVc_O; Mon, 26 Feb 2024 20:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22E2660B12
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22E2660B12;
	Mon, 26 Feb 2024 20:54:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71B361BF271
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 20:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E6E081EC0
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 20:54:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0oojLWUa1EXp for <buildroot@lists.busybox.net>;
 Mon, 26 Feb 2024 20:54:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 009DF81EB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 009DF81EB8
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 009DF81EB8
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 20:54:50 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5a0680bc600so727803eaf.0
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 12:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708980889; x=1709585689;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wUXqya1NaIyeZQOxQF8CEVB5OiuSjkmETArjrIzcL/Y=;
 b=S6j72NQdWxOUs6+uh4XSN1hz8sxBu7koSS3kC99YzkKxIychjpo7jdS3GjpolhXApH
 vShR7Qb57wQ2RLYZaJkONkfhkN6hVqcRS2Tq/k48zbyB6isk2lXkAtu8mNNFg3letZCX
 6pMMhxkez8Eojz7gmsOImbvTNFjhJsSHCyC67EHSfIgVfQmAIFq03tcG0OOnn5Ot39Cz
 4QsFX25R/TvhsIetNNHxi+ILlXqnYHubRAuGjhwzd7J8pIhfH7XZ3bhgsm68QW3cuCXN
 TH2RTAwnGX7c4pjzFBFoEcQTgJymRRWv7/Sfag9NKGkFWvi72QHI+mQcghf9fbW8USFZ
 PPcg==
X-Gm-Message-State: AOJu0YxFBHcA2+obuLLm44U2ygG4mnHKVtD1ixQaTawYlklfXhnZlTOe
 0lQIUEfspiUU3pNJC7ah14bzzQ4cgTEXA//P5kTu9hgAswF9taXdncFS3Lo0yWHyteD47y7SMAL
 n
X-Google-Smtp-Source: AGHT+IGfxqkN8uTXzstTVnlynUZ/uIx1a0V84G15C7i0BUkTVrSX+9s6xJv/4ne9+AiQLi3mlF0yIw==
X-Received: by 2002:a05:6358:1088:b0:176:d5b7:344a with SMTP id
 j8-20020a056358108800b00176d5b7344amr10069020rwi.29.1708980889255; 
 Mon, 26 Feb 2024 12:54:49 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a28-20020a631a1c000000b005dcbb855530sm4369991pga.76.2024.02.26.12.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 12:54:48 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 26 Feb 2024 13:54:37 -0700
Message-ID: <20240226205446.842600-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708980889; x=1709585689;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wUXqya1NaIyeZQOxQF8CEVB5OiuSjkmETArjrIzcL/Y=;
 b=EeOqlFkXjRdGJBmBumg0zq8XpNDuffTMZBdeEbB/CHGOCNk+0pSUXDZYxYkJsoYu19
 B66FI32cafCfCqE0iHt6GFsaONvDWx1LpB3U9n7VmtgPw+L9yAxaPaI53VLzXzuBNna9
 3FKgYfYHxeo/ADMAov0Ugdd37Un0Rglq9GoA0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EeOqlFkX
Subject: [Buildroot] [PATCH 1/9] package/libsepol: bump to version 3.6
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/libsepol/libsepol.hash | 2 +-
 package/libsepol/libsepol.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index c243aaae2b..1369d820e1 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  78fdaf69924db780bac78546e43d9c44074bad798c2c415d0b9bb96d065ee8a2  libsepol-3.5.tar.gz
+sha256  c9dc585ea94903d784d597c861cd5dce6459168f95e22b31a0eab1cdd800975a  libsepol-3.6.tar.gz
 
 # Hash for license file
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index f7782542ec..6361cc66bc 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 3.5
+LIBSEPOL_VERSION = 3.6
 LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEPOL_VERSION)
 LIBSEPOL_LICENSE = LGPL-2.1+
 LIBSEPOL_LICENSE_FILES = LICENSE
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
