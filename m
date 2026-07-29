Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC0DC54F51
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 08:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6429409EB;
	Wed, 29 Jul 2026 08:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHcDAMFnhmN8; Wed, 29 Jul 2026 08:06:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36E9C4085A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785312389;
	bh=LaksIyEF++FMDw+EGDBoBsljQVMsYinNRNi+z6jxMGk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=npZpuSt9zMcehr0KjnubOypvDZ4jxhvISQ7i8AgeKfsAweu0REJ0r8cpw7/WCdTcj
	 rpf1Byj1BZYQcmyiG+KqLOpE7SOBejbc7nTGyKFCll7HcHHG/d33bV+gLH7Cv4eRR8
	 6NcTbV5CIY6mGd/dvCoXMJ2mdaOQQ6EQtTYAoOhCHEq6aNMR1NGJz0NqaoHvUdAXm7
	 EZGJyq4gzI3CjoK1g2tsYYQyf+hpNi5n2KFnExehjFKoDrWlNf1VAyLVjVHQHHgnyy
	 U8nM7maKRVdlJp0P/ESP8CiE5Dr+RZrfAjSZpuxIzB9cdAw0lEAbrwkAv5lQurij18
	 vQI0/UtyKGeZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36E9C4085A;
	Wed, 29 Jul 2026 08:06:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 462844BF
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 08:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DE3281110
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 08:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 268cGYGt_HyA for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 08:06:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 694578112D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 694578112D
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 694578112D
 for <buildroot@busybox.net>; Wed, 29 Jul 2026 08:06:26 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4954dff6536so3826145e9.0
 for <buildroot@busybox.net>; Wed, 29 Jul 2026 01:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785312384; x=1785917184;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZhfXOQBbOpDCvynAmUhIodZGtK2NZeobkb5uiMVfWeM=;
 b=f8YXewE5UzOtqsTi2Y9XY4SbovOrGfczuWyvlBHEChAbXxidB258+mU6VtYiN7ebYB
 NeQFaBt8ITsdJZysQL+eW/UbX5svZH6j8Ups+S7TjgkhGjEsduKizb8i4quOzWgXosXu
 b6Bpxr4d7jEvSUjNhHwchwN/KpbzgCIXLy2ffhfXDcFYCKUJCeOtbb3nvhrST6LMf0wC
 JPlNf/ubsDFn61RgC5evAwUCRLVJvV+SCey4MxwhSxlMixozIncFNIoDNlf9qlBoFKnD
 Plbkuhie3XV/W3HbYt9ou/qvHEBFkcaFurGqloY+A0uBa0XWL5wvbA7OvjRQHkauRNWz
 Nf6w==
X-Gm-Message-State: AOJu0YytwSlBxnhhs1jfJ+RjCj52LJl2/0D2l44hjIaRKYaGSFtcmPq6
 gygBmc7jyu5sB9lzHJAJP4ndNg/IKnf5jn5OxXqiifRssrZOlg2TvvagVPjWQQ==
X-Gm-Gg: AR+sD11LtTXMSi5zsFsuS2RG7ZBc8REw30orXPF7CDurTQVwvRb7Md10s+nb6EE0Zsn
 Pcwwd6faopBj1tv4VTbf5sTCjTYrFL47Dtir/B0G7lV27QZmiJbPmZU2yYBMacM2c0bhp2L9VKq
 eyf+6gNOWjuBlzRIyxwDh2aogRxvO44p9YxRcdHJkuC3lwy9ewW4+d1HWFNzDldnJanZBCwHOQk
 IIChnRyXp/CCdvmDsQzCgr+wRYtSOjhGbaU24Yh2RbjHr5j2fFe8Goi04qwm+vgw5B6BEioydYh
 KIyCbLVDozHFfOv1JLh8teT7PJXXUcf8bzMUzXUHbTMhLJXwfn5OpE2eSvnxtp1VvH3LtdGy4ah
 AKKKXm3Qws0qFxFih7Wkdw/F5GQEz0j71akLMxD1QgXyXpL1xviC3esXF2qdJrvAr4zA4djC7Qp
 sA/wIxMHU5WaEcF12g8+cox9GEHn18NSLGpgVUQw97eG9l8AYy8RD5/xDrtt2uUehV62LUsUgO2
 03xrKgXTO9dMEWRs3c8nw==
X-Received: by 2002:a05:600c:8b41:b0:495:734e:4825 with SMTP id
 5b1f17b1804b1-496c653c11fmr64125235e9.16.1785312384106; 
 Wed, 29 Jul 2026 01:06:24 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4976bd7bab1sm37054415e9.13.2026.07.29.01.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 01:06:23 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Wed, 29 Jul 2026 10:06:17 +0200
Message-ID: <20260729080618.6192-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785312384; x=1785917184; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZhfXOQBbOpDCvynAmUhIodZGtK2NZeobkb5uiMVfWeM=;
 b=Zds9wqe80cPNNXk3pO3kIRonKngjFaK2yI317wmFVSMPq3TTxnWdNqv3/FfyHZvntE
 YFgqRlWQZtCeptrvPCSFwGEm0iCPfMHGe0Nro+2qMyHKg/Ky4oxwYOe26GTeYKwUBKTg
 yexhcwXyUeksSWwXyAtVOzXGx/ER2hL4jaSJ1wr79BoTxsdgfUihOPhC7rUODRR0WC6a
 N9GmKH0+vuQlI23LCMcOyq45RJuw2S0C5VV72sb1XiizGvCNxsdNi2efNAZMHIsgKwBz
 r1Es+kBtl2tsBjD8Y/+dl1PkhFoN/i141/ehZ0+AUoDvo1ie3vAyFBS4THANxYzTQamB
 2qqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Zds9wqe8
Subject: [Buildroot] [PATCH] package/lua-dkjson: bump to version 2.11
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

see changes on https://dkolf.de/dkjson-lua/

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/lua-dkjson/lua-dkjson.hash | 4 ++--
 package/lua-dkjson/lua-dkjson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-dkjson/lua-dkjson.hash b/package/lua-dkjson/lua-dkjson.hash
index f2ca354b5..cafa8989e 100644
--- a/package/lua-dkjson/lua-dkjson.hash
+++ b/package/lua-dkjson/lua-dkjson.hash
@@ -1,5 +1,5 @@
 # computed by luarocks/buildroot
-sha256  41d6bd91e8ae0802f98b3685635dd03e14ad99ee3f3d6fa56d5ecc217623f60c  dkjson-2.10-1.src.rock
+sha256  ddf3444076d3cf9a63dd797e56cbcf764e0d121de8456bc23a7d7acb4dcb1506  dkjson-2.11-1.src.rock
 
 # locally computed
-sha256  5998e1e7bd6b53efff746d02aaedb9646ce9cf965ea54f1bc812b5e750222cfc  dkjson-2.10/readme.md
+sha256  6932e5407e763eaaf4fc7fef07c28b4db0bc36433f14c0bd92d4a570a91c865f  dkjson-2.11/readme.md
diff --git a/package/lua-dkjson/lua-dkjson.mk b/package/lua-dkjson/lua-dkjson.mk
index f41edf511..0af7dda9a 100644
--- a/package/lua-dkjson/lua-dkjson.mk
+++ b/package/lua-dkjson/lua-dkjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_DKJSON_VERSION = 2.10-1
+LUA_DKJSON_VERSION = 2.11-1
 LUA_DKJSON_NAME_UPSTREAM = dkjson
 LUA_DKJSON_LICENSE = MIT
 LUA_DKJSON_LICENSE_FILES = $(LUA_DKJSON_SUBDIR)/readme.md
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
