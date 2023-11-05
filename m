Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CD0C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 02:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0A0960A99;
	Sun,  5 Nov 2023 02:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0A0960A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9tSyVVu-XLSa; Sun,  5 Nov 2023 02:22:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DE9560AF2;
	Sun,  5 Nov 2023 02:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DE9560AF2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C03A1BF59E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 236F3403EA
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 236F3403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ta64j3Zq6o93 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 02:22:53 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D83F340105
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 02:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D83F340105
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7a66ff282baso88935639f.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 19:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699150971; x=1699755771;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nUzEUZLp29SPddLqrY8rM0aamVsA4/qTNkeO1Dtnafc=;
 b=asA67LuvJYWFsgoBlCPmdnUGnUpO6slvxeew/e+M0+k3JcO3mPdW6CyE0NHzG2AWQ0
 9MG1CF1Ch3HQZeKoNGOLMogjY2Ztk4Dnl7J4PoDzSyQRVIdeMpfq0AKydBjHHFrCCIXj
 a4KOg1Et+gsuqpin2aOehlcM51ybGdU19Q8arCoU+OyuRKzk0jWV7SF2n92rm1Fq9b3z
 KakpBwpDuRIG0EHuCCiLt8aFjoV2VEaLRQoRQkNlA6npEIom5Sbs8t/r8bgp6izvXr3H
 ouPonv5FpPxu2dGycPd/h3x+NOY+L/iZ0vxT7vaMXCQxsaZ4myTL2eObbKrXVvx0K9xN
 D41Q==
X-Gm-Message-State: AOJu0Yyo2E6vT2iDhXUiOV+Svl5d6NcAG2y+pqJ0kgWcJ21gJnvyKnol
 ayrpaiDKtu0HC0h4D3meWx5A2nX078Q=
X-Google-Smtp-Source: AGHT+IFVfEFl2x15lBjBVh9q9Sq/zIMQ4Qk33bl8RFJtsqg75i+hb0efoZJi2akK8QdwZ7n1x+cf3w==
X-Received: by 2002:a05:6602:2cc1:b0:783:727a:8e15 with SMTP id
 j1-20020a0566022cc100b00783727a8e15mr7580649iow.6.1699150971528; 
 Sat, 04 Nov 2023 19:22:51 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 n11-20020a056602340b00b007a66df53f71sm1541601ioz.38.2023.11.04.19.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 19:22:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 20:22:38 -0600
Message-Id: <20231105022238.2751431-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699150971; x=1699755771; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nUzEUZLp29SPddLqrY8rM0aamVsA4/qTNkeO1Dtnafc=;
 b=jTq7i82+pT+ozEv99SdadgrfeBTaCatU8fDvfB0odegnoqnYIVfjgNTioXtSapG/jA
 7bueemhs9QauOzGJxchOevUPluzk/9CUnmvSlr6U3NiLGUTgoTIqs1rEPxdx1w34IpKF
 TV5NICyUU9KPQUYqk99TyZI2bUB3hVO4HiIos5moeajXplmc9aeB/bD4oCGtOZIr9K86
 AGOqs/N2yh262P96R38Lw8GXE+1dJAMDADB0pzQbQjNphb4jJljAvuWrEzL7s0Ea5UYF
 3H530tIqSerxkwV1mqdDA2ko0MbHOMzWgZbNXncvx1lHuoKA4YupWY3jrPHZ5qKhphXQ
 +fXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jTq7i82+
Subject: [Buildroot] [PATCH 1/1] package/python-brotli: bump to version 1.1.0
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
 package/python-brotli/python-brotli.hash |  4 ++--
 package/python-brotli/python-brotli.mk   | 12 +++---------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/package/python-brotli/python-brotli.hash b/package/python-brotli/python-brotli.hash
index de4964dd25..e8036d3bb8 100644
--- a/package/python-brotli/python-brotli.hash
+++ b/package/python-brotli/python-brotli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/brotli/json
-md5  08f1f098697c64aa4596468b556d0c94  Brotli-1.0.9.zip
-sha256  4d1b810aa0ed773f81dceda2cc7b403d01057458730e309856356d4ef4188438  Brotli-1.0.9.zip
+md5  908d109a0309c33b626d01137eb4a060  Brotli-1.1.0.tar.gz
+sha256  81de08ac11bcb85841e440c13611c00b67d3bf82698314928d0b676362546724  Brotli-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3d180008e36922a4e8daec11c34c7af264fed5962d07924aea928c38e8663c94  LICENSE
diff --git a/package/python-brotli/python-brotli.mk b/package/python-brotli/python-brotli.mk
index ff78e6ab2c..865c4e363f 100644
--- a/package/python-brotli/python-brotli.mk
+++ b/package/python-brotli/python-brotli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BROTLI_VERSION = 1.0.9
-PYTHON_BROTLI_SOURCE = Brotli-$(PYTHON_BROTLI_VERSION).zip
-PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/2a/18/70c32fe9357f3eea18598b23aa9ed29b1711c3001835f7cf99a9818985d0
+PYTHON_BROTLI_VERSION = 1.1.0
+PYTHON_BROTLI_SOURCE = Brotli-$(PYTHON_BROTLI_VERSION).tar.gz
+PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/2f/c2/f9e977608bdf958650638c3f1e28f85a1b075f075ebbe77db8555463787b
 PYTHON_BROTLI_SETUP_TYPE = setuptools
 PYTHON_BROTLI_LICENSE = MIT
 PYTHON_BROTLI_LICENSE_FILES = LICENSE
@@ -19,10 +19,4 @@ endif
 
 PYTHON_BROTLI_ENV = CFLAGS="$(PYTHON_BROTLI_CFLAGS)"
 
-define PYTHON_BROTLI_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(PYTHON_BROTLI_DL_DIR)/$(PYTHON_BROTLI_SOURCE)
-	mv $(@D)/Brotli-$(PYTHON_BROTLI_VERSION)/* $(@D)
-	$(RM) -r $(@D)/Brotli-$(PYTHON_BROTLI_VERSION)
-endef
-
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
