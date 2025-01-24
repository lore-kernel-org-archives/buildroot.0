Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D228BC0218B
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 19:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 725EC41323;
	Fri, 24 Jan 2025 19:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L2GU2to38jD3; Fri, 24 Jan 2025 19:10:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FBFF413CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FBFF413CA;
	Fri, 24 Jan 2025 19:10:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CA09A941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0B1E7048D
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrifmUCA_-BH for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 19:10:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A88947049C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A88947049C
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A88947049C
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:10:45 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3ce7a77e5a1so6932515ab.0
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 11:10:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737745844; x=1738350644;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OOSc8eaoA5CCfbGK0TRRHR18X/wQfFGp3BvOCXGEU8w=;
 b=PpscI8apsfi6WyFkoYm68ieMbOi48NgBpucHwhIcs6EgASMpzySYZ88RRyDCbRQySw
 ka2K8yND6qZ/XChAXtZ8PGssrEzjED1ufvqe+5kZvuHb+70n1DMm9xC2+aNbXuOsx9Qk
 +tEE0MqEB9fBPJixwOSgc6iT7Xs+KTjqFS1tYFvjsKlTzTz8ErXrgDZtx3eToNz667CC
 udYGF9RVIx/UesJ+OsxvxDvTjEUCq00RtxUJ7StN59TVUNzIB2MYNzBKNLaQHH+WYNGx
 suBwcVjbdTk2erpfFfGLUhXP8FurP7U4J+kUX7GQzFqZekGYiRBhPt2Q96Z0iI+AxzgG
 +NHQ==
X-Gm-Message-State: AOJu0YwvwHcAyoHB+AU7SXe1Vt3vbhypQiTszTPhtkeBhsaI2HPF/YR7
 A0zmniHuMLuMMKGX70dEXdqv4s8vQavLY3vmm7jCCPzR1ELhlknVTrG/UYGj
X-Gm-Gg: ASbGncthHQ5O8OGLZcOL+Df9OzZ6noARsjx48ABnPcUUlAolWGTfYJ3jAkXr1h6Fpxb
 4xaaKgYQ4bpG1/HS+ggPENcEqWhDznOKlDizJ6RVGHqi6EBntunsiII7c4sOxGTlUEmsIvcZh+I
 /ysu9/aG81PgR1p+L4M5jwaWmwqn8MSlPd8RemsRSbw64QliNlprR9MbZZdb1TUP23GdCvnHk57
 hZWlIgYmwAiEnlcJYb429sd2mc1yGsc7bHrM92X9C2yrvWrhy97BVTqtaymr9DhTAF0MCsmQwiT
 4OeoxyEx3+uBvOy97idJHf/BCkkProb6tBgZM3E/j5L+hbFY50pMEMA=
X-Google-Smtp-Source: AGHT+IFmGOkh2jkNukjsFnr1zKr37maVeOgqMlvF51Od3EHNhRlSQh/A2zWUj7Qg/GQsn0CWUMiopg==
X-Received: by 2002:a05:6e02:1a67:b0:3a7:87f2:b010 with SMTP id
 e9e14a558f8ab-3cf743ab4fcmr230521015ab.5.1737745844218; 
 Fri, 24 Jan 2025 11:10:44 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da03992sm792488173.17.2025.01.24.11.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 11:10:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 12:10:41 -0700
Message-Id: <20250124191041.3805712-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737745844; x=1738350644; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OOSc8eaoA5CCfbGK0TRRHR18X/wQfFGp3BvOCXGEU8w=;
 b=SLajM5Hy7BvdrIjQIItAIvYORtujvP/HWdmhnNai6PHqC9cWurqck8sgZIzYsIGiiL
 /tJH7hKbZz+TczQsJXjmCBIOcHXGwBcuRZdjhtP8modJYBd7Rsqo8eS4rHPG9LatZtbK
 KajLdA+PbVrb/zxMMumbJGPOquJHVMM96S8Niej95Ki2FELKy2CiuVJ9z4y/GfoOTyvt
 GFgHxTtIMgK20l0i8wdV1AlZd3z7tw46bcuuc6vVUkBowX6Y51WVqFqKySTM+WbEmbTa
 uOLX1TGdQoZnVb97Xd70gkWea7E2AXFPDRubRyvOuQbmyBtsfh61VpcN+3imK+ak+B+i
 E2Mw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SLajM5Hy
Subject: [Buildroot] [PATCH 1/1] package/python-grpcio-reflection: bump to
 version 1.70.0
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
 .../python-grpcio-reflection/python-grpcio-reflection.hash    | 4 ++--
 package/python-grpcio-reflection/python-grpcio-reflection.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.hash b/package/python-grpcio-reflection/python-grpcio-reflection.hash
index afd3e50ab2..badabd1926 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.hash
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio-reflection/json
-md5  f1b2d22885a2a70fbcc499211059e2be  grpcio_reflection-1.69.0.tar.gz
-sha256  3474aaedfb10d8da5503135a2fb9fbb4e1f72044ad7ee2d0bf22090934e80908  grpcio_reflection-1.69.0.tar.gz
+md5  4ae2aa3781881acd8df23793965407e4  grpcio_reflection-1.70.0.tar.gz
+sha256  af46ce13e57fd7602deaef5b1d1903f6644f8982cc00f62fa9fa5b928acf6a49  grpcio_reflection-1.70.0.tar.gz
 # Locally computed sha256 checksums
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.mk b/package/python-grpcio-reflection/python-grpcio-reflection.mk
index c209b093b1..4339e31abe 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.mk
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_REFLECTION_VERSION = 1.69.0
+PYTHON_GRPCIO_REFLECTION_VERSION = 1.70.0
 PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio_reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
-PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/bd/88/064538adae2e526f4626ad57f53a99fca5ae5013e627214093ef1d47cc35
+PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/42/98/f76681980ec7e9813e010d2778f4109816650760f6839661ae378286b3b5
 PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
 PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
