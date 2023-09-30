Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EE6E77376
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 15:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7ADD341594;
	Sat, 30 Sep 2023 15:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ADD341594
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tqwiW64arpSC; Sat, 30 Sep 2023 15:25:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7022541595;
	Sat, 30 Sep 2023 15:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7022541595
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4ACAA1BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32D2941591
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32D2941591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GotI0gcHbX6J for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 15:25:28 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05A4F40B22
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05A4F40B22
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-35135b79b6aso34184455ab.0
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 08:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696087526; x=1696692326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWL6QHxUvn0V20KF6ECJJDvxZvfGN19irkgkUJR2Owk=;
 b=g1fdPp7FzB3RygL9Ev3KLTdpP22NoHHcyTzcd/lI7oAyhMEayxhpU93dn00zWYy4Jz
 i5b/aFbSA4RKeG6dl0sKMiExyndaRKWn2Eqoj36rfFKidHQbvJS1++JXv/m2e9GVyK/d
 DOOpe9jQPGdLKGFXiGISNnOuxL4zNYbK21awML5QMTlm6g2eLMep48TRUC47m40SUh1E
 EQ7GxsWBm4rgVBn+7l4GSulgEyXf3yqMbhjpGpVUthDAg0KROZR0e0yJbW31WXegduTR
 cbKwepvmo3T5TLi2H+/J9Gdl+pSp6/rabO1dS8XRW8vrerjO7AUcEwqXV33394/qDnKH
 V2hw==
X-Gm-Message-State: AOJu0YyDXpTxzwlGWQWNgk346pT6UVEWBizQWDFvN12QcPzpa3tUCmkE
 0FiS982CiGOmCZl+Mdl3Da0YBalyCVFILQ==
X-Google-Smtp-Source: AGHT+IGjo3IBozTkAzH4VPJ055PPiy8ni3HBFvuLXdNFgUCntYwvBn4F4YM1Enlej/jXS0y8n8oTZQ==
X-Received: by 2002:a92:d4cb:0:b0:34f:77bc:8d49 with SMTP id
 o11-20020a92d4cb000000b0034f77bc8d49mr6519166ilm.23.1696087526676; 
 Sat, 30 Sep 2023 08:25:26 -0700 (PDT)
Received: from james-x399.localdomain (71-33-152-19.hlrn.qwest.net.
 [71.33.152.19]) by smtp.gmail.com with ESMTPSA id
 z2-20020a92cb82000000b0034ff58af12dsm6212220ilo.77.2023.09.30.08.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 08:25:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 09:25:16 -0600
Message-Id: <20230930152517.1077576-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230930152517.1077576-1-james.hilliard1@gmail.com>
References: <20230930152517.1077576-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696087526; x=1696692326; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wWL6QHxUvn0V20KF6ECJJDvxZvfGN19irkgkUJR2Owk=;
 b=lBQRZSKxf4xTgSBD9uHs0D1AjPgAbbm55UpoN8A33VPZPlWVnl+d/PLJuGy/xbRN37
 y3aXlUI4niBT1qSqCs2bU9QKIdte+Jtmd1bttJoI+IizgWYJ0ApqwujZyQWA6DkLnqX2
 kJyiU2yJLaM2tdlcDy90EZi5nfgVjliNAO33/6vfXqw4yGra73tTfIB5M86XAFnFqa/n
 ZNdS2A1w+twakIBAjS4F5S9v/Rby68stfICUeVq6Y+I8K2Fjvnhhn8kVCvWB+m7XCuPN
 4PAOPd5Xab8E5eeCdij4U1wGJMKWvFn5QNNJxXkAd9xCqtB5Z4BEuTFRJCcFZdsP2Hh3
 nWkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lBQRZSKx
Subject: [Buildroot] [PATCH v3 2/3] package/python-terminaltables: use
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
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
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
