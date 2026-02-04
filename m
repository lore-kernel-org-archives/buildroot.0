Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BD7E9D3E2
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 14:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06CBB60BD9;
	Wed,  4 Feb 2026 14:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESZfco93fkXx; Wed,  4 Feb 2026 14:24:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBA0D607DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770215059;
	bh=ZfbWwO3WQGcOW1PeLMU1iZCnkqblIHWp730ugUYzElk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=QHmhz+o/LN95yQmw6yILbKqWGtf950ZlP2zaDdta6vOIgDNMUtTviOL+x5QXVTsVr
	 M7QpJrROFpxz0Joj/7k3N1JfhwInsNHGL97cc7VvPdSHnkysWRiiQ47tWtwaJscZer
	 9VjXHcFC/xSS977H3dsIdk5qdQ441G+hH+7c0jlQ+ELYwzndizfUWnrcSlmWFJ8Ptg
	 YA6Zi5wsyiYnb85XjAEap9641HLyp+R4pvD48fNjFDmhYhTCgPtXfOd31aofNzYAOy
	 fN6WO9sZLQmcjWdYmWuGSbKYsVzexEFgszULzDtswxOXOsAPNHE357HMrbERHOA6W5
	 al8zJ3U+Ot1JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBA0D607DF;
	Wed,  4 Feb 2026 14:24:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C2D3173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AF6F40653
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 484fmXacSJBa for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 14:24:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.92;
 helo=sender4-pp-o92.zoho.com; envelope-from=kingxukai@zohomail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1718B40642
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1718B40642
Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com
 [136.143.188.92])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1718B40642
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:24:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770215032; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=eQhOcE3Og+Zdv6UNzmmQmn/bEX08MNFcknWgl2JxgcexZY8HQE+3OdeyplDcLBltY2JwOk4pVHSWxMRM2yf8b7UfWnBg9SAWDhvjNbprz495Y19rPquXBgE4RLppiOb1tp6ZMryErtZiLrCbEx/2jAYhcZJVvr1tDKrz9b7Icp0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770215032;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=T7OaFXT7bu5xWQJrBJvNJpZlucz8z3ncZpsbt5SjwYI=; 
 b=Bp13qXHjquEFVktdLSD8HgINr79PzswoFKRpZI2xiSCPY+4j30zEZz1hHMGNGnhF3HW45i+WI4WhTdpl4ln98SIb5dVtj5cowIzwXYmKh8hL4JNkhNzdUE/i6IbN1m2gIh2plHToyWxiL3iEThCQabrym2IfVmkcg/PCO9glIq4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
 dmarc=pass header.from=<kingxukai@zohomail.com>
Received: by mx.zohomail.com with SMTPS id 1770215030155178.71563766690076;
 Wed, 4 Feb 2026 06:23:50 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 22:23:08 +0800
Message-Id: <20260204142309.506287-6-kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260204142309.506287-1-kingxukai@zohomail.com>
References: <20260204142309.506287-1-kingxukai@zohomail.com>
MIME-Version: 1.0
Feedback-ID: rr08011227162f015fe515d695dd252e030000bfafd6690cfb805398b5d8fd608503e3c15387f56820dc396b:zu080112272983284521fc3d15a3a5983a0000a6a0d009f25bb2468208c32bb374eb8fa708d5f2692227fc3a:rf0801122c5577be11ec8b692efd615a8000003dcab3f55b68508a0d2d0308841b578839e01f65e1097586deca0cde4513:ZohoMail
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1770215032; 
 s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
 bh=T7OaFXT7bu5xWQJrBJvNJpZlucz8z3ncZpsbt5SjwYI=;
 b=bTKzXBVEw51MU95IaBC+TUCpkni4lDj2gqScwprfdCHQYXpjsZw4Kg3wfETb7PH+
 8x7X7oSmBPhJ2VRO+4PltXyRooMSZfWB3kKsv/s5wUtoMCzDo3rcq8IvHszH7o4ZHB2
 6pFVN0eoabilTxReJ/Kyz61ZtP6BUvw4QkthqPSI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=zohomail.com header.i=kingxukai@zohomail.com
 header.a=rsa-sha256 header.s=zm2022 header.b=bTKzXBVE
Subject: [Buildroot] [v1 5/6] support/testing: add
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
