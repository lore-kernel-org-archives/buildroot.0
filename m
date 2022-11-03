Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68FDC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 19:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AAC881F75;
	Thu,  3 Nov 2022 19:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AAC881F75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k3ihEHHk_Zyb; Thu,  3 Nov 2022 19:24:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A95B81F72;
	Thu,  3 Nov 2022 19:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A95B81F72
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3B351BF3C0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF52C404ED
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF52C404ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ORN8AFgnQ0Np for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 19:24:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E105A404C9
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E105A404C9
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 19:24:10 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id x16so1584349ilm.5
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 12:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=whaiGkf7ibCzJ6X5WXCZiUcL5VwrCqSZ3Pl7Uf7R8MA=;
 b=qkHNGT1D72coen7wU4H0G9T1fM4JJz6o3ef7dRMZ00iDv4xudL11PlIaCuYSTHOu29
 ug9K8IgI+KeEsPqMNS+/jHsPiK96r/HEATYqf4fHrU5NhClbo+11xdW7af6BP8/ASa0H
 szfO1+FcCKoMYGL09zuYNEFb7YAnLc5iSLWHRyipMCAfypKA/XJTrEuQtelJpimTrYFD
 s70lcfpsGdMbG+HxRX2q3/SAvoyzFyDXWKZ3iqhfMsiwBshMlNWf8J2TdnEpvaD4i3N1
 /VMScgW7iSAQ3BANGwv6iC8VgowyDkA00jkQHVlyCk+8qBiYhIs8PTlDLc/yWjFrEANs
 Mhfg==
X-Gm-Message-State: ACrzQf3j0TRbjX4eK7AwzqMRHNr1ktaS1WamC8ZlF+CN7yGP7lDWfDKr
 WqXTScg1KPhFNWiPLEku0Bx4drvY5arCnH0f
X-Google-Smtp-Source: AMsMyM4Os28JZRPCfsqCshUOI+TcC1D0IQxt+tfd2+MBYWfwGAtvMfygHkuwHczYj9WZV0lXhXZ8ZA==
X-Received: by 2002:a92:730c:0:b0:2f5:7dd7:45f7 with SMTP id
 o12-20020a92730c000000b002f57dd745f7mr19017819ilc.12.1667503449748; 
 Thu, 03 Nov 2022 12:24:09 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 o8-20020a92d388000000b002fff117027dsm605541ilo.13.2022.11.03.12.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:24:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 13:24:07 -0600
Message-Id: <20221103192407.338034-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=whaiGkf7ibCzJ6X5WXCZiUcL5VwrCqSZ3Pl7Uf7R8MA=;
 b=mkXX72tZHp3yMyv8bPXWV2zqDUdD1ubQ+oKRFNZseSlmrMoSzc6HwBnykiQBm5Bvbu
 IxiU0+pxg5BdoaNxmw8CQXcG0VEjY2ByWsy5xAoEGPBk5i35EsCK1Dc3FRXmzZZvOyyq
 qq36vOkJ2dg4Z0VEo+4MR/NeQg/buolGuVyqfRdMRwNTiK1sWVPVKujRWqAgrXkjjkP/
 ohXbeM783rYtNr/VhDab5/o13rQPfz+OJGTrBKPFWcbtqKEN/Osu4wXhcNDggws+7M1F
 hXyOLzKEIaLXQP54NQ5/2Ge4xItvKbxSZMEWe/PTMgxzj6Vn/jJWiLY7xCleMSrzOaKp
 WEww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mkXX72tZ
Subject: [Buildroot] [PATCH 1/1] package/python-simplesqlite: bump to
 version 1.3.0
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

Verified license remains MIT after hash change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-simplesqlite/python-simplesqlite.hash | 6 +++---
 package/python-simplesqlite/python-simplesqlite.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-simplesqlite/python-simplesqlite.hash b/package/python-simplesqlite/python-simplesqlite.hash
index 404670aef3..06edbfab3d 100644
--- a/package/python-simplesqlite/python-simplesqlite.hash
+++ b/package/python-simplesqlite/python-simplesqlite.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplesqlite/json
-md5  f1d4f2ec14e2c782a62e451587477598  SimpleSQLite-0.45.2.tar.gz
-sha256  0b19c99c36b63173a715649f94a2fc3aee8deb9b70c683d584bca85e5930244b  SimpleSQLite-0.45.2.tar.gz
+md5  11f2ef73243fb0d677ed00d22f1441b2  SimpleSQLite-1.3.0.tar.gz
+sha256  f7e862bec5982059e665cc73b6fdb4c8340a1f565ba3497387c3c48f10d43bf8  SimpleSQLite-1.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  98799b7c99b561c5ffa3ac86600e501f761afa8e72af8a2515026445fe134105  LICENSE
+sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-simplesqlite/python-simplesqlite.mk b/package/python-simplesqlite/python-simplesqlite.mk
index 88ffcd4d45..ea60cefc16 100644
--- a/package/python-simplesqlite/python-simplesqlite.mk
+++ b/package/python-simplesqlite/python-simplesqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLESQLITE_VERSION = 0.45.2
+PYTHON_SIMPLESQLITE_VERSION = 1.3.0
 PYTHON_SIMPLESQLITE_SOURCE = SimpleSQLite-$(PYTHON_SIMPLESQLITE_VERSION).tar.gz
-PYTHON_SIMPLESQLITE_SITE = https://files.pythonhosted.org/packages/b3/d1/bc3668ed7d90ee70d556124b8b5b3329505d72b5290bb393626f1afe714d
+PYTHON_SIMPLESQLITE_SITE = https://files.pythonhosted.org/packages/a0/2c/39a9e7dc4af46d101f48753086c686982790ecc2bdf5e9fa88f85f027e7a
 PYTHON_SIMPLESQLITE_SETUP_TYPE = setuptools
 PYTHON_SIMPLESQLITE_LICENSE = MIT
 PYTHON_SIMPLESQLITE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
