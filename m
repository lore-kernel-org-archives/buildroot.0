Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC0EC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 00:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FA34405FB;
	Sat,  1 Jan 2022 00:04:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AKowk4h9TSm2; Sat,  1 Jan 2022 00:04:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51399405F6;
	Sat,  1 Jan 2022 00:04:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 642FC1C1162
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 00:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53720408A0
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 00:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p_bxog79vfdd for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 00:04:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B73F240591
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 00:04:18 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id i14so33354323ioj.12
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 16:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BOopFgOUbx1Gp/nAuSJ0/11gYJMxKC7bVwI04vLZFs4=;
 b=hXsIhUUBc3IuZhbU9U0VJqXvUE5IC5aNsV0gLAjzyX1dqCEfdaXQRnla42zciBXsoH
 /5XgGUVEgfxIbVncKVnSNLMbPjEaj2L/2Jt1SNJE4upcDIqbiDh1nhQN1ndYQurFVcct
 2zdihR7fWyZSPbRd9erNRg8QFzRLpg7ew+8oXPsi5Kk6VuHz+rSCzExayvoJfmbOro8q
 fUs++jAffPBR6qmx8OQs+bZd0xNAfT8P2xmDl1A43S4KyLZ4q9V1Yf1HRxMJ162JqtTv
 WXqrt9u0IGVMs61MruCTqLq50X/wyjjr4+vmJyA9MLw5SayzInBfMtWhcYPxBVDlWZRY
 lO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BOopFgOUbx1Gp/nAuSJ0/11gYJMxKC7bVwI04vLZFs4=;
 b=4ldWCC0/Em91BpldHmNV+Bu+20eOyj8CWXq8iGe1+hRq592axXmK9dffC7bhwrtTzc
 uaNzmCWTYQzkty04tPR0aC5x5FKr2L/rGPhODEZp2ZkHILwaOJ2f/mxtcnNn5xVJ8TDq
 dcvEOAqzBUnn69L0KXOZw3ADjPKCcWQzlTevDWt5h0/evQOVT3ukJ6+yh2fUrEGvJZwj
 PbA3UhXI6oQepUH22st005NSPIueVLT2m1VTMWwVgd1XQQy+sOPvsb+cjYM13jcgTLZi
 I/Iyorw2IxPed6C6HkfQKpPBXlbTadn9NTt8HIuL0ZsOxFcUWq22LKvt+ExqYwubhL2j
 vw5Q==
X-Gm-Message-State: AOAM530r57vcFhSnc/XFdKUdsCEofHXljfXcov5ieHqTbzibEGF/V/KZ
 Q++BaET1TMx2vUsvaOq838OWfCnbKbM=
X-Google-Smtp-Source: ABdhPJzryX52gaiUb/JJ9ruaHzVbL410vfyZULdjKlB5r8xDthqhKSLUAfMiWkXXtR0Pn+8XdZ2FEg==
X-Received: by 2002:a05:6602:2c09:: with SMTP id
 w9mr16374973iov.89.1640995457664; 
 Fri, 31 Dec 2021 16:04:17 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id z5sm19814343ioq.49.2021.12.31.16.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 16:04:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 17:04:08 -0700
Message-Id: <20220101000408.1538099-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: add aiosignal
 runtime dependency
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

Fixes:
  File "/usr/lib/python3.10/site-packages/aiohttp/__init__.py", line 6, in <module>
  File "/usr/lib/python3.10/site-packages/aiohttp/client.py", line 88, in <module>
  File "/usr/lib/python3.10/site-packages/aiohttp/tracing.py", line 5, in <module>
ModuleNotFoundError: No module named 'aiosignal'

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-aiohttp/Config.in b/package/python-aiohttp/Config.in
index 9ffea088e4..85a6862141 100644
--- a/package/python-aiohttp/Config.in
+++ b/package/python-aiohttp/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_AIOHTTP
 	bool "python-aiohttp"
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_AIODNS # runtime
+	select BR2_PACKAGE_PYTHON_AIOSIGNAL # runtime
 	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_CCHARDET if BR2_INSTALL_LIBSTDCPP # runtime
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
