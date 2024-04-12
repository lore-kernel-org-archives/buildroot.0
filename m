Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC52C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 21:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A33D41C7E;
	Fri, 12 Apr 2024 21:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id arKP1w1HqKw3; Fri, 12 Apr 2024 21:43:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8302641C51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8302641C51;
	Fri, 12 Apr 2024 21:43:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 555A71BF37B
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 416D9826F5
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1k-Gd1qInSC for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 21:43:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=ben.hutchings@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 75BD682702
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75BD682702
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75BD682702
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 21:43:35 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41802f985baso6365075e9.3
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 14:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712958213; x=1713563013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qGotaBoaJPYmiiKPnvP14DgQ2PKiQDTYqhixJniCAbY=;
 b=dmBTPd1QC4uUlFiDwAzeGQdBQptHo/RwJkqY2P4RTkblC9B2bIDoIdP41m2z36GFg7
 zuFwkqKL9zMovbi36gnGP84uIWv8j9GChbqSVx7WAcYoRLSEckHhtHolrNv1z6HE1nUC
 rQEmPoA6m/ynT9g1VXE2xn+70QodsZZIj3EXJ2UmnzN4c/AAjmEHjEX7jRSDBeg/ectX
 jtGxg4u5o6Y8NSXuPAk8ZOpfdOwPgEuhRTIvUBObmxRXATCugz5Ke96joNRlXyKwsOvy
 IPguAMWUBunUxHxdoPFQHk5899EQnoV9uykpW7pzcKeamCFlicnLYXc2OsYQzHMEA5Ej
 hQig==
X-Gm-Message-State: AOJu0YyNc4MZ5rOd0u3P00cC6lkZ/lUDUes4tLz+sPvPkgj4SRFAhmPT
 apwZuTVe5p1JyoWW1fygcpMF87rD//zLYdVjEqns3s4pMlVBqM4h0raLQijEWo1dJL8Wu22TsXs
 G0Ys=
X-Google-Smtp-Source: AGHT+IEXJv5w52yNMoYjEMb2YaD3VQBfJW7PUBikUgshbhO5mVGHzK3I3P8jncNHfi7U1iUv0yg2yw==
X-Received: by 2002:a05:600c:1994:b0:418:1f7a:e951 with SMTP id
 t20-20020a05600c199400b004181f7ae951mr160847wmq.15.1712958213356; 
 Fri, 12 Apr 2024 14:43:33 -0700 (PDT)
Received: from cephalopod.i.decadent.org.uk
 (213.219.156.63.adsl.dyn.edpnet.net. [213.219.156.63])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a05600c1d1700b004163ee3922csm10034597wms.38.2024.04.12.14.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 14:43:32 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 23:43:07 +0200
Message-Id: <cbb92cca08b1e2cee69a63569b3c37cbe884a19c.1712957992.git.ben.hutchings@mind.be>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712957992.git.ben.hutchings@mind.be>
References: <cover.1712957992.git.ben.hutchings@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712958213; x=1713563013; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qGotaBoaJPYmiiKPnvP14DgQ2PKiQDTYqhixJniCAbY=;
 b=N5LeReBCJon7cezv1xusnUd5vQBRO2TPH4Qi9i3GddrrwpERsyV+1CCNAJkqeax6d7
 UsGu249sOZfOYVNk4ijbVUXudsZcoY18/QRlgX3ZBuJFpqPr5eXVhTu6kzqrHfcTsg9G
 Qw8/rOCFfGG9/IpJ5MabOqihFdZ5j5Yyf4Acr5joAlv8GpwrS0Qjbh96Lx53YnJpnda/
 7w6IMA8tDgoDavhbVmKf1UUD9Rot38uA6HCRHG8wnqkWkxVnJLZ/91diMopGZZzvBHNY
 a7DFHcoQsefr1sSvI87uH0JzLpfTZNbW/Ge/q+B0/fUD3VtLG+LgqVQK5lvOoD4iT+W9
 VY+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=N5LeReBC
Subject: [Buildroot] [PATCH 3/6] package/libassuan: Add host package
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
From: Ben Hutchings via buildroot <buildroot@buildroot.org>
Reply-To: Ben Hutchings <ben.hutchings@mind.be>
Cc: Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed to support a host build of gnupg2.  It is not directly
selectable.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 package/libassuan/libassuan.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index fb95a6fd67..d4800d698f 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -14,9 +14,14 @@ LIBASSUAN_DEPENDENCIES = libgpg-error
 LIBASSUAN_CONF_OPTS = \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 LIBASSUAN_CONFIG_SCRIPTS = libassuan-config
+HOST_LIBASSUAN_DEPENDENCIES = host-libgpg-error
+HOST_LIBASSUAN_CONF_OPTS = \
+	--with-gpg-error-prefix=$(HOST_DIR)
 
 # Force the path to "gpgrt-config" (from the libgpg-error package) to
 # avoid using the one on host, if present.
 LIBASSUAN_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
+HOST_LIBASSUAN_CONF_ENV += GPGRT_CONFIG=$(HOST_DIR)/bin/gpgrt-config
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
