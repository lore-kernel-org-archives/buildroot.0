Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775DAFF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 17:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CBEA60EDF;
	Tue, 28 Apr 2026 17:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCdkh8B2v6vJ; Tue, 28 Apr 2026 17:18:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6359960F1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777396736;
	bh=+bXF+icfDxTLLhUCs5qOPek5GBQPsOZm9tMJqYavNfk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=UImvVmHqFwDFwKhNyaY+SOdRqN0TRx+2WOeGdhljREVrT1mdFgn6PAajISkFypMQG
	 IH4+SB41XCrhjOEl2S99ODiS/NJIaILE9rF6NLZQLwpp0Onh4BZo6owxkuvtAz4g8j
	 DUgJowOFsluvpsOZhXK3O7WMOsiqBloHQva2mAZg90+gdLsRZ6Ils3SM9Hbpdo4zwz
	 sjOdx/YpQmdLedsv/YLvksc9ClIKRKuAyaXA4KhitbwqGa0xn23HFlQfprujQZx3TM
	 X6hs5uugYZIscMqavIujgVDZljm2276fguBvA+ML4nmQbWvoGg75QUZKruJ3YeiwQX
	 DnfPFz3eXImqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6359960F1E;
	Tue, 28 Apr 2026 17:18:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EF58231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59AF040745
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-Jxvnm3F99m for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 17:18:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=frcomdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 85AB240625
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85AB240625
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85AB240625
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:18:54 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id
 af79cd13be357-8d4f78fc9f6so1272645185a.3
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 10:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777396733; x=1778001533;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=al9yIZotDbRvTQy65odtm7F5fKActFXhV03jYY5pUEk=;
 b=pCArysEpV/Ug0hA2ZDaA0pHKolQD+JNLFKGGZzFGu9JWIQuJNrS/rAX+E9kgQ15EEQ
 OooFuq3UxyUCv6w6xcPPYBp8Q25i/OqTffts/aCNaCsvRgCa0JPuxxlx5RmY6NhbwzV9
 Sl845+C0RSDWqBhz8QOxi1pT1/0zMybW+KtJVhqqF5EYNzaZt0v6DIQhwoHIQAzMPH8b
 Em/vz3iUjipAewaN9W3lc/Zrk413DN+tsYdH2+YiVPLfIc6mBy7krD/9e7lG9lqUVz+G
 XOgGYlqJA91ICMc7/S5SFy87Ip+i+JNzBmNcYMBZHW/DCBj+V39GOjR2oIFkZPG4wbRY
 5NAQ==
X-Gm-Message-State: AOJu0Yy+joKmjd4bjXjbod8+I4wdsDo4BMEIly8Fu/HJaSHpxYa5W0HW
 sZyZeLj47Kpt/Y0UsiF8zvfB7vzJRi9BQli/xFYxeXE8WZG3fjR8YQcQBPU2lfTUrv9Aw91I
X-Gm-Gg: AeBDieus03Kys3K2B9INuArDZzal3Gey0SXsSClb9pyYLuUYBoBO415iGsz6eU0LZeS
 KlGd3TjcA/XelryZAhNrw91P1fb7LvTXoNt1ZaVNTa6n/lyp4sBzPRKodd4g6qlMmhIFYLD6gnK
 iUWMkj6CrZilu6wRwzI8EeyW0/QnaxH2WajZtlrXKZlqNjUNzOPB9Z/dGuVlcgp3xvrWrl15akd
 kqM54MtWO7b0E+EiZ1bgIuor9gKZ2pwuVg4IBsm8q/csmGjvutKCwVm0ffQciLhalqMMfLFPNI2
 20vRFkhWuAFVQ5jurANbEhjp2i4cRGn1RvLXcDGgtDOd3YoyblQHFEcukSnrCS50FUgdPN4RIk+
 kXAmeqSj4BEiTeVjaJB+nNvIwaXjKLuFWRaL8l7N+POmb0qzOdpZxVJvfqBJtFwqVSdPXYsbfDh
 vbTca6zj9y777YqpVzRp8zUnguMJXLFR9d0xwnGLBs2Wp/+BX8vEjqMyJNozro5BByy5npcT2XI
 ui1v8BZTgBpfYRGLObh
X-Received: by 2002:a05:620a:f04:b0:8cf:d804:456a with SMTP id
 af79cd13be357-8f7d7833d75mr517015385a.20.1777396733065; 
 Tue, 28 Apr 2026 10:18:53 -0700 (PDT)
