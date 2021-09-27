Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AA7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 21:03:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE41461052
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 21:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE41461052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B77560891;
	Mon, 27 Sep 2021 21:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wvsdbmPyS7f2; Mon, 27 Sep 2021 21:03:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D35B60ABD;
	Mon, 27 Sep 2021 21:03:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E265E1BF239
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 21:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD2DF404C7
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 21:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4Qc7e9KFrbz for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 21:03:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2E0B40053
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 21:03:08 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id a131so1610217wmd.1
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tzw0kjuk0Keziq+I4om7hnnD0ILlVr2q9lNanQyyONY=;
 b=oLdLAJvpAOALuJi2qZkVknR95QIyZx3i0M9bA1yRS/BH6sukP2JJK7f192r7Wfj7gB
 b4f8ns60mudK1Xr2nlt4GxumUKJ+CDzBdbnCtJuAmaiVop5f46NY6+5r8A1O8tTV2cCw
 gtp7zecc6DbayydF1cu2765zviRV9MC2ZErqfsOZBsEI6n9Hf7SlbQ/AVoAxE4+PU020
 vUOKhxEfhTVYUgdqV+mSwOPJrPzB2UdAaDqrBDXpCJRYFiBlHZeoZ2+08fvmS377AHVk
 GPKNF8NO00E4z5W9aVHW6eWk2HLubtcjl4On5VbR1DyOScKa/H5bGB+II1D+0G2sajvg
 5UtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tzw0kjuk0Keziq+I4om7hnnD0ILlVr2q9lNanQyyONY=;
 b=v9Xvmkk2Egr4KQWIKlo+7pKuf+Rrq27K4OEUac4s/T+gBPNTTzNTp11OeaBv0m477m
 V0H/53Wk3F5uOGA226xrpdnpwpDDrV5CUIokNzt31sXLGPgH0cI7hK5lgWnHYH5ZLVP1
 NYoa/PT/AFies1fNNTrPUQPVnkOtmkAUnriOKGQwUbbRaz29r3vFzqKVKolYeKw04S3y
 LWMBD4YbHL3Re0gOXo4Ts5QDKNkvZKmrdy+q6TOAz0MfAmsWqexI8hqL+gbWXXvj98jt
 SAlJqYTcMtqEgE0qSFOfNQ5A9FhWUD9E2gLmlqjJWCAAg7nDbg+GqVMrTpIY7tAn6824
 8Tzg==
X-Gm-Message-State: AOAM5332tYiT9etA1d7eyYcSM3dBEYh8Ce/CUzv1HUrkFOUmM0PqfydP
 +SWz5bFxUegxYW4hQszlk1bQy+Tah0g=
X-Google-Smtp-Source: ABdhPJzC1xQVknW9TR+GRVfHLrBsxeES744+7iZ8a7qI+qKLMgPwJzkMQQKUO39rrTqYfQ+G3qM8ew==
X-Received: by 2002:a1c:2357:: with SMTP id j84mr1166243wmj.1.1632776586875;
 Mon, 27 Sep 2021 14:03:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id q7sm18782366wrc.55.2021.09.27.14.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 14:03:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 23:02:38 +0200
Message-Id: <20210927210238.1489991-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-ujson: needs python3
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python 2 support has been dropped since version 3.0.0 and
https://github.com/ultrajson/ultrajson/commit/0673d237cf5589a2a059771f694d5fbc5a293b13
resulting in the following build failure since bump to version 4.1.0 in
commit a47f332a20bf3f79ef4903c8ddd2b7917217e354:

  File "setup.py", line 37, in <module>
    with open("README.rst", encoding="utf-8") as f:
TypeError: 'encoding' is an invalid keyword argument for this function

Fixes:
 - http://autobuild.buildroot.org/results/0737c4db63efe2205cb01984af72c270447fe085

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-ujson/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-ujson/Config.in b/package/python-ujson/Config.in
index d185c98532..aee1d75fce 100644
--- a/package/python-ujson/Config.in
+++ b/package/python-ujson/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_PYTHON_UJSON
 	bool "python-ujson"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  UltraJSON is an ultra fast JSON encoder and decoder written
-	  in pure C with bindings for Python 2.5+ and 3.
+	  in pure C with bindings for Python 3.
 
 	  https://pypi.python.org/pypi/ujson
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
