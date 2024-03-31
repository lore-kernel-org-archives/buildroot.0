Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D185C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 00:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B23D3820D7;
	Sun, 31 Mar 2024 00:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpLNJKGNuqwu; Sun, 31 Mar 2024 00:41:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DFFC820EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DFFC820EC;
	Sun, 31 Mar 2024 00:41:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FB361BF947
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D4EE401FE
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YaRkp3mmeNsQ for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 00:41:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 964B2401CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 964B2401CE
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 964B2401CE
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:41:52 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7cc77c19a19so139054639f.2
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 17:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711845711; x=1712450511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RKxDZ8E8GRKQgtKDTIZszqOBrq3ponHAuaLEAQUpU28=;
 b=ZWUnZsVELkyxrnSurvXtrMFwGXfVAzJDBTA/7prqS6hacgVpcnnRhL8wiyBlbXu5Y+
 y4pfZ54Q52DibuJKfiZzdkAqtaxhCEh8+yuN4bIbeB4eVdXtqCpotKtyYZUK++tqyXTl
 NGHLEgtFROH0+lznHl5zuISIK4VhDng6gFaCGUOcKwDf5hPHE9JRZgKi7/wGOzGlKMcA
 AiG/IdksGRzO4E58oYVaB1DPoLJ4WmyFqc5kZBSS9Q/fqAcmzUl96AFISxzO1w8VlO//
 qMxXoRq7fHJmp1j4j4+nbgfI2T6lPyalwFWrgiWxW8FEp6S1S+ISpIuNSMKC3dwQ/xoS
 QDIg==
X-Gm-Message-State: AOJu0Yy9tXVBZ+HT6WXyaPXv5QWYKaVvgi0L4gLiRBV1PBwPKyZbvgFt
 cJ67OlNLlkqbsWZMxP7tfRApAX2E25DRYeAOpp+mDgmgbgkx06RuZxHgbrkagbx2Qg==
X-Google-Smtp-Source: AGHT+IH0HRig3LNqrxiqGhxEqVllEpI9C/dAHqX6h5yRKTDC37TuPMCw5mla+kTMGswh6BQYqrl21Q==
X-Received: by 2002:a05:6602:5c7:b0:7d0:1f49:b546 with SMTP id
 w7-20020a05660205c700b007d01f49b546mr6200245iox.16.1711845711115; 
 Sat, 30 Mar 2024 17:41:51 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 q1-20020a5ea601000000b007d05927cb31sm1851053ioi.45.2024.03.30.17.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 17:41:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 18:41:17 -0600
Message-Id: <20240331004133.636618-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331004133.636618-1-james.hilliard1@gmail.com>
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711845711; x=1712450511; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RKxDZ8E8GRKQgtKDTIZszqOBrq3ponHAuaLEAQUpU28=;
 b=TC41JyPcN0cFezV0l53PoZ/LgWUn4RAskLdnz5XRLAovTEm1H0sAHqnFkjI6mPFyUd
 foN94MPq743+Te/UYkSvY0JN1mNsyyW83dOecHQUpeCTm7xBhvXCyiiOqlZD1tsJMNOP
 ZidXG7+j6oHRyTg0uC3BFHTA722bg1eaDXAWsJRmKUhqcNOs9js0Wkyz/kCPO3Dvej1f
 UrGHFHcyVn55XC2KZPplYY9HCRJorwOBX0pH9fS11RdCY02neL5qvFgQpI6X40ZvS1Pt
 FSHR9Z15cQlAtWjBn10lpOUGyg3iut0hFE8rzxEbfYotkaAcOImoWeutYL/heGOP6Pzr
 hU4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TC41JyPc
Subject: [Buildroot] [PATCH v9 02/18] package/python-dbus-fast: migrate to
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

We need to migrate python-dbus-fast to the pep517 poetry-core backend
as setuptools is not supported when building with a pep517 frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
poetry-core and not setuptools.

We do need to additinally keep a dependency on host-python-setuptools
as that is specified as an additional build requirement.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dbus-fast/python-dbus-fast.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index b890177c74..1456ce5e4c 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -7,10 +7,13 @@
 PYTHON_DBUS_FAST_VERSION = 2.12.0
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
 PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/f5/8c/220fcbe4337b842d730d5752f207fc8efd3a02405c71c329e61218e947b8
-PYTHON_DBUS_FAST_SETUP_TYPE = setuptools
+PYTHON_DBUS_FAST_SETUP_TYPE = pep517
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
 PYTHON_DBUS_FAST_ENV = REQUIRE_CYTHON=1
-PYTHON_DBUS_FAST_DEPENDENCIES = host-python-cython
+PYTHON_DBUS_FAST_DEPENDENCIES = \
+	host-python-cython \
+	host-python-poetry-core \
+	host-python-setuptools
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
