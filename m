Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D80CF58D4
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 06:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3408441352;
	Fri, 20 Sep 2024 06:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHZPmRA0UJZL; Fri, 20 Sep 2024 06:20:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAA1241257
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAA1241257;
	Fri, 20 Sep 2024 06:20:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 082071BF3A7
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 06:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB4D2607DC
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 06:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V5rLtpcRDNnW for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 06:20:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.43;
 helo=mail-wm1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4245607D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4245607D6
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4245607D6
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 06:20:30 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42cb2191107so13239665e9.1
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 23:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726813228; x=1727418028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E/wZPoswzcN8DmLNkbB4OjQpzA4SOGhldkWRLrHAk70=;
 b=xJ3MHuz/PlRZ2wlI61P+O5P2OGcAt/ZmYF0qn7eZjX3Zvf8aVjCB/zO00AxJ9gxulU
 naADXUkdMB3TILqrnHUm+E1ot3QCOsxybRIHQEe1Hf+TfOsg4NO3nVdfJpaC79mBj6ZO
 /yNpDEKUZ2V2h/+rto9ypAs6rATnV+YXgp03S/DAxgLrOj9/F4TNHLNM7+hlNI3GmBJ5
 y2+5FxZQNE8qgolWnSTMSo4Ma6wcI5Jsn8ssj9soz1m7TWANXJIt6FEivKNmENsJolMV
 ZYNj2VRoOMZQIN9myxd9e4sZ5Pyl/A830BWiFWDj76EdKRkDzfa/IrDoYHkMvwS2YvgW
 oOdw==
X-Gm-Message-State: AOJu0Yx/OYrjf11FPYLW91MtzGmEjjpJXxw7hW/gRlTqopgrNX+HWGDK
 jpsxvtkQ3Q0RmuoQxvbsZ5v1PVf/vueh8tWp3xqil0FUvbR0S8Iwgn1taSfu
X-Google-Smtp-Source: AGHT+IHrfqFMzha5DGbdIXDZ6GcXvro5NDOjLqLXHZVXKlzROaImC0pWyANMfS1jsUONH4k9yn4wkw==
X-Received: by 2002:a05:600c:4f55:b0:426:593c:9361 with SMTP id
 5b1f17b1804b1-42e7c193efbmr8337205e9.26.1726813228177; 
 Thu, 19 Sep 2024 23:20:28 -0700 (PDT)
Received: from thomas-Precision-7670.home
 ([2a02:a03f:eb68:2f00:6d30:16c1:8b58:4271])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e75450a95sm39814525e9.25.2024.09.19.23.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 23:20:26 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 08:20:14 +0200
Message-ID: <20240920062014.132862-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240920062014.132862-1-thomas@devoogdt.com>
References: <20240920062014.132862-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 2/2] package/libwebsockets: fix LWS_MAX_SMP
 when BR2_TOOLCHAIN_HAS_THREADS is set
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

"If LWS_MAX_SMP=1, then there is no code related to pthreads compiled
 in the library. If unset, LWS_MAX_SMP defaults to 32 and a small
 amount of pthread mutex code is built into the library."

This is a misconception, when unset, LWS_MAX_SMP is actually set to 1,
so mutexes aren't built in.

To fix, set it to 32 explicitly when threads are enabled.

https://libwebsockets.org/lws-api-doc-master/html/md_READMEs_README_8coding.html

Signed-off-by: Bart Van Severen <bart.vanseveren@barco.com>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/libwebsockets/libwebsockets.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index e53febfce4..90ab5da0c9 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -18,15 +18,14 @@ LIBWEBSOCKETS_CONF_OPTS = \
 	-DLWS_WITHOUT_EXTENSIONS=OFF
 
 # If LWS_MAX_SMP=1, then there is no code related to pthreads compiled
-# in the library. If unset, LWS_MAX_SMP defaults to 32 and a small
-# amount of pthread mutex code is built into the library.
+# in the library. If unset, LWS_MAX_SMP defaults to 1.
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 LIBWEBSOCKETS_CONF_OPTS += \
 	-DLWS_MAX_SMP=1 \
 	-DLWS_WITH_SYS_SMD=OFF
 else
 LIBWEBSOCKETS_CONF_OPTS += \
-	-DLWS_MAX_SMP= \
+	-DLWS_MAX_SMP=32 \
 	-DLWS_WITH_SYS_SMD=ON
 endif
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
