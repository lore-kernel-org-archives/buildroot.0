Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF07C021A4
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 17:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED6A04198C;
	Fri, 14 Feb 2025 17:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XE5u-z_ZvJ3I; Fri, 14 Feb 2025 17:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E356140C06
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E356140C06;
	Fri, 14 Feb 2025 17:44:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 343B11F1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 17:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 181D460655
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 17:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JaW46VIE-_hK for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 17:44:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=162.248.234.2;
 helo=mail.xes-mad.com; envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B7F96066F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B7F96066F
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B7F96066F
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 17:44:41 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id 2D34A2038C;
 Fri, 14 Feb 2025 11:44:41 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Vincent Fazio <vfazio@gmail.com>,
 Vincent Fazio <vfazio@xes-inc.com>
Date: Fri, 14 Feb 2025 11:44:32 -0600
Message-Id: <20250214174432.2080406-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1739555081; bh=sLHdml8q23JKqQIK0EUJoVG2LZ2DdwOfJl7WJBu5wn8=;
 h=From:To:Cc:Subject:Date:From;
 b=YV21xt+xWNbeJhxUlgl7M70z+rgYFwkYYtjKq/hOmyuMwXjsyDusLtsNpPp5lxK92
 MpyJfmq4yIwwhaIxl2++qZ16bzOOmr6cbx48tJBTMPk9Bd93VwE01W57onwAcq6cOh
 xzrvAJUj1fHFnGFOBneo4qS2igeBjbrg6opyxqe8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=mail header.b=YV21xt+x
Subject: [Buildroot] [PATCH] support/testing: test_python_{gnupg,
 spake2}: increase timeout value
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Previously, these tests had the potential for timing out with the
default 5 second timeout value if initializing /dev/urandom took too
long.

Now the tests use a 10 second timeout value.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 support/testing/tests/package/test_python_gnupg.py  | 1 +
 support/testing/tests/package/test_python_spake2.py | 1 +
 2 files changed, 2 insertions(+)

diff --git a/support/testing/tests/package/test_python_gnupg.py b/support/testing/tests/package/test_python_gnupg.py
index 8861115130..8b438aed15 100644
--- a/support/testing/tests/package/test_python_gnupg.py
+++ b/support/testing/tests/package/test_python_gnupg.py
@@ -9,3 +9,4 @@ class TestPythonPy3GnuPG(TestPythonPackageBase):
         BR2_PACKAGE_PYTHON_GNUPG=y
         """
     sample_scripts = ["tests/package/sample_python_gnupg.py"]
+    timeout = 10  # /dev/urandom can take a while to become initialized
diff --git a/support/testing/tests/package/test_python_spake2.py b/support/testing/tests/package/test_python_spake2.py
index fb47a0802c..0629772bc3 100644
--- a/support/testing/tests/package/test_python_spake2.py
+++ b/support/testing/tests/package/test_python_spake2.py
@@ -9,3 +9,4 @@ class TestPythonPy3Spake2(TestPythonPackageBase):
         BR2_PACKAGE_PYTHON_SPAKE2=y
         """
     sample_scripts = ["tests/package/sample_python_spake2.py"]
+    timeout = 10  # /dev/urandom can take a while to become initialized
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
