Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337E4C54E41
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 12:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE5C24109F;
	Wed,  6 Mar 2024 12:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DXcRjPhZN1wl; Wed,  6 Mar 2024 12:18:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94EE8413D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94EE8413D3;
	Wed,  6 Mar 2024 12:18:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FA781BF2A5
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 12:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C70382298
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 12:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sJpJZWdSx7Ka for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 12:18:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 439F382291
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 439F382291
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 439F382291
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 12:18:29 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5101cd91017so9466421e87.2
 for <buildroot@buildroot.org>; Wed, 06 Mar 2024 04:18:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709727506; x=1710332306;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F72Ujuc7S7gqWQLp2oHrlB6yCQ+qLbVMii4iQXnXyE0=;
 b=Fq+Ak7nduJ+g7hQA138nRBRM8I7bs4kURP+bbE6s5YtOHGoSR9OkvmZoiY8OAzn9AV
 bg45R4fO04A75/YdS22CWf/k1+xiR4Rv9LNvDua/l8ttzXLvfHhL5f+5g5l7QoPzND54
 TBmNYczlxMvI0srpUzrowvyRMzh9TBLhecQlCCypYTMYnGuNccuLyGGx9tETLP1caiGv
 pv2ICiCkv7eZedC1BYgTLIJKXhjw3eGM6Eq/daWOokcCXMWR/NaqmPKwBVq7ikvYwwQs
 bCnntQ2mQD8t21PtIv1cJFIte5hyhYM4FWlj4leyb7pLSxNpg4epptHuiKN5QZSq4dKV
 ZVDA==
X-Gm-Message-State: AOJu0YzjkgwC9jRqCC7ksDyw0XSo6tnQC693jEdIQ71ZjerHMQtGtXXm
 uVa/5san5TLostnnm/JPajVP0el2HqQJ18RWHbAdFZl7jig6fLSPOQfwtebc
X-Google-Smtp-Source: AGHT+IHOVzl9n0lP71r3YvUxjqw8Yg+xyOXP52uT3XhiM6CzNwrKbrJDj5ubGyk1wsh1+6ZgtK47cQ==
X-Received: by 2002:ac2:4c45:0:b0:512:ed82:fd6f with SMTP id
 o5-20020ac24c45000000b00512ed82fd6fmr3880879lfk.60.1709727505725; 
 Wed, 06 Mar 2024 04:18:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b17-20020a05600c4e1100b00412f428aedasm2054180wmq.46.2024.03.06.04.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 04:18:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 13:18:23 +0100
Message-ID: <20240306121823.610202-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709727506; x=1710332306; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F72Ujuc7S7gqWQLp2oHrlB6yCQ+qLbVMii4iQXnXyE0=;
 b=l6cSxUj2g423Oe4uTCGH9VzrrzsG2KwkF187Dlb3aK8xENknZNa99ZkHpvXK/S44xJ
 tibbQInhebe9HfwUk4XIemjQa/fNJJ7IzQ3W/o2Xn2UzygBhSJ4NijNej9oyzkreuIli
 PuSfecQPQpCeOO/P0sta1danUzkCbTqk5gk7klvZbIGJYBDCWrfVPN3o6xOfiPYfV2rh
 k9YheNiQL5BREkJDzJ9E3SOXWRwQ2FSaFSXvEkwyFnizohtHXyq3c2PRg0Zh+FEFZ/Vf
 gJEiasW2Qz2DyOkSZFL0UMtx5PFX0hWSDNN5GMTA3uga7/T5ExvTsHyvFRbcsfEpw5z3
 pgVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=l6cSxUj2
Subject: [Buildroot] [PATCH 1/1] package/squid: needs gcc and host gcc >= 8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cf_gen.cc is compiled by host compiler and unconditionally uses auto
since bump to version 6.6 in commit
c13199c9326fa2daa574f08ec8fc063a48d0eb06 and
https://github.com/squid-cache/squid/commit/09835feb258c3058d028918e36d959dccb3f7496
resulting in the following build failure with host gcc < 8:

/usr/bin/g++ -O2 -I/home/buildroot/autobuild/run/instance-1/output-1/host/include -o cf_gen ./cf_gen.cc -I. -I../include/ -I../src
./cf_gen.cc: In function 'int main(int, char**)':
./cf_gen.cc:268:63: error: forming reference to void
                     auto &newEntry = entries.emplace_back(name);
                                                               ^

So add a dependency on host gcc >= 8 and gcc >= 8 as advocated by
upstream in
https://github.com/squid-cache/squid/blob/9d3433c4ac6cd547c10cf298b8a5e61a463fb753/doc/release-notes/release-6.sgml.in:

  This release adds a dependency on C++17 support in any compiler used to build Squid.
  GCC 8+ and Clang 8+ support C++17.

While at it, drop BR2_TOOLCHAIN_HAS_GCC_BUG_64735 which is always false
with gcc >= 7

Fixes: c13199c9326fa2daa574f08ec8fc063a48d0eb06
 - http://autobuild.buildroot.org/results/f1766d1a3b2ce7745fa23cdeae1101806cd97aea

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/squid/Config.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/squid/Config.in b/package/squid/Config.in
index 89b5a377c7..149884d815 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,18 +1,18 @@
-comment "squid needs a toolchain w/ C++, threads, gcc >= 7 not affected by bug 64735"
+comment "squid needs a toolchain w/ C++, threads, gcc >= 8, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || \
-		!BR2_INSTALL_LIBSTDCPP || \
+	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
+		!BR2_HOST_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
+	depends on BR2_HOST_GCC_AT_LEAST_8 # C++17
 	# needs fork()
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBCAP
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
