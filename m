Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DCFC5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 05:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE19C818D4;
	Mon,  9 Jan 2023 05:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE19C818D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XwT4KOB9Snly; Mon,  9 Jan 2023 05:58:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC70281871;
	Mon,  9 Jan 2023 05:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC70281871
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C6C21BF3EF
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C39460B2D
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C39460B2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0-TO68a9qIda for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 05:58:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05BDA60B20
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05BDA60B20
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 05:57:59 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id m15so4452194ilq.2
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 21:57:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U0mde5KGWkTC+p1tkMEF69RcOzF0rs5ty+9BQ+XOH4w=;
 b=doVmXQTXQ4VdYYrs3rLeuxTwp3VoQMKvX3aUCeNROF7AgqKJfMt9K3e6/pQ1e3uo3q
 PF/Am4rV3v/pcygElvttfAthh62uo+bFOmpNyZD9jxiqiVm6Tw3dkUuA/Py/QCPTMR8/
 oTiZfGav2pSNKEB7u7pXn2JeJEfvqc4gSqfXPZbo+Nmxqmuixt1XumD+gSm4uKwnC5wY
 d2ybKSXb3i9WF9gSV07tTOcFCZsR8j/MRRnULnFvEi5cR076DrpL1JBR1B4B5Z/bQIQA
 GX/PUr1zW+/HLM90N7z+XesoRIXnV+KMYzkoX6ScYrbO2i/SYh/25hIsOH4IkhrVPBZr
 GFOQ==
X-Gm-Message-State: AFqh2kr2IybRteg2z5u7nhVExIGI/oFNU69Y4IdrlKQHGryX1l2qpZ7t
 jNMPKIEW9Opyb3UVfiMc4OOcklMSvFb9xwBE
X-Google-Smtp-Source: AMrXdXs4hx5J3wPiCZy+/qCuiBK3BBEZdtua2cw6kdxQkvVvBAXeQDfm/7goUJT6+xA8PYUk3xlqXQ==
X-Received: by 2002:a92:cc92:0:b0:2ff:f702:e446 with SMTP id
 x18-20020a92cc92000000b002fff702e446mr39510804ilo.13.1673243878952; 
 Sun, 08 Jan 2023 21:57:58 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 g20-20020a92c7d4000000b0030c661606eesm2549296ilk.63.2023.01.08.21.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:57:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 22:57:57 -0700
Message-Id: <20230109055757.2777954-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U0mde5KGWkTC+p1tkMEF69RcOzF0rs5ty+9BQ+XOH4w=;
 b=j5qzwGn/GG3XEUwIxEPeCpZhSwkhjVbKp820eWOKcO3iAHvF+TTqbXOp9KRJyHz8v8
 aF7H771prqhdYmGfB8hl4uk9BKvoPWqpM+t1jpfLVaSqwARB5cq78d7kBaK6DEfNnTIz
 rCPLkd92pKML5qZbHe75OCLde8b9rFcNUkaEFSuj3D8TXVoyKydbHH/VrqwltDAdYGMX
 SU/bgxrQqITq96D0C0LqhFXP6Z7tnpRTyTQns17Haajhqig9Dt6plm5szFkxIgtrMUMu
 jx8i6eucz+C9v5Efz1cepQItoAg++3GeFzYjZPl3ka6XR7f+KsmPX6mkYvBi8efFyh5v
 287w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j5qzwGn/
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-scm: bump to
 version 7.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required host-python-tomli dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools-scm/python-setuptools-scm.hash | 4 ++--
 package/python-setuptools-scm/python-setuptools-scm.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index 8ef125840a..8cfe07d1d9 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
-md5  0df4e7fd923e4983cd65786efaa0e0d0  setuptools_scm-7.0.5.tar.gz
-sha256  031e13af771d6f892b941adb6ea04545bbf91ebc5ce68c78aaf3fff6e1fb4844  setuptools_scm-7.0.5.tar.gz
+md5  158dc741637fb4fa4b955c62bd2c08be  setuptools_scm-7.1.0.tar.gz
+sha256  6c508345a771aad7d56ebff0e70628bf2b0ec7573762be9960214730de278f27  setuptools_scm-7.1.0.tar.gz
 # sha256 locally computed
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index 87d5dd290d..5a35c35a1f 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,16 +4,15 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 7.0.5
+PYTHON_SETUPTOOLS_SCM_VERSION = 7.1.0
 PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/d0/43/f038b5009f93bcd77b1b8da9e6d424b739ab17aec9726f3a99eba23d53ca
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/98/12/2c1e579bb968759fc512391473340d0661b1a8c96a59fb7c65b02eec1321
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
 
 HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = \
 	host-python-packaging \
-	host-python-tomli \
 	host-python-typing-extensions
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
