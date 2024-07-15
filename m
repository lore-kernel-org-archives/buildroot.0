Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12403C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 13:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EB8B810F0;
	Mon, 15 Jul 2024 13:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7hQcxHLFFSNi; Mon, 15 Jul 2024 13:09:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60F4A8110A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60F4A8110A;
	Mon, 15 Jul 2024 13:09:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D2BA1BF3BE
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 13:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07ECB80CE0
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 13:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ro9dcZc1ZZfe for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 13:09:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF15680CE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF15680CE3
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF15680CE3
 for <buildroot@busybox.net>; Mon, 15 Jul 2024 13:09:51 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-367aa05bf9dso2516372f8f.3
 for <buildroot@busybox.net>; Mon, 15 Jul 2024 06:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721048990; x=1721653790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YnZdA32DxsqoKu84d1cxIOt03ssPMMPPhLaznTDqV9M=;
 b=A2QQ6VehGgXCZrxasgPrGUcxuMpM6JvD2l6DULAbUcT8HDZ4Yg7xzn8Vqy63sFTyQd
 O/1L3XjnWgDUSJvzFEm129oneeGdk4LECtKxl7hhaBcgkryGm3n9DaBUyg7QOLMs0+CW
 5ZPD7omUY6Y0UOAmplB7hstXacrDHKiChqzYEY45KRL9rEaf+uerKkpAWzACbMEvFhHu
 M6NmDleKn34XngNOLmJVJ2GriHoXsQC7NlS3TqS4OsDFOvWEeHD+VFfHsP8FA7iSB+t2
 8cKMyKe43y26gT7HDHbWz+ifaZGIrYxJJrNT2GYQ9rKk0TmFHSEt7iZ6OtY6HsGMLWw6
 xkGA==
X-Gm-Message-State: AOJu0YztIXe/6b4UYT4UpL+wk6A2lN49TdrWSe21NLxH+1Z9RKJ1tZhP
 bbyRzEF6d88Sfjz7lUf4MeSS1Oc00LTUI0u33Aj3oKWcOSvpNNbaRSDLpWf99QglfRVUED0npuA
 =
X-Google-Smtp-Source: AGHT+IE4hOGvuTQSQ8XBfAyWH9K9NJCHma5sKY5Zh0KIgMp/MkKoYQJm3NtaAC/2Y/aAiqCfcpK7+g==
X-Received: by 2002:adf:fdc3:0:b0:367:8a2f:a6dc with SMTP id
 ffacd0b85a97d-367cead15b8mr12712626f8f.44.1721048989892; 
 Mon, 15 Jul 2024 06:09:49 -0700 (PDT)
Received: from vm-2404.. (140.33.66.37.rev.sfr.net. [37.66.33.140])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dab3cb0sm6359227f8f.10.2024.07.15.06.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 06:09:49 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 15 Jul 2024 15:09:39 +0200
Message-ID: <20240715130940.470769-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715130940.470769-1-francois.perrad@gadz.org>
References: <20240715130940.470769-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1721048990; x=1721653790; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YnZdA32DxsqoKu84d1cxIOt03ssPMMPPhLaznTDqV9M=;
 b=DOZQutWO7i+7ptPMbM4GtV0awtyFHvhaRt5h7z8xmBD3C7/2J0qbMtd/4rzLGWT7ly
 Wv6SKT6YwicDGzV2K9bsLn5zBXwTj9PMH3BnkYRBY6P7HdKZ/fnHb9ugstmr/zA/4X17
 YJpdkhYf/uqueolrfzWOzB84Sh0cnrcL08nUMdKSBiuAc81/Kt8PwEMVmsMgXfIg8laH
 1esEhF1/e82q94XmPF/1xeeNQH3Nf9rIzgaeqnaGfApSBYRSA5/k1SPUe3mZpPQBpwFg
 6/xkWuolh2uJIYv+O0PBaSXSoHUMHM2opzLG+yyF3qCM1eNFAKz9YMwSsEA/ugjnY7YO
 3++Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=DOZQutWO
