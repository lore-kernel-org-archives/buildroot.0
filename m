Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC27C71153
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 10:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EB7660C2C;
	Sat,  2 Sep 2023 10:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EB7660C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfouzlX3Ylsy; Sat,  2 Sep 2023 10:45:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 772BC60BAA;
	Sat,  2 Sep 2023 10:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 772BC60BAA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB2891BF40A
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 10:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A454B83437
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 10:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A454B83437
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SC_2eER6yE6L for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 10:45:09 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40FEA833AF
 for <buildroot@busybox.net>; Sat,  2 Sep 2023 10:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40FEA833AF
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2bd0a5a5abbso45533231fa.0
 for <buildroot@busybox.net>; Sat, 02 Sep 2023 03:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693651507; x=1694256307;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tzbyjGwC24cPZZUFjvPFtN6F1ul37PMYIJ7dpCYJ5i4=;
 b=D/kJ9h64ArsMdM2gR/r82P6S3drPhjXKR+6TMU0xWKTdH1IoY/sT635eMK0zmXTuFU
 BKgynKbjzwcxJFXTXh1nIojN6zuXVee0siXPojpNrF7FjjSjNBJQJv9sgtejuQ52WhfD
 zrsfz8TGVAlCfjHXHbMZn5CHbBS5VD7PS0xWKslB3AEtek5MB0ank5mrx50dAVevqHfU
 bhIHQadiG5UYNBGoW1iEJHHEJnh1rPsYt8XO8ci7iG66qvvVVP+EY2xNsgGoSUNMkj/Y
 6bJHjgds5q70MVMbUanSZ6hVEvEftfDcFRAsh6L0WJNYIREWh93pqKS7D4QYr33/KOPN
 ujEg==
X-Gm-Message-State: AOJu0YwbEOQxk2P84yYS2wHO62QMc2c2Jt2xizXdxSUjIjlr8T3FI9ux
 1O1zYanqVCqL09K2eD95F4GgIhwohSc=
X-Google-Smtp-Source: AGHT+IFi4z9SqNcn2I188BNN1/6TJMY6p6IV7ghCS2qUmWgbVpYd/ox2BknysSrdVv8egzVwb2QD/Q==
X-Received: by 2002:a05:651c:1023:b0:2bd:1cd0:603f with SMTP id
 w3-20020a05651c102300b002bd1cd0603fmr3301291ljm.45.1693651506630; 
 Sat, 02 Sep 2023 03:45:06 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c204100b003fe1630a8f0sm10605973wmg.24.2023.09.02.03.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Sep 2023 03:45:06 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  2 Sep 2023 12:44:59 +0200
Message-Id: <20230902104500.1118348-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693651507; x=1694256307; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tzbyjGwC24cPZZUFjvPFtN6F1ul37PMYIJ7dpCYJ5i4=;
 b=d+GEit6Iy0EB5kVfupEhSAiyHk+VUwUjkU1GO+XePBFCi7yM8+AupSlcOhhit0gN9p
 Fo01sekqZp2z8dmRcaullCtgDirrGS9oN/EaftQgQvRbn53Qt2jei3P9vPJSevHtQaaB
 AlGBcMCHNDPk4SpkK5GtVfDTPMlBEjBc/NUj0uF8JPVLOdZRnH4OU/WQjxNGdBX703wz
 7xWKhWIthGlQrIF6/5BBjSw62xdSls+FBwN/jr117okV4BppejrJKETy+ZEo8zw/X6vv
 hQsszBGyywLO2yAMYhrlGJjUd2rBOc3tJqis+fdsfn2gbF/SAnphBg/43a6njsRm/pFB
 J1Ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=d+GEit6I
Subject: [Buildroot] [PATCH 1/2] package/lua-datafile: bump to version 0.10
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
 package/lua-datafile/lua-datafile.hash | 2 +-
 package/lua-datafile/lua-datafile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-datafile/lua-datafile.hash b/package/lua-datafile/lua-datafile.hash
index e3b415ad4..2e993bc88 100644
--- a/package/lua-datafile/lua-datafile.hash
+++ b/package/lua-datafile/lua-datafile.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  b511ce5a4f4072bb6c496bd42760fa92a0576d0c77828b6a2600d68fe9d7e998  datafile-0.7-1.src.rock
+sha256  13cb4816f459e71c525f256dbf197a516deb0f6b9ad98a9a0dc0aafe0d415194  datafile-0.10-1.src.rock
 sha256  0443ddabab14f69d4c5e2641860343784a0ccbe5ae7a3743f20de9a13991da66  datafile/LICENSE
diff --git a/package/lua-datafile/lua-datafile.mk b/package/lua-datafile/lua-datafile.mk
index 3b4c65d3e..943ed9b8b 100644
--- a/package/lua-datafile/lua-datafile.mk
+++ b/package/lua-datafile/lua-datafile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_DATAFILE_VERSION = 0.7-1
+LUA_DATAFILE_VERSION = 0.10-1
 LUA_DATAFILE_NAME_UPSTREAM = datafile
 LUA_DATAFILE_SUBDIR = datafile
 LUA_DATAFILE_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
