Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC64E6B25B
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 21:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF37B822BE;
	Mon, 22 Dec 2025 21:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVjQksFIsRgW; Mon, 22 Dec 2025 21:56:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F7548144D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766440611;
	bh=iXHC7vDN939FwlcrKWuDMsjKqojD41uAnllTdl/Yu+0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AL5J9+7ZyJ+zGWfZ4I5UTIJbuWurHBFs81F6eIdATHE507PiEmMXx/6uR5+t1MDk7
	 p4Cf92GnsWtGLBCv7jxnbbQNj5s3OYnsgDwggp6biRF0Z8TlWLhXRdXAYcR5PtHHvo
	 C0wysylnBDh/8OUyNZQmHsSwoos+asq4a8D7MwVHGjkZLZgYsXnyhjWFGfk3ZYco2W
	 387kurep6lL4/xALbvYjWerPDFgA7QOfHQsWQWZve5DQtuvDePyHWtQduVbKT014wg
	 4/28X/9KRQbyYwajdm/50dwASjw0vXPy4UAhevntBwjbI5RkUpcvKy3LibK2TGvP3k
	 I347ZrCm4F6Vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F7548144D;
	Mon, 22 Dec 2025 21:56:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C9638BC
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB4064049B
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lLPKSrn05zhv for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 21:56:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D82E64049A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D82E64049A
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D82E64049A
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:48 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso18687445e9.0
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 13:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766440607; x=1767045407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MCiasujti4BpcWwukK2LEPgHSbMxtPYJ3Hr2iIYEJAE=;
 b=HANk9wVhSdJQaq4p59C3Q7zexDD/w79oEKl52bleNGzM6b7c+KVdbsP1TKKllXHcZM
 ilJ/ejY1d6S4Pmf+8HqfEeJUwh5oDgV1rEctqbH/gOLC/te/HW6FryWiuwvVjQu+YS0g
 7fsRkYZh3/udXwRTuoM36oeG1nS0y1QoL+BMMCWeH6pOcaMOAQqYBrNgqMNJokdXnTJl
 JWyw3aaJ5N8KVA7tjbgHBzjAMNEL2r8tfp2U8SWTJELJrs+WWn2tsFRLsm6KTmfAR80x
 fqfkXCTF1tWrq1Hjz5A9Y0zu/eG40gOhgEAtJT8XLj+t3arwMAqSCqIjgcKQFBWfrpN2
 7wgg==
X-Gm-Message-State: AOJu0YzP3hsT91gzV1oMNp2/h3YxbCUNDRjKaQN6xBQyMkvLHwwHNeBE
 Ubb51DC7HN+Uh3yrFdHHiu57fMAwxZkb3QgafEKaGz7YNUfx2jm42ciNN3lv6A==
X-Gm-Gg: AY/fxX7zFslvFnGzFcyoGd32qgNHgvOaqGRBC0Db18E6tIeRSOgLZqJ1TH6YKEXgGNf
 v94wsKt4z4FK16S4g5MjxXzuGNIYXERSfQlGsjMbeehO440JYm7TH+PNErA0hmmo2WiJ+UBhVrN
 vW1dR6etCzOuuVugtdH+oFR4IJqpGnU4eoEPSGFexzWWsBVK81BNTLgRvS4qtzX9v2KVjP0oxpL
 WfsLltdgWh37aK3MJiWA8Z0g2IrVkxmAkXFUaD2Z8q+5tE1cMbK1qvSZS7Z22bHhFRXjCqwR4yg
 p5NXZUKhftSmyQ6oKx1A3W/CtburZfDiAtlyo8TsJZjEjQ18eKQmkMT6xAbN63VMsXLZ5HKdvjT
 yPXEop3kc6D0k2YXvi82j12PKijVLcIVz8n03Urjl+31ztm0i18EyodMN3gJAXG1iwuNL9nIV2o
 wj3Z0=
