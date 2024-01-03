Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581D8C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 17:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12698828B5;
	Wed,  3 Jan 2024 17:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12698828B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GML0HHh1b8NC; Wed,  3 Jan 2024 17:38:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4156A82180;
	Wed,  3 Jan 2024 17:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4156A82180
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC6151BF869
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 17:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9537E82180
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 17:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9537E82180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hliCm-9SQUZa for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 17:37:59 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 480DD82157
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 17:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 480DD82157
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40d89105365so23886625e9.0
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 09:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303476; x=1704908276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u3Gnk9xF87zBzFutVEf+sz/7pRE5wa2vpPgNvZaluYM=;
 b=nlS4/xlLWmSOHXyE1fkC9PuaxnhJcbJsldkOT+BqQ3ARkMt/Mqkixk0/7QJyKbVK5r
 GnF2tlYiE7Mz5Tol7h2q9YiGHXOb99qVZvFgO8PSgcnoCWlVyGMdzguKbPuPzm0j39ht
 jXycJhPfxHrj8JrXSq9sjntUb/bVBlc7h6tjDaTbKG7kAp/ZIAwgfOOJnXQw2yC2+mUg
 tT0eViP8aeavi/LqTWQBTms4WItv4qHCQfW6iIbYGXaY/qQu0FpXlPg9AQ8AZNCUV29L
 oVy/cHIottWa0embfu5mb1woLYWGVSzVeNUl9eYXuC2m39dfFRTgwvktcZdN7mBXmov5
 98Qg==
X-Gm-Message-State: AOJu0YzP+gSSYyAUCKooiewkRsKWLwLEs08B0hls1CSHwoAtD++16RTS
 x7eO9Trp2hZA9ExvWYXomRD6DmRUzss=
X-Google-Smtp-Source: AGHT+IFp9PXSQopJaTZAUjxtZ+H3aPgpZ4aChVblxv3C8m3gfEkWqy2+CNBP8I7B+DHqq03uxx06rw==
X-Received: by 2002:a05:600c:3f9b:b0:40d:8914:cee3 with SMTP id
 fs27-20020a05600c3f9b00b0040d8914cee3mr2202960wmb.108.1704303476455; 
 Wed, 03 Jan 2024 09:37:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c0a0600b0040b3d8907fesm2976366wmp.29.2024.01.03.09.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:37:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 18:37:41 +0100
Message-ID: <20240103173741.850916-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103173741.850916-1-fontaine.fabrice@gmail.com>
References: <20240103173741.850916-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704303476; x=1704908276; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3Gnk9xF87zBzFutVEf+sz/7pRE5wa2vpPgNvZaluYM=;
 b=WTZVLKEcqG0oq4irrXpiJkQV4IFdid7X6ePud/wdEfTrzQJPqYyD6pCKSbmQGuudBx
 oM5B7CYWILqt9Hd23OvSlxzD/lcVFhbXiBsa3XpnL4yhrYzKZ9eAfUNHd2ULY3Ti2ue9
 qkhsPvp9PWxra5rn5B07gOcYkmOj/jgJ6YQIJjnbnXfLTEJd9tBHtE0YaI4+LT/89gCZ
 RI9wewTkVnEBRcUJ2TmzXlS/L5DGC6Dlj4T/Bfod70R36AoKbzOwxcK/w6MfNR2wSxun
 bcCAG50NIToPypfo6X8Y53QYBiWjT1lQOuq6vv3deUHFDWuSXU52QwP7Uj8YdjlORTCc
 kFpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WTZVLKEc
Subject: [Buildroot] [PATCH v2,
 2/2] package/python-pysensors: add host-lm-sensors dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-lm-sensors is needed to extract the version from libsensors.so and
avoid the following build failure raised since the addition of the
package in commit c8ff8d41c06f6b1cbc5cf8702a516411084ead16:

  File "/home/buildroot/autobuild/instance-2/output-1/build/python-pysensors-0.0.4/setup.py", line 3, in <module>
    import sensors
  File "/home/buildroot/autobuild/instance-2/output-1/build/python-pysensors-0.0.4/sensors/__init__.py", line 20, in <module>
    raise ImportError("can't find the sensors library.")

Fixes:
 - http://autobuild.buildroot.org/results/acd8583fb635ea27811405a2478182ddcd5642f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Brandon Maier):
 - Replace lm-sensors dependency by host-lm-sensors and set SENSORS_LIB

 package/python-pysensors/Config.in           | 2 +-
 package/python-pysensors/python-pysensors.mk | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/python-pysensors/Config.in b/package/python-pysensors/Config.in
index f8e056506b..952d14c351 100644
--- a/package/python-pysensors/Config.in
+++ b/package/python-pysensors/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYSENSORS
 	bool "python-pysensors"
-	select BR2_PACKAGE_LM_SENSORS
+	select BR2_PACKAGE_LM_SENSORS # runtime
 	help
 	  Python bindings for libsensors.so from the lm-sensors project
 	  via ctypes. Supports API version 4, i.e. libsensors version
diff --git a/package/python-pysensors/python-pysensors.mk b/package/python-pysensors/python-pysensors.mk
index b38c47f0c8..d006109d41 100644
--- a/package/python-pysensors/python-pysensors.mk
+++ b/package/python-pysensors/python-pysensors.mk
@@ -9,5 +9,8 @@ PYTHON_PYSENSORS_SOURCE = PySensors-$(PYTHON_PYSENSORS_VERSION).tar.gz
 PYTHON_PYSENSORS_SITE = https://files.pythonhosted.org/packages/76/31/d3383a192f31ce1d79f27ec3d047cca23dd82a1bf0939e774386aba37cf5
 PYTHON_PYSENSORS_SETUP_TYPE = setuptools
 PYTHON_PYSENSORS_LICENSE = LGPL-2.1
+# host-lm-sensors is used to extract version of sensors library
+PYTHON_PYSENSORS_DEPENDENCIES = host-lm-sensors
+PYTHON_PYSENSORS_ENV = SENSORS_LIB=$(HOST_DIR)/usr/lib/libsensors.so
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
