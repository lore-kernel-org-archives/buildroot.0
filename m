Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DB0C761A6
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 00:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACB5940465;
	Wed, 22 Mar 2023 00:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACB5940465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t4k6hHsKQtjN; Wed, 22 Mar 2023 00:09:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07F3140A54;
	Wed, 22 Mar 2023 00:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07F3140A54
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF6C71BF5F5
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 00:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97544403B7
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 00:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97544403B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hNiUf9RQvkFW for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 00:09:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FDCB40154
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FDCB40154
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 00:09:07 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id o12so7752433iow.6
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 17:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679443746;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tqABDKV7VohL5nvzbXY65Y8CveS/xaGVvp7yfJoG4e8=;
 b=Y+WEew57Q5pMycff4xbKSV19e2CkaZs9C7FxmvGlKILuRFMEE/gOsGG2631l9zpoTF
 uoq+gldBPn3iZ4XS+301veyy0YlMjDoedIwozBCvfzd8xckw17MWE92RU8TQIu8tLEww
 ocCRGH2ddXsCJdxMCrizlMHUpi81/JDxy4v2pcU7lPi83Fz4E8pEcgCzyXJI/NPBkXIU
 aRWhSAc4dSUDxLvjc4AGcLS21lUGiLZcAgt/jydbO8rzR8d9ruqPHb8U1z0suQV5y/FS
 g26FLwBxzil8ECa2uYLwfaZY5f7/HNEQm1jwPLJo5Ml8J8JjGiPl3+mbZ+QSIi1W9Dei
 ta9w==
X-Gm-Message-State: AO0yUKUnI+ujDnK14d3ADs3JPehIiBwNPdKoRiCeJSpKvGNgEoJgs6WZ
 1TnzO5Y0v+bAlL08gZ5+kkaFtDs6e5ynwA==
X-Google-Smtp-Source: AK7set9DEljGWwOrDyIhjPQVU9Kqr+sDVcIoKEKG2hYMXcBk6F5Gjt0nG32kEi/yGNyNv6gbigHr1Q==
X-Received: by 2002:a05:6602:1812:b0:753:ee63:3dc with SMTP id
 t18-20020a056602181200b00753ee6303dcmr3423446ioh.20.1679443746259; 
 Tue, 21 Mar 2023 17:09:06 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 q2-20020a02a982000000b003c505bdf305sm4682190jam.141.2023.03.21.17.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 17:09:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 18:09:04 -0600
Message-Id: <20230322000904.4049993-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679443746;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tqABDKV7VohL5nvzbXY65Y8CveS/xaGVvp7yfJoG4e8=;
 b=a2d8VJMFWa8s1XyXekYQ9oXh8lPaaX7anCOJTrqP5Sy7SqiYN2paJHBh0J2gSH6WfD
 +K9+CwYqcoE1WpFE4ZFp3KpjqpOVqOF4VP19CeYTWLgnX7Shj29r6wqjxf/fAnPfhW8H
 uaMrvKlqhtkI6IhQdweuPkIEr0OfIoWlp8sT+1MDG8C1llJ+dx9isCUAP8mQftNjvsqt
 GxWL4G8wqJNC94ZaR30ztwsAJbtSRgd4TSBkHz/JoNxsrOsIZhtNWxNyVBRbVof2OvAQ
 IPQKQu8foXQZzNvlB5OAcx+QfuDkVvr5L3yRIH1mPYbxVWzsglFjNYPru+pqce9OSc6e
 tz+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=a2d8VJMF
Subject: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to version
 0.6.1
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
 package/python-aioconsole/python-aioconsole.hash | 4 ++--
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index 107910b6be..8770d55932 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  ae7bae13cb8aab6b1a4d2c25284ffcd3  aioconsole-0.5.1.tar.gz
-sha256  c8ddd9fd21db71ea51fb9b0d20d21d11c409c92988edf07c935d705fa60e026b  aioconsole-0.5.1.tar.gz
+md5  3e58234291434cb33cbb6396323918ad  aioconsole-0.6.1.tar.gz
+sha256  520313bc5d7ed6bea3baf072ce7e622479afd67c01b3fdcc076bc528da354f6f  aioconsole-0.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  fe3eea6c599e23a00c08c5f5cb2320c30adc8f8687db5fcec9b79a662c53ff6b  LICENSE
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index dc0eb36158..5641254f5d 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.5.1
+PYTHON_AIOCONSOLE_VERSION = 0.6.1
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/71/74/cd64dbc518f71486b235f0e1538ea4b7cbf4375a8bdc6f96c9c9595291ab
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/27/a2/4bbeecceb6786a058e92469686ae1b7d3a616b3f5b99e00b96c3064349e2
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
