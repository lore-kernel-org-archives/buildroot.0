Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C942E748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 09:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1292E820CF;
	Sun,  1 Oct 2023 09:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1292E820CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xKcX-qU87s0D; Sun,  1 Oct 2023 09:18:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59095820A2;
	Sun,  1 Oct 2023 09:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59095820A2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12BD41BF5AA
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 09:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECE49820A2
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 09:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECE49820A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JhZAxcAVZ_sM for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 09:18:11 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB6AD8208A
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 09:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB6AD8208A
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-79f96f83270so505615339f.1
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 02:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696151890; x=1696756690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IDP9zuGBlOk+OMqOci1Tf61AtdF8ohikZaLZlZtev1A=;
 b=N+NBk0iCK4ADp8Yeg4TP4wJBU/K22H+4so97zhUuhaSZpHjjxGVp3iYkH2c79H/1lM
 FM227Fi8hIzFVkd29gRqobHOZO9fSKw++1azdcSi5k4PvGpcCvLWpxUQLF27zQy3ku2C
 I0jc/jdogqnWB92wDtKyTvQMSj1LgUC0NvkR1H/0XCB6KIJJ7kUq95As7g8q0NI4M/DC
 33l0ZiuY5mryRpJmMppVxe+GXnX5SX8gMj0wmOCo7TlgafaGa0imLJHJCZmxU4IGJYtW
 KLWEQcfVplGvsTh2XuNgtG8HFzOVge4me06o101E2/z51+NC7b7Al3/SrPtPCfrm2TGw
 iGfw==
X-Gm-Message-State: AOJu0Yyi6DCCCEKreQSOTg4JtJfMcZUs7iB1pgz0yFw5IbDU9KYE7Jww
 s2Zd3FxjkSbcRLuE790HHf6aXwM2xc6cMw==
X-Google-Smtp-Source: AGHT+IF9Xbn+A7PfdG/OeF89dXgWI1hAy4IQAy6GTuncPd2DQIGc9uPt6D7wtjgBA93EeyXtxOtigg==
X-Received: by 2002:a05:6e02:1446:b0:34f:41ba:7c87 with SMTP id
 p6-20020a056e02144600b0034f41ba7c87mr11702282ilo.4.1696151890351; 
 Sun, 01 Oct 2023 02:18:10 -0700 (PDT)
Received: from james-x399.localdomain (71-33-152-19.hlrn.qwest.net.
 [71.33.152.19]) by smtp.gmail.com with ESMTPSA id
 v8-20020a927a08000000b0034f3d5e171dsm5593552ilc.9.2023.10.01.02.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 02:18:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 03:18:02 -0600
Message-Id: <20231001091802.1771968-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696151890; x=1696756690; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IDP9zuGBlOk+OMqOci1Tf61AtdF8ohikZaLZlZtev1A=;
 b=fKRJXJz/yVDBGIINQEfotod1gIlLcefW89+9+dg5Bna3d/vY2s4RwASdr50rnyn6dM
 nS5dOUfUv2lQvHmiLTZ3OTm5fzfX1/3GX5DVsdPNo3EReuR3mXZHRD5McQoflGaudMIr
 TtbtcMQ3KNTQJXjkJzWLQQ6ckNwBsI0mPF5hWIbkHwzXQEEpnsL6MMvmEt7mgmNaYXyG
 vtEy4N8lXxTZhjZEGi9reH/unrNcyM49nJD59XfbSHSDeY/RK+xP1LJPfFdF3KCZrz7z
 P0gQk7AxQVC9HJVlFmOjSoFKDgOUkyjpLvmWQbySyylBDIKRIQ/5A2A60d+lo6DMm1rz
 W0sQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fKRJXJz/
Subject: [Buildroot] [PATCH 1/1] package/python-pygame: switch from
 distutils to setuptools
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Julien Boibessot <julien.boibessot@armadeus.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

distutils will be dropped with python 3.12.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pygame/python-pygame.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
index 600dd9e743..84fd6df4e2 100644
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -10,7 +10,7 @@ PYTHON_PYGAME_VERSION = d61ea8eabd56
 PYTHON_PYGAME_SOURCE = pygame-$(PYTHON_PYGAME_VERSION).tar.gz
 PYTHON_PYGAME_SITE = https://bitbucket.org/pygame/pygame
 PYTHON_PYGAME_SITE_METHOD = hg
-PYTHON_PYGAME_SETUP_TYPE = distutils
+PYTHON_PYGAME_SETUP_TYPE = setuptools
 PYTHON_PYGAME_LICENSE = LGPL-2.1+
 PYTHON_PYGAME_LICENSE_FILES = LGPL
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
