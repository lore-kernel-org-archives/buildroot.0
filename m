Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8CECAC598
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 18:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF4C2845DA;
	Wed, 17 Sep 2025 18:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsMnu1Xa9pLN; Wed, 17 Sep 2025 18:54:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F012845D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F012845D7;
	Wed, 17 Sep 2025 18:54:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ABB75199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 18:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D1E8426EE
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 18:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFP8zTp7bDrm for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 18:54:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98D7F40620
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98D7F40620
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98D7F40620
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 18:54:10 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b03fa5c5a89so24112266b.2
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 11:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758135248; x=1758740048;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IrVrb0rMYEcoqIlzV1yn8KCIHdGrdgeXUuy0rOz5+5M=;
 b=Jxu4k5l8apCxMS94bGSsKbayaEKYG72fi1DF8WZKujIUPBJ0alExaRXPgOycSzqodC
 VfqJySdLSfydPENS5Y0uToQZqxPVBMWmIOdYOUwjSGSpJpKOrSizzOF04RluJZ9Ya1ls
 svh/rPHGddiJWM+Vnp+d6/caJCJQiAdBpmw2mpJZp8ollG8gI0BgpJGKKShPxRYenxK6
 /fUu6gTKddGXdA20AP6CQs/s+A69V95RxVU5CaBxAWjMGm5q+o+e/ctYpdUyJRWBtNwF
 R/BDAcDv7LgQ0CCV0XVG0Y6AHnpQ3pZLA6lOSntmCCqjFDwG/f1b3KsLGSbzj6L1Xe19
 B+dA==
X-Gm-Message-State: AOJu0Yxe5sGECkXkRwgKFHy0hYoaK/EhWZYzfMZRkF0bFvGNc8BWyLL+
 PDYVTQtoHELIHYc8ThQRxd+YmLMTz+NGFVnNwxs9liFaFVuqMldD7mo6E9PqdSXT2gA1uRBMCCZ
 v1TF+P0A=
X-Gm-Gg: ASbGncvy6vipAajjWmrJwhz9xSKtBu6qxqwAgKrUqeKCNfDC6OWOpAwfY8DzpO8pHNR
 8NhiYYLfSU/7orz5pIc7hyBLIshDyTvdzcpkHN9opA5Va/ctn/NhgUeyk8S+KyT069vngEsGy+3
 n9Gwh98SMK9oQnIohAJeOoommxRe47yHY9ob2Pjy5rTcBWVmTkzbBaX/8bkEIedGB1lhv9wlbHQ
 LgneFa5uU4PSU7GuitrIdxgO9/uDEd5AIDQFgk3laRPvDL0A2v0slRRX3y2/WFXo4ABh5RWoKOd
 f3RPKYRuGJULtEr5R+58ELRxemkDULuUoPAsijJ/rTVr/vf+LjwfYiMsEuUnlW7JBAVJDmaelZz
 phX0HpKhhc8tr9arBt2PbhfixR06kmGYbmtnP
X-Google-Smtp-Source: AGHT+IEMlwr/6P5cDX+B6zhIQvcfo8L58Dl5CuFgNVZscwaeZ/aybOXbnWtjxSKELIQg8p3rADopDg==
X-Received: by 2002:a17:907:6d29:b0:b04:5b3d:c305 with SMTP id
 a640c23a62f3a-b1bb0c43fbamr400182066b.17.1758135247353; 
 Wed, 17 Sep 2025 11:54:07 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b1fc73bb6ebsm26722666b.29.2025.09.17.11.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 11:54:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 20:53:44 +0200
