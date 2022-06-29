Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0E7C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 12:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C33F1408BA;
	Wed, 29 Jun 2022 12:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C33F1408BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pEXY-soR1MDA; Wed, 29 Jun 2022 12:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1026408A7;
	Wed, 29 Jun 2022 12:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1026408A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BD021BF407
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 12:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 400D740901
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 12:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 400D740901
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TxbDHgUIpjxe for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 12:42:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1585440650
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1585440650
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 12:42:00 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id k15so15807071iok.5
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 05:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dx+LMJOMqpd8cCvpSxuYxrbMS1jVsG+wam7gdgxAOXc=;
 b=0JGqxfjwqHlyv8Mcn74MNhn0Mj5WXrLywNrjhUOI+HR7nAMj1DoDlOmAYE5nCAh0gy
 47qyn8VjBe4RF7QOCMMiVWbpkrqvZ6wgiAcYmoQ6oUETrWGelwB7juEhPCSnYoLvt8KI
 k9gX4opryNim9Z3Fk5Ut1adOPkGpRk4iGYiBAdipQ2JOCvbO+XaXEonivB432YK4xJFD
 PgCdNaE68vz6+fMRuIlg6yu5crKndt7UyG1ie7+fhTwc8//7Wk3zz/YcgIOdUu80VHvQ
 QUSq7HJbUxLLkGF6xx50HsAGd/VIX+LKtE+MbWxFM2sWKN5r1PugfYIpeN1ojXZPYAR5
 3PMA==
X-Gm-Message-State: AJIora94LVhfnDLHbGxjiTaCYkrVhVPLGRAfb+Gh6JBHAmSt7lrQH+dj
 xfNHB3aLZigHz1Fj1jcOCOTOmoARcxs=
X-Google-Smtp-Source: AGRyM1t7U4WnCR/wqZtVFum9rAfkGtGr9VGachI1NUv7+eshTLmqANHMjGCVgKcS/qX0309r040mag==
X-Received: by 2002:a5e:9e43:0:b0:669:ed00:b269 with SMTP id
 j3-20020a5e9e43000000b00669ed00b269mr1631793ioq.106.1656506519004; 
 Wed, 29 Jun 2022 05:41:59 -0700 (PDT)
Received: from james-x399.localdomain (71-218-105-112.hlrn.qwest.net.
 [71.218.105.112]) by smtp.gmail.com with ESMTPSA id
 b8-20020a92ce08000000b002d396d6a2b4sm6900664ilo.13.2022.06.29.05.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 05:41:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 06:41:47 -0600
Message-Id: <20220629124147.2419992-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dx+LMJOMqpd8cCvpSxuYxrbMS1jVsG+wam7gdgxAOXc=;
 b=gY6CVYRxa1tvicJ87tljCo/LqhKwsxJ4y/YfrUVw56rOyabQqhFz6uMPJ9FnnlM64m
 F+f77/twqTUPyEx2oHMaU7/AmwqseoAkLQPJ9VbLMIZMxwT0LliywDXwuFW/dlKVuSkx
 jRKeSfgjB+V6CMA+sg0s5ZbK4lHiqdkQkGqDKj5fmPO+9UwDTSu3FxFOuRB54vjFUV0k
 BvLJnfSh3xusPFke0njGKEdAMBMntoM3Izw18MkIfmrfbR1xK6XUGTwS3+uWnbxCBNnp
 DQWislJU3X1DdCJpXC4bD1pCCYyXgsSC//91Z5sdm1KKoHX2pkxMAYexnZYS34qzppIN
 4zVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gY6CVYRx
Subject: [Buildroot] [PATCH 1/1] package/python-weasyprint: bump to version
 55.0
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
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index 3ad59b6abb..70c4e19832 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  262af43e54ad89ecd0e304bad799c47c  weasyprint-54.3.tar.gz
-sha256  e04da040630566c44caa202033f07f858765f536709045a809739f3d048e89d6  weasyprint-54.3.tar.gz
+md5  8891a483640daf4f9f234f96437fc056  weasyprint-55.0.tar.gz
+sha256  ea5d5f2f159262e38b6e85939d8510e9735a47751a9647c9eaa93c22ced86230  weasyprint-55.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index f36e5b51d1..d6e6895f00 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 54.3
+PYTHON_WEASYPRINT_VERSION = 55.0
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/e3/ba/d3453a6024e56a789ec9099a770c08b9998f8a60bf9b6375d9e76d67101a
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/8c/a5/1a0f1f60a0dabd475d3c36739eeb43bec2da2d9d57f4a6cd95964f8b34b7
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
