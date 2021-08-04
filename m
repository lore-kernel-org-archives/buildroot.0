Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43388C432BE
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 13:47:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E76C060F43
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 13:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E76C060F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA7AF83CCA;
	Wed,  4 Aug 2021 13:47:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mCw1Om0spZ7K; Wed,  4 Aug 2021 13:47:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 194C583CC2;
	Wed,  4 Aug 2021 13:47:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B24671BF9C1
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 13:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1C5383C9F
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 13:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SUWGutDMCGYH for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 13:47:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B803883C88
 for <buildroot@busybox.net>; Wed,  4 Aug 2021 13:47:01 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso3961272wms.5
 for <buildroot@busybox.net>; Wed, 04 Aug 2021 06:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jCtHJpFQSu9zTQRxhp+jli9OWNl7578vq+oa5x0K/hw=;
 b=V9HnlZR2ICUWJMXjEgxPyEt5vyst/+8/9/3PfnLsDaFk81p2IxcjGLmEM8emHBvZ0O
 pyjcB7jUgfDba/r1wmunsleUqi0N6BWtb/vInB3iCtoimVPlrCa1nn5AkMwidY6AaWjf
 TNNl17eOiwNAxxjxT+NpqtYL5/txe/uQNLzSXLEDjX8weoCsl4wokeRnNSQbpjKJDmL5
 lDK3mZGnCRpek1jjM6x/ys0TWRdoH3Jg4xUqWxaiNIYqpE0eFASRQIlU04LuhSvT2owV
 KcwSaURz7dYHew6SYvhkCRNYKdeSWM+lA/07b3QaMVdxFPyFSfTZk+8SRd2gbSdWzz5X
 jVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jCtHJpFQSu9zTQRxhp+jli9OWNl7578vq+oa5x0K/hw=;
 b=nbf1EdhSf6Lgv09XbBE9+HQWmof1EeueJ/M8A+xdk4/f5lZQ1c7RC+239CKqOENh+P
 0Vdtiwm5xG1X0escKd0SqYzO1gefh3HKEn9IUAs7jD4mK7/oVqhf5yVoWrjWRq5E94wN
 dmBGkns1z0eEBmbXGSDjCrkYGIOOKf717diDKXEzme1wCNWbJCpg1kvODdU4b+CxjmFF
 K9BBG+JD6B5DsaCNLMT7YplOcB4Ms34WTNOeHu+eS2wt69DDy2QqPdzdcWAbU+j8mhB3
 +ykp3BOB91gYWq6oK+x30cDwvKFito22NiNEGLzAUz/ua0D4lKvq3oi3WnvvJMaRAiO1
 YdzA==
X-Gm-Message-State: AOAM533jZsB4Mh3NdCR+8Yq5kP4SVT2NpPwu3W5Lkit0uJPdx0GTfqo9
 7ZpxMFf3ct82ymnrIamoyXdnC7Lib7I=
X-Google-Smtp-Source: ABdhPJyZ9cTGpVCF3gXmtt407m3IEC/TUqssL30w5hULPvTR6cXRX4etv9p//GBprxNJQasSXb4WrA==
X-Received: by 2002:a05:600c:5114:: with SMTP id
 o20mr9780482wms.176.1628084820071; 
 Wed, 04 Aug 2021 06:47:00 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id 129sm2292777wmz.26.2021.08.04.06.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 06:46:59 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  4 Aug 2021 15:46:34 +0200
Message-Id: <20210804134635.262095-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/2] package/lua-lunix: fix build with recent
 gcc
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fixes: http://autobuild.buildroot.net/results/749a11d5289c6fec3b2f236b9073fc1ab730d090/
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-lunix/0003-force-no-sysctl.patch | 32 ++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/lua-lunix/0003-force-no-sysctl.patch

diff --git a/package/lua-lunix/0003-force-no-sysctl.patch b/package/lua-lunix/0003-force-no-sysctl.patch
new file mode 100644
index 000000000..3467e2713
--- /dev/null
+++ b/package/lua-lunix/0003-force-no-sysctl.patch
@@ -0,0 +1,32 @@
+From d9b65e306478f5d2356ef90eab8191984534238a Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Wed, 4 Aug 2021 15:27:05 +0200
+Subject: [PATCH] force no sysctl
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ lunix-rel-20170920/lunix-20170920-1.rockspec | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/lunix-rel-20170920/lunix-20170920-1.rockspec b/lunix-rel-20170920/lunix-20170920-1.rockspec
+index 76cafeb..e42fd34 100644
+--- a/lunix-rel-20170920/lunix-20170920-1.rockspec
++++ b/lunix-rel-20170920/lunix-20170920-1.rockspec
+@@ -35,5 +35,14 @@ build = {
+ 				};
+ 			};
+ 		};
++		linux = {
++			modules = {
++				["unix"] = {
++					defines = {nil, nil, nil;
++						"HAVE_SYS_SYSCTL_H=0";
++					};
++				};
++			};
++		};
+ 	};
+ }
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
