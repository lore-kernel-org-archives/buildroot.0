Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ED2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 27 Nov 2021 10:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FF9D82C7D;
	Sat, 27 Nov 2021 10:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fBqiHnmTq2D6; Sat, 27 Nov 2021 10:02:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8E7182C38;
	Sat, 27 Nov 2021 10:02:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 790F91BF33F
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 10:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 670D44014E
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 10:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4AvIHbBD6Jpg for <buildroot@lists.busybox.net>;
 Sat, 27 Nov 2021 10:02:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D2844012F
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 10:02:28 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id j21so11538820ila.5
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 02:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fWIOd2plovxicQp6NuH7FRMpjVSpYD/PABhVE6ZT4ss=;
 b=U70dqk/FvOVrX0fZenUh0PJTW65yz3BNscx4qEUPmzfUq9r+wtMDR+kB8o6l/hVRwV
 Ln1n5tgqsrZH7ynUC8RRmjAw/0aDNeEegBSCP1FXl4MZ/wZCUafK4T2Z5018cdyMx0u7
 xLsGmHJFSgYAcVhQM340pitM0qXohd/1qJrltRN8DNMQxinl2EbUf/r52FkIwKSrP30Q
 JbDc+G/+cj8qFurOvXv9KrM3tvBqvZO8M14Ww83E8fdn2F8qCIYHfARS1+mNx8XfNk5m
 7vRqw3/1EfUj/dl62/MwSEADyhWY9JYh+7uWK0rb2pH3mfztFwRU7OCpF+uVBMs+PdJy
 Q1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fWIOd2plovxicQp6NuH7FRMpjVSpYD/PABhVE6ZT4ss=;
 b=Awz7V0XjcUCObLb7JQRuvhVVkBYd0J1Thv98cIHWv+olYqKaR3R1d6zR6oZDV/DpPf
 HoJCMRpvyof30/FhxLzxiviuqrDcAtICoKJF0nMs6GHivgtGsxNZMiMAqR5ns1PFGAi2
 qpXGmRdU2hx6AhoIprQhn5f6synG1ft7mTK3r2yyD+ejoXY86zpu93dYsbxEeavcYhDJ
 Tb6UduZczpfsU5gCYIqj1kDF3u9YQNS6mCbzGqdvNZkSVcBvVS6/Pxeaqx1xZ+U8n/0S
 oxQL8sA3CndHi39VIKn4+5Vg+tl22+Q2wlz3oHWs6dM3ZPzYLQqKRCasar2Xo70o6L9Y
 oLXQ==
X-Gm-Message-State: AOAM532A3pgSWlGrCxag2pNshC86g+mIrRSfkt5a5PaOG5PjLZM6pgNG
 b62wMBsV2x7pJtlF5SK4G59U8EJQJN0=
X-Google-Smtp-Source: ABdhPJx3zM9Yp5DsmHEv94p7PwBw91xUwEYUkPWXHbfv08ZDfkC56nGjKtPiUPn6n/8pls5S62fgcg==
X-Received: by 2002:a92:1908:: with SMTP id 8mr40218014ilz.166.1638007347402; 
 Sat, 27 Nov 2021 02:02:27 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id f16sm5105710iov.33.2021.11.27.02.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 02:02:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Nov 2021 03:02:17 -0700
Message-Id: <20211127100219.2121658-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211127100219.2121658-1-james.hilliard1@gmail.com>
References: <20211127100219.2121658-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/python-idna: add host variant
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

A host variant of the python-idna package will be needed for the
host-python-requests package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-idna/python-idna.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index 7314d85493..a2c842f1e7 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -10,5 +10,7 @@ PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/cb/38/4c4d00ddfa48abe
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = setuptools
+HOST_PYTHON_IDNA_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
