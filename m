Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF176CF58D1
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 06:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74F9240591;
	Fri, 20 Sep 2024 06:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E6TYpaE9vYev; Fri, 20 Sep 2024 06:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32ED2405D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32ED2405D9;
	Fri, 20 Sep 2024 06:20:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 937C51BF3A7
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 06:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8273B607DC
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 06:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_kI53UANc85 for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 06:20:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.43;
 helo=mail-wm1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4AE61607D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AE61607D6
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AE61607D6
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 06:20:27 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42cbface8d6so19751165e9.3
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 23:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726813225; x=1727418025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5UnADIcDIzrcrk4nH8ri+VzXSnvfbUXwjX0pGeN8V3w=;
 b=ZcwLfVMYEWFNe6PFG+eraIFNbNdFqI35N2/V3KJQuc8JIEave9aaffiQ5ii8CKvNc0
 OtVPkToJ/mZ4xkilvsnjbGHz7BdsAKKfOOAAmaddJcjI4Uc8FXBi2EvOYeCYp3TvezZK
 kpqiRJG6TVCeSiPlyetLARWeiqOwUzNpx/9xdISENbKa3Iv5SxLEUUKQfcprnPYeS95p
 0MfXyeaxV4Z7xzYtQfSoyrYIF/Q4+VeXKVZAvgKGudRkOzHxFwrufDPwMqUPPD0wyvoc
 Q2PJPCPPC/QdqIxeelVLHOK70BTiHtB9bG5zTn9QuP+QbzoZFXkETeKeMdo2kwVMul4T
 ng5A==
X-Gm-Message-State: AOJu0Yy9xbuILvX4HecxVkqJQSqGJZlwV51Hx5uh1ZZkwPiGekgMmxjQ
 4u+jg+fnSkQmpUJPagQS79lIq2b28WwwHEiVRGMCoxgFkdKmxn0c+x7AcPOZ
X-Google-Smtp-Source: AGHT+IGoPojolMj7w5P2mKMmcevlF9mlWpZoP/d/+hshvjY9FJhxxlwaLQAxKvZhFnLwWCTQRvnkzA==
X-Received: by 2002:a05:600c:190e:b0:42c:b555:43dd with SMTP id
 5b1f17b1804b1-42e7abe4184mr16655605e9.3.1726813224546; 
 Thu, 19 Sep 2024 23:20:24 -0700 (PDT)
Received: from thomas-Precision-7670.home
 ([2a02:a03f:eb68:2f00:6d30:16c1:8b58:4271])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e75450a95sm39814525e9.25.2024.09.19.23.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 23:20:23 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 08:20:13 +0200
Message-ID: <20240920062014.132862-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 1/2] package/libwebsockets: add an option to
 enable lws async dns
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Bart Van Severen <bart.vanseveren@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bart Van Severen <bart.vanseveren@barco.com>

Lws now features optional asynchronous, ie, nonblocking recursive DNS
resolution done on the event loop, enable `-DLWS_WITH_SYS_ASYNC_DNS=1`
at cmake to build it in.

The default libc name resolution is via libc `getaddrinfo()`, which is
blocking, possibly for quite long periods (seconds).  If you are
taking care about latency, but want to create outgoing connections,
you can't tolerate this exception from the rule that everything in
lws is nonblocking.

Lws' asynchronous DNS resolver creates a caching name resolver
that directly queries the configured nameserver itself over UDP,
from the event loop.

https://libwebsockets.org/lws-api-doc-main/html/md_READMEs_2README_8async-dns.html

Signed-off-by: Bart Van Severen <bart.vanseveren@barco.com>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/libwebsockets/Config.in        | 6 ++++++
 package/libwebsockets/libwebsockets.mk | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
index 05c132641e..6116cfecb5 100644
--- a/package/libwebsockets/Config.in
+++ b/package/libwebsockets/Config.in
@@ -19,6 +19,12 @@ config BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL
 	  unconditionally compiled in for library versions
 	  prior to 3.2.0.
 
+config BR2_PACKAGE_LIBWEBSOCKETS_ASYNC_DNS
+	bool "enable async dns support"
+	help
+	  Enable asynchronous DNS resolver that directly queries
+	  the configured nameserver over UDP, from the event loop.
+
 endif
 
 comment "libwebsockets needs a toolchain w/ dynamic library"
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index c00c44cac3..e53febfce4 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -98,4 +98,8 @@ ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL),y)
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_EXTERNAL_POLL=ON
 endif
 
+ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS_ASYNC_DNS),y)
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SYS_ASYNC_DNS=ON
+endif
+
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
