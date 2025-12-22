Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2580E6ADF9
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 21:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFCF160B7B;
	Mon, 22 Dec 2025 21:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YaYGtaoPVl4f; Mon, 22 Dec 2025 21:56:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6479B60B61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766440613;
	bh=w8FoQlNniJVYqHd62x3evrbxh10RzW5WLzUPqgyCViY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fhr8PaELHiDDboRKRrPC9LLF1ZWk09KEmoUMXtYlyXeRZwrgA0z7adZvWXfU7WxRS
	 zlou0WEWtLhqS5zsAG++sj/q8HbMYmYLiteUqd+9Z5em/tCUT+Jwzf1f857F4W/3GI
	 CXStindXooH0Ug2uSIA6HWtEdw5qRmv/yikX2H68h6eCJkVUWHfAtbQs0bDKKp8jjY
	 M5yLBcDStR302iDSnf52zWgaXQ5MOOycwqNl5BgfyzSIh8rx0TaokWzs340hls6twC
	 YB28ertAaOxb/KJ5kI+A1KGxtjPPu0JrwQXba6LlfOkFCFxTwgqD+K28DBtBpDbxs0
	 nhsEvnnvrmANA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6479B60B61;
	Mon, 22 Dec 2025 21:56:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF48225A
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D16084049B
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3vzGPE-5WFfJ for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 21:56:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E00994049A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E00994049A
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E00994049A
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:50 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so23368215e9.2
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 13:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766440609; x=1767045409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A8bFMJMdSABRSlRFPrsIr/WjkLf9nFIo3HqVPRdsZFk=;
 b=MsSDSbG6AKGOy92cLkYPuZWDRvm6qgBlFJcW4meXCrvUcC4xJfE0juFGEZWr/FTl8K
 1fqQrLh2IHGqfSlhGnZs9iCVEfq7slyELAo5pAj6D+sX2oqXqMtxm6ZJMqLzSZ2+DQwz
 H6BZ3s9opyacpigbatKxCPiSJaKR0fA9GMDo7r2xdWbmayyo/YOJ7HRUXQLPAa8CqVwB
 b6o5ZvjrtDCPq9tzEAFRYnfVlnT6MIl5/43xqYuNWkDNG+u2YvUDwH7QY3ATzKKOWzrw
 S46YusHp3NPNSbgA//LmEBsrVEwznBzTjI6DicnaoSAWNwgldLamDpRxMQizLfRc3ZX7
 17Lg==
X-Gm-Message-State: AOJu0YxReS4GvFvQoWztqHyGLLYgIx6MhBcTCg/wy0dOEks5EejVdEMG
 uTDxI26OjaGpR9lZlciy+Wf44uotxOh6nhkG2xPB4ipok2rG2MWpLDeeQDLcCQ==
X-Gm-Gg: AY/fxX71TDthK2YIrCmgZNLDi7+RTnbw5sfw6kowUUaWNSTUth3aoQjtqaDyUceJBy3
 UaHiZSZB41p5a3tA1KaNX8jMVFQq3iBSsfxbg5kAqj9lZdawDe1a69jEzw2O0MkbqxNEhtZMnnC
 I/bAnExxBfzGDHJMnxAHkOoMdW/7lMkzScNzedzoV5nJtfveBwMf7J8N7IU8AMqtQwLmGRtr5XE
 uHk/zFIL2iLOz73OZEinUKQUZtJm5uWBO8jVHuini0xIDXNsFDtGNLSM8rnHWiqWIj9QlPi3XZf
 BT+zvnGyD5IHS4pTRZZy+bQpVgDN1qF/szveRPQgKKyfHgBKBE5IveC/IG113qboWLxArEY7rAK
 XQeDb8uvPLfjEDvGE7GpJ/OClmGttUhPv30k/sl33jMRu82niRHK5U8WYdDkabuvRSrfwgV5ygd
 4GMjE=
