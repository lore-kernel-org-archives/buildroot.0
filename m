Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC50BC61DBD
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 15:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AE9A40541;
	Wed, 26 Aug 2026 15:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LV6d-XuzuuFM; Wed, 26 Aug 2026 15:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787758067;
	bh=SPiib0ahfY9kYbTelIRrLc5EZdahAktVil5aI/ZdWcU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ej2IgkR2ImiC/eOD29VMMO7F79F5adBkikigFpH8BztxnhxSYn/hhNQhuHoQXLs8S
	 R7MPonCYvjpZbp6QKUVg44DmwSOVzo54wNTEC9nRe0koTzunkktLLrtgpdnCnB/xcd
	 iaOETyrfpVct4wSaWpbUZIRzP+mW714AUjvZgL2YFpAbOsNZhlDG0NBqs6E/7XY5mv
	 r7yiwPqKRk+9b386hec5DDW5GDHd1rzrcW0QH/HiJZedYqXk2A98M5x8l/DhV5bEjs
	 dN0yZcBMAMq5Qb4cGzvo8FnYMiIbk5SiLEud4ZMoy+vcjnk5dVCRSVpVe6xoJU8fex
	 ncwQeWP82YqeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEE9040521;
	Wed, 26 Aug 2026 15:27:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 807AF118
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E2BC6062B
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1KltoQVaBHu for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 15:27:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A945605EC
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 15:27:42 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c1712a04ddaso165826366b.2
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 08:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787758061; x=1788362861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=n9LxK/bD1ML1YU8do4FGdyR763fe9GCIQmEqkuanHTM=;
 b=YD1yjzWT1qfAKXmQBntNQ5zKvml7fLgwAenJjiDJkqlL3R3eqNzCrrNiVd0d9lsEiR
 pmWyQ+JfBzTup8SNdBBdulL5qgiEqNrEOKNmVsI6aE/8WGALFqNR43lcBy7OfNA9cDQv
 L2DxMWFzbUeGFuY4ZFkKqENmSvo4uG3Ughc+sm4tYMsvl7w5a35pf1Au8FQo/M9FMtVn
 rZH87OavrfJjpmB3m5C5C8YF6L8PLHQuhpZMIWP7TKXI/bI/Z/DfBGIbv4JfwxQFFVcT
 ZTeQb3Et1+qE30ql5uTKmbvFvMrF3ARbIIzIZa7Svxeg956Ed6D3eTa7HgU3oT3rxM4M
 aKQQ==
X-Gm-Message-State: AFuF++kBt/Xm7MT3MpFNrIMHJoMt517IQJC/2GKmmZU2OWqNzvjYNXFf
 yKJNz33gZmBnTUu8TDJP092x/sto5hGvTeCvf2bHvth+XHgXT/KQBsljebvqiDcqT81VABa358H
 BvAm6xfM=
X-Gm-Gg: AR+sD13OYSzu2nQXsdZAtU3teYi4h86wpxn7KPSySI4DBtenckikHrbu92QuLz7rQbw
 4q+VxOpXs2YyrMjWVUiS9Qd6Pv5iGgwqd5jseQb21JAOGs9EIP3cQgRFNE3ttoLGe/dtmz1GpZg
 sMrGyJGjRiiXP9sGUQzdacM9eFQZheHkjhwg0C+IYsDM693yh5eK6z2m9/qKn89QSUxIvoR1Xzu
 6aqoqSLwdI6O5+V7mix8WT/iII/YFiwttPObFGSG9IOsZGYJIatBM224UVHALAcwgPShjJsKOyD
 Vdj7iC1AuTYj4S/+ND/dnJfVvgHjF/Qcaj0/EiXVRVIX3TAaNEUMLL+P5AR7fL6WAsOBn92g00n
 uoA4oAQyFOoNz92MLUpaoLt0+S2x6lFF8mnSb/mjPY1645WF+LFlRAIe0pGyBiTHjhMYlxvu2Hp
 3qCuJRlNo9lxxpPqJrqs43FxdfYvFFoXVSh4/lnAOj6W68i0xVS1yKyzMU/o2IPV/D+zMIvLw2D
 gDSp6BeS3MdX4Sjz3/kZNkS69SOx6O0sADMbwS+F6V6FWW1/9k=
X-Received: by 2002:a17:907:1c86:b0:c20:edda:ef5b with SMTP id
 a640c23a62f3a-c250c595d62mr851328666b.14.1787758060818; 
 Wed, 26 Aug 2026 08:27:40 -0700 (PDT)
Received: from P-NTS-Evian
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a9ec343sm403804666b.57.2026.08.26.08.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 08:27:40 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed, 26 Aug 2026 17:27:31 +0200
Message-ID: <20260826152732.3556127-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826152732.3556127-1-romain.naour@smile.fr>
References: <20260826152732.3556127-1-romain.naour@smile.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] support/testing: TestFirewalld{Systemd,
 SysVInit}: fix expected ouput
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Firewalld v2.4.3 [1] firewall-cmd added a new log line while
waiting for dbus connection [2].

  [BRTEST# firewall-cmd --state
  Waiting on dbus connection...
  running

The line "Waiting on dbus connection..." is not always printed by
firewall-cmd, so we have to search explicitely for the expected
string to get a reproducible test result.

Update both TestFirewalld accordingly.

This change is required to fix:
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152329 (TestFirewalldSysVInit)
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152332 (TestFirewalldSystemd)

[1] 380dd8a348dc7c5edf2b187245b8d4e70a3d96c2
[2] https://github.com/firewalld/firewalld/commit/5e1c37c9664f57d81236ba999f13e60bf753ba45

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_firewalld.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_firewalld.py b/support/testing/tests/package/test_firewalld.py
index 9a1bd41f62..49a553947a 100644
--- a/support/testing/tests/package/test_firewalld.py
+++ b/support/testing/tests/package/test_firewalld.py
@@ -59,7 +59,10 @@ class TestFirewalldSystemd(infra.basetest.BRTest):
 
         cmd = "firewall-cmd --state"
         output, exit_code = self.emulator.run(cmd, timeout=10)
-        self.assertIn("running", output[0])
+        # Ignore any unexpected log from firewall-cmd
+        # like "Waiting on dbus connection..."
+        expected_line = next(ln for ln in output if ln.strip().startswith('running'))
+        self.assertIn("running", expected_line)
         self.assertEqual(exit_code, 0)
 
 
@@ -104,5 +107,8 @@ class TestFirewalldSysVInit(infra.basetest.BRTest):
         self.emulator.login(timeout=120)
         cmd = "firewall-cmd --state"
         output, exit_code = self.emulator.run(cmd, timeout=10)
-        self.assertIn("running", output[0])
+        # Ignore any unexpected log from firewall-cmd
+        # like "Waiting on dbus connection..."
+        expected_line = next(ln for ln in output if ln.strip().startswith('running'))
+        self.assertIn("running", expected_line)
         self.assertEqual(exit_code, 0)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
