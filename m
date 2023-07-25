Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835F7C001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BD28418AA;
	Tue, 25 Jul 2023 13:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BD28418AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wNW7ypqa4alO; Tue, 25 Jul 2023 13:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0B9041827;
	Tue, 25 Jul 2023 13:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0B9041827
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49AC81BF84C
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22BD560B3B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22BD560B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a3fXe0B7wzev for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:35:06 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C555360B2D
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C555360B2D
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-785cbc5bfd2so279916139f.2
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690292105; x=1690896905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=36NCRulma8P8Qo8bNGsdrumdAVZTqB+Y8kDQDzON34I=;
 b=UX2q9kvLxpaVjMobP58yXgdjSUmTpcbgPWZNIZ4/3dHLLmv60dqKx/9hjEYmI8mWCc
 Yo+N9qERKRP3+Zh4HmRzePIJhoUW0j9fKxNNJEkZq+YRwHFflsHp+kAzXmNjFF0iTdoB
 pXZ7iwB4hF+Oyei3pqDQlf0Rs90sBDUC+W6jr0IM0H2DMWDTEz/kAEaewj+j7epnDjVN
 dpf6RgOiALS/OS4zphEpgIyp7EkzQHZY45me4UIYnv+DnMQEQW+faZSv2waQ3vWSFpub
 4EIHzRjHw2BpS8yPKpsU2qkQRGy4YK5Lbdru9qMCfrunc/N6Mi+WXOiW7wNu8fErajrX
 V81g==
X-Gm-Message-State: ABy/qLbtFMlJm2hVklPImDuOt4wOpatPADabUh80Cp1/LgDyyaMjRgxF
 wegNeQ/FM97JlB8TDl4Io9PGPKzRnC0=
X-Google-Smtp-Source: APBJJlE7DBx5dcXw+IDoQeuAVLvHrUrXDnZVV2Zk6aebny+t/ZILwNAt6Lioh3VKkzN9tAkqhm5xFg==
X-Received: by 2002:a05:6602:22ca:b0:786:285f:a9b2 with SMTP id
 e10-20020a05660222ca00b00786285fa9b2mr2760258ioe.12.1690292105421; 
 Tue, 25 Jul 2023 06:35:05 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 s28-20020a02cc9c000000b0042bb1c9b59csm3633315jap.126.2023.07.25.06.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:35:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 07:35:03 -0600
Message-Id: <20230725133503.274031-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690292105; x=1690896905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=36NCRulma8P8Qo8bNGsdrumdAVZTqB+Y8kDQDzON34I=;
 b=caZqwvAL62FAKIX3LuUAu70uMEaNygz/awmvqUe6ZrKITShIKF1YDXLUVCH2IqKLqy
 oRWb0eVGouLnd+eO+9TEnHvwkwlz287xvQB7XObwMjuEQVaggypXrnKUMwBdgdTtn4B6
 Re1V9tCEVUJHfyZnK8LOOj5f5s4Q0PWzJnqgACiPYWDDAaUMatD5ddU7qAUgv+ciqHlU
 DFhw2VqLRShSDeDo32OQGGzjWxm0v4qucLQnSdMWJNKvXbdeiJQ2ukpqt8SgqKQS8LEf
 fkK+1rWL4UKRoeikZTS0kKJzFMBnCqfnDTDAZ2e74WtU/3h8vee/ZGqomhqWWEEXK1WJ
 UU5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=caZqwvAL
Subject: [Buildroot] [PATCH 1/1] package/python-attr: bump to version 23.1.0
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

Migrate from setuptools to hatchling pep517 build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-attrs/python-attrs.hash |  4 ++--
 package/python-attrs/python-attrs.mk   | 10 +++++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
index 66b2082cff..0e94c7cef4 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/attrs/json
-md5  eff16b3bbd0d9b72e118cca83a19d380  attrs-22.2.0.tar.gz
-sha256  c9227bfc2f01993c03f68db37d1d15c9690188323c067c641f1a35ca58185f99  attrs-22.2.0.tar.gz
+md5  6623fed7ffa22261ba25fccaf4d99539  attrs-23.1.0.tar.gz
+sha256  6279836d581513a26f1bf235f9acd333bc9115683f14f7e8fae46c98fc50e015  attrs-23.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  882115c95dfc2af1eeb6714f8ec6d5cbcabf667caff8729f42420da63f714e9f  LICENSE
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 0462f7cb0b..0d704ea111 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -4,11 +4,15 @@
 #
 ################################################################################
 
-PYTHON_ATTRS_VERSION = 22.2.0
+PYTHON_ATTRS_VERSION = 23.1.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/21/31/3f468da74c7de4fcf9b25591e682856389b3400b4b62f201e65f15ea3e07
-PYTHON_ATTRS_SETUP_TYPE = setuptools
+PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/97/90/81f95d5f705be17872843536b1868f351805acf6971251ff07c1b8334dbb
+PYTHON_ATTRS_SETUP_TYPE = pep517
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
+PYTHON_ATTRS_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
