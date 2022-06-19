Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141A2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1F044010E;
	Sun, 19 Jun 2022 16:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1F044010E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id durLm8-vcL4e; Sun, 19 Jun 2022 16:49:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CE24404C9;
	Sun, 19 Jun 2022 16:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CE24404C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D41D01BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEF9781C44
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEF9781C44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hylu_ldNXwsd for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:48:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1E4F81C38
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1E4F81C38
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:48:57 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 m125-20020a1ca383000000b0039c63fe5f64so4639222wme.0
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j3/VK2mncDyg8pPq3P6CYVARrRszog4pQemiYCe52jc=;
 b=vc2Sh6fQKGH76uSyfAbFVcOQqXvr6BnaIYdyVRnfcUSqFzAN2G1MJ+7OTBhjppKqkG
 qPMzVj/u/COkYvgxHKV7+jAWrbPuboPGD6QSnqIbZx0dJNi2LRPGf8L1Nsf3r/PXGLWc
 Lr6Cj9UbqSK/v8z0221Qa4kaMT6dSQ0R02Us1/VHCbKeZglrpsTskfX/KDDSDr579uRz
 ahKgD1PMqfv8d8EKGWLlvU6QKVOSeKeNZk4ToppusY40iyB2O8psfcVAGAEV7LhWGGTT
 VUUiGCmXv4fHZm1rpXCWHV/KYNYkeIgBv/c/K3Asq8ams7WqiiooAoHm9d8JVfH1spgj
 isGQ==
X-Gm-Message-State: AJIora+WSo6SYvizXpKZJ/uOq1A4vZyMaI9wQwcd+cXuVCpS+KFMoEc3
 qgPKskNOjDpzPhyrTK2/DtmWBRZqdeo=
X-Google-Smtp-Source: AGRyM1vk+DllkkhzALBmBTTt8OXC+44pSEknTfrmYO18K7T3t2CFYnwUxxoO5rUWc1l9eKRdJaNQ5Q==
X-Received: by 2002:a7b:c392:0:b0:39c:4d27:e698 with SMTP id
 s18-20020a7bc392000000b0039c4d27e698mr20382664wmj.57.1655657336039; 
 Sun, 19 Jun 2022 09:48:56 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f123-20020a1c3881000000b003973ea7e725sm19815285wma.0.2022.06.19.09.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 09:48:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:46:09 +0200
Message-Id: <20220619164610.649145-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619164610.649145-1-fontaine.fabrice@gmail.com>
References: <20220619164610.649145-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j3/VK2mncDyg8pPq3P6CYVARrRszog4pQemiYCe52jc=;
 b=e3ImwH1N4li1IGiTrkVG1VwTXWvsKP+ELwc8ilr49g3E+/AQiwbU/y8iDscNeBJijp
 lBi4whqwCaxLEXTLyxG+A/rT4P6fa5QioYa/ONwshlCfbkaPodhTkvJF6a/YCwfdvZuh
 d3culcqkJrt/cZNJfpxnqwW0fSc+c6GZyzfMketHkFsOr8oIpZhZJRdWrqGC91ywJTK2
 VRB8+6/AeAu88dDxmqwT39gsskAhWtE7AFjcVq+ZJNDIJFFA1BcE3hHPbY3/cmvf9ZIm
 PvsB/KG+cRq2ra91t8o4KkW6OfmvBfw8qsf5CwD/WPX3FzPiGVsUYdZ1Pg+NF39KseWq
 twtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=e3ImwH1N
Subject: [Buildroot] [PATCH 3/4] package/rsyslog: add qpid-proton optional
 dependency
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsyslog/rsyslog.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 1aa2256062..1fa03bf135 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -111,6 +111,13 @@ else
 RSYSLOG_CONF_OPTS += --disable-pgsql
 endif
 
+ifeq ($(BR2_PACKAGE_QPID_PROTON),y)
+RSYSLOG_DEPENDENCIES += qpid-proton
+RSYSLOG_CONF_OPTS += --enable-omamqp1
+else
+RSYSLOG_CONF_OPTS += --disable-omamqp1
+endif
+
 ifeq ($(BR2_PACKAGE_RABBITMQ_C),y)
 RSYSLOG_DEPENDENCIES += rabbitmq-c
 RSYSLOG_CONF_OPTS += --enable-omrabbitmq
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
