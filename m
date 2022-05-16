Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E63C433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46C9E61074;
	Mon, 16 May 2022 13:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i79cVCen-k3Q; Mon, 16 May 2022 13:14:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A4B46106B;
	Mon, 16 May 2022 13:14:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54B311BF37E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4322640B44
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZGvlnl6eyjP for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:13:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0186440396
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:13:49 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id m62so8666336wme.5
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ScoTCTFHWZu2J6Nved9QA3dG6wok6QkKM1V9vlUhsAk=;
 b=nCAk1/aalByHyc/DDOcjagjoXnPTER5k7e8Jf7R/s7rLyxPSQCUZxzrwrUD19u0ENp
 e8HZJbe1QMHC4m4thUVyl3mkY510jHTabkrqErFkbE8YSUELs4sYBiUgPOfol5S7JvRo
 7mKUhb5a9PAG9E3sAz+8k4HYQQV2LA5+9juJl7BrGgwlZPOVbG8p5Wm2PN7cJ6J8xSMU
 OMiQZeimDylN2oC0SVQOkac1j8ivk1xjsyOhqP4KMPgJtCJ0frk2QzIpB85xZbXs0N6R
 0YBRMdZD5L2R96OosIcP4zKRXexHH4edncwmHenDh/JUvjMhrV2WJaevXxT8n+CHcxEv
 N7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ScoTCTFHWZu2J6Nved9QA3dG6wok6QkKM1V9vlUhsAk=;
 b=TBZ3hR9E8TMCSwTi4UjTpuTtEL4roRCQb67fc0XvPSbRvD+cfp6BBcBj3H8LceBZc7
 8R5Q44ce6SDuwJ26xDlb6Dfikzqf69UpHd0eP/H00CvoBZtP5FZ2zYCVqxcMzpCbTxnj
 yrO0rKbWqjRosGuGcItSgYeyuQAda0AKVDgpUwMixT47FrpQAZiAtjb3b5e4BFweQKBn
 kPoUVXlM91/hJ+Zz2V7YRFcxxMfeTXjMTMBEqQOC46rKH8XAWNF4WmXvyDLV597E9wNN
 eeJ8dFnU4BViiItLybEKKB3d7a45owBVAViCvXztfQi7q9WWGoLhJHvo+Al3/f72fD1n
 ainA==
X-Gm-Message-State: AOAM531VU8b5BcwmJqTXYPG16mDV2VL3Bncdz5JUdbgVg/EtbqlASY2e
 GnICUXTwIYVZ8vfATwG4wdWfyCYRCZU=
X-Google-Smtp-Source: ABdhPJxCvqELbxJLDMm6UsohI5TWb2hEVLY3J0VNtLMMU169OQQVvdWOcMzZO9/wFZKxNMgm0NA7oQ==
X-Received: by 2002:a05:600c:4e4f:b0:397:2ca:2363 with SMTP id
 e15-20020a05600c4e4f00b0039702ca2363mr5657560wmq.38.1652706827859; 
 Mon, 16 May 2022 06:13:47 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:13:47 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:15 +0200
Message-Id: <20220516131334.1910858-2-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 01/20] package/erlang-idna: remove
 unicode_util_compat library
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This library is not needed for the erlang version packaged in
Buildroot. Since it has been recently removed from erlang-idna
upstream repository but not included in any release yet, backport this
commit as a patch to this version.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 ...1-remove-unicode_util_compat_library.patch | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 package/erlang-idna/0001-remove-unicode_util_compat_library.patch

