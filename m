Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F9AC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 227B782341;
	Tue, 13 Feb 2024 21:16:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s3fuQ_TewoUz; Tue, 13 Feb 2024 21:16:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EC2582184
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EC2582184;
	Tue, 13 Feb 2024 21:16:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 636AD1BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67E2460D53
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hxf_JBEh6PXw for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E76A60C14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E76A60C14
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E76A60C14
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:57 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7c01af010bcso192593339f.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858956; x=1708463756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u79JFBpWVn0SMYXp5QMDJkAweI2x/wPR46GtRSk2hus=;
 b=PkvWI3Ppw9aAc4dSaFvwDqivA8n1/gt97g1AiBrTEHRPTQtgnpaizl8DyMDI0uo7+I
 ArVLC3QeLO3VXsO0muP8Pbpxj+tqbyfoHrgRkwyjEqPp1aGbEDupmEi/HF+iwtExdJPF
 tI0HABM3fkZl5BhBQeEHwXBj9RaUBGOizS5EPadqBJDZk68cXBPaUAJnRq1fl6WXQ2qM
 w2ZLq5f3ITkD3iLLTJvYLPNjdlOaRuUK5hCZr044YnXYuLnPL0aek7xJnmZZHKCczjLL
 +TQ980NQ3yT5bQzhRsc82LtEQknEs0vt/h0KQXTbAyHe/CV6zbRDZ0tgIHxOZK2uXK2n
 ouwQ==
X-Gm-Message-State: AOJu0Yx7jn+77qiH0xS4yMCBNXU42D2X4Y35g2I/hX8TKKXy884UrRr1
 lYfFXazw5bbqKUEPKx052rXC9ByY8MsIxMMwMF9kKVi8Xr7EEqs5EV4cRyP6K8/Uaw==
X-Google-Smtp-Source: AGHT+IHgkI2mIo6CmeuD7FgVmwyBsvIy9j7ZccSrd9PA+IQ0IdssVzi4mYXisrtA9gKwPVwabKWEdQ==
X-Received: by 2002:a05:6602:1d85:b0:7c4:681a:ec9b with SMTP id
 hj5-20020a0566021d8500b007c4681aec9bmr1018108iob.14.1707858956092; 
 Tue, 13 Feb 2024 13:15:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWlkN0UI+sNtb1Hs8LVGR7enPyHQJGmRl55tQ60r80XPSdkbIoVX88tIIQOHVWh68ayEpojzHXToGhsy+urhVxJYuFRGm/+fNeC3is7+PmYE3ebP0+p+KlaqFBmjKR12L8yWcZpf/QZdZtnkk4WVQ3d/DgU55idGXE5GzBu0O02Umc4pqUUWInfCtHbNGqZXFiwncoyA+nz61g/1q9U1iWIC6bWJCaBCmkU2M9/12pUuj4Nw+r+yR2ZStgkx3t63eccusOtERDLa0iwZfHOrB9eSyypRAOLfIaIbXfTyxDZjApxGjdoBvgx/uVkIhiq68mDOBHInDwj633GXDRFzUvPHqacpq+EJUJwTe7MykLj6QYnVa88KdoeqCZiel75KF6zRsmf9f++mcZQitapm8rbIllo4ZWSYHcDz0cF9yDiqu4RpBPgD0pw3pGFCs/labCKp5cFDwvpD7xyps0f9m8FdkXSPbcUCFBSTj+kvNKHUOebDciDU69cPsC36RKqAXpdKgNgeUVpVp+wdMKRSlKU6D6S0cRIfCe8qQxuU3w9+iG4wISeCzBpVih9dRav4NuOytTJdB5DQEsiBzhH2ZlSMIuRVVsGG0MM97ieJUiz5rF93wFODSWnOjOs1VrhQ9hD8DTu5aqTp8cx1a9bRl+3/Z5jPnt14h0DXDyUHf3eWEny1IwnOYr8In8JN00I/XU0yvBwJMWVYe4Lv5igZfrTymW2azKpwsKyHn+r3jKSZrt5/mGNPA==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:15:05 -0700
Message-Id: <20240213211512.3918044-19-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858956; x=1708463756; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u79JFBpWVn0SMYXp5QMDJkAweI2x/wPR46GtRSk2hus=;
 b=Q6fuzaKFhdOV2QmEZlos5eTbC/4heGaCuSUpwzemBMCCpTCRp1S1XcPythY4bfnhg6
 c/TuNByX//acag9AW3f0kVSj+pK40fEnpotHjhedsa9ag19E9G18o5foEK3RY53hdUei
 JVpRvuf/MxWWmG7m7/zZ7rBXAE4nj4Kb1h+RDGy2qcl8iz5H5MuWZURNgvqH23VR12qW
 PouyBsJRO/1/0fiYqz9CIQiwmprwCh+1QZvQq8XeVEnlRewueYey+J3pJxNW+tMFpiE0
 Loe++DtKhb/6X6gsdX/sH4liRJ+VmfoeqmV6x7tI/bUyzsBaWDAd+RCot9hyKqemih3y
 lIpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q6fuzaKF
Subject: [Buildroot] [PATCH v8 19/26] package/python-pylibftdi: migrate to
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
