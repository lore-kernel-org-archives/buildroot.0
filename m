Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015BDC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 11:12:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 349C360F11
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 11:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 349C360F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6C68834B6;
	Sun, 25 Jul 2021 11:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OFzqFachK1Zm; Sun, 25 Jul 2021 11:12:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EF6283498;
	Sun, 25 Jul 2021 11:12:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA38D1BF48B
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 11:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7EB9403AB
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 11:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zhSiylpsxzSt for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 11:12:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75069403AA
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 11:12:42 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id gt31so10840811ejc.12
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 04:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ATQwriG9tRogTn8QtWxC/vGl9fcRYgkH2NyrbAfwds=;
 b=ftO62qPUJmpVtraA0uGqxMVCO+qYOABTEsOd4wg/f/Mcwz0d0CKI6NWl+KVAnr+XPE
 0HBM0iJw9FMxDne6YgkIGJsAHJ3UZxww2RAtg/mAJ6M3kpgFYZXaQf+gkewS2Lrojs68
 hhHY3UmNdDgk/5ZQalRl/xlNjwh3VPNrO4NT7d1PNgSSlRVp+PfTm66QngcuwwWDcR1Q
 7xp4lekWsCpIUuvdqT7bWeJJgmOc3FXfZM2x9wNu5QwnAxM//g381vXOBFiyLEOtAf3Y
 hmYxwvd3cRLfcBtdqVEZrVNl1eUe4wRm9VCeWcfxY5TrWGFKQVFtTrGIYN6CtOiA4rTu
 dKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ATQwriG9tRogTn8QtWxC/vGl9fcRYgkH2NyrbAfwds=;
 b=Pu8q7wnnzTiG9WmsHG+9d3AJdy9j/a3dD2u633ghn+CPvms20CbWdUIaKHKTql4gjx
 hUJQ9EasgrQqC8yxrJrNi59RpuUDvyJMTLHbgQQPn4Vi7j6lSYjZ6IS+ou9WY3I1Xc+K
 9Da+qXNB0zI2FO3/7+k85nm3p62+vd2gYWG+w0I70n8oHMjuC6g3YIeWrf5Pj3zgyuI0
 b3ZjMtUwtPclMwDpSJyOrH0R9ul4jGiVUad4VxjDlXt0E1MR3cHVV7H8qlIBtAIdbtYF
 kvoXVSitPCYzuj436Y2FmMp4QDtk741lPOcKHzGpcSEerCzDwT4Gkt4U4tHibD9/3yLo
 xRlQ==
X-Gm-Message-State: AOAM53106TRFkZvOHJE84OCZHpmWDv9ewAkxv5XeW+8K473OqHlplTrC
 49wQAyJjml9rSvuccBX0Rd+fT/0p0qIWWFHI
X-Google-Smtp-Source: ABdhPJzmAWEgBVc3NWGc32WujfeGvCNGIXAOpTBGVz8dlqUU1bQ5fMHJ9cSRdwoibPQgyrWX5OMMIg==
X-Received: by 2002:a05:6402:10d9:: with SMTP id
 p25mr15625412edu.51.1627211560285; 
 Sun, 25 Jul 2021 04:12:40 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v13sm13190255ejh.62.2021.07.25.04.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 04:12:39 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 13:12:29 +0200
Message-Id: <20210725111231.359830-1-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 1/3] package/python-numpy: use lapack instead
 of clapack
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alexandre PAYEN <alexandre.payen@smile.fr>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Damien DUVAL <damien.duval@smile.fr>, Jagan Teki <jagan@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The clapack package is deprecated and will be removed. Use lapack
instead.

Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Damien DUVAL <damien.duval@smile.fr>
Cc: Alexandre PAYEN <alexandre.payen@smile.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-numpy/python-numpy.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 8260de7e5d..72c6e0c981 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -17,8 +17,8 @@ PYTHON_NUMPY_SETUP_TYPE = setuptools
 PYTHON_NUMPY_DEPENDENCIES = host-python-cython
 HOST_PYTHON_NUMPY_DEPENDENCIES = host-python-cython
 
-ifeq ($(BR2_PACKAGE_CLAPACK),y)
-PYTHON_NUMPY_DEPENDENCIES += clapack
+ifeq ($(BR2_PACKAGE_LAPACK),y)
+PYTHON_NUMPY_DEPENDENCIES += lapack
 else
 PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
 endif
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
