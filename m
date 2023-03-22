Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19FFC6FD20
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 02:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78864408C1;
	Wed, 22 Mar 2023 02:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78864408C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJlORx45yRLR; Wed, 22 Mar 2023 02:00:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76764408EB;
	Wed, 22 Mar 2023 02:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76764408EB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88FDF1BF337
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 02:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70C4540452
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 02:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70C4540452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozcb5N-BS-Qa for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 02:00:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C056401C9
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C056401C9
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 02:00:45 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id h11so9157037ild.11
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 19:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679450444;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HT8Fa7ln6eKXYZ58xMLdI87jQ+Kuw1ljqMIYdcfemMA=;
 b=VbaSl7DgGMpu4HmFxCspuMepZD1g6xluD1kpr4yQzBfSSOUO7+1ivUCokfHcwcA41/
 9sPpZveGQKllTcpsbnbcX7yeOEc049SUKByNEj2cI9BD7Wx0mnXpzjIcRMpcNqLp69rT
 sUyDhwjPhfHiEaBKTwbdBnZVAEBSiyg6k85ZmeOd/mLp5DgdvbMLVhuY7M9CDsnPmquv
 7NfkNxt+5dX/U1nNveO45F87GRnXsC61YIM+RLcfS1rHsqofqWY5naGA6hziDG2KaHF+
 nPLBU3zi4ftNE8/rQxEp2vbAOzcctGASVoMaxMYzFozKjYJfDb4CqmWZ7svFF8UldTBE
 Mj/g==
X-Gm-Message-State: AO0yUKXfvQ0nv1OlnIChNx6iW4jW+76rJ4+SjtFNlF72UWAKOc8TiU0q
 JmFki78WaQDJWMsbTE0yqkYgXvv+OzYKdw==
X-Google-Smtp-Source: AK7set9zLSneCMDRNlhsweYhwo7bXVudi2Irt3tvloYBQFVnWfqpvbrfm3Vc/fUhF8tM2KfvgWfOSA==
X-Received: by 2002:a92:909:0:b0:325:a6a2:8c18 with SMTP id
 y9-20020a920909000000b00325a6a28c18mr2955579ilg.21.1679450444477; 
 Tue, 21 Mar 2023 19:00:44 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 d16-20020a056e020bf000b00325a9585cbbsm997140ilu.20.2023.03.21.19.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 19:00:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 20:00:32 -0600
Message-Id: <20230322020032.115897-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679450444;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HT8Fa7ln6eKXYZ58xMLdI87jQ+Kuw1ljqMIYdcfemMA=;
 b=ZCxkUjWigCt2B1iExpUuVQFJ55eG+fYLkYNlAQr4P31rlvn4wY6/90d0wo1JqUBLmN
 o6+egST/A8PzrV5uI06jBZPzSf96PP0Enrqr9OBUBlu+Yq5mlZtRMTNLRyu76BsFGmJf
 56cQb0pw1GA3oXM09Abu4je7akeocqfb7sSiUB36C3cTSMlzkrI2ygw/waQNe/WZxT4/
 Wr82oPA8Q3nUhCjSVXwh5rwSPIV6F75aXGX5S7+gAo/LNSnFVZ0BSe/STjJqhRYJwnie
 HpkTK7WDFNkuclq2baTCUyEbg7pUhV61urQPHZ7OVY4wbUZMdROstN3AEDM6BcIdXMWo
 +ALw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZCxkUjWi
Subject: [Buildroot] [PATCH 1/1] package/python-bottle: bump to version
 0.12.25
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
 package/python-bottle/python-bottle.hash | 4 ++--
 package/python-bottle/python-bottle.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bottle/python-bottle.hash b/package/python-bottle/python-bottle.hash
index 58bc52e3cb..48a576aaec 100644
--- a/package/python-bottle/python-bottle.hash
+++ b/package/python-bottle/python-bottle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bottle/json
-md5  d07df795cd4baa596ee803e964ba77fd  bottle-0.12.23.tar.gz
-sha256  683de3aa399fb26e87b274dbcf70b1a651385d459131716387abdc3792e04167  bottle-0.12.23.tar.gz
+md5  7d79d6131ecd524530f4e919bc60f444  bottle-0.12.25.tar.gz
+sha256  e1a9c94970ae6d710b3fb4526294dfeb86f2cb4a81eff3a4b98dc40fb0e5e021  bottle-0.12.25.tar.gz
 # Locally computed sha256 checksums
 sha256  d0e7211f1c3c1a1c56f39d18bcb07f27f480c8a9552617756dda3a335933b8a6  LICENSE
diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index e1691972c3..b35f726f95 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTTLE_VERSION = 0.12.23
+PYTHON_BOTTLE_VERSION = 0.12.25
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
-PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/7c/58/75f3765b0a3f86ef0b6e0b23d0503920936752ca6e0fc27efce7403b01bd
+PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/fd/04/1c09ab851a52fe6bc063fd0df758504edede5cc741bd2e807bf434a09215
 PYTHON_BOTTLE_LICENSE = MIT
 PYTHON_BOTTLE_LICENSE_FILES = LICENSE
 PYTHON_BOTTLE_CPE_ID_VENDOR = bottlepy
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
