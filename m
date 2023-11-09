Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B34C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 00:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A15F40491;
	Thu,  9 Nov 2023 00:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A15F40491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YG_ljhoR49w2; Thu,  9 Nov 2023 00:05:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9A2940496;
	Thu,  9 Nov 2023 00:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9A2940496
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98F411BF4E2
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 00:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 722E9814B6
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 00:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 722E9814B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o36Ed6VVDfRT for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 00:05:35 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 735EA81499
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 00:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 735EA81499
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7a692658181so10078339f.1
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 16:05:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699488333; x=1700093133;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m5sb/CDCD0sVFhjGGEbv4ZMmi4dMv+yISmicGkrK1T4=;
 b=P5byBZ8x/c1qVL6C7FZwC12ONm2csgyGNevqzjaXC4y6khrYKuvPih5jYTHZwt/aKk
 pOOvyS5cFjRgC024uBGrOWJVMxFkAhi6QzTZyfWf0oUgtNDlKQcUnueZM4FRPOE5qbhV
 A8DvPCdL4I/W0Q42CljYY/nxw5Tu82zGlbcsSOtYql826En4KnMhjqUMhRzyMXIuToeM
 ncEvUK4X5H/TVL+Wn54G6zp3fdIRlo8/eAXmCYMSerEuu2fdumnxzVPqjWrU2cJ0VXte
 CnObOwuTu9KZx1dQ2pqUgTz+K/c8yetFXQnNn/xv4Nq67AZdS+xzQORLegAfVkLnLA5G
 km2A==
X-Gm-Message-State: AOJu0Yww3yOuBbaqZ6MTWYfI5NOkl2H5Gn97Jthn+kZ0A0KGYqUYXuED
 bHXKNXKPqwtx+zo1MH/6P5paYtkeiNk=
X-Google-Smtp-Source: AGHT+IHAVshAI2clil9v7qWl4PAV/DsWD5sICZgz+PYEXceXPZwGLI0UdMRN/aX9E8LaeRJco7ZhdQ==
X-Received: by 2002:a05:6602:1a95:b0:7ac:cb6b:6178 with SMTP id
 bn21-20020a0566021a9500b007accb6b6178mr189719iob.1.1699488333611; 
 Wed, 08 Nov 2023 16:05:33 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 x14-20020a056638010e00b0045458b7b4fcsm3512865jao.171.2023.11.08.16.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 16:05:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Nov 2023 17:05:31 -0700
Message-Id: <20231109000531.3665139-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699488333; x=1700093133; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m5sb/CDCD0sVFhjGGEbv4ZMmi4dMv+yISmicGkrK1T4=;
 b=kf+ot2gtjpH3j2wwHoKFWl2/2PaRuvlnLz48s/AA+7G2QuRFlWTgEc4nxdwD9oalR3
 IVAJH6BrsTG47jUrD8jY20C0T1/u1D00FYwEMlQnPapfU7HKU5aLXE06hu/4vxVAUNAU
 sWf9nFJlp2fDEnv+aefA6hdak1NyiN2mvrqWQ9Q6jGOx9Wwk9SkPbNPSjrxg7+KGyPvJ
 jF6yw9OgYvImz7OT1FcKaDHNA+MIYm+J9A4CtCk97yQIlH8PWdBLH54gVT7rJNoeQPJ2
 L2K566oCn1n7Npo9LV74TVw3zkKZDCFNW0CiEsvWnIkCfz/FXSaxWFQIWkpfb6l0qMQz
 oaGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kf+ot2gt
Subject: [Buildroot] [PATCH 1/1] package/python-mypy-extensions: bump to
 version 1.0.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mypy-extensions/python-mypy-extensions.hash | 4 ++--
 package/python-mypy-extensions/python-mypy-extensions.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mypy-extensions/python-mypy-extensions.hash b/package/python-mypy-extensions/python-mypy-extensions.hash
index ffe850d7bd..5e3763bd63 100644
--- a/package/python-mypy-extensions/python-mypy-extensions.hash
+++ b/package/python-mypy-extensions/python-mypy-extensions.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mypy_extensions/json
-md5  4163ff73d0db8631c0a78bb55b551c84  mypy_extensions-0.4.3.tar.gz
-sha256  2d82818f5bb3e369420cb3c4060a7970edba416647068eb4c5343488a6c604a8  mypy_extensions-0.4.3.tar.gz
+md5  5b77a3cafc7e9749a0157533c0915b5d  mypy_extensions-1.0.0.tar.gz
+sha256  75dbf8955dc00442a438fc4d0666508a9a97b6bd41aa2f0ffe9d2f2725af0782  mypy_extensions-1.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a50450da1d53cd777b80ced77c58ff96abe0ccd879706bd142c3ec20e245f0b4  LICENSE
diff --git a/package/python-mypy-extensions/python-mypy-extensions.mk b/package/python-mypy-extensions/python-mypy-extensions.mk
index 26dc329a37..494a03ac2c 100644
--- a/package/python-mypy-extensions/python-mypy-extensions.mk
+++ b/package/python-mypy-extensions/python-mypy-extensions.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MYPY_EXTENSIONS_VERSION = 0.4.3
+PYTHON_MYPY_EXTENSIONS_VERSION = 1.0.0
 PYTHON_MYPY_EXTENSIONS_SOURCE = mypy_extensions-$(PYTHON_MYPY_EXTENSIONS_VERSION).tar.gz
-PYTHON_MYPY_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/63/60/0582ce2eaced55f65a4406fc97beba256de4b7a95a0034c6576458c6519f
+PYTHON_MYPY_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/98/a4/1ab47638b92648243faf97a5aeb6ea83059cc3624972ab6b8d2316078d3f
 PYTHON_MYPY_EXTENSIONS_SETUP_TYPE = setuptools
 PYTHON_MYPY_EXTENSIONS_LICENSE = MIT
 PYTHON_MYPY_EXTENSIONS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
