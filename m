Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54F2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 05:39:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B06161154
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 05:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B06161154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4C4781000;
	Mon, 27 Sep 2021 05:39:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LdEKSRNLXBYs; Mon, 27 Sep 2021 05:39:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3225680FEF;
	Mon, 27 Sep 2021 05:39:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66AD91BF30B
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 05:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55AF2403C7
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 05:39:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UO79gx18bGiS for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 05:39:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2915D400EA
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 05:39:16 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u18so48828224wrg.5
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 22:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0JGPTJzOkhDjAXWb+2hsxThKEofiHMSOisIP3dZi72Y=;
 b=f5chQnMe/DXnTwx/C7pCl4wvOBVNzYh4io9O3bJR9PLli+V++GAMggYON8z/k/ItHc
 AiEDuhVGSGZ65EtEvk9lUcO0/LdKEjylUocW0pShIyxKuHy5YsQUu487S1Zjs0XYnxuy
 ncKQ9vFaGC/QYhgI00gv8bgYgErz1uipGbL4GblI8GxlKbIxxZbsbdtrcOQJ388/li39
 603baTk2Gq1CnfE5a7kdQEqxapUFMZ5SxyUqli5AJc49poVQdbg6uviI864BGNx/Z3Bv
 R1MBgzS08nwZR4zdftcLk5hJJFFjxNZUtGi92mgG+ceS43om5R/oq7/Yr4gStfG8nlfV
 XUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0JGPTJzOkhDjAXWb+2hsxThKEofiHMSOisIP3dZi72Y=;
 b=DhAA1XpzS9nLyaJUx2REQ4YJCOpc5aJ+suxUaiqAOk5p25B1ZmApqg/APCrFzcNUIj
 sILZ7HlMTmoPZIMAH0eL8/PcrDfP5TFRpExigYJJTzOMpbb6moyIOtqQrbOAZN2TDr9K
 XuWLT27biqilrlOSdql4GU2lRXuh/5BKDvDFXRc/4MY4iCop/wd2kD+Ri3miEWLvnVqG
 AzaKxd0MiwNZJiRbI1Xk743MuUPKQD16jL3bVCHxdRBKMAfjUKY7uDteOBC2+zo03ju+
 Wzc63ZDAQq0cuPkkcfVcxKHJ4xCDESGUCC9T20QGBq379E90ksZ+VDDetnpIL8BhHSwH
 9WgQ==
X-Gm-Message-State: AOAM533bCsG44owBc5YCTC02OFAI8QHpooMdvA4z5icYpDIigzQ+jRIo
 AmnQ2N8J6P+diAbf8mb2UEVHbG0DaLU=
X-Google-Smtp-Source: ABdhPJxyP7D55RBqDjAAxrVeFbgveVsWQyfUPaH55/ecMkk9Y4qkZDTKPo6MacHqcIjhhKU9Y7qQeg==
X-Received: by 2002:a05:600c:3b19:: with SMTP id
 m25mr14014321wms.135.1632721154880; 
 Sun, 26 Sep 2021 22:39:14 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id w23sm4336394wmi.6.2021.09.26.22.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 22:39:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 07:38:48 +0200
Message-Id: <20210927053848.1061202-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-beautifulsoup4: needs python3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python2 support has been removed since version 4.9.3 resulting in the
following build failure since bump to version 4.10.0 in commit
109ea1a4a2f9154c5d9502ba814a09e1e1bbd9f5:

  File "/tmp/instance-1/output-1/build/python-beautifulsoup4-4.10.0/bs4/__init__.py", line 36, in <module>
    raise ImportError('You are trying to use a Python 3-specific version of Beautiful Soup under Python 2. This will not work. The final version of Beautiful Soup to support Python 2 was 4.9.3.')

Fixes:
 - http://autobuild.buildroot.org/results/57e6677932f587c279cc0ed671895740d0cf2304

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-beautifulsoup4/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-beautifulsoup4/Config.in b/package/python-beautifulsoup4/Config.in
index eb7d2ba673..93fa540a73 100644
--- a/package/python-beautifulsoup4/Config.in
+++ b/package/python-beautifulsoup4/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_BEAUTIFULSOUP4
 	bool "python-beautifulsoup4"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SOUPSIEVE # runtime
 	help
 	  Beautiful Soup is a Python library for pulling data out of
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
