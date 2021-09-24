Return-Path: <SRS0=OK8R=OO=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9D7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 17:00:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A54161251
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 17:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A54161251
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E593421CC;
	Fri, 24 Sep 2021 17:00:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FDB9I564uQDZ; Fri, 24 Sep 2021 17:00:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F83C41976;
	Fri, 24 Sep 2021 17:00:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8481BF290
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 17:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B8EC81751
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 17:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ac6IMqLizwwr for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 17:00:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D00181002
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 17:00:21 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u18so29473227wrg.5
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 10:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xpoG+iGSia5bToRS88doFxL+oEJBfFNEZuOAM41ab5c=;
 b=lSr50sTsHLGZFI680uPJ52RtBxQGYw+XT76Bl3k8BNjFMbAF6/dFTZdVqqSUhK6Eb0
 N4uM77p3xdJHepnP/jRDHwLNTScHTK12ddq/9g1Bo/hufqYJipxpMkqKkoRvU+qbISWv
 9+uDiC66mGD4CP865DfFFE6EkNKsGASXVljy0tP/NKtDhpDpi13S29OHBqJC51gZDW+w
 mWPMV33+wr8Kx9+f9KSCX4ua4IdZ/4RQQiqUzmCWhMRydO9+6gIof0w5/jJReYmdSf/l
 VXzl5/pdkeiHPcWEp3/mMlwA9jB7cJDalX1ibeIZjuEYciI8RYAyO4nm5uZiR0FoKyxa
 VTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xpoG+iGSia5bToRS88doFxL+oEJBfFNEZuOAM41ab5c=;
 b=Xy/F2SNc6vC0S1ZLFw1GhcQOHB6fZ1AlhmiDe3QKrg2/JCvQpyYFNBfGY2aiPKrjHU
 00z5AVuLJPN2AEnk1IDk0VAwnUgy/Xkt0IeTaEcYECRKDIsQ0LESvlSI5fM9djrUbQmG
 tCEXScxqInezDgsP//5GfemCgXUrhG+FOZPLWSaQmXmdmfKGwJ/eVxmQTWnJZQ9HWlCX
 e+LqMcofL7y5f102UIq4MOGcsUG9GclcX0MP3tz8m4bC4IGIavLC+tHr46+HCyA8YrgG
 bTXxeCq7AXCvUNTzAPozVWI0+wr+r6uFTbsgSKcrHJ/KN6LVbaWZRZXVsGi4yj2UmSyg
 mhLA==
X-Gm-Message-State: AOAM531wvSRUsgmgj+K35GVzMY7/RkjrCjCjR/cueCzUddQFVNCrBA/q
 eyGIyZchRPqV79OsDde1AXmPtaDgAcQ=
X-Google-Smtp-Source: ABdhPJzRvtgCGeu6vNsbXR55H831njoKJ3IBNdvWIw07ifVklDFJuzUGAZ9IAvRk+eYx7WnNv3iVsA==
X-Received: by 2002:a7b:cb4b:: with SMTP id v11mr3215197wmj.155.1632502819045; 
 Fri, 24 Sep 2021 10:00:19 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:286a:990e:1063:95c5])
 by smtp.gmail.com with ESMTPSA id n26sm13143265wmi.43.2021.09.24.10.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 10:00:18 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Sep 2021 20:00:14 +0300
Message-Id: <20210924170014.111889-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-attrs: depends on python3
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

python-attrs contains a file with API for python 3.6+.
Although we can make a "tweak" and remove this specific file
for python2, we prefer to make this package available only for
python3, because the day this package (and many others) will drop
support for python2 is probably very close.

In addition, update python-attrs recursive dependencies to
depend on python3 too (python-automat is the only one left).

Fixes:
 - http://autobuild.buildroot.net/results/aa6/aa6889bc254eaa93adb4fc1a71bcee9f2f23cb33/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-attrs/Config.in   | 1 +
 package/python-automat/Config.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/python-attrs/Config.in b/package/python-attrs/Config.in
index fb0ab248fa..b658d20ec9 100644
--- a/package/python-attrs/Config.in
+++ b/package/python-attrs/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_PYTHON_ATTRS
+	depends on BR2_PACKAGE_PYTHON3
 	bool "python-attrs"
 	help
 	  attrs is the Python package that will bring back the joy of
diff --git a/package/python-automat/Config.in b/package/python-automat/Config.in
index ee02d22b5b..9d22276c2c 100644
--- a/package/python-automat/Config.in
+++ b/package/python-automat/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_AUTOMAT
 	bool "python-automat"
+	depends on BR2_PACKAGE_PYTHON3 # python-attrs
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