X-Google-Smtp-Source: AGHT+IH/f3hyIIvstVc1fHBpZrjiZ8ijAlillOiAoOhIfBsf3XpDA2OaUB6+jwxd9fRkXUBtxwQsyw==
X-Received: by 2002:a05:600c:859c:b0:47d:25ac:3a94 with SMTP id
 5b1f17b1804b1-47d25ac3acfmr69497435e9.17.1766440608854; 
 Mon, 22 Dec 2025 13:56:48 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:2fd5:723d:8ba0:877c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193522cdsm201207645e9.4.2025.12.22.13.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 13:56:48 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	vjardin@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon, 22 Dec 2025 22:56:31 +0100
Message-ID: <20251222215636.975668-3-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222215636.975668-1-maxime@leroys.fr>
References: <20251222215636.975668-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766440609; x=1767045409; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A8bFMJMdSABRSlRFPrsIr/WjkLf9nFIo3HqVPRdsZFk=;
 b=d1lfVJKM5toIMBRheP9QzHcA6PodZLeYWXSRv7FXu/IIj6EUiL8DahBlwQyQJ97JkD
 u15WWZqSbOWKvwURDfRM1/ElZTspWO1QKym6sD5sUUr9/SMKc1zpOuthCZTLXpanxrm2
 it9DMnkVDxoS+JoDBzSoUQqFXXd1BoKijcJHi4v39209kmH1AXpJsqJyoFOCzlNLZtOT
 CMJ4LXyYzRm1Psook5jKCBHNm7Eg7Q6Mu3Qfk+D8Y09FAHtz/yJC6yq6WCQwLHLxji8X
 PY238eOYQ9tnAFw1SEAF5R27LktxAregcSWCmS00ThNc/4XbNmIt99KEwegxMwunRh7k
 UW8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d1lfVJKM
Subject: [Buildroot] [PATCH 2/7] package/dpdk: make libraries selectable
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

Add BR2_PACKAGE_DPDK_LIBS_LIST to control which DPDK libraries are
built:
  - empty : use DPDK defaults
  - none  : disable all libs (-Ddisable_libs='*')
  - list  : pass to -Denable_libs= (comma-separated)

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dpdk/Config.in | 21 +++++++++++++++++++++
 package/dpdk/dpdk.mk   |  9 +++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index 9b6b367ee8..200d151a7f 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -64,6 +64,27 @@ config BR2_PACKAGE_DPDK_DRIVERS_LIST
 	  Buildroot packages for external dependencies. DPDK
 	  configuration will fail in case of missing dependencies.
 
+config BR2_PACKAGE_DPDK_LIBS_LIST
+	string "List of enabled libraries"
+	help
+	  Controls which DPDK libraries are built.
+
+	  Values:
+	    (empty): use DPDK defaults
+	    none   : build no libraries
+	    list   : e.g. "hash,fib,rib"
+
+	  To list all libraries found in the DPDK source tree:
+	    find lib -mindepth 2 -maxdepth 2 -type f -name meson.build \
+	      -printf '%h\n' | xargs -n1 basename | sort -u
+
+	  Note: providing manually a list of dpdk libraries to enable
+	  does not automatically enable its dependencies (internal or
+	  external). It is the user responsiblity to add internal dpdk
+	  dependencies in this list, and/or select the relevant
+	  Buildroot packages for external dependencies. DPDK
+	  configuration will fail in case of missing dependencies.
+
 endif
 
 comment "dpdk needs a glibc toolchain w/ threads, gcc >= 4.9, headers >= 4.19"
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 829b0cc640..d0c7caaa48 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -56,6 +56,15 @@ ifneq ($(DPDK_DRIVERS),)
   endif
 endif
 
+DPDK_LIBS := $(call qstrip,$(BR2_PACKAGE_DPDK_LIBS_LIST))
+ifneq ($(DPDK_LIBS),)
+  ifeq ($(DPDK_LIBS),none)
+    DPDK_CONF_OPTS += -Ddisable_libs='*'
+  else
+    DPDK_CONF_OPTS += -Denable_libs='$(DPDK_LIBS)'
+  endif
+endif
+
 ifeq ($(BR2_PACKAGE_DPDK_TESTS),y)
 DPDK_CONF_OPTS += -Dtests=true
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
