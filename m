Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929A6C4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 09:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 358C841A49;
	Wed,  6 Dec 2023 09:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 358C841A49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Tutr0Ehnm7q; Wed,  6 Dec 2023 09:40:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09EE041A6C;
	Wed,  6 Dec 2023 09:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09EE041A6C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8ED3B1BF83E
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 09:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B76781EDE
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 09:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B76781EDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YqpvYnX0LHKH for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 09:39:54 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86D6881EB3
 for <buildroot@busybox.net>; Wed,  6 Dec 2023 09:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86D6881EB3
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a186e5d1056so73133066b.0
 for <buildroot@busybox.net>; Wed, 06 Dec 2023 01:39:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701855592; x=1702460392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RmhBsRK40dYOGKR8nfWSqGShQvkTnyJFDbu0rDYZptY=;
 b=H8HtEdzQLCzorB47i8Tg24rTsjGlTyt/1BQvVFlOn/J9NICtL5lSEn/ZIwH1ZO7hsJ
 nNH3h4Gobvh2H2lsK4tXvQBHdYJmc6cWENPACZuidHmUZYpIxtfq0PmlMpHhYLmwl3py
 uev3DBx4D1v5I0OkhiCN5r53ymjQCub3NRK45wHk/F/5EpaTb8MTBs3LznMb1bbHMxp+
 vWX1YIjCASOWT8jpKA3jLlvBGyMisKhz6+TeXHmJvqNq/040CUqmTAB8Y1riwFOwZ7l7
 Yo00J2PsiZ2xVHRB7eJolhOyv+06UNXuiRNvz1R6lGuCtmlaR+l7Iy2FZicyCwcUlMpA
 aqpA==
X-Gm-Message-State: AOJu0YwcMiRFOAc71KPGCxfd0kAtJl21aZMead5pk3OOQAe5vNINVj9U
 yn/Nhl9VSg8LOms7BgSqnRPV+Cexxzo=
X-Google-Smtp-Source: AGHT+IEGmD4OG5tWkrEs/A45gPcmyA8cdKi81ZKVy4kyDBRMWePEu2XplYTgb01jaby+cUXxSElumQ==
X-Received: by 2002:a17:906:dc:b0:a17:d9c8:d9d3 with SMTP id
 28-20020a17090600dc00b00a17d9c8d9d3mr439854eji.12.1701855592411; 
 Wed, 06 Dec 2023 01:39:52 -0800 (PST)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 di16-20020a170906731000b00a1b6d503e7esm4265553ejc.157.2023.12.06.01.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 01:39:52 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  6 Dec 2023 10:39:41 +0100
Message-Id: <20231206093942.1548412-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231206093942.1548412-1-francois.perrad@gadz.org>
References: <20231206093942.1548412-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701855592; x=1702460392; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RmhBsRK40dYOGKR8nfWSqGShQvkTnyJFDbu0rDYZptY=;
 b=QRuzZBKABSTPdB5Ly34G0FhJF2bpFUAW+lSZ69UUdU1phzkWrXD+htXelETYttFKXI
 bpyJHYschQ0ubkBY3hgbYE6LPqZ2iC00s9ZqBfEAY1YDFM8bwW8zkGh/xsGhGZwtwZwG
 IpJGbxvHSzGx7GAuZcXdJy+4raJub0oy9kw3r4QWsjP6ImywsfqPtGJ+1w8Xp5H/Y/cV
 +unJS5FjgtTp425fUFWR4S0QMaUnRLyr6KZMu9LK17DmWwAAFL2oTqVMCZMD5jq5YtHN
 glEewi4iI4+W3dy4uzS7N7fthUYFY2khL3Wn9ha5dinDXycqP8ATvH2O/DmdWkwN6kPn
 1WnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QRuzZBKA
Subject: [Buildroot] [PATCH 2/3] package/lua-conciseserialization: new
 package
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                              |  1 +
 package/lua-conciseserialization/Config.in     |  6 ++++++
 .../lua-conciseserialization.hash              |  4 ++++
 .../lua-conciseserialization.mk                | 18 ++++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/lua-conciseserialization/Config.in
 create mode 100644 package/lua-conciseserialization/lua-conciseserialization.hash
 create mode 100644 package/lua-conciseserialization/lua-conciseserialization.mk

diff --git a/package/Config.in b/package/Config.in
index e8c210e22b..2400cf0796 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -726,6 +726,7 @@ menu "Lua libraries/modules"
 	source "package/lua-coatpersistent/Config.in"
 	source "package/lua-codegen/Config.in"
 	source "package/lua-compat53/Config.in"
+	source "package/lua-conciseserialization/Config.in"
 	source "package/lua-cqueues/Config.in"
 	source "package/lua-csnappy/Config.in"
 	source "package/lua-curl/Config.in"
diff --git a/package/lua-conciseserialization/Config.in b/package/lua-conciseserialization/Config.in
new file mode 100644
index 0000000000..b660147008
--- /dev/null
+++ b/package/lua-conciseserialization/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_CONCISESERIALIZATION
+	bool "lua-conciseserialization"
+	help
+	  a pure Lua implementation of CBOR / RFC8949.
+
+	  https://fperrad.frama.io/lua-ConciseSerialization/
diff --git a/package/lua-conciseserialization/lua-conciseserialization.hash b/package/lua-conciseserialization/lua-conciseserialization.hash
new file mode 100644
index 0000000000..30ae4536f6
--- /dev/null
+++ b/package/lua-conciseserialization/lua-conciseserialization.hash
@@ -0,0 +1,4 @@
+# computed by luarocks/buildroot
+sha256  1dd7a5bd17349ad78e93b36f05739e4323a8fda8cd66dee423bdd5a21a0c4453  lua-conciseserialization-0.2.4-1.src.rock
+sha256  7988a3ab9ea3d8c536387c4e7931b1703fa02f7011771569ed56641fa1a0c78c  lua-conciseserialization-lua53-0.2.4-1.src.rock
+sha256  23ddf0d4a4dbc0667eeb919ceb7cc0a5b527af6cb51b286b78fa42f350de2130  lua-ConciseSerialization-0.2.4/COPYRIGHT
diff --git a/package/lua-conciseserialization/lua-conciseserialization.mk b/package/lua-conciseserialization/lua-conciseserialization.mk
new file mode 100644
index 0000000000..a777a4baea
--- /dev/null
+++ b/package/lua-conciseserialization/lua-conciseserialization.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# lua-conciseserialization
+#
+################################################################################
+
+LUA_CONCISESERIALIZATION_VERSION_UPSTREAM = 0.2.4
+LUA_CONCISESERIALIZATION_VERSION = $(LUA_CONCISESERIALIZATION_VERSION_UPSTREAM)-1
+ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
+LUA_CONCISESERIALIZATION_NAME_UPSTREAM = lua-ConciseSerialization-lua53
+else
+LUA_CONCISESERIALIZATION_NAME_UPSTREAM = lua-ConciseSerialization
+endif
+LUA_CONCISESERIALIZATION_SUBDIR = lua-ConciseSerialization-$(LUA_CONCISESERIALIZATION_VERSION_UPSTREAM)
+LUA_CONCISESERIALIZATION_LICENSE = MIT
+LUA_CONCISESERIALIZATION_LICENSE_FILES = $(LUA_CONCISESERIALIZATION_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
