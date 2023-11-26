Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596C6C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 18:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0945D60625;
	Sun, 26 Nov 2023 18:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0945D60625
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1sz4JRjiCWxQ; Sun, 26 Nov 2023 18:09:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 330FA60BC9;
	Sun, 26 Nov 2023 18:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 330FA60BC9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB70F1BF40F
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 18:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4E7F812ED
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 18:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4E7F812ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YLoM0U1gC-CB for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 18:08:46 +0000 (UTC)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8CC2812B5
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 18:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8CC2812B5
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-35c68fa99e2so5030365ab.1
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 10:08:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701022125; x=1701626925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWL6QHxUvn0V20KF6ECJJDvxZvfGN19irkgkUJR2Owk=;
 b=ty9/YrUbnmcuUaQ8XKHUP7RpgBMeUUvsrn9iYFR/CVpE3sUPyujDJJjlQL2uHqIFll
 dVVrIK2Nc+XuqiAl1YMV0XarRIfT3Vvmp/a2PWcCPY7H5d5P8lv7nM9pDJwfajLIJmgl
 6/juTH3l3k2n6Xwo5W1BBkZYcL1KzepbdafIyomi6vmIXI704sRiqPiib9OQpWA+fDz8
 CvtpYrWq4ybwPcc5ov/Ih/eQKwelvkiPoU+sXGnoWL6EERvEAWBGgTGPds1fmovtdsii
 nH6kL8PBzJrRUrf1vkjkGhukBA9CxgjxkkF2PQw1i4Yv0gpIKdkKFRn8dEWEORWgn1GT
 Rwlw==
X-Gm-Message-State: AOJu0YyeG2Ccm57QQ76/NQ652qdWIneyJuZkvkIztLd+CBYkZD9T+EMP
 IAWDRWxih6HYS2qGlrWI9V//UBo+kss=
X-Google-Smtp-Source: AGHT+IGRdNlkU7IoeZLTXRzvmaW6yXa89MTe3ZNZ54fJZq1J60jn3/JXjzkG2YlDDAdavC9ljEMVug==
X-Received: by 2002:a05:6e02:1bc5:b0:35c:7987:4c23 with SMTP id
 x5-20020a056e021bc500b0035c79874c23mr4970579ilv.14.1701022125383; 
 Sun, 26 Nov 2023 10:08:45 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 o9-20020a92d4c9000000b0035ccfc69f95sm153207ilm.20.2023.11.26.10.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 10:08:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 11:08:37 -0700
Message-Id: <20231126180840.2081945-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231126180840.2081945-1-james.hilliard1@gmail.com>
References: <20231126180840.2081945-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701022125; x=1701626925; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wWL6QHxUvn0V20KF6ECJJDvxZvfGN19irkgkUJR2Owk=;
 b=CYk7S1netKfT2TBZf60/s+LYz+UTYMchocbyqJ/JI8c91U9Fin8XFs4Ivt5bO5BCn0
 67Rzks/4OPWFfDpo905tp3EV+OTnSmtTVaCEsc9bkhrE/XeBeng1J8q/ohl6b0URbTeY
 Ecw7oH0d1AH+uRKL1kwlUzJHM2asTvKjX9TexCU+vDomq4khdo57KfUbFeKJGiQfXW+W
 G+/Vbz0wTMutO9puzvipUFgfn9Rwaq4W3wbIa3BbTpsW8+74SZLxj5nfG95nwD2H1JW+
 tqzw3XnmeSPBWLnihCWDjAQUU5Z0YXh5xOCIRtDLuW6XS/xzlXU8f9CNIfJ2X9JDa17X
 VD2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CYk7S1ne
Subject: [Buildroot] [PATCH v6 2/5] package/python-terminaltables: use
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