X-Google-Smtp-Source: AGHT+IGh5rj3lLQm2TRhnmeLbfpW6FERVr8jQS2zrwNeX5vhVN4Iu31+WmJ37G8bUTI39gpmi5gmTg==
X-Received: by 2002:a05:600c:1ca0:b0:477:af07:dd22 with SMTP id
 5b1f17b1804b1-47d195900b5mr130244185e9.28.1766440606766; 
 Mon, 22 Dec 2025 13:56:46 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:2fd5:723d:8ba0:877c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193522cdsm201207645e9.4.2025.12.22.13.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 13:56:46 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	vjardin@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon, 22 Dec 2025 22:56:30 +0100
Message-ID: <20251222215636.975668-2-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222215636.975668-1-maxime@leroys.fr>
References: <20251222215636.975668-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766440607; x=1767045407; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MCiasujti4BpcWwukK2LEPgHSbMxtPYJ3Hr2iIYEJAE=;
 b=muXUVdmAAB0dQ4kA0lkPWICGrANAdPxV/8fn6aCx80MTJJLtAlBlAP4TDcliSAMuHM
 0fOxOGB8umAEE5fzAE9ZuQ87YwSIM/M8YW8gxJpds9I0Axe8IxRLf0QqyxPyfZ/XsweB
 P7OYr4V6iyyG/oE0GoSUppLojGqjQmTFQ5POk6LnYWiAg5qEUCA+fCQa4EgYeuR3quZ2
 SdXovC7pXij57XRCG0S4E1WupWntuc7w62Lwy8luFp/43L7QhBdBe4c9yEWPFw/ISWpw
 T0Qh+TSqa04DuwVQQbv9ye7eUoshv+6BueNHSvrh13cxyBY2LC578oHlUWOD5mmKxh9g
 b2TQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=muXUVdmA
Subject: [Buildroot] [PATCH 1/7] package/dpdk: make drivers selectable
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

Add BR2_PACKAGE_DPDK_DRIVERS_LIST to control which DPDK applications are
built:
  - empty : use DPDK defaults
  - none  : disable all drivers (-Ddisable_drivers='*/*')
  - list  : pass to -Denable_drivers= (comma-separated)

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dpdk/Config.in | 21 +++++++++++++++++++++
 package/dpdk/dpdk.mk   |  9 +++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index 7d4a002002..9b6b367ee8 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -43,6 +43,27 @@ config BR2_PACKAGE_DPDK_EXAMPLES
 config BR2_PACKAGE_DPDK_TESTS
 	bool "Install tests"
 
+config BR2_PACKAGE_DPDK_DRIVERS_LIST
+	string "List of enabled drivers"
+	help
+	  Controls which DPDK drivers are built.
+
+	  Values:
+	   (empty): use DPDK defaults
+	   none   : build no drivers
+	   list   : e.g. "net/virtio,net/ixgbe"
+
+	  To list all drivers found in the DPDK source tree:
+	    find drivers -mindepth 2 -maxdepth 2 -type d \
+	    ! -printf '%P\n' | sort
+
+	  Note: providing manually a list of dpdk drivers to enable
+	  does not automatically enable its dependencies (internal or
+	  external). It is the user responsiblity to add internal dpdk
+	  dependencies in this list, and/or select the relevant
+	  Buildroot packages for external dependencies. DPDK
+	  configuration will fail in case of missing dependencies.
+
 endif
 
 comment "dpdk needs a glibc toolchain w/ threads, gcc >= 4.9, headers >= 4.19"
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 4843ba2667..829b0cc640 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -47,6 +47,15 @@ else
 DPDK_CONF_OPTS += -Dexamples=
 endif
 
+DPDK_DRIVERS := $(call qstrip,$(BR2_PACKAGE_DPDK_DRIVERS_LIST))
+ifneq ($(DPDK_DRIVERS),)
+  ifeq ($(DPDK_DRIVERS),none)
+    DPDK_CONF_OPTS += -Ddisable_drivers='*/*'
+  else
+    DPDK_CONF_OPTS += -Denable_drivers='$(DPDK_DRIVERS)'
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
