Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5A9C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0A3D822E6;
	Tue, 13 Feb 2024 21:16:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cj93oDSfZWYE; Tue, 13 Feb 2024 21:16:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86BEC822E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86BEC822E9;
	Tue, 13 Feb 2024 21:16:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F3411BF909
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BA9D41561
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GGPrsdTpYNo3 for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 14DB1402A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14DB1402A8
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14DB1402A8
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:48 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7c3e01a7fe0so230080739f.2
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858946; x=1708463746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2GSA/0V7R8HeIqRgMBuN4ZVqyFxVFuI5r0HKomM7wL8=;
 b=fyLJYCajuk6vZ0G3rsHKpLElg1qi7xRJSkZpK9nkn8TrHqnpOnTXWG1jPsdVY1Y+vM
 SaHjxWF6ejNXF2FQiZXXm71kvamHxFE2A8ZRHWZAeMbbGe9Vm3tP00M+hcXBiNdklY9E
 nt0zjFXrQai3p6tQl2ABjmAMH/hN8vE53xAoFusOBtTZyKverGdnd2USGhQCz9Ubgsmo
 worzMpNCruiBaPtn/NYiVXy/JknjoMc4F4ADac3L6ZxUbosyfbFVOauUDgZpvC+2IvJv
 8sCXQnsWw4MeFHxX0UMWuegHjIEsK8RL8fGjkC2UjpZ8ROiuOPKflzoWrLdofYOkNUcm
 tVTQ==
X-Gm-Message-State: AOJu0Yx5vQ4xirldi3Wyf32rCQ0j3fd2Z4GHEVMDy+OLk+m1kXj3rFzH
 nbcXkeMvKntCVEoNG5uVhU047bbQqrVcCshvUbiHWZ3Oupg7IsZPNoJ5T/BzCQiidw==
X-Google-Smtp-Source: AGHT+IGDTsaqJRyBFBKSJd4gAT27Steo0vU+iguAlJFOZd8QVCR9bI6GsRkku8qOkfwGYMDE+YB0Cg==
X-Received: by 2002:a6b:3fd7:0:b0:7c4:6c28:68a7 with SMTP id
 m206-20020a6b3fd7000000b007c46c2868a7mr813874ioa.21.1707858945915; 
 Tue, 13 Feb 2024 13:15:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVXwdmQQJAeoumXNG2VWbKtU0w0QZeFBEvho6mnxKwoaykwkmvJ4WIrYlfGUYDqsruLf0L769ETNo3H3YBL51fFeVB+O6s8iuG/hS+EkccMdbdEluR5fvf4i9k/ZNSwyL7N5PXWbBfJZoJ3Hcsuuvd9dC/SDaZPSX0jtd6VED2t+H+vPKy4bCkzvL6N8NLWO7gpWpm/zvnoEbVy80yhhMN2QfN3h3VhiM16NKAIy0uU/mmMjrCFUGo1DBdYrEuTvkKt0GbqerF40ouOSrHTVU2AisGL7zieod26GAmkGyGkwGtFM0XJIT93U1NRCcten4/v3G2jwyF09WXSCXZPqnTZ+E2Sqs/iNazhe6pUVDHdR0wYnexnVFe17Rx3hRDNLofT4KYHO51EgZPjwiH1FtIAHJWYKhAH7AHJpUKyAfVxyD7GAC69l7LRvl1SQQl+QZ9igON+9rsSoNeMFXvrohZ0cgNhTZ3wITncpkIyLwdGSTeMJXnXfVNuwHQyhKWu7cdZCa0aEMSPFNe62/Ce6G6tT66YfUbIqs8HBdnkPK/AAcc59co6PEoUJ8wtABBtFrWaJAfXKwTtu35h5E5LevKZ5bSKUdAYhqGSRRcxaDLqghd5kS7qup4ZIEtgEJOe5LsxVw/53wMKx2VKN4tDdQYUwOMlLKietk7k3O5IaIeOuNRvRHmNtybi5p5dDGDMBNjvs19vyGpjctIpFD6JcGquQy0oVvXa9LcKsOD4r/GXn9BChQrexw==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:14:58 -0700
Message-Id: <20240213211512.3918044-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858946; x=1708463746; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2GSA/0V7R8HeIqRgMBuN4ZVqyFxVFuI5r0HKomM7wL8=;
 b=W+8bnCmUIq5KYIylhNTxoeOeKT8uXApk5znXxaTanWGf7A1a11Mb9U/K8xFDkWx1cD
 KXjyQFj+Rf1DhNCYUQE+uchCMRuQl/OTI3HedzS0K/LdPJnfEiDPuTTeGwTb/FZkj2Lt
 YyKPnBp1j6F6rdUQsRWkpVMCLTzkEGxlzSReeKvV9McR/LCtQSYi3+I+fWNRVdR84JeH
 GYB1rwYTKamFBvToi8yBD+XaQCmkjbzpwtOIv9gGPZP/SWxjHb6PQQ97bj9BUkbJJV65
 iATwPgfVyKpky3dwtD/G3ZkwgNCRKJm9X7eNpyndwIinEsSmBvEwYR8JwBxNdJz8jbDI
 dnew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W+8bnCmU
Subject: [Buildroot] [PATCH v8 12/26] package/python-flask-babel: migrate to
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

We need to migrate python-flask-babel to the pep517 poetry-core
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
 package/python-flask-babel/python-flask-babel.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-flask-babel/python-flask-babel.mk b/package/python-flask-babel/python-flask-babel.mk
index b3ecdf6cf6..3970a14db1 100644
--- a/package/python-flask-babel/python-flask-babel.mk
+++ b/package/python-flask-babel/python-flask-babel.mk
@@ -8,7 +8,8 @@ PYTHON_FLASK_BABEL_VERSION = 4.0.0
 PYTHON_FLASK_BABEL_SOURCE = flask_babel-$(PYTHON_FLASK_BABEL_VERSION).tar.gz
 PYTHON_FLASK_BABEL_SITE = https://files.pythonhosted.org/packages/58/1a/4c65e3b90bda699a637bfb7fb96818b0a9bbff7636ea91aade67f6020a31
 PYTHON_FLASK_BABEL_LICENSE = BSD-3-Clause
-PYTHON_FLASK_BABEL_SETUP_TYPE = setuptools
+PYTHON_FLASK_BABEL_SETUP_TYPE = pep517
 PYTHON_FLASK_BABEL_LICENSE_FILES = LICENSE
+PYTHON_FLASK_BABEL_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
