Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC297E9D3E3
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 14:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E44682735;
	Wed,  4 Feb 2026 14:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ep_okLRU8rh3; Wed,  4 Feb 2026 14:24:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A158A8276E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770215064;
	bh=waNAfiEsaO5PXGfBdAaZr8suK0qUAxgDewsYTfJMC9M=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=loSi8+y5U0NCeCCHYawS2SUgw8LmTDWi/EwhqYyarGYBt4162vdFkb8gUAipHtI3n
	 31Yza9jXzXBTbA2td08Gnb4124abRjuTgb8w9naQpSQZRU5qCRjpTJn6HR3KRFdmQJ
	 D3z0vN/qAisIujvah/zdSS2UkTDQD7XvLxkIf27nJxeVMYvfqy5eIdpLaZDI0N4ZMa
	 wEbdJHRi1syUIq2B+b0oBHrIdwbtSyB+COwDhkJzf71nQD2DiUboNO3RcP1ybReGxH
	 S58aA0Pog0R3IwcdhciSQF4R3BlARBamKScu5bBiNDa9cKTXu7IWHyzSlUS0QtIqEu
	 /ZUz4eS3Iv6Bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A158A8276E;
	Wed,  4 Feb 2026 14:24:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2548B173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 065718276E
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FO2ponvVA64I for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 14:24:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.92;
 helo=sender4-pp-o92.zoho.com; envelope-from=kingxukai@zohomail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B27F482735
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B27F482735
Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com
 [136.143.188.92])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B27F482735
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:24:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770215034; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kdi5Nas2NNhgNo4XLifwKG0J6lsj2y6z1+aROMkz9mPHU9nRebIRGFq6YH1VuIDo6NpKXGDJa6xR9/J8MbdGRZtvZZbLSxQ1E4Btjqh3Z30JcxL3AwGjWtjqB6KExXzzGjfnns2ywNZ0OBPC2assFL6DoofA9csScCIOBpN8JTI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770215034;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ueinZvw8BSZVVICciyLBQ76IlWUNrDaOGonZjMhYdOo=; 
 b=PWHmKdSU7tZgm5Smma/7rV9uP63d5Dwzd3KGehMP2ljNjHcleMGlzzK5tlThn+qKNZaWSwleuErsznnp2J1buQqGARaC7e0LNEhQHZYbcwVJVJCEpiHhpSaGlOrlBKU8rk6uEgIZ/dGFcmluVfMMz0A1PrustlEPKtvbjyRupBI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
 dmarc=pass header.from=<kingxukai@zohomail.com>
Received: by mx.zohomail.com with SMTPS id 1770215032442531.6890509938983;
 Wed, 4 Feb 2026 06:23:52 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 22:23:09 +0800
Message-Id: <20260204142309.506287-7-kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260204142309.506287-1-kingxukai@zohomail.com>
References: <20260204142309.506287-1-kingxukai@zohomail.com>
MIME-Version: 1.0
Feedback-ID: rr08011227ed1f6d8fc9f31bfa088732d10000b0f4e28571e8b22e96cc5d7879f6269a1909f62cea89170362:zu08011227267f4d87f2fe92982365d31b00006e35f934f7825cc55cfc8ba3b8e5165eb3d70d4b9ceefa4f9b:rf0801122c9ce9336e0adb074271f0010d00006b2c2dfb7ee3e023eb851745c9a5561b08917336b666a131c87a98e41130:ZohoMail
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1770215034; 
 s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
 bh=ueinZvw8BSZVVICciyLBQ76IlWUNrDaOGonZjMhYdOo=;
 b=KeGMWjxHp2KouY5KX/4wAz+8ASaQxtkMnsP+7Lq8A3nKLFkXRO71czwnYe2Z8wqi
 NAJjrf1VGncR1zDfZFmSRKHcpBqtJJnk9ONtXbj7oj+MWY2al3y5mLD8JqqQV0TDqsg
 sxfxfOtnraQFQenmMCAymFrTVRPKFeMuAvj/dMRY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com
 header.a=rsa-sha256 header.s=zm2022 header.b=KeGMWjxH
Subject: [Buildroot] [v1 6/6] support/testing: add python-gymnasium tests
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
