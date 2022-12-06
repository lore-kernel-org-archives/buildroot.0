Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEA8C3A5A7
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 04:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DEFA40529;
	Tue,  6 Dec 2022 04:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DEFA40529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3hJJC0AOE64; Tue,  6 Dec 2022 04:41:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA597403D6;
	Tue,  6 Dec 2022 04:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA597403D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0D431BF358
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 04:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC22281430
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 04:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC22281430
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jSh7chSsH8kH for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 04:41:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E525B8142F
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E525B8142F
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 04:41:25 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id h6so3267517iof.9
 for <buildroot@buildroot.org>; Mon, 05 Dec 2022 20:41:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lPKi5iJnA2EkFY+R3RthDlg33CJZSOJMJFdTR4iz2aw=;
 b=3uqxNpEEnetMVoW+qVlzR6Tnxj258n0oo6vFmLJi5ins1hsa20mdnyrtpxplFYBj9v
 KgqcWrWLKNnO4tCyNoM6fCa0Kk6Qcx/pgzuwxs8gfaJTM1wzdiVTdAEVR12RYkCbu+GV
 LjTvXGbavFu3ih98qHXYc2JI/OgjSz0Ql7hBjFOg1VYP4fiGM+hRGdgaLYuugclihJfl
 izv9OAm1KwnP5y+dmsCOqCPqj+iMJHcxQuOvuOKLkYgt02/I0F5o8Hh2SCybeets7fC0
 EUord+QqNHQmFsL9j3YLBuIXO1FLYMULIxYkmEzP5wL90f6QZex5J8CjgRAWIeBbFrdU
 U17g==
X-Gm-Message-State: ANoB5pnLmK1Zc6mThNNckE7+MqZiS89gpKuaZfZRXrme/O71X9pky7ir
 DxLFOX4sHWWVjJiXkMbuz/Nwxxldx+Rt00UA
X-Google-Smtp-Source: AA0mqf7ZElFuGMjP+/X+KDDzwdGVhQWzp24ED441owXsm4CaHfxTojMA6PX3tIXHSXQvZz2YN/uqCw==
X-Received: by 2002:a05:6638:3b4:b0:38a:46d2:18a5 with SMTP id
 z20-20020a05663803b400b0038a46d218a5mr3594629jap.155.1670301684606; 
 Mon, 05 Dec 2022 20:41:24 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 u30-20020a02cbde000000b0038a55bcfb47sm871093jaq.58.2022.12.05.20.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:41:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Dec 2022 21:41:20 -0700
Message-Id: <20221206044120.2803159-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lPKi5iJnA2EkFY+R3RthDlg33CJZSOJMJFdTR4iz2aw=;
 b=KEq6AD/p8F/v8CrxdP1NgxSOxVokILQQNwC/a7CY2dGjgk5ediXII7uc6aQrkvpDDU
 l37A/wjElwM1GrEthW7f7LXSgSL0qYjcDtK01ZCWSiKWDIF+YgWrOo6TJOB2BVwCnGTE
 op28o5BM1kFUyy+DTTaqqUf8xliUMKis6M+PGlfm5/1DM8M+fKRVYMTIlknrLeAUdCAW
 +e+MdsVsc1p5hIJQRFvGH14sSgcB0ThBgt5ecurc4nllHzrD5jVDo9dwa4ohbVHdNads
 9rXmo/T1diwXbZ7MBTB3I+DNn5/g/+bJGf6WSicHl19yA4uo8inQ4D7CB4kN/WyIoaPw
 ly5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KEq6AD/p
Subject: [Buildroot] [PATCH 1/1] package/python-pypa-build: drop
 host-python-tomli dependency
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

The host-python-tomli dependency is not required on python version
3.11 and newer.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pypa-build/python-pypa-build.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
index b78aefe855..adc124b074 100644
--- a/package/python-pypa-build/python-pypa-build.mk
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -12,7 +12,6 @@ PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
 PYTHON_PYPA_BUILD_SETUP_TYPE = setuptools
 HOST_PYTHON_PYPA_BUILD_DEPENDENCIES = \
 	host-python-packaging \
-	host-python-pep517 \
-	host-python-tomli
+	host-python-pep517
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
