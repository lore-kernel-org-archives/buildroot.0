Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464B9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:52:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C078E60F91
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C078E60F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99A3B81008;
	Mon, 27 Sep 2021 19:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ba_1lXHn3BwX; Mon, 27 Sep 2021 19:51:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F187380F81;
	Mon, 27 Sep 2021 19:51:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87D0A1BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8216E60ABD
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ioT0zP-gl96b for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:51:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9368460A57
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:51:45 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d6so53740160wrc.11
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 12:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jGCDKwddsyobYV38Y7Dbp297PPi23xsDXCs1SXYiUc8=;
 b=jF6Yd+/rKAdxNgHSD1zn8DkMk6n/pV4AITPsswc+FkHEts+ACJXhauS/FVOw97UOY+
 oCQbHu+bd4eAXkwr4Qk0brfAcwDJ91YJ08mP7EaVK8QF/Zi5ynf6KOGGPhrEyywNIHgr
 AGm17MuO0guEBBJPGT4T94dE0o+a0jLQOp+UOXfVahBpY5d8M4eW1LlvLWbg7AU0f2Yy
 2lNoU6GAaXIJcG/ZxHUxP8iQ66PUMdOjZ2gYo1Bw1uDEbf8Wbc0SeDlDTRWToW8n631x
 RkiU3jx61tkJ9/El7xsa4CSIyCXwfdxa/tYpFoEJnADY+Pxn/Bd3JYEaqpfSqaB9bXmh
 TMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jGCDKwddsyobYV38Y7Dbp297PPi23xsDXCs1SXYiUc8=;
 b=laWtRaXltR0S8zm6RgF3gj70PcgTpqttH30ChInxXahBNLnG09ft3OkW9iReDn1CqR
 RbAavBANEqG3x1OwLk3zz2+VT+9fzVYWennzIrCdnhy3fdK3uPdxZJ1YbpNGGBcvDTlf
 Y0We+X9FjQ9aKGAYrqnng0QHqzPgpJlSb6fj2/v854GZ5U7PJ1aEdOpeSEOB99vPB3ag
 /ITzXs6WO/+9/vqnvPztt1ZS4mBVCMtc5X/oa9LtHdxQ+S5QE6LbpT7J+iehZC/r0sTz
 1WauRcLWDTLHG/NfpOlI5lnRRJLWN0mS9ZUokP5f4fi54m1IoK1OClevzWJFCG6l4+Kn
 m/cA==
X-Gm-Message-State: AOAM532/PJUTdu6ArkrjMLE+RijfMlg5Fu250x7mM1s4Katy23wKjK9+
 0pVMvyz8fviUzTQ1cL0AWgQLnX1SKuM=
X-Google-Smtp-Source: ABdhPJzFyTo5Kt8C6hOAccmnOm6yQAqd937vyWVu9rFVzTzW6lYZ8dEd+LvMM1uyTwsUKaO/9gQ6vA==
X-Received: by 2002:a05:6000:1379:: with SMTP id
 q25mr1974404wrz.429.1632772303703; 
 Mon, 27 Sep 2021 12:51:43 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:fc32:81cf:8e3a:84a0])
 by smtp.gmail.com with ESMTPSA id w23sm485359wmi.6.2021.09.27.12.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 12:51:43 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 22:51:26 +0300
Message-Id: <20210927195136.549542-2-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927195136.549542-1-asafka7@gmail.com>
References: <20210927195136.549542-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-babel: bump to version 2.9.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

* License was updated with a year bump.
* Indent with two spaces on the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-babel/python-babel.hash | 6 +++---
 package/python-babel/python-babel.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-babel/python-babel.hash b/package/python-babel/python-babel.hash
index 95f9d725fb..5211f20110 100644
--- a/package/python-babel/python-babel.hash
+++ b/package/python-babel/python-babel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/babel/json
-md5	83c158b7dae9135750a7cf204e6e2eea  Babel-2.7.0.tar.gz
-sha256	e86135ae101e31e2c8ec20a4e0c5220f4eed12487d5cf3f78be7e98d3a57fc28  Babel-2.7.0.tar.gz
+md5  7166099733d78aa857d74fa50d8ff58c  Babel-2.9.1.tar.gz
+sha256  bc0c176f9f6a994582230df350aa6e05ba2ebe4b3ac317eab29d9be5d2768da0  Babel-2.9.1.tar.gz
 # Locally computed sha256 checksums
-sha256	5a0df5d46e8cb14bd5d4c2cd77338b22f681fe88bd34236626b1a3ae3b50101a  LICENSE
+sha256  28c97bf33e7506e277487bdaa3a69b70f170d6af5a82785ac0a74c8428042e40  LICENSE
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index cf0a8ab14f..a503a139f9 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BABEL_VERSION = 2.7.0
+PYTHON_BABEL_VERSION = 2.9.1
 PYTHON_BABEL_SOURCE = Babel-$(PYTHON_BABEL_VERSION).tar.gz
-PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/bd/78/9fb975cbb3f4b136de2cd4b5e5ce4a3341169ebf4c6c03630996d05428f1
+PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/17/e6/ec9aa6ac3d00c383a5731cc97ed7c619d3996232c977bb8326bcbb6c687e
 PYTHON_BABEL_SETUP_TYPE = setuptools
 PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
