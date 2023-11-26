Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137DBC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 01:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA6704031D;
	Sun, 26 Nov 2023 01:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA6704031D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U_qHA3eXPl05; Sun, 26 Nov 2023 01:19:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31863400EF;
	Sun, 26 Nov 2023 01:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31863400EF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B8511BF281
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 01:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40B8581448
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 01:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40B8581448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cv2fY72B9jyJ for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 01:19:39 +0000 (UTC)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4528F81386
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 01:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4528F81386
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-35aa43c92daso9568395ab.1
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 17:19:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700961578; x=1701566378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWL6QHxUvn0V20KF6ECJJDvxZvfGN19irkgkUJR2Owk=;
 b=egtQB+Z/ItmglKhgWApy2aoeBfd2mvoRfhpFrzS2tglY1k7SNaoUJHaY5kCSD0/6/v
 MBS9jyCxqIVN7TP51+s0TTfaQavugcohzJsqm1FBaWxXndXokYwgxMJsHSODpO8aYoJr
 LGX2K2cMWWFL2yrpyf7nOjYY8Kp/gb5CsM5jbMOLFQdUviNUx1YZGwzlgud4SqKh9O7S
 I9R0b2vTbaBkijj4/OQbTp6FJ4Jc+UhjmDDcIKdaI/6e4b6pz+TLxewr+6Ov/C5e+ES+
 Vu5hmy8slP8RWd3pOr6bwsuzrn3Qehs8yYtnUtvlTtcJfUo27AWRSHLp/GJT+GMLN/P2
 AD/A==
X-Gm-Message-State: AOJu0YxY/DVD9B9SxLEeKSROOPufS6BPzoOM2TAaSwD1oY0k0J3LSqrO
 yFjfPUDObYYLu4s9k0OQkt3DXFbtVYg=
X-Google-Smtp-Source: AGHT+IH8w0R3dLVIxTOz+p1KW8kw5Db9l28bjPClTBEzFepOIKxPvo4wplSAzTa8eJUgJkTmXLFOog==
X-Received: by 2002:a05:6e02:20e7:b0:35c:ad64:45 with SMTP id
 q7-20020a056e0220e700b0035cad640045mr831095ilv.3.1700961577684; 
 Sat, 25 Nov 2023 17:19:37 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 v6-20020a056638358600b0046674d6318fsm1585075jal.17.2023.11.25.17.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 17:19:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 18:19:29 -0700
Message-Id: <20231126011932.1380631-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231126011932.1380631-1-james.hilliard1@gmail.com>
References: <20231126011932.1380631-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700961578; x=1701566378; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wWL6QHxUvn0V20KF6ECJJDvxZvfGN19irkgkUJR2Owk=;
 b=Jcdz7186EMN8xZfrjes227X5XIHOpgwEvohGMRJrThK6QuE5KQBYSihlIeN6QwxirF
 VOojsM0WlimO0WGXHezAUBJGa0JlXPOYFaRsAKQ7wQ/pg4XOpCilm+Uohu5jxv4L0i6O
 dHNAUaRc8PvZqtLbcF/KHAvYI0TMCtwK6jCZjc8wIxJAT0mh7jXucV28YDOcpip39fhM
 Xminn8jwihlkRsQDNpsZJ/U7ew4dODnwjRFqoZdUknZ1VgOy4bKb5H9emCkRRIavhBdA
 zU3MzrpbBFbLQr0hi7p53iRaFcs2tVXgD8dBx3ussrRJwMJpgaN0idFHzYjbjDPJEe2X
 6nkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Jcdz7186
Subject: [Buildroot] [PATCH v5 2/5] package/python-terminaltables: use
 correct pep517 build backend
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gustavo Heinz <gustavo@gsthnz.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to migrate python-terminaltables to the pep517 poetry-core
backend as setuptools is not supported when building with a pep517
frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
poetry-core and not setuptools.

Upstream has merged a patch replacing poetry with poetry-core, however
we can not backport this using a patch file due to CRLF line ending
issues so we will have to apply the change in the patch using sed
instead.

See upstream commit:
https://github.com/matthewdeanmartin/terminaltables/commit/9e3dda0efb54fee6934c744a13a7336d24c6e9e9

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add more details regarding pep517 frontend compatibility
---
 package/python-terminaltables/python-terminaltables.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/python-terminaltables/python-terminaltables.mk b/package/python-terminaltables/python-terminaltables.mk
index b31ed332b6..385c71ae2d 100644
--- a/package/python-terminaltables/python-terminaltables.mk
+++ b/package/python-terminaltables/python-terminaltables.mk
@@ -7,8 +7,16 @@
 PYTHON_TERMINALTABLES_VERSION = 3.1.10
 PYTHON_TERMINALTABLES_SOURCE = terminaltables-$(PYTHON_TERMINALTABLES_VERSION).tar.gz
 PYTHON_TERMINALTABLES_SITE = https://files.pythonhosted.org/packages/f5/fc/0b73d782f5ab7feba8d007573a3773c58255f223c5940a7b7085f02153c3
-PYTHON_TERMINALTABLES_SETUP_TYPE = setuptools
+PYTHON_TERMINALTABLES_SETUP_TYPE = pep517
 PYTHON_TERMINALTABLES_LICENSE = MIT
 PYTHON_TERMINALTABLES_LICENSE_FILES = LICENSE
+PYTHON_TERMINALTABLES_DEPENDENCIES = host-python-poetry-core
+
+# we can't use a normal patch file due to different line endings
+define PYTHON_TERMINALTABLES_USE_POETRY_CORE
+	$(SED) 's/requires = \["poetry>=0.12"\]/requires = \["poetry-core>=1.0.0"\]/' $(@D)/pyproject.toml
+	$(SED) 's/build-backend = "poetry.masonry.api"/build-backend = "poetry.core.masonry.api"/' $(@D)/pyproject.toml
+endef
+PYTHON_TERMINALTABLES_POST_PATCH_HOOKS += PYTHON_TERMINALTABLES_USE_POETRY_CORE
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
