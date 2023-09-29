Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07E3E743F2
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 07:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66CBC60B19;
	Fri, 29 Sep 2023 07:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66CBC60B19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5DtL6YwaN2jd; Fri, 29 Sep 2023 07:59:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CB5660B94;
	Fri, 29 Sep 2023 07:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CB5660B94
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A5B41BF267
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 07:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73A138283D
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 07:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73A138283D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwsFrLAvB3Z4 for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 07:59:05 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09631827D8
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 07:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09631827D8
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3231df68584so9684780f8f.1
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 00:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695974342; x=1696579142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JwE2UozNd3z0PHbOTUmpLyMIEJslh0dESwTpUgHJ4Ts=;
 b=N9Lx7vXYNxgo06rm+JWC6fNQXL8CHrqIk3yRTyBQY6BLC6Rdb6qWa38hvABRk/AUGr
 ciNm3R/7ZwIZC3kIVfQjWs5GRohacNLsxlpdjrNXu7qcURiRbSMe5XdDZfmJUvD7hPh0
 9OcKLwEs1Cyic0XHAUwCJ98ZuqTP6ng66F3m1xfYg/3oHXLl7IY7UeqzF8fahqmy4b+Q
 ahenavd7laCNsyh3opWf2oYtxVzYHm1Acbz2wMtLURIeQh9cmsgSM/e+RlRjEV1k+YlJ
 igWBa1oJZA/ll9ktGKOf/J85MPGsAkrtKsIw0eapVsCXTS76fYrsFNaWeZ97QCEQZTZE
 T/Gg==
X-Gm-Message-State: AOJu0Yym+GopJv/DrFMFU7oNWDSKmhGOwCrqj4cl0mpLHBBWj8CE9YBJ
 XayRgeHWfXgcUqg7NAy8Y+He73x+1OO+kYtS
X-Google-Smtp-Source: AGHT+IEvo8heric0/Odj0INh3Oim2C9820HSzRwmlFMakRlhXkPLKwb7hefApAStet7gKndAzV2JMw==
X-Received: by 2002:adf:f702:0:b0:322:dbe8:e18f with SMTP id
 r2-20020adff702000000b00322dbe8e18fmr3256892wrp.46.1695974342182; 
 Fri, 29 Sep 2023 00:59:02 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 bt14-20020a056000080e00b003200c918c81sm14576481wrb.112.2023.09.29.00.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 00:59:01 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 09:58:25 +0200
Message-ID: <20230929075844.1145939-2-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230929075844.1145939-1-thomas.devoogdt@barco.com>
References: <20230929075844.1145939-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695974342; x=1696579142; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JwE2UozNd3z0PHbOTUmpLyMIEJslh0dESwTpUgHJ4Ts=;
 b=YZUxZno+GEPJE1/4O9GbLtrZE+QfRVHVKh86Wxikam8Xz8b4Kh+Z7uRnTRo2xkMfle
 EDQKMLd7VQcx+7bdouEm4PElAefPbkcPF8qnX39ubjv8jhqLnjI/9bCJHDYYhlIkPfSS
 AmtDlkJHVOmnBgU/T2NLUS48Xc7JTvUMYhj7sP1PmhvfLOTm2wIJbn19m+6TIbzNzJTW
 agd3bT8443jgP3HgXDQDvNnE4N1rIsSZBFSWordoBtLaUxQM3NYzv2dlh7HzCje19csb
 n5mkAGVHO6jOufvmuxqPg1lwKZmtpJIfUF3QWef1u6774XGZLRqcodZ5Z27daSYqnCMB
 pLqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YZUxZno+
Subject: [Buildroot] [PATCH v3 2/4] package/webkitgtk: make gbm support
 optional
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas@devoogdt.com>

This was added upstream in commit:

https://github.com/WebKit/WebKit/commit/22e4c0386605d84f42f2d46fd20bdc46e3078498

The 'USE_OPENGL_OR_ES' flag is default ON, which will enable 'USE_GBM',
so ensure that we unset 'USE_GBM' if we don't have libgbm.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v2: no change
v3: no change
---
 package/webkitgtk/webkitgtk.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index bb6df3d592..88bdfae27b 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -88,6 +88,13 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
+WEBKITGTK_CONF_OPTS += -DUSE_GBM=ON
+WEBKITGTK_DEPENDENCIES += libgbm
+else
+WEBKITGTK_CONF_OPTS += -DUSE_GBM=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