Subject: [Buildroot] [PATCH v2 2/3] package/lua: use tag Upstream in patches
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
 .checkpackageignore                            | 4 ----
 package/lua/5.1.5/0011-linenoise.patch         | 3 +--
 package/lua/5.1.5/0012-fix-reader-at-eoz.patch | 3 +--
 package/lua/5.3.6/0003-linenoise.patch         | 3 +--
 package/lua/5.4.7/0003-linenoise.patch         | 3 +--
 5 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 497cac8d4..4b7553b7a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -980,14 +980,10 @@ package/lua-sdl2/0001-Do-not-reference-host-directory-for-headers.patch lib_patc
 package/lua-sdl2/0002-CMakeLists-do-not-require-C.patch lib_patch.Upstream
 package/lua/5.1.5/0001-root-path.patch lib_patch.Upstream
 package/lua/5.1.5/0002-shared-libs-for-lua.patch lib_patch.Upstream
-package/lua/5.1.5/0011-linenoise.patch lib_patch.Upstream
-package/lua/5.1.5/0012-fix-reader-at-eoz.patch lib_patch.Upstream
 package/lua/5.3.6/0001-root-path.patch lib_patch.Upstream
 package/lua/5.3.6/0002-shared-libs-for-lua.patch lib_patch.Upstream
-package/lua/5.3.6/0003-linenoise.patch lib_patch.Upstream
 package/lua/5.4.7/0001-root-path.patch lib_patch.Upstream
 package/lua/5.4.7/0002-shared-libs-for-lua.patch lib_patch.Upstream
-package/lua/5.4.7/0003-linenoise.patch lib_patch.Upstream
 package/luajit/0001-no-bin-symlink.patch lib_patch.Upstream
 package/luajit/0002-install-inc.patch lib_patch.Upstream
 package/luasyslog/0001-remove-AX_LUA_LIBS.patch lib_patch.Upstream
diff --git a/package/lua/5.1.5/0011-linenoise.patch b/package/lua/5.1.5/0011-linenoise.patch
index 488c080a1..c0ab200bd 100644
--- a/package/lua/5.1.5/0011-linenoise.patch
+++ b/package/lua/5.1.5/0011-linenoise.patch
@@ -1,7 +1,6 @@
 Add support of linenoise (replace readline)
 
-see discussion, http://lua-users.org/lists/lua-l/2010-03/msg00879.html
-
+Upstream: http://lua-users.org/lists/lua-l/2010-03/msg00879.html
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/src/luaconf.h
diff --git a/package/lua/5.1.5/0012-fix-reader-at-eoz.patch b/package/lua/5.1.5/0012-fix-reader-at-eoz.patch
index 17a28ba4c..fd92147ea 100644
--- a/package/lua/5.1.5/0012-fix-reader-at-eoz.patch
+++ b/package/lua/5.1.5/0012-fix-reader-at-eoz.patch
@@ -1,7 +1,6 @@
 When loading a file, Lua may call the reader function again after it returned end of input.
 
-Fetch from: http://www.lua.org/bugs.html#5.1.5-2
-
+Upstream: https://www.lua.org/bugs.html#5.1.5-2
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/src/lzio.c
diff --git a/package/lua/5.3.6/0003-linenoise.patch b/package/lua/5.3.6/0003-linenoise.patch
index 574e6c8f0..495177c32 100644
--- a/package/lua/5.3.6/0003-linenoise.patch
+++ b/package/lua/5.3.6/0003-linenoise.patch
@@ -1,7 +1,6 @@
 Add support of linenoise (replace readline)
 
-see discussion, http://lua-users.org/lists/lua-l/2010-03/msg00879.html
-
+Upstream: http://lua-users.org/lists/lua-l/2010-03/msg00879.html
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/src/lua.c
diff --git a/package/lua/5.4.7/0003-linenoise.patch b/package/lua/5.4.7/0003-linenoise.patch
index 2fcbc49f6..a82c8801a 100644
--- a/package/lua/5.4.7/0003-linenoise.patch
+++ b/package/lua/5.4.7/0003-linenoise.patch
@@ -1,7 +1,6 @@
 Add support of linenoise (replace readline)
 
-see discussion, http://lua-users.org/lists/lua-l/2010-03/msg00879.html
-
+Upstream: http://lua-users.org/lists/lua-l/2010-03/msg00879.html
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/src/lua.c
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
