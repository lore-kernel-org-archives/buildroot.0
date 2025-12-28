Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41EFD3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D106B81139;
	Sun, 28 Dec 2025 22:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbuUpUDQrs-0; Sun, 28 Dec 2025 22:13:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45CB780FB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959999;
	bh=QMIXZSTncyTyM/KjMQhd6S1B/lTtQfnR5tRpTzQ+gxs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=J83tb1qRJW1kJwB1zvhY3r9KTtB6dIqdXTjjaSu8eR1T4YMOD2KK0RskVTcxTtq6F
	 o9v70gdMSr5YAVshtazbOBssza3i314TiVe0uS4W9qj1j4xfjf+1fTpS9eSkyG44AF
	 D9S4geZnTItywKcBq5GCQQGD8vh2yixrzEEECqpJHpaSdyMj/XXTTIGVj2Nh9qzhqx
	 xHYfb2ozTqN/jEMb2N/U4vf4ADCBDF5BAJut2xOTY4JBf2Lyyh0cx05li+R9N74qqc
	 XM3NJPDHxS8DP/wCIgoa+5ARsOip6HVVsVmL+yPWyvMAiezLjf/K9dbyWCHqhd1AUq
	 Kjt+O+TZB1KBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45CB780FB1;
	Sun, 28 Dec 2025 22:13:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 66EE3D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D15E60A5C
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B3cFQDyrebDG for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:13:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c33; helo=mail-oo1-xc33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2EF8760898
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EF8760898
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EF8760898
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:13:16 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-65cfbc56a29so5648964eaf.3
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:13:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766959995; x=1767564795;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0mMDjkTCHWiDgIChPkSJxMWtSmAmYmzkIcQXBNRmH4=;
 b=bOsXS7P6qOlVAbAxArULk1tYoz/sMade9TqXhpFkM4hxdq9kanxhXeDE1c9Sp3aM4N
 wWi46kwWRhQyPLWUFv2jT5/BFSfw/9LvJ2GAwefax6ylg0i7dvA9YNKZ+u/c4ggFGaw2
 RyG7Tqj8rDNicqcoX+b/aN6sAyZXItRGkaXCTzg37eJpCXBFRJdKsZPNep7dXbbyujnd
 SseauE1nJ/KwoQ/IaqS1jf9dVumP+zvTA5N5kJqxeug676XBp7NH/nRAolRCxp6N6irf
 0vu84jC3NIPgbrFHveIyS0LMLLwsICAGGZHH1klKrFUSPjqza6cfHlKtRCjLCt+61edT
 +bDQ==
X-Gm-Message-State: AOJu0YzPEJQz52H/Io5GZ+1gyVVgQqa1pfQC9DVPw/QGRn2zhyyEEl8t
 8DRDDkLgNXHCDYpg3dsEldOaOc0aVRQHugLSk8qCamkERPuzDDVmSCUNSnqb+kxdspk=
X-Gm-Gg: AY/fxX6kqoQZuqk7XGTPZJdnB6evewM6prO0NNGAsG5KQPRBu3h+kP7O8zbbjgybfh8
 OUaEhXVzdFJm3fhQ5aIGnQNR3uPFY3vodSdDDHSSnjClLj3h5zj4EeUIUSA7CfbBbtHTF3GAgE8
 PKHQ6OkvJ/2Y2OltUZftzyhjFgXs0F84nduR1CLJSgDJGX/Rr3m1IrNsJFhF9/T+lD3tIQirJGT
 ox81eJOIsR5SJX2ysRePYFrRSdTLEW0Hd8bTD4CNfM2FNjbbokL0OyiKgaMFbpnwFrQI6fMA9PC
 G3Ny0NbxgyBblcBbImmf0n43HgNZSz9UNFJb6hxddFu8aJ5DB/iIBl1K02uQJwSNsEJHeexl0RL
 nFg5/wox1G+7qI2UgQ0YQz9tBBhvpgv3CWLazUYnQQ206obE64PSI9xg1gTik2qxX36EmkbYL8Q
 1/5iHGuu/5DnQnWWqIe9yF+XT7mhYcsS/non+BOBEJFAfsYymKEcs/DaV0nun6M3a734r9FcKRA
 5FWJQbnUW6VKhuHNu6T2DWZoJvp1c2XWh3h5F/qkIHEdGbAjh2bpbA=
X-Google-Smtp-Source: AGHT+IG2JXSc0Y6VHbp41gT63LWPCEt6yNLING4CoaAWp9KF3536d/09tbUQEvrv+H1uI5rLTgwthg==
X-Received: by 2002:a05:6820:1626:b0:65c:f583:d3cd with SMTP id
 006d021491bc7-65d0eab7e3fmr13712467eaf.55.1766959994842; 
 Sun, 28 Dec 2025 14:13:14 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaabbd472sm17442735fac.16.2025.12.28.14.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 14:13:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 15:13:11 -0700
Message-ID: <20251228221311.2757812-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766959995; x=1767564795; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H0mMDjkTCHWiDgIChPkSJxMWtSmAmYmzkIcQXBNRmH4=;
 b=JcVzIkzNVn9TjvAV/vcHz0jLJobPiKuWax7SeqhFAzp/8irNn0z4yvUKFA1foTzPD1
 Aq1VxAB0k9ruEkLGqxsBeqQ9FpPiPKxUZNI91vjNzYrYtdKZQO4qDTn9m19Ap/Dipwc4
 JZU7APUL/e75xpRPFAHMzpFmNH7HefR0Nic3ji/gNZ1BSumRl1fPeADkkmEYGe1oPVHJ
 v++RIFnnvGcdH4rYdXCRo/IBCQoSIdU5M96UjRZvuUauzNtNNvNtdrNUgapLgkFFV2km
 Q/9txIS5hGhbd1MI59xR1p8ygl0JOJy4tHBJ8f9IdEz6qoP1njw/vbolpDGg/5INFSWY
 QfAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JcVzIkzN
Subject: [Buildroot] [PATCH 1/1] package/python-pypika-tortoise: bump to
 version 0.6.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pypika-tortoise/python-pypika-tortoise.hash | 4 ++--
 package/python-pypika-tortoise/python-pypika-tortoise.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.hash b/package/python-pypika-tortoise/python-pypika-tortoise.hash
index 7e9f397638..9dc7ea9aa0 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.hash
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pypika-tortoise/json
-md5  5b5c1be4096c75dd6994336f71936383  pypika_tortoise-0.6.2.tar.gz
-sha256  f95ab59d9b6454db2e8daa0934728458350a1f3d56e81d9d1debc8eebeff26b3  pypika_tortoise-0.6.2.tar.gz
+md5  21a08e348b537e745964323874f5a6fc  pypika_tortoise-0.6.3.tar.gz
+sha256  6e17f00e77e78468836cb5c63eb6dc01445f83b1167e4f29f1c678949179c079  pypika_tortoise-0.6.3.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk b/package/python-pypika-tortoise/python-pypika-tortoise.mk
index 7fa451f67d..72669f36b2 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.mk
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPIKA_TORTOISE_VERSION = 0.6.2
+PYTHON_PYPIKA_TORTOISE_VERSION = 0.6.3
 PYTHON_PYPIKA_TORTOISE_SOURCE = pypika_tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
-PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/1a/7b/0a31165e22e599ba149ba35d4323d343205a70d91a4f6e8c6565f5b4fa08
+PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/cc/28/86ec1bccb2609d20349def444ef9dfe84aeccc984caa62f4634d50fee164
 PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = pep517
 PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
 PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
