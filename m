Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F5BCAC597
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 01:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E257814DD;
	Tue, 16 Sep 2025 01:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8ekJIrgrLi4; Tue, 16 Sep 2025 01:04:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3058A81416
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3058A81416;
	Tue, 16 Sep 2025 01:04:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02BF7199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0000D60D72
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRzyrhDQtqSV for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 01:04:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33BFB60D80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33BFB60D80
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33BFB60D80
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:04:12 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-42406e56820so7567465ab.3
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 18:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757984652; x=1758589452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TwXki5vriNwGSMKWizYkOZ64C62/O0IbHrFqXsEQkLk=;
 b=Ng9JO6MU7ze8cnGwpLKmJARUxr609JE75X4eJumVFmG4Q2zdMOAGvlXIR9x7gu8A92
 IgQzrBtdoaUhaW7QA/+HwTS6rp6N3EHUGNQJ1fLUq1PAfIA39eAGHjyJuV2I2DOEccRZ
 CnORH+YUYhrebgCmtv6+q9iI3euM4Do0qbJSJT0nw18otLsnBePCId9BxWiQJYcoqTDe
 Id1tut4N79S2xp/SM66xbkXhqZnlppnC/0Cxvydzp43croewf+inWxzQQ8xtAOfFuUK/
 KLPvPQx/RxD0yY7IxuvkRLrgb3HY3y+VdE6ZsZS9aTGL1gKW0d+zskStUF12IkIYJqBD
 a5bA==
X-Gm-Message-State: AOJu0Yyb4Oj4AOBc5GdcnbZaGPasqbt40luCwxgrwywnRpgHf543X9q4
 IWsZg2ji09fWO2Gr8ZsJrRertwfnn4vMfRzoVfE4UkjLOdGHMu/Z8cTi5alEoA==
X-Gm-Gg: ASbGncsaH9Ew96emvbTkLh5RWcx0GTaX7pOMW9dwG/K2j/pe1N5PUKQaxUWqAjN8/A1
 r6jiu1htnjKsf1wO7nsSMjxWlSWTHvn1do1+fIY0wMTtzvEv0qA2VoVfDxBikZfSX/U3Ps7nQfL
 Fg9IIYTszq+zWJdwk/kcnjcaljjQ6qk11PgxhB9vzQRp78rhMlBjCfJMYVPEX7lm9RtxEg7WlFX
 i61bOksG9WbtDU6k1i37xHTdG4JCojlFOKNWgz2X7tpJKRtG7IsWvBnY83WD6wNc9EyyA3Zh8gH
 9OqaAvRBbx6tU2TA+CRZdlKMfUhpuVsx3VLSEpEH2EtjxZCAXf5UYRstl5CpzBS/okkTFpq9Wmr
 s++4rc5bS1B4OXMeD4suY3QNchOlpVlrbMoOVoKcBaOtbPImuzNSaTPayqyYZYPRNlomPusLr6K
 fNajWii6uc4Ig=
X-Google-Smtp-Source: AGHT+IEHKFqvkSO36sshYfloT1zSBYxRoI/tIx3PrCfrLHTAyrcruM2Vyj89sUYFIDjBZ53lMohtWQ==
X-Received: by 2002:a05:6e02:214f:b0:3f2:a7ef:bd88 with SMTP id
 e9e14a558f8ab-4209d40ff4cmr129502885ab.5.1757984651792; 
 Mon, 15 Sep 2025 18:04:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-51a9bd40fefsm1383443173.71.2025.09.15.18.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 18:04:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 19:04:09 -0600
Message-ID: <20250916010409.2547083-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757984652; x=1758589452; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TwXki5vriNwGSMKWizYkOZ64C62/O0IbHrFqXsEQkLk=;
 b=LO8HES9x2IwfmHNHDMZzPw+ifTQP1RXJqQTH0Npu5MzyhHcNEgLBZiYugblLLOEsbu
 xcSxkF+IaESJehqHimSKh3uPmcK31gcRQI3NNUz+FTI0uLNp75bVq6iec2CyEvUBAU6G
 IWpqSut68dbWbgywkhmskN5+6UqdHYAqT4jh4dtYW7oBp4pFzK1hY9Ldh8bHKoheh8Qo
 HbFum27wCE3bgf7HvtAoB49jqSo3LdfjS1tIPgYBmAcx+G05yPM2xnOwywm+Ru2vGBgA
 QcPZYW7cyplOB9U5mfdQA2KiB2NRxGL+VvRVFEMqGH0wGtbSs3k71P8H0RHHonDfrRY2
 s0cA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LO8HES9x
Subject: [Buildroot] [PATCH 1/1] package/python-typing-extensions: bump to
 version 4.15.0
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
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-typing-extensions/python-typing-extensions.hash    | 4 ++--
 package/python-typing-extensions/python-typing-extensions.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
index c422691dab..c86b6716a8 100644
--- a/package/python-typing-extensions/python-typing-extensions.hash
+++ b/package/python-typing-extensions/python-typing-extensions.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-extensions/json
-md5  da52c877660b1760771ce7553f729c5d  typing_extensions-4.14.1.tar.gz
-sha256  38b39f4aeeab64884ce9f74c94263ef78f3c22467c8724005483154c26648d36  typing_extensions-4.14.1.tar.gz
+md5  079e529d0b271647f3ec2720aee8fc65  typing_extensions-4.15.0.tar.gz
+sha256  0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466  typing_extensions-4.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
index 9ed8b71ff2..d181b973a5 100644
--- a/package/python-typing-extensions/python-typing-extensions.mk
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_EXTENSIONS_VERSION = 4.14.1
+PYTHON_TYPING_EXTENSIONS_VERSION = 4.15.0
 PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
-PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/98/5a/da40306b885cc8c09109dc2e1abd358d5684b1425678151cdaed4731c822
+PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f
 PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
 PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
