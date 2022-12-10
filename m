Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF9EC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 21:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E996404A1;
	Sat, 10 Dec 2022 21:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E996404A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7hPfvQZXXNOA; Sat, 10 Dec 2022 21:13:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FFAE404B3;
	Sat, 10 Dec 2022 21:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FFAE404B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68E291BF3DF
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4407060AE4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4407060AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w3saH0xBn5pK for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 21:13:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D54860AD1
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D54860AD1
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 21:13:03 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id d123so3889204iof.6
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 13:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ddm709lJ+wML8TG4YIkUnrvOvKUQgGinzVdo8HhZP5k=;
 b=483bxeLV2i5U+uc/pdxDPeNJO3FYNQ/YdrJxzJ5n/ASmkCPyx5/Z9axwPrJePp01by
 uge7z9wWvQb/BDNyELQO6m6aLHvss3cp7oHA5kvJU0ttUsUjkEAHJv2U0aoKt5aW/qh/
 VUAaJg8+uc74lr0iKg+ZUStinGg9HdoapyM7POaLdUceeE/8UzadD4SAP9CcZcFmudcm
 1UhV3ughLwzcjQh01HdTxNZshJ5+o826cRhAvPJx+rgE0oudpRX+hL6i3+xAmLTrTcHg
 wpOHamtZAQ871JqcfENJ9JA6UkfyrE3ZUPl5cfOUQyIilPR/GJC2nHJg2ulE9ewE1Od3
 Fggw==
X-Gm-Message-State: ANoB5pnKWPVwhRIXGFQk4RO6RIBS3TsAtTcCeZ+EeSZ+iqqEvpbsM4vz
 XjOb6zFi4OFUdvDqfHLP7zlWPC+E3ia660wA
X-Google-Smtp-Source: AA0mqf7ImUYXmman4KiIJuKdr96dH7VYzaT8hGeyWuLj2dqTg+efrlS/HJlML2nqGCSD1YTkL4lJKQ==
X-Received: by 2002:a6b:7f43:0:b0:6e2:d7c7:2151 with SMTP id
 m3-20020a6b7f43000000b006e2d7c72151mr5154132ioq.13.1670706782973; 
 Sat, 10 Dec 2022 13:13:02 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 b20-20020a05660214d400b006de16e510b5sm2164678iow.53.2022.12.10.13.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 13:13:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 14:13:01 -0700
Message-Id: <20221210211301.3671632-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ddm709lJ+wML8TG4YIkUnrvOvKUQgGinzVdo8HhZP5k=;
 b=MKV+oFZLJPpb9RrNQ6ThXgIb+uk5eBwW7FzWyHTxQtNLlPGt13DmF56YpH94Nv5A7y
 UNN2K3n+Z/knju7cyUo8XVGnIorx8IJZt7Le4r9dh7XBvesaSPsJAfbNmMoKwU3TZoe2
 wPwdB+wD25IiRxPraDjfwzz3JuJHdl9tAh8eXz1LlLfL/KtCeyZkmZgOj5PjdP21TDSb
 Yj7KJlSL0gsrpBDcDYi7wCUkYU18phPNsw4G3Iin5Oc50wM615tSMukFDw4M5aiFTqor
 2TzwhdTLfahTQFitWKJ5D+msLf/UvgAVFLHjrvFxBI+F2+rz/AKXuOWGrbavBsvi5q1c
 HEQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MKV+oFZL
Subject: [Buildroot] [PATCH 1/1] package/python-yarl: bump to version 1.8.2
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
 package/python-yarl/python-yarl.hash | 4 ++--
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index b4e411cbdf..9725e0058b 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  ff8f2843481cd11c3c674ce4f6fa167b  yarl-1.8.1.tar.gz
-sha256  af887845b8c2e060eb5605ff72b6f2dd2aab7a761379373fd89d314f4752abbf  yarl-1.8.1.tar.gz
+md5  57c82725b9f4895eecee45faf5e61a54  yarl-1.8.2.tar.gz
+sha256  49d43402c6e3013ad0978602bf6bf5328535c48d192304b91b97a3c6790b1562  yarl-1.8.2.tar.gz
 # Locally computed sha256 checksums
 sha256  56d6ac6c8105c0a51304c21db060e361af9a8ea0af9a75c239c28b5d13693838  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 55bfbab53e..77e0c91383 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.8.1
+PYTHON_YARL_VERSION = 1.8.2
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/d6/04/255c68974ec47fa754564c4abba8f61f9ed68b869bbbb854198d6259c4f7
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/c4/1e/1b204050c601d5cd82b45d5c8f439cb6f744a2ce0c0a6f83be0ddf0dc7b2
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
