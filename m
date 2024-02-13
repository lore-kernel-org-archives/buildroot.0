Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E1AC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B61E822E9;
	Tue, 13 Feb 2024 21:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LuK1u8jtjcVh; Tue, 13 Feb 2024 21:16:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFCA9822F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFCA9822F5;
	Tue, 13 Feb 2024 21:16:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAE4E1BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DC86415FE
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lhBQjz7HvWcA for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A21FA400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A21FA400DC
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A21FA400DC
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:48 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7bb5fda069bso231622139f.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858947; x=1708463747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m9Uvf3YCdQZMR0m8rqQTcdsOE8MnxR3ZR2K3rmL+rdw=;
 b=U0zsL6pAbDj2KoWCJa/P/zSZ8LCt1w1NYQtD1uYaEWg7pWcaiZxNtoxbbV9OZ6JW7b
 XIJCjQGQLqmYsCqTwGe/N39QwTdyHCm1TaEE+I2DOp6kQW8kBHqC+l+uttcpUkZ42sU1
 s4+lkMwe/weYLM9ybfxCPcE5Rrep3z8W5DZ4bKO4oOPKItM2MsRWEiz90AzBkLHc8xsj
 dm0kmRZNotGsabZi6LTX4A25qdkkqi/4g+txFCsT1GUeS76Xrl0JxqO1So1By+3OJCIE
 gdhTQIkIB1pnIdn+tXTjPAzA3pk5kXyMGpFRnZLz54oWGxv5tAWsVW3FdpsA85zyt2id
 wfnQ==
X-Gm-Message-State: AOJu0YyJflTFE0+Y1mFwW+K/yFJ2nnkxNKyolAo0rb3B4YLmWZWeOUNz
 qzq2RVCmBnQ2jpbZ4O3xeYTa3IAxW+x8AIHV8pP8dEf0AxOJzEwG2KGxVLrAb39W9g==
X-Google-Smtp-Source: AGHT+IHzjej7/d5giR4k6WCMW372Vd/unakox3r4TiKX2xblm/Dww3eg5w+KNH3UUID6G4NnzDGjDQ==
X-Received: by 2002:a6b:c9cb:0:b0:7c4:5a4b:9578 with SMTP id
 z194-20020a6bc9cb000000b007c45a4b9578mr928543iof.15.1707858947030; 
 Tue, 13 Feb 2024 13:15:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUqSsBgxZRBwEAcXNLKE5g1x3Ml9Md0N2JSsTLb3ya5w7re4m/RHNnALlEv4k+fE7XAwt5nq5bJPg4LCOz+ybmkDdSj4teTumTfT9vHegiNLSEnVSnhF3Luv9N3ger4BoXWu9PzL/74tK1KhSIYLnm+H6/JhXFEuWYNg/ZRxr/DVjTWL/qgRmfoJ7FqPYmyEx3xnStGy1hNVxqFDhZk5Vg0v7bFd6eSE99w3PgvlIM75iYDuBxrbe1k+k/iN1ZHMYb4yJd9ulnvmMsWUHL7afAudapTAdcc8Q16Z5yZyBNsiUmGlE4pkEWeDTXAJOg5e7QAZnhf1XqsOUiD1+hm5f+pIPIHks7IKOUR1oYZFdoddGpkNR0lakm2coVGQsATEIqqJqpXJPGFr6G0dbcxqd9FqM2cjXOVqh0DdvuWQABpGryX+cABCudLG1J+iVFrhgdEBmww4egx9uh+u92onvrLHwCPlqu67WVk9ASAvGGy3i5o1mZVM2S4cWomp7sWNS/WQn9NxajW5vl3Yn6Zdbks3n01UtyPlAKnprbKxXzaqKLc8mw7akBxWZUAPZ0C1Hap/1oZFScAe6T8NLuZcoFarGi8Hj3eQDqib0eNHbBjDzGgkTT2Pc+2ZHdmkp63TDMHKs87MlcrWJDKgEOpGLJd+TyEXq4fMqtUx+BUrkgpla8VAB9XbgNx+8iOT78t5aLSuhkpSVWPLlZ1Mu/Ok5Jdt2ChZJyldM+/1Rue07j1oLzD6dOqrA==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:14:59 -0700
Message-Id: <20240213211512.3918044-13-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858947; x=1708463747; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m9Uvf3YCdQZMR0m8rqQTcdsOE8MnxR3ZR2K3rmL+rdw=;
 b=OyaTQXSQ4ZI4eqCRBezmKOpcvQPcZzKnAsIxtowpGrnPlPhA2UEdfmcGKObL1Ouer8
 LZODHsjZBVl0RoB+lNPUPIesHu3Or96D7cOSWJEYRXTo+DgpDAC3PyBk/t+jmiKX0qVY
 AqqeCUYM5zE6iWEaJEJ3e6IY51HRHbDHYjjVdLXYn5Dp5A7IIWeCMSQlAnS4QMMKrya+
 dX0DVH9y0AVUYTXJfrydw6Jsx0vwfcnB3u1p9M6z4zh9Fj4qi2pQuX4lejxVP+yT9E4k
 fF45iZJBnekseVYHAPohCdoHA/vxc9rbM+AmIPwRamno+gZn9rY7O/enTolo339USXdA
 FqEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OyaTQXSQ
Subject: [Buildroot] [PATCH v8 13/26] package/python-flask-wtf: migrate to
 hatching pep517 build backend
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

When building with a pep517 frontend we need to use the specified
build backend as opposed to the fallback setuptools build which
only works when not building with a pep517 frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
hatchling and not setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask-wtf/python-flask-wtf.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-flask-wtf/python-flask-wtf.mk b/package/python-flask-wtf/python-flask-wtf.mk
index 8274585ad3..bb32d55e25 100644
--- a/package/python-flask-wtf/python-flask-wtf.mk
+++ b/package/python-flask-wtf/python-flask-wtf.mk
@@ -9,6 +9,7 @@ PYTHON_FLASK_WTF_SOURCE = flask_wtf-$(PYTHON_FLASK_WTF_VERSION).tar.gz
 PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/9b/ef/b6ec35e02f479f6e76e02ede14594c9cfa5e6dcbab6ea0e82fa413993a2a
 PYTHON_FLASK_WTF_LICENSE = BSD-3-Clause
 PYTHON_FLASK_WTF_LICENSE_FILES = LICENSE.rst
-PYTHON_FLASK_WTF_SETUP_TYPE = setuptools
+PYTHON_FLASK_WTF_SETUP_TYPE = pep517
+PYTHON_FLASK_WTF_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
