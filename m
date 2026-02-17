Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0213E9A04C
	for <buildroot@archiver.kernel.org>; Tue, 17 Feb 2026 21:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 444526065C;
	Tue, 17 Feb 2026 21:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvxV1uiLWZmB; Tue, 17 Feb 2026 21:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35E016065E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771364898;
	bh=6FOFHCSefdF/0cmnPLex19rXkIVGSK3r1k4meRfsmU8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=DNOahty13HAosizaEZ78C6gVeVn7YTrrLJTGwS0383FCvKGpocN/827j48IbPfAw1
	 SlamvpIIrXjdKsqIF9QfRc13EukDr3oA1TVm5V4Y230ZpEj6sN3cs/vP2TtdDsPHu3
	 yGV1UTmR/82i5Wtd6fxSAVc2FBj2igGD2LYuY6Oyus9EAPigrPAtH02z83pYocHRsQ
	 b/nHOgmIOXURCkqng7DuXHrewYx5fkX/yILs7w5v0wv2hsygxNqZ9G7Yskspnzc3M9
	 DXbJ7a3y+FFnB379BJp+tMC2bIW04O1cZJtw9P6kP+f935a6KHbkT9n3I3TdLY2Bx9
	 f+PiAcguPUKMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35E016065E;
	Tue, 17 Feb 2026 21:48:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F842270
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 21:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60EB360659
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 21:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lndubIBL6NA5 for <buildroot@buildroot.org>;
 Tue, 17 Feb 2026 21:48:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D35626065C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D35626065C
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D35626065C
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 21:48:15 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-7d19bfe1190so3440361a34.1
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 13:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771364894; x=1771969694;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x9DGNbQjBFsF8UTnj1fBgujmj4SyU/m9vKacUnDdczg=;
 b=bsnLZTbsuOiYSq8zaay9hy4+DuWe8WaeYtJRN0ZsdWkg2KxGzxcByI92LjGbg8zvW9
 wGorMGU64n/x/fRJUEvpUZOEpVQLNE9GW7U6wDlJeadW5FVznJUMybVi6BQ83ISDk74P
 DHz8MfwGk1XG7LanGcUvvwS8GlKxNo9trBvApc/Mnk34AVPYPQDWJbQZ36hsa/jkjhk5
 YULXXvFdzCpi9LqQAz/PJqMnsDQhwWMvcYryV8UXiA4R1yjQ/mb9Hl6aFN5axYba5g8A
 fjbqB65+lyZ7+jTotNJRjIPhw6wFpEVirhkY5h94wEJ64vtgCORX4o4ZCJfstz3+l1gn
 EvMg==
X-Gm-Message-State: AOJu0Yye1qWsKveL3IuFR71hX30UDksqyqP+uUBN2mAihFDP50OGLgZ+
 3XN9Lokbndes7cDupvvB0sKzC0AZ1BXXauf9M/SqzmjNdKBpeYvgx21sKnEJSbo8
X-Gm-Gg: AZuq6aIykPfc72D3tGvbAhipZJuBSo9c9Hpo9yMvqMp7wxy/aA6pjgBRuCp8hWjolSv
 UZjSjGeF/KsgE8jdxnOOUYLxCHdEfPQWYxB7DNYHFNfI1cpdB3om2RH04fVe1pl1xKBbOOg8kxO
 PWEBmf0GveIGHxPKmTkWMC8KTh0D36pLh9uEC9057A1INAgaMSUeergq3Lsx2j8C4jPpc4jEC3V
 f9nlhtRPSdUTQkQFdV32bsjDvaOQUcVCBjYlpupgg6lTxaFMBldcbzhjipkdSuK5JmOuKsYkJ/j
 VcywLNr957t8rGw899pLdMtluJBtfM+YxSClIitx+VFQDLKZJ6bzsk7tj3dvRdE20AKq6U3RH9G
 lHpvrGm/WRycVfrPXdDSmEOAS+6r5hVEfs9IooNYwxus90jQ0GJcHq6PgSG842Vi5anpwXH5BUQ
 GO2g5pi/x5E7/oviaBGY4vdaJhmdtRhl4VrFmOhkp2+rxRmdY9ai1mZAyv9L8RVhDjc0SQrHFE1
 Ebo6jfEc4ZkhRhlo1p4AM2KIP9D3xBeI0KZEM8dlijbjCQC+nToilgCWl0CcvQ=
