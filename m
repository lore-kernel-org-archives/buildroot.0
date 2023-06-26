Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC0AEB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 18:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 774A8409DB;
	Mon, 26 Jun 2023 18:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 774A8409DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vAaxFm-spHAt; Mon, 26 Jun 2023 18:16:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30E2441B55;
	Mon, 26 Jun 2023 18:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30E2441B55
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3359C1BF378
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 18:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1617B418CA
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 18:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1617B418CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OAMzwz8xsO9m for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 18:15:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1E60418A8
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1E60418A8
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 18:15:39 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-783549ef058so75135839f.2
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 11:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687803338; x=1690395338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f7DQFYPF2+BmzLHGDmAGb3VJefrZUYydxD4+lG51x2k=;
 b=bdYz0wmPL4cICtjlJMsTiWllMap+vdTIAinQjfhRHAqxBfEuKP2iUlNNhI6THpQSnR
 AfRAUAEcgvbS6T10MkUSSmrMHlmeE86WVcEKVDZAUBl0DiJ84bh6uvKxgXZSyNqaJ6YI
 EqlEwPNVLp68JHYPzLf0kzf/NUzGKB54Ra7LBydu7zoP/wjwFG1bxUcbCtsjejRwJu6P
 0mGBuOy3UQHfUtvrN7t8zr7+OyKdoL5FAFE9olOO+Rusv86CQag1jaZIcbHpsVebElhB
 0We5Ewb+cUvdC3Gxf1WtgWrhtm/PQykAoPbOWTxvFD32JZYnS25Lme85fJhehT2kD40x
 Trng==
X-Gm-Message-State: AC+VfDy9rK4VdeR+yi6pwT/17BY+NOvBBsngl6T2LmVMd9Vfi4mqbB09
 Lfe7LycYX9dVZyLYdMLFqSA2Hr+Rgu8=
X-Google-Smtp-Source: ACHHUZ76GrC4zy78ihTZavst2FXtcokJayjPlsvhkWHn0AQGSe94d9mYQr+lolHi8ZW7+w3eX+Jo4A==
X-Received: by 2002:a5d:8c86:0:b0:783:4bd2:3fd2 with SMTP id
 g6-20020a5d8c86000000b007834bd23fd2mr6510182ion.17.1687803338545; 
 Mon, 26 Jun 2023 11:15:38 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-17.hlrn.qwest.net.
 [71.218.252.17]) by smtp.gmail.com with ESMTPSA id
 z24-20020a029f18000000b004269bbd4586sm1867653jal.77.2023.06.26.11.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 11:15:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 12:15:29 -0600
Message-Id: <20230626181531.2312002-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626181531.2312002-1-james.hilliard1@gmail.com>
References: <20230626181531.2312002-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687803338; x=1690395338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f7DQFYPF2+BmzLHGDmAGb3VJefrZUYydxD4+lG51x2k=;
 b=DZ4LX51JUzMkITyp2d5kwrh1RL3HjMdNP9NaDYejhtVPL/abKMdPylr38tWAxhqO4o
 YUs9wr+fwCYPZ9YZXN/2fZphW0CkDHpwjocBegJD/iwGsphR0Beqw1yHTIzhS2jyCORh
 o0uXVnu90fdnmdm2WxmLho7Hy8TMPeImpi11sgApVLXFRhQL8qW/InAyrR+YyJDJAMAd
 OH7N4Yf52ZAh1sacWxuZHCq2+KIl5baqtsrHaagyI2je3RXCSr8O1Rt78HurxlU1lNg9
 UM7ehJ4KSv8kRDK8VVQd/8IN7afGOqS67BlaSyoUCnkO7jLWx6M00niPRu4TDn4O7GW5
 ZbFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DZ4LX51J
Subject: [Buildroot] [PATCH 3/5] package/python-pybind: bump to version
 2.10.4
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>, Michael Rommel <rommel@layer-7.net>,
 Samuel Martin <s.martin49@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pybind/python-pybind.hash | 2 +-
 package/python-pybind/python-pybind.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index 971eceaa07..154ca6d986 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  5d8c4c5dda428d3a944ba3d2a5212cb988c2fae4670d58075a5a49075a6ca315  python-pybind-2.10.3.tar.gz
+sha256  832e2f309c57da9c1e6d4542dedd34b24e4192ecb4d62f6f4866a737454c9970  python-pybind-2.10.4.tar.gz
 # License files, locally calculated
 sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index 1fd106b981..b96089e8c5 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYBIND_VERSION = 2.10.3
+PYTHON_PYBIND_VERSION = 2.10.4
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
