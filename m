Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9587EEB572
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 22:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61220811F6;
	Wed, 31 Dec 2025 22:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Q5NYA8PVC6j; Wed, 31 Dec 2025 22:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44A3D811E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767220201;
	bh=FvJPouCwkb/EiKyAHoQ5moFEJ83UYuaVQjojsl4N5yo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=cdRumthI2a8l8GFFbDjbOJzyF/4su2tjoiQIUJlVTG9zcaep0MvkjSKJ7kW1+ewmO
	 s14IChV8oJjOCKBGaADl87adXTnWMiU3hfUij/iGHPtmp2vGpApcLCAnEvqKh1oYm5
	 3Z2obkZwB7e3zWLRk/it9PU5Mn1fhQeDpgcY2FBDtcQXyE4IQkSEc8UbJF3d1A3OyX
	 ThBoMyHyzU8yHdFcsZupOTTqvAgBYQSKSaZZvWHZAn1j7J+A8ldGXiIEgYQ5JAe1RC
	 24XOyIlvBtzk/n3Lfpe5JPv9Vfx/MKS8o7a+DAGrXPGX1afmFxttd8KsYhdLi9QrV9
	 5YhEjsPeOarEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44A3D811E5;
	Wed, 31 Dec 2025 22:30:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 83B29D8
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 22:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74E1760871
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 22:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPCBqzRt_3fA for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 22:29:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F920606A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F920606A6
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F920606A6
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 22:29:58 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-45330fe6e1bso6643804b6e.2
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 14:29:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767220197; x=1767824997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MuP02mBiBoq9PIhJCBWJ080HIboU4f387K6CnmD6Kww=;
 b=beZmp0ZGXTce2PVuaUHRO127vxeM1be8DPx4pWgR0oGK/I5b/vLEHbrwlz5NIpjlRs
 z2B21WU0cq4xJal24OAGkXfW+AMyaTaDkhPuh++kbPMUL4fQ+m1jNpCX1o5A4XtJU4eq
 bplA0cNf9vrVQc1Qd9Q+mszquWb5SPM0tItOloyzrTmRLgrE5TKbH1BPZpGFCM83F5+t
 iK4itqB/KiprDdwp//roFHLIAhZEKra+/tjKcR38hrj+RFWIJqNA7VCybsCtfGXxvM3Q
 1jrFRDpPYDvsU9j1aci8cxBbmEZy2vj04+BE/w0ROMG2E+632u/L82NSVbrMhlWX5tXr
 kIHg==
X-Gm-Message-State: AOJu0YwpEuMqH6cLfkPSIIxhtiPUtdjdFgqNREFe+9Ee4bHuxqS+BXJP
 1CdwNfJwunYY2Ye4Kz6mANIUIuiIFpQal6vpA+3EcjCQDH02Ya6Fg5SwRqXtw7w9mVA=
X-Gm-Gg: AY/fxX4VGcXvPzBr98oOZ9kgjkR2R8M70uh1jYn3+Gl1QrAsvkTMrASS5rdjNHC2Dy+
 qcAbQsN7Zs4+Z3ruD/jQ82Lz2SmclkHiTlRQEFbsfYKLFq0ekJKIzyCENJxeSr+VprVPRfqgMWT
 7C9QdRmr0eBstmSp7QrQs/gvOQmHZBR5pwXpcg/q8VJZB46/GzGFKhxTP/pWsgLRZAw6voF2LTS
 3c97x9dPsi8nhrAZGLx6adT6S9B4JROKlkL4b9BjtJYPpcNVW0EW1voaORoTfOWbyurQaag6ip3
 VrWp7AOoRJ8pE0xIdBpsHSt4nCnGDOHYZH8bOWTgYZ1DTJPp9M0mQDOfzeTkHwakTuOoKfnGoNm
 qJS/AUNggUpzeTJfoC/b/eXCsQv9pJxTDmei5dR/oYUuVDZeusrxC0smbrmcsaROqeFzTTzMEjS
 TTYEBTkeURNaoi7mCUAi4mbOW3GslMn7OJFdz+Xv2EXTKiXJkUoc/+x2VNq2xbgtqkHw9f3oXcV
 G9tAWJdsN4FjXPlp44VF1dfM+/Q+SBDoOsS1EbtnuqHe3rC6cIvenY=
X-Google-Smtp-Source: AGHT+IEOji0MVlOZHPA0SQY0jvLNOKQNbggBLcDxYPl+EWJuv9PN+IaEpPoctwhlZIhMsWq0Magq9g==
X-Received: by 2002:a05:6808:c117:b0:44d:baae:fb0a with SMTP id
 5614622812f47-457b1e55879mr22121855b6e.5.1767220197297; 
 Wed, 31 Dec 2025 14:29:57 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-457b3edd51asm17395229b6e.17.2025.12.31.14.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 14:29:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 15:29:54 -0700
Message-ID: <20251231222954.529580-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767220197; x=1767824997; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MuP02mBiBoq9PIhJCBWJ080HIboU4f387K6CnmD6Kww=;
 b=MCKQk+vc8UVIeItqe8HdQMt2A1o8PzPoQWDGAso+HT++8Ql1BKCJkCRDuCqEriHTgR
 dWHBq7lxaRtuhM1B7s//ckW0fJXZwzHZQ3ooFT43XxSPOpfF1ai351MDhpvta9Aka4Ny
 oOCbklpyMHLp7fue3uiIev2XXHTpe8wOhgoP9Skn8QE/MDzqSLUpheHnxeAI8vGB23Tb
 IhXGSRVWRTRfGnwMcW8bt/22jp0Tcp4TWQLyicSqNyVx3EmZAu5J/6KOw1lVjXD1joZ1
 DYX1D2KE3IKDrUnporxjJ/dnef7G3mgU0kBm4eIK99T5FikRTVwmNxo1YRizf9IL2SqW
 KypQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MCKQk+vc
Subject: [Buildroot] [PATCH 1/1] package/python-psycopg2: bump to version
 2.9.11
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
 package/python-psycopg2/python-psycopg2.hash | 4 ++--
 package/python-psycopg2/python-psycopg2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
index 52f3f76712..c72759f43f 100644
--- a/package/python-psycopg2/python-psycopg2.hash
+++ b/package/python-psycopg2/python-psycopg2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psycopg2/json
-md5  3a1ed36b492a74789563577edc0b0689  psycopg2-2.9.10.tar.gz
-sha256  12ec0b40b0273f95296233e8750441339298e6a572f7039da5b260e3c8b60e11  psycopg2-2.9.10.tar.gz
+md5  ea0f76b3d0358db5d8ff84e18c4a7252  psycopg2-2.9.11.tar.gz
+sha256  964d31caf728e217c697ff77ea69c2ba0865fa41ec20bb00f0977e62fdcc52e3  psycopg2-2.9.11.tar.gz
 # Locally computed sha256 checksums
 sha256  9614b85dfc9a72c5b2ca33144c1d7e1ed3b1c297459d9fb28a6a5762c2e8d71b  LICENSE
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
index 0df79c5412..689788c2c0 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYCOPG2_VERSION = 2.9.10
+PYTHON_PSYCOPG2_VERSION = 2.9.11
 PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
-PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/62/51/2007ea29e605957a17ac6357115d0c1a1b60c8c984951c19419b3474cdfd
+PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/89/8d/9d12bc8677c24dad342ec777529bce705b3e785fa05d85122b5502b9ab55
 PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
 PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
 PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
