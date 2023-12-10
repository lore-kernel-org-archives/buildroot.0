Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA015C4167B
	for <buildroot@archiver.kernel.org>; Sun, 10 Dec 2023 15:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4072560A89;
	Sun, 10 Dec 2023 15:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4072560A89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z78xZbX2IN7z; Sun, 10 Dec 2023 15:25:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89B0F608A6;
	Sun, 10 Dec 2023 15:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89B0F608A6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D0421BF86B
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 15:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D44180E45
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 15:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D44180E45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JLCa8-3T2M8d for <buildroot@lists.busybox.net>;
 Sun, 10 Dec 2023 15:25:22 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D57E480C38
 for <buildroot@busybox.net>; Sun, 10 Dec 2023 15:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D57E480C38
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-54d048550dfso5181149a12.0
 for <buildroot@busybox.net>; Sun, 10 Dec 2023 07:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702221920; x=1702826720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fVVZrOmxwle5TVKus8+EP4JLAGvsJa3NztKJRoz0Wqc=;
 b=BZ7I7KRzokA4eIbDb+SvCt0VAyImCA1BpL9CVN8LKCH1bwDeMZBAUPx02FaZCEHyqD
 v0zID8ubPVmKHAWQJqX1NEihbpLmvm4PFfi5leqXJ9FnsrGEdxP0PAtgioZ9BFFIYGvP
 mqVYN+ofEMRhdTwSvTElEgqJ/fcCqBbp/XXBEjQ0Vj7tyNqsLjAMXDFUTezG8+VhJ6sT
 BkVuoZy6r/bzY4BsoXKxNgHNFIi6CKNg6w3CqVXZ1Sz+mzA0eceIygQchZWD+pZmJOBC
 ezCKOXiac6m9bqFgSuzTNul6doJQYE0FeTNHAhNA7gL3wf2EYYxET+tH9t7NFUrGrp61
 nBXw==
X-Gm-Message-State: AOJu0Ywlf40LXUNQb6uTBv7pZpHgNvljMUKqyH7LzTLY+4J2OLKpHEfi
 n951LU8FqGhZ7GYUNGZXYbSmIFbFj1Y=
X-Google-Smtp-Source: AGHT+IGFS3DTqdDo/cddNNQx1SqiLHSJIz7lwu9JmOcg2SnyDvL96WDQMM+76XQIn1eD+eT9/PP+Mw==
X-Received: by 2002:a05:6402:2152:b0:54c:4837:7d0a with SMTP id
 bq18-20020a056402215200b0054c48377d0amr1183171edb.73.1702221919679; 
 Sun, 10 Dec 2023 07:25:19 -0800 (PST)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 m29-20020a50999d000000b0054cc903baadsm2796546edb.30.2023.12.10.07.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Dec 2023 07:25:19 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 10 Dec 2023 16:25:13 +0100
Message-Id: <20231210152513.1642373-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231210152513.1642373-1-francois.perrad@gadz.org>
References: <20231210152513.1642373-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702221920; x=1702826720; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVVZrOmxwle5TVKus8+EP4JLAGvsJa3NztKJRoz0Wqc=;
 b=ICVJsSCfWTChETJqpCYHeBhUaJOlDAnLaXzLVCNhMPdbX/sUcvnIQ9aylRri71DWSj
 4kpqyS0DNx0JsH6YVaC1NsOYlaHjhSdn0WPXhFJ/XWVgx0nw618wE7hMUrCSr/TdHA8O
 tu13aqQSJZDHZWqRdkpFRbHntS0tMVSvDstpI1sTs6LQXj3CYG75Zt5sZfEpSBrxWG5n
 3o9Jtz/G9vRF4aHYys18mqUSQX1z6zf//mnNPk/JcXn6ThbItuqqAv4pArDnDRNKquSB
 Gp8+1rePuY9SMpnMYOWJMehYRebtZSW/8vzMXQhZUbVO/ZgjWle5QyziC3+0WFbdrAjj
 1Ejg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ICVJsSCf
Subject: [Buildroot] [PATCH 2/2] package/lua-compat53: install compat-5.3.h
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

this file could be required by some native modules

note: compat-5.3.c is included by compat-5.3.h
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-compat53/lua-compat53.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/lua-compat53/lua-compat53.mk b/package/lua-compat53/lua-compat53.mk
index 0cfbe2d795..07bc4aab10 100644
--- a/package/lua-compat53/lua-compat53.mk
+++ b/package/lua-compat53/lua-compat53.mk
@@ -10,5 +10,11 @@ LUA_COMPAT53_NAME_UPSTREAM = compat53
 LUA_COMPAT53_SUBDIR = lua-compat-5.3-$(LUA_COMPAT53_VERSION_UPSTREAM)
 LUA_COMPAT53_LICENSE = MIT
 LUA_COMPAT53_LICENSE_FILES = $(LUA_COMPAT53_SUBDIR)/LICENSE
+LUA_COMPAT53_INSTALL_STAGING = YES
+
+define LUA_COMPAT53_INSTALL_STAGING_CMDS
+	cp $(@D)/$(LUA_COMPAT53_SUBDIR)/c-api/compat-5.3.c $(STAGING_DIR)/usr/include
+	cp $(@D)/$(LUA_COMPAT53_SUBDIR)/c-api/compat-5.3.h $(STAGING_DIR)/usr/include
+endef
 
 $(eval $(luarocks-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
