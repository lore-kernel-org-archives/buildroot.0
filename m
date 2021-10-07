Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B67C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 18:16:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2138360F4C
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 18:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2138360F4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8C57843E7;
	Thu,  7 Oct 2021 18:16:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bz-hzTU0tuxA; Thu,  7 Oct 2021 18:16:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1592F843F5;
	Thu,  7 Oct 2021 18:16:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07C3C1BF870
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 18:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7854843E7
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 18:16:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ftO0PUn7LKVu for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 18:16:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D5BF843F5
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 18:16:33 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id y17so7320610ilb.9
 for <buildroot@buildroot.org>; Thu, 07 Oct 2021 11:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fRqVuoteKAfbl9aEKYALlqOCt0MbseKkeso/vzfVfD0=;
 b=LUUPZd2Ay0wcEDjaP38CqIvlPJiRjhqGFBWgHYlvNPVyUj4gm2lACiIJEEPPL08inP
 tgrddmGDI4rjzFl15RixIiD9FvarvkfPH0AefySzLSMxYh3QrjLve0SEHIRz9IvMKsgq
 USJP9W2bjDHM9fXUyf4Ct+xeEfAL6V4fghhe+N/BfvUuzNmtKTFyFDx+p+MKvJKPot9j
 GS9Vi+B/fui8AvPx9XlcCGmZADZXXQt134fFGEeNn1ZAaF/2DLiF5rnkxR8VLDUmXSj6
 2dHqIBSq8xqUVJfOJS/uYroFvFWKadJmi+v56YZyoqv39plnJFPBXElkE5XNsyWbPnFl
 WXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fRqVuoteKAfbl9aEKYALlqOCt0MbseKkeso/vzfVfD0=;
 b=ZLFl487+0zdNrYKdgbDd1f3LKEb1Dbo720SgXtZ48SIfrtujqeexfAPsKf9Lp5Q8CR
 S7AwiiITtCdFaV2+xtWJfibLmyp6J3Bj8c0WxyzWUg4I37IMpVPdASOeTQU3j++hEEXr
 AEQA5RUnz3kg4hulPyekEhUFDQGK/GnASEqeUsMdJfnoaeZxvN6vX1t0rfZ0CVh3Jjxi
 iMPBM0HPwBb8d1uwZd/+HHS4OcW7bNPAdR8P7/98sm8gpwe+gxNAeF0kfYLom/x21gX8
 kJkfsH6PqDbBRrzib+1449Fh1JGT89Ut7JGRGB6G8yv7fqrHaLepDMVvl/IPsxCNXzVF
 15uw==
X-Gm-Message-State: AOAM531MCWh52wjilM+dyTXMhzJDOWZcje89xHSMzwhTsXPknZTpRecV
 4cWzPLZMw9bAOTzN6gcfSaBrtE2B/RE=
X-Google-Smtp-Source: ABdhPJz9F025hYPZmyFFlHR6DoG3glAjX+EuIG7LmNxROwIgcqZE47ZcWn+IANegskady8bYC3vLEw==
X-Received: by 2002:a92:d2c6:: with SMTP id w6mr4450086ilg.232.1633630593120; 
 Thu, 07 Oct 2021 11:16:33 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id y11sm17993ior.4.2021.10.07.11.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 11:16:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 12:16:29 -0600
Message-Id: <20211007181629.3240272-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-ujson: bump to version 4.2.0
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
 Mauro Condarelli <mc5686@mclink.it>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ujson/python-ujson.hash | 4 ++--
 package/python-ujson/python-ujson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
index 8dd52fd6fa..fc897c381b 100644
--- a/package/python-ujson/python-ujson.hash
+++ b/package/python-ujson/python-ujson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ujson/json
-md5  f8223127259c6a1f7d0e750fc88d19fd  ujson-4.1.0.tar.gz
-sha256  22b63ec4409f0d2f2c4c9d5aa331997e02470b7a15a3233f3cc32f2f9b92d58c  ujson-4.1.0.tar.gz
+md5  9a90e2e9f1d465c2121b8d10f837f53a  ujson-4.2.0.tar.gz
+sha256  fffe509f556861c7343c6cba57ed05fe7bcf4b48a934a5b946ccb45428cf8883  ujson-4.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6a00a8f8b4050303368b694147bde1aed9c96bdff869c181dbbf3ccb784a1501  LICENSE.txt
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 88e220b1a7..68781c6170 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UJSON_VERSION = 4.1.0
+PYTHON_UJSON_VERSION = 4.2.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/2c/8d/63b4afe82d646a606cef838855a6110c7a3a012622e656bd29fb2d15f1d1
+PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/df/69/e8f615e1a779e2d2d23d29d56dc55bbb1db2a828f0ef36d10bc697d63968
 PYTHON_UJSON_SETUP_TYPE = setuptools
 PYTHON_UJSON_LICENSE = BSD-3-Clause
 PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
