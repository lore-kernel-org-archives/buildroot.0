Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D576C10F04
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 09:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF4CE41A6C;
	Wed,  6 Dec 2023 09:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF4CE41A6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MwRXqGTqxQrM; Wed,  6 Dec 2023 09:40:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3AA043637;
	Wed,  6 Dec 2023 09:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3AA043637
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FAA61BF83E
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 09:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7557F81EB3
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 09:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7557F81EB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UGdKFeyBKtVn for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 09:39:55 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D5C781CAD
 for <buildroot@busybox.net>; Wed,  6 Dec 2023 09:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D5C781CAD
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-548f0b7ab11so8598949a12.1
 for <buildroot@busybox.net>; Wed, 06 Dec 2023 01:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701855593; x=1702460393;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uu99n3bfSVyHv2tj+re1hfpGg7AAKbiFCXOC4BPW7N0=;
 b=GdTY8AfB08vtY567rb9mmTMuyTPBE0hQSanUWUDgDsDrp9GyKxgMKdYT0TgpM8PWYy
 W0osAs1/vwjAwUJwB+6eg/8VlsRvjWZXHAcmTPJX6A16ujzEbJWWOBx7p9V0qy8te6fK
 VEiQWecWY1z5Adu6mVH+jXTlVhAm6myIRCJIknvHj/YUSv60syc1gTrz1T3X58oPXcAy
 HtgJYyvdGnjjflzHTcLzmbZeysyE70ujqt4Nd4ps2ZMI1vqrirYZYBJ7U/VIRzqSlfdH
 4I3lzzLbDDZeLg8JKg8qYZ88uPgTCR8XR9FvNkC1E7U9ARFTbe8V6otBHMlDZulgxS4H
 LUTw==
X-Gm-Message-State: AOJu0YwxpGhitT1WQwSI4ckCMGNGQFAO/3rcuBPfTbR2AH7Hp7ySWPuF
 TP3nZ/6c4TxejfPR7BHwyori8PXggBk=
X-Google-Smtp-Source: AGHT+IGI7buNBXkl1GLY0TaXSedR2A0bRhnC7R0M+wLJcQIapLUL4xFSfnVDTOeL5FLZIoXO0Yi/sQ==
X-Received: by 2002:a17:907:c909:b0:a19:a1ba:da3f with SMTP id
 ui9-20020a170907c90900b00a19a1bada3fmr394486ejc.102.1701855593092; 
 Wed, 06 Dec 2023 01:39:53 -0800 (PST)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 di16-20020a170906731000b00a1b6d503e7esm4265553ejc.157.2023.12.06.01.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 01:39:52 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  6 Dec 2023 10:39:42 +0100
Message-Id: <20231206093942.1548412-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231206093942.1548412-1-francois.perrad@gadz.org>
References: <20231206093942.1548412-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701855593; x=1702460393; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uu99n3bfSVyHv2tj+re1hfpGg7AAKbiFCXOC4BPW7N0=;
 b=QtBq1Jnk0oDcZW0MF3foV1dngGaco29GqutBa7UBdJ+Mi7A+Kv4cEV0SlZ0+f1AdLV
 lhNXcboEyyjWsexeaiMkoH+S9YeZZgXkWH3Fk7m/FnK4WHJemZitxhnD7DKJHbOMmVR8
 ttIkaJ/pPCcMF6c1ySJXMXsXcS5PzHW4xESRai63zgCT23O5uK6yk3yhrai5kTn0lSAE
 4lxe4UrsLwK6wSszDEUFDLER2GU3sqD6zogBDLiQFzmuhQoXh3/TrW88Fes6CprM/OQ5
 b4V0g7tmwKU9IUm6C3BsM78Ded6HZf7uWJ3e//SZo+Nsp0hTOcqR/9goJ6+o8F1qr+QE
 FQqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QtBq1Jnk
Subject: [Buildroot] [PATCH 3/3] package/lua-ubjson: new package
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
 package/lua-ubjson/Config.in       |  7 +++++++
 package/lua-ubjson/lua-ubjson.hash |  3 +++
 package/lua-ubjson/lua-ubjson.mk   | 11 +++++++++++
 4 files changed, 22 insertions(+)
 create mode 100644 package/lua-ubjson/Config.in
 create mode 100644 package/lua-ubjson/lua-ubjson.hash
 create mode 100644 package/lua-ubjson/lua-ubjson.mk

diff --git a/package/Config.in b/package/Config.in
index 2400cf0796..c18a17af91 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -761,6 +761,7 @@ menu "Lua libraries/modules"
 	source "package/lua-std-normalize/Config.in"
 	source "package/lua-stdlib/Config.in"
 	source "package/lua-testmore/Config.in"
+	source "package/lua-ubjson/Config.in"
 	source "package/lua-utf8/Config.in"
 	source "package/lua-valua/Config.in"
 	source "package/lua-zlib/Config.in"
diff --git a/package/lua-ubjson/Config.in b/package/lua-ubjson/Config.in
new file mode 100644
index 0000000000..88ed2c7c79
--- /dev/null
+++ b/package/lua-ubjson/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_UBJSON
+	bool "lua-ubjson"
+	select BR2_PACKAGE_LUA_COMPAT53 if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # runtime
+	help
+	  a pure Lua implementation of UBJSON.
+
+	  https://fperrad.frama.io/lua-ubjson/
diff --git a/package/lua-ubjson/lua-ubjson.hash b/package/lua-ubjson/lua-ubjson.hash
new file mode 100644
index 0000000000..6db046ec2f
--- /dev/null
+++ b/package/lua-ubjson/lua-ubjson.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256  6605a6a0ca5f6cb8ec1aac14840adcdc6b359f5d8666fb3d224510e8d73c43b9  lua-ubjson-0.1.0-1.src.rock
+sha256  c85f6b3d47bcde28fd15bc7e361cdc5ec6b580819f4a891e29cf89513abbadd2  lua-ubjson-0.1.0/COPYRIGHT
diff --git a/package/lua-ubjson/lua-ubjson.mk b/package/lua-ubjson/lua-ubjson.mk
new file mode 100644
index 0000000000..93e6631962
--- /dev/null
+++ b/package/lua-ubjson/lua-ubjson.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# lua-ubjson
+#
+################################################################################
+
+LUA_UBJSON_VERSION = 0.1.0-1
+LUA_UBJSON_LICENSE = MIT
+LUA_UBJSON_LICENSE_FILES = $(LUA_UBJSON_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
