Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9A9CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 06:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3258A40122;
	Sun, 15 Oct 2023 06:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3258A40122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SOS8D7WTEqAA; Sun, 15 Oct 2023 06:37:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 220CC40156;
	Sun, 15 Oct 2023 06:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 220CC40156
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5882C1BF2F1
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 06:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AFCC81EE5
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 06:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AFCC81EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bfNWFwMpRI-m for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 06:36:58 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CFB881494
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 06:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CFB881494
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53e70b0a218so1450588a12.2
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 23:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697351816; x=1697956616;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z1Ro7fRI0ZA6WyFaYu63k81TymTCe0d0ctaXEH7NG7k=;
 b=dw23WjFRBlEfJrgSjN/cQImlKCjAGGJ9ld/o28T8fE4DGzw9r55Thg9e7QVTCavAFy
 RTyZUnRcx0O1eyujKQGSlfdS++hOg9ZPzaFA4hgEQoYUfejPvmvi7JF3bl2E8247zWT3
 53cMAjwaK2uiw2k5gCpwPgiqbyQnVqOivuHI4X8mpl+t1Qw0JadO6wx4SSNoYAiRfqRY
 aBqtlXfhXBpZFR/bQubXJ4EwdCYqDNewVjHqYQvWcLT1u15utDWY+G68MNg0IE/inqBW
 GZuY1j6Qhgj+gEnSNUUm6WAE/W5Tk7ybthEAuiOgmHU4B9VqM6xOXDbFUsCkwecPwiZc
 jFnw==
X-Gm-Message-State: AOJu0Yym511HAAi/asFrCfFKDuTZlUttkYOr/31+5d8eSNfY2hNfuFNG
 k+aCZv8Qs3CIwjzMTK1zASohpz9Gw6k=
X-Google-Smtp-Source: AGHT+IFaD/3F0aZAENeHgrL9SaV/ohoyVsuVFCs5aqTLOSs/UwdbR+AykyIpSG47iFKcr2m6k64kTQ==
X-Received: by 2002:a05:6402:5bc1:b0:53d:f4f5:7ab0 with SMTP id
 gy1-20020a0564025bc100b0053df4f57ab0mr7156221edb.40.1697351815822; 
 Sat, 14 Oct 2023 23:36:55 -0700 (PDT)
Received: from localhost.localdomain ([98.128.186.118])
 by smtp.gmail.com with ESMTPSA id
 x64-20020a50bac6000000b0053e5edeff3bsm2310553ede.93.2023.10.14.23.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Oct 2023 23:36:55 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 08:36:46 +0200
Message-Id: <20231015063648.1360322-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697351816; x=1697956616; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z1Ro7fRI0ZA6WyFaYu63k81TymTCe0d0ctaXEH7NG7k=;
 b=Gb450ZG/0LX6CWxgHY46vCGOz09B0royFrqt07Rhq5aU6qEBy/dEjA+49uJGRaAa7o
 f+XGSdPTfwxp+M4NH5HS9UPkLoAkwq+iA6hWu1sTFv0AQZpa6XbbEGLWnQ19EHpHdEw/
 rYItwUghjk7qwM/EngsRenALzHtBG+vl2jbipssW+FpJXEJnoM+N6c3EzYK3YBTAa+lc
 qO/iljmfaePphF2TM7JCWPqTj+FgthZkXPalP/WCKXJrorEkcvXeCup93tgpnmyHb3QS
 RVQBSs2QmLlyguMh5F0DF5CluanC22cfL8NBp/i6akoz5R2MhMsQRZj8lXEnsxOUVRcB
 qvuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Gb450ZG/
Subject: [Buildroot] [PATCH 1/1] package/inadyn: bump to v2.12.0
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

New features and DDNS provider support (IPv64.net), but also a lot of
fixes to regressions introduced in v2.11.0, e.g.:

 - dynv6.com not working at all, regression in v2.11.0
 - Regression in DDNS provider names, introduced in v2.11.0:
   - dyndns@3322.org
   - dyndns@he.net
   - default@dynv6.com
   - ipv6tb@he.net

From https://github.com/troglobit/inadyn/releases/tag/v2.12.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/inadyn/inadyn.hash | 2 +-
 package/inadyn/inadyn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index 94af9f87b7..eb5249e371 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  9ddac7b6b0a1ed372c6cb5afaec6bea927ab539db02c8536dd10d73bd1d37c95  inadyn-2.11.0.tar.gz
+sha256  38fe00f20b293e64a89efc85f766ff40f0be3bcf9c3ed68b842104540a60806e  inadyn-2.12.0.tar.gz
 
 # Locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 3e346fd769..fa2eedc1f3 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.11.0
+INADYN_VERSION = 2.12.0
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
 INADYN_LICENSE = GPL-2.0+
 INADYN_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
