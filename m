Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ECFD29C2E
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 14:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1090741375;
	Mon, 19 Jan 2026 14:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-lXLb17pll4; Mon, 19 Jan 2026 14:23:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 466334137E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768832637;
	bh=CIytfiLw/wkV6Z2QQ3gupeKTHBlaKqB0kbo8BHRpi14=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BDhHL7alC13TJsqjfJ+Ni3bSWKN+vBM1KFhXj8yl2GLmn5tkSscc6uAnVfzY8lHl0
	 AZeyb7dBFlC5G3oZnw7WMc/LKlN5R5Yw2j2fR9ubGr9ZZMJk76Tizt5ToAAkLl50In
	 TJg/Ju+4H4hA5Jl1Fsz6nSHj5ZOoorxePQUIHs8Nauc+iGtNdpjfCYBDCRlXg7cVHk
	 WqHeKhbwdE3yRbOKtO/AyAo3dOoQQ5VMfWD70JK72Nbt4H+ZpNFCenggjPRchi4Fme
	 rk9rR/ODcnb78kpYO8T3h+QMElMAocov+QV2UppD4doyBPmA6Sk+rkvWCNUv0PyJGu
	 zAIYrclctFOKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 466334137E;
	Mon, 19 Jan 2026 14:23:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D329160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 14:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 786F283640
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 14:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hj5hjcWJ4AWj for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 14:23:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6634183626
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6634183626
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6634183626
 for <buildroot@busybox.net>; Mon, 19 Jan 2026 14:23:55 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so50261165e9.0
 for <buildroot@busybox.net>; Mon, 19 Jan 2026 06:23:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768832633; x=1769437433;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jp3zBWPtq3vZd5etbmuyG+ZeqiAYxQTsx+0iygGpxiI=;
 b=Z4DqhwyDoRpKiKsMJTMLehnkMz62QIVFo4sXTcQJiRusrOAUqoWczVMqWVYxrmVKoi
 rA/OKafJyVr5dlI15a2Ijjnx9WWownegxDCZhjknUTEiCYwyeLpnJu9baa8uflrk1OLe
 Ljr0Mg/hZ7wewhkAlsSaBw7tZIjcwpgiBehZu3o63KrmZftLdv6JrSc+18Hn2HLraR4S
 NfGC7n/plyxXT23aP7wW2TG7wYq8E3BZwYA1wXGCAhd3G0Lci/YYUmCdBanmu7guGGP/
 icit9zivKDdMp82XsUWSimxq06jMjFuNG92Jv+zasWir1TFPNU8iY0KHePCLqmI7MlOQ
 KR0w==
X-Gm-Message-State: AOJu0Yz2OH4peR4WA5d08yMGIWNtuHqzAFHIKYa+JSDWtoOpA9v9IopO
 AZpO3rzRPA/es3tmJclaxK22osQjXB+1rTQ5rwRYEMeqEAjOMjr8G3iU7ssL106sQbziEVS4GqI
 7LZAgXg==
X-Gm-Gg: AZuq6aJq6Kecmivp3WcUvVexChc8EGNslymWxYPV6x6kv4bD0hGMkubAXjB7wPJ+tGv
 6h7bGnWtwk50vzeyyk3MEFGEQMkO7p+YD2v3hL/6yHID4qrsqx5DwHKliCIry79bb3BXtkV+/i8
 7bORg+tPTVsguoqEOhUytxe8W/BMfTmw5oTVut9fsnlE3MCstyGqqHpk8z1ui6u7+U9o840ENSV
 E2jStgonfnsdN6x7mVmKnz/BztqpNnWBkl0PZio+DzpAISxmwxkD3exAs6NyfCfSwUZReWBh0sX
 tuwd2ycePUwZm+jOIqINe50yY2ghPeWYrVS0LAH5exDPf7EaxuaG8CODmaKFPshKde92gSivJSz
 GlgrgH1hR3sepE7n0N2mvOWoeqA8iGFc+KIyV3uEYt3KBREGsyxsmGENBc3nrpMlqSNrNEIWON1
 TonMMaEK7xJjbsHjMRuSi7m+0ERdjEcHRKd05Pyg==
X-Received: by 2002:a5d:5f84:0:b0:42f:b581:c69a with SMTP id
 ffacd0b85a97d-4356996f9d1mr16511591f8f.5.1768832632710; 
 Mon, 19 Jan 2026 06:23:52 -0800 (PST)
Received: from vm-2404.. (249.184.66.37.rev.sfr.net. [37.66.184.249])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435699271easm23622476f8f.14.2026.01.19.06.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 06:23:52 -0800 (PST)
To: buildroot@busybox.net
Date: Mon, 19 Jan 2026 15:23:48 +0100
Message-ID: <20260119142348.815064-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1768832633; x=1769437433; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jp3zBWPtq3vZd5etbmuyG+ZeqiAYxQTsx+0iygGpxiI=;
 b=f8lxxcma7D5wtA2TrHbT9WeIYpS6ZcsVJdc0CwvnDco8WF2AdpfMA2yK0UgBtcGU19
 aqG+9Y+mY8KpexvPVdXyXPayeFNjH3v2LQwkOTKd2KmrDQGqZiGeHGKq4ClrMAsxx7o2
 GGxNp0v+DiocgANNCyNqStkRK3Am9jvmz5Tt4Je39pFtlOPAjIaxwcuACJsEPh+z1s5i
 2XK/pZboc6/HyOHMT5xj3o7W/WVxeesEY1tWFN+Np5/BXTbIBGcWqOeVwgePVbCIXx+B
 i3fyOtoS5gkl6D9tfTPU8gFFiKX0ywh42z+6OBAl7DBB4whLt/ntg/jL/jU2sN4cFdOO
 fBBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=f8lxxcma
Subject: [Buildroot] [PATCH] package/lua-ev: fix cmake4 compatibility
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

see https://autobuild.buildroot.org/results/936aa32f0f3fe4b6ea53ba37483d8cf0799b7248/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-ev/0001-cmake4.patch | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/lua-ev/0001-cmake4.patch

diff --git a/package/lua-ev/0001-cmake4.patch b/package/lua-ev/0001-cmake4.patch
new file mode 100644
index 000000000..ef90a3559
--- /dev/null
+++ b/package/lua-ev/0001-cmake4.patch
@@ -0,0 +1,28 @@
+From f8a49c3a306d182b1a9e6e7db2381ab5483bcf88 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Mon, 19 Jan 2026 15:15:14 +0100
+Subject: [PATCH] cmake4
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+Upstream: minimal part of https://github.com/brimworks/lua-ev/pull/31/files
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 413bb6c..2a994d0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -7,8 +7,8 @@
+ # Please note that the package source code is licensed under its own
+ # license.
+ 
++CMAKE_MINIMUM_REQUIRED (VERSION 3.10)
+ PROJECT(lua-ev C)
+-CMAKE_MINIMUM_REQUIRED (VERSION 2.6)
+ 
+ # Basic configurations
+   SET(INSTALL_CMOD share/lua/cmod CACHE PATH "Directory to install Lua binary modules (configure lua via LUA_CPATH)")
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
