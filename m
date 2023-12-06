Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03F1C4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 09:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47CCB400EA;
	Wed,  6 Dec 2023 09:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47CCB400EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AqSI_17Ue1S7; Wed,  6 Dec 2023 09:41:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 740854353A;
	Wed,  6 Dec 2023 09:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 740854353A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33EEF1BF83E
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 09:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C18A81EB3
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 09:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C18A81EB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G_2o480T4EeX for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 09:40:06 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06CEB81CAD
 for <buildroot@busybox.net>; Wed,  6 Dec 2023 09:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06CEB81CAD
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a1cdeab6b53so113798366b.1
 for <buildroot@busybox.net>; Wed, 06 Dec 2023 01:40:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701855604; x=1702460404;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=33a92H4jpbZaFtSHQuFEX6HtU2UyCUxXUjiw12PrgWQ=;
 b=HG++bDjKXNhkeL/KDFj+EvxJ3oiOtwoNxNWf820YsT2k6I/hYca6AxMG+ZlP9vA4+j
 gQ+YkIYDscxQTOiFOxnksZhueUM5dxo9SVFIyXGvTR4y1XtLyMZND4ASvnPNmJtCpBJ0
 Ij9m5pSmli1MLG3jcbEjO+dq3g7/WISOPe0CCcDp/WXn0U2gp6zI9/LWgjDjwOLEBDOv
 R/FzZUn8kisRpw/NGfif0MUWTSZTNF51B9xAzlz472UjKhr8Oezm9HT4awQOQh0ZjGld
 SZO3tNCgfYQzPbEjUmKqkHmzn5i5qax9rwNwBQiwKTZPW5fXtT8n5od6owDsbfeV/lnB
 w35A==
X-Gm-Message-State: AOJu0YyT2qYHcLQzNHyEoQ2i6BB8AezkHxvb5MKw+f/oDwbZiOzSbKaV
 RobHXaPNNqlzgSyU+tQKdsTJ/JIT22o=
X-Google-Smtp-Source: AGHT+IFhU0SECqwhY8A0UUxKzi6i+TH/eUhrUBLBrGaj2/WrCieW1w13WgkHyL8TfVhl+0ap2DJt7g==
X-Received: by 2002:a17:907:7290:b0:a19:f7d:853 with SMTP id
 dt16-20020a170907729000b00a190f7d0853mr3201799ejc.20.1701855603995; 
 Wed, 06 Dec 2023 01:40:03 -0800 (PST)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 m13-20020a1709062acd00b00a1db7b3b536sm530889eje.12.2023.12.06.01.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 01:40:03 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  6 Dec 2023 10:39:59 +0100
Message-Id: <20231206093959.1548435-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701855604; x=1702460404; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=33a92H4jpbZaFtSHQuFEX6HtU2UyCUxXUjiw12PrgWQ=;
 b=FCDfUEVVCFT1SLd7FKVau/Wy+Hq4z+41wwgWryj010vOo7rY89IJR5EFb9w0C+N5dp
 4s4obmGmkXreu0CJAfAp7E663mQvWXFZWoA+M3RdYgheV9R6IzoJ071SeaNmcJ1LuNLK
 b1d7Yb87Q03nJwoISjuEzhPdfafYumpEzdInsQxjXmrKnufIvmBJxBqAak3R/gdoIWdC
 ph+xMEn/+XlNgxD+2E7SIWpGVNnNq+GEtCr639BmQpgps8BhSi9rjb394KMs3wpz1OqH
 gnIvgfGv38Dx1PPP/Q/LU0mdZP7MVkb/9sxFA+51ABZPS9cJQRR4tHhdvCZ8pjpRxja5
 TiMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FCDfUEVV
Subject: [Buildroot] [PATCH] package/lua-lsdbus: new package
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
 package/Config.in                  |  1 +
 package/lua-lsdbus/Config.in       | 12 ++++++++++++
 package/lua-lsdbus/lua-lsdbus.hash |  3 +++
 package/lua-lsdbus/lua-lsdbus.mk   | 13 +++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/lua-lsdbus/Config.in
 create mode 100644 package/lua-lsdbus/lua-lsdbus.hash
 create mode 100644 package/lua-lsdbus/lua-lsdbus.mk

diff --git a/package/Config.in b/package/Config.in
index c18a17af91..b5d1b79a05 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -744,6 +744,7 @@ menu "Lua libraries/modules"
 	source "package/lua-livr/Config.in"
 	source "package/lua-livr-extra/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
+	source "package/lua-lsdbus/Config.in"
 	source "package/lua-lunitx/Config.in"
 	source "package/lua-lunix/Config.in"
 	source "package/lua-lyaml/Config.in"
diff --git a/package/lua-lsdbus/Config.in b/package/lua-lsdbus/Config.in
new file mode 100644
index 0000000000..e2a3fc6993
--- /dev/null
+++ b/package/lua-lsdbus/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LUA_LSDBUS
+	bool "lua-lsdbus"
+	depends on BR2_PACKAGE_SYSTEMD
+	select BR2_PACKAGE_MXML
+	select BR2_PACKAGE_LUA_COMPAT53 if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # runtime
+	help
+	  Lua D-Bus bindings based on sd-bus and sd-event
+
+	  https://github.com/kmarkus/lsdbus
+
+comment "lua-lsdbus needs systemd"
+	depends on !BR2_PACKAGE_SYSTEMD
diff --git a/package/lua-lsdbus/lua-lsdbus.hash b/package/lua-lsdbus/lua-lsdbus.hash
new file mode 100644
index 0000000000..6db9692210
--- /dev/null
+++ b/package/lua-lsdbus/lua-lsdbus.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  1361a42aef417eca3421436bf73b158583c96e728992800349c5da2dc654982d  lua-lsdbus-2c72a66631ccb12672e4157a8765f7a5ad5cc486.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/lua-lsdbus/lua-lsdbus.mk b/package/lua-lsdbus/lua-lsdbus.mk
new file mode 100644
index 0000000000..016ce5b46b
--- /dev/null
+++ b/package/lua-lsdbus/lua-lsdbus.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-lsdbus
+#
+################################################################################
+
+LUA_LSDBUS_VERSION = 2c72a66631ccb12672e4157a8765f7a5ad5cc486
+LUA_LSDBUS_SITE = $(call github,kmarkus,lsdbus,$(LUA_LSDBUS_VERSION))
+LUA_LSDBUS_DEPENDENCIES = luainterpreter mxml systemd
+LUA_LSDBUS_LICENSE = LGPL-2.1
+LUA_LSDBUS_LICENSE_FILES = COPYING
+
+$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
