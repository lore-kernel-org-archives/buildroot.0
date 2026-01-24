Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F2AD715EC
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 15:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C598840934;
	Sat, 24 Jan 2026 15:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hnNLLyF-6mkr; Sat, 24 Jan 2026 15:23:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08B5D40A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769268201;
	bh=+UZxFHZFhi88dRRLn8FjkB5x1LJG77OWTgx66fhVsgg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q0+z0rdZl7PwXjkAipQV5bLkhIxQ1W914Dk/M71JJOgNO8BhvKQRlepkyJDkY8u5Y
	 UxOPzqKfn3Cy8x/hBL4KcUXlCWqnlvAlYDyQoKVLJQW1fdg0SWxkOmaCzC99GNhSlJ
	 GsVtsSoBwdVSVCB8j+51+hwbLiD5NqBnb720Sw0FYnBe5LSO3pvq1jyoKWVmPAjS+v
	 opdRoUWQPD+WTqpgjkz2VOYKc/+7n9oe8+ut75c+teE9rqzDrJrjT3hUtbc5RhXhFL
	 bjkornCnGpTFEap6GJ3GKMOv9gOzsf37cb9aTMJEqnfiJvCoqugoULhaBsrxkhZ/e7
	 rWQ+WWg1ahezg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08B5D40A23;
	Sat, 24 Jan 2026 15:23:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80B8171F
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F4E840594
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lS79_Q_DPYIH for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 15:23:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 52E9840168
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52E9840168
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52E9840168
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:23:18 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48049955f7fso25279045e9.0
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 07:23:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769268196; x=1769872996;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IvkZoo7yWl/kqvHoapS2RmbeTOtc/jjAk7kSb/wVZ6w=;
 b=NHv9LUvQ248FX5g3uQfoplFgjdsVfWuf7nZtMHo1otDPRVePM5RYMqupuX+26G0Fti
 sMtP/u/iE2QP1aWzv201vlewEWgi5l3TNjESuFcgDhNId2DqsSd6B7MvGmT4/u1vAQHM
 JUXzIjyd6LRiBHmbIr90HnEQzR+SKVPhbAwFBFddqj9I2nUIDO3SrWRLeBkoETQuXizg
 tZFvD34aUUwNISX7xEtF4nIm530rxRmK6bhxbPbTo1E2wsJJfbftDWZnGz277P0owRY2
 FFji+fCoxt6u+P88Yc8SWxlivhUDNh1hS0gRY2qezZf+edrsJIa6SuG1snGZOELbLv/4
 wFEA==
X-Gm-Message-State: AOJu0Yz9FbjSE1hdA6T83cYxNhND7uPG9HBkpmvk8YeDYrTlIdYthS2D
 Kj9hAFF6UAerKInCD+aNL7WRzLnzZgflL7CbIKUIrUr4Ect0Sec3uyX5qcIrbsD3g08laAOoF/O
 uo2Nu
X-Gm-Gg: AZuq6aIbH38ee2gDBxZXHmniZMoQL080yyy58gp9DB0w1Cb/cfJGyEdsOU4hJAkkHEQ
 t1Wf0Sk/Up1aRnSn7mrG7qHBQRqFdiynAjMqV6RFmOM5byYHM5Cv3pMdjJNSOcaiS0xwehDOi3M
 aDVRTOb7ifJg1AKTnRFIEr8nbzDDK/jb1H8+tVIGiCPrrcZq0sQ2f8SfXjjBdQKwdeeHnoUeLGB
 TPxjmpSGmGhmsxpno8lUO7uYc1HLBoNOcx+ZWJlct+4qybuHkp6rL7ToX4Pf3tHnK1W3iMXGoyZ
 QHdiZrP3WWQQC1qbE3RzcNaOYDgrmGCRhqH3XdFYLqv6i5s81eBCSSakMOnEwT4+caRgOtlRNMO
 66CyRKlFNYrVEx8mniUOXvx+D1SJsWl9b9V5RFbqD/c2NCBEBT/zJY+4FKugTVza9SuVmkNni+2
 IKW6jpjtQwCl4QQzzJ/8Nzq+Nc/hLT02Wx+GQdpL1C/I8krmjW6AaliqgZol7TOtjcTyRmHwybb
 ApZHcxMf5YyQ3rDDDC7AiyhDf/F6OyqyDgFQkEcGJZAZ8VoUEocSxO67jP9XczlxmtiFHSIuPVL
 h52Fh4UDbRQ=
X-Received: by 2002:a05:600c:45cd:b0:479:2f95:5179 with SMTP id
 5b1f17b1804b1-480511f46c5mr75454585e9.15.1769268195790; 
 Sat, 24 Jan 2026 07:23:15 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804703b90bsm242262415e9.6.2026.01.24.07.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 07:23:15 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 24 Jan 2026 16:23:11 +0100
Message-ID: <20260124152311.680810-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1769268196; x=1769872996;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IvkZoo7yWl/kqvHoapS2RmbeTOtc/jjAk7kSb/wVZ6w=;
 b=qhmT/AAfjcDIdZg1NLSNRSEqQJq3DFVFEKvKIHn8SSXSK/dC6i2faTYFC+lTypEK86
 gnm5ZWBEvFy7zhBv4qEKGIz0ljZ3NqF4Zxr2TAWEOc3NnkK3h4CnKIxXLm9bYLK8ij9J
 S/SQG2Es5LFja1qubKZsUJIqyKKkzrLAx93e8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=qhmT/AAf
Subject: [Buildroot] [PATCH 1/1] board/stmicroelectronics/stm32f4xx: exit
 post-build.sh on error
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
index 4fcce6150071..2c5b6be098ac 100755
--- a/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
+++ b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
@@ -1,4 +1,5 @@
 #!/bin/sh
+set -eu
 
 # Busybox is built without network support
 sed -i '/hostname/d' ${TARGET_DIR}/etc/inittab
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
