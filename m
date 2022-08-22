Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D484C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 07:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7455781CE7;
	Mon, 22 Aug 2022 07:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7455781CE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLlrVQn9948j; Mon, 22 Aug 2022 07:16:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61C2581CAF;
	Mon, 22 Aug 2022 07:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61C2581CAF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E05E11BF577
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 07:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9F3240917
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 07:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9F3240917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LpL3-6cpr1tm for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 07:16:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 976A440915
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 976A440915
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 07:16:08 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so11847086fac.9
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 00:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=K17LGWkrd1QIT956A+bTa0JVWGL7NpqVZFsfZZpnJ64=;
 b=0ekEusA46HbRIkpTachUjG4Lrt+OQXe9W0IRke+LVWH5ytvFd6sYFjOQPHoiM0+DGi
 V5FhqlMZPrVflDNK3f9tbUdTcuaodZbzhK1ES0mSWToghm+ZjqjLOTZI/igYubLBWotL
 uCkJFEAUK4mH0QpNCBTFKbVjzyX/8my0nF0tD+Nc+UDO6zKIyC4SSE8lPqxPVAlix30/
 z9XpJ5KfiAwsVBWWyhezh1UelSyxMJdW0KT4CdTP2eBtKazU+l7CrHZrQzuPgsn+mwkh
 P4ReV2j/57GEGaObWWYkRiBKIMld7tvj6bnp7JuJk6cFbD7Ejzi6VeBtaRep28XBRRit
 0SZQ==
X-Gm-Message-State: ACgBeo05RWZa4XQwWBe5QTcJjenRiYH7DDeYKc1EKC9gQfe/a947AGRO
 O84Fat1HvzmqCquQAq48p8rS6B9di80=
X-Google-Smtp-Source: AA6agR55jAEqLjVBw7BH/Er0XiVMof8KinNuWY3gj5dP+XV4dMOGPEQ/uzFzqxR8pw/3soqpVxBHvg==
X-Received: by 2002:a05:6870:479a:b0:fe:3958:813e with SMTP id
 c26-20020a056870479a00b000fe3958813emr11991546oaq.279.1661152566391; 
 Mon, 22 Aug 2022 00:16:06 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 e26-20020aca131a000000b00344fd6af70fsm2511171oii.14.2022.08.22.00.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 00:16:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 01:15:57 -0600
Message-Id: <20220822071557.1126501-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=K17LGWkrd1QIT956A+bTa0JVWGL7NpqVZFsfZZpnJ64=;
 b=G/ap/srNGZvmkZNtTckGcd4oCkv9GuR1GzZPIDVgyI+YF18BvrV14Gt9oTgz9pcXuM
 BxRJINIa9qSmI+Vta1cSJIzlv4204IIesgwynrHCvtZRXVZcb4sUS4gC2fD3Cxdsyz9H
 IRAUTue7GLgkqm/jjWdBFq5Ch8WSy7ajr3RC3XwlftZJKrr605SBgXhOEnasEQwu/D9X
 Z0SvHRsf1878GFVbb6gsc0otANcC9o8OIyIWrebX9XWkvaNy+V+w/0YVrrT/sKLoSEj2
 Av4BnPWvZ5mASsw8Q7g5qIevks9p3f9ICcZGmj8rUnY2zEbcP3DTX9UlyczH16fU2EKd
 X6mg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G/ap/srN
Subject: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to version
 4.36.0
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
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 469fea9c19..4f6536dbfb 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  197ad603c91d4c2909acf9e54c26e85f  fonttools-4.34.4.zip
-sha256  9a1c52488045cd6c6491fd07711a380f932466e317cb8e016fc4e99dc7eac2f0  fonttools-4.34.4.zip
+md5  5eb0df388216de4bfd058153d16c75bf  fonttools-4.36.0.zip
+sha256  e637d2fe06bddabbfc488e02ef32d04d561e3c71e9ba11abc7782ea753ceb218  fonttools-4.36.0.zip
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index c35c538cb6..6281359e86 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.34.4
+PYTHON_FONTTOOLS_VERSION = 4.36.0
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).zip
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/5a/a4/a97cff4c4af6764a04cc202299e5205b2e101cb1543bcaf9737be29f78ab
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/df/4b/ca51dbaf267decfcc7ca9300cdc703206c1c05f3e2beb5140a71817c2d7e
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
