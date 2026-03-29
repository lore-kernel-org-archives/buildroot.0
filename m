Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3F7F3D5FB
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 15:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD48360901;
	Sun, 29 Mar 2026 15:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3f3zyalp8Wr4; Sun, 29 Mar 2026 15:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F107D608C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774799261;
	bh=fq4rp5qsLD9+ytZGC0Rulip5l25lUftmKj/Apz+HolY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DBrc1rJaa3CCfXB7hEPoGKFRXBh/SaiW7sCtLeZ7Evk1ODs8DZxot1gbESsXZNei/
	 yIiO1eNRh4P3nVmMvFpThJb3kvl3Z3BQVngeKEid87tVPcTq0zzHXdfn6tD2eG0ufe
	 VsqBztUi0s3/25Fx+v0+dXg/Y9xxtIC5HzdMC4CDJxKHkTUVwckyCF3oXPXMR4RJhj
	 IA1EExz86OuO48h47NdITN7he69J8ZnjgOZBrbjo9z5Ud10U6sXp5hnhJehVHps4Rx
	 pleg8wt/FTslJBrF+CYVRfNdO43MKhzykkTB4bao2IqaZl9AC1aqm5nXIJdyl+Qvoe
	 8gzCNY6qIId7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F107D608C4;
	Sun, 29 Mar 2026 15:47:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2319C1D3
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 15:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1458D401E1
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 15:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrixeKxVTCQT for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 15:47:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com;
 envelope-from=a.p.dicarlo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5DC6140188
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DC6140188
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DC6140188
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 15:47:38 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-50b3488fb31so63259871cf.1
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 08:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774799256; x=1775404056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CRcvjwgfzMJqmIY9vTp53BdvrH0doqH3Tf34oQ3VR6U=;
 b=BLdO3VU57xBu5ZZDySdrJ0mMOdlinilZ7Bghnd1fQ7rV8d6WXhlIugqK82S1FzXSeG
 vPBqZFW2Bz/81TDLip5bSeG3uq6yyZz5WViizhxskYckr7I5qkmt9CPvT5q/KyZ0StLf
 hzmL4hWAzzo/4e6X9kQ4VKnViHT0HsdU7LecaHHJsVbuNOTI/KlimXUmATnQy1xHQRDL
 GKMPWfzr333EFYVycXEwO7yOhBShuOabdsN7MVwuW1oyAB/pWDQ/J44gdlGeuC6re1Ln
 EuUAKKOUJLOfXlvXyfvBu0cL78tUzlZvld5oGbKdx688VrfufB/Nc2LqNXljD7m5J9CF
 rp0A==
X-Gm-Message-State: AOJu0YzQjhm67LvXqFjiT0Ws1B2b22yfCIyGaK7v0ZqlBFhmrfTZ8vKQ
 wmr66eB8ykYR16ZRa0EfMgrLiH8pppDQ3e6w31TOAXkcFAyJZq/P4IbQSoe2/kn6
X-Gm-Gg: ATEYQzwleZ6cQhS2N9Vn9WsyXsipxe0ZGmX7SGyadV4h6R4j2uaX7laAbk5XTda8eHp
 Rn5gLfrM/LpktvREh4iEKwyODqBvXo4lMQjK1V8nMm+GHHO/SHvx43cjZlC/G0kBMMYyUGaVldM
 x1K7XyfejKLsiOC558v3/PKXjb6umFbHdGiOrE91KJM0nIrmeeVN70y/xw04ZFNZBlT4YtGiXCW
 IFBL1KD8bElwe+/pSTcH0awHSE50ma8AKH1G6mYUx1ni00UQ01x3mSqJgBMd4PhmlHvYpGQ4gQm
 8lLDIXQbQS4dyolsqioZbb/3IkIi4K5+D698rn71bNWbsxYWQgZjD0i1pPfjdtRzfzefWNepZ5w
 3YROck5FUBAxJ2TOiH9fC5HHLlqNGqsEkZoD2SDYHkDt1gqVbMW4lVnMLtHpJ2hWQlxgwX53fDE
 C2YH+mgBHlV+PeMOeJq4PQ
X-Received: by 2002:a05:622a:10f:b0:4f7:a06d:c4df with SMTP id
 d75a77b69052e-50b9951426emr156030131cf.33.1774799255781; 
 Sun, 29 Mar 2026 08:47:35 -0700 (PDT)
Received: from adicarlo.nyc ([67.245.157.254])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50bb2c67ffasm41027531cf.3.2026.03.29.08.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2026 08:47:35 -0700 (PDT)
Received: from yogur.coo (yogur.coo [192.168.7.134])
 by adicarlo.nyc (Postfix) with ESMTP id 726EDA980BF;
 Sun, 29 Mar 2026 11:47:34 -0400 (EDT)
Received: by yogur.coo (Postfix, from userid 1000)
 id 1DBD68B; Sun, 29 Mar 2026 11:47:34 -0400 (EDT)
From: Adam Di Carlo <a.p.dicarlo@gmail.com>
To: buildroot@buildroot.org
Cc: Adam Di Carlo <a.p.dicarlo@gmail.com>
Date: Sun, 29 Mar 2026 11:47:08 -0400
Message-ID: <20260329154709.539516-3-a.p.dicarlo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260329154709.539516-1-a.p.dicarlo@gmail.com>
References: <20260319022906.47253-1-a.p.dicarlo@gmail.com>
 <20260329154709.539516-1-a.p.dicarlo@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774799256; x=1775404056; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CRcvjwgfzMJqmIY9vTp53BdvrH0doqH3Tf34oQ3VR6U=;
 b=mzp60P4amqnGnVJq3kqYmr5bIO5gsPMQVJtkY7XQBiUuFwITnSlH2urIQ+wyakB3+4
 0OPn+AfABaHBdfF0Tk+S6iBZp4tbvFASk6UQyOP19RVjIA46EIG5tEfM5AzYkCZhkSD3
 H/xWTV40GcZy3W3aPHR6C3TwS23JM9hG6ivxrC1iezDrAIpB0xPgVrcWLLu3LWmKDfLj
 s73y529BRR5/67NTd+AkH+vwFoAxk0P+puB4hFwpiEwYadIGsPSNkephSyh+gqwvW0uc
 WQ1e9ox8t7UUBWIKtlXco1T5jVZiFB1Xok5K57Qv4sdiTfLR8KMgGCxfbYQK68fTSDhi
 BdAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mzp60P4a
Subject: [Buildroot] [PATCH v2 2/3] package/gst1-plugins-bad: decouple va
 from drm and separately select them
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

Disabling BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VA was also disabling
DRM support, and that in term mostly crippled KMS support.  Both
should be enabled or disabled separately, with any dependancies
expressed elsewhere.

Signed-off-by: Adam Di Carlo <a.p.dicarlo@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index c6fb669e13..e488fa3c2d 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -746,14 +746,15 @@ endif
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VA),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dva=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libva
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dva=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Ddrm=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libdrm
-endif
 else
-GST1_PLUGINS_BAD_CONF_OPTS += \
-	-Ddrm=disabled \
-	-Dva=disabled
+GST1_PLUGINS_BAD_CONF_OPTS += -Ddrm=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
