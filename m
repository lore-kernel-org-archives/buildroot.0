Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AFEC43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A3BA81C67;
	Sun, 19 Jun 2022 16:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A3BA81C67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4dcKC6RjHLxq; Sun, 19 Jun 2022 16:45:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CD2581C40;
	Sun, 19 Jun 2022 16:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CD2581C40
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB9441BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CCB34010E
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CCB34010E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_nZIKFv5nvN for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:45:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55E23400CC
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55E23400CC
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:45:11 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id m1so3901387wrb.2
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aV0NuXjqi53lJgvlMfDkmT1fpE5lFxP3XJS2ZEDu7wo=;
 b=OWyIugwJ0aNX6EvicJkMmYMoiEBMpOOqJT9CVY+Rw2HIGgMxKHJAt8et0+DYnv58xz
 I49qmoZ3ugKqzM5B1qrg1/PDGbqst+qNqK+wVXce2yqS1z4pH4nIN9mB4q8a+WRQBRWL
 vAJ+fusk47sP3WSC5AVv7ABWhS5NI/B2/fZm1wzi7PqGDAgQBR2VUnqD0BUrBRJa+g3i
 RHqJxQ8ErnzLcyscANdJoZgx8qVvO9+NgSEXO8c4Htys+7jS+V5ccP/s3Nf9P4RO3s47
 +Vl+iUnQGhy1/olR0UjMVEb9ma32/d6osye7bGElp7zaTA7T05mtrRiqs8y+uqu+lo9d
 N2nw==
X-Gm-Message-State: AJIora/0BZ8ovOhVwkufbaDQlb+ORIC5BROHqbbF63D1Gc9Q/K5ulZZT
 B6xq/ejk5IUQfdmfJ/6UV4QkHjRBWaU=
X-Google-Smtp-Source: AGRyM1uayahYFvxgSkFZN/sli9H2a01lfwkWzTJq0wfVUBE/Y9yzDeT79t11+BaRhUhhVtQtkwc0sw==
X-Received: by 2002:a05:6000:12c3:b0:21a:3795:70ac with SMTP id
 l3-20020a05600012c300b0021a379570acmr16606573wrx.175.1655657109373; 
 Sun, 19 Jun 2022 09:45:09 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c4f0900b0039db500714fsm13102367wmq.6.2022.06.19.09.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 09:45:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:42:24 +0200
Message-Id: <20220619164224.647672-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aV0NuXjqi53lJgvlMfDkmT1fpE5lFxP3XJS2ZEDu7wo=;
 b=m3O6fw5czaH1hTv/Q22MI8jNQMq/1r9z2VpVb0uYlY/tyMc9fN8B4OqHJGZUfaT1ix
 6C5fqXhDMSA/cGlUEoW/Qmc79vYWVCwHtZ+m32Milzl5ZXSlVYxDuwO4NNfUrN9bSXAe
 OjbKnC2zV7dG5tN2/oRzcZ7wAEUPjV3YiTznNgbjjK0C5+5dsj7uK2MTthEfVb2QyJPB
 Zd+6LlDfqtoJfip+qS2US2G7QqyQdVtHssBzvfC6Im2LrD1RMYyinLtjmjyUWjyKRCrl
 glaH0dn4X+ghtbN/1eF3bfWhucvdRZYnCfGESzDsPcdJ1V6ZrHkYGIaGaS/E2HE0A2yg
 s1CQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=m3O6fw5c
Subject: [Buildroot] [PATCH 1/1] package/python-pylru: bump to version 1.2.1
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://github.com/jlhutch/pylru/compare/v1.2.0...v1.2.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pylru/python-pylru.hash | 6 +++---
 package/python-pylru/python-pylru.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pylru/python-pylru.hash b/package/python-pylru/python-pylru.hash
index 1962c6015b..83217a3417 100644
--- a/package/python-pylru/python-pylru.hash
+++ b/package/python-pylru/python-pylru.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylru/json
-md5	8f0050f86d1fa68bb18673de37da543b  pylru-1.2.0.tar.gz
-sha256	492f934bb98dc6c8b2370c02c95c65516ddc08c8f64d27f70087eb038621d297  pylru-1.2.0.tar.gz
+md5  101486c319fa219f147b8811975780d9  pylru-1.2.1.tar.gz
+sha256  47ad140a63ab9389648dadfbb4330700e0ffeeb28ec04664ee47d37ed133b0f4  pylru-1.2.1.tar.gz
 # Locally computed sha256 checksums
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
diff --git a/package/python-pylru/python-pylru.mk b/package/python-pylru/python-pylru.mk
index 98c3945dd0..8658f75ba9 100644
--- a/package/python-pylru/python-pylru.mk
+++ b/package/python-pylru/python-pylru.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLRU_VERSION = 1.2.0
+PYTHON_PYLRU_VERSION = 1.2.1
 PYTHON_PYLRU_SOURCE = pylru-$(PYTHON_PYLRU_VERSION).tar.gz
-PYTHON_PYLRU_SITE = https://files.pythonhosted.org/packages/9c/88/30972cd0518452563221c80bffc2a5832499d736648ef8fe492affae15c5
+PYTHON_PYLRU_SITE = https://files.pythonhosted.org/packages/95/8e/2a0d3426738db0b41d69d36243bdd00420ad231e802d09dad8db02005d13
 PYTHON_PYLRU_SETUP_TYPE = setuptools
 PYTHON_PYLRU_LICENSE = GPL-2.0
 PYTHON_PYLRU_LICENSE_FILES = LICENSE.txt
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
