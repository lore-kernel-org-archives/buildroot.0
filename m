Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA309EEA845
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 19:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74A2B41183;
	Thu, 12 Feb 2026 19:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzQsymZ5DWh2; Thu, 12 Feb 2026 19:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5083B40B5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770923101;
	bh=sxdpiM8Gx2Vu+xfnEqCywOX77briDiOdeDxcB4NEoIQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=DL5r4FxRozvJ3fF6A4FrW1y7a1Gs3t8T2O8X1DzWq6HS0esJvSedRGlk+jctT4qAU
	 Q3escnRHlG2D7RvBaaPlokfu9iAnIKzBmiquYbP/azBjK0NlZs/A3iSbNEaPesRiyR
	 Xk+7VIf0UuV1ZVY36pCt8QQiCHmMIOYdB2cC5cGXoBfzGTYdtHCqhbmrtZl+oZlk+i
	 33MPcLBUmkoMn0GE2xYOM4I7YRgGFk0bh3W61JxwW/zrp4EgkiOj3xz8RJ0+BWw5kr
	 BK9yZjjXbHAhtTDhPal5FmM5GYQbMzRES/iQyHintyl3C77cGSxioSH4beqMX6HlhQ
	 +eJ5888Z0Srgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5083B40B5B;
	Thu, 12 Feb 2026 19:05:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F700EC
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CC3960AEE
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Idre59OzWZg2 for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 19:04:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.94;
 helo=sender4-pp-o94.zoho.com; envelope-from=kingxukai@zohomail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2848660AD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2848660AD1
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com
 [136.143.188.94])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2848660AD1
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:04:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770923068; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hDP4fSHMawN3n+n4JWqQ1vEf5yYyMZZvOwCnsbe7A1gplVAMuIwYyt39gi/NBeM9qDg+IdCv88LJb9lClRUL1gq3r0mGeZYS8p9k7jE63fwCn9xTORG/jwaCTRY7Jrw+DcJEPPbL6gGfJg/jjQe0K4dQ0fY7mQiE/J6QfhhyIeo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770923068;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=425NlktjwzqD01dR88IHCsIDDlNYrfMvEK3ltGza3tg=; 
 b=Lx9QNxnejdxzg7mzULNz1cwVDKxcdY9JOhP68yCQK7Ie9Iu9M656J0T9f6Yne4aE7sbX3l1ro3beejPPIhNUNlMO4uSQq0U6qk0+CMzYma0qWz8STtCTJPuO0cYMAKuXYNSJd/41Y9x5wPCPHryEZsLpbHfTS3F/23xWk/gqvOM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
 dmarc=pass header.from=<kingxukai@zohomail.com>
Received: by mx.zohomail.com with SMTPS id 1770923064447208.0532808378756;
 Thu, 12 Feb 2026 11:04:24 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 03:03:47 +0800
Message-Id: <20260212190349.537465-5-kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212190349.537465-1-kingxukai@zohomail.com>
References: <20260212190349.537465-1-kingxukai@zohomail.com>
MIME-Version: 1.0
Feedback-ID: rr08011227fd6449898bdd21bb4bff164e0000fa3709a74b523b3f4fba32a823ef51df308b203675be9a63df:zu080112277de2939a5c85344d76d003040000efdf73457b4855e70df665fc50e00ec2c8592eca4482d05b85:rf0801122df99e60aa531c149f5ce120670000c9782e05528da6cdb88344bcbf4e6cc007364eb15929e9fbeaa1084715a9d2:ZohoMail
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1770923068; 
 s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
 bh=425NlktjwzqD01dR88IHCsIDDlNYrfMvEK3ltGza3tg=;
 b=JL6KBs85B5li+7g8wRCUS4TEutPuJWZ4JMkK3fnioz5y6KtoqBi0G8DzeZF5id76
 1hrz93h5FRIcWC6eQ0duaGjXzzk7Ny21l+GRhNgrgK2VGQXmBm2YSWGNDtlqMWCk2A5
 VlDihp3M+JzVSTPfNP4iehWtU7+4klPPMD6rsPnc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com
 header.a=rsa-sha256 header.s=zm2022 header.b=JL6KBs85
Subject: [Buildroot] [RESEND: v1 4/6] support/testing: add
 python-cloudpickle tests
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
From: Xukai Wang via buildroot <buildroot@buildroot.org>
Reply-To: Xukai Wang <kingxukai@zohomail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Xukai Wang <kingxukai@zohomail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a basic runtime test for the python-cloudpickle package.
This test verifies the fundamental serialization capabilities of the
library by:
- Importing `cloudpickle`.
- Defining a simple Python function (fibonacci).
- Using `cloudpickle.dumps()` to serialize this function.

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 DEVELOPERS                                           |  2 ++
 .../tests/package/sample_python_cloudpickle.py       |  6 ++++++
 .../testing/tests/package/test_python_cloudpickle.py | 12 ++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_cloudpickle.py
 create mode 100644 support/testing/tests/package/test_python_cloudpickle.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 892738362f..0c220e6a3f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3478,6 +3478,8 @@ N:	Xukai Wang <kingxukai@zohomail.com>
 F:	package/python-cloudpickle/
 F:	package/python-farama-notifications/
 F:	package/python-gymnasium/
+F:	support/testing/tests/package/sample_python_cloudpickle.py
+F:	support/testing/tests/package/test_python_cloudpickle.py
 
 N:	Yair Ben Avraham <yairba@protonmail.com>
 F:	package/casync/
diff --git a/support/testing/tests/package/sample_python_cloudpickle.py b/support/testing/tests/package/sample_python_cloudpickle.py
new file mode 100644
index 0000000000..48f1c64b7f
--- /dev/null
+++ b/support/testing/tests/package/sample_python_cloudpickle.py
@@ -0,0 +1,6 @@
+import cloudpickle
+
+def fibonacci(n):
+        return n if n < 2 else fibonacci(n-1) + fibonacci(n-2)
+
+serialized = cloudpickle.dumps(fibonacci)
diff --git a/support/testing/tests/package/test_python_cloudpickle.py b/support/testing/tests/package/test_python_cloudpickle.py
new file mode 100644
index 0000000000..b28080f02e
--- /dev/null
+++ b/support/testing/tests/package/test_python_cloudpickle.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Cloudpickle(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_CLOUDPICKLE=y
+        """
+    sample_scripts = ["tests/package/sample_python_cloudpickle.py"]
+    timeout = 20
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
