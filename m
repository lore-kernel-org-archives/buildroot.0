Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72594F3D610
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 15:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31D1B80C6E;
	Sun, 29 Mar 2026 15:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aRhgg5tSlMUa; Sun, 29 Mar 2026 15:47:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 634AF80C8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774799265;
	bh=k6uInHpIsyVNOh66SglZ7mslhhy8b2/D0eavScE/mIM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hxmxNahY4ZpP7LcQSSRg+0/ceZg9C11z8rNzYT8RqPiTlk0AkXzBGY/gpsLjJ7tGK
	 MLyuA0mNoDwzUxx/1Peq6tde3O5vXoPAaOSJ52/COk+8yAWXZunOIxbA8YFf3R5YPd
	 06s7P99wXUnTJE/tEday3opNxjuq7FdFEMZyvaXpMssCaqkv2mUNwWORIFjaqs78Rs
	 5kdPUqLS3liw0KrV75INGtM4nxpnL2DydYWWL9vvcRfBj4uJdFWsCFL5VPk299O0v0
	 Upn367nratkyVAPFgKTxdL0+6WUxHBENRuaGZADxqS0DQPSlhJvs9Xfsb2zI90FYr8
	 9KOUIwb6U0+mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 634AF80C8A;
	Sun, 29 Mar 2026 15:47:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45EF42EB
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 15:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43B5F40188
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 15:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79rUJV4RPBIK for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 15:47:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com;
 envelope-from=a.p.dicarlo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F913401A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F913401A4
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F913401A4
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 15:47:40 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-505a1789a27so19523941cf.3
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 08:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774799259; x=1775404059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0HuqfgcREYsAXvdAwy0OGuyzRMBC/DurNM4IF/JPKYg=;
 b=quWlwHckPtHAgJvrNZcdmrh4+MGaEL/Uq1SVnlYGKc1lT/20WH4+rf4XzymzxNnJ4v
 dhgYJwI+DpSXwS5C14WzmkOtDnYhX6YnJcY/ZUJSEk8QSmlnjmGaQVcx3kmMeJ9v6SEH
 G8d5IzbiP63+zUjtAgmsUlBIvBfXxmMj51OhH/Mwe2XmaeqnW9wsOm+2cpzJl9Y42K4b
 PC1ov9lNI4aJo8NKCZWdkrIzCgARVyvwuD8uD8iLHFPSR3LnRvOphFN18O06Q05lCEye
 mQJ7gVYVo/fiG8lVicUHbe1Ieu0RMsBw1NKCraHOH5kUzD2YaLGLIitnDqea1U3xlwI5
 2LgA==
X-Gm-Message-State: AOJu0YxQxJgy3VtSB+yr8w1g2vPUldleD/wFmkLt7pq436GLb6k8RUcK
 2hrK0kn4L6+x7A0s2C8KEcece11PfTmjSkSFwmmPSiPL2NcHy4Oz3Ffv4+ytmiTK
X-Gm-Gg: ATEYQzwE8v8SAsFdAfSe/fOfKQqT4b5G1tXP21a2mg6LjMoI5jmDQ20bSRm9LlVrBJm
 HYjtncLuu9Tbd2bCP3usBcXqgMEbADF07ooPlDWfHgAE7ms7Lp/TMQJ58edH1WE3qbWbcV8z91v
 srcXJVcAQlvmoGlQnXOneYB/KL28jlz/1VlhtXMOL3tk51KWtbWkZv0ARAiqJT8NZ+huO35UiP4
 JGVV+U2ndAz25Dnq57NyjI5X5Iu7BzKUKwZZBp89REoxNMasEF5rDM420Pj6fL4baY8UkG/Ubn1
 IfxDIlusCx6yy2p12en0cRz8HaR/Mh+Z56WMHPeNp8pER8ZmEWtuvUdG/XpcGEmHNuEPVRFs/59
 AvBp+ULBF03e0ZwXSxIionRCdGSdiGmjI8jTHPEdgFyZgg+Q4OhT+cBlZLGM7TtXjwelHuRzLvy
 x/xlZUyRr0AlLPCS23d35mlnd4fmL9aFZE
X-Received: by 2002:a05:622a:5917:b0:50b:893f:7d93 with SMTP id
 d75a77b69052e-50ba380b4b3mr128448491cf.2.1774799258574; 
 Sun, 29 Mar 2026 08:47:38 -0700 (PDT)
Received: from adicarlo.nyc ([2603:7000:4000:24ab:21e:4fff:feac:60a])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89ecb5cba4dsm40884386d6.9.2026.03.29.08.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2026 08:47:35 -0700 (PDT)
Received: from yogur.coo (yogur.coo [192.168.7.134])
 by adicarlo.nyc (Postfix) with ESMTP id 7A86BA980C3;
 Sun, 29 Mar 2026 11:47:34 -0400 (EDT)
Received: by yogur.coo (Postfix, from userid 1000)
 id 2C8DE8A; Sun, 29 Mar 2026 11:47:34 -0400 (EDT)
From: Adam Di Carlo <a.p.dicarlo@gmail.com>
To: buildroot@buildroot.org
Cc: Adam Di Carlo <a.p.dicarlo@gmail.com>
Date: Sun, 29 Mar 2026 11:47:09 -0400
Message-ID: <20260329154709.539516-4-a.p.dicarlo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260329154709.539516-1-a.p.dicarlo@gmail.com>
References: <20260319022906.47253-1-a.p.dicarlo@gmail.com>
 <20260329154709.539516-1-a.p.dicarlo@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774799259; x=1775404059; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0HuqfgcREYsAXvdAwy0OGuyzRMBC/DurNM4IF/JPKYg=;
 b=ZdqDQzQ6B+h7qVy+r5mUsaBQFXIqKnwHUFK7DhGDP5f8dxUdh0O2NzfzarPav6um/4
 Z6TD8Lx4Tkf2DcdAAkfQvwcUADqgQmsEavsx1CzUBgFAkxEqHEJe7j7vQpF9pO6PXwmu
 QGlHkyt4MUfQeV4qoICpfClZIc3ABtBdwtQ8UzAPylLkdtojEBOwjyoOK0eib+M0C2pS
 50M2FOVNURoJRepUV26kGjtKOvJN9hAy80G4YMLO8fUVkx7bpLkUwFqNeXxCajm+az8J
 eZjqBhqhBewdH1tSdXL4l/7nouPZhRhv7JXRC89GVKu/GHW3Cgakp23XexvZsh8+H1Fp
 Bhhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ZdqDQzQ6
Subject: [Buildroot] [PATCH v2 3/3] package/gst1-plugins-bad: presence of
 libgudev enables udev support
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

If the buildroot packages libgudev (BR2_PACKAGE_LIBGUDEV) is enabled,
enable udev support in various plugins.  Also bring libgudev into the
build dependencies, so they are there when required.

Signed-off-by: Adam Di Carlo <a.p.dicarlo@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index e488fa3c2d..bd2061a7d5 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -77,7 +77,6 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Dsvthevcenc=disabled \
 	-Dtranscode=disabled \
 	-Dunixfd=disabled \
-	-Dudev=disabled \
 	-Duvcgadget=disabled \
 	-Dvulkan=disabled \
 	-Dx11=disabled \
@@ -111,6 +110,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dorc=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dudev=enabled
+GST1_PLUGINS_BAD_DEPENDENCIES += libgudev
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dudev=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BLUEZ),y)
 GST1_PLUGINS_BAD_DEPENDENCIES += bluez5_utils
 GST1_PLUGINS_BAD_CONF_OPTS += -Dbluez=enabled
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
