Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2326BCEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC48441401;
	Mon, 17 Nov 2025 20:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rqdYDqAJIFV; Mon, 17 Nov 2025 20:18:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D8384145C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D8384145C;
	Mon, 17 Nov 2025 20:18:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D20DDD5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8A2682907
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1usAC8AILVYY for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:18:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C39D88349A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C39D88349A
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C39D88349A
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:18:01 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6431b0a1948so8328297a12.3
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 12:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763410679; x=1764015479;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k1iJeDoI/wqAkQi/qZE9hK/8m08vU1RhArpwZmWOdOo=;
 b=Syupd8sy/kk4USi0AzuuTpwjautyw+g8ecDArL8f1iGuFLcZ4H1O5lJCKCOpn3wT32
 3Hv0OMURcbu2Hr5VNMWn9Ix0C2LLUeRtYioaAdZ+f9XaHZzaoQNRHcW5Az0gLaYJ2y/l
 mXOI0+NS1NwkPJ0Yy6E4rUKCANclPsmmn6vrvOCFceP1qfDNWxgxvIuY8G1kZlJ27vJa
 4tvtWeVyDsgsHeofJP3MF/weX4pzwhzUIUPBgLKjcVypnxQt9M5Ej1u4YVoh+Ks2UGi4
 QdlXGEWD9nuNzWB3kK/QtyM6QNthSfdhC8qP/t1z6SA03eSgoKeOaory7PMCxdDuYUnT
 yu4A==
X-Gm-Message-State: AOJu0YwREUBHh+qFKILGsQ+oBh/P8n9PcNgcv6MmHcdjyhpSPPJLhAK9
 YeiGH6+EeZNYncMo3MXcd07Dhe8p3Fww3ff+0DaYWvQook9HDvA9rx2lAgqlsa2NRQlKMXMzGek
 jvIsR
X-Gm-Gg: ASbGnctKWrmuWBKK8J7rftf/ui3XzBsfI9xhD18JnDWUFRSUbt9VeP0XtEaHJTo00mo
 QhaMVrB4PQhceMXz7h6u7AhbS4TN9mE8xWAD1dAEcIuxpBZoZ6p/kHfsVg7EnJ6qkNppyYES8id
 GKVVT2uCd/wkZVHa/Z2OFqygJeGm+sum2eWCab+CSlvhRkJrHdEwl8dQUyRX/cjhWzHSUdKRn92
 HqgVSllvWd7+TvGWrfYhusE1tIdzMQRgvLCITx8YZXzTRhbZAKdsYPrtY8gMvJAPN7HD5e06GbX
 8vjyiKqwUsJQ3LvVpL21NnbV+cMKOKXmIkyDG7m8kUU0jceft641ywb1PN1sW5FB39UNo45ltKV
 gKn4HunkEiEhwAggZXM2URBnenq5G85SqwyUnvFwb+otUIhWDKW4YVvjnzSwWJemQwzXcGAOeF2
 DEpw3NeWcdBGYABH4jn8rhM4A7SrDd0Mb3GNWUy5n+zXnecXZomaE4ognI9YId44buBplVzV105
 45VW4zszNmKNDjmoixBhAzPiJ/eIUxuGcc6Luh8l8x1Cfa80MqisIk=
X-Google-Smtp-Source: AGHT+IHu2LD94we/QusafcCFnhB/ARFnlX3VR5o4bFADIEckLuCIWB0lfuNZpXEFZNkT03I1EZZBfw==
X-Received: by 2002:a05:6402:42d4:b0:640:b736:6c2b with SMTP id
 4fb4d7f45d1cf-64350e9ff08mr13421431a12.28.1763410679420; 
 Mon, 17 Nov 2025 12:17:59 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-54-71-163.retail.telecomitalia.it. [79.54.71.163])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a49884dsm10809935a12.20.2025.11.17.12.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 12:17:59 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 17 Nov 2025 21:17:56 +0100
Message-ID: <20251117201756.3300239-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1763410679; x=1764015479;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k1iJeDoI/wqAkQi/qZE9hK/8m08vU1RhArpwZmWOdOo=;
 b=Q01H6KabK/HXT4YSHVlGHNlbzcArPr9489LwTi+YlAJ+epppVWeli2skiOlpOYtUWs
 AoyrJmmkVEdaSnW3fZRov5IjvGf5P7yYiiERbpF6MZw/Db8KATXPo9siPBHQvEshqcWr
 qvowse/K/QSSsTygKCXR6eP7VY17a4ban+ZNk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Q01H6Kab
Subject: [Buildroot] [PATCH 1/1] package/pocketpy: bump to version 2.1.4
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

Release notes:
https://github.com/pocketpy/pocketpy/releases/tag/v2.1.4

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/pocketpy/pocketpy.hash | 2 +-
 package/pocketpy/pocketpy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pocketpy/pocketpy.hash b/package/pocketpy/pocketpy.hash
index 0c96bf2a55c5..51d7f9c0b8e9 100644
--- a/package/pocketpy/pocketpy.hash
+++ b/package/pocketpy/pocketpy.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  7e2afd6eafcf72c5797492107558e4b1d6407dccd66e7da4a62b1054eddd2ce3  pocketpy-2.1.3.tar.gz
+sha256  3edf11645867fd41cf2e3cff24e3131a9ed9f6ccf8ada806dc2429f817e01f71  pocketpy-2.1.4.tar.gz
 sha256  9dab6fe9086f93847540387be578edc94b6b280004db5ed7c850ccf8f086fd66  LICENSE
diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
index d20e1e0e205e..c4a9aea8d2eb 100644
--- a/package/pocketpy/pocketpy.mk
+++ b/package/pocketpy/pocketpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCKETPY_VERSION = 2.1.3
+POCKETPY_VERSION = 2.1.4
 POCKETPY_SITE = $(call github,pocketpy,pocketpy,v$(POCKETPY_VERSION))
 POCKETPY_LICENSE = MIT
 POCKETPY_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