Message-Id: <20250917185344.2881523-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758135248; x=1758740048; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IrVrb0rMYEcoqIlzV1yn8KCIHdGrdgeXUuy0rOz5+5M=;
 b=H6/WXfzGsTH7EVbUy+gJ3KqJz0uvA9v1QunuXiLxj8QLIBoHgym5Vn6Bvc93pOeOh8
 TNTiI0KagZ9iZKRR4XAf7F6h2kWqAgwGSEkZTgej4HAE+FpUEbcModFlWy+UiLHOJHzB
 EszRiRUFHt1eWR800U0H8RzfpgSLf2sIlLVxrnK2buf4mjDuD4ACTEeR76VDWrL+YB+z
 L9V+rV64K5UlENAMNR/WV01VAxlcZQeMVNRHo1XtecLw/CSzEawG4a3o53BiwjH3uJE0
 6iorlmHNHr9Ss3z2WX2LstFeTM6YKI7z2JX0HJqIEBSGXcbgLQaydG08MUgVR7JYefRG
 fJOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=H6/WXfzG
Subject: [Buildroot] [PATCH 1/1] package/lua/5.1.5: add patch for
 CVE-2014-5461
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This CVE is specific for the version 5.1.5 still present in Buildroot.
It has been fixed in 5.2.3 and thereby doesn't affects the other
versions available in Buildroot.

- CVE-2014-5461

Buffer overflow in the vararg functions in ldo.c in Lua 5.1 through
5.2.x before 5.2.3 allows context-dependent attackers to cause a denial
of service (crash) via a small number of arguments to a function with a
large number of fixed arguments.

For more information see:
  - https://security-tracker.debian.org/tracker/CVE-2014-5461
  - https://udd.debian.org/patches.cgi?src=lua5.1&version=5.1.5-11

A patch present in Debian is used to address this vulnerability.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...x-stack-overflow-in-vararg-functions.patch | 24 +++++++++++++++++++
 package/lua/lua.mk                            |  6 +++++
 2 files changed, 30 insertions(+)
 create mode 100644 package/lua/5.1.5/0003-Fix-stack-overflow-in-vararg-functions.patch

diff --git a/package/lua/5.1.5/0003-Fix-stack-overflow-in-vararg-functions.patch b/package/lua/5.1.5/0003-Fix-stack-overflow-in-vararg-functions.patch
new file mode 100644
index 0000000000..00142d2338
--- /dev/null
+++ b/package/lua/5.1.5/0003-Fix-stack-overflow-in-vararg-functions.patch
@@ -0,0 +1,24 @@
+From: Enrico Tassi <gareuselesinge@debian.org>
+Date: Tue, 26 Aug 2014 16:20:55 +0200
+Subject: Fix stack overflow in vararg functions
+
+CVE: CVE-2014-5461
+Upstream: https://sources.debian.org/data/main/l/lua5.1/5.1.5-11/debian/patches/0004-Fix-stack-overflow-in-vararg-functions.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/ldo.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ldo.c b/src/ldo.c
+index d1bf786..30333bf 100644
+--- a/src/ldo.c
++++ b/src/ldo.c
+@@ -274,7 +274,7 @@ int luaD_precall (lua_State *L, StkId func, int nresults) {
+     CallInfo *ci;
+     StkId st, base;
+     Proto *p = cl->p;
+-    luaD_checkstack(L, p->maxstacksize);
++    luaD_checkstack(L, p->maxstacksize + p->numparams);
+     func = restorestack(L, funcr);
+     if (!p->is_vararg) {  /* no varargs? */
+       base = func + 1;
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 455b7e58b2..269eafe4bb 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -21,6 +21,12 @@ LUA_LICENSE_FILES = COPYRIGHT
 endif
 LUA_CPE_ID_VENDOR = lua
 
+ifeq ($(BR2_PACKAGE_LUA_5_1),y)
+# Only affect lua version 5.1.5
+# 5.1.5/0003-Fix-stack-overflow-in-vararg-functions.patch
+LUA_IGNORE_CVES += CVE-2014-5461
+endif
+
 LUA_PROVIDES = luainterpreter
 
 LUA_CFLAGS = -Wall -fPIC -DLUA_USE_POSIX
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
