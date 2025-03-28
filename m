Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B37C28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 08:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C9EF85793;
	Fri, 28 Mar 2025 08:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UmgM-M2jvC9; Fri, 28 Mar 2025 08:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C367A85796
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C367A85796;
	Fri, 28 Mar 2025 08:47:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 465D31B7
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 08:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C6D985792
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 08:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-CRZEc5hx0R for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 08:47:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5916D85796
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5916D85796
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5916D85796
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 08:47:48 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3913fdd0120so1085237f8f.0
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 01:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743151666; x=1743756466;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZZ09CCr/32/kuwNAKXVXGRlZPqy2BXvJgxeYkhCU/9Y=;
 b=PikyeSEJ8+aFkXigp4HT+vG15R5dtl2GVq3Mi2Lupy1fwzPwkrKqlPRN45a3edK+wJ
 G1i/huv4mEK4F7kYmmtVkD0qwLAcoH62ryHmXqTnD7dvlIO8fhNrlaMFWxz1lRw8MCqZ
 rd9FTVnwh1SpddOWRcam/qfRSgT0vVQvQ1VCyRKiEzZnqXR1X3eWiNyJy6uspvvu7IrI
 CiiJPy0qEtRcDTy7t3IRBd/jg4D3J6QWhAjVHQ01l0ukN7QUz0ACPO6G0rhshOMb39Z6
 JocRLEs6PPKQn5NcLhb38iOrG7xcpYyxjJjezIaQ4cwdImPO6YrTvWSxTTJVCd+Ckatg
 Gt0Q==
X-Gm-Message-State: AOJu0YzxyrS9p562IQN08DicIaXP+DeVx+xEeXzmOANtb6jet4kPcvC1
 gq3Vg6mPk5G9P1FLIq1IgmYgjR0aFYTy/iVsMeyAvqoH1uhYc1VKXlS7Msn8XUo=
X-Gm-Gg: ASbGnctCW/i+AfiJdoj9oarBu/9oOV9uxwHcZKgJP+uHtvw+Iy+ovVCRoyT4hQrewdz
 qWKjfKndHy+1ZK2Y2rIIvt+Yn159a9taTdu6ebqIO9SKH3q+80nuBhoMUn856462zcyfqvJq8ze
 vFg2i99tBwYYLbgtXr6owiKf3HqSHNY2+ygwDPsRBcjJDHK4WR31jQ6qVvzEPdjxP62UyGbuoYr
 vUqFMuaakIeHYQXL/D5zgnvkVBHUtEtMfRW4rmSGLboFODnlgeX9WWIhYR0dQkEGHcvCzl/dXFE
 rFCOIeGX0XKsgS1dfH0EZgO9XVi0Z7pcJSTaOOsZOQ+fagdEyXs6CWXXNpFHiw19O+e9jxPppg=
 =
X-Google-Smtp-Source: AGHT+IE2cp14r6DEtReSlQYNbLZH0LiwIUdF0LK2tV4/CxnfsxO/QQH6PXQD3tmNVKtz3+AfxKTVHg==
X-Received: by 2002:a05:6000:400c:b0:391:275a:273f with SMTP id
 ffacd0b85a97d-39ad17401cbmr5627976f8f.4.1743151666191; 
 Fri, 28 Mar 2025 01:47:46 -0700 (PDT)
Received: from freepad.iliad.local (free-reseau.vlq16.iliad.fr. [213.36.7.12])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e12bsm1964481f8f.62.2025.03.28.01.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 01:47:45 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>, Robin Jarry <robin@jarry.cc>,
 Julien Olivain <ju.o@free.fr>, Maxime Leroy <maxime@leroys.fr>
Date: Fri, 28 Mar 2025 09:47:40 +0100
Message-ID: <20250328084743.8759-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326132655.35729-1-maxime@leroys.fr>
References: <20250326132655.35729-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743151666; x=1743756466; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZZ09CCr/32/kuwNAKXVXGRlZPqy2BXvJgxeYkhCU/9Y=;
 b=SPIsBHetzK0KYnWxOZRhBPYxWBITv1wolPYr7QHrRJOMYsMfg1TsfOk6Af4tx96tTd
 sHZFfg5DPlyaGKiWiqGsCJLdxEj7ltCXMsYtQt1Y2rkMJttdpl9w+dpu6rHPoAbpJ/lJ
 w5lhAenphN2gq5mW0P9GUY6YaTXRN4vp9IlKX2GtphxIZGPVap3+xfbvjxPovofZvtV7
 XXQ1r+PL13419gy+JtC37ObjR7MzzH7QdOGXEFijFBtUCHpRPeIfLVI+Fau1z96FCHek
 vuRQcrQCyqYC7s/OO2BUjz/dPCCeBGZ7LVY2qAANslgftd6sGevLqnRu6JDJq5UaLh0a
 0KcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SPIsBHet
Subject: [Buildroot] [PATCH v3 0/3] Add grout package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes v2 -> v3:
  - Add runtime test
Changes v1 -> v2:
  - Add LICENSE hash

Maxime Leroy (3):
  package/libecoli: bump version to 0.5.0
  package/grout: new package
  RFC: support/testing: add grout runtime test

 DEVELOPERS                                    |  4 ++
 package/Config.in                             |  1 +
 package/grout/Config.in                       | 29 +++++++++++
 package/grout/grout.hash                      |  3 ++
 package/grout/grout.mk                        | 32 ++++++++++++
 package/libecoli/libecoli.hash                |  2 +-
 package/libecoli/libecoli.mk                  |  2 +-
 support/testing/tests/package/test_grout.py   | 50 +++++++++++++++++++
 .../package/test_grout/linux-net.fragment     |  4 ++
 9 files changed, 125 insertions(+), 2 deletions(-)
 create mode 100644 package/grout/Config.in
 create mode 100644 package/grout/grout.hash
 create mode 100644 package/grout/grout.mk
 create mode 100644 support/testing/tests/package/test_grout.py
 create mode 100644 support/testing/tests/package/test_grout/linux-net.fragment

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
