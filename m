Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E549CD128A
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 00:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3025820FC;
	Sun, 31 Mar 2024 00:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RV8SFL_xEsy9; Sun, 31 Mar 2024 00:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD0A78213E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD0A78213E;
	Sun, 31 Mar 2024 00:42:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 829501BF947
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CA42401FE
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2woIT76lBV9x for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 00:41:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A391401CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A391401CE
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A391401CE
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:41:55 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7d0262036afso155849039f.3
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 17:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711845714; x=1712450514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2GSA/0V7R8HeIqRgMBuN4ZVqyFxVFuI5r0HKomM7wL8=;
 b=X2d/lWJmTTESPB3Vsgh4j3Pgc1cukyBjLFv9scqoBwfKq0e7G2zJHtjWsQQjg2j3XO
 sVdnYyn42lkOtz8KELGwtv/QHXdZYgkihKjZqUzMDTY/pQwgYZzEwiYSWQn+4ifCU1P8
 hWTXi23Fb0EBbUs+Fe5vK7KJvOsVUSa3Nj5q5vJacO6cqTIc/a4LmCk1BPZC/Szqq27Q
 zWLZJuLgrevA/yXtmDJrGjklKbBJbMpTGUNU0PXVoiEqb3hPKw21w6LpO8RilN7QcLTT
 ywSFyicgt7gLJGwCeQh0O4GpwgEFKZUtNUmFuv4kE1U4hJwWek6pxxSMd/da0PmHnidX
 X4vQ==
X-Gm-Message-State: AOJu0YwvCFp//AbpINRPTe9CSDEF7dbKwYHioYiTaVVr7wQtYVqiRZhJ
 URgfXJ4FnClqvZ61+Z5tDRARYMKP2Wk98LrgKVu2iqAzVKJKQRU44fBhNeQWTqI5aQ==
X-Google-Smtp-Source: AGHT+IFb5uOwBqhpLevrzCzbslnlWwynvb97owW8xNbkAuY7wTQTxyp2mxHTkvPLax9LKu9W4yaCvg==
X-Received: by 2002:a5e:8709:0:b0:7d0:772b:3f88 with SMTP id
 y9-20020a5e8709000000b007d0772b3f88mr6528591ioj.2.1711845713941; 
 Sat, 30 Mar 2024 17:41:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 q1-20020a5ea601000000b007d05927cb31sm1851053ioi.45.2024.03.30.17.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 17:41:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 18:41:19 -0600
Message-Id: <20240331004133.636618-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331004133.636618-1-james.hilliard1@gmail.com>
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711845714; x=1712450514; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2GSA/0V7R8HeIqRgMBuN4ZVqyFxVFuI5r0HKomM7wL8=;
 b=mRhsMEpsKV7O8Bxvc82w0MmiX9K8XPQJy5GuTbKh71DTfnLxglJ2m0d7GDsA2aLR8Z
 KxbOuepMMTBxMEVq22LEmRtZX/WXEmKTE1Z/LBcFLyNdfu42WTu0b3+RzxOFDIWYtYPm
 Nke+vlp4f8hlZQLIzXmw3Lek2aJnA9e9KX3z3tlOt9a+sufrTdUDYfI4Q4wV2xKiXCbl
 RlobLOngc6Fb/2s/X5smzulbr5x/THOG9QaM/7O8lhB4nxAaOEZ9BXyHGZcvQRP6Nk5g
 8GD/+AyoQJqqjHc52rjXOlbhbdA12rbXqXC11DjNtDX+tUs0vZiJTXA/U0/ZEoJCF7gC
 2mXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mRhsMEps
Subject: [Buildroot] [PATCH v9 04/18] package/python-flask-babel: migrate to
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
