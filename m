Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B664C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 249EF80FB9;
	Sun, 27 Nov 2022 13:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 249EF80FB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id utgq4k6LKx38; Sun, 27 Nov 2022 13:12:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BEEF81B14;
	Sun, 27 Nov 2022 13:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BEEF81B14
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 695BF1BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44EA4400D0
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44EA4400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dYbAjqVcH98W for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C2F4400B8
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C2F4400B8
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:57 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-14263779059so10208120fac.1
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RqxY/3vXH7cJNzBLHrjFzyzCu/nHMFNNHb5V4ieMEzk=;
 b=2Xa4drOOMGz2tfKvqij1YRkGBnHWtpEqwnwXhIQzCbB9gfKi3RhYRsStCslz+wPkKR
 j0PuM5mukiwhzk79Sr/q0RkJNsP//qdlh2hHRufUcPd5UpEak3Rgs5aFKuRQlF+/7poU
 B/JsIGIeXJD6vNObbtBM3PD1PBDhuMRajzSkb5mG9oEZB9/C+a30m75aryhLJnlnsQ/q
 Tg3C5qWaTB4FqQGELMaWs5L5Gcel7XDlvl8i+kSCkTP9iuuSH9I5fJu0g26tx8jUn8kU
 va4m1WuY/Pdg1nfc6REvHbOOFMuMWvlBKc3pwz/k4UEjw4CTryhw+SmqmfE1Y1CcjXIa
 OJyg==
X-Gm-Message-State: ANoB5pkLMODN1/+yMu0ibPE5bRgTCp7Xdj+/i16YVDTK2lc/+8tLdsn5
 hCpkvzLfFTWgnh2HvsRz7/I4RhqaMF8=
X-Google-Smtp-Source: AA0mqf62fgh4IPgS4QUD9/hJUG//erabZpJSqTy1hW0slPv/PKVtYR+BzamI2JGNbRdL+w3HbV71ag==
X-Received: by 2002:a05:6871:4607:b0:13b:9bf2:25a8 with SMTP id
 nf7-20020a056871460700b0013b9bf225a8mr14871203oab.102.1669554536733; 
 Sun, 27 Nov 2022 05:08:56 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:55 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:34 -0300
Message-Id: <20221127130739.1862398-21-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RqxY/3vXH7cJNzBLHrjFzyzCu/nHMFNNHb5V4ieMEzk=;
 b=PumtsciG96lOwH8zrCyBWT6ekmq032lDPMqQNry65I4V8w+BrVY38+pJGlPfGrI7wE
 XS6WWlbh6PKUE5dxliLSKfgr/SMKdoxSqoUnPjoWDVnr2LyHuAJI4E0w8fHV0Cke8Mkg
 cMCjKA+SvoKvwwM6P5jhipNEb0MWXDj1JhESQ2Ec05bXiLQkuMbl5BGFZVNK8eEcVoaA
 dwe8TW47xk2tg1WBI8zLcusO9lLQQE1+XZWOLM2BMjJFhrTDV/llwHYe3ZWDyPklnjLC
 bAC7PovW6Qn5fexpt1xx98FNsIHkk9vBisSAfa/0OXmA6bC66wE9tCw5egGHXnYA0k5w
 kX2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PumtsciG
Subject: [Buildroot] [next 20/25] package/lua: properly handle legacy for
 removed version
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "297613f1c7 package/lua: remove 5.2.x version" tried to add
legacy handling but the new symbols are part of a choice, and Kconfig
does not enforce the select of a option from a choice.

Update the legacy entry for 2019.02, following the example described in
the beginning of the file.

Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
test config 1:
BR2_PACKAGE_LUA_5_2=y
BR2_PACKAGE_LUA=y
---
 Config.in.legacy      | 2 +-
 package/lua/Config.in | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8861b0d704..3131c31e68 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -2094,9 +2094,9 @@ config BR2_PACKAGE_FFTW_PRECISION_QUAD
 config BR2_PACKAGE_LUA_5_2
 	bool "Lua 5.2.x version removed"
 	select BR2_LEGACY
-	select BR2_PACKAGE_LUA_5_3
 	help
 	  The Lua 5.2.x version was removed.
+# Note: BR2_PACKAGE_LUA_5_2 is still referenced from package/lua/Config.in
 
 config BR2_TARGET_GENERIC_PASSWD_MD5
 	bool "target passwd md5 format support has been removed"
diff --git a/package/lua/Config.in b/package/lua/Config.in
index 309dd6eec2..8fa9f9b7ab 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 
 choice
 	prompt "Lua Version"
+	default BR2_PACKAGE_LUA_5_3 if BR2_PACKAGE_LUA_5_2 # legacy
 	default BR2_PACKAGE_LUA_5_4
 	help
 	  Select the version of Lua API/ABI you wish to use.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
