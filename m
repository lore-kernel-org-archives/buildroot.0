Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26D6C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 05:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5006C6150E;
	Sat, 25 Nov 2023 05:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5006C6150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 75WBh9nuqolG; Sat, 25 Nov 2023 05:22:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FB6B60D51;
	Sat, 25 Nov 2023 05:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FB6B60D51
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 57DA21BF4E5
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 05:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A489416BF
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 05:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A489416BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8PGoj6Spn2qA for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 05:22:15 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 271B141685
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 05:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 271B141685
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7b37dbf896eso38133939f.1
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 21:22:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700889734; x=1701494534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OP9bCcOr26O+UfVPixbQ6C8806u3po7Fz9c8/WoWVj0=;
 b=BpVeDuubtO2+iS0X4fVU0C4lxROXNrtm6V0OLQdAhsPxG1VpJjjpbF6NLzvDh+jzq/
 VagTtZZy7j0PJahPaq1Ebxuy8R6Hx1fUOUOj3FgP/mZXjY2hAIopFORRSukDdHMgpsuN
 +FaaaBZh+oIU9Qssly8yooYtHoULqUSNKAqGnjFEVAFTM+GbXpBStLrG2i4SfJSBq4fc
 Y9Nac3Jy0gU9eZWtDcZV/yvOUAW8/tfQ3Vhj8epSf8hmF4yA59QVAoaqmy6XuYAORbg0
 0yGhgEALZE1XNQLvJeW6lv6PPPYFj2hXIXwwY6rOlxhOi5OanB4zGawx/45ARbukzz6c
 06Wg==
X-Gm-Message-State: AOJu0YwfbInD2kVIGEEQ0Vh9C3R0tOwXiC3hjOk9fsv/k4Svy103GtHT
 5F6+uHLOhKqVJNcb81Jwg3FtM7VfARY=
X-Google-Smtp-Source: AGHT+IGBjFuM+DdayosOJWlWMgeJd+9kvCBGpWL5q7LehIZuOnURgQZwrfQD99bieNj07mG4dtU2sw==
X-Received: by 2002:a05:6602:3684:b0:7a9:96aa:e019 with SMTP id
 bf4-20020a056602368400b007a996aae019mr475800iob.13.1700889733734; 
 Fri, 24 Nov 2023 21:22:13 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 v6-20020a056638358600b0046674d6318fsm1186208jal.17.2023.11.24.21.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 21:22:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 22:22:11 -0700
Message-Id: <20231125052211.274014-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700889734; x=1701494534; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OP9bCcOr26O+UfVPixbQ6C8806u3po7Fz9c8/WoWVj0=;
 b=WVUGM8ygPcR+Ca+l9cp5D2U5GcgApPCtZCxt+vTYhF9oqHX50/cbUoA8a7KCDq8uJk
 1dDaqqHH9sConK1Oa+E7FdLNApvaVyYmMqewmsDHStMZF3Lz5iAhik8Y8teF1eOcgp/9
 WSmOZmN+a6cKa3YYh033/uRJMX336W4XMfL33OzYAg4I6AzVuKa8cvzY5FZT4evKMiOA
 xCroWP4uZtcfeT8rUrcksbRd9hFG8KyY2w5erZt54WarnNvZPyU0vlPTsKCBHBlHoY5j
 IvzkIjcYc5rD2s1QrgmdmBAUy69diO6zcdOiJBMTbhIyxAQ1SKFlXe1bGUYab4EjXerr
 n75w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WVUGM8yg
Subject: [Buildroot] [PATCH 1/1] package/python-periphery: bump to version
 2.4.1
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year update:
https://github.com/vsergeev/python-periphery/commit/c0e6741ee294fb9362ddc4b60088f18bb1c27f8d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-periphery/python-periphery.hash | 8 +++++---
 package/python-periphery/python-periphery.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-periphery/python-periphery.hash b/package/python-periphery/python-periphery.hash
index 24e104d3ad..a758fa7a4d 100644
--- a/package/python-periphery/python-periphery.hash
+++ b/package/python-periphery/python-periphery.hash
@@ -1,3 +1,5 @@
-# Locally calculated
-sha256  385716bdbd11fcf2c5728548c3d42f12ebc0974faa64fa1a98b89b4a44dc004c  python-periphery-2.3.0.tar.gz
-sha256  76fe342043adfe8d9453c4979aa165476875137e15b0ddea1f4c3f3fa9808361  LICENSE
+# md5, sha256 from https://pypi.org/pypi/python-periphery/json
+md5  2b2a1037fb4ac15e7b0514ce3659d26c  python-periphery-2.4.1.tar.gz
+sha256  61d461d736982a6f766e878720ab10a68151e2e8c1086600d9389ac47e40e88a  python-periphery-2.4.1.tar.gz
+# Locally computed sha256 checksums
+sha256  321124461e9f86f4f7bb9f571500bf58ec1b76206b642e505ce17db7f7c88e05  LICENSE
diff --git a/package/python-periphery/python-periphery.mk b/package/python-periphery/python-periphery.mk
index 2c533fa2c2..7a49f305a5 100644
--- a/package/python-periphery/python-periphery.mk
+++ b/package/python-periphery/python-periphery.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PERIPHERY_VERSION = 2.3.0
-PYTHON_PERIPHERY_SITE = $(call github,vsergeev,python-periphery,v$(PYTHON_PERIPHERY_VERSION))
+PYTHON_PERIPHERY_VERSION = 2.4.1
+PYTHON_PERIPHERY_SITE = https://files.pythonhosted.org/packages/df/f1/1a986ad2bb696033168db2121151e5ff90df033af780ffca47c8bb559f29
 PYTHON_PERIPHERY_LICENSE = MIT
 PYTHON_PERIPHERY_LICENSE_FILES = LICENSE
 PYTHON_PERIPHERY_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
