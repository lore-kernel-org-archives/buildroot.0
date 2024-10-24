Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995F0D0BB5F
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 05:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5534B80A52;
	Thu, 24 Oct 2024 05:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id itpwLDTdap8I; Thu, 24 Oct 2024 05:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EE1B81277
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EE1B81277;
	Thu, 24 Oct 2024 05:08:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B4E527ED
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BA4540129
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqVkk9FfuNf7 for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 05:08:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F68240AE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F68240AE3
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F68240AE3
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:08:49 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-83a9ca86049so21033639f.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729746529; x=1730351329;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B1bx8wSmJoAQusX4n5gUUppDlpAqcqRCUsZylWiHxzg=;
 b=bONIkw3PJT8d7ZUgN0oBPsfF1QxfuKaHQmumrwRwozUxseSbDcZSPtHAcfiWPo3kg1
 MBFBXBgyY10dkJx1+ViOMcQQbXQYN+3iikdJkX5sQZBmL4G11Nyig70G5//Ul5bwJsfo
 H6RSoI38qHk7/ExuC/48o/gG5VtxOj9t1ZdN3FDuuA/EOS9OC9bp8vaKlRqIj9kQnkn7
 fUQ1BTfPNPex+VMKoeIJXCZwf6ChGR9riW+C39IhJQVM6bh5/IJHx2C2ab9z6YrSjR9M
 MDmo0x/bqz1myPhCwMf2UO5UNf+AJzha9szS5RTxA2ohug7D8e7iE1PqCP6KjZs7c2D9
 RjWg==
X-Gm-Message-State: AOJu0Yxo3ZAuyy/E+sth8dfHY/nPhw+jcdLOdHEiuuVsCjAGTpZqjUdS
 ulUR7PoYfuxqiV6DCAWr7tDpFKNxGRPKS+BdPuTwKd1oQdZw0nbZ5eZZBw==
X-Google-Smtp-Source: AGHT+IFMUm5LfKq1dteQnuqjBwOrLyEI6Xu6mcgo2zLGZamINMKKqwBaUbbFUynXBEpR5uE6hgv49Q==
X-Received: by 2002:a05:6602:6c18:b0:83a:c858:dc3a with SMTP id
 ca18e2360f4ac-83b041ac1fdmr79031339f.14.1729746528691; 
 Wed, 23 Oct 2024 22:08:48 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a588427sm2559291173.81.2024.10.23.22.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 22:08:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 23:08:44 -0600
Message-Id: <20241024050844.3388460-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729746529; x=1730351329; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B1bx8wSmJoAQusX4n5gUUppDlpAqcqRCUsZylWiHxzg=;
 b=lP49nuCZrGAoB2bDIQgqQ0q3t3+RJCY0XDLI+OGDcS4SEgo7AfEe28wE8PECXEpZQz
 F6zKKsmKxrRuFJxK5QRyPacjRT3JjhgS3lZb597CQXz+GPxvSQf74LNpCjuJBZe78ep0
 myGPx8BUa9eQIar+3Mxt540ffdeeyPytANyvvsGYhbKopHQPsRJdyvF0UEc5FLMR4+dF
 keA12Lbg77Tn5PRtb0VjMSiBrFFZ+UZLyemWB09/LVLOzqtxD4Tzn/dWH49Mtd/hNz7t
 ygJNoiq4q8UllhJA1ZzqvxTLP34fC110DaP6ggbgYVAcInqdgQDVhXs+qP0wQX9AGAPk
 5aQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lP49nuCZ
Subject: [Buildroot] [PATCH 1/1] package/python-paho-mqtt: use hatch setup
 type
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Davide Viti <zinosat@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-paho-mqtt/python-paho-mqtt.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
index 095d6e1f90..90ed8370f7 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.mk
+++ b/package/python-paho-mqtt/python-paho-mqtt.mk
@@ -8,7 +8,6 @@ PYTHON_PAHO_MQTT_VERSION = 2.1.0
 PYTHON_PAHO_MQTT_SITE = $(call github,eclipse,paho.mqtt.python,v$(PYTHON_PAHO_MQTT_VERSION))
 PYTHON_PAHO_MQTT_LICENSE = EPL-2.0, EDLv1.0
 PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
-PYTHON_PAHO_MQTT_SETUP_TYPE = pep517
-PYTHON_PAHO_MQTT_DEPENDENCIES = host-python-hatchling
+PYTHON_PAHO_MQTT_SETUP_TYPE = hatch
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
