Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B64CD3177A
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 18:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1048140651;
	Tue,  5 Nov 2024 18:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6HAHsjbkMIv; Tue,  5 Nov 2024 18:02:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD77F40653
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD77F40653;
	Tue,  5 Nov 2024 18:02:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F394B723
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4AB160874
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0fBm3sXIMDK for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 18:02:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE44B605FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE44B605FE
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE44B605FE
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:02:28 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-83aacecc8efso2139039f.0
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 10:02:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730829748; x=1731434548;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LxeGZkWiwN/kTKg0c/gWmdGiS4d83l7+6cVnxPFkRXg=;
 b=YTnuN0W0/8Je2SqQsz34JNv72I2YHAFWWALocWw/CZRt0roFhldSTQ4+cYX3sk7Mu3
 GrOeMAlGc45dmgPndm8xkKr3Cml2mWL0klhjn8eirRMXusLhHtKIlt6yK+uDoiYU5S23
 gKk2d8efjGQ0v/NcluJgXYGH+aQ6UUkpbKEdUZ4WookfHQdRTlao1n7VLfouTHYhlZWy
 qvXkbuqBDt1rLIMD/Zod5tlwKxx9py1Fjv9oDBKSfgJjUgBlFsMGjCZl3wldPY5OVx9u
 B1ZIH12L6mlJWVmrdfeVqnFTRIVrPuoddjQ4svZyQh0FNlZhvS3YtkYUf4WTdRwkCoPQ
 AT4A==
X-Gm-Message-State: AOJu0YyS87cuVk2GnTcvlHa6OMvSyyU81R66cBwYoipHthvCzRyO1y0N
 2nqmWi451xsnyPsAbnXXKcc11PCV/XM/qXUP8Uex8Med8Vuug+8oqCshpg==
X-Google-Smtp-Source: AGHT+IFitMmTTOqmkO7FQgxatp1CTYSl5dES99h1p4PlNoe9LSuZzpQ6At4KE9ayT0XOJSoEtgMhBg==
X-Received: by 2002:a05:6e02:17ca:b0:3a6:c9b4:e2e7 with SMTP id
 e9e14a558f8ab-3a6c9b4e78cmr72384385ab.3.1730829747824; 
 Tue, 05 Nov 2024 10:02:27 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6c425cce3sm17979105ab.11.2024.11.05.10.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 10:02:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 11:02:25 -0700
Message-Id: <20241105180225.1406819-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730829748; x=1731434548; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LxeGZkWiwN/kTKg0c/gWmdGiS4d83l7+6cVnxPFkRXg=;
 b=XhsQO0jdBZ5igCY+VPkCJWu0hpowyFGaM3f72IR2AxlqgE+rT88T9Y04VHJFWxB1ZC
 BhSE90+f3ugoA8zkvhEf55W+gsAX0BtiEie8WCFtqObiIc89ioXEZngr8QkrTi3/l90D
 KfEOHpawY49RJdG+ensxSRo+EK8IMJmK1onvpMdgsDaeCzE1YG85wJ5Rd9EFvz63kIm3
 cBXg3I20CteqhMpPa+QqRPkQ9TfcmsxfbE6aiqXeI8PsBkepsCyQjlpLgof7gI3xnw3U
 kQcdsegUxrjz9LllPXEC1Ttk9/jOvP49D85KLUzIN/MvZMhI/Av/V7XH6Sdi9QyFT3c/
 aweQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XhsQO0jd
Subject: [Buildroot] [PATCH 1/1] package/python-sh: use poetry setup type
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sh/python-sh.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index 44a19b7baa..a59c6f1324 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -7,9 +7,8 @@
 PYTHON_SH_VERSION = 2.1.0
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
 PYTHON_SH_SITE = https://files.pythonhosted.org/packages/52/12/b7965006c5adc57ba5459385358bd27c4983cd490884a75be86eb1d3efeb
-PYTHON_SH_SETUP_TYPE = pep517
+PYTHON_SH_SETUP_TYPE = poetry
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
-PYTHON_SH_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
