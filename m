Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39687C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01731822B0;
	Tue, 13 Feb 2024 21:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q2LZGjM723Li; Tue, 13 Feb 2024 21:15:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9E9F822B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9E9F822B5;
	Tue, 13 Feb 2024 21:15:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 79DAB1BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 671B3415FE
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sHtQ2O0iSL1X for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90C4B400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90C4B400DC
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90C4B400DC
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:41 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7c40863de70so217664139f.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858940; x=1708463740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZqqHELA/CVOmicaKVp3gK5eP2bAeZAPuY1v7uiTrI4Y=;
 b=duNpkgC5GU+tcIBYcZHGV7r7G4DQugyhZtNRbVwJEqiZOA71GUi7WXS7IVRUyBtATU
 EYEmQ/koN/0kIMXLFPouehacMZ3BkN9B4VYadX8NgP+6BLMPrPNHMQ3RqBEQ7eVPFBqC
 2mxnzNtY2jzedtPUPD/0jgs7fMZn/gb/6v9VJPpo9zEIeeKNHexZ9mVYCD9/nWj4iA+2
 VnfHEYjS8ttDljyHxXfFLHm+9LwxI3BA550X/1kSbWK+z2TcmJSdzdu0gY8t/NlPP82W
 3MOqDoOFBl45HJJeZ8NFh+uMgcsN/IaWZ+cgUtxIvSf6qXtDgH+S8yz1uA/SvteQ3ZHI
 XCIA==
X-Gm-Message-State: AOJu0YxobBBkZvTognVh80/0wtCcVfuztL6rBf9Q8A4nmX8LOEzEg9b8
 dRg5CEjCI4NBOAPXeAtbT5J0QzMqex9Hbm2OHELBzDY2aMmsFBWi519VdvV79wnRbw==
X-Google-Smtp-Source: AGHT+IG8glDAaYRjtydHYQ042xzGQvxuW2SvMXC85cv2QCjwv1CwWthSSVX+xqs5HPrfBgNlxFSK1Q==
X-Received: by 2002:a05:6602:400f:b0:7c4:3218:c767 with SMTP id
 bk15-20020a056602400f00b007c43218c767mr1173984iob.11.1707858938068; 
 Tue, 13 Feb 2024 13:15:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUmf8UKviCnxP4o+4J75lAQF/53pIEtw2IbnpGfFC4TRP39AtROOLUF/KQE743Jk812zWj/i8Jt3kZJKAwcLl9ZgjZrTrg23JcMuMTCUgDVxCR+XQ0c2U4PB97UHqqoOZaTVz0KO5G4CBKxQD+UkMP6fNeID4fuVR1nF1bRuRpgEDhLp3ky9Mj1KD+IN67wQaCok95cqC9jLBSt1LQOwMOfI+ZInCTI2ZEy3nquBpd30bsjo0RAK0punbe4jG5vgqKfeRrNoPnuSjn7Fa0duQYYpNpY60D8nepKMq0kC6CrhzZFULQWbpP0Ypo6zHQoLxcY9dVqmqwNc/OSfcrgMl/Low2UxPKMjAzxm3MJJz+nixE/HGG3royCRU7IQd5/AUQLfabkfy3t6VekGrwoffnitWeIGrMCTiCjB9KqBpkZ+MDwtKRLTRQfW+PyNXTK6RbVKDMyalXaAgMBDhXckgspsDpGFoPErI2r5w3NrSotSQfSu2IzxAoT/W+AtNZL5bEAZOtFwf+DgV7Z8Z3hWgEFTvGLpeQczunGRfw8z46TeoY9XXpUs3KSZJJaHY/VTcrI4Aj/K2ZWJPrLHqfYpttEgHVnr5M8JtNGQ7Nd3Md35vHNZaoKy8kmva8uVm30mpla3DwuKForEvS+EEwiJIT+3w1ttYZJvbaWoYXcwnsG7DdPxovjQVQ5Vj52BWlnaBIRxykIsED6V/4oluiPl2DEIEopduNJt8V2DenX46lFBsHcQLcV0g==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:14:54 -0700
Message-Id: <20240213211512.3918044-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858940; x=1708463740; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZqqHELA/CVOmicaKVp3gK5eP2bAeZAPuY1v7uiTrI4Y=;
 b=I/D1r0FuJaPQhHVQgPF/VrXwRYVKSiZ43U0HJT8mBiipX0WxpJShNVO2EnHkf1INSJ
 E8WOXof0kckLnbgd9JnI9eHLUEQ4gArbJI4av9UUV/xA3aDaKY5ka06dWimAmyQhFRgE
 RXAd/N2XC72Q+4/vKNk8yjHk6T/8vrz3k5QylhzoGmriULIoWo60UgdqvAnvtAQu/ehL
 kUgbwcFCudqaZJZ5/MM4ejSkXkZZKMn8yCK6wuIbkTxmf0TFzsD8nFO2RZzl0N5Xwezs
 6OARNC4wVUzswC538Lt47d+yubZT8d+0RATzrdhMNcq5Fdf1JIQ4JXYsyPEaawExTTwF
 tZEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I/D1r0Fu
Subject: [Buildroot] [PATCH v8 08/26] package/python-bleak: use correct
 pep517 build backend
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

We need to migrate python-bleak to the pep517 poetry-core backend
as setuptools is not supported when building with a pep517 frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
poetry-core and not setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bleak/python-bleak.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index ed3c3f2f93..716b6327ed 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -7,8 +7,9 @@
 PYTHON_BLEAK_VERSION = 0.21.1
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
 PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/6a/c0/3aca655fa43b8ff5340d99fac4e67061f53f42f092fc847bdd0559d67846
-PYTHON_BLEAK_SETUP_TYPE = setuptools
+PYTHON_BLEAK_SETUP_TYPE = pep517
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
+PYTHON_BLEAK_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
