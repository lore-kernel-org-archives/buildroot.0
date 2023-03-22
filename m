Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB26C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 00:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADB5F40B63;
	Wed, 22 Mar 2023 00:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADB5F40B63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5TTum60eWU4u; Wed, 22 Mar 2023 00:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E916A40154;
	Wed, 22 Mar 2023 00:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E916A40154
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09B8E1BF5F5
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 00:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D968660BE8
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 00:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D968660BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PIloaHt_D_CW for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 00:18:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F303F60BDC
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F303F60BDC
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 00:18:01 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id i19so9059433ila.10
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 17:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679444281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hym1wxgzzSTbwU8lbExJLzXxXJZB9V8pMfQ4MTycW3g=;
 b=p0DkjaMZplEQaoDuJb/OR55UA7aAVfoceENDJiOfAAyIsXSUO2nFlYUc9YQpE1qWWA
 WXwdOCZlP3HVcifsua8hqTg9diB8Cb/r/YsbTcGfcXsPOvT90V1qzEQQs8dpb2bsZI+9
 ouNdH04fSjL6zwedg4wzfqVjoyc8zxks9OVWkrLEl6E8RuLjSUFsk8VkhNeHziKdoGRJ
 Eo3aKfRcC7JIf3DZtQ8sJhQMF+FP+G/od5NDdBTI7p0s+6kUpW1Uu1meRsyyfGpa3bFT
 BJkirbH7rdfCbXqEyR4bswh8wc38VYJLQdceFvDkpnd1SgsUfZYfJJqR+d/yiaptNjt1
 Ie9w==
X-Gm-Message-State: AO0yUKVzH8FVROnLT0p1Q8SKMaMTc5V0Pn4MZflKYrvLT1GQLvFDU4gE
 wauliRqIneYyhlzconfxmQfZyQqENyIDkA==
X-Google-Smtp-Source: AK7set8lLuPNPzik0L3LzezxuM+n31oi8WOYHMP+3rv0FELpbC8Gn/PB6/06K1f2cxejEA6URF8jSg==
X-Received: by 2002:a92:d78f:0:b0:325:b9ac:9451 with SMTP id
 d15-20020a92d78f000000b00325b9ac9451mr851005iln.28.1679444280703; 
 Tue, 21 Mar 2023 17:18:00 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 t4-20020a025404000000b004061dfd9e23sm4727056jaa.19.2023.03.21.17.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 17:18:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 18:17:59 -0600
Message-Id: <20230322001759.4071772-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679444281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hym1wxgzzSTbwU8lbExJLzXxXJZB9V8pMfQ4MTycW3g=;
 b=cX3Vi1rYK1yMr2H1rOmmKdKAAwd6nqaziB3D3RQEN1Thb5q3sOU08ra1AcnpzSXHKP
 7AR5j+I7r3LpbfxkSKu4T2gycKORvZEeghWLTqvzsJh3gJOE16QAiGBa0w7ABtqweQHw
 V9QIb6Ul0AbNHOBAijeRKcP9n4MsfIVTSIEEO1bdNR4X0Wc58RViO1KL1ClZs6mpgHeX
 zpN11jhzOCAJiyklh0ZCDjswaMyy2T80eBk1AHGd2JjveDRJcwTPHbnflvWg0YEVXwit
 IgL8uUVSoEPvoDDIWo91VvHeguI7OPUs2goUqVO2kSpFGVQ2Ddu6OIwJ7T3vE5Wb4zDV
 t00A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cX3Vi1rY
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.8.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index e59b6969e6..0f687c7827 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  642653db642be1508e50fcdeafe0f928  aiohttp-3.8.3.tar.gz
-sha256  3828fb41b7203176b82fe5d699e0d845435f2374750a44b480ea6b930f6be269  aiohttp-3.8.3.tar.gz
+md5  8208bc4b519ac4520720577f93561855  aiohttp-3.8.4.tar.gz
+sha256  bf2e1a9162c1e441bf805a1fd166e249d574ca04e03b34f97e2928769e91ab5c  aiohttp-3.8.4.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 8b0b15f13b..72fb34fd25 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.8.3
+PYTHON_AIOHTTP_VERSION = 3.8.4
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/ff/4f/62d9859b7d4e6dc32feda67815c5f5ab4421e6909e48cbc970b6a40d60b7
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/c2/fd/1ff4da09ca29d8933fda3f3514980357e25419ce5e0f689041edb8f17dab
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