Received: from precialexwin
 (bras-base-mtrlpq0313w-grc-01-76-65-67-233.dsl.bell.ca. [76.65.67.233])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8f7c48c7625sm247576085a.2.2026.04.28.10.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 10:18:52 -0700 (PDT)
From: Alexandre Ondet <frcomdev@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 13:18:44 -0400
Message-ID: <20260428171844.2596-1-frcomdev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777396733; x=1778001533; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=al9yIZotDbRvTQy65odtm7F5fKActFXhV03jYY5pUEk=;
 b=IWsdonBkzT9PHlCsxwewPmFPgUdAWUaKZpzmcJYiHQs0IOSuP1g0XIVJRib/hw425I
 AC4/qLtzAwYVlydb9b1IktcFAtiwmJzoQiJZJ8Lmwdl6j86vu5gIOqOm8gPAu/8IpuO4
 XGmeDxVsnMuGEBhuBlBt3Xf411Wb03V6uavuiubxAatrfvt7TDx3rQaI5pBVC0h5u/rp
 L2bStjjtuYO40yL7eg6UHKCoYFROJbvImt5UC89R3EnO9lxeRTW6wHU5QgVaHsbfG4MU
 HYR0Q4IznMJGopOhhlAoLjI+x1gP/M3n4GkLLwHvrT8w8JKrLB3vH/ILOlTmD6d/kNYe
 PaUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=IWsdonBk
Subject: [Buildroot] [PATCH 03/13] package/python-fpdf2: new package
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
Cc: Alexandre Ondet <frcomdev@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexandre Ondet <frcomdev@gmail.com>
---
 package/Config.in                      |  1 +
 package/python-fpdf2/Config.in         |  6 ++++++
 package/python-fpdf2/python-fpdf2.hash |  3 +++
 package/python-fpdf2/python-fpdf2.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-fpdf2/Config.in
 create mode 100644 package/python-fpdf2/python-fpdf2.hash
 create mode 100644 package/python-fpdf2/python-fpdf2.mk

diff --git a/package/Config.in b/package/Config.in
index 1a53589155..c6f809b31d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1126,6 +1126,7 @@ menu "External python modules"
 	source "package/python-flask-sqlalchemy/Config.in"
 	source "package/python-flask-wtf/Config.in"
 	source "package/python-flatbuffers/Config.in"
+	source "package/python-fpdf2/Config.in"
 	source "package/python-flup/Config.in"
 	source "package/python-fonttools/Config.in"
 	source "package/python-frozenlist/Config.in"
diff --git a/package/python-fpdf2/Config.in b/package/python-fpdf2/Config.in
new file mode 100644
index 0000000000..e10e141110
--- /dev/null
+++ b/package/python-fpdf2/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_FPDF2
+	bool "python-fpdf2"
+	help
+	  Simple and fast PDF generation for Python.
+
+	  https://pypi.org/project/fpdf2/
\ No newline at end of file
diff --git a/package/python-fpdf2/python-fpdf2.hash b/package/python-fpdf2/python-fpdf2.hash
new file mode 100644
index 0000000000..2f1cfa6d21
--- /dev/null
+++ b/package/python-fpdf2/python-fpdf2.hash
@@ -0,0 +1,3 @@
+# From https://pypi.org/pypi/fpdf2/2.8.7/json
+sha256  7060ccee5a9c7ab0a271fb765a36a23639f83ef8996c34e3d46af0a17ede57f9  fpdf2-2.8.7.tar.gz
+sha256  f97bc4bb9b7ae8a653941073678b5c7775e8de44a01c3bcc21e7cdc148b90e61  LICENSE
\ No newline at end of file
diff --git a/package/python-fpdf2/python-fpdf2.mk b/package/python-fpdf2/python-fpdf2.mk
new file mode 100644
index 0000000000..97eed64097
--- /dev/null
+++ b/package/python-fpdf2/python-fpdf2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-fpdf2
+#
+################################################################################
+
+PYTHON_FPDF2_VERSION = 2.8.7
+PYTHON_FPDF2_SOURCE = fpdf2-$(PYTHON_FPDF2_VERSION).tar.gz
+PYTHON_FPDF2_SITE = https://files.pythonhosted.org/packages/source/f/fpdf2
+PYTHON_FPDF2_SETUP_TYPE = setuptools
+PYTHON_FPDF2_LICENSE = LGPL-3.0+
+PYTHON_FPDF2_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
\ No newline at end of file
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
