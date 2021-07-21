Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E17BC12002
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 06:38:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F35A6113C
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 06:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F35A6113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD0BD82871;
	Wed, 21 Jul 2021 06:38:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R-xT7XmgdQev; Wed, 21 Jul 2021 06:38:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4494F8275A;
	Wed, 21 Jul 2021 06:38:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8265D1BF5A5
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 06:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7057340263
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 06:38:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwJexDzUok0b for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 06:38:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6AEE40243
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 06:38:23 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k4so895591wrc.8
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 23:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6yumSW7eFKqQFY/g/I9/GY0Y99fKmgP0V/YcFM27nNs=;
 b=rj0DUGDMKzsS4bnrfQj+QQl7Ys7OOERADh014Sg26GPj9JqRmdsYl5HVzY4TNhj8/G
 Zct6VYq0wYN+ZcFs0p/yxD1gPfkKJRiH6U7O284riyxHKgHbfouLaPU+AiQl9s7CUl3o
 iVO1E0zaHEhi7LQOMOeHIVfjSWqbTkq0xhE8YP8/VAIiNrkeTyh0aklFHeVjfrlHzYm2
 N4FNJcpOsqwjAododRv1qjZb5NVv0Pa99vEz1Aef9uAbkDpoZpZOEbFPDsfsYvdK6ia/
 KqyVGd/UEAUhtWmvcVNFC+RCizEXAtplEpRVpZKXkkCrjDPqURaFvyyX1RLd9zNCiqy2
 h3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6yumSW7eFKqQFY/g/I9/GY0Y99fKmgP0V/YcFM27nNs=;
 b=jUZubRjzRiXs98/YIwDs2zXET6MQbiTm88hYrivwj4LcwqpkDzg5H3eL0/c1Sm+ORu
 Ygokhyup4JO10sZ13A8WTSODmqilshBvIAgYNcDF9AHij1UCTWS8nG/S3JliEv3PeNTY
 UF3zrQx7xpJR5pe8izGikrvUkMd2ZlD6OzCGrsmpcxINhEdl9iUVQt+I8LkBWseXmiJD
 BtD5A1HmQRugsJO9pnxRHv9e1FdZpvDRtfu2vpwXowI5sfxk/yrxbXusNccImmW9aiO4
 PfZweyxhqmpXMsFtorovXkVBNaAwzyP2wnKqIp/Ekn1vIViku3JmXvvuS8mS2WKFXhmY
 M23Q==
X-Gm-Message-State: AOAM530MyOUAb5Z418EjrfjGCa3GT+VVvVYClMXusDGIrUapNRZZEpRd
 tRXuHwCkbAzyUouP19GD4OOBlPUpBv7M+w==
X-Google-Smtp-Source: ABdhPJz5d6SQeMjMqgTrRpzrMo3Cfqm+5MODZSfQPnD89JK6goxNhTsfzCuQj/QbBeT0Pm92RYX1CQ==
X-Received: by 2002:a5d:4e43:: with SMTP id r3mr40503368wrt.132.1626849501550; 
 Tue, 20 Jul 2021 23:38:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id l39sm480734wms.1.2021.07.20.23.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:38:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 08:38:13 +0200
Message-Id: <20210721063813.440330-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: add SELinux module
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for dnsmasq is added by the services/dnsmasq module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dnsmasq/dnsmasq.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 2006757590..972be10935 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -15,6 +15,7 @@ DNSMASQ_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 DNSMASQ_LICENSE = GPL-2.0 or GPL-3.0
 DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
 DNSMASQ_CPE_ID_VENDOR = thekelleys
+DNSMASQ_SELINUX_MODULES = dnsmasq
 
 DNSMASQ_I18N = $(if $(BR2_SYSTEM_ENABLE_NLS),-i18n)
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
