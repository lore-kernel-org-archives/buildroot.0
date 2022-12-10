Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40797C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 16:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C941C81A46;
	Sat, 10 Dec 2022 16:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C941C81A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d5-njur92yN9; Sat, 10 Dec 2022 16:48:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1202281A15;
	Sat, 10 Dec 2022 16:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1202281A15
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BDF251BF59F
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A64EA81846
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A64EA81846
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gOFYGLBJYo9A for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 16:48:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5898481A15
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5898481A15
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 16:48:34 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id y2so1406816ily.5
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 08:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8vZo0BjXSG+9VWnQXegvZCUIu8t0eWK2QhVJVB4UBJ4=;
 b=rPwOPcaVg/kGXioFgMAlxGBcOwom3tbJUhZBIk7z5YIpQYa8AakonFKA+1ZtK3zMai
 CbSUegXiOuALxH5Th2YSKlSM97cnyaPJ6LArvOUl4yfyEYYot1JWeKuErbewtXa9rqUG
 GTK0JBHK09v67FpO7FX0O0UpWdYisa/txu4t6Lo9r5YCR0sAbj3maWdzRK46BpyHxjc/
 cR30tp8TfFY5NhQrzgJ1Bv+tey6OinscxIDwKrQIh6NiZyFk4sKLTNG0aUc/XDyWGqbQ
 8xPwZX6VoL87tELavIQ7EPWlXc4g4RKS7eO09D6VuoWak4QkQsBp1W62smFjJ06fBnP1
 fpWA==
X-Gm-Message-State: ANoB5pnW08plO2UVBXX9dLJc4TQioidwDJNxkQnMD8OdrIAFmjaUr6H1
 MZQmPPD/4YtG1QHwHzkrAcHratk4Khhg2g==
X-Google-Smtp-Source: AA0mqf4lBH2R/DWFtMB2lrkRRafLgJtNVu+ZjE234l3/7LvBpQVGfFAvFgN8bA02DNfyKEhepbGNHw==
X-Received: by 2002:a92:d644:0:b0:2fc:ce25:4834 with SMTP id
 x4-20020a92d644000000b002fcce254834mr5636353ilp.14.1670690913095; 
 Sat, 10 Dec 2022 08:48:33 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 e28-20020a0566380cdc00b003711ce0dc15sm1557099jak.68.2022.12.10.08.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 08:48:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 09:48:31 -0700
Message-Id: <20221210164831.2535747-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8vZo0BjXSG+9VWnQXegvZCUIu8t0eWK2QhVJVB4UBJ4=;
 b=mUgDxwhnjXhxzUwp8liCjfC2bWCneMHvGUEaeDrs8G9QttMh9vUJqOsQpmWLxymfAY
 jTRUx2d6NpYXqgCqa0ZjLLQScMgDg61h2snYIslUZcUlfwG5mX6Q1e+yigOf6ko2UyFs
 8mQYy3asYIXzLyb9WwLOIQdJYvxexcq42YxyZfXIBatSHsmyj+8PpxvtoidXmdD/+kQU
 Xia7s+K1M+u6oNQiHMS+nJw0ACarhJ3BRAT1+Py0KACL+qW/COoNFu0jFMVVSXCX5GDg
 TYRD78XR+i84MUt1f290ejHAwD9RHPBY2SRM1nnmczHCxzAoG1z8IINdDQ3+P/qTfZEF
 yt+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mUgDxwhn
Subject: [Buildroot] [PATCH 1/1] package/python-dicttoxml: bump to version
 1.7.15
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
 package/python-dicttoxml/python-dicttoxml.hash | 8 ++++----
 package/python-dicttoxml/python-dicttoxml.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-dicttoxml/python-dicttoxml.hash b/package/python-dicttoxml/python-dicttoxml.hash
index d8c43d0144..dcde7cf1b6 100644
--- a/package/python-dicttoxml/python-dicttoxml.hash
+++ b/package/python-dicttoxml/python-dicttoxml.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/dicttoxml/json
-md5  ec5643a048cf32dad3c28db236b923e4  dicttoxml-1.7.4.tar.gz
-# Locally computed
-sha256  ea44cc4ec6c0f85098c57a431a1ee891b3549347b07b7414c8a24611ecf37e45  dicttoxml-1.7.4.tar.gz
+# md5, sha256 from https://pypi.org/pypi/dicttoxml/json
+md5  234550e3aa875c6f3520aa9a2dff1ef1  dicttoxml-1.7.15.tar.gz
+sha256  5540fe7dfde2d2ed9467e67fcc981cbd2e164dc3120c862bdb7333202ac48838  dicttoxml-1.7.15.tar.gz
+# Locally computed sha256 checksums
 sha256  4514114bd9da0b2fbf8c4fa264c0e6cc80fd41e6ac7f09d7a39a215662951c7c  LICENCE.txt
diff --git a/package/python-dicttoxml/python-dicttoxml.mk b/package/python-dicttoxml/python-dicttoxml.mk
index 537afff601..3e5f90e9de 100644
--- a/package/python-dicttoxml/python-dicttoxml.mk
+++ b/package/python-dicttoxml/python-dicttoxml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DICTTOXML_VERSION = 1.7.4
+PYTHON_DICTTOXML_VERSION = 1.7.15
 PYTHON_DICTTOXML_SOURCE = dicttoxml-$(PYTHON_DICTTOXML_VERSION).tar.gz
-PYTHON_DICTTOXML_SITE = https://pypi.python.org/packages/74/36/534db111db9e7610a41641a1f6669a964aacaf51858f466de264cc8dcdd9
+PYTHON_DICTTOXML_SITE = https://files.pythonhosted.org/packages/45/b5/efa170fd88e8b8bc025c59592eade0fb7de6ae02ed3dd63957956adc1396
 PYTHON_DICTTOXML_SETUP_TYPE = distutils
 PYTHON_DICTTOXML_LICENSE = GPL-2.0
 PYTHON_DICTTOXML_LICENSE_FILES = LICENCE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
