Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9D4CD1288
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 00:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87BB7821FA;
	Sun, 31 Mar 2024 00:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CX83pyNbhD35; Sun, 31 Mar 2024 00:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1206182231
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1206182231;
	Sun, 31 Mar 2024 00:42:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1993E1BF947
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B502882134
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orgI_Wxab8yP for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 00:42:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8B9F82142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8B9F82142
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8B9F82142
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:42:05 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7cc864215caso125618139f.3
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 17:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711845724; x=1712450524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u79JFBpWVn0SMYXp5QMDJkAweI2x/wPR46GtRSk2hus=;
 b=sTim56omvoQRfN+ZYwCGMZRWZ5zx1CxinhnZH3rKMEmRkcfrG5S1JybJ4KU1ksNq83
 J0Kw7xXnAnieGiMNWWM3K9tzwvHV5p8BJIia9Ai+HjRXpIJ/CoBPnXy+kMA4X/t9mGw6
 yMFg9au5yvMJfbmEv2FxxbHuHUKMtbqy0q+eQTvQhnPiaxfl6Y/PZq8H7MtnkqiVIbZY
 fVRaehdEp9LClsdLWH8AwiB1ARzoNESN5kVa+go6rZBFNjRX6I7CyVFtB2xi/1bJJ3VC
 Qt0h+ceRdWVj9AadnZnSR/z6WatuJzMwckshy7o9WI6tKZixnUSarZaZMfKwO/fyLTQ8
 nnMg==
X-Gm-Message-State: AOJu0YxPlceZs/Pez07JJFExVNP/jtY737m60681WcNF9ZPg88s1hA+9
 KK0pvtaed5IhA9SQ4n+f9rSox4ExNLJQMKN8WYvDGjh8YNV7+8Pf/R50MN1XDdEEsQ==
X-Google-Smtp-Source: AGHT+IEO13BJKaw7nUAuqqxge5gQo+FkvMbJ/ItXNt988E23l8yrtB9IlnTelNsqGFAstaMUilkxHg==
X-Received: by 2002:a6b:2a87:0:b0:7d0:b61d:3311 with SMTP id
 q129-20020a6b2a87000000b007d0b61d3311mr2449582ioq.4.1711845724246; 
 Sat, 30 Mar 2024 17:42:04 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 q1-20020a5ea601000000b007d05927cb31sm1851053ioi.45.2024.03.30.17.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 17:42:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 18:41:26 -0600
Message-Id: <20240331004133.636618-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331004133.636618-1-james.hilliard1@gmail.com>
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711845724; x=1712450524; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u79JFBpWVn0SMYXp5QMDJkAweI2x/wPR46GtRSk2hus=;
 b=GLTQnwH1rtnu4d1RflFIKSqDGVtUm7FWmvfHl/l3jXnWJgIJ4miQzXIjHeYKLWIRoQ
 3e/2LFZhY2vC7AdHGFIdLpHU+rW+Xe0ZdyYR1a9Pe3qhlzB8oMVI5zUh3Z8XPonhTd2h
 xlCZNebb2BTGAFN2/UcMh/7iyQc2b/gPHCRRyNtZFtw1BqVQLP/btGYDYuRONwdltj16
 buo3BjalkjTrjoW3Jlw8kIWKwxyUDIsvXais8dFQQ1YgCvXWjZEqYy1jOkZwSkw/mp8s
 lqEjDEs3rwDIM9GJM//s624Zuwn9KTis8cpPIB9BtClJ7menlz85XxMuYJYNpcLB0wOA
 SvBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GLTQnwH1
Subject: [Buildroot] [PATCH v9 11/18] package/python-pylibftdi: migrate to
 poetry core pep517 build backend
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>, Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to migrate python-pylibftdi to the pep517 poetry-core
backend as setuptools is not supported when building with a pep517
frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
poetry-core and not setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pylibftdi/python-pylibftdi.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index 7dca37e416..7607c90d4a 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -9,7 +9,9 @@ PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
 PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/d2/ce/ff3e83f3a14eb5b7950ff3657f07cdc3033dd0ded5c8ed093db515e1de33
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
-PYTHON_PYLIBFTDI_DEPENDENCIES = libftdi
-PYTHON_PYLIBFTDI_SETUP_TYPE = setuptools
+PYTHON_PYLIBFTDI_SETUP_TYPE = pep517
+PYTHON_PYLIBFTDI_DEPENDENCIES = \
+	host-python-poetry-core \
+	libftdi
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
