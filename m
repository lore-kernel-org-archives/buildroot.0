Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0478BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 23:59:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 743D660F12
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 23:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 743D660F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23708402AC;
	Sun, 24 Oct 2021 23:59:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLb_ap-zOIT1; Sun, 24 Oct 2021 23:59:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4164A4023A;
	Sun, 24 Oct 2021 23:59:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CC601BF292
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 23:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43F4F4023A
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 23:59:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hAks98YD83gp for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 23:59:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3ECAC4012D
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 23:59:43 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id r134so13184360iod.11
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 16:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8fVDKbM7YEfN4d9Wc701/ClZifnTIM7ZpFyJaHI/Z64=;
 b=GjQZhjugGDRFwp/+Hv428m1B6IrBiQOhsTHcF9oWSGdgwi9QI0v1DkfED6daDaJ+pq
 4aI5KZp5QLRIiXtXM3AVV7PVW4o/US9yREmn0X180jDKARKPPb+tavY2yuv8NAK05lJF
 vdfoDBPja1xXnPLEonQpvXb2vqYNXpdTA24/qMDsE1feOnifpsbeCAFQOwquswxsQsMV
 TfwG2JVw+QYKSki9hIU/Gw7vnvQCoFYVG3w3KxAwL1P+lREZ+oyrtZkTdWXDa/WARUSQ
 ddNh0xMz1W5EB6K5EeZWrUSk/IEx6OqO2bUUO/LLw9wQn2VSwftIVxwnIhnz5gJXHFuI
 8P6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8fVDKbM7YEfN4d9Wc701/ClZifnTIM7ZpFyJaHI/Z64=;
 b=I3LultuE37vJWHnkG79NnLKftlhbl5RUZIjolasWjE+lUYvCnluzmfLWHTwvjkVrWV
 amXfDkwRwK/xMFiRbzlcD1aZnY7T5QFHY5sjUqYSkW/1oC66+w27JCX1NO9SU/7zNTpd
 5P7LQ2qlsT2Ys8nqcTgd8XhhTCbiPEyEbkawc4/TiT90apiioFnhc/0lHGAe8RHrvD/F
 su10lJ9StCnvUce1Qac2Ixc8DEOZ5mkkLQSBsoizO1FVakLVu82TZcr1ay3wKi/IvBQJ
 9wMJxZ4zW8mCo+FHuhtGaB1WSjNwHpmvCyG2IneoFsMbVJy5gewvZ0OnfmO6jlms6LPB
 rQIw==
X-Gm-Message-State: AOAM533IhPdiKfXLWGULnAmTejzOiAK3HnXZTkgVOvwznJ1Nxh0oDIL1
 VJGNm78DS9yeOfOTYZ8UNC9W2oI5oAI=
X-Google-Smtp-Source: ABdhPJwLm5dJ2lCsD6B1JD/vRHktGadygdn7E0YQD4Rl5wjmXi6uEWiVSLwFJn43S3RcalNBhfUi4g==
X-Received: by 2002:a5d:8f8e:: with SMTP id l14mr8723002iol.124.1635119982258; 
 Sun, 24 Oct 2021 16:59:42 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id o5sm8249278ilk.88.2021.10.24.16.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 16:59:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 17:59:39 -0600
Message-Id: <20211024235939.2142310-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-frozenlist: bump to version
 1.2.0
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-frozenlist/python-frozenlist.hash | 6 +++---
 package/python-frozenlist/python-frozenlist.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-frozenlist/python-frozenlist.hash b/package/python-frozenlist/python-frozenlist.hash
index d8ca0d8b3c..fdbf694963 100644
--- a/package/python-frozenlist/python-frozenlist.hash
+++ b/package/python-frozenlist/python-frozenlist.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/frozenlist/json
-md5  3d6747897187eb413327168329ecccde  frozenlist-1.1.1.tar.gz
-sha256  32fa8c86eee5c6f11b44863c0d3e945b2b1a03df3bf218617e832f1f04ba3146  frozenlist-1.1.1.tar.gz
+md5  8f1851ef871d95a15ebcf20255c12f6d  frozenlist-1.2.0.tar.gz
+sha256  68201be60ac56aff972dc18085800b6ee07973c49103a8aba669dee3d71079de  frozenlist-1.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE.txt
+sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE
diff --git a/package/python-frozenlist/python-frozenlist.mk b/package/python-frozenlist/python-frozenlist.mk
index e17578879f..4e26499808 100644
--- a/package/python-frozenlist/python-frozenlist.mk
+++ b/package/python-frozenlist/python-frozenlist.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_FROZENLIST_VERSION = 1.1.1
+PYTHON_FROZENLIST_VERSION = 1.2.0
 PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
-PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/ab/bb/80e0fdd91fe4018c6c11a1bfe9bb8cb1da8dbb2ed3faa3c1317161d056fa
+PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/5c/ee/7c6287928ba776567603248e160387cf4143641ecf734e393ad9b2c82475
 PYTHON_FROZENLIST_SETUP_TYPE = setuptools
 PYTHON_FROZENLIST_LICENSE = Apache-2.0
-PYTHON_FROZENLIST_LICENSE_FILES = LICENSE.txt
+PYTHON_FROZENLIST_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
