Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7751C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:59:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3227D61053
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3227D61053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 002724014C;
	Thu, 14 Oct 2021 22:59:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mAbQw48IAn1p; Thu, 14 Oct 2021 22:59:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18CB2400F1;
	Thu, 14 Oct 2021 22:59:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BFC81BF37B
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08F3B83183
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:58:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j0Iajg483omJ for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 22:58:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52B7C8322E
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:58:55 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id q19so6762519pfl.4
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 15:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aOFjhS2cMhtvsM80OCTKtmEp/NLU+85uJQAkKGWsJtU=;
 b=qwZkiM0Pb9p9yJnp3590arEDcPC0vMEQ+V17uTphux4PmDruwH6ylxQiTC7lk7Y+ll
 pX+CDZJohVjBPalaDylpw+oINTrd1zNAxj+SaqM3boX5WL0310Ht6kMXOudKyy2BwP7v
 m2jEVQKep9fL3C/6cGZBHFgsYA9Kj9fzGrMEEKz0fEximOeJfeGX1hIXnWEhbQdht4Qm
 IxftMUH66x/mK2s87glbaUgyUNp/CQrWxrg3NNH3cPgdfOjYGQnrp8Sh9iAXy0a+Qekn
 wT7gqzh+XQagap11mvTBEP8ifccTbVhGzFJadgqflSVGWksRCXPj6vxzOlmM2O9Dbryh
 wiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aOFjhS2cMhtvsM80OCTKtmEp/NLU+85uJQAkKGWsJtU=;
 b=MUuRHtXkGx5wbBvkCBzVoVl5nLuZJbG+3itBENC8uj8Qc+D8ofh1s1C//Pp/V+tUic
 QyFt++jIC9gB6ZmSjioRaQVdr5Xw/OYONz3V/NcZrngrXQRjA4l25wsq0d0D5W1yqc8g
 TJwGeAhOQD59Z24D2oEDbyBidrBsGbw4QbqY2vC3AkkSW6CBKXUN0d+d6CP/DjLtSfNe
 WDsnQxEEmpwulb2rLFD/aVPzMJw6R2wuruBOvDorN2DeQ83dZsReWzB7paZc4qV+972h
 lL+vK8LEADvw+LGSCLueEObUBF2k+94OxrdIKS8yZra6LpoJfnyanmeDo1X4FewIYdT0
 +nNQ==
X-Gm-Message-State: AOAM532N6tsY4rCL7aSZSAjj1vCH5kVqXgY0bguwzMtnNxJ7i8Wuh3mi
 KD8PRDLJvm2KzKt7KexkxDx4rn/nX4c=
X-Google-Smtp-Source: ABdhPJxJaWf3XEBNanFohuKrzzFYl2vs5Sj639qdn37iYLreqZSYOqTPrOeQvYWOyZLwvGvr6dXQ5w==
X-Received: by 2002:a63:1a1b:: with SMTP id a27mr6376365pga.220.1634252334645; 
 Thu, 14 Oct 2021 15:58:54 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id w19sm10171319pjy.9.2021.10.14.15.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:58:54 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 15:58:41 -0700
Message-Id: <20211014225849.832479-4-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211014225849.832479-1-aduskett@gmail.com>
References: <20211014225849.832479-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 03/11] package/python-txtorcon: bump to
 version 21.1.0
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
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Adam Duskett <aduskett@gmail.com>
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
