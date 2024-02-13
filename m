Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8B1C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A842A822CF;
	Tue, 13 Feb 2024 21:16:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FV1-BirrbXqZ; Tue, 13 Feb 2024 21:16:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36F83822DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36F83822DB;
	Tue, 13 Feb 2024 21:16:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F9EE1BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55B9760C14
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xr2BcvuLlwWS for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 069B060C1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 069B060C1A
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 069B060C1A
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:45 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7bf7e37dc60so281438339f.3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858944; x=1708463744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UVg5JY1ebdCq6lejFie0ZDqbit07RK1GfiuF4dLYxnU=;
 b=LWu4U1ioWi55/gRfZXIUygmOtRczlbdRUw2Iw6Y+JCbw93pQCC5LogOH2fOEQFM0T1
 EXIs2bbIggQ4O87LJQY6Au821pR8d7a45FxH+Slhoea6YmQRZQ34v/wSp4a6MupfzQml
 s6z89c0VUQpR7d8Qe/rduM+43F+Y2GWTnJuT54gI18Pjo2k6mKG2mVmvYs/twyRlu4DD
 CWewKWVdAeuc7j591xjHbwTzAcftk3B78mNoFYHHvthRTmkch6us5/M1BFfbfwt5XArZ
 jzE7U4tjPMnkT3t7rmhnm8rKwOrfmUOoRhEgsfoXdfdB89fUL5hIvI69u1BZIDbDdeMo
 yNAg==
X-Gm-Message-State: AOJu0YzrK4mUI0q7B1JhVuxWexttzBlT+JS7AJhfVa6T3eq0qB5EdeD/
 xFYfeQUJLRPMrzPGOG/vDgvw0C6VIUPcTXrnEEDoWZf2B25PmODPt6BNv1pPNHzLvQ==
X-Google-Smtp-Source: AGHT+IEBcU4yzAq2ifq/70jmO98TjQfBSwr5jHMsOE0NnC0u3/Wm8b1ku8LCqBH/Nu7sQU/GewY1Jg==
X-Received: by 2002:a5e:a908:0:b0:7c4:4d0f:7d37 with SMTP id
 c8-20020a5ea908000000b007c44d0f7d37mr1037544iod.11.1707858944679; 
 Tue, 13 Feb 2024 13:15:44 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW9vefsHH0RGgyTbtKbYPCZEwKHZ6lX1dB62WemW5wAgy1vqtYFSpV3pGUfiqkRH3mccIZ/4ZamVsGwsye+/TgBPQAtnLKISqSrpFM1FkKDvOXQLRUpHPrQ4+11fc3uHV3KUvyY2Ow9J8IPWlOYssflsnTI74aTIuK04sXtzRKr0YZRxUasJKN3KVTyjrR/HCVin8K3ipW1obsiQabmirL3fgZ1FRDYwRS2GoOf0NNIbv3+kDgS/PgZEB6GlC11qL40Lq9y/CTPJw127xR/KFb1RBkettxERfS6szTxvoq4YHli1dxRj53Ocv5ltfuVzN0bJtE1+yYhiYZBG/JmkqZBNpAMK3Xocs9VDb5ihuqQpRilCZx8a+j07bm16ULoujmzCfruLNi4acDCwNkDwDqx1O2QOmBm43j3vhbMJiY1m0lvdow/rXvpMXPH69UD6Pxop4Uzv4Li3tudqIbCfgtBtxoQPrhs4NoVPEFV6GwLwGwo6KRYG+ljlN+QEZcu20ymXlaxJNCsAf1nRF6GXurEz6k+E6aQvEV+2KcRuJy6UtAp5jiq9myfE7BdvOJ9VOH4RQPQdyfHlYD6mbPnOK/CwSgOxoOPTlumFYW80wur6RH3gLCJIzJX8+HkiezokEVOgxFBKg5xAU3/Qm9hmtJkMMsbMLi0dVnR0yeznKGlgVASfRsC5UQboajb6YymFeOG6a3g3qrMzHOFne+6Oxq03Xl4uP9It2uAHBSGczq6MoMy/bOLDQ==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:14:57 -0700
Message-Id: <20240213211512.3918044-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858944; x=1708463744; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UVg5JY1ebdCq6lejFie0ZDqbit07RK1GfiuF4dLYxnU=;
 b=eabC8RiBGeh/g1HM0EPIpo4I2Gb56TUR3nZ8oBSDU4vjV4scLvVO+14R58Z4te7ald
 7oYCVI31CGBriA/aCDMablVJOEQyD/w4bhD7qiQAS6wnz0YNOtXZpppvWFKTN6ktZQEU
 4ClOG5H9Fmlhn2o4QxaVyejQRJC5WC/mLrmNg8rPJhXeCw6/q9MFNnBlnQMJK/K4inG4
 pDofeSAMJrda7etI5s809ZGdxQYu+MEnHHWVtH3MRNsgHYzUUgb7kjYmTHUTNvTG1i4w
 +oCH5dSkYmp8PbcvXZiyaY6hr4X7gAshHGnHCl9bo0ReVmnFv+jt+F3ymj/o+gOcpSNH
 pJXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eabC8RiB
Subject: [Buildroot] [PATCH v8 11/26] package/python-dnspython: migrate to
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
