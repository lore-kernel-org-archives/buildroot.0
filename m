Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6F8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 06:39:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D109161166
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 06:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D109161166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AED0C607DF;
	Mon, 27 Sep 2021 06:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UT_fP6Uz_6o6; Mon, 27 Sep 2021 06:39:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18EAB607DC;
	Mon, 27 Sep 2021 06:39:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73ECF1BF307
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 06:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F75D40447
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 06:39:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oh192rzgMnYy for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 06:39:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9166140437
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 06:39:39 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id s21so9153240wra.7
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 23:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4jeOR6q9a2b0k6lB3x6/U/r++haJFZPpZPy29ThlyQA=;
 b=cOFAXx2Fm3SmUNzys0S8sHsLLwueM90kIwn99detMc7xJm0Ge/p2So5S//yuNE8+Oc
 hxGUCc/tw3EqSUT96OgbSluL6QhYmzd+IDM3Dg1KCs62X9ngmWI9q4iMsM0uxFN362Qj
 8pDvtfxSAmCjPu2PhSJy/K9OTnWnx2dmhh8Oz7wdyKrbdnBrRToPn2NQ6AM/kXAOpd50
 ntzet123y+Ew4YyydudqcV+bDkvgKkIl4MiZ3UqsEdyqFQtgMdU02z1Dk20aik1HjKOR
 HvQPxRWKDjEaMwiVlCK9jQVKzJzHmUdNF0FjFIl8wwDgrH999cEXAfysYIwp4jlCp507
 Dr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4jeOR6q9a2b0k6lB3x6/U/r++haJFZPpZPy29ThlyQA=;
 b=F9f5vaNdhXJZi5Azu3jyxmbMFAad2K1PJxWKCCCTwHrc78o8FMeHEEWg+SZNNGxSbF
 oVB+QAU2PXl9fUoxczAWmVd7f7aCAOjczjvAaW3D2/QZnt8U1NynVR+oF0X36AxF30yT
 oher2pJlb7K6MSolMAcZMl1ipI4e2TB7RmZdPUNGFqRCgV+p+wmF7DQyVJLb6ApNRpLR
 9tLl1g+TUientSAGMr7BIuD7ycGNyBRaly/eTvCNdL5uKWxOeDBcnxAHm7isJNh2gK82
 ydgXxMU2/RtGbF7rLqL0eAYxWPtXdWdiT375/2Mzbv0M+wI+6dsGQO7rLU0QajXCyUVc
 XcvA==
X-Gm-Message-State: AOAM533RPbVG0JJDdeSnk4hnU7fJJZsvu8oYyHu23ROIwCbwPzjDCx0V
 UdrQId5zLtn7QsGcbgcDoxp6kn8cdFw=
X-Google-Smtp-Source: ABdhPJyQSZz2OW3vCL9WLBMhRns94cCKIKsyLrbCBKnI06q6ltgp8hPVtFrd/iFw3BM1bTHQ8s0JPw==
X-Received: by 2002:a5d:5552:: with SMTP id g18mr25914808wrw.188.1632724777514; 
 Sun, 26 Sep 2021 23:39:37 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:424d:6143:cd4e:c1e])
 by smtp.gmail.com with ESMTPSA id b7sm19226247wrm.9.2021.09.26.23.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 23:39:37 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 09:39:33 +0300
Message-Id: <20210927063933.505648-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/testing: remove python2 tests for
 automat and attrs
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit ef5c8be25ab373866b5a92d3d9f31bf36b7a8abf those packages
depend on python3. Hence, we can remove the python2 tests.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 support/testing/tests/package/test_python_attrs.py   | 10 ----------
 support/testing/tests/package/test_python_automat.py | 11 -----------
 2 files changed, 21 deletions(-)

diff --git a/support/testing/tests/package/test_python_attrs.py b/support/testing/tests/package/test_python_attrs.py
index 9f597034ae..38831b24ef 100644
--- a/support/testing/tests/package/test_python_attrs.py
+++ b/support/testing/tests/package/test_python_attrs.py
@@ -1,16 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Attrs(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_ATTRS=y
-        """
-    sample_scripts = ["tests/package/sample_python_attrs.py"]
-
-
 class TestPythonPy3Attrs(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_automat.py b/support/testing/tests/package/test_python_automat.py
index 00a7ed6526..6ee4ea7618 100644
--- a/support/testing/tests/package/test_python_automat.py
+++ b/support/testing/tests/package/test_python_automat.py
@@ -1,17 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Automat(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_AUTOMAT=y
-        """
-    sample_scripts = ["tests/package/sample_python_automat.py"]
-    timeout = 30
-
-
 class TestPythonPy3Automat(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
