Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E63C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 14:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD483408CB;
	Thu,  3 Nov 2022 14:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD483408CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eo1rUkVn5r8i; Thu,  3 Nov 2022 14:08:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E53C41673;
	Thu,  3 Nov 2022 14:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E53C41673
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9CB3D1BF38A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77C0B4049A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77C0B4049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_ZCKxDfGmtC for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 14:08:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9690B40297
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9690B40297
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 14:08:04 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id y6so1377517iof.9
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 07:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rQUaC1eUB1uPwqK2ISVLTfcbQ7WY7DGH34GV7gd29Xg=;
 b=cVIvIAyrYTSwZAwm6WSErhl5O4udWcbxTXRAPAdHIUSSq0hz0QDNVhUx+UrEBJY/Bo
 //nhHiQScQBm+A4xJNEq+PAA0zdzjcBxxoATBOHvividgJmc7dygO39l+ecbiSosd9LC
 jlRtUlhlSseE8Qii9LkF8CQNATgsE5hr+eEVkjHEL58YTl6fEPhSmxy2XVvLsN/UYbHQ
 l4RP7lhYQjzrn0zPXai+P6ljivzGpcDRfARMSnCFm8zhin3/miWrLGoODavl/mwxJSln
 7uVqKCwmmUegofJI2JOuHBuAXa6JwKIYbpflEiOlanUM9SI2PDESH1KNK17oRHEMN7/M
 LI+A==
X-Gm-Message-State: ACrzQf1wFz8FsXqdwDcNlsjE3XPhM93WS5dlcS63UAikvRzRa78cEprG
 5p14pQEJc7LLtyZxCC/2Y0z2w7HdvmRAFoFc
X-Google-Smtp-Source: AMsMyM5Y6U3b47nh9q+Ylv9lMh1AB8N/imWaPOIymsnv68nxaviCR++oOdasLjFgI7LS4wW7SmKtkg==
X-Received: by 2002:a05:6602:2f02:b0:6a4:5b5d:9dbb with SMTP id
 q2-20020a0566022f0200b006a45b5d9dbbmr19061797iow.32.1667484483368; 
 Thu, 03 Nov 2022 07:08:03 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 t3-20020a92c903000000b00300df8bfcf5sm366490ilp.14.2022.11.03.07.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 07:08:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 08:08:01 -0600
Message-Id: <20221103140801.4166259-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rQUaC1eUB1uPwqK2ISVLTfcbQ7WY7DGH34GV7gd29Xg=;
 b=RN/MXfNTsDao98x5zTUOgoxAx8/hOJ6U4asccmSAfdQ8rceO9On8Le1+a6dUs/+MOD
 /64l8r4CjhcAmLEEVeK7fDHtbZq54VuRYmytDIvanwIenT3r+vzW6ZgeU4znSkUMKxu/
 cOlFdN1hoBKi7ssukCYnksHb2lUm/074k9Dwa0Tuotp6K4eCrFhg8DnLFJPcutEtMzok
 lQZhUGU8vlbRNjnWhNjNnwXhgxmkutknZWtaPnsFkeCoGJeWlZlt1mnAQY4RMv16PX3r
 aROZQtdi1/xHntybTjBeJj++8zEB8viSzC4vMB4D+qbpSah7ylujJfj6rAjJ8iVAXTJT
 ftww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RN/MXfNT
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic: bump to version
 1.10.2
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
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 215b5d1714..a5eb025fcb 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  7845d2f3c8fe8602f73f53ec5b6dfa29  pydantic-1.8.2.tar.gz
-sha256  26464e57ccaafe72b7ad156fdaa4e9b9ef051f69e175dbbb463283000c05ab7b  pydantic-1.8.2.tar.gz
+md5  9691f29e97c1280ab56b7d0a2dade9c1  pydantic-1.10.2.tar.gz
+sha256  91b8e218852ef6007c2b98cd861601c6a09f1aa32bbbb74fab5b1c33d4a1e410  pydantic-1.10.2.tar.gz
 # Locally computed sha256 checksums
 sha256  9e3946690ac88b6b73e8f001a0586af13568be8852fd514e4393f39761764387  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index b282241506..04014214e1 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 1.8.2
+PYTHON_PYDANTIC_VERSION = 1.10.2
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/b9/d2/12a808613937a6b98cd50d6467352f01322dc0d8ca9fb5b94441625d6684
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/7d/7d/58dd62f792b002fa28cce4e83cb90f4359809e6d12db86eedf26a752895c
 PYTHON_PYDANTIC_SETUP_TYPE = setuptools
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
