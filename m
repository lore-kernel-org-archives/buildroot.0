Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5C9EE644A
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 22:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42288807F2;
	Wed, 31 Dec 2025 22:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxZm9EPOV9VY; Wed, 31 Dec 2025 22:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55C49811B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767218711;
	bh=8eyDYw1jFtAI5cB4Q128NgmW4MqDpYJGeUDTmhYdK+0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=sZKT+175uV6GGpG/yOh9u5jVeuuuu54rdU5sa9daEVTH4tOvTxrPpdNxYw1zuh0mf
	 X2rCH267kblXdy+ewnu2CNeuoWW58MqXL3NXfxk++8pJiMLUaVkW4fbsim8+w8qHK7
	 pohpiiOMyh/cpZNkXofK4kTfHBaX6SYp1UN4GAoWWq6fAzT3gHkSWOf2P/JcS9QNzT
	 gs+VrW494QNOsJrZCNSxGw4L/2ZGD5xF7wviYXZ7aRe2T6FGxYAgdRo/15HMHRYZ/2
	 +zQ3ZyJwesJZAWfeWStcoQ/Cm8eUQPCGDsiWsidr1lWdiJjgQuh1+4XTL19u+GbpGs
	 28RU6TNJnzaPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55C49811B7;
	Wed, 31 Dec 2025 22:05:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E324CD8
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 22:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C957240447
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 22:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ex1Yy5Uixs7v for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 22:05:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA21740234
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA21740234
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA21740234
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 22:05:08 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-7c765f41346so4837486a34.3
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 14:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767218708; x=1767823508;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K1zzxE/8oz7lqEdhVTpNLldqw43zJXzh3zIb6xqCE00=;
 b=K8C5dUdrgsocizAFZGgUDNyL4ryWzO0YCipzAy9iILk1zG3qFkP1/YXjc59DKN7TTd
 wCY9nKnODJyAFoI95LUJG8pZThbrrfL+ii1GBN7d7TEoTazczgEKQTkUg33QUOVoNOwo
 mmEVq7MWl4LMtAH3s9o13dkT4NsoyQyTHAT8M688IERPl+aO5Fn5AMhN9D04qVj8Q2Pg
 GpG8wiqogOCahK1x+b73rocz+Mzgqd8u0aoE3TXNMWhs8UPbPhacZddsKPb+uhs4+kIA
 ZtF6yyiXS/SUMlyQeoEScFop6eEaf1NdQTFxSSUWIOgNHc3gPF2lWQgJQDPVZEIZyEjL
 NzNQ==
X-Gm-Message-State: AOJu0Yz2vd8/BnHuVrt+Z9ocjHyWTXdbK2uFrLCPaGj2dkzPAgPgTgX4
 dkROJiNTpfjhNesF/qi0gmnR7L9avk9M6isRZWnwes7RkOzx+AWkaq27qRQA8UuYvZw=
X-Gm-Gg: AY/fxX5lliSLE/4GkCpSH6YwCBrOskPLOHzjMkqJggJtcAcb339xCDB3MVvkgCYWG9n
 dPWb/ZeqU5Ftalks6Q7N9qsfPMKAoTSG6k5xOmOiMc3Xkjvr6Ou+lwmwKQY1k6ml8ZbjbTwLnmO
 MFugIva310nC9lR0svcI9rrmcS9d5Uvo0S9Ju5whyQVe5OgpjEgq9RL6ld1tgIGzkWDZyh9Vw4f
 ANydSnr2ueuwgUKw2XWhF+Vf0PTeuD+9EOEFr6b5Budg1L6/fytXkytz93Ju7/c+cBvK9aQRp7M
 SA5M0xKIPb9gyxt7wC0gYBqo88FSorpBo4RE/iSJBdzzcwHj+er3Aod0Vl5eNNCYWD4CdW2HVac
 PcsukKhGNI5NCa6g2P01R5IeQH+DMKmQasBnr2nxMEM8r/qJ42dJueld+HqB+/riAKfhTZT+q6+
 2+TROu/SwE3lpHlBNsCIY74eX8XRv8CgJ1YgRNdQFI0xm+Lp7MnjMYuM20LGPGKaGQgzpJhO8EB
 m1nDbYavj3X8CXVL+1AvEJeNx4RYIlPwCM+NYNikbQmhBQqyq8+sAY=
X-Google-Smtp-Source: AGHT+IEng39rNqarFcQiRNLGq/pRjHFccFmK/ar2Xi6d8Ys+NQri3xo8jUuSe4hF06FBJw7WW1W/xg==
X-Received: by 2002:a05:6830:4c08:b0:7c7:65f4:1120 with SMTP id
 46e09a7af769-7cc66a6f068mr21903530a34.23.1767218707678; 
 Wed, 31 Dec 2025 14:05:07 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaab5ccb9sm22895882fac.10.2025.12.31.14.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 14:05:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 15:05:05 -0700
Message-ID: <20251231220505.243655-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767218708; x=1767823508; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K1zzxE/8oz7lqEdhVTpNLldqw43zJXzh3zIb6xqCE00=;
 b=f5dCgG4MxScQCnfTulHWoycfEVPvht3lFBGNqoZ9URA9w6rB6E8aNrh7ltUca5HAlk
 rawTJJL5OOUZKC0bONaDD5M23WiuyFDN/Yg/vdifnPbfxGIOPC137JYDBWpBqkAjb7/2
 lH27QKQqYBTHbCspO2EVY+1kRjd6SuCvs1/raCIRLmmHwaXMGjTnwXYdOtwrUDSpYAgi
 GtsauNO5KtQkRxoz+a0ya/A4t0Y+QGvJjV61XaFm2AaMaGflof706bo3WCKiMfSysroA
 uuazACCMQ0NiJfVG2EQ8XqfvFd0mj0Cuww45ruPXZWrnYHdbC4JsYvTxB8lLOeyc6UQt
 gB4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f5dCgG4M
Subject: [Buildroot] [PATCH 1/1] package/python-pycares: bump to version
 5.0.0
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

Add dependency on c-ares and set env variable to ensure it's used.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycares/Config.in           | 1 +
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 7 ++++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-pycares/Config.in b/package/python-pycares/Config.in
index 889e0943be..e58f922ad3 100644
--- a/package/python-pycares/Config.in
+++ b/package/python-pycares/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYCARES
 	bool "python-pycares"
+	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  Python interface for c-ares.
diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index 179288f694..c77915987b 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5  230e5133767e84f5d99c93dd07fea611  pycares-4.11.0.tar.gz
-sha256  c863d9003ca0ce7df26429007859afd2a621d3276ed9fef154a9123db9252557  pycares-4.11.0.tar.gz
+md5  577c064ebf4b84fbd53890b4c0f86f5a  pycares-5.0.0.tar.gz
+sha256  62e38a6cce0f3dbfe6dfcccba10526255b3823a2a040b313afef7aa9b039ce03  pycares-5.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index 0f42bc591b..0cb1eeda6f 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 4.11.0
+PYTHON_PYCARES_VERSION = 5.0.0
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/8d/ad/9d1e96486d2eb5a2672c4d9a2dd372d015b8d7a332c6ac2722c4c8e6bbbf
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/59/5d/b50bdc30026f350f1c4b0c4fb6b7543598f2bcc370308c5148c7019d9886
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
-PYTHON_PYCARES_DEPENDENCIES = host-python-cffi
+PYTHON_PYCARES_DEPENDENCIES = c-ares host-python-cffi
+PYTHON_PYCARES_ENV = PYCARES_USE_SYSTEM_LIB=1
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
