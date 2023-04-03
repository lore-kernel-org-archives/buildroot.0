Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2104C76196
	for <buildroot@archiver.kernel.org>; Mon,  3 Apr 2023 22:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 258FC81815;
	Mon,  3 Apr 2023 22:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 258FC81815
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I6La2YqIK_x9; Mon,  3 Apr 2023 22:00:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 658C281882;
	Mon,  3 Apr 2023 22:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 658C281882
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B71A1BF36D
 for <buildroot@lists.busybox.net>; Mon,  3 Apr 2023 22:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2306E40955
 for <buildroot@lists.busybox.net>; Mon,  3 Apr 2023 22:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2306E40955
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XMGEpZWRzIYI for <buildroot@lists.busybox.net>;
 Mon,  3 Apr 2023 22:00:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 056E340952
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 056E340952
 for <buildroot@buildroot.org>; Mon,  3 Apr 2023 22:00:17 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id bl9so13498359iob.8
 for <buildroot@buildroot.org>; Mon, 03 Apr 2023 15:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680559217; x=1683151217;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PTDx1UYTSXipSimHS+e4MHOw8GxF3OEy36fyqP96Zho=;
 b=GENqYpg6rz056t16UTcMrIZLAhDehlzNJXvn/NOS8BhcZ+lED3bDzVvfOu3MpcoQEG
 IZJI57NYMqZ2UjLdeAzgPRsUUVoKYxtVj1oLlhZ/vJQlBtY9NdPHGDxCQCTOhB8qCaWX
 ufts6ihQPSbsheHIwsDZlMs2orDncSeaQEq1ZZu6DA4hFnurCngyLbzIHvs1K6U1cVdO
 uug4d9f61lscjCipGj9IOEJq3ycuTsu1CB6InONILg5crkpFv8+fnREfCsVUVHat8pGB
 kwVdOStg5B8xqRRVZ8thQd07QULWe40FiIg5o+aJy041GBfAd2COLkOumpdd5bnD9vP+
 NgKA==
X-Gm-Message-State: AAQBX9f+FleG6fdiH2nFfl4xo556Tsi6lB9NvIr2CB2reSygMIR9ZlaO
 75cyybvOgrq+Y2NgOKXGyuUc91K34O1WHQ==
X-Google-Smtp-Source: AKy350ZBylOP5rWG3yUh3MumbVAjCa8i2rzVw2c4jvgm+k3qSFpPjBftsyTe2yxyNKd91N14WnIJyA==
X-Received: by 2002:a5e:c01a:0:b0:6df:fa5a:fa05 with SMTP id
 u26-20020a5ec01a000000b006dffa5afa05mr709638iol.0.1680559216549; 
 Mon, 03 Apr 2023 15:00:16 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-106.hlrn.qwest.net.
 [71.33.131.106]) by smtp.gmail.com with ESMTPSA id
 x19-20020a5d9ad3000000b00704608527d1sm2951980ion.37.2023.04.03.15.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 15:00:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  3 Apr 2023 16:00:14 -0600
Message-Id: <20230403220014.2729-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680559217; x=1683151217;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PTDx1UYTSXipSimHS+e4MHOw8GxF3OEy36fyqP96Zho=;
 b=DUb+Mh+UmydILvnzKxuwZRBDvQNiCILj0EKhIxysqyWYlrUhYkgdPmrHWiG2BvP6nA
 PFmaxwsPDdopoCwHOagkx2SNAptI4ifPkUzHUGhvlFhP+UuGRK8pOeC4gUfKmUlouC52
 +q8hqQUT49FvxTYE8wGbv16Jr+gwuKk94xU3xgRsZndpNTM37zeJrXO3mx66NSW5L4sV
 IVcwSWPcbP/j1aQbHG03ydMHccEUV0ymGup+9HKz0bqTFU72jXlGeco2LnBkFXHusfJp
 KCeAg7vkh7IKDK/XX0KtS7lNZcUhOmGH6EGl7ZVy6CYjCHNvb3HhLtQWnaSA0Fmy0XM7
 iHkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DUb+Mh+U
Subject: [Buildroot] [PATCH 1/1] package/python-pep517: drop package
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is no longer used as python-pypa-build now uses
python-pyproject-hooks instead.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                               |  1 -
 package/python-pep517/python-pep517.hash |  5 -----
 package/python-pep517/python-pep517.mk   | 14 --------------
 3 files changed, 20 deletions(-)
 delete mode 100644 package/python-pep517/python-pep517.hash
 delete mode 100644 package/python-pep517/python-pep517.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7c5880c8ee..9f795804cc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1410,7 +1410,6 @@ F:	package/python-multidict/
 F:	package/python-mypy-extensions/
 F:	package/python-outcome/
 F:	package/python-pathspec/
-F:	package/python-pep517/
 F:	package/python-pycares/
 F:	package/python-pydyf/
 F:	package/python-pypa-build/
diff --git a/package/python-pep517/python-pep517.hash b/package/python-pep517/python-pep517.hash
deleted file mode 100644
index 6535e51656..0000000000
--- a/package/python-pep517/python-pep517.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/pep517/json
-md5  7fd08b11215256601a8a4940c1ba3d34  pep517-0.13.0.tar.gz
-sha256  ae69927c5c172be1add9203726d4b84cf3ebad1edcd5f71fcdc746e66e829f59  pep517-0.13.0.tar.gz
-# Locally computed sha256 checksums
-sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
deleted file mode 100644
index c43b09faaa..0000000000
--- a/package/python-pep517/python-pep517.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-pep517
-#
-################################################################################
-
-PYTHON_PEP517_VERSION = 0.13.0
-PYTHON_PEP517_SOURCE = pep517-$(PYTHON_PEP517_VERSION).tar.gz
-PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/4d/19/e11fcc88288f68ae48e3aa9cf5a6fd092a88e629cb723465666c44d487a0
-PYTHON_PEP517_LICENSE = MIT
-PYTHON_PEP517_LICENSE_FILES = LICENSE
-PYTHON_PEP517_SETUP_TYPE = flit-bootstrap
-
-$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
