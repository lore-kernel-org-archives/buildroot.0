Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E7EC072A2
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 16:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F5E8402F3;
	Wed, 15 Nov 2023 16:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F5E8402F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5zH0xMP9kwxa; Wed, 15 Nov 2023 16:39:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69139402CA;
	Wed, 15 Nov 2023 16:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69139402CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F2DBF1BF333
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 16:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC1BB80EC3
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 16:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC1BB80EC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LJrH7v7KkBNg for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 16:39:52 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 194E780EA2
 for <buildroot@busybox.net>; Wed, 15 Nov 2023 16:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 194E780EA2
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40891d38e3fso52148755e9.1
 for <buildroot@busybox.net>; Wed, 15 Nov 2023 08:39:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700066390; x=1700671190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ezthcsez5o1mJRl9+FpZbnQPvC7ULVk7N8L/33pRY9s=;
 b=EmzjS9gRIp694ZQtMhUkMaePBD5COEUUVoXPVpdE2yKD5Jpc6oFAIrDIwl8QxgooLS
 oaXDHt/KePe52M8HuOEh8sJbEFxfj4RSzzk7h1JokfXD7e7WSmT6ky0yb0tMAZ4nPJZi
 w1xPLD8msfJlz/dt7dq6PgizLXLmVF1+Mdd6nVGrlBrrAqaB2iwboV5HIJN+wrIiBlIj
 aNcYdbkfNjuxq4FaVbpvuwbV8A9BobK3d/5RLdYF6Njr92pFVq+T8khYberUhAeM0XbM
 j1G1sN0ubxC1WXYR7RhTCcziQqgS5sRXG9kkTncJpZcah70naiazb4DZ2DlWO2ZQSzgE
 Odmw==
X-Gm-Message-State: AOJu0YxrMR9BOWZ7n7ddstqkliqlZGzU7ixYu6hS1zO5RCHAj0nb4guF
 MskfKlmi/84rkbq7u0QecCKd9/br15s=
X-Google-Smtp-Source: AGHT+IGG1DSwC3z0Y9YJ10fphGzgGm8reb++unL2RlbbbkZ8FueSdvJvktou0NrqFFr4CI+G9au3PQ==
X-Received: by 2002:a05:600c:1914:b0:405:3885:490a with SMTP id
 j20-20020a05600c191400b004053885490amr11357495wmq.0.1700066389814; 
 Wed, 15 Nov 2023 08:39:49 -0800 (PST)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 c10-20020a5d63ca000000b0032d81837433sm10954841wrw.30.2023.11.15.08.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 08:39:49 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 15 Nov 2023 17:39:03 +0100
Message-Id: <20231115163903.445858-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231115163903.445858-1-francois.perrad@gadz.org>
References: <20231115163903.445858-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700066390; x=1700671190; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ezthcsez5o1mJRl9+FpZbnQPvC7ULVk7N8L/33pRY9s=;
 b=EXQxVGOrf91ILYY3YP8+sBPmUMqTpCHrQ7zxfuKXmxaUKkiNHFM16W11Qw4uCxqV5e
 BZBeDUFum4CpE481ddAqwxFzbKRo2AKH4Z8iVTJyxxp16vHYKpCKOFyxfKG+bKLhShzj
 yzZ6XRKIyRGRg4LovoDXwBIX9YIqdqfo3Zb7tnM2RxWDS+IZMrRBROfq5Xaw8GQmbtFn
 af3d7UnFG03+2WUemg0ozNdWX83faukVj0Iz9zzGbO1lMho84hOTOCliZEnUt0mwr7D/
 51aTNHfyVs+ia7li89fggsmOujfvFz8E1pOYf4UIsoLHabdxtCcVm/S6yEZcF5CicEN+
 pWhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EXQxVGOr
Subject: [Buildroot] [PATCH 2/2] package/lua-testmore: bump to version 0.3.7
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

diff COPYRIGHT:
    -Copyright (C) 2009-2021 Francois Perrad.
    +Copyright (C) 2009-2023 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-testmore/lua-testmore.hash | 4 ++--
 package/lua-testmore/lua-testmore.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-testmore/lua-testmore.hash b/package/lua-testmore/lua-testmore.hash
index 1f435709f..634b95c6e 100644
--- a/package/lua-testmore/lua-testmore.hash
+++ b/package/lua-testmore/lua-testmore.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  b3e57955888aba3974d6f5a21219214e2803a38e4623671f7d9d9e0f1851e608  lua-testmore-0.3.6-1.src.rock
-sha256  37a3afb014325b98f0ad919cb40bc9d5a948120e5260e75b9d00c198d350da6d  lua-TestMore-0.3.6/COPYRIGHT
+sha256  acef148e10e312f262d9390c3cdbb9fdd3d5541f0dbeb4c35b8c37fbf95cb52f  lua-testmore-0.3.7-1.src.rock
+sha256  7cb577fd111373b813a9ec47e43c30cb318b771290e0b60e780b6a710116888d  lua-TestMore-0.3.7/COPYRIGHT
diff --git a/package/lua-testmore/lua-testmore.mk b/package/lua-testmore/lua-testmore.mk
index e3cc7b7bd..aaf2c1306 100644
--- a/package/lua-testmore/lua-testmore.mk
+++ b/package/lua-testmore/lua-testmore.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_TESTMORE_VERSION = 0.3.6-1
+LUA_TESTMORE_VERSION = 0.3.7-1
 LUA_TESTMORE_NAME_UPSTREAM = lua-TestMore
 LUA_TESTMORE_LICENSE = MIT
 LUA_TESTMORE_LICENSE_FILES = $(LUA_TESTMORE_SUBDIR)/COPYRIGHT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
