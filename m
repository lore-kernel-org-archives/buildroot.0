Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB3DC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5AB382143;
	Tue, 13 Feb 2024 21:15:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ub95IAchGh4V; Tue, 13 Feb 2024 21:15:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B55382161
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B55382161;
	Tue, 13 Feb 2024 21:15:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F03F1BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFF4541561
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XwtuLI8mRg7v for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 939E9402A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 939E9402A8
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 939E9402A8
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:29 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7bfe5aa702fso188177939f.3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858928; x=1708463728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWL6QHxUvn0V20KF6ECJJDvxZvfGN19irkgkUJR2Owk=;
 b=jjk9bgdF3xiedjt5M0wUk/AnWG9zAyAZhlPXrMdnL7JjjzVbAXvETG73HDgtN558Oq
 7/ZV7bVCRgOT09f1ARI41dKIlD5Nu0QXUc0Aa6KnpweMUcnXufPbNaElwWkJp54+rkml
 dwixzyDxAj4hdQHKR63pwB1tXQM2ueFisuFaEX49cu2MZ20Q5CySJPbjzrM9ZCV51kza
 xXC8gn4JAfPHwMHzajnpP595rGUO8aMHPg/tQT171RFX91VEfmmQMlNZWYhzY2LH0Xv0
 S1qjIwKrZGQuTg3NPv9ylgXX8mC5bbDGatwmb8W4CpnSRRTekGuF/Hr4aQN4YCCdCUz1
 xwNQ==
X-Gm-Message-State: AOJu0Yzzh+pR37xHBDw5geTDgmRa0vj+YvpW2Shhc1WtZy+ZxqAWMuf+
 KkFBf5k9uKOOWU1gjxOFxwg3l06BQbbXPrLq54vAgP1dwne8cJwxm2kFMygEte31mQ==
X-Google-Smtp-Source: AGHT+IFHU0ytQzx05//uqDj7PFMAxcerBuCPbkufboTq0PzGIPDneXIPANHhz4C94FzyfuHYnlpKvA==
X-Received: by 2002:a6b:d914:0:b0:7c4:5fca:6e2a with SMTP id
 r20-20020a6bd914000000b007c45fca6e2amr1109019ioc.4.1707858928614; 
 Tue, 13 Feb 2024 13:15:28 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUl3V6+qfvdUeapH8E4lWPvDXTiuJWxA4pVNm5ZcXDalDkklWYACd6b6Jq8bK68G1WxW0rbLTbiAy+l6hNF2l41zXcqsBfuKm6i+TckARzDVRwGb81bCwlejraQIZkjbAYk3I2DffzEgt7zNGUSkMiPTZi432rnX8bA7VhCyYK0ozVyYRg7jLQ8eWOQ7jQi1XzUD1wrtVIpG+YA6rU4Ytb+v7kMffBtawo64zvYvc1gLhyVl+ypIO5yDJ1T/5xbCyGndJ6ELmlYzcW6XdRKOYGytIzwWQ7vy9St5ZF1+AAVoMWj8BHlMEMzOm7ZvyXMY8N6+bIlfrX8zsoO4qXu8M+i3YSU+7d/jluvMgvcZvhUR4gcelMccpoW98WyuC8h3yom1+A+M+YzwFqcMorp7u4Sls1vudHgZKDsYz/s8lfA+pvj1dYa9aDXFU4oeQeAr5pwCcfog7PRkjXa++tTokWCoWdhWCyUeFsuBakFu5I9Z3GnTIVLhePvb/yHpeGTOVluE8PeSiaCt1CJXC04y8FW8yuoS8qPKwWieFCLP9Or9xsG81idmV0Nxq0lLK9u29tYWanl93kRk2tJtYr3DZ9BCJAXJaja2MX27bMatQ8xcAdswxsLtzjwgYv2LJ4h3Ji++F4injtmUIRzAlsCale8DVWld0VH8yWJ5RfgcwY7rczi1Ay3+dETNokKmCSMEeEe+qnVTVFiphnlz5Ebfbmp3rNdW4kSwkLymKVjPMXv/XCp64h3rQ==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:14:48 -0700
Message-Id: <20240213211512.3918044-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858928; x=1708463728; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wWL6QHxUvn0V20KF6ECJJDvxZvfGN19irkgkUJR2Owk=;
 b=I5vDRP0ObVA1Tt3f8dJISEkCEvlcX1km6LKLq5LRPcqY3K459fb2ecU0OEojMWXUZu
 nZ3XitmNYrl8awh6rBVtkPbOvkPs42fGDb0io5UwF03uHmF32ztCPrVMy/n6JOJzXplE
 5ZWiqxj3EFZZlfiD4p8Kf/s/Fi2QWxlbj/ZzJ1O+FYHe1e6+h5Bh5FsAU9BUoauJUaDP
 M7OhV09JMvpwdZTqmdFRDEOWVMvCd465/RgH42yo+d15krqB3rlekFfyLtBXidOPhwOK
 Q1xJG5Br8oQxpvpJO7hrlzP4gVzCEt1zADBF78iEpFIZt1/nrbnsM8BtApxKLOZVGBMn
 UUCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=I5vDRP0O
Subject: [Buildroot] [PATCH v8 02/26] package/python-terminaltables: use
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
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