diff --git a/package/erlang-idna/0001-remove-unicode_util_compat_library.patch b/package/erlang-idna/0001-remove-unicode_util_compat_library.patch
new file mode 100644
index 0000000000..788e633879
--- /dev/null
+++ b/package/erlang-idna/0001-remove-unicode_util_compat_library.patch
@@ -0,0 +1,92 @@
+From 230a9175a5edb1b1a47fb09af2f4341eab93b1b0 Mon Sep 17 00:00:00 2001
+From: Benoit Chesneau <bchesneau@gmail.com>
+Date: Sat, 5 Dec 2020 11:31:24 +0100
+Subject: [PATCH] remove unicode_util_compat library
+
+remove unicode_util_compat library and support only Erlang >= 20. This
+change simplify the stack and prepare future change to support specific
+features of Erlang 23 and sup.
+---
+ src/idna.app.src     |  2 +-
+ src/idna.erl         | 10 +++++-----
+ src/idna_context.erl |  4 ++--
+ 3 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/idna.app.src b/src/idna.app.src
+index a6a7537..d647506 100644
+--- a/src/idna.app.src
++++ b/src/idna.app.src
+@@ -3,7 +3,7 @@
+   {vsn, "6.0.0"},
+   {modules, []},
+   {registered, []},
+-  {applications, [kernel, stdlib, unicode_util_compat]},
++  {applications, [kernel, stdlib]},
+ 
+   {maintainers, ["Benoit Chesneau"]},
+   {licenses, ["BSD"]},
+diff --git a/src/idna.erl b/src/idna.erl
+index 3436dd9..24d96b8 100644
+--- a/src/idna.erl
++++ b/src/idna.erl
+@@ -333,7 +333,7 @@ lowercase_list([], true) ->
+ lowercase_list([], false) ->
+   throw(unchanged);
+ lowercase_list(CPs0, Changed) ->
+-  case unicode_util_compat:lowercase(CPs0) of
++  case unicode_util:lowercase(CPs0) of
+     [Char|CPs] when Char =:= hd(CPs0) -> [Char|lowercase_list(CPs, Changed)];
+     [Char|CPs] -> append(Char,lowercase_list(CPs, true));
+     [] -> lowercase_list([], Changed)
+@@ -346,9 +346,9 @@ lowercase_bin(CP1, <<CP2/utf8, Bin/binary>>, Changed)
+   when CP1 < 128, CP2 < 256 ->
+   [CP1|lowercase_bin(CP2, Bin, Changed)];
+ lowercase_bin(CP1, Bin, Changed) ->
+-  case unicode_util_compat:lowercase([CP1|Bin]) of
++  case unicode_util:lowercase([CP1|Bin]) of
+     [CP1|CPs] ->
+-      case unicode_util_compat:cp(CPs) of
++      case unicode_util:cp(CPs) of
+         [Next|Rest] ->
+           [CP1|lowercase_bin(Next, Rest, Changed)];
+         [] when Changed ->
+@@ -357,7 +357,7 @@ lowercase_bin(CP1, Bin, Changed) ->
+           throw(unchanged)
+       end;
+     [Char|CPs] ->
+-      case unicode_util_compat:cp(CPs) of
++      case unicode_util:cp(CPs) of
+         [Next|Rest] ->
+           [Char|lowercase_bin(Next, Rest, true)];
+         [] ->
+@@ -374,7 +374,7 @@ append(GC, Str) when is_list(GC) -> GC ++ Str.
+ 
+ 
+ characters_to_nfc_list(CD) ->
+-  case unicode_util_compat:nfc(CD) of
++  case unicode_util:nfc(CD) of
+     [CPs|Str] when is_list(CPs) -> CPs ++ characters_to_nfc_list(Str);
+     [CP|Str] -> [CP|characters_to_nfc_list(Str)];
+     [] -> []
+diff --git a/src/idna_context.erl b/src/idna_context.erl
+index afcb814..a09ff1f 100644
+--- a/src/idna_context.erl
++++ b/src/idna_context.erl
+@@ -28,7 +28,7 @@ valid_contextj(Label, Pos) ->
+ valid_contextj(16#200c, Label, Pos) ->
+   if
+      Pos > 0 ->
+-       case unicode_util_compat:lookup(lists:nth(Pos, Label)) of
++       case unicode_util:lookup(lists:nth(Pos, Label)) of
+          #{ ccc := ?virama_combining_class } -> true;
+          _ ->
+            valid_contextj_1(Label, Pos)
+@@ -38,7 +38,7 @@ valid_contextj(16#200c, Label, Pos) ->
+   end;
+ 
+ valid_contextj(16#200d, Label, Pos) when Pos > 0 ->
+-  case unicode_util_compat:lookup(lists:nth(Pos, Label)) of
++  case unicode_util:lookup(lists:nth(Pos, Label)) of
+     #{ ccc := ?virama_combining_class } -> true;
+     _ -> false
+   end;
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
