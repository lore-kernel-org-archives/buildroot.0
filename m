Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFA1EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 07:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8544182073;
	Tue, 27 Jun 2023 07:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8544182073
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1C3rWOnT4c3; Tue, 27 Jun 2023 07:27:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B26E0820F8;
	Tue, 27 Jun 2023 07:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B26E0820F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B1D61BF2B8
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 07:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24C4F82073
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 07:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24C4F82073
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pN46wunmyAa5 for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 07:26:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CADD8202E
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CADD8202E
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 07:26:48 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-78360f61ba0so62172339f.1
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 00:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687850806; x=1690442806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AH2inoeRVF0ptjo6KwwCmE7tPDyTPz1qjP86JMba1zI=;
 b=EV8j8wvaDw+zetQCdy6KlIeNJfqQb3Hg0PzJ7hZYOh7Rf/jrNf+Rs+jb4iJ3p1XpC9
 yAK+Yi5SFDX7KKb0lOPnCFa+0vPAo4P7IgLp7+YPgcHyEt6fmckPebAa8V78dnKAlage
 fKYdgk+rhDJybvLuM8GFsjAJmejlnu2bmhxFkT7x8AqLjOE/i0lTD2YNgGpaOURBI7LY
 sVSDrs7Ay1yuS7Rb4gghckivI6ZsciaROO1Kbay9ldghVwmmFamPrmSO1hOkjZ+MITPC
 CkNAzJSvUOhI2Sj10xQecW0b6Q5OycV/9sdd08UXmQfdGLkKQYzwbKyEIX+kIrnntpTt
 PkTw==
X-Gm-Message-State: AC+VfDxCQ3jOlt43vGk9cvQ1PRTbEUB9RsxUKbWiPmrQOtbEjIrIJXFa
 WMb8Xu775O4i0flO+TbptJGtPIOvAkw=
X-Google-Smtp-Source: ACHHUZ5XOSQmZ96KOajTV1bsONHcsChK2i/4m6tu6EBUjwvhGu6GvVIMGys453aneodExasB5cvr+w==
X-Received: by 2002:a5d:9e14:0:b0:783:65ba:8614 with SMTP id
 h20-20020a5d9e14000000b0078365ba8614mr3248005ioh.10.1687850806115; 
 Tue, 27 Jun 2023 00:26:46 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-17.hlrn.qwest.net.
 [71.218.252.17]) by smtp.gmail.com with ESMTPSA id
 h2-20020a0566380f8200b0042907798fbcsm1484699jal.161.2023.06.27.00.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 00:26:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 01:26:40 -0600
Message-Id: <20230627072640.2437216-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230627072640.2437216-1-james.hilliard1@gmail.com>
References: <20230627072640.2437216-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687850806; x=1690442806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AH2inoeRVF0ptjo6KwwCmE7tPDyTPz1qjP86JMba1zI=;
 b=QCEFdWoqqIzIRkfUWwS0vQBM2aw+TXarTBRApOJIaMU3PoSGM6tsWhHJIGLokkmrJZ
 jDNh3Z7GUe7ZPykW1NRFn3FJbpDLYLRg3rkMCdB1VFlRRLuJ9tfRYgyY6vKjrCCCBsmA
 ThyMdSrjvMSAlLnXY6spkzohDC/5sssBnXYj1IfAgs9bpaKYeiOgbX2SvtPfbzFvXUxz
 A40i/a6qPDlvlwdKETPNQrS5d3sec/BQRRiiBPrLobijtcqSjQ3E5yjo2rCg+y7hYRpK
 5qx89S8o69YtbD1AhwcGboB4tuBWfJXOKUjkbzzOjYH/ChZFbfJd0+db0n6FJtKmuU7Q
 gCkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=QCEFdWoq
Subject: [Buildroot] [PATCH 2/2] package/python-terminaltables: fix build
 backend
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
backend as setuptools is not supported.

Upstream has merged a patch replacing poetry with poetry-core, however
we can not backport this using a patch file due to CRLF line ending
issues so we will have to apply the change in the patch using sed
instead.

See upstream commit:
https://github.com/matthewdeanmartin/terminaltables/commit/9e3dda0efb54fee6934c744a13a7336d24c6e9e9

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
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
