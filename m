Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73CFC4345F
	for <buildroot@archiver.kernel.org>; Tue, 16 Apr 2024 18:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71DE260AC6;
	Tue, 16 Apr 2024 18:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDEdbS1DNmKT; Tue, 16 Apr 2024 18:42:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F49960ACE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F49960ACE;
	Tue, 16 Apr 2024 18:42:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A0461BF969
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 18:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8465D81E4B
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 18:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qd-x68-7Llf3 for <buildroot@lists.busybox.net>;
 Tue, 16 Apr 2024 18:42:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.51;
 helo=mail-lf1-f51.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85D5981E43
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85D5981E43
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85D5981E43
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 18:42:24 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5176f217b7bso8362275e87.0
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 11:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713292942; x=1713897742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oViTf+z5Yjnth8cbnR2pxKTUKpRSeQs4RAjpi+CppN4=;
 b=jT04Fy1IwoT4hFnBRfTQdk+sFPF7En4rLCxBf95eGngQZ3bIEau1GixiJcfcfRuJ9x
 ZEAjTdJ19hhh9ccMTGWvkJdasWt44Qh3N+Un5Czbg+NwpXN7WaVlbGt+959BEAeHXny8
 /FVHOwl//fEvolqwlY1DIP8X5FhjQOojIGxYLU5JuOe59KX8w0TK6EcKFK7j4uo4OKp+
 T07aTi8MfxJPGYNOTRUiD1/H3OYoVKux5wTWE/DwQRbrUD4B8y8OK18QkS2qCqHReCZX
 fQCevnNTwZccSUSp+Wd5I7hQWRbIiNqHBn0zCms/fnT2Wp52ORfT9Yuyn/nSlXQkWNIP
 Tebg==
X-Gm-Message-State: AOJu0Yyq7zpuwff2WENyUrK1081LQvtJTgulA3BCzospaKx7fJIIDWau
 5oTNPGxGCQWBIfMMefrt0Y9wKJV1D0xj7sgmWQoQh5ST46dktm/7UxgkUL8/
X-Google-Smtp-Source: AGHT+IGFd4emi2FgfcqWdL4qvO2yYuH2srWFCTDAPyDTyIvfrFhjtfuXeuWZSkpfuYdRqgEdhq2pMA==
X-Received: by 2002:a19:e013:0:b0:516:d241:11f0 with SMTP id
 x19-20020a19e013000000b00516d24111f0mr10466587lfg.7.1713292941774; 
 Tue, 16 Apr 2024 11:42:21 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:ddfc:df5d:2cba:1046])
 by smtp.gmail.com with ESMTPSA id
 ht8-20020a170907608800b00a525669000csm4328455ejc.154.2024.04.16.11.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 11:42:21 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue, 16 Apr 2024 20:42:06 +0200
Message-Id: <20240416184209.2621561-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CACXRmJhRXXUUGFz=P9gOhVkqtAMePE4xgDg8rMNafuPMDWU3nQ@mail.gmail.com>
References: <CACXRmJhRXXUUGFz=P9gOhVkqtAMePE4xgDg8rMNafuPMDWU3nQ@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v3 1/4] package/ruby: add host psych (yaml)
 support
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, Bernd Kuhls <bernd@kuhls.net>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed to compile webkitgtk 2.44.0.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: n/a
v3: n/a
---
Question to the reviewer, should I use this:

```
ifeq ($(BR2_PACKAGE_HOST_LIBYAML),y)
HOST_RUBY_DEPENDENCIES += host-libyaml
endif
```
---
 package/ruby/ruby.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 4b9ce80e67..ac7de38de4 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -20,7 +20,7 @@ RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 RUBY_CPE_ID_VENDOR = ruby-lang
 
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
-HOST_RUBY_DEPENDENCIES = host-pkgconf host-openssl
+HOST_RUBY_DEPENDENCIES = host-pkgconf host-openssl host-libyaml
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_CONF_OPTS = \
 	--disable-install-doc \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
