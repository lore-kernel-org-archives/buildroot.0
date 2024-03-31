Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38899C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 00:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 581BB8212D;
	Sun, 31 Mar 2024 00:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14wyiWhR9Ujd; Sun, 31 Mar 2024 00:42:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 370588211C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 370588211C;
	Sun, 31 Mar 2024 00:42:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E72B01BF947
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E18B460622
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wggaSnnT2Rbt for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 00:41:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E149660611
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E149660611
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E149660611
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:41:53 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7d03a6a11a2so140606339f.2
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 17:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711845712; x=1712450512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UVg5JY1ebdCq6lejFie0ZDqbit07RK1GfiuF4dLYxnU=;
 b=ijK5qrHTC5ii4cQTtn1Dk421l1qD0cWk5Ge25j3eqWbbNEAwG1XU5sDFBGdFMySnzS
 3U7oWQci9uXIpwFtP5Herppc/aBqNEs6MoT1YvqWAMpu8M20KH5caqpuJcld9kZo3PUt
 8MZf5MrT89vOGJxLFgTrRSXpAWTcOyKsbEO/JpbzE6KL2/hfCZFUNjLcY0aDSAhSajSQ
 1lZjI6EDOySK1d37C8wUGx7k+S+LJ3TQF2rUxcfzgLH5waqSmibvlLcNlGUebbN0tai/
 0noz4QR2qR03Xi//J8CjZs8npzFdC5aWF18y4VLkCJ/SYmy20F3rpQalkGYXOKrPThdW
 uAHQ==
X-Gm-Message-State: AOJu0Yx/FRVur+c1UKYkwNB4z8/wFyYdA1EIqilK4q97ILtQJ3H8H0la
 r/g7D7J+8QdKSWSNWVz/URFpyOnHFsFk6Mm+R2EfcvmXTIxVNPtYhVjHcUyllIjx1Q==
X-Google-Smtp-Source: AGHT+IFvXzRjefqHY5aDJRu9ycBKVfZGuaXPwmg1ZDA7S8GAvY/71SuR/pkpXh2nxIyXU7/PhvEwLA==
X-Received: by 2002:a5e:c707:0:b0:7d0:acec:491b with SMTP id
 f7-20020a5ec707000000b007d0acec491bmr3263187iop.9.1711845712535; 
 Sat, 30 Mar 2024 17:41:52 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 q1-20020a5ea601000000b007d05927cb31sm1851053ioi.45.2024.03.30.17.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 17:41:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 18:41:18 -0600
Message-Id: <20240331004133.636618-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331004133.636618-1-james.hilliard1@gmail.com>
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711845712; x=1712450512; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UVg5JY1ebdCq6lejFie0ZDqbit07RK1GfiuF4dLYxnU=;
 b=IDZpIOzzSBgu8nRut10Mw8vUBP99AesLkTpunYo6tBrm2yrfYmuK3WoYZwHG0Y/7mf
 NgIPBzfKHh2xK6OCXmZkSttgo9t8y6Cz/uhryaBe+MVs+QO65JyLIUZ2KHm+0V9p2FVw
 0+y1s8/A0u+oPXVAEwxBjESGDAq5Fb+JU6/tfLJnWU/WgKAIWfGrGNEcH8cCPajSCF9+
 PM91XyI+kiWTLN9tfp/Ql8rBL/7aMUmhvdvBzPJqV9CpCTPFkbH9opPjC4l0RH6vs4q7
 7zFVMIraHGBfSxqzqa86SDLCGkaU0Av8efssb0nVSgf4tpPwh+kTcbORtZAGV6swtPQY
 8vIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IDZpIOzz
Subject: [Buildroot] [PATCH v9 03/18] package/python-dnspython: migrate to
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

We need to migrate python-dnspython to the pep517 poetry-core backend
as setuptools is not supported when building with a pep517 frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
poetry-core and not setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dnspython/python-dnspython.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index 1459ec8881..f0df733143 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -9,9 +9,9 @@ PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).tar.gz
 PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/65/2d/372a20e52a87b2ba0160997575809806111a72e18aa92738daccceb8d2b9
 PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
-PYTHON_DNSPYTHON_SETUP_TYPE = setuptools
-PYTHON_DNSPYTHON_DEPENDENCIES = host-python-setuptools-scm
-HOST_PYTHON_DNSPYTHON_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_DNSPYTHON_SETUP_TYPE = pep517
+PYTHON_DNSPYTHON_DEPENDENCIES = host-python-poetry-core
+HOST_PYTHON_DNSPYTHON_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
