Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F628C87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 03:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D549460B52;
	Sat,  9 Aug 2025 03:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1TDB6jtAxUK; Sat,  9 Aug 2025 03:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0E2A60B6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0E2A60B6C;
	Sat,  9 Aug 2025 03:38:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2239721B
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 03:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1466660B6C
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 03:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76yJdvgPidvS for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 03:38:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::662; helo=mail-pl1-x662.google.com;
 envelope-from=git@jdknight.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CE53B60B52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE53B60B52
Received: from mail-pl1-x662.google.com (mail-pl1-x662.google.com
 [IPv6:2607:f8b0:4864:20::662])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE53B60B52
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 03:38:29 +0000 (UTC)
Received: by mail-pl1-x662.google.com with SMTP id
 d9443c01a7336-2405c0c431cso26539665ad.1
 for <buildroot@buildroot.org>; Fri, 08 Aug 2025 20:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754710709; x=1755315509;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kzKuMHyeJY8tASe3UpLNTuKHgHRNq67B0Gy1wuO9dIY=;
 b=WnLZlm4PC/tjl+LGWAscFAKjY9TPPcEo9a3bVhMVe9pi2hpW8zWh3wJ0bYyHQZLdOp
 bCiZTPEhccvgfu4fa+y6uv87NY8qA662dX5wkspQG9ZAn0tQp39ZLP5AnDJ8+XBPRfYX
 vmDEjhNnVNWgxfIsTcy3sOKb/cy3O/mBwStRqMGjnEesWQtLAKNpGD3YxL1VifFTfveL
 pgtc6it2sbzP741wrA/C5SmvVhVbblMTQ9lOrh0uqwZUClEaE3VXtfVDTBD6p+fLyvoK
 +DUjty7DKYAwlmqVgHFimyS5zyg4AmUd5E759kmMVHDukMNaD4/BTbuvTfvmykctd0FL
 SuCA==
X-Gm-Message-State: AOJu0YxBJ6ZmpOIsIdrmgGFBVNJHdv3LYs1YB2ITuu8EwrnpTEPxnVZ0
 srT/O9LyvntHGXt+Ou2B5yqoH/DujH0ZoaTLOmU4f8Av1F6Ge8hkg+Yn+Kh8BqjBX4RBbEPa17W
 Z/fn5yu9e1TLYBcr7LptANZ1Q6XDDyMJdvrK7gIa9wM7e
X-Gm-Gg: ASbGncuG4iH0BTlUKZ9Q9My8Kbf82RVEIt9zl6MrWeMRVg8iylNDJVGcQigZfbpyg8A
 XvVh0zNK09zv7D4eF0RpqnFJrd/YhH8a57qI/1OEKuC8bxnIGU7XHlsEvPPmsdgkI16RCbjEg/p
 nvQ3UjUltQAZjzUMFDR7dDbCnEcWfdoQimL/TuKglf7E73bV7bRh1V6qKhGr9E2Ym1/OD+G3gvf
 1VE8pqehkOQaHKAsDqf543QLoCylaJFrt+5CNXVGy18/G50u0Wh9Ydw2woodbokwa0HN9ZW/0gV
 E3JIa/KGhYcit7al3oM+puIZA37jjRGZ04UWNmb/nBDN2r0Q67PL9GjJz7dqQ1U6KbLQd3ryOvq
 dqbRGBa3EeF+hsHgi8cGiYQ61S6d7vED1SJnEBy038SF7hg+9
X-Google-Smtp-Source: AGHT+IGc3fV1MOKEwMZ0kdRs22Mw0cWaOG44fBdrJOJCQmuCN0+3El8m/cGiw5HSSejAeaKkEwDOXXPIqj8C
X-Received: by 2002:a17:903:3b8c:b0:234:986c:66bf with SMTP id
 d9443c01a7336-242c20037f0mr70876715ad.11.1754710708935; 
 Fri, 08 Aug 2025 20:38:28 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-jkvlon0513w-grc-49-184-144-89-37.dsl.bell.ca. [184.144.89.37])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-241e8976de2sm14581565ad.47.2025.08.08.20.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 20:38:28 -0700 (PDT)
X-Relaying-Domain: jdknight.me
From: James Knight <git@jdknight.me>
To: buildroot@buildroot.org
Date: Fri,  8 Aug 2025 23:37:55 -0400
Message-ID: <20250809033757.1197-1-git@jdknight.me>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jdknight-me.20230601.gappssmtp.com; s=20230601; t=1754710709; x=1755315509;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kzKuMHyeJY8tASe3UpLNTuKHgHRNq67B0Gy1wuO9dIY=;
 b=ru8lU/gJokZEAnt8UrP+zZLVxkD//svatVPEFiODJVhkaKGeQzLwlMPle6ax5aLRNG
 6KVcnseSGZCWhBSUJUTjDaJJybMjzvo622frjOyhmCxfUj9MMwzfe3vlwhfnBw5Z4r+2
 HA5WMe3Ys1Ny7dPhogpFyfu7jfuzucluk6BHLBd2KXF4yZpDig+Jr/udrL3qHJY9XoAj
 Vjy9y4Dv3Ls3GfmqoErdKDhgOVqWIMPh3drDgASczy7p9FsndfsvnKBiatldv0hILM3/
 Jw+1F4I8CPg+SvrrobldRiPNp5envBUb6c4TnZeqbY0fuyEy1byyX03oM1GdbKfqIyzz
 z4AA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jdknight.me
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jdknight-me.20230601.gappssmtp.com
 header.i=@jdknight-me.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ru8lU/gJ
Subject: [Buildroot] [PATCH 1/3] package/libgtk3: remove schema compile hook
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
Cc: James Knight <git@jdknight.me>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dropping the need for this package to compile any schemas as the
libglib2 package (a dependency) already handles this during target
finalization.

Signed-off-by: James Knight <git@jdknight.me>
---
 package/libgtk3/libgtk3.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index d6d7c64a54..2fd3a26a3c 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -87,13 +87,6 @@ else
 LIBGTK3_CONF_OPTS += -Dtests=false -Dinstalled_tests=false
 endif
 
-define LIBGTK3_COMPILE_GLIB_SCHEMAS
-	$(HOST_DIR)/bin/glib-compile-schemas \
-		$(TARGET_DIR)/usr/share/glib-2.0/schemas
-endef
-
-LIBGTK3_POST_INSTALL_TARGET_HOOKS += LIBGTK3_COMPILE_GLIB_SCHEMAS
-
 # gtk+ >= 3.10 can build a native version of gtk-update-icon-cache if
 # --enable-gtk2-dependency=no is set when invoking './configure'.
 #
-- 
2.49.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
