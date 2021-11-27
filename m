Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D51BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 27 Nov 2021 10:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03D064034C;
	Sat, 27 Nov 2021 10:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y1f8M6o4fcKW; Sat, 27 Nov 2021 10:02:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E6204014E;
	Sat, 27 Nov 2021 10:02:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 01DC41BF33F
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 10:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F309B408F2
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 10:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0RLg28187a7t for <buildroot@lists.busybox.net>;
 Sat, 27 Nov 2021 10:02:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 474B7408D7
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 10:02:27 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id x10so14457374ioj.9
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 02:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9r2gKxwDB9vJpTNCpgLzqTaCJAPonh5t16m/JiHZ2AU=;
 b=C7ghcbMlj7dUMjlG2H/t8tVTaRF7pbjcg9N/nQHV/7kmNc5JX43B//ZOLO8cML99TF
 uEttpc4TvTUC/Kt10bwuS3Sr0ry6KrPB3A/w30rYIPxMg02xK3CnwtR+UL4nj8wouvgp
 ozt8b2/D2v2tKR564A4eXH1G7uL6YBQg2mvWkaaQG2izIOEP+n42U1/gHZQY4M4kJ3x3
 ClVn/Ntmlz1WDxrLj27oOpGep+iBfeSQ8aey7fgkgIoLko3yCbZZCpVQfc0OwltCk3g6
 gcByXkPhTGodaI3dDCz13w4xcFA2nuiEOyay6W1Rm/UJk2BE1M4ycFgQjWngGm/HhXXX
 H0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9r2gKxwDB9vJpTNCpgLzqTaCJAPonh5t16m/JiHZ2AU=;
 b=0WI6DggzNx00R0g+eW8xEIuwlD7peCNYNge6dq/Zbn4xuvcnbGAg2J7hq+eoBoYd1K
 1ykCKB/hooRcI1vkEc3QxnDPTAW+9H8p/gep1llfxJ7XklI4WFIydVM+ag3PmyBrWuX7
 0WzIXnEjnl1ygTAP0bKNev1oAZbG7Fz+WuKI+iD1Byck4rBBpcEQuY9hSXcK6Yupcr6E
 ozEId7Gr3M8NFAXH3xKFpaF0YMbrzlt4JPuuSSveq2FIbL3EHmtGwZPFFMZPSq2i98JP
 aRwCUPt75KJ0sojE/Apm8l1oI2riZpd/BlKmC+sc1UX+RpnTWwioCYTXdlt8wJdBBZRX
 CUzg==
X-Gm-Message-State: AOAM532KRa9rlBGyWWkjEsqab9k3/6j8BU/HLxQECrbhsYcBoZM2zyqQ
 Kty+REtpfL0TzA4HRNu/sB0rPVJoKog=
X-Google-Smtp-Source: ABdhPJyxfi+K7WYNFhRXxqA8bKxCxzJXCzYCelWnX0tfBrlC6K4xqsW07ig+RXy6o91/7xc4tepeqA==
X-Received: by 2002:a05:6638:2512:: with SMTP id
 v18mr48887573jat.22.1638007346275; 
 Sat, 27 Nov 2021 02:02:26 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id f16sm5105710iov.33.2021.11.27.02.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 02:02:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Nov 2021 03:02:16 -0700
Message-Id: <20211127100219.2121658-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/python-charset-normalizer: add host
 variant
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

A host variant of the python-charset-normalizer package will be needed
for the host-python-requests package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-charset-normalizer/python-charset-normalizer.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index e1b805fbfb..7fe9f96996 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -10,5 +10,7 @@ PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/9f/c5/3
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
+HOST_PYTHON_CHARSET_NORMALIZER_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
