Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F257C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 07:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 499764124A;
	Fri, 17 Jan 2025 07:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-FirtNwwlPt; Fri, 17 Jan 2025 07:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07C554125B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07C554125B;
	Fri, 17 Jan 2025 07:34:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E9F9131
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 07:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7B92833AF
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 07:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FnBnVn53pRjs for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 07:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 05A2F812F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05A2F812F6
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05A2F812F6
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 07:34:17 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2165448243fso40580045ad.1
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 23:34:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737099257; x=1737704057;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QneB86FBkq0ub6H+qCEmZl4ysAffp3SUEKYTBlAl+VA=;
 b=jaxzTpmoiD9mZ2GNQo5KXseFLBWRM1grVJTrpGm7rXBOmlHQbQRpi0Pqk+TY5SnZWC
 690Z3+sDUKBZJeuVjPZZSK8foaZJKvGZg+M0AThpHNfrhm14XygbcUY61xoEiadWUcMR
 sUHXAb0gmuZr2+OLSBKkBT2I//17+LtttRdteFx+NKiLn5/nSB1Q4daSLxDANoRXXGw/
 5tY/ggFKk6fAvUmOrIzX/reQ66IRLnUj5DtaO25OZKvhGOEDnHq6Ym88RRpw7bTxj0QY
 puUIjs+rT4vomo9lsWfz85GeaMg8s1PJfQVm5wsU22SJeMcUeoyn3LfPlS139yzoNBvI
 9ciA==
X-Gm-Message-State: AOJu0YyTbuShUkd+68gVDfusMi/QjCFFhzejIQHXSX09RRB7PXXJCbD8
 1FnYP7s5B8yChF5RjQHj+FxVyyTc2z5qqvOVBsoMhphMC0mHapOEQUB4bapn
X-Gm-Gg: ASbGncsRKcondP2v33WwamazCdb+P5PRbYzqpUe0hTqGEFTeSAZVgcOpCxaxVtAShTD
 INpssCD5cN9413F1sXwGf2kkKZpmMm1CooR3UCw94+w4af52RBqG7H6GMMtGuMLjvhWysLSD2O1
 jPNevp4NTO751xoE907RfOZKWjWwE/RAcv8gFJ+v++mfkAQoEag7+81uKHOufbEElBTL38vp5vy
 HDtJTmzesFM3eQeRmuj2QM6q5p1RybuG9Cn1CvDTMvMwwVJoxVVLVbWkogGPp8Edxck/piTFOem
 yoSK+3jRoSnePj5I0CtLYLjmZzMrOnpn683NXhz6
X-Google-Smtp-Source: AGHT+IFhe0nQl7o5BQ6Tn6sW7o27IYTpOlmZ/06FwM1JF5ftx0IK3agu4BzizMxgoW09s8SAiSU3ug==
X-Received: by 2002:a05:6a21:6da4:b0:1e0:cadd:f670 with SMTP id
 adf61e73a8af0-1eb2144d4fdmr2360508637.5.1737099256973; 
 Thu, 16 Jan 2025 23:34:16 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-a9bcc6f4d16sm1153037a12.17.2025.01.16.23.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 23:34:16 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Julien Grossholtz <julien.grossholtz@openest.io>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Thu, 16 Jan 2025 23:34:12 -0800
Message-Id: <20250117073412.840238-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737099257; x=1737704057; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QneB86FBkq0ub6H+qCEmZl4ysAffp3SUEKYTBlAl+VA=;
 b=KnVY6kg8wYd9jJBZTPEf/m8k050NPVOhTXH3iw6/7aSOfbVHhq89dP1nKesfRppTRm
 XaqKsrKvVVhudiOnDUaSIL+dS52kRP23fWJTLe11pY8DQwZwcS3LtNU8Rz1+SCT5+GgD
 sQjKQrH71Nw43iPmZWiBb0tinwIYuv7aHO3bYZXgcHugrKQDGg6log6MNNjHc2d2Gbet
 JxZkQhWLBmugkEHGiVsrpENFz9cUzU3yr+u80mTMsNuufozwQs0/Sdd3yQTJF6xVYg2r
 3lmCw4h5xfZZwe5c3+mkD96RAeJev8zohdWK3S7SgiT8a4xaRmVHv+MTXlpVZmdehRQN
 sbRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KnVY6kg8
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: bump version to 1.3.14
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

Release notes:
https://github.com/eclipse-paho/paho.mqtt.c/releases/tag/v1.3.14

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index d359edf36e..915897d082 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  47c77e95609812da82feee30db435c3b7c720d4fd3147d466ead126e657b6d9c  paho-mqtt-c-1.3.13.tar.gz
+sha256  7af7d906e60a696a80f1b7c2bd7d6eb164aaad908ff4c40c3332ac2006d07346  paho-mqtt-c-1.3.14.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
 sha256  bc0f3f447097eb82a29ad6c2f4929572bb548b6bd4c9e38fde1bf131a771b7a0  LICENSE
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index ec4e96c77f..0486d2ce80 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = 1.3.13
+PAHO_MQTT_C_VERSION = 1.3.14
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
