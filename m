Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6C3C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 05:58:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 211C061181
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 05:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 211C061181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF482608F8;
	Fri, 15 Oct 2021 05:58:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0H7hLc9oS_kG; Fri, 15 Oct 2021 05:58:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F68D60823;
	Fri, 15 Oct 2021 05:58:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80C941BF2FB
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 05:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C10340153
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 05:58:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CnEk_UCDbTw0 for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 05:58:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5834540012
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 05:58:09 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id z2so1503445wmc.3
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mbtmJgJHwgx39XuFu1w4qLpvneOveHpv9jzV/nmTsbQ=;
 b=B9Z7fouVEYC6SUo/Ag1X3Wq38n1MKTPCCPlQfwTpDpUq8FAJcVfW3Qw2b6s9KTQeKR
 fwsfuaUSAZubKKYWrLM+OQySsLI2rBhP7p7QS2T1ABpjgzQg6fu0d8cQJDc9h4YB4Qb8
 DYk97tBzMdGqSmst2dcl6yfx4fRZbqkn5w1XskbCAF2sFg+u7TlA7UR2Cy89Rwz40Lfn
 A8pX70cE7xLGN7ZO7MjdzWTOO2H3Uyf7AOiFXqGbl1LwuqCLmzYr/9vYubExwX77Kxm6
 HM/4/Q91XHMxG5gO4YIkBA81g5sE9kjlmzQzT7/aXcRNAE4o+BHGyQnRWUvPsBik5qVg
 qtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mbtmJgJHwgx39XuFu1w4qLpvneOveHpv9jzV/nmTsbQ=;
 b=BWlIHdeOKoewoLFLaoQ6JitNHbgoPS+U+XESLjTy2YcmMHectnfxDxzptSmbDfSyzN
 xQZCRs0txnMMB/SyeA3+MNjbDrPr4emJRQBIs020MOPJv2HIkbPvC0VD2uKx2BNfg0he
 eZaFyXxWC7EuOZjyLcq2u43NX4t5gpCDOjrbBzsYc1GBEKiGB7JoZZ4SEM8J80eKseMM
 TM3Nmq0+Rp6NziWQL/F3rR2IbJtHu4iy41lExNC7z5uBeIhneags642bmJhu0s3NjRPE
 mEG5tpomcwxvjfHNr+7UCPaa+04n4QzL2wH73QBFTBh2GhMszkLimCd+Wr/uLd8pC8na
 yMZg==
X-Gm-Message-State: AOAM531zrQ4a6tHgEEYcxKO2HY8k/diYJPEpjj/U60WyfAY4CLta8Uy7
 du1vbs442IaC+OwVqPCbTFijzpsOOyI=
X-Google-Smtp-Source: ABdhPJw/QX948jZXy2vZdkeJ1E4Ei2BN3XQT2FaU5f3r0GDEL/DmSlV3bJ7JizyssmQ53szB5ijJXw==
X-Received: by 2002:a05:600c:5128:: with SMTP id
 o40mr10254192wms.81.1634277487176; 
 Thu, 14 Oct 2021 22:58:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id t21sm3708304wmi.19.2021.10.14.22.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 22:58:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 07:56:43 +0200
Message-Id: <20211015055643.158071-4-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015055643.158071-1-fontaine.fabrice@gmail.com>
References: <20211015055643.158071-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,4/4] package/python-pip: needs python3
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python 2 support has been dropped since version 21.0 resulting in the
following build failure since bump to version 21.2.4 in commit
3491f34d9ed97ac5980ff4a450367914b6985ff1:

  File "setup.py", line 7
    def read(rel_path: str) -> str:
                     ^

Fixes:
 - http://autobuild.buildroot.org/results/ed74f4ca96332454af329fac23505000c379d4a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle)
 - Split patch

 package/python-pip/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/python-pip/Config.in b/package/python-pip/Config.in
index 61d8d7d317..92c3e3bd46 100644
--- a/package/python-pip/Config.in
+++ b/package/python-pip/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_PYTHON_PIP
 	bool "python-pip"
-	select BR2_PACKAGE_PYTHON_HASHLIB if BR2_PACKAGE_PYTHON # runtime
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_SSL
 	help
 	  The PyPA recommended tool for installing Python packages.
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
