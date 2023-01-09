Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D07C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 02:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 647BF8176F;
	Mon,  9 Jan 2023 02:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 647BF8176F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKzt-bJXvjXe; Mon,  9 Jan 2023 02:59:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD86A81771;
	Mon,  9 Jan 2023 02:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD86A81771
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E4A11BF21A
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 02:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09A5060A7E
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 02:59:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09A5060A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MJ6xHi0pyZIo for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 02:59:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17C5460A70
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17C5460A70
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 02:59:27 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id c20so4309618ilj.10
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 18:59:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Db53FasKRB9Mya78jyxkRJQnX4UTtq4oZglApmC26M=;
 b=h69VDhlzSRl6laeI7feea0Vo59IifWYTLeup5Zq8KEWCWgNvoxuVqfGsNXLGRvCWER
 rylHcE7BorU0IXYlYAncmg4XlCdNpmkp0n+P8hbVN4AjHiTmmV/dtRvkprdadTJKX2pZ
 YtdAD/7fMgsOv8oAcLCc02OxPG+nT6RTwMvYYvUbzqAZ9PqK+BYDuljOoSf12Df8+HwI
 fQW24vcdePsTO4qb55AYvYJl5CpEM+Gz89DQEferiw3eT93A8EVkVJsbZ35/0X8uOutv
 sa65l36TzC5n6s3TUEezzKCTHVwGqueKXcfrq5FDER0u+WS4JY85x0hDV4RC2hnDwbQ2
 F7fQ==
X-Gm-Message-State: AFqh2kpPwr9WvkpPJgZ+7f7qBz6Yp27anORJfPvOqBcIy4u8dTF6rRoo
 zkGsLhtmROM6TqC8y9YOGYnhGd9iJyylUA==
X-Google-Smtp-Source: AMrXdXt1KcCml8X6KUaINRhGHu8Qp1qUR7bwmSzpVh5HgkINscWjJ6Qum5k1+Oujotkuz3m6brN+GA==
X-Received: by 2002:a92:4a07:0:b0:303:7b0e:fdb7 with SMTP id
 m7-20020a924a07000000b003037b0efdb7mr42595991ilf.0.1673233165857; 
 Sun, 08 Jan 2023 18:59:25 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056638112e00b0038a346207cdsm2431161jar.84.2023.01.08.18.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 18:59:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 19:59:23 -0700
Message-Id: <20230109025923.1971154-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+Db53FasKRB9Mya78jyxkRJQnX4UTtq4oZglApmC26M=;
 b=orwCZTP5UrYL+TYOXvY0JExDh0c0ld/VIB1lCkO/nHKwXV+maydji49lvJeWho2HIy
 lKnHPaAVFDLkLOTJkOlmonEB+Uj2Fb8TRciezTIti0fFwOd7YdWPzwf0kETR9VTZI655
 TpE065PlN84pGHeZ2R9Mh4nbBbrF77sA9bDM/gp5eY1IAJqdv9d65eUs9PfQLSvsF7SI
 Rf4e5FFgDKDkZTpEzRy+79vTSF8eN3vPfXw83WayjXBv/bUdvEXwOgNlAGHW/ubYhEc3
 9KoudE+CwkSQ4ZuEaftChIHE7Oodj5rNKTnCG6dQ1nUDab6RjsvcrnXbLYrMyZZshn18
 LAsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=orwCZTP5
Subject: [Buildroot] [PATCH 1/1] package/python-asgiref: bump to version
 3.6.0
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
 package/python-asgiref/python-asgiref.hash | 4 ++--
 package/python-asgiref/python-asgiref.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asgiref/python-asgiref.hash b/package/python-asgiref/python-asgiref.hash
index fec707ce02..26d8e78e47 100644
--- a/package/python-asgiref/python-asgiref.hash
+++ b/package/python-asgiref/python-asgiref.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asgiref/json
-md5  b3cf42bb1f9191196f9ed1678f9dc106  asgiref-3.5.2.tar.gz
-sha256  4a29362a6acebe09bf1d6640db38c1dc3d9217c68e6f9f6204d72667fc19a424  asgiref-3.5.2.tar.gz
+md5  562ecd896dcbf5576db8c29cb1881ca4  asgiref-3.6.0.tar.gz
+sha256  9567dfe7bd8d3c8c892227827c41cce860b368104c3431da67a0c5a65a949506  asgiref-3.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-asgiref/python-asgiref.mk b/package/python-asgiref/python-asgiref.mk
index afc083fb1f..bfd90f10e8 100644
--- a/package/python-asgiref/python-asgiref.mk
+++ b/package/python-asgiref/python-asgiref.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASGIREF_VERSION = 3.5.2
+PYTHON_ASGIREF_VERSION = 3.6.0
 PYTHON_ASGIREF_SOURCE = asgiref-$(PYTHON_ASGIREF_VERSION).tar.gz
-PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/1f/35/e7d59b92ceffb1dc62c65156278de378670b46ab2364a3ea7216fe194ba3
+PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/78/2d/797c0537426266d6c9377a2ed6a4ac61e50c2d5b1ab4da101a4b9bfe26e2
 PYTHON_ASGIREF_SETUP_TYPE = setuptools
 PYTHON_ASGIREF_LICENSE = BSD-3-Clause
 PYTHON_ASGIREF_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
