Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCDDC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02C8283ED0;
	Sun, 14 Aug 2022 23:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02C8283ED0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PU4rX1d651qg; Sun, 14 Aug 2022 23:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C78181C38;
	Sun, 14 Aug 2022 23:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C78181C38
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 575BD1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F95281C38
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F95281C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Rmb_CbwrurB for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:39:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FDF981BF5
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FDF981BF5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:39:30 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id r12so2349112uaf.7
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=WAQXaf2jrbtwrqwH+49vczAU4/SRhYUc2I20nSlvaYs=;
 b=qt41Y3Vhe5ynJo2PqMIPgXe984o34LFR53M+H/1jzVELHfl+ghs24++hRMucJujzXM
 qzdYry42M2uaI8b6GAGQH+3IuTTOFp341wYll6xoenWWaxlSEcjwUxD/JVLgiuRCagPg
 HAo/DdLUkAKPSrauWI7eSJxgM50xQVA1nT1nV2bADrjCFw6tjg8sA65T3E4M7lTYvkyl
 /6eNNTk9aV17m8x+1IBOGfe4tNE4C3DMrb/ruyaNpyZw6zQjZwxWw2o4z/Tv2kgftGOZ
 gFjb2jVLepf8Tztl0UJb+8btJtEd6HkJ8vY8ngSIewCbvF4zDS3HhKqCqs7YutQx5twj
 e61A==
X-Gm-Message-State: ACgBeo1qwFrJNmmkOY21/wBUj3h1QVfvUjBv2u3RKmIDaC90PRaJx9e1
 6PLFz8+3UK11JPcHjgiJqnTiJ5DG9bQ=
X-Google-Smtp-Source: AA6agR78jnLmVwdmc/csU0oRm8rxfoIicBq9aC9Qm7DVqZSpyRhPJ9T3nI3epiv9YNV8z3gSVF3h1Q==
X-Received: by 2002:ab0:3cc:0:b0:384:defe:ff2 with SMTP id
 70-20020ab003cc000000b00384defe0ff2mr5097276uau.71.1660520369475; 
 Sun, 14 Aug 2022 16:39:29 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:39:28 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:17 -0300
Message-Id: <20220814233845.2247022-6-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=WAQXaf2jrbtwrqwH+49vczAU4/SRhYUc2I20nSlvaYs=;
 b=KImhUeL6T8LVbeaqlIDYljnA77XsxGmTMk67kDsla6hMUyIdJBB7jScMMtItlBJTE4
 qULAW80YcqmKDfS89lrwvY1qtGvkY4BZ0UW0Yb7OFd0q+HERDE2Nsa/fTFF1QL534iBm
 a+uXlwfN8ABbcwkqgXBFTtLrAuHnGgLwckBrBlg+PY44HDQKUqVHl5w/atb1qeVeEMH/
 hyvqktLR3IpPGTHv8g/FRcHAJvRjeIiMr/CvnoCd0wy025u/n66/QYff+/2JEe5mGWf5
 Fd56lm7JkwRyJArAKQG7HByE182kaNcKdlp21eyeLSVbSGw9Fk4bZlTK9OGKX8MJDnou
 44Sw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KImhUeL6
Subject: [Buildroot] [PATCH 05/33] package/c-capnproto: use space after
 depends on
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

This is the only use in the tree without the space.
Do like the other 2k+ uses in the tree and add the space:
-depends on!BR2_...
+depends on !BR2_...

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/c-capnproto/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/c-capnproto/Config.in b/package/c-capnproto/Config.in
index 41a59d7a22..c472128c3f 100644
--- a/package/c-capnproto/Config.in
+++ b/package/c-capnproto/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_C_CAPNPROTO
 
 comment "c-capnproto needs host and target gcc >= 5 w/ C++14, threads, atomic, ucontext and not gcc bug 64735"
 	depends on BR2_USE_MMU
-	depends on!BR2_HOST_GCC_AT_LEAST_5 || \
+	depends on !BR2_HOST_GCC_AT_LEAST_5 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
