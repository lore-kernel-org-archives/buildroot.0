Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDA3C369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 07:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14F9E812A5;
	Sun, 20 Apr 2025 07:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nG4cErBwp-Oy; Sun, 20 Apr 2025 07:09:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F73A81293
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F73A81293;
	Sun, 20 Apr 2025 07:09:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18C2A68
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 07:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE84440449
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 07:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Crt7zV_kzD9S for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 07:09:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.52;
 helo=mail-wr1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA7B84036A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA7B84036A
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA7B84036A
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 07:09:40 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-39c13fa05ebso2056090f8f.0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 00:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745132977; x=1745737777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FdmZTVhYQQZTMzhcWex7kuWvEPf07B3mQ45fTWhCBpY=;
 b=OccHrMLnAp8mE1+OFACZNt+MB5IZGzl3kX5qrzyWAjeXvfdr8AL2AfXg/HDrfFktIc
 XSS1yhbGyy5DHN/HhpA9MUuRuNsEusv/YmYluesU7kj26jas6zVJCjtVK+O6qQbY0U4/
 DVRjydnEBRlchLhC8P4yNNpMQeW6Na9N+FYqZeG1NgyCpd3l4m3Q83gtm5GwRQDsheYx
 QsWPKq3zu+IAgOHI5fPIA0OllNdXkkx3NAP+BmTpsRO/uIvyxGoHbR0UY6luKZCObx7c
 E4WIpQwjEEnk5u38XtU4+VKzra+QwB5ZkXmQo3vY+kiJNxgxg7zyAViDgDafEAHoXo/p
 0Y9Q==
X-Gm-Message-State: AOJu0Yy2bEzoJYp6cCWb+xM1uFOlQY3JlUDm3/pMacDmw/ccVPU1Bit6
 Iwgunq0nqFmRF+g+SX5kiWdw14WY1atElZa1Y17PFqxhTW1w46lSJNtZig==
X-Gm-Gg: ASbGncs5zECy+WRMORSiL8Fq0gPUtlwSw2/iIZn0cywBli2w6IYGmkCJTbxGpXTkFQ1
 kuW+VTF3zVBu+ah7K4T7RvmXEIUqmhtvX3fZ+NQB5dJrJDCjoR3Ch/fAkwmO3uxiNsmKcNSMIzO
 KtTF7eHNYR+SENbsKDWVtJcgy/cSE5MrgMUtnH2WdAsN3sHzBoWkDurTljlRg1b7tuXP+cwcFzS
 GR6CY2o+9CHwg/rEdU29DWcU68nTiX01YA+lJQFW62lEJZ9y8Bz61S0VE+5sQVL+DoCEU7uu6Hr
 9DgZeJrEpSaBKnp1GbTT5B+xahlOzXcm47ruiXGLNyXEFoec/FnX
X-Google-Smtp-Source: AGHT+IGLWvS8bHdhJMjRnJK2jDBDi8Vnp2NhBQM9RUHwTiJMe4K5osvRiPM2iZZRAzRNU65rH5BfOA==
X-Received: by 2002:a5d:47ad:0:b0:38d:de45:bf98 with SMTP id
 ffacd0b85a97d-39efba2e4f3mr6187194f8f.8.1745132977329; 
 Sun, 20 Apr 2025 00:09:37 -0700 (PDT)
Received: from localhost.localdomain ([87.66.230.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4407c5c7916sm29362905e9.27.2025.04.20.00.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Apr 2025 00:09:36 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Chris Packham <judge.packham@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Sun, 20 Apr 2025 09:09:34 +0200
Message-ID: <20250420070934.185346-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/syslog-ng: disable cloud auth if
 libressl is used
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

./modules/cloud-auth/jwt-cpp/include/jwt-cpp/jwt.h:1158:33: error: invalid use of incomplete type 'struct ECDSA_SIG_st'
     auto rr = helper::bn2raw(sig->r);

./modules/cloud-auth/jwt-cpp/include/jwt-cpp/jwt.h:1159:33: error: invalid use of incomplete type 'struct ECDSA_SIG_st'
     auto rs = helper::bn2raw(sig->s);

./modules/cloud-auth/jwt-cpp/include/jwt-cpp/jwt.h:1181:15: error: aggregate 'ECDSA_SIG sig' has incomplete type and cannot be defined
     ECDSA_SIG sig;

Fixes:
- https://autobuild.buildroot.org/results/d76/d76883e0870b4c788058fee1ac2c1c47a17f6bf2/build-end.log

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/syslog-ng/syslog-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 57ee46ce05..91d2dd5269 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -63,7 +63,7 @@ ifeq ($(BR2_PACKAGE_LIBCURL),y)
 SYSLOG_NG_DEPENDENCIES += libcurl
 SYSLOG_NG_CONF_OPTS += --enable-http
 SYSLOG_NG_CONF_OPTS += --with-libcurl="$(STAGING_DIR)/usr"
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+ifeq ($(BR2_INSTALL_LIBSTDCPP):$(BR2_PACKAGE_LIBRESSL),y:)
 SYSLOG_NG_CONF_OPTS += --enable-cloud-auth
 else
 SYSLOG_NG_CONF_OPTS += --disable-cloud-auth
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
