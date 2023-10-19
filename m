Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B47DC001DF
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 21:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB9206FCD2;
	Thu, 19 Oct 2023 21:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB9206FCD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tV_kobqySSt9; Thu, 19 Oct 2023 21:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BAFF6FCDB;
	Thu, 19 Oct 2023 21:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BAFF6FCDB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 267AB1BF3E0
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 21:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E79EA4313F
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 21:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E79EA4313F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oPZ-UFXwYiVc for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 21:07:07 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6B6240106
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 21:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6B6240106
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32dd70c5401so104599f8f.0
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 14:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697749625; x=1698354425;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SQUReupat+/hUA5n9aJG3+JJprenv/pT7O8yX16Ic38=;
 b=n1kqP3sgu2YuHXNjCwuIMPOMC4E/FpTyPQeJb6cyzT4Env9YMgWjS1hiF3PiLj0Ldi
 n4kvai8pLkJzderPtgmH4ZR/eYWH+PhkoMiPfhkBdDjn0lt7Vhs5OFzMSl8wILJyPkUF
 50q3me4sYKQnzCryah2o/ZhBNMZq9Ea20K45Rb0g5O+4y2ubhfXMOT9uuRIIG4SOnj9A
 nLn7qFyYLrdah5UgDvbEW76qYU28EeBT5m3Mf6110WKd5McfbO9uXBx1I1+Pb4JETAT8
 G7jS2jIIpMgTT0K5lgY2+J3tRapI0YR9GLxRcK1SDa/2i4xdW5/AKsb+PtKyOC4JlDp9
 0fRw==
X-Gm-Message-State: AOJu0YxviWCBJrrrMNWTUfZBlpnwAzeYExp5jG1PxUe/iSGC7OsEZO34
 2sUwuFP1Rl+FGtQGGTq6dCrg6vmk37E=
X-Google-Smtp-Source: AGHT+IGnuEKobmiVM0FmjTpZGam8HEsJocKOUel7jiApj7zAtIxs5O5mGEpqLwXhkL+IWQXt/3pbDw==
X-Received: by 2002:adf:fe47:0:b0:32d:8c90:cb28 with SMTP id
 m7-20020adffe47000000b0032d8c90cb28mr2280470wrs.45.1697749625229; 
 Thu, 19 Oct 2023 14:07:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y10-20020a5d470a000000b0032d9efeccd8sm202750wrq.51.2023.10.19.14.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 14:07:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 23:07:01 +0200
Message-ID: <20231019210701.423113-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697749625; x=1698354425; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SQUReupat+/hUA5n9aJG3+JJprenv/pT7O8yX16Ic38=;
 b=NcmUrwNxv9S6gNtu8FY5umMtCSs5XdBGXUN5VTmUDbMADIbDRKQL+CXzZabHojMqxB
 5po3PJi6bEL+FL4TKHtKt5ii3f8GRBriel4JLihaK5s7qxhVxnxwuLIUnSXLPe+1Onbl
 jyLO7uToG0Jor6ADRLJEhYU7XmQCtdTz2ZYrErSk5KS96NE56FZtsf5Mex6rttrxY+sz
 5ZjTMc+rcjGzJGOYqM+dxOtBvx1RGSegG/Nab4JRBF3KuqlPv4C0UelmwkVLAOCgV2pK
 VmEIIM9wS2sZiKO+OuCljTZ/QNPktDVBMx0gbtRU3zgUZ8v/G7bTwRlze2jxgvmbdhjz
 mj4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NcmUrwNx
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: bump to version 1.3.13
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/eclipse/paho.mqtt.c/releases/tag/v1.3.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index 529c538ff2..d359edf36e 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  6a70a664ed3bbcc1eafdc45a5dc11f3ad70c9bac12a54c2f8cef15c0e7d0a93b  paho-mqtt-c-1.3.12.tar.gz
+sha256  47c77e95609812da82feee30db435c3b7c720d4fd3147d466ead126e657b6d9c  paho-mqtt-c-1.3.13.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
 sha256  bc0f3f447097eb82a29ad6c2f4929572bb548b6bd4c9e38fde1bf131a771b7a0  LICENSE
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index 8d1fe009a7..ec4e96c77f 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = 1.3.12
+PAHO_MQTT_C_VERSION = 1.3.13
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
