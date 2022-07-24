Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB90C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 02:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6551F83EEB;
	Sun, 24 Jul 2022 02:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6551F83EEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hqdCTJkTOxM7; Sun, 24 Jul 2022 02:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7603883E6C;
	Sun, 24 Jul 2022 02:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7603883E6C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 640231BF963
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C1CB6105F
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C1CB6105F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bKq3S3f19Q0e for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 02:19:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63E6C6059D
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63E6C6059D
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:19:12 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-10dc6e9f500so4816177fac.4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CHyOMCU2q9KM/c10bm8vyC8t2FUSZzKr47XzzimTWpE=;
 b=MKgShPkL39m/GPvArcBMPKSvFWxO1Jl5+FtTGacnj0Q3EUjG3/NpxmsSWz0tLc82OY
 twzliVXQVgaSc28b4MrqImrAAD7KveSssqcRbmmplhihugN18gJCFqXQLawjc45W2coh
 pii6pHI4JEyYoe/wsoAGdGfRBBfYH93wmW3NDgOvcU7XxPJv98+8xNhOZC0jSqT82d26
 sTGMlyZBdPpHUNxbvdeQoty9B+7e2RR55sa54qL0Y8bZq48ft0j6SeOXJeXrNW5kW2lm
 ViJI+dFFSazPDHxPYTEL9nuE9bVySM3VmA8sMsumzb/obrkM9+JjFy0tUkfVBKcZiuV7
 iOkg==
X-Gm-Message-State: AJIora9S01dIQQSWm2dIUY/BSk1rxru3Qh0L9F9yVhnHYJa+0x3p/FXB
 0a81Y+QMUxZZ3FlRr0+BkYiQLh2FFMIElA==
X-Google-Smtp-Source: AGRyM1sSu5F8Z1ZPYAgpNcHwXv+XQ9NhBj0wdRfUC6NqsjIaNPIj8mk8ZrI6rys+AnHLIY0aF2lBrg==
X-Received: by 2002:a05:6870:4389:b0:10d:c0d6:9ee with SMTP id
 r9-20020a056870438900b0010dc0d609eemr3176749oah.239.1658629151094; 
 Sat, 23 Jul 2022 19:19:11 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 t134-20020acaaa8c000000b0033a40052fabsm3389606oie.38.2022.07.23.19.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 19:19:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 20:19:02 -0600
Message-Id: <20220724021902.1016698-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CHyOMCU2q9KM/c10bm8vyC8t2FUSZzKr47XzzimTWpE=;
 b=l8dhqsZ/ghkqLvsj1NsErnrnELqd3MSvYwwxXxirEvP3x0rh+Byl1bWHC5Iq6s9HbG
 YqTjkzbDEjr7X59hdROGNlhijVEZM69tCF1gAFpcIvN/iEIdtmsmE2IrqKhu+ukJoQw4
 sYJroW9viUrNvor3JLlHqslR9aYOzBWlYm3cx+os6+AMl5cvs5c7iOTwZx4TvY9uss38
 3Iel4dHxbfATe1ER3aQ2cvGllgZz2MDogUT8Dz4kwdRGqF/y1dLe6GTmzJwZ9Lc7OUx4
 BzvzY8eblN14YAYRXmU6ffiVupagVEWlAXUUeXfBmN7o8J77cenxEo/Fux5Yhkf24zRR
 br8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l8dhqsZ/
Subject: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2022.6.15
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
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 0245496ebf..4d3c20afee 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  880ed9e5d04aff8f46f5ff82a3a3e395  certifi-2021.10.8.tar.gz
-sha256  78884e7c1d4b00ce3cea67b44566851c4343c120abd683433ce934a68ea58872  certifi-2021.10.8.tar.gz
+md5  d8a2f5d006b656e2b9ee102a3be11a26  certifi-2022.6.15.tar.gz
+sha256  84c85a9078b11105f04f3036a9482ae10e4621616db313fe045dd24743a0820d  certifi-2022.6.15.tar.gz
 # Locally computed sha256 checksums
 sha256  be9d82f36112f87a7f1d74ecd4887e1467bbae8878a84004a00117b1e475a3e2  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 17098e3fae..6c8a7ffc2b 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2021.10.8
+PYTHON_CERTIFI_VERSION = 2022.6.15
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/6c/ae/d26450834f0acc9e3d1f74508da6df1551ceab6c2ce0766a593362d6d57f
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/cc/85/319a8a684e8ac6d87a1193090e06b6bbb302717496380e225ee10487c888
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
