Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7C9D0BB5E
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 04:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 369116089E;
	Thu, 24 Oct 2024 04:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSP2u2VNTz7N; Thu, 24 Oct 2024 04:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3055D608A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3055D608A0;
	Thu, 24 Oct 2024 04:54:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26C14972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15CBF6089E
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Si9fJXnE2-BN for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 04:54:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 46234600B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46234600B6
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46234600B6
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:54:27 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-83abcfb9f37so20320139f.1
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729745666; x=1730350466;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nKm//+Y0nOtwMtriekX3lGywHq0r0+btFhKO/cAzY9A=;
 b=dkYUPo54dTaD6c8am8dvIdRybVD42xVe/y7bQpib7GUHkILmjG22m+qddPWhFkKnr1
 t+mUk5b4ZsFi06y4FVg6nPRSq1aDiEjPWol0KBH8PKYvHXBWjcD2WjD/Z9CwAr/cHzTf
 Qpin8cNBV4BOdmkNvFBxcH8BB8DmNWLd29FjkLM71FT6V46mZF3Eo0eM6mM/UgI9SX/O
 x0uyJfqdCJoAxUTTOJnynXYzdXc8pGo9zf5CFAVyopDzmCwr/rGO3PmfG5Sblieroq8w
 bG8lZrOs4YmD4kj9XVx/giJVu2u+Rii5xArQqJxZxjv+NUHA2gQhfwTKRePUCfOHXHQk
 576Q==
X-Gm-Message-State: AOJu0YxqSMC/MdTIgeLcE0r3WKGyfRiICJd+4WGN/Ut8IzjIxs2y8jFu
 Bm/nnuNBUjiwPVuJAt2bRzbgLAegU5YADkFAVsOrhfyxs0R0TecG1jlTOw==
X-Google-Smtp-Source: AGHT+IHPHIruIJX5jaR7ftEsQ/KTx9AN4dnafj+W9Da2z4d5QbkcOZIzrYHPt3jGgX0Okmp/u+QlRw==
X-Received: by 2002:a05:6602:1609:b0:82d:3c2:9118 with SMTP id
 ca18e2360f4ac-83b0419b2demr95746839f.16.1729745665865; 
 Wed, 23 Oct 2024 21:54:25 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83ad1c3361dsm267678239f.9.2024.10.23.21.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 21:54:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 22:54:20 -0600
Message-Id: <20241024045420.3380050-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729745666; x=1730350466; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nKm//+Y0nOtwMtriekX3lGywHq0r0+btFhKO/cAzY9A=;
 b=Oed8YGXRujIuscffrAwaF8dPWHBoEFDCTUhJq2Tu7WFBeddIQWzj0QSMd7nlhDlckF
 h7IrOooXuophrErKd2u+a7c8XH12Wa4BRRVr227XXSKUOJF9KbYhGhphAuHeKfma3yKA
 /goiwZwXC26PNT9iAE+I7hI9eZ/E8a99byyn/0G6AjP5o/7mhqBuIWud7Bj4QTvjDW2B
 pFcj6M8YiLL97/FEF5cMK6lpWv5FAP2UaSA/neQAsVolothGX00CdXlB+QoRMb93sAAe
 aAg7hINiqnqQ5zojdWAatlpSAxaAZErQpf4WqeuCfZ8p/MOAatNY6E2E6HXLkcxQrZIZ
 YlSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Oed8YGXR
Subject: [Buildroot] [PATCH 1/1] package/python-starlette: use hatch setup
 type
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-starlette/python-starlette.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 57d6e319f8..e1fa34a3ce 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -7,10 +7,9 @@
 PYTHON_STARLETTE_VERSION = 0.39.2
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
 PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/02/0a/62fbd5697f6174041f9b4e2e377b6f383f9189b77dbb7d73d24624caca1d
-PYTHON_STARLETTE_SETUP_TYPE = pep517
+PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-PYTHON_STARLETTE_DEPENDENCIES = host-python-hatchling
 PYTHON_STARLETTE_CPE_ID_VENDOR = encode
 PYTHON_STARLETTE_CPE_ID_PRODUCT = starlette
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
