Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EBACF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 05:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E599B4059B;
	Sun, 22 Sep 2024 05:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2kxn67Ovv9yN; Sun, 22 Sep 2024 05:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3C42405AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3C42405AB;
	Sun, 22 Sep 2024 05:43:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FC1F1BF3C5
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DB3A402E4
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhKsCI8LXDna for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 05:43:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 355984011C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 355984011C
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 355984011C
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 05:43:43 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-39f54079599so10878485ab.0
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 22:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726983822; x=1727588622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uMGJnPU1x1wvpunf2J5FDDCxjUIPyEdJypWQtRUaAEM=;
 b=jdloJd5GbGPzHXnDwafLwCRgTscKCuhI/+34j/4Xbsb0c4OOL6xvbg3iLa7k8eemxk
 KNrgTvXz/8vI34SB9xJ7TA18gXzciCJ2PhrWQKnwfqUHn/HAe6ywNngg/b9rEn/iGc32
 huKLfaHSP4znMqVnoM0qwEwsrGKluy7FTKkCvS3v3WWNlr7DQG0x5jAtg66gUsRf88JH
 LlfdXo+5RELvxQKJaL8AVRRsU5EZ3QvaVUlMk5bjVG03smdUuqXkB6xIHqlZdBS3yeD/
 13GugM+3e6ZyiAykg7ZuTHFKoqYje3zHEZVC+a0+J8pb9DhH5iLG1Ojp6wwmWwBxFOfn
 sYOQ==
X-Gm-Message-State: AOJu0YylS99CAHtnFQbbsdXi7ywJTmhHfMxqPBcVwr7SA3L+F7JQ96ZM
 Hzo0x5FxUNF7yboEWk01UR277xjOpGcAB38k1195SDZ3rylXqkE7cv7Sug==
X-Google-Smtp-Source: AGHT+IGE6L1DYg3fQKchogGyH2zO7mruS8Ob7kppgRMImHUws2Fo0RUH8C3PyGr3IzgCRnebD+vsGQ==
X-Received: by 2002:a05:6e02:1e07:b0:39f:4e36:4b93 with SMTP id
 e9e14a558f8ab-3a0bef53e44mr85701655ab.6.1726983821862; 
 Sat, 21 Sep 2024 22:43:41 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d3b4ccdbc3sm2576474173.113.2024.09.21.22.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 22:43:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 23:43:40 -0600
Message-Id: <20240922054340.944480-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726983822; x=1727588622; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uMGJnPU1x1wvpunf2J5FDDCxjUIPyEdJypWQtRUaAEM=;
 b=E9B4kyl7Ox044EiezDAA9aXCVSQRHUuP1RJZjU4McLVD93rxnKRCxctlSdtAhv+baC
 VmjBYqlODHN8VWPeMxaDmL3019KSd5td8dn6+xU7HtkvOvAZ7fMVzq9nsSPF3WrFuC0n
 YKC5lgLKfUkY2CZxur5zr0HzMYpeRlfxoJKudDwwpugOdVlST2idS707JLFX9MVO8LrK
 Tvt77ix8QZaVrMOvP8/kYun/JI2bo8eCFNjbRBoUYz8kkFgXcXecdJAia/WMlK2QiYw5
 XUznrOn1O25QWToOUDYsvtkhZj+vHOCeHG74sPwUQIziBOjyKKbW7Og9nkJGaBAkfOWE
 jD5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=E9B4kyl7
Subject: [Buildroot] [PATCH 1/1] package/python-typepy: bump to version 1.3.2
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
 package/python-typepy/python-typepy.hash | 4 ++--
 package/python-typepy/python-typepy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typepy/python-typepy.hash b/package/python-typepy/python-typepy.hash
index eade667341..0b73f9f4df 100644
--- a/package/python-typepy/python-typepy.hash
+++ b/package/python-typepy/python-typepy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typepy/json
-md5  9f73bef9ce9e9ccf49ed63a2dadada90  typepy-1.3.0.tar.gz
-sha256  96788530614083164993d1443959f6c58e6bb8e2da839812ddf462c203e4b84c  typepy-1.3.0.tar.gz
+md5  2637fdf609b8a7b9b8ec722852efc706  typepy-1.3.2.tar.gz
+sha256  b69fd48b9f50cdb3809906eef36b855b3134ff66c8893a4f8580abddb0b39517  typepy-1.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  bebbdf0524a147f89a615fff53d79bdc90cbc7631550fb4b725cd3f3bdcd24f6  LICENSE
diff --git a/package/python-typepy/python-typepy.mk b/package/python-typepy/python-typepy.mk
index 6c556df986..cd67d4e888 100644
--- a/package/python-typepy/python-typepy.mk
+++ b/package/python-typepy/python-typepy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPEPY_VERSION = 1.3.0
+PYTHON_TYPEPY_VERSION = 1.3.2
 PYTHON_TYPEPY_SOURCE = typepy-$(PYTHON_TYPEPY_VERSION).tar.gz
-PYTHON_TYPEPY_SITE = https://files.pythonhosted.org/packages/07/7b/fb32933f2a17992af75c0f96e5538a25fecebd439a82dcc31926ba55d336
+PYTHON_TYPEPY_SITE = https://files.pythonhosted.org/packages/cc/86/9672794fb1c87a17b839666976ed4c8cb779ce05d471bed3166a39a53c4d
 PYTHON_TYPEPY_SETUP_TYPE = setuptools
 PYTHON_TYPEPY_LICENSE = MIT
 PYTHON_TYPEPY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
