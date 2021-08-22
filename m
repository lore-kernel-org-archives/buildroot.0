Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A664AC4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 09:05:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E0DD611EF
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 09:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E0DD611EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8CAB40010;
	Sun, 22 Aug 2021 09:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHMSjsvb7qgH; Sun, 22 Aug 2021 09:05:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09ADE400DD;
	Sun, 22 Aug 2021 09:05:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DA371BF2C1
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 09:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D37C4023C
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 09:05:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lhsx1mY9--iD for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 09:05:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5535D401E7
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 09:05:30 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id x12so21152812wrr.11
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 02:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6o6rWCnV+cUQLx4vUX0DiL0ukEjU5veOZVb11bsc+fg=;
 b=m/2UjAfcrHNzFVDxQbonHwDpoGrzV7pIKUkd4oh9kBu4WNxJU8pyIR5bh45snbji04
 7JGF0HY+6741aypc3dPcTzfMCgdWchV7V3N6p+3oZmJnvUupkl2M+PgTYr0Z9OJ/HWlH
 COrBjjiEoDR4xoI3VQ4twgqBOPu32rJM93dEcec60ijrgaIV5/Pk77XZFzTmmJ+qTKdE
 rlnjiH9V+U6NYvvoO4DX5irOAcBdGpkFQ6RfFUdfzANnh3l9/uY4aCB7ddNWRdtdcEr2
 8SJtWHfwjlHTyKh8mM6Bp6Hev81/1iccWE5HJ6byaIfB+6yoyH49IGUbiX23Fe6QuzyU
 jtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6o6rWCnV+cUQLx4vUX0DiL0ukEjU5veOZVb11bsc+fg=;
 b=CrwI4s/SeN+VSPzT6P6eH8IgoF/bUHy5Sfg2QLq+JHgCVEt9EQ4ncPqVlrSnG2jVWB
 pVEfIrNiJkK5zeLKEVrJyHugKyEYH0Mq2Xo9lkJFrkNwe8S9fhvYTVMici4Ny5+fZ2Ba
 bRlowlGdLCpdWSsuj+gfQ7jv9hB6cw/382wYo/wontk+O9jqtJ9U9nbOu7MiOX1f8TgP
 ni6lLKuANiPuqfVol1BIcNfFv7vPuchg74l2JLo/DC1vLFjAShXCIil3tYG0ZztZ0PRN
 EAjZlMeE6EwzMmA+c+B5sjPFlUYE55270n/uRsvSzOUEhAJGYcs3PZIAt4i3r6nHvi4+
 Kj+A==
X-Gm-Message-State: AOAM530t1r9aFzLkZr6cuKEKQXAnRNlYhrn+MYiPyKbpa9R9ItGhbWu+
 nMPJO6W86ieJj+vYoN7iDfjpzrxXMdc=
X-Google-Smtp-Source: ABdhPJz4w2NLJ8l4gqMXvdGdCWsQ+g5UUWh89Ar9A3WRSnXuMgPxRiVCVIMUkJkmSzv1dSHupQx+oA==
X-Received: by 2002:a05:6000:1864:: with SMTP id
 d4mr8107024wri.250.1629623128444; 
 Sun, 22 Aug 2021 02:05:28 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id z7sm14840959wmi.4.2021.08.22.02.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 02:05:27 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Aug 2021 11:05:22 +0200
Message-Id: <20210822090522.2527091-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/testing: remove
 TestPythonPy2{Cryptography, ServiceIdentity, Treq, Twisted, Txtorcon}
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The python2 support has been removed since the python-idna bump to version 3.2 [1]

[1] 0c7e30b43a5e98abfc8db521a6415b5a5c1c267f

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Now python-cryptography only support python3, the python infra will
provide the host variant for python3.
We can remove package/python3-cryptography.
---
 .../testing/tests/package/test_python_cryptography.py | 11 -----------
 .../tests/package/test_python_service_identity.py     | 11 -----------
 support/testing/tests/package/test_python_treq.py     |  9 ---------
 support/testing/tests/package/test_python_twisted.py  |  9 ---------
 support/testing/tests/package/test_python_txtorcon.py | 11 -----------
 5 files changed, 51 deletions(-)

diff --git a/support/testing/tests/package/test_python_cryptography.py b/support/testing/tests/package/test_python_cryptography.py
index 14515fcd2d..62f0ca0def 100644
--- a/support/testing/tests/package/test_python_cryptography.py
+++ b/support/testing/tests/package/test_python_cryptography.py
@@ -1,17 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Cryptography(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
-        """
-    sample_scripts = ["tests/package/sample_python_cryptography.py"]
-    timeout = 40
-
-
 class TestPythonPy3Cryptography(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_service_identity.py b/support/testing/tests/package/test_python_service_identity.py
index 6aeb77de8c..09cfbe0a26 100644
--- a/support/testing/tests/package/test_python_service_identity.py
+++ b/support/testing/tests/package/test_python_service_identity.py
@@ -1,17 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2ServiceIdentity(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_SERVICE_IDENTITY=y
-        """
-    sample_scripts = ["tests/package/sample_python_service_identity.py"]
-    timeout = 30
-
-
 class TestPythonPy3ServiceIdentity(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_treq.py b/support/testing/tests/package/test_python_treq.py
index e24ae845be..d7a23829ea 100644
--- a/support/testing/tests/package/test_python_treq.py
+++ b/support/testing/tests/package/test_python_treq.py
@@ -12,15 +12,6 @@ class TestPythonTreq(TestPythonPackageBase):
         self.assertEqual(exit_code, 0)
 
 
-class TestPythonPy2Treq(TestPythonTreq):
-    __test__ = True
-    config = TestPythonTreq.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_TREQ=y
-        """
-
-
 class TestPythonPy3Treq(TestPythonTreq):
     __test__ = True
     config = TestPythonTreq.config + \
diff --git a/support/testing/tests/package/test_python_twisted.py b/support/testing/tests/package/test_python_twisted.py
index a458ee45dd..e87312db13 100644
--- a/support/testing/tests/package/test_python_twisted.py
+++ b/support/testing/tests/package/test_python_twisted.py
@@ -21,15 +21,6 @@ class TestPythonTwisted(TestPythonPackageBase):
         self.assertEqual(exit_code, 0)
 
 
-class TestPythonPy2Twisted(TestPythonTwisted):
-    __test__ = True
-    config = TestPythonTwisted.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_TWISTED=y
-        """
-
-
 class TestPythonPy3Twisted(TestPythonTwisted):
     __test__ = True
     config = TestPythonTwisted.config + \
diff --git a/support/testing/tests/package/test_python_txtorcon.py b/support/testing/tests/package/test_python_txtorcon.py
index 1ac2f6919a..8e74190ee1 100644
--- a/support/testing/tests/package/test_python_txtorcon.py
+++ b/support/testing/tests/package/test_python_txtorcon.py
@@ -1,17 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Txtorcon(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_TXTORCON=y
-        """
-    sample_scripts = ["tests/package/sample_python_txtorcon.py"]
-    timeout = 30
-
-
 class TestPythonPy3Txtorcon(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
