Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FACC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 08:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD20A60AA7;
	Mon, 22 Aug 2022 08:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD20A60AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZA2ZerAbo5I; Mon, 22 Aug 2022 08:53:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF63C60671;
	Mon, 22 Aug 2022 08:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF63C60671
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CEEDB1BF321
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 08:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8A6C408BC
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 08:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8A6C408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UUIF34plNSL4 for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 08:53:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F6B1408B7
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F6B1408B7
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 08:53:46 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-11c896b879bso12083031fac.3
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 01:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=mMqZw8VuwuwB5bPx92IvaejEAr3/622Xum2XgHMF1R8=;
 b=f9i4Cm/ZxHGvGYbuWr/Ex6ftwGdBPjjDPbA0domUwppq8K8a+1LtMKJKC1C7MXiyUW
 XJGR3gZOOwztCRaJf2IxHQ9XZQSC6EVB5R+exhuujVv2SOcGHWg8Nh45OeQ+0TTPzFpu
 RCWEersMLgeQ4EQ1MCigNFgfWykq87EgGRXer4UKtU0kVoXTz/jQwS+PQJ+I9o/qTRdh
 ijI2RO9pCcF3LKWbnL20f3JwK33g9ZHY6RH78enyNBYi+PzmcmD5J5jMeaxYVgt9ov3b
 1bq+NX+HpEQ4UOo12f4uw0mjB/26x7cLprGWYmUNlA1Cze87V31hsSWdS6J4/hOLdOEt
 QKow==
X-Gm-Message-State: ACgBeo1Ul1Vp9VRR/rMZAh4roPo2nRsXdwstY6ktLaFxrATTzQVJlhIz
 bg3+CfqmTbI6Vyarmx7DkfHk4+AKiRY=
X-Google-Smtp-Source: AA6agR4T13loMvTqESCWuuvrs7S682hPkCIl1AZDTo8AyfLH0z+7+MqJrrDZtg3zxV/vnE2CjSeZyQ==
X-Received: by 2002:a05:6870:9706:b0:11c:5b1b:385e with SMTP id
 n6-20020a056870970600b0011c5b1b385emr8949903oaq.110.1661158424717; 
 Mon, 22 Aug 2022 01:53:44 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 j4-20020a4a8884000000b00441b98453d8sm2432490ooa.8.2022.08.22.01.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 01:53:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 02:53:42 -0600
Message-Id: <20220822085342.1005576-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=mMqZw8VuwuwB5bPx92IvaejEAr3/622Xum2XgHMF1R8=;
 b=RBeE+kW1L/jY5465GW5QCJmmv8BmyvT6vDJZZlxv9+myfZOAkOvWnKw9rD6V3YaPoR
 Q4vEjE6iezl08MNhv0Ja22WwXoJ75tDw5UFt4w3jjpSYJcAlVo6KKzOzXdQLjJC3igYz
 n/e6xur8d884VrloC3lC93VX+HYXPePuTey67oYIvaV9yUF6xpIsKuCVv9VUBKuIsS3p
 8d9vyN8ca7GvjPA260LGvOuOxQQUMhE+dbIsI/rN0UxTvG9o41PRJzA5KSQJIBmwSzLc
 EWJd2YWtcmOOEnhGCBdy1W7Q7QhzH1DjaU82I4JXORerrlsX5KMtTHsEi89CMQFoA6VO
 xIig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RBeE+kW1
Subject: [Buildroot] [PATCH 1/1] package/python-yarl: bump to version 1.8.1
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
index bf971e9a9a..b4e411cbdf 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  acd3eb25a9c46b10a699a3bee5fb9777  yarl-1.7.2.tar.gz
-sha256  45399b46d60c253327a460e99856752009fcee5f5d3c80b2f7c0cae1c38d56dd  yarl-1.7.2.tar.gz
+md5  ff8f2843481cd11c3c674ce4f6fa167b  yarl-1.8.1.tar.gz
+sha256  af887845b8c2e060eb5605ff72b6f2dd2aab7a761379373fd89d314f4752abbf  yarl-1.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  56d6ac6c8105c0a51304c21db060e361af9a8ea0af9a75c239c28b5d13693838  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 175aaa7a35..55bfbab53e 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.7.2
+PYTHON_YARL_VERSION = 1.8.1
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/f6/da/46d1b3d69a9a0835dabf9d59c7eb0f1600599edd421a4c5a15ab09f527e0
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/d6/04/255c68974ec47fa754564c4abba8f61f9ed68b869bbbb854198d6259c4f7
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
