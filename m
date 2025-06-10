Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22708C5B543
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 06:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E65D5615F1;
	Tue, 10 Jun 2025 06:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A95onVNyBydi; Tue, 10 Jun 2025 06:03:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D8B86140F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D8B86140F;
	Tue, 10 Jun 2025 06:03:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73B7DCD
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 06:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BEC383AFD
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 06:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyBSISGolFBP for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 06:03:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 596D583AF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 596D583AF7
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 596D583AF7
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 06:03:42 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-60702d77c60so9869695a12.3
 for <buildroot@buildroot.org>; Mon, 09 Jun 2025 23:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749535420; x=1750140220;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8X/dyqgMNbZda1tnlLODYvRUu3DnT9rRhGrGK219/g4=;
 b=I8M8NtJsrMwnMNeu09hOEdsXLDv+5u9IcyJWLWjsVsJxnBj4kGzuYpOK+A0YNo53cW
 2Q0KH4Xi9SA7Klqu+seEqilyXEKV/cE9hHGqZ/W/GcGWS6+oYcWF6t3iaXz8E8Obz7bS
 /sxrOJOsua1zRECkMLxWNEjUJLkJk69YKPp2TZ0ZAXpzgYuTYzYCkgwDpFnjNJfVE2iu
 n88MTkXom35f4GLcMSIuMsN6qciD4eNIj/9joa5W9ecslc69r6tfUKMjTZI0vFuHJLIR
 /OshgLu5xp+84eTv5AZNqGhYJ/JiZW/LaiyLSId/n4nZ5ejpN1qeYeq6PA+ECpQAzfJM
 rpWA==
X-Gm-Message-State: AOJu0Yw2EPOJ3MkG6ZZsiFJLyZ2/DRgKr326SMDt9lTo8bRxgjlZHF/+
 xgwWcdn1mejS2gl6KUIgJIY9u+jVrQaylsjtWVoq73WCHIe7i3zn4vOGSHjq0Q==
X-Gm-Gg: ASbGncvFFNzIi2k/OokGZK27YyfENJ2Mz8CXaiZHj0pE2kw4AVsTJfyAB4YVUakcDH+
 otyM8KM1UgxRlwg4uSDagUp+6qieuni0CY3wTllwgW29RxhU4ZSeLq6TZ3vOglERdoN6SUfTHy7
 9DOh3S38XNv2jyw5Eev8lboDPu97nGcXQekoU0CNK4WioEQqQGzJ6xN7dHiZMmD+AyV3yUG6QWe
 QSM2+nBIioaOaQTWmoKXKLlTXkwldr0Gx1j8P/F+2XXCPz9nFXQ/yINwn15jOv+cbTDCuschFtx
 IPXf71HoJKT+Sfn/aCgqA7jL+ZWYCe7icGeOuNhbuz9jjCkh/tYU8KDg6qzFFfnekYIiDAX2kGs
 YTdw=
X-Google-Smtp-Source: AGHT+IFqBoWgX4SVXTa78r6hCwwbaQ3emQz9cTKt9dCxfOsdkRaFdoqmGnivQIKFPcqwklUu7pguRg==
X-Received: by 2002:a17:907:3eaa:b0:ade:6e9:8ad4 with SMTP id
 a640c23a62f3a-ade1aa8eff5mr1499527066b.33.1749535419468; 
 Mon, 09 Jun 2025 23:03:39 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1d754235sm661221766b.5.2025.06.09.23.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 23:03:38 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Jun 2025 08:03:23 +0200
Message-Id: <20250610060322.5249-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749535420; x=1750140220; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8X/dyqgMNbZda1tnlLODYvRUu3DnT9rRhGrGK219/g4=;
 b=KQ766VV7I5J0Ti/u7KpN48Nz55XzL0YQbFXokUUg5QrJ9ZAIop+uARM/X4aVR6L39s
 T+f7og2ZNXBIzmxxeejDUYDhNNfs7HuQ+weh5jcAloFLF/lNkpp2C+AytyeIXCZKdLbP
 t7DEbDJBhl5cge04pDg0ln1VBgtZYmwr9GeWYeAbmjqt/x74CbmkkEHZdp1ARIndKnj8
 INvlOB7twKJwqyzmXej/ty0fcdwo/Ha2N9lm/r/rbLr/DY6heVQM4SNi5Bb+sW08q609
 u0UoGi5Fgl86B2xx749bvQM7U1Co3suH4ljf2RIUE35tw4RUpULxbXPy5DvH6r/yrMBu
 wgWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KQ766VV7
Subject: [Buildroot] [PATCH] package/python-yamllint: bump version to 1.37.1
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream changelog:
https://github.com/adrienverge/yamllint/blob/master/CHANGELOG.rst#1371-2025-05-04

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/python-yamllint/python-yamllint.hash | 2 +-
 package/python-yamllint/python-yamllint.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-yamllint/python-yamllint.hash b/package/python-yamllint/python-yamllint.hash
index d80e0fdf42..3287d4f2b2 100644
--- a/package/python-yamllint/python-yamllint.hash
+++ b/package/python-yamllint/python-yamllint.hash
@@ -1,3 +1,3 @@
 # Locally computed sha256 checksums
-sha256  7a003809f88324fd2c877734f2d575ee7881dd9043360657cc8049c809eba6cd  yamllint-1.35.1.tar.gz
+sha256  81f7c0c5559becc8049470d86046b36e96113637bcbe4753ecef06977c00245d  yamllint-1.37.1.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/python-yamllint/python-yamllint.mk b/package/python-yamllint/python-yamllint.mk
index 29344a1408..835ee2ffb2 100644
--- a/package/python-yamllint/python-yamllint.mk
+++ b/package/python-yamllint/python-yamllint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YAMLLINT_VERSION = 1.35.1
+PYTHON_YAMLLINT_VERSION = 1.37.1
 PYTHON_YAMLLINT_SOURCE = yamllint-$(PYTHON_YAMLLINT_VERSION).tar.gz
-PYTHON_YAMLLINT_SITE = https://files.pythonhosted.org/packages/da/06/d8cee5c3dfd550cc0a466ead8b321138198485d1034130ac1393cc49d63e
+PYTHON_YAMLLINT_SITE = https://files.pythonhosted.org/packages/46/f2/cd8b7584a48ee83f0bc94f8a32fea38734cefcdc6f7324c4d3bfc699457b
 PYTHON_YAMLLINT_SETUP_TYPE = setuptools
 PYTHON_YAMLLINT_LICENSE = GPL-3.0
 PYTHON_YAMLLINT_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
