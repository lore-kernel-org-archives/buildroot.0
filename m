Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32ABC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 07:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DC7360BFE;
	Mon, 22 Aug 2022 07:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DC7360BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kWyc3XAPD6TR; Mon, 22 Aug 2022 07:22:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BF5B60BEE;
	Mon, 22 Aug 2022 07:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BF5B60BEE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 834221BF577
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 07:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A5E8405FC
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 07:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A5E8405FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z3h1HrPUQXCJ for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 07:22:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58FA7400D2
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58FA7400D2
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 07:22:47 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id o204so3753829oia.12
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 00:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=hscoQKX8mO6ROTIQXdgS0sHN3/qbTNv4eNGlEbdaEyw=;
 b=ve7gNiQoU5B8jnjxKACQTIgHA0JwOZUsQVOBdHdAPiFaEwtkKb8MR5VCQMMsmKUO3p
 G4BGlezYKNc5Qnj8R9ogxBr3VsKPz+o3jV4IAG5qMT+0KVAn2UxGdbweQX+Fx0azQn41
 uMXwO0gbYZ6IZiDY7ealPlOf5wLpaLnqQ5E1eKijLjQDtPg7zX9705lL8RysY2NrpFtZ
 psZ6bfHnkogZ1T3GFZ5BYsNpI0h4ipP5QvGyTRjEKQA+Vt+QmBfcgYAR/bmZRBCYtitV
 vFrK0kPOpA6QUWk58J55D/JlYuCWOCkhK8cHsv/bVEmeCqoF+tCHWlS6ErUgOtvULlIW
 H0Hw==
X-Gm-Message-State: ACgBeo3MMt8WLOabp9nSUIj7/MoJTdmm/P+K6nQufBJ7CKbb5g90a/ys
 oudYfu+wpkJDEezghIM6Vg/AibBqTAo=
X-Google-Smtp-Source: AA6agR7Yrao2kNlqq/FJ36KHFMnNyxICPE5jT8vZfv+bZGjhSAyO6ub7QDSEU3pMl5XhC0g4Nq6aNA==
X-Received: by 2002:a05:6808:2028:b0:344:246d:2bed with SMTP id
 q40-20020a056808202800b00344246d2bedmr10487932oiw.19.1661152965166; 
 Mon, 22 Aug 2022 00:22:45 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 k19-20020a056820017300b00432ac97ad09sm2384006ood.26.2022.08.22.00.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 00:22:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 01:22:41 -0600
Message-Id: <20220822072241.2056264-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=hscoQKX8mO6ROTIQXdgS0sHN3/qbTNv4eNGlEbdaEyw=;
 b=cCfUr1xcwt5bSuyLT8HzaszgQHkFbpTmBR1npHbQ1W1o/tv6PscI800GeyOoUsxlpE
 zyAvnq9tYPZ8u08ZAYrnQcfJ24d/PTwI7Istm6Hggk+oM9ndRpdHJ8MUaFGC6elMBty+
 iDgmtkorRN9b89ATgir93DfyzzF/o9koCufkm/Ad8cRdbzRPvL65329Un0ygOuanN7c6
 yBOx/jJxchYFvifxaTM8Dhh4he/x3MxgN9Te+gio5pWchOS6nnmXojaBVqeB8aVk28MP
 9o19hDZMnPHTSUoeIDgzK0hcwIcC7LxwB+TYTdv/EnCRKgVShaRwV3n0FQEVH/RkWOc7
 l9Lw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cCfUr1xc
Subject: [Buildroot] [PATCH 1/1] package/python-pep517: bump to version
 0.13.0
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
 package/python-pep517/python-pep517.hash | 4 ++--
 package/python-pep517/python-pep517.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pep517/python-pep517.hash b/package/python-pep517/python-pep517.hash
index 4dd4c47fa0..6535e51656 100644
--- a/package/python-pep517/python-pep517.hash
+++ b/package/python-pep517/python-pep517.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pep517/json
-md5  7ed0adb5f737c316e071d48d66329a5d  pep517-0.12.0.tar.gz
-sha256  931378d93d11b298cf511dd634cf5ea4cb249a28ef84160b3247ee9afb4e8ab0  pep517-0.12.0.tar.gz
+md5  7fd08b11215256601a8a4940c1ba3d34  pep517-0.13.0.tar.gz
+sha256  ae69927c5c172be1add9203726d4b84cf3ebad1edcd5f71fcdc746e66e829f59  pep517-0.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
index 45c4f8dd39..1fd294fbb4 100644
--- a/package/python-pep517/python-pep517.mk
+++ b/package/python-pep517/python-pep517.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PEP517_VERSION = 0.12.0
+PYTHON_PEP517_VERSION = 0.13.0
 PYTHON_PEP517_SOURCE = pep517-$(PYTHON_PEP517_VERSION).tar.gz
-PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/0a/65/6e656d49c679136edfba25f25791f45ffe1ea4ae2ec1c59fe9c35e061cd1
+PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/4d/19/e11fcc88288f68ae48e3aa9cf5a6fd092a88e629cb723465666c44d487a0
 PYTHON_PEP517_LICENSE = MIT
 PYTHON_PEP517_LICENSE_FILES = LICENSE
 PYTHON_PEP517_SETUP_TYPE = flit-bootstrap
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
