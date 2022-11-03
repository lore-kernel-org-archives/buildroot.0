Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C157BC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 00:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 696EA81EAF;
	Thu,  3 Nov 2022 00:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 696EA81EAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kwRap1ez6TCU; Thu,  3 Nov 2022 00:14:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3AA281EA5;
	Thu,  3 Nov 2022 00:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3AA281EA5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AFE9C1BF41D
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97CB681EAF
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97CB681EAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VYTRpVOcu_P3 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 00:14:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B510081EA8
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B510081EA8
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 00:14:08 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id d123so149073iof.7
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 17:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pQzlBii5Edd3Av7KTRsj/oS/XC/SCOnFRzg3zMib9b4=;
 b=n9hgk/FYVFchhlIE16vsETFzwVDKJaB34RVv7c3nQtHXmkhTcZpaCPHClI/eisGG0U
 hyHOz5y2bBDU+5oj8KjsStPZUsYPJfgZVwGrI0SN63Dl4Z2X7RbRMCprzIBbvr90bMZU
 1MMn5JLPluQsSHWGF0mU4pEC1M4hxM+d1OP/Uq+h8/sgtdenj5ypyFfrqKjiDYok1G/T
 dnK6OUGaI63ShXfSuftWEYDjk+/jsBUJO6gw6bE5KEKa6vYEWeCdh4VnZSbTRqdHMbna
 FY+1aRCn5l2dPOAHJSaZHwXP6MBGv1iu7XJIX6PrM/e1FtF3lnJz/MOEFyFZY10de2z0
 ocQw==
X-Gm-Message-State: ACrzQf2/uNdLfA5i46kdxn700o/KTXOOVAoW2lkJq0bQuztT2ygc5DTt
 CAT9zCVqSji+kYugPY7FFXLfsGFNesFdsA==
X-Google-Smtp-Source: AMsMyM6brTrK2fxdw4ioOxTHkOpCE1ZGLGqT9tjiis28z7KbSZW1B9bathU0ZMWcqdLL6NphNq4b/A==
X-Received: by 2002:a05:6638:3009:b0:364:4c:3b6c with SMTP id
 r9-20020a056638300900b00364004c3b6cmr16346704jak.210.1667434447479; 
 Wed, 02 Nov 2022 17:14:07 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 n24-20020a056602341800b006cce295dde1sm5108812ioz.10.2022.11.02.17.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 17:14:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 18:14:05 -0600
Message-Id: <20221103001405.1700964-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pQzlBii5Edd3Av7KTRsj/oS/XC/SCOnFRzg3zMib9b4=;
 b=JF0qO/VOVeJs/yAQFGxNcQL3NH1gEEoUQsIUib94++y2xrMOKB8cwLpfAY8w5s22GF
 X80yrTncW2xa09pJOZKlv+KcIrvPFPpvT7e1Yv4X778oZ0ZmnGuKKJgyQOs/je7OdMoq
 GWMpZ0EGArmdc3gndAkvcZrYdUcKjIW2sSZwaZoaIf7EOvnNoRpm5fNKLRITEuFpoSDk
 Cv3NW5QCj5EjmPiNM30I0p+Rtq+cd6rq+JS+DgKBcvQWyPZMpkl5arhZfkE3GE/mc9xW
 7nPgvG66veBL7w2Fx9D3XNjfwDHvoW2b7iQb+xi3XXpIgT9zrKI/42v270OtOgXMCTWO
 LmfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JF0qO/VO
Subject: [Buildroot] [PATCH 1/1] package/python-lark: bump to version 1.1.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to whitespace removal:
https://github.com/lark-parser/lark/commit/5236ff95a37cf464ba7049b27622d87b662c1918

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-lark/python-lark.hash | 6 +++---
 package/python-lark/python-lark.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-lark/python-lark.hash b/package/python-lark/python-lark.hash
index 3773c00f7c..abc168e93b 100644
--- a/package/python-lark/python-lark.hash
+++ b/package/python-lark/python-lark.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lark/json
-md5  fd3ca96a8d9d67798508470032921078  lark-1.1.2.tar.gz
-sha256  7a8d0c07d663da9391d7faee1bf1d7df4998c47ca43a593cbef5c7566acd057a  lark-1.1.2.tar.gz
+md5  d7368d8f9fd0b844c034f321f5b52fd4  lark-1.1.4.tar.gz
+sha256  eee86062b149600ef62de0d8dfd38cf85ffc737e16911e7d8c18880f8c5b1333  lark-1.1.4.tar.gz
 # Locally computed sha256 checksums
-sha256  6e83ad8e0de51690a53eac02dd2b6188dfd7949053be56fba5b651140d27ee57  LICENSE
+sha256  8263e5652d07cecb3adadf05140b65e70cfa169ecec5f520fe1671479ce12a83  LICENSE
diff --git a/package/python-lark/python-lark.mk b/package/python-lark/python-lark.mk
index 52c249552e..548adcd833 100644
--- a/package/python-lark/python-lark.mk
+++ b/package/python-lark/python-lark.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LARK_VERSION = 1.1.2
+PYTHON_LARK_VERSION = 1.1.4
 PYTHON_LARK_SOURCE = lark-$(PYTHON_LARK_VERSION).tar.gz
-PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/a3/c5/11d0a086590b207ad1b6c9ba6e019f8290652f3d703cdb002d72e220dd99
+PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/1d/08/eb2590d4f824b5a947d866c603799fa70278f1372cbf8d15b7b4823dfb2b
 PYTHON_LARK_SETUP_TYPE = setuptools
 PYTHON_LARK_LICENSE = MIT
 PYTHON_LARK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
