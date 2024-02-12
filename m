Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99934C4829D
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 22:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51E66407A4;
	Mon, 12 Feb 2024 22:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZeIBZ35uvHX; Mon, 12 Feb 2024 22:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20F9C4076C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20F9C4076C;
	Mon, 12 Feb 2024 22:36:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 260651BF34E
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13D78608E9
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:35:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i_DvNgS8ra5v for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 22:35:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64D5660616
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64D5660616
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64D5660616
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 22:35:56 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-363dd0218d2so9872275ab.2
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 14:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707777355; x=1708382155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWL6QHxUvn0V20KF6ECJJDvxZvfGN19irkgkUJR2Owk=;
 b=niKxTaW7B4s0auSreksyOGOO2Hf8j6k9hy+JmSGn/YYQrggOsZjvzkDqZoY9Lgd8mU
 gxjISKp7v8MkUQRYVoBoKgqJ88+OnaGD7GIm5cWvybnZPv8MY60e1SYotNfFRS9HKiRs
 2G7xCSjovJXqjJXGs8QZD1XUXPthNv8kk6Gkn5WNeWPvkMjGeD50jPBsWqtycLiboK0T
 zuomAFEcEj/unbK5x4mH8sT1iSbKnQKP7Okzjp762/bdDaStW891hWhcdD9UBvWp0mWX
 2/tfCDAoS7kcP0SheLXJtlJ69lg7/IeZHJ8EezjqgavbOkudwCA9dIZvm/9q77Khs1av
 iKBA==
X-Gm-Message-State: AOJu0YxBKnU5tBjYGTqf9PCzg0JC8lojRRL6f8Asm2U60NxZCezUXmKL
 3ufo8P/2gEkDfwVVDSegkyAjow2rFwlj9jxBLscfIdJNlRx6iFkSaB5WTIEWJF3Pxw==
X-Google-Smtp-Source: AGHT+IHkJoDTTjkS+BsID+xasvafjIU/zlyFAM2DmVMIL+h7x8mVKMU0mEboB2nZ8mw55ecXGbjDNg==
X-Received: by 2002:a92:d581:0:b0:360:642f:322 with SMTP id
 a1-20020a92d581000000b00360642f0322mr8890867iln.25.1707777355101; 
 Mon, 12 Feb 2024 14:35:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXxiXOvY8NU++796NTC96oYwekku6EklEu/enE6w9et21aQzjFVuLhosZSTyOmxM+ozzrmXlPCyqx4eBDM1EjsMNlt/MfRg0jB4SJIJxJIZBtkdGWZa58fJaDaAnJDVFPHYbIYDaSPB+l7plssmYfTHccf45Djb7iEsrGmlRG0c/wglhTCQL2hGCB2Mr20bJZuuH7YlkWLcWYB16IxD9CRhmCJcwqXz/XNew/teOnvuFIof2llq8U0NGPMFn2KYRpgrSHC4VSpinSXIXuYydqqN2EiN4L/RmT926A0EjDG2cmdGjw==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 s11-20020a056e021a0b00b00363a91effdbsm2132656ild.76.2024.02.12.14.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 14:35:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 15:35:47 -0700
Message-Id: <20240212223549.3665464-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212223549.3665464-1-james.hilliard1@gmail.com>
References: <20240212223549.3665464-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707777355; x=1708382155; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wWL6QHxUvn0V20KF6ECJJDvxZvfGN19irkgkUJR2Owk=;
 b=CFtNs3xpOwPQtMg7vcf8/NzedTsLJzM4G51te73rwI14+scN+REr6FdMGRusj7lAIh
 JfqKzC5iv5cKj4b/CevIZUW3hW+BQQOYO0gyqySXjM0LSIzFr5F+cESZB72eYBNGLZWn
 8mFZ3zT9p1us7619rei0qx6o320s58S+1Dej+se4vSJthhsrGWHzQKPTqj0eyzd6J/31
 SS550bjpOirBKJPCUWUyHcIilimBRz7MBMUyiv0P7nPKTC3I2asJ5uLiDKYRKQ/Ln25E
 /cibhRqkpg6iS/2cDhjtmgsit8HueCHu0LPQrQmnoNaOIknmpxfLMcDwsO3vESFz/7w1
 Br3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CFtNs3xp
Subject: [Buildroot] [PATCH v7 2/4] package/python-terminaltables: use
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
