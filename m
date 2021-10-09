Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC497C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:57:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8536860F5A
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8536860F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A80460820;
	Sat,  9 Oct 2021 20:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Urg2SsUt9PxK; Sat,  9 Oct 2021 20:57:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEC86607D5;
	Sat,  9 Oct 2021 20:57:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF84F1BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB88E6075D
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id siyOorwYjFhg for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:55:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20A916073A
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:55:38 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id t11so8447004plq.11
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 13:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aOFjhS2cMhtvsM80OCTKtmEp/NLU+85uJQAkKGWsJtU=;
 b=oxPb7/ua42WSnUbLJXZvSCbMEAm1n46gqpTO8Qv33+GTnELl88n5xP5SRrjXw8RWaH
 3cIYFVWLPuYotTULVHNWOlOmL5/PRWQaoih1tS2qhWh1dwGBYK/WooBhIo0umqN1V0vQ
 5w49T8FuegCExxwABZh0ZJBFxca3gprueMBhFFyifRrhvd8hfc9mVsAOvb0Twfx3RUav
 +3bHcRCHHCmizx8SpOWxlke6BbN2XMXPUj/cwSlA2GfdgxARkOfEBRkBFb9/+jIljtME
 woyYDav1epr6fxGDcQE+p9dHKdrzNGFUQ/p6cb0mQmInyrNE6jJWV1Y8290y3I54ZAfj
 hzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aOFjhS2cMhtvsM80OCTKtmEp/NLU+85uJQAkKGWsJtU=;
 b=okT3qNT6uz4GCS1keRzJ3x7FwqZ4fUZaxP6R9OfPM6hXIK2Y2KgvkohkHSiqGFAGQQ
 qwK3s0WvIjvvLbaOEIVIalKUiFSnYjtCAKFlp7cpDDyGCYhZO/UEcfy1Tn4Hau12joZr
 EIzEF0rVXCk00vYFpUggEm2DihBm8X71vEwA1RTXyXRAdtowKpz4/UfB2FGOuvRLrfKn
 nL+ga+c7Q6SAekoiPT9tHozKP488YFGN3w+wdi7+yERkG+nglNn9OZ0MCuTj3zh4gC5+
 kLGMfpTSa/rh1YYhO8JVvz6XJJtUfkfIYePXlAkVmmqVfQZ4aukJJj4e2Ej6TPSGgen8
 c3xg==
X-Gm-Message-State: AOAM530Apdqp2dUFxaeIJ8rgaXkBdgF3JNjODxqT1TNXX2VZRrV4cdsq
 4bYfZ6r+yUebY6EGyqGX6OA38VhwfSbQQA==
X-Google-Smtp-Source: ABdhPJyfQ83pVzcD1VFFlVP9O95euRJgHfqgTwPuXqLG58g+w84sjob0U6sa+eDW5SbnJpK1C1byaw==
X-Received: by 2002:a17:902:c950:b0:13e:fbf9:7939 with SMTP id
 i16-20020a170902c95000b0013efbf97939mr16386284pla.65.1633812938469; 
 Sat, 09 Oct 2021 13:55:38 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm3125765pjb.39.2021.10.09.13.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:55:38 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 13:55:14 -0700
Message-Id: <20211009205523.3137859-12-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 11/20] package/python-txtorcon: bump to version
 21.1.0
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
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python-txtorcon/python-txtorcon.hash | 4 ++--
 package/python-txtorcon/python-txtorcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-txtorcon/python-txtorcon.hash b/package/python-txtorcon/python-txtorcon.hash
index 803933f1e6..af542c7f2e 100644
--- a/package/python-txtorcon/python-txtorcon.hash
+++ b/package/python-txtorcon/python-txtorcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txtorcon/json
-md5	fb323f9874298a8145dbe8d43c387932  txtorcon-19.1.0.tar.gz
-sha256	25d8e52c3eac45bb90ff958ca7cdd7674fb3284e3a50826a58ab7b9578b15ea5  txtorcon-19.1.0.tar.gz
+md5  dbb53821a3ce3e921e09c5de4f722fdb  txtorcon-21.1.0.tar.gz
+sha256  aebf0b9ec6c69a029f6b61fd534e785692e28fdcd2fd003ce3cc132b9393b7d6  txtorcon-21.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256	3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
index 4df400c3e7..b8414d96d0 100644
--- a/package/python-txtorcon/python-txtorcon.mk
+++ b/package/python-txtorcon/python-txtorcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXTORCON_VERSION = 19.1.0
+PYTHON_TXTORCON_VERSION = 21.1.0
 PYTHON_TXTORCON_SOURCE = txtorcon-$(PYTHON_TXTORCON_VERSION).tar.gz
-PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/8c/26/d5b2fba4ffbcb23957ff2cee4d7d0a2d667372b9eb04807058bd561c8e8f
+PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/eb/43/2426009377cef519c53bdc8969590cb100e9fd745846859963c881c6d176
 PYTHON_TXTORCON_SETUP_TYPE = setuptools
 PYTHON_TXTORCON_LICENSE = MIT
 PYTHON_TXTORCON_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
