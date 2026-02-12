Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DDEEEA84B
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 19:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59B7C41A63;
	Thu, 12 Feb 2026 19:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKDQ_DI4NQQ5; Thu, 12 Feb 2026 19:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7186F41904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770923111;
	bh=waNAfiEsaO5PXGfBdAaZr8suK0qUAxgDewsYTfJMC9M=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=npv8KoIFCCAHRUCBN8uuSMffFTz5x8oL1a7HWhEV2VG2hEueOrHwWcLA7h/HOWwj/
	 J2Yzxa5iWwUVkiN4WeMVXe5T7Az8SuzkLV+8DHhT3isa/RVopCH8BQw0nEYbiD8wtr
	 S8NiV0R13uNhqLqEtIc2t0Num6El5MXJ5dmX7M47mtufb5AmH2/J1MW5jjuMSnidEm
	 svfqvoXtgezFgEcFdT7ki93wA1aJz5AjoIqpaHdH0HBvTPlI2sIHhwCCMzdP1Ueeev
	 70b2YCt95rTUQmg5bSU15avLEifXG7u5k0XjoZwo6cUhxuSZxHO0CPdcLO7rUTRVSQ
	 ZDMW1N3/6qBNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7186F41904;
	Thu, 12 Feb 2026 19:05:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 149741CA
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02B6140DF7
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPmgPE0PcT-T for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 19:05:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.94;
 helo=sender4-pp-o94.zoho.com; envelope-from=kingxukai@zohomail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB5F7402E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB5F7402E6
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com
 [136.143.188.94])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB5F7402E6
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:05:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770923072; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=agRyczZPhshnsFlp9mr9t4RnyfLk5qpdq1CDNWPwxJWqBsKavEPd7MkNNbZWSItRBnuV/w+bHfvFbIVBcVuC34Pk0ylvMVVo58kQeSjRhtqBMdlCrB6kZeCphkFpkcQBF4a5RE/gstDSbc//b+55T9cbDmojXKqMbINpT0rC3ts=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770923072;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ueinZvw8BSZVVICciyLBQ76IlWUNrDaOGonZjMhYdOo=; 
 b=cbtdocghKR9qTOm60MDzJGvLPaaiPXOgGMZnj6IY7dxEzrZ2ckm/NNi6bqkQ93THAGviAVEbBuhyNfnZE28FG5IhwE+53VaUR1emP6fIOAWDTgm5wQPMuIsSQE+BJDeiEDFBIRCa6GSKFk31PZ4+lcWBPooxFVJkp+N44BvYEFo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
 dmarc=pass header.from=<kingxukai@zohomail.com>
Received: by mx.zohomail.com with SMTPS id 1770923069051239.89954668006726;
 Thu, 12 Feb 2026 11:04:29 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 03:03:49 +0800
Message-Id: <20260212190349.537465-7-kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212190349.537465-1-kingxukai@zohomail.com>
References: <20260212190349.537465-1-kingxukai@zohomail.com>
MIME-Version: 1.0
Feedback-ID: rr08011227b97b9abfcc1300cfa1ac747c0000cae9b5019aad536dab7f0dd7bb7231623d081756305cf691ce:zu08011227b22ea93165999f86d6a1b33f000078a3770b4d055e4344f67009560834cbd2a498d823226cb85d:rf0801122d9736b78abb2e5daf6f918f060000cc905790957549dbe26be2785c5e5f11a4a8400a52f84640a56b1038a7106c:ZohoMail
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1770923072; 
 s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
 bh=ueinZvw8BSZVVICciyLBQ76IlWUNrDaOGonZjMhYdOo=;
 b=Pm+NaVVpyHU1uaGh2IRT8nUW26L0Pg4MnP5mgCVDro5jODBfDdO2z1tMzPhoNAdK
 PNAS8XqG5WQe5Am5xGdQ5/pBEZXzrw2k5w25GbT6bRmNVxT+COgA+Pjt8aXqFpoJ8JT
 CdvYFp24FZg2dUu9JHf9pYntlacKHrq8wSFfENrI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com
 header.a=rsa-sha256 header.s=zm2022 header.b=Pm+NaVVp
Subject: [Buildroot] [RESEND: v1 6/6] support/testing: add python-gymnasium
 tests
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

Add a basic runtime test for the python-gymnasium package.
This test verifies the fundamental operations of the library by:
- Importing `gymnasium`.
- Creating a "CartPole-v1" environment.
- Resetting the environment.
- Taking a random action step.
- Closing the environment.

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 DEVELOPERS                                       |  2 ++
 .../tests/package/sample_python_gymnasium.py     |  8 ++++++++
 .../tests/package/test_python_gymnasium.py       | 16 ++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_gymnasium.py
 create mode 100644 support/testing/tests/package/test_python_gymnasium.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d85c2dd56a..b40f39c2b1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3482,6 +3482,8 @@ F:	support/testing/tests/package/sample_python_cloudpickle.py
 F:	support/testing/tests/package/test_python_cloudpickle.py
 F:	support/testing/tests/package/sample_python_farama_notifications.py
 F:	support/testing/tests/package/test_python_farama_notifications.py
+F:	support/testing/tests/package/sample_python_gymnasium.py
+F:	support/testing/tests/package/test_python_gymasium.py
 
 N:	Yair Ben Avraham <yairba@protonmail.com>
 F:	package/casync/
diff --git a/support/testing/tests/package/sample_python_gymnasium.py b/support/testing/tests/package/sample_python_gymnasium.py
new file mode 100644
index 0000000000..42997b2982
--- /dev/null
+++ b/support/testing/tests/package/sample_python_gymnasium.py
@@ -0,0 +1,8 @@
+import gymnasium as gym
+env = gym.make("CartPole-v1")
+
+observation, info = env.reset()
+random_action = env.action_space.sample()
+next_observation, reward, terminated, truncated, info = env.step(random_action)
+
+env.close()
diff --git a/support/testing/tests/package/test_python_gymnasium.py b/support/testing/tests/package/test_python_gymnasium.py
new file mode 100644
index 0000000000..cd437f60b6
--- /dev/null
+++ b/support/testing/tests/package/test_python_gymnasium.py
@@ -0,0 +1,16 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Gymnasium(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_NUMPY=y
+        BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS=y
+        BR2_PACKAGE_PYTHON_CLOUDPICKLE=y
+        BR2_PACKAGE_PYTHON_FARAMA_NOTIFICATIONS=y
+        BR2_PACKAGE_PYTHON_GYMNASIUM=y
+        """
+    sample_scripts = ["tests/package/sample_python_gymnasium.py"]
+    timeout = 20
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
