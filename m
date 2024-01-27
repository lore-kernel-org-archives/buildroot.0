Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177AFC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 22:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B81241776;
	Sat, 27 Jan 2024 22:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B81241776
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yU8eRmBa-qPi; Sat, 27 Jan 2024 22:57:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC03D4176D;
	Sat, 27 Jan 2024 22:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC03D4176D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E5CF41BF5A5
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 22:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3AD54176D
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 22:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3AD54176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Am7em_RzHUNZ for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 22:57:09 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A16A94176A
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 22:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A16A94176A
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e60e135a7so14632885e9.0
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 14:57:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706396227; x=1707001027;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=91epBSBB2vgv6xJwi6jOqqyfWlLo/BqC0zqDLcaxghk=;
 b=Q8cmUZeSH3KlpD1GnihH3HULjX6viL+fpZ/dZyw9zvbh8tHrrI4xZRS+Sg5zfWWucc
 oZnTIoy520aP9r5scJOx5JHRvS1qSVO9yI6zedGGd82Ezr3b7NLauYbykQdDRtkCylXc
 eyZy/3YqEdX0coLlm4lrPb2rMla7IZ2aBBgUiXrguFJxLshm8zUdtJEKiYjmJ4pljIWv
 GwpmO9MxzZ2ZIj9jW8jfvQGerEXVfUmELrKWrOP/pHSX2SGV3D4gNV5U4uEK1VlZRzg+
 dTi3Kie7ZvqtyF1RDYBewtYBTgf+eqda3wW9IKE5BSoogR2f80TTtLEOO87SCWYb9HnV
 zZ1w==
X-Gm-Message-State: AOJu0Yy6UNkBSAaT5qJwQc5RANGUOkVdjsDbDrcbE5vyaflf3LQj49A0
 /LioG49GnkkscsVpNddstdCNHK1+FcZAMfOEzQZfeqt0kyWegMMvlSopOknPSlI=
X-Google-Smtp-Source: AGHT+IEFHoNedrjXN++yIDdCbcTHGmcrYApSV5Bh1K0xdOWEz7brjX9Xa3Ius+oWBxKghto6nuR5TQ==
X-Received: by 2002:a05:600c:3b28:b0:40e:53ef:8ecb with SMTP id
 m40-20020a05600c3b2800b0040e53ef8ecbmr2783961wms.5.1706396226558; 
 Sat, 27 Jan 2024 14:57:06 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c358e00b0040ea875a527sm5848652wmq.26.2024.01.27.14.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jan 2024 14:57:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 23:56:57 +0100
Message-ID: <20240127225657.2427657-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706396227; x=1707001027; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=91epBSBB2vgv6xJwi6jOqqyfWlLo/BqC0zqDLcaxghk=;
 b=HZ3VAN+LIAiG0Mx2c56lRzF4O+suyfRqTQ9EOm/eylHlPQ9k2JYTdO7gRC8iS+5vP/
 CeP5N8QFUDRLtXb8Jl9hX+2/UeF3ARHhKlcVjxE67NcHjr9ejqqepqcGrUUMz7KsgcrR
 PE+QcxKmz0jxkVE+e1dcpdeFOz2eoIyd9CjoSF0KNxUQ3dUBMJL+3ddhiGFTclOJD/w8
 VQ0w3JwjuFOMR2JoO9ZtMTi8VOp3aoC0YiHl5DoZR/819p+ZBz5Vhqs9FD+gsj4lrZlj
 vvqWrFI7Dk7KyaNK/B3Y/lIaCLmj6lql+8wT3qkqpDe8HBUCy75kb46JEkgmoKzDMreN
 cVLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HZ3VAN+L
Subject: [Buildroot] [PATCH 1/1] package/frr: security bump to version 8.5.4
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
Cc: Vadim Kochan <vadim4j@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-38802, CVE-2023-41360, CVE-2023-46752, CVE-2023-46753,
CVE-2023-47234 and CVE-2023-47235

https://frrouting.org/security/
https://frrouting.org/release/8.5.4/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/frr/frr.hash | 2 +-
 package/frr/frr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 836f130b93..4a61084bae 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8a6b0e0fa1e89493ba84cf176674e55c7a814821fd02a7188095b76c37c3935f  frr-8.4.2.tar.gz
+sha256  7ae9d8bafc65bb5d0f21061ac61dbc6cf93b2b05a5dae9e5eec72ed42388551e  frr-8.5.4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index abae784c40..19f346fd7b 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 8.4.2
+FRR_VERSION = 8.5.4
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0
 FRR_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
