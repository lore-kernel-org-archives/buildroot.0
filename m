Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E896CD1288
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 00:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D09CC82124;
	Sun, 31 Mar 2024 00:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sVoYlnNcwtcB; Sun, 31 Mar 2024 00:42:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB69382173
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB69382173;
	Sun, 31 Mar 2024 00:42:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CEFD1BF947
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 843A44064C
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTCtzEMsA8-w for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 00:41:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4ACB440643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ACB440643
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4ACB440643
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:41:58 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7c8b95f7f73so71166939f.1
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 17:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711845717; x=1712450517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KnbhPrY13WjsvxSNbDdvbSpvZVXn2QZQERjvF9bT180=;
 b=YI8Kxb/ii3lXLNKTMSbuew2b51ENI2/OVHJ+qyq9IPPgVP6w68xn2YiD3O/sslkvO1
 nAC94+/ZBvXHXCtRmAdHAJ7ECCDvA51wvospckqBnLDybYWZo2LEccNU4zP2Jsk9Bv18
 JymvKm44067yS/3AYdLyTX7v8Cl8ioCSgvtWBqOQw5zh1UjTvDeD9Cb620E0nvw8qbdW
 KINFC0DdhUXotH47UM7vA/XGLQetqrfLc1plThvA0MBdRLMrgMKw++Jl9tjuhuX/JJ7f
 P6jm3CwGRoDNOdNAzW1kTTE8kHsUKiHKpvlzFUc/puL3eVnt0BwpohmecXOvlnkKHFKA
 oWtQ==
X-Gm-Message-State: AOJu0YzPnAiU+Iu8V4TNmwIh5rOMRfFRM/D1Vy2KAOHmS8uYHqe5wqpS
 qIcjwNzyN7cY6Dr2faPfqXzVshglrHJWOPO6TBPvbxDYd2G0msZZtkn0m2tSRPNTFQ==
X-Google-Smtp-Source: AGHT+IEP1XFKqGEt+2tlVCvX4FFn8g47UTxf4ceaE6jFuW4FPrCnr22cwan4sY/WVVAnDIaBTyqF3A==
X-Received: by 2002:a6b:4e18:0:b0:7d0:9c2b:e6fd with SMTP id
 c24-20020a6b4e18000000b007d09c2be6fdmr4011477iob.7.1711845716840; 
 Sat, 30 Mar 2024 17:41:56 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 q1-20020a5ea601000000b007d05927cb31sm1851053ioi.45.2024.03.30.17.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 17:41:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 18:41:21 -0600
Message-Id: <20240331004133.636618-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331004133.636618-1-james.hilliard1@gmail.com>
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711845717; x=1712450517; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KnbhPrY13WjsvxSNbDdvbSpvZVXn2QZQERjvF9bT180=;
 b=kTDCYL3EXVJhZjgY+JHEfoa5oub+cGtNRQ6pPE+2PWKn/OBcTE+FNrUyJy8bhX0RpQ
 r+v6SnWADH9+h1SAQbEGbV9nk9h3WZe2IYydlpSXQdFU1tbBZR3TCqDdeGR26cMzuKvi
 JZNGTcCawCIun0x4OlFdOAM6N8Z/LSokqaJk58BbR3e3IPrmTuycESx+5GDJCA9Q+3Gb
 QOLZs1zTHV5EH2TY1mIfsC7ScuFC95HQIlXubQo6+DBOPcKEJmDm6MP7d8kTNWJJM+Qv
 TFcrmBk8xWAAqPMWLEW/3iIQZnohoMDP76Mu8XaApu2+eEX46iJW1MaqUqfIaQrLJI+W
 3KJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kTDCYL3E
Subject: [Buildroot] [PATCH v9 06/18] package/python-expandvars: new host
 package
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>, Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-expandvars/python-expandvars.hash |  5 +++++
 package/python-expandvars/python-expandvars.mk   | 15 +++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/python-expandvars/python-expandvars.hash
 create mode 100644 package/python-expandvars/python-expandvars.mk

diff --git a/package/python-expandvars/python-expandvars.hash b/package/python-expandvars/python-expandvars.hash
new file mode 100644
index 0000000000..0123ed5420
--- /dev/null
+++ b/package/python-expandvars/python-expandvars.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/expandvars/json
+md5  8091f578a547e2b4b9df59100a179266  expandvars-0.12.0.tar.gz
+sha256  7d1adfa55728cf4b5d812ece3d087703faea953e0c0a1a78415de9df5024d844  expandvars-0.12.0.tar.gz
+# Locally computed sha256 checksums
+sha256  b8a43c35080fc5855e4f8171e4d0d002f6ff1633d8cfc0b5dee0ac4ced2deac7  LICENSE
diff --git a/package/python-expandvars/python-expandvars.mk b/package/python-expandvars/python-expandvars.mk
new file mode 100644
index 0000000000..5c9a7249b3
--- /dev/null
+++ b/package/python-expandvars/python-expandvars.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-expandvars
+#
+################################################################################
+
+PYTHON_EXPANDVARS_VERSION = 0.12.0
+PYTHON_EXPANDVARS_SOURCE = expandvars-$(PYTHON_EXPANDVARS_VERSION).tar.gz
+PYTHON_EXPANDVARS_SITE = https://files.pythonhosted.org/packages/2b/a5/46d1f58edcae1d632fafdfee313e378240e002ae45d26502bac938bd8751
+PYTHON_EXPANDVARS_SETUP_TYPE = pep517
+PYTHON_EXPANDVARS_LICENSE = MIT
+PYTHON_EXPANDVARS_LICENSE_FILES = LICENSE
+HOST_PYTHON_EXPANDVARS_DEPENDENCIES = host-python-hatchling
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
