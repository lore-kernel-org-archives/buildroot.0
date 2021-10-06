Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B27C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 16:12:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03BBD60E73
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 16:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03BBD60E73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98D2460EBA;
	Wed,  6 Oct 2021 16:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8EOGskyV0Ms8; Wed,  6 Oct 2021 16:12:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13E1760EB9;
	Wed,  6 Oct 2021 16:12:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D130F1BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 16:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C072183AA6
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 16:12:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Op4fEDI82SXN for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 16:12:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E897783B8B
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 16:12:01 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id k7so10305643wrd.13
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 09:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k5Zf84s2YZv24R4Au0J5vQe1lXhYbxFLpn/YP+kHNCY=;
 b=WZH6H5XMWEmQ0rA1QHIYkiw0b0raZf8wru/3Upk2cP1Vv6QcgEpTirs9z1YdaMFQOM
 ilQveomk+kH0/IySgi0eYAPcD79uUJBOLW6jvXkW2jxIlGXTpuTxOPocZ7jq0LbPAHFn
 1OwLSK5Ww9O43+XDcf1Mn4AHE9pyQQR3JLfzORkMw4zW9GLfJgbNyNONTpl/HCyTHzCa
 tTGyvMQm+Z7KQJKg3RGV0jaalkP3vs8oq/Yyy0GApGn04bdfyciZgR88E3vjh7x3dR67
 WRSpw0oRfuwT20QTlrPoTz0ffe520ljnf2ICuvVK+1pZmpzySqOfR9KKCzkFz4P0fIk6
 GB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k5Zf84s2YZv24R4Au0J5vQe1lXhYbxFLpn/YP+kHNCY=;
 b=nsTMFpOj9pV0BL9CxA8RG1C0jF+AMKQLjtq3BbiCaNF60wNudKJfCwYJT8UKfaajPc
 MOpNV0X8+LAiIRFTJM/xOZ2JFiyw9vh3HW8rmbgDcC0NA9h07H/7iAKBxtvn5hQkPUfl
 zONUe4Bz/hvenfbvbSy+SeboWB+GJlqKsoqY07Pg0u5cxMPiZsaVKZf6oKkQ8SEOVofq
 mMW47pekjdiJi9XNK9xgR7xl7OfyFGR8WVMAnEBLzAfY68VJEBEVtGnkz4Hf+ex+NSaH
 5+qD8LPmmtD0TSMTJVJhtu6jT9AW+CZhS+Q/LU5avhzPxLLNeAM6zj33V63XaijBlalg
 iFcQ==
X-Gm-Message-State: AOAM532tW68onZVde/N+FzugTAr3qTopfpt47JxyID3s2S6z8XmZDScT
 o6e1AcgVjqo17zxbnqZPECMHr9/0OxU=
X-Google-Smtp-Source: ABdhPJxkzipm5/Y8+ErDbqLQ0riwVwTU+f5Eofggmi+pQvZOPoSBbqsPYmBaj39AJzbdDHrPuk/OXg==
X-Received: by 2002:adf:bb81:: with SMTP id q1mr19029707wrg.119.1633536720005; 
 Wed, 06 Oct 2021 09:12:00 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:81e4:5e5b:3505:a040])
 by smtp.gmail.com with ESMTPSA id s2sm20350388wrn.77.2021.10.06.09.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:11:59 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 19:11:46 +0300
Message-Id: <20211006161147.19864-2-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006161147.19864-1-asafka7@gmail.com>
References: <20211006161147.19864-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/supervisor: remove the dependency
 on python-meld3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to the package documentation
(https://github.com/Supervisor/supervisor/blob/4.1.0/CHANGES.rst),
since version 4.1.0 supervisor doesn't depend on meld3.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/supervisor/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/supervisor/Config.in b/package/supervisor/Config.in
index 623c3a836e..7ca3cae134 100644
--- a/package/supervisor/Config.in
+++ b/package/supervisor/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_SUPERVISOR
 	bool "supervisor"
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_MELD3
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime dependency
 	help
 	  A client/server system that allows its users to control a
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
