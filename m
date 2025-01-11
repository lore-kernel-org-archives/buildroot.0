Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557D8E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26D1581133;
	Sat, 11 Jan 2025 15:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rh2sCA42bRHN; Sat, 11 Jan 2025 15:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21059810F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21059810F7;
	Sat, 11 Jan 2025 15:24:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ACF2950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BAE9606E5
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l49YRR2EHIH4 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:24:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5FA1160741
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FA1160741
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FA1160741
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:24:25 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3a78b39034dso9284155ab.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 07:24:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736609065; x=1737213865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oOprFIYK0E7WcaTXSn5sNzqN7/uERXhb486W09Q21mk=;
 b=vvUK5HJ/BLTaZPr5GRcdvNcFLBQVg/Q7bPHO0SXj1SCJ/Ba8KswMlVQwHBv8VK4M+Q
 2OnlBEcJoatSzkvdrNXWcVSX3rSvOkMny3EKTS/Jcl8qmjo8raYtGL6r1JKUFxJiGVYM
 vzDvpMwbOZOOIecmlcSllOSkaIWkrjZJcyl6vPtoJe1vGRlakInZ9Hd0sAI+ehMwv4UF
 76xe6tRCFgOjcomONTngweihIM/qWKHmIf+yf7RoPghoQ/PWJFA4pFyhcKrijDOuSXao
 Txq+wSdPzLyRz076hmuaD1u8awows1qgTwTeF3HpEWvMdET7YXoPsDiuY075l7El9aa4
 WWQw==
X-Gm-Message-State: AOJu0YwnqoDGDbarOrRMCGm+hlgZCdcj5BOTeXLw4g+xkrQ3HFmF66bu
 P7YAlCBVbBV9XXD90vl3MFACOez1VKi0cU79e2b7g7l86TirSWTtZRro3d7RfWU=
X-Gm-Gg: ASbGnct3H3nzw+m8Zrs8yz47wxfUTVpGueTj9gNRD/B5Bg2UYpTEL/8FhXVmggZZ/jW
 xlRY+e5tgKgoc1EPeoA06hMIVGaGxjcuph/ygTnMpaU13l/txmjYvGE1cKw7N09v1De5O9vtFh9
 i8fv8JyftkrsY4zRYLIlTT5OX+2qMhcf+fEKa/S7JTaoNPu2msfunwn9Gx/RyblPrwJSU82TE9e
 /ykHIG6yLHXmtoQvU+iubQaja1UPHj0m7HGRX6bkeizYg6YrslxM6OpZoOMpgR8dKsze3tDej12
 7NeR8t46N/WWXGDl3yjiG3Ol1ZmmshY=
X-Google-Smtp-Source: AGHT+IHOnidlq+IOl1eZqrF5BxhrFmDONwvf4SuQhe2km9Wlwsj4p7w7+SYmVbeLu0VsxTa/p4tAsg==
X-Received: by 2002:a05:6e02:160e:b0:3a7:c5b1:a55f with SMTP id
 e9e14a558f8ab-3ce3a893945mr109574815ab.0.1736609064706; 
 Sat, 11 Jan 2025 07:24:24 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4adb7e45sm16265765ab.27.2025.01.11.07.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 07:24:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 08:24:22 -0700
Message-Id: <20250111152422.2837827-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736609065; x=1737213865; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oOprFIYK0E7WcaTXSn5sNzqN7/uERXhb486W09Q21mk=;
 b=mKty2EIMdH+nKjeYPfZGQ4+Oe/b80mLKimnrRQTEuJoeYLWpW336ElG2JKKHF5mR62
 ahcT3QkhI+K4N879oB+TkvtuTOdu8Y3VQLUdvBPn2nafHyisV7B25JOhERMtAaOdGzPD
 aVX8TVBvtAtNW6/Zk1L7vNoY99EM225nGvRa/agqE49sxd9zGewmp/9UtC61y3js9oCV
 yK5nOaaQCfxng7ufth7ZJ1dPi4zwOb9hWyG8hFcEzJ/AIpgXFM6SNEAzh6JpYWKZvvrH
 Ur4oRCQhzUJt2gtiCRPRT9mTIdDgifQjFYIZ6kIBMoXaK81CB9WtxceTGv/IcOF5SMTk
 DT9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mKty2EIM
Subject: [Buildroot] [PATCH 1/1] package/python-pyaml: bump to version 25.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyaml/python-pyaml.hash | 4 ++--
 package/python-pyaml/python-pyaml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyaml/python-pyaml.hash b/package/python-pyaml/python-pyaml.hash
index 06e99448d0..29863ed502 100644
--- a/package/python-pyaml/python-pyaml.hash
+++ b/package/python-pyaml/python-pyaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyaml/json
-md5  1301f53ad68626ac295c2663315b1804  pyaml-24.9.0.tar.gz
-sha256  e78dee8b0d4fed56bb9fa11a8a7858e6fade1ec70a9a122cee6736efac3e69b5  pyaml-24.9.0.tar.gz
+md5  ce3505d0331fdfc05c98f0a514308063  pyaml-25.1.0.tar.gz
+sha256  33a93ac49218f57e020b81e280d2706cea554ac5a76445ac79add760d019c709  pyaml-25.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dc1342cc1cb49e24c1c9e8a495acc9625ce2e04146c116279af0ab0949cd829c  COPYING
diff --git a/package/python-pyaml/python-pyaml.mk b/package/python-pyaml/python-pyaml.mk
index e908aa089a..06e3871b5a 100644
--- a/package/python-pyaml/python-pyaml.mk
+++ b/package/python-pyaml/python-pyaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYAML_VERSION = 24.9.0
+PYTHON_PYAML_VERSION = 25.1.0
 PYTHON_PYAML_SOURCE = pyaml-$(PYTHON_PYAML_VERSION).tar.gz
-PYTHON_PYAML_SITE = https://files.pythonhosted.org/packages/fd/a6/5b51160ff7ce60b0c60ec825359c0e818b0ce4a2504fa3dd1470f42f9b10
+PYTHON_PYAML_SITE = https://files.pythonhosted.org/packages/f4/06/04b9c1907c13dc81729a9c6b4f42eab47baab7a8738ed5d2683eac215ad0
 PYTHON_PYAML_SETUP_TYPE = setuptools
 PYTHON_PYAML_LICENSE = WTFPL
 PYTHON_PYAML_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