X-Received: by 2002:a05:6820:4c10:b0:676:6c3c:a1eb with SMTP id
 006d021491bc7-67768fb3efamr7199190eaf.59.1771364894567; 
 Tue, 17 Feb 2026 13:48:14 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-26.hlrn.qwest.net.
 [71.218.105.26]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-674758eb709sm11637249eaf.12.2026.02.17.13.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 13:48:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Feb 2026 14:48:12 -0700
Message-ID: <20260217214812.4111360-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771364894; x=1771969694; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x9DGNbQjBFsF8UTnj1fBgujmj4SyU/m9vKacUnDdczg=;
 b=ADpnOtu+WDpRq/asTCpdT2cu5MohPGdpS4eXut1M/6stu4jEvXPQC+PeugYCeGA5Ll
 ljNgIXzJPZtrfNDnpOl7OUGLQZEj8FL/gpFHUXm8m3c3ifoF30LZ8rkNxHHm5LaQ/zo2
 7p03OIBkBDN5X7aIxPr/U9PXu376PGnLEjPGPEsItTfhQd45H2SYCtIbBOk8HIwj0W6o
 BQhoazXrS/FKzUJRVFVal2eAARb53Tab8T21A3/v2gSy73gm8krEt3m0QlytFNYrIn3B
 T8IjkGWbAb3nR6po3D/dI56K0ozKOntOiQq2X/PHHw3JOq+5g0xRkMe4UUzvvjhjuJol
 rfUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ADpnOtu+
Subject: [Buildroot] [PATCH 1/1] package/python-nats-py: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                          |  1 +
 package/python-nats-py/Config.in           |  6 ++++++
 package/python-nats-py/python-nats-py.hash |  3 +++
 package/python-nats-py/python-nats-py.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/python-nats-py/Config.in
 create mode 100644 package/python-nats-py/python-nats-py.hash
 create mode 100644 package/python-nats-py/python-nats-py.mk

diff --git a/package/Config.in b/package/Config.in
index 371a1c33e1..65d57bb052 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1247,6 +1247,7 @@ menu "External python modules"
 	source "package/python-mwscrape2slob/Config.in"
 	source "package/python-mypy/Config.in"
 	source "package/python-mypy-extensions/Config.in"
+	source "package/python-nats-py/Config.in"
 	source "package/python-nested-dict/Config.in"
 	source "package/python-netaddr/Config.in"
 	source "package/python-netifaces/Config.in"
diff --git a/package/python-nats-py/Config.in b/package/python-nats-py/Config.in
new file mode 100644
index 0000000000..cab8bb8bd2
--- /dev/null
+++ b/package/python-nats-py/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_NATS_PY
+	bool "python-nats-py"
+	help
+	  NATS client for Python.
+
+	  https://github.com/nats-io/nats.py
diff --git a/package/python-nats-py/python-nats-py.hash b/package/python-nats-py/python-nats-py.hash
new file mode 100644
index 0000000000..9ba7d91944
--- /dev/null
+++ b/package/python-nats-py/python-nats-py.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/nats-py/json
+md5  445318ae9bded9c45e54fe9895544133  nats_py-2.13.1.tar.gz
+sha256  68a0afe018bdaa12740e0ae8c5a94e1937126d4901ae656afc382e2b3ab40005  nats_py-2.13.1.tar.gz
diff --git a/package/python-nats-py/python-nats-py.mk b/package/python-nats-py/python-nats-py.mk
new file mode 100644
index 0000000000..c89304f60b
--- /dev/null
+++ b/package/python-nats-py/python-nats-py.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-nats-py
+#
+################################################################################
+
+PYTHON_NATS_PY_VERSION = 2.13.1
+PYTHON_NATS_PY_SOURCE = nats_py-$(PYTHON_NATS_PY_VERSION).tar.gz
+PYTHON_NATS_PY_SITE = https://files.pythonhosted.org/packages/c2/70/e08fa8c2c15c9cc458bdf121019df1b9101e32602a408d94953fe1246300
+PYTHON_NATS_PY_SETUP_TYPE = setuptools
+PYTHON_NATS_PY_LICENSE = Apache-2.0
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
