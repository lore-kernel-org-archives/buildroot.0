Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282BECD1288
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 00:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDF2682102;
	Sun, 31 Mar 2024 00:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zB_6dSYvjFwk; Sun, 31 Mar 2024 00:42:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04D2982271
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04D2982271;
	Sun, 31 Mar 2024 00:42:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20D721BF947
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A78A60611
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J7TjRt4k8AFj for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 00:42:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8426260622
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8426260622
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8426260622
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:42:09 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7c8060a8489so97113739f.0
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 17:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711845728; x=1712450528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gCZfjHW0T2bUUUkhl9aCq1nvXak6BP50PQnGOePk+V8=;
 b=w6pyJI9R0dpEyq4NEuXfzNQi2sdP00U45Vj7qJAYP3VX02i5LYz7IB1LOnxdTXRZU3
 UyDi+KSlBKaeHubDSIPuz3gkwJpXGZxMx8Cg2qW2sOfeJO8T+nGOX25cD0PZFQwP/k40
 Wb6IkoBIOeYBxxlFjn4tIpTNDkjypJR5BRxGXAe4uAk7kOsxW5sI+dpPhyPz2zqsYAvU
 GaDoJ0B1UuV70H2HE2ojCQ0u8V1gBrKhQ0AGDbOhaEdiWmafnB28iX0u8ihJfeQmek8+
 /VyXsCMqYtAsJ/pW96e7DjI4Jfl53q2K+/WlU1o/cF3gSY5yHGHvtCWa0LMlp+oio78z
 kMCg==
X-Gm-Message-State: AOJu0YzPcVsT5BcdXD03+uqddjnxcYrc0vRL/Z0+dGtZ5U2Wnu9stukN
 QaAf9gTXIiQ/z8770yawVXFzKbl+LoDiPNNzY2wYQdTtG8dBEw/rPX+Bohw2f0kWAg==
X-Google-Smtp-Source: AGHT+IECTKHDVFLgNr10DGWWkf4bh6gN3qTfJUaPCsNRj7X2NL6BW3nJGeK2z2uPBmy9fhyUd4pv4g==
X-Received: by 2002:a05:6602:8c3:b0:7d0:7cd3:fe71 with SMTP id
 h3-20020a05660208c300b007d07cd3fe71mr6413128ioz.18.1711845728128; 
 Sat, 30 Mar 2024 17:42:08 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 q1-20020a5ea601000000b007d05927cb31sm1851053ioi.45.2024.03.30.17.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 17:42:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 18:41:29 -0600
Message-Id: <20240331004133.636618-14-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331004133.636618-1-james.hilliard1@gmail.com>
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711845728; x=1712450528; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gCZfjHW0T2bUUUkhl9aCq1nvXak6BP50PQnGOePk+V8=;
 b=UBuD7FKQLE2junEJPJmaRirwG5uPHKm2FByAmVFYv57Px5ZZKY4csWlFmIrimlMt4j
 epLmbB8dehRvVt4WFNE3POz6ZjPK2OufpUrqknq3QnmRtEG1tEzmzb1j2WPzJh9vp9AO
 1GKHBi/KnvwR+5XiAeEIr/FSUruc49NMrJXPL9EONkz3iNl+N7I2ZqZSvGa9oD1P4COS
 QvXPL+D2vlpNaKmIQuxHXuWs1xi0regH3Z0o9cwq3k3Na3VZEUSDcllQQHe+ZqOwQ/iK
 EGzFAdoF7/gkplx6YGENnMHzc5FHNxc3o+aBCb2gAILFZRsDfr/iCUSLxwEGhUTSKexm
 qN6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UBuD7FKQ
Subject: [Buildroot] [PATCH v9 14/18] package/python-sh: migrate to poetry
 core pep517 build backend
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

We need to migrate python-sh to the pep517 poetry-core
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
 package/python-sh/python-sh.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index af4da3f6c9..29843d645b 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -7,8 +7,9 @@
 PYTHON_SH_VERSION = 2.0.6
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
 PYTHON_SH_SITE = https://files.pythonhosted.org/packages/cd/51/7355831d8e1cee8348157d769ccda8a31ca9fa0548e7f93d87837d83866d
-PYTHON_SH_SETUP_TYPE = setuptools
+PYTHON_SH_SETUP_TYPE = pep517
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
+PYTHON_SH_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
