Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602CDEE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 23:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07A4740B6B;
	Mon, 21 Aug 2023 23:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07A4740B6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M_c-Qdc52LSw; Mon, 21 Aug 2023 23:03:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C65D40B53;
	Mon, 21 Aug 2023 23:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C65D40B53
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C5B81BF35B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 23:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42BB96113D
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 23:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42BB96113D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QYFXQjF8JP27 for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 23:02:58 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43F686113C
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 23:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43F686113C
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-79210064604so112139639f.3
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 16:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692658977; x=1693263777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWL6QHxUvn0V20KF6ECJJDvxZvfGN19irkgkUJR2Owk=;
 b=DBSv62gT+okDHWQCJWNbCHq1y0kTK37HK/Z1wl0O17LaxiN/PO/V3hwZ6eNXTrSqvL
 BmH2OTzgZubk7tXiPAjevbNvDeUYglQh6rgh8ICnFUC5BQgWXVklAbVne+8uFvujKIxA
 DMSRN24wKzWxMLKnWxsPSPkYb/SihML5a2TEwJroXrc7Lmo2MwHwF8SQyHB0hdScfck7
 KJdZXEwLkkAsNIaNaO9TtbkdZ42bn1Yy1A2PkJ4nal4BRXaV2EhKrY6LvXQG6T332ogm
 NADXbc5LHGbutJ2q/P2dV+mnpHcJOdi3WctwRpiCeTiwwFfimQLyLGYNAUXaAzUSBGM4
 Karg==
X-Gm-Message-State: AOJu0YyfxG/nxx8mKsM/jNjLS8Ci7GVOg8N3SvgDPw7PLVpP3xYQBLu9
 hfyxjsh4Dx5LMmMmJ1a/tSubER7Osnk=
X-Google-Smtp-Source: AGHT+IEPyo3scCwuspHapwe9RmgbaTmVg+4S+fM7qAfr1ol56JNbfJnQDLFnmbJ94bVschW9HlkutQ==
X-Received: by 2002:a05:6602:49:b0:787:1a8f:1d08 with SMTP id
 z9-20020a056602004900b007871a8f1d08mr9515369ioz.15.1692658976941; 
 Mon, 21 Aug 2023 16:02:56 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-15.hlrn.qwest.net.
 [97.118.146.15]) by smtp.gmail.com with ESMTPSA id
 y6-20020a02c006000000b00430979b6aa5sm2634509jai.0.2023.08.21.16.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 16:02:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 17:02:41 -0600
Message-Id: <20230821230241.553689-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821230241.553689-1-james.hilliard1@gmail.com>
References: <20230821230241.553689-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692658977; x=1693263777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wWL6QHxUvn0V20KF6ECJJDvxZvfGN19irkgkUJR2Owk=;
 b=WoJ5sa1t/FuHmx7tyia3E4At5BSMxuit9DfN2zgKdsWudBVXBwDn72OUu+Nc0JOIdi
 t8/IMOJoq/LbjbV1ac6xadcyTK81Van09zT12xFe7ibgdzOQaKatRp8lhRRa6l7dJWHd
 ZOvnd72wK+nkGGONXsv/lY+Xaz76lm4w14lOMm5WMHqxb8gm+hOSsKAusCayJYRdRYac
 T4NQyO0A0UmBiHjFapKPCGX/tcGPvpaqmxZLE97OnHsHyOFk3EPsq5MtsfX1nScAiR3w
 VAEYOWMXytIZvaFGaEk/Euh9cQugoijd+bZJSZBFL92Q+XSOfBzqPxpM7HtAv2y+Potl
 HO8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=WoJ5sa1t
Subject: [Buildroot] [PATCH v2 2/2] package/python-terminaltables: use
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
