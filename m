Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB7DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 16:32:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B66056128C
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 16:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B66056128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86AA460E73;
	Wed, 29 Sep 2021 16:32:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-BxZDC5UEtQ; Wed, 29 Sep 2021 16:32:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E941060E34;
	Wed, 29 Sep 2021 16:32:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35B721BF989
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 16:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2402B40723
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 16:32:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iDZ7VIRYRTq8 for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 16:32:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 037E5400E7
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 16:32:17 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 205-20020a1c01d6000000b0030cd17ffcf8so5810027wmb.3
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 09:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xipJnaQh/rpX5villvgUqicdJOSfQ7K7mUNrXjs+xJQ=;
 b=mLs3d9Q/GYZhcMhKNhNKdjp5hK8fo2jYSDx0lEtQ8s5UxDtHHMVeJiGsmfnE0scF8n
 9b5xogCNGy3XWnleQQpiYxbMDfEwgjINgp5LVVCjGQGlFqkfSwGVspxT0G9re0ily2KM
 wmeO7n3zmifA6U/XDoZz+zaG8kEXctwQChpq1tP4veO4QCyKcFtuM7YG7t9674RgFpMP
 puoTZzsGrGbEzJ8feNhzOoGa6lHCPsZ01o6bVJQQ9X4qct16ern5MjE/JOFHOmFsCrqw
 WsGFnAQewQxdirl3xS842kuRZYjqBLM006oSzZajfuhCYUtEjJzni0nk2LJb1+UEx6aQ
 4CWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xipJnaQh/rpX5villvgUqicdJOSfQ7K7mUNrXjs+xJQ=;
 b=K2q8SAY9g5kCtxh3M1j1gqbe+Nr9v9ZrGc/JUoqwJN4W0TnsR4uXgckr6S1wjFvRLG
 6p3PzQ9r+gkSoUFhhQ4qeNKzLpL3xdNNh/42eFrGsCUU3wc49Qk1Nyb8mUemFWQNgr/A
 CZvB0QzpxYPZ1Z4Jbz4C3KK7gYBm/Bx6Lb3iPg9Ukv2glEklycJgWWtToFjRxzPi2ory
 qprVO+go3GyavhK36+4XiIL24rdSCV1baU9T4i+8jFeW8d2ctQvTO64+xkqidZ+Oj9/n
 9/z2cQs0UCb6vxDV95H+0iklyNNGUvdrvtpo/vReTm1a92ZOxDL5dyqhaxqGoudsdWes
 AzTQ==
X-Gm-Message-State: AOAM530bVs1+5/nyhMH55q2KKjMcF1ZH0ky0ACBZEUC1NONhyhDVub1V
 imE4FrWHErVliAdSrHY6FGCxGek05Uw=
X-Google-Smtp-Source: ABdhPJwoStrAUDWEGZqMKBF3tHDEsH4m7KtkxFl2ps95aGBQE7q+HulpcMtxa/Bwd9CPek6G+TqVWQ==
X-Received: by 2002:a1c:751a:: with SMTP id o26mr980833wmc.94.1632933136014;
 Wed, 29 Sep 2021 09:32:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id n15sm395668wrg.58.2021.09.29.09.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 09:32:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 18:31:44 +0200
Message-Id: <20210929163144.1779192-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-psycopg2: needs python3
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

python 2 support has been dropped since version 2.9 and
https://github.com/psycopg/psycopg2/commit/d956eaa3b1842a14895685be0d6d5e380fd029fc
resulting in the following build failure since bump to version 2.9.1 in
commit 09417e47d706e5d7d58c0f886b4679064c5175fa:

  File "setup.py", line 117
    f"Unable to find 'pg_config' file in '{self.pg_config_exe}'")
                                                               ^

Fixes:
 - http://autobuild.buildroot.org/results/f8a2cf9eea500e2c617381840b849225f12b56f1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-psycopg2/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
index 5ffe179517..fba781c014 100644
--- a/package/python-psycopg2/Config.in
+++ b/package/python-psycopg2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PSYCOPG2
 	bool "python-psycopg2"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_USE_WCHAR # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
@@ -21,5 +22,7 @@ config BR2_PACKAGE_PYTHON_PSYCOPG2
 	  Psycopg 2 is both Unicode and Python 3 friendly.
 
 	  http://initd.org/psycopg/
+
 comment "python-psycopg2 needs a toolchain w/ wchar"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_USE_WCHAR
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
