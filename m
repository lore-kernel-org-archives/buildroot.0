Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE73CC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 03:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91A51816F5;
	Sun,  5 Nov 2023 03:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91A51816F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yauJfJU90Sbl; Sun,  5 Nov 2023 03:20:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2472815CD;
	Sun,  5 Nov 2023 03:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2472815CD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 44BFA1BF861
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 03:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DBBF815CD
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 03:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DBBF815CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ubun1KXTNgpV for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 03:20:08 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 172D18148A
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 03:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 172D18148A
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-35937f2fadeso13350565ab.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 20:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699154406; x=1699759206;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jPUufHVoA+MDmJahLXrvfjmSTvOl7fbI6aoxYghW8a8=;
 b=VAdT2HX3Pjc2JyUReSYeIabOdG8ZC9g7qRkMsVD/dR5nW6F5LL8E4k3Cs9xaI/pi8B
 9JS8qx7s0tRE5sRLav/NQ6LcnthRnV/jFfruYjq4RoqFzRKBMzpzVQXWIR5OaphXjxvW
 F8P7fH/olPitPVnvUhg+CM5bcYNehNUjai6trFdjmQsp5RTsJU585ozVMtwN4XWZHVL3
 Me/9H/kGAn9c/VhzEofcWl5UQJR7AIQ4FF5pRSNKZk06M6TLSBp2aZFbdtGhOhyjIH73
 cYWpLfxQCBNfDMWnUzEHRoso0bvYeMjleSlXJX4NpYlw6d7+5Zz9Le9y0/Uq0ORk0MjG
 WYhg==
X-Gm-Message-State: AOJu0YxS/5OEkWuv/Oc7DoaKJVpd2233QiTtcy9QYH3q8dEl8KKnMdFL
 2nhUV6HSikeb+EFErNxJaL+MPmfGGPg=
X-Google-Smtp-Source: AGHT+IEmciFztgbneAyuHlPYOc+N7WHmlnRXzKZBJ07qtDpZAKidL7ZPw3RI/uWiMmIQuEEaLIfEHQ==
X-Received: by 2002:a05:6e02:b29:b0:359:68e1:4120 with SMTP id
 e9-20020a056e020b2900b0035968e14120mr6625906ilu.9.1699154406670; 
 Sat, 04 Nov 2023 20:20:06 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 h30-20020a056e021d9e00b00357c06be898sm1607006ila.81.2023.11.04.20.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 20:20:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 21:20:04 -0600
Message-Id: <20231105032004.2779822-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699154406; x=1699759206; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jPUufHVoA+MDmJahLXrvfjmSTvOl7fbI6aoxYghW8a8=;
 b=Z73Rp/SAejVZSWWevZNiRUbzpZTmS80Jt0qEjRIUWAXeFKjy1EVvIdClkKcxPkyyZ3
 JgXRLctXosGU3y1StCPpnUblfPrRS8nb8MkOd59EYDszy0ZJqPIx5LvNIZL1DrR7glvs
 875ALZHLsMbt23H92tP5/PKAMSBK5mx7pP62K6KCQ3eI4K0++4C75KzFwkZJqQO7f7JX
 5WrafAywEIFjADeSfHpKgouv0Urwtr/tLqYQRhb1KlOwLnmaU97ue7kL95NXQuQjn4xq
 hasbkUryVgF85dK7GbFzrzW/7oUyQw9A2hTho3Qem8x096TOk+lOKpwKJn1Pd9MbClwG
 nZKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z73Rp/SA
Subject: [Buildroot] [PATCH 1/1] package/python-construct: bump to version
 2.10.69
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
Cc: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-construct/python-construct.hash | 6 +++---
 package/python-construct/python-construct.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-construct/python-construct.hash b/package/python-construct/python-construct.hash
index f406d6739b..a72a79a5b3 100644
--- a/package/python-construct/python-construct.hash
+++ b/package/python-construct/python-construct.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/project/construct
-md5  e426d3dd1566066e4ef1a03fe474dec0  construct-2.10.68.tar.gz
-sha256  7b2a3fd8e5f597a5aa1d614c3bd516fa065db01704c72a1efaaeec6ef23d8b45  construct-2.10.68.tar.gz
+# md5, sha256 from https://pypi.org/pypi/construct/json
+md5  d881ab2198ec6597e603a2d985307353  construct-2.10.69.tar.gz
+sha256  08573d1573827a6fe6b846756d54270650e221a6cec6a72e06b582cde775599e  construct-2.10.69.tar.gz
 # Locally computed sha256 checksums
 sha256  1552d70acfd0d3fe464ce13d30113ddc6fe4bac21e52212acc98509e3cc1a8f4  LICENSE
diff --git a/package/python-construct/python-construct.mk b/package/python-construct/python-construct.mk
index 3b0bb56106..1e30651129 100644
--- a/package/python-construct/python-construct.mk
+++ b/package/python-construct/python-construct.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CONSTRUCT_VERSION = 2.10.68
+PYTHON_CONSTRUCT_VERSION = 2.10.69
 PYTHON_CONSTRUCT_SOURCE = construct-$(PYTHON_CONSTRUCT_VERSION).tar.gz
-PYTHON_CONSTRUCT_SITE = https://files.pythonhosted.org/packages/e0/b7/a4a032e94bcfdff481f2e6fecd472794d9da09f474a2185ed33b2c7cad64
+PYTHON_CONSTRUCT_SITE = https://files.pythonhosted.org/packages/02/88/e34d7265863f3c96077aea24041b067d4646d77d596d979110eb94758b03
 PYTHON_CONSTRUCT_SETUP_TYPE = setuptools
 PYTHON_CONSTRUCT_LICENSE = MIT
 PYTHON_CONSTRUCT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
