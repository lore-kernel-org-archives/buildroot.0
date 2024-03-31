Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD00C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 00:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B7208213E;
	Sun, 31 Mar 2024 00:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaqzciVfWIT9; Sun, 31 Mar 2024 00:42:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F173B822A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F173B822A1;
	Sun, 31 Mar 2024 00:42:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55A9F1BF95D
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4251882173
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mFrxBSNnP5In for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 00:42:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8AED482182
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AED482182
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AED482182
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:42:12 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7cf092f6bb7so138980839f.3
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 17:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711845731; x=1712450531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YSxsfW/ITZwEKemOsvncEHOXicRO2tKX6wy8sM6y8Rs=;
 b=JILpMAWn3PrKDfdMOGLwA15KUR3vf0ZWO4h8aP/12kDE6hrC0Dh+FA4F76wDhCXsgQ
 TSfMfLhvrufZHtsuYA80gWeLSXa+HTN4GFT+Vyy+vjFQWHqzCqmpLkXely6iYj7/evdd
 LTa5ZJgF/9poadts8OkWqSUxGRqhic3CYEfjpYBtLUJA6Jy6PArzw2X0i30pzOpBXcQG
 1y2ckJg1ozcaCRmT1ZQyWhprfkXfalJ3fZDaFSX/ZvMZ9eMXFNpytzyqmmZUuzAoed3C
 pKkxhu42s4UEg2rim8KUv9UrFtGWrVkghTfuNAUPcMl0GyjDlNKgEmJqPGxiGthCS1b0
 ASkQ==
X-Gm-Message-State: AOJu0Yyc10wjF/Zwk5naJ8V8+Oq/MUsceRyb/URDsValMlsW5MUlhVhE
 cplBtZZchf3TLfoAZ7wbuWZLGgTRATYJqJ93fo70OVdTsDLOkicFV4LYbReSzQf48g==
X-Google-Smtp-Source: AGHT+IFohOmQYNWf9LpRH7hYAmwjYNl3BwiDZWBxjHQXi+G8zj9wd/+GWLjkIRHqMfwBVy3GLs8Smw==
X-Received: by 2002:a6b:6d16:0:b0:7d0:87d3:c471 with SMTP id
 a22-20020a6b6d16000000b007d087d3c471mr6640236iod.11.1711845731108; 
 Sat, 30 Mar 2024 17:42:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 q1-20020a5ea601000000b007d05927cb31sm1851053ioi.45.2024.03.30.17.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 17:42:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 18:41:31 -0600
Message-Id: <20240331004133.636618-16-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331004133.636618-1-james.hilliard1@gmail.com>
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711845731; x=1712450531; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YSxsfW/ITZwEKemOsvncEHOXicRO2tKX6wy8sM6y8Rs=;
 b=OsH807EJImkKtPcQKTQygzHraHoNVetd8tvqx/pKX8A7vWpYRST5bUIcp2mzc3Lxvm
 578cA/mkkO2Oz6rKgc1/YsquxUI3UEJhMgmdT48cHwI2rcF/BVcC3kz9qPozpsYVLECb
 4leT2HKWo5bej6aJdrr2RVoD2CH5X2e3o+ety27Heq2zuZSmiVZ2NSDo6qs+CtnFApji
 z8EGLfBrTIzrKdEKgnmZuWXRjk4WdcB083vvfgIEpC0/5gbUx1RhtIG0zeKnGYL+DBMK
 Brqk166wXBiUD5ZoXNcD9CITSGIlT7qCVFP++29A4RE/eDHhemdySqSC65k8Eqm2YorF
 hgQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OsH807EJ
Subject: [Buildroot] [PATCH v9 16/18] package/python-pyzmq: add cython for
 python-pyzmq
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

When migrating to setuptools with pep517 support we need to add
host-python-cython which is a pep517 build dependency for
python-pyzmq.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyzmq/python-pyzmq.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index 1d9a7d01cb..f1444b9124 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -13,6 +13,7 @@ PYTHON_PYZMQ_LICENSE_FILES = LICENSE.LESSER LICENSE.BSD
 PYTHON_PYZMQ_SETUP_TYPE = setuptools
 PYTHON_PYZMQ_BUILD_OPTS = --zmq=$(STAGING_DIR)/usr
 PYTHON_PYZMQ_DEPENDENCIES = \
+	host-python-cython \
 	host-python-packaging \
 	host-python-setuptools-scm \
 	zeromq
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
