Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17723EEA84B
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 19:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3DE6419D5;
	Thu, 12 Feb 2026 19:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_nyEmgyrwER; Thu, 12 Feb 2026 19:05:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5426B418F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770923106;
	bh=ZfbWwO3WQGcOW1PeLMU1iZCnkqblIHWp730ugUYzElk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ZQ17v0B5oouPL8+F1aoIpj90ay87hpD03O48B2v6QQ9tq4Bs4xOcqp8WnqmGcMtuY
	 G6zK++PQljcrSLH+rG/24GWIADn6Jr1q2nuP/9QtKCat0/TrG2akuHu4THyPD6Cbfk
	 1Ccbfar4RWO2dCyKZi+CiY1yNxI7dL2xxK0trXxQSyUNWifhMAyD4MZ4W7hMBDxDqa
	 TJJMibMzTRIkh76qzEJfVvr7IgtPW5Rxu4tgTM2cD/mlRBF6KQs0y3gh1voJu71nog
	 xmEbv+WO+i8xNDEHbRmF0cUpiG0AugpaPu4Iul7947TpG0/pxbEFpfcb1n6TSK8qHA
	 KXcf8/PjHsskw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5426B418F9;
	Thu, 12 Feb 2026 19:05:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69B131CA
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EBA3817A3
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqQZ7xXeCcPe for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 19:05:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.94;
 helo=sender4-pp-o94.zoho.com; envelope-from=kingxukai@zohomail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 24F9D81EC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24F9D81EC4
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com
 [136.143.188.94])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24F9D81EC4
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:05:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770923070; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=U1lXeXInBiwIx6qPMfioGmodm0/pWoQXgj4Gv3HVbCtBIUyHktpEEFO+Kp5buHEM1Q9Q50/Grrlw6is+zv35Yzsox+xN+6qv1fjPGMlhtQrBu6KeTy9zJWtUvclSRio0MHpmrvQYpLdpSD0f0iwJWMw8WW8ry8PMWtk7Rblyjoc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770923070;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=T7OaFXT7bu5xWQJrBJvNJpZlucz8z3ncZpsbt5SjwYI=; 
 b=Slb3tzaQHNm+EJagxJO9Q8tKIXjAt3QriuBb9dgzz28XjSfYaohE4EjkWHZltoA8DZ8ApO/0vSLWzVrNbtAcCiYE+YIaJGEc+bhVYYQNWgvPlql05DQGm0WqwHfu91p1wAdVqA2w2Q7ipkc41UathsUl3xfCIjOrhSeH/D6IUck=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
 dmarc=pass header.from=<kingxukai@zohomail.com>
Received: by mx.zohomail.com with SMTPS id 177092306674524.08725916210028;
 Thu, 12 Feb 2026 11:04:26 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 03:03:48 +0800
Message-Id: <20260212190349.537465-6-kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212190349.537465-1-kingxukai@zohomail.com>
References: <20260212190349.537465-1-kingxukai@zohomail.com>
MIME-Version: 1.0
Feedback-ID: rr08011227d58d3cc3ff9c4ad3f25b5faf00005b527c641f009ad68652e7162afc647cdda0718727a4cf89ad:zu080112271ba653d0f0c1edfe283221cf0000f1617f3bddb0b0c0e67a047345d981a008012e584c42303a32:rf0801122de2ddc023c3332e63e583a22500006844aea4bb9ec9dabcac719e44360779493ecfdb34065bf3ed2e8655db9dab:ZohoMail
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1770923070; 
 s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
 bh=T7OaFXT7bu5xWQJrBJvNJpZlucz8z3ncZpsbt5SjwYI=;
 b=YHlsjAs3PzpgAxgo3aMm/pwisMvoSJKh+EopuJ5ofnobkU01kzCoAWClezZr+a0u
 VmuOmGoIDSbZJpMAGqslaz7J84eu9C+rdxgIozqH5wYJRS39NQaXhxpfqxrSnN/F44V
 yU8Hx6gaUFSHENnXRefCAmeZDYTRm6jfE9GYvu+s=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=zohomail.com header.i=kingxukai@zohomail.com
 header.a=rsa-sha256 header.s=zm2022 header.b=YHlsjAs3
Subject: [Buildroot] [RESEND: v1 5/6] support/testing: add
 python-farama-notifications tests
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

Add a basic runtime test for the python-farama-notifications package.
This test verifies that the `farama_notifications` package can be
imported successfully and that a test notification can be stored
within its `notifications` dictionary-like object.

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 DEVELOPERS                                           |  2 ++
 .../package/sample_python_farama_notifications.py    |  6 ++++++
 .../package/test_python_farama_notifications.py      | 12 ++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_farama_notifications.py
 create mode 100644 support/testing/tests/package/test_python_farama_notifications.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 0c220e6a3f..d85c2dd56a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3480,6 +3480,8 @@ F:	package/python-farama-notifications/
 F:	package/python-gymnasium/
 F:	support/testing/tests/package/sample_python_cloudpickle.py
 F:	support/testing/tests/package/test_python_cloudpickle.py
+F:	support/testing/tests/package/sample_python_farama_notifications.py
+F:	support/testing/tests/package/test_python_farama_notifications.py
 
 N:	Yair Ben Avraham <yairba@protonmail.com>
 F:	package/casync/
diff --git a/support/testing/tests/package/sample_python_farama_notifications.py b/support/testing/tests/package/sample_python_farama_notifications.py
new file mode 100644
index 0000000000..35bedabcc4
--- /dev/null
+++ b/support/testing/tests/package/sample_python_farama_notifications.py
@@ -0,0 +1,6 @@
+import farama_notifications
+
+NOTIFICATION_ID = "test_event_occurrence"
+NOTIFICATION_MESSAGE = "A test event has occurred in Buildroot environment!"
+
+farama_notifications.notifications[NOTIFICATION_ID] = NOTIFICATION_MESSAGE
diff --git a/support/testing/tests/package/test_python_farama_notifications.py b/support/testing/tests/package/test_python_farama_notifications.py
new file mode 100644
index 0000000000..d66586132b
--- /dev/null
+++ b/support/testing/tests/package/test_python_farama_notifications.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Farama_Notifications(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_FARAMA_NOTIFICATIONS=y
+        """
+    sample_scripts = ["tests/package/sample_python_farama_notifications.py"]
+    timeout = 20
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
