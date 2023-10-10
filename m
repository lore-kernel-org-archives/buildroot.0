Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4E3CD8CAD
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 17:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C71CB61472;
	Tue, 10 Oct 2023 17:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C71CB61472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eGdorn_MGn1M; Tue, 10 Oct 2023 17:03:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A51CB61477;
	Tue, 10 Oct 2023 17:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A51CB61477
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3D911BF94D
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB10E40900
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB10E40900
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iyu9c_Z3Ov0q for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 17:01:57 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 738BA408BF
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 17:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 738BA408BF
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9adca291f99so999170566b.2
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696957315; x=1697562115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZoHX71eTftS2QrRDKoQwDvLjVkxrNpekpv5Ky39ljd4=;
 b=Rb9K7/lExdXkKBYuYm40E+fN/Wp50AB60SyrNDGY08fwdImqL3srUlHPt8NEKPywDu
 2oW9FEGZeSdMzcQK+WlSrN5HGEYt9LcCtmX1QMUJQjkkM04LATK70QQtpc6lf6covXCL
 stuYZ1mfqDm2uicJ2kBw8KkjoMZmZIajOiDgYSa3s+A7NNq/fGvIZiKIXanQlBTsslpo
 7x3xgmv9xMjqW4F/2a1FZ1kaWKngUrSR+y6vMZ7nRMPbucnjA5ZjsWkmHE1URd1mhVPK
 bTY6FO366vQnCheNuc2z9o8hjJTH/J0ijvR2DZjgOQpMi3KECw0j6FsEY/v6NGbvTU7i
 jZ/Q==
X-Gm-Message-State: AOJu0Yw49g+ddAVjkJrGVguZXn092xk2nDJceUpo8TgwEsoNOFi//eVE
 FOSHLc2Z/PWhUJ7jYTw5HhpYKtzd0/s7tqtImTZlhw==
X-Google-Smtp-Source: AGHT+IG+B6pgFOgteCIqZM6ajnzTNUgxetrjCTNSXY7UEVQce38FQFUpewpwgcJwqLFOkwoWXUbvdQ==
X-Received: by 2002:a17:906:738b:b0:9ae:3f7a:f777 with SMTP id
 f11-20020a170906738b00b009ae3f7af777mr18425538ejl.9.1696957312597; 
 Tue, 10 Oct 2023 10:01:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 ca9-20020a170906a3c900b009ae587ce128sm8651107ejb.216.2023.10.10.10.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 10:01:52 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 19:01:32 +0200
Message-ID: <20231010170133.2981698-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
References: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696957315; x=1697562115;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZoHX71eTftS2QrRDKoQwDvLjVkxrNpekpv5Ky39ljd4=;
 b=RHMvgvnFOq76jL7huS7WEhI/a3Ifz00PlR7PA7/QAJ7YNKG9apkm49/NfGRt58kWH+
 hRp7Knrni3haOJrdLxPdCEuEVgCregWeMVeoYW9hYYXxMdG2lesD4LnfJ0Ekm/8ClelY
 TD0+CS+Tw1VluQKG5o/GERv9OVJesZ59K8UZQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=RHMvgvnF
Subject: [Buildroot] [PATCH 8/9] package/zabbix: enable selinux module
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/zabbix/zabbix.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index 0d6c579f4c..3b126caa49 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -7,6 +7,7 @@
 ZABBIX_VERSION_MAJOR = 6.2
 ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).7
 ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
+ZABBIX_SELINUX_MODULES = zabbix
 ZABBIX_LICENSE = GPL-2.0+
 ZABBIX_LICENSE_FILES = README COPYING
 ZABBIX_CPE_ID_VENDOR = zabbix
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
