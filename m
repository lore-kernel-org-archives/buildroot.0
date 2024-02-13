Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCD0C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C6E0822A3;
	Tue, 13 Feb 2024 21:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iK1CdF2Du75b; Tue, 13 Feb 2024 21:16:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 976228229F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 976228229F;
	Tue, 13 Feb 2024 21:16:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A8C4D1BF909
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A41C160C1A
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:16:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NnEpt0tgRUCH for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:16:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F78960C14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F78960C14
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F78960C14
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:16:00 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7c3e01a7fdeso177587239f.1
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858959; x=1708463759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j8Mb4XX+60xDT6FnCIIuqVAkuW+CIQKQTlAVj+IWPZw=;
 b=jmEvVY5yQmqOZGclmDJTHLmIIzBVWkzeMRoDVdDnOCkbCM/xqF71UjVm1/WSJlGuEK
 ZohynHeDoFz6KnbRltmhwMmLQkhFK11wjGvDKoAtqLiwk0F1i46MK5HXHmVyc7vDJt12
 AfHHAzgFbkAyxsiybvNdxzl5OjCTuhwFLAnRnH0L4LmxCj6CVNcQNbOG+F8RlA54OBnT
 amw3zn1VBfq6wzNFTgbN4Hea9Jrx2Jp8FVoLuVxFrkbDb2MiYr2JSAWlO3eB/LyPJdKX
 XSVw8kFj3tW/Qed/0GsmTM0bYc5BxBd10wueBsLYC789IM+XZjbMbuXo/9isq9XqRhhU
 +WMA==
X-Gm-Message-State: AOJu0YxNxauogl0DbFY/r2s1at6Qavnn3ZRZ2Y9NsncFy7109HwKpi11
 T3ho/iyQNLL47OctHcIzSJvAH/F14QcNaNQQ4bXhAf3H0OzVyJ3By7EjQJo4McluGA==
X-Google-Smtp-Source: AGHT+IF1PsMzkBKs3qR68FJbdR2aztlOvR4QOupEG9z1VeI5mw+wGvvkzJwcT7QxLyHYeMsckvHP9g==
X-Received: by 2002:a5e:dd08:0:b0:7c4:cf:ef8a with SMTP id
 t8-20020a5edd08000000b007c400cfef8amr1164492iop.12.1707858959286; 
 Tue, 13 Feb 2024 13:15:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXx+wrOKb+a65BUO+j+ga38n0rdT6PwhAZa8iQNY0u7rzWZuouB97l5BWXIrT2XNYkOaIQ+X3RreOdlTaJz+PyVzKMx47i8cnML2bwhvk3xBBURfBUg1db/o5Pht5XD/eDLO+5X6lxIK1uyLXQNMBZsmWu1g1hJTqu+n8ey4a31DcgNnygj8c483ONu1p+XTJHbpzFPC4iu11zIIt3Mwa/sdkNiubVwCw9Vk8vHpbMMOrPMMIj1eQoBQ5PjrajDU1HzPcBZiVC0Zs7HCXpa6iBM4ISxSRCVbLTPaYe9UFQAl1HWu+9E9DLoles9vhnbLv3nTbTYTe8qMVZecX5e/gkFD+SsWJ0qlrXCqawgnhebrI3I17CNcNPnC+TIfOjmcxzZpJ3YxcJe3UnkJBG2QhD0PnM1z4DpV0S+ncGYxyAbWgM1xLm3cGmxUcUhLcpG5DvvbmrOWLZtLKpBsmAxI+k5YTW7RcJ/EKC5cRCID125vgfbrZQVauZYaLYI14v2ppkz2csnzycM2B3mhJozJhiqH+ml95rByq0Q+QCIh5tdPWerU40ArW5Qer27Z7myqKgp0P1c+BBv6V68pCApzYg7/YGfyy0iv21uLSAr+1D4y8sM2qLWeYx1uMvOSIe0HH9OCZbqfHAZ9x4Yf4PszbcvdOwHJgOEPGJlZ63V6MwV1EQ1joamF6pBeHbAH12QL0Lq23hjcFajC40GHALebdHJe4uMjIRAPA+Faf89Kxr6q4UWsKum8A==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:15:07 -0700
Message-Id: <20240213211512.3918044-21-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858959; x=1708463759; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j8Mb4XX+60xDT6FnCIIuqVAkuW+CIQKQTlAVj+IWPZw=;
 b=E6dk30CP24seKnGxVtgJyFPJdxSl0pKnU2KLvii2O04P+DeDH1DMXosJeUtdR8F0HO
 Xp3lw1s08+pJNuFj2DpW2weE1WKJnFTRUtaBaKoPccSNqbWnnj3VasjLL8mXq/P5v7ve
 njEi1LhkvqZe8/dr+T40eJRBcp1j5wxnYP39YEtQy80NUeObe5cAXZagHDG0MlcJi72x
 ts7SQIdhrtptpGdx0A6zUjJBzTyHq3UiAZ1g0nR9cTSu3rbMDM5cdhkRXZBN6U5hPK+g
 hiLhuylkKZMH7u5hYwOtuVzQ9Z8/zWfseg39FJjlJm8nchVqZyvOBSY4tYa2SJc6z9am
 vuXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E6dk30CP
Subject: [Buildroot] [PATCH v8 21/26] package/python-rsa: migrate to poetry
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

We need to migrate python-rsa to the pep517 poetry-core
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
 package/python-rsa/python-rsa.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-rsa/python-rsa.mk b/package/python-rsa/python-rsa.mk
index d84ba8b431..69a6309b19 100644
--- a/package/python-rsa/python-rsa.mk
+++ b/package/python-rsa/python-rsa.mk
@@ -7,9 +7,10 @@
 PYTHON_RSA_VERSION = 4.9
 PYTHON_RSA_SOURCE = rsa-$(PYTHON_RSA_VERSION).tar.gz
 PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/aa/65/7d973b89c4d2351d7fb232c2e452547ddfa243e93131e7cfa766da627b52
-PYTHON_RSA_SETUP_TYPE = setuptools
+PYTHON_RSA_SETUP_TYPE = pep517
 PYTHON_RSA_LICENSE = Apache-2.0
 PYTHON_RSA_LICENSE_FILES = LICENSE
 PYTHON_RSA_CPE_ID_VALID = YES
+PYTHON_RSA_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
