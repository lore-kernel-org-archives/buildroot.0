Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02D5CF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 09:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E0148130C;
	Sun, 13 Oct 2024 09:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wL3aowO5tNUA; Sun, 13 Oct 2024 09:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7223381321
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7223381321;
	Sun, 13 Oct 2024 09:06:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48DA31BF346
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 09:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44EBF81321
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 09:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 807SmPNyPMKQ for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 09:06:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D23FE8130C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D23FE8130C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D23FE8130C
 for <buildroot@busybox.net>; Sun, 13 Oct 2024 09:06:36 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4311ac1994dso23675325e9.1
 for <buildroot@busybox.net>; Sun, 13 Oct 2024 02:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728810395; x=1729415195;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CvOh5APSmwSGgxsXYZqiNHxLk9gJeuQUBpWzl1l5t5M=;
 b=wZe04aDjY/vpuBW+elLbWKHEZ7Oc7dXJC8771NUif+xv7RQ0AZs0A8bsNLJqRlrXMh
 OyQAHAUm2LqeoGVmn8cabgGTWgkCGsTD++UkZACmJyNYnrndFZdxiTmzLrPwm0xgCsp0
 HV/sJM6zLlJVeoP7aE4qIkrh1e2ENunTxgBwlnSWdTxpaOxqbBFDWqBwRePiPd41F/Sx
 RU4YnIb2Gacy4jP2Oro6THDAv5fgm5D1JsTSkUsQwMm572x30N/dMAkm6MzaS9P5MB1p
 paHedem4M2/45xS1tywKU5I86wH/j1BHWAIQC/fYcwyWCkKPbB1CjbjOiqSOlVHJcYP3
 Zu8g==
X-Gm-Message-State: AOJu0YwX16EKF4yOGkYhI2X1EeloDWZ2CAp6uhLoHqrFVwAU+lGyQZMQ
 F8pUG9WHTXjbpK6Ws8GnpToCqi3fvz4S1uBS+V+YPHeMXK0iU14NSXDoHXDwq1r5kzEUe6JFk+O
 cxg==
X-Google-Smtp-Source: AGHT+IFETJzujPUFo0aTTmboc5eeJ9e04iYmAYqERH4B//vfEf5iRcJZ9k+/1vufft/JgLpxVHnvJw==
X-Received: by 2002:a05:600c:1e09:b0:42c:b995:20ca with SMTP id
 5b1f17b1804b1-4311df42961mr76639295e9.24.1728810394652; 
 Sun, 13 Oct 2024 02:06:34 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4311835c3acsm86431965e9.41.2024.10.13.02.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 02:06:34 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 13 Oct 2024 11:06:30 +0200
Message-ID: <20241013090630.256076-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1728810395; x=1729415195; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CvOh5APSmwSGgxsXYZqiNHxLk9gJeuQUBpWzl1l5t5M=;
 b=A4Gs/S7M36IJfR9ksxmyJqRvn/mFbYBWIx0DiAUlsaUBxo89pGe6U/wZbZ/V3CGb7a
 DwMRQ1oWxKNRyoKkuy/NHYGL/J7NKcwYY0EJ3Q7mpJ1H5dN4gRwcl5iS6RHlotKOOw8K
 JAs9ostvzagZC725Sq/6zzvT789yrrIL0G2j/kil3QmZuDqEcHIJTx+ZApnVxfu55jI7
 7rkb0LRWqjOiHMl8xqntllvYEcPGg/qogjcWuFrLiz/SiZRIgeA5xvolmkggLMS1bL3x
 SJqMEkW2M2nelnZVYKJYSMk1Ad7opVcph7FeL+IgnAp8TT9XgiHUFwAmx4MmKvcHCRNk
 lFTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=A4Gs/S7M
Subject: [Buildroot] [PATCH] package/lua-uuid: new package
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
 package/Config.in              |  1 +
 package/lua-uuid/Config.in     |  6 ++++++
 package/lua-uuid/lua-uuid.hash |  3 +++
 package/lua-uuid/lua-uuid.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/lua-uuid/Config.in
 create mode 100644 package/lua-uuid/lua-uuid.hash
 create mode 100644 package/lua-uuid/lua-uuid.mk

diff --git a/package/Config.in b/package/Config.in
index 35ed324c0..966ad1da0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -773,6 +773,7 @@ menu "Lua libraries/modules"
 	source "package/lua-testmore/Config.in"
 	source "package/lua-ubjson/Config.in"
 	source "package/lua-utf8/Config.in"
+	source "package/lua-uuid/Config.in"
 	source "package/lua-valua/Config.in"
 	source "package/lua-zlib/Config.in"
 	source "package/luabitop/Config.in"
diff --git a/package/lua-uuid/Config.in b/package/lua-uuid/Config.in
new file mode 100644
index 000000000..b2f259f2f
--- /dev/null
+++ b/package/lua-uuid/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_UUID
+	bool "lua-uuid"
+	help
+	  Generates uuids in pure Lua.
+
+	  https://github.com/Tieske/uuid
diff --git a/package/lua-uuid/lua-uuid.hash b/package/lua-uuid/lua-uuid.hash
new file mode 100644
index 000000000..d5942078e
--- /dev/null
+++ b/package/lua-uuid/lua-uuid.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256  e615c1fb1c22e50af5860e45794c027b1a5524cb8e7e6206ad3fed8e78b1f59e  uuid-1.0.0-1.src.rock
+sha256  27e7bf0219274247f4014cfb5070abfb2bb27e66c17a2dbd61427cf7fed81199  uuid/LICENSE.md
diff --git a/package/lua-uuid/lua-uuid.mk b/package/lua-uuid/lua-uuid.mk
new file mode 100644
index 000000000..5d763071f
--- /dev/null
+++ b/package/lua-uuid/lua-uuid.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-uuid
+#
+################################################################################
+
+LUA_UUID_VERSION = 1.0.0-1
+LUA_UUID_NAME_UPSTREAM = uuid
+LUA_UUID_SUBDIR = uuid
+LUA_UUID_LICENSE = Apache-2.0
+LUA_UUID_LICENSE_FILES = $(LUA_UUID_SUBDIR)/LICENSE.md
+
+$(eval $(luarocks-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
