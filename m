Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07005C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 03:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82E62813D4;
	Sun,  5 Nov 2023 03:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82E62813D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1WTfQu1Y9dZu; Sun,  5 Nov 2023 03:39:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF38380F59;
	Sun,  5 Nov 2023 03:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF38380F59
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8868D1BF861
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 03:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6234C80E8C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 03:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6234C80E8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IsQvkArBOzd3 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 03:39:56 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EFD780E7E
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 03:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EFD780E7E
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7a692658181so111195439f.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 20:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699155595; x=1699760395;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4SvDbIgjudMxy4Ed/6qxre11PmlftNFbuUtD8hjXy18=;
 b=gaT6klEyuPtSrcvGMzLMja8Fh+dfkMiu4JETVboxxKzARDeVCAaZPIEu7RdMKkpx8u
 3N6SnCCnJeb3FHPzXjmf4jhpXlhlLfFhG0IY1h5lOOH/Z5rAyK+lgJ0eGGyifeImraVQ
 uHTo/5mdW7a3XEm3douCTclfZ5Da6/q13myzJ5mnzprfx+fFk1yXbbxsvPD3BYC91FWk
 qiR2OUcVVspbTJk+mFZzCNe36BngRcTNbuym4aiIss745C7QIVl4L/7squ9i/au36YIU
 aapUXRaUd21wHp+vNlDFQsR9FfLl0d8JtXy+ok8FR+kHWAFuS33EyaQIXsM51PdKagsW
 8Oaw==
X-Gm-Message-State: AOJu0Yw9lsoTx9syBVECWKahoCvLJWRK6nsRt/0LZrWHAmzYiQ/JgsBU
 r2VEcCfHoPprz4vxK4/J14NAst4FDbA=
X-Google-Smtp-Source: AGHT+IGIex7DXGtZ1MlhEqssaXhFXC11PCYvOMlo7c17Tl3uKS5aSfPFxFC5ng6i2TAJOwooxxaCRQ==
X-Received: by 2002:a05:6602:2dc5:b0:7a9:a31e:c05d with SMTP id
 l5-20020a0566022dc500b007a9a31ec05dmr35079773iow.18.1699155595019; 
 Sat, 04 Nov 2023 20:39:55 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 a13-20020a056638004d00b0045ad5ea3e44sm1365523jap.172.2023.11.04.20.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 20:39:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 21:39:53 -0600
Message-Id: <20231105033953.2797111-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699155595; x=1699760395; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4SvDbIgjudMxy4Ed/6qxre11PmlftNFbuUtD8hjXy18=;
 b=ZBqGWICzINpEeOG00uKEHbYGGUOD4XJhb/n5wpi3Ijh7pZC+ikDcKhQDivcjMpMc7+
 BWh5c+po8cCFQbspVNvOcYuQ56ptgmOX2LUaCBySUv5vQKH2RsNukjWAo7QyCEPNLoDF
 Kc8NJvVIz0/yX5LJwmUf1CsP1LgeRH4AxqkOEvPW3Nb6g6ITMdbbxPouKCPM6Nzz5LBj
 xSGvI/UjbNVb5rTxShErHuDSzN5UbhBP+DZ2En1hDjYqu02z1wqCpysPaocL2i/v675T
 db4kWksbUuSy77lNW88UCxdb4aP20Ik6MKX4l6XOUsA6zebbuc8rRaqYVXhx37G8HOzD
 T5oA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZBqGWICz
Subject: [Buildroot] [PATCH 1/1] package/python-cssutils: bump to version
 2.9.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cssutils/python-cssutils.hash | 4 ++--
 package/python-cssutils/python-cssutils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssutils/python-cssutils.hash b/package/python-cssutils/python-cssutils.hash
index cb989131a3..d93135a989 100644
--- a/package/python-cssutils/python-cssutils.hash
+++ b/package/python-cssutils/python-cssutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssutils/json
-md5  b01ea364e79eada181c3ae46d69249af  cssutils-2.6.0.tar.gz
-sha256  f7dcd23c1cec909fdf3630de346e1413b7b2555936dec14ba2ebb9913bf0818e  cssutils-2.6.0.tar.gz
+md5  11707e5da7c40bd98e5b4998489f10e0  cssutils-2.9.0.tar.gz
+sha256  89477b3d17d790e97b9fb4def708767061055795aae6f7c82ae32e967c9be4cd  cssutils-2.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  COPYING.LESSER
diff --git a/package/python-cssutils/python-cssutils.mk b/package/python-cssutils/python-cssutils.mk
index fff9e393f3..be5be30eee 100644
--- a/package/python-cssutils/python-cssutils.mk
+++ b/package/python-cssutils/python-cssutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSUTILS_VERSION = 2.6.0
+PYTHON_CSSUTILS_VERSION = 2.9.0
 PYTHON_CSSUTILS_SOURCE = cssutils-$(PYTHON_CSSUTILS_VERSION).tar.gz
-PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/43/d5/505d96b7456fd334f8b963c05bd9425dacd317e209bb9adf103613339325
+PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/b4/65/a054545c81eb87af898d664043578b8444ea3ded656db3da8f9d9fa21334
 PYTHON_CSSUTILS_LICENSE = LGPL-3.0+
 PYTHON_CSSUTILS_LICENSE_FILES = COPYING.LESSER
 PYTHON_CSSUTILS_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
