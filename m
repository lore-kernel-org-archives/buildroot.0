Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CFBCDB483
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 17:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E036783EF7;
	Thu, 19 Oct 2023 17:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E036783EF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nPgIKauyks3b; Thu, 19 Oct 2023 17:27:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 260F183EE6;
	Thu, 19 Oct 2023 17:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 260F183EE6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 065CD1BF368
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 17:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E097483EFD
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 17:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E097483EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HHI8dszLCRL3 for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 17:27:23 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0856783EE6
 for <buildroot@busybox.net>; Thu, 19 Oct 2023 17:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0856783EE6
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53d8320f0easo14000034a12.3
 for <buildroot@busybox.net>; Thu, 19 Oct 2023 10:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697736441; x=1698341241;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TWvDR9KZwXc3bVLH/YYv0amKW6mhBAxWqeSelF0RcyM=;
 b=dkRJ1Z+Q2etBN2AC1gDEu0IGlqXqbd+YlmBSao5j+sGWRwFHQBrb1QC1SDNhQKEN9k
 cvtoJLJuXaz4EjjCbyprJO+iAREk+oarp/BzQAPjctxxv4ouATFOz95Fv2MAzbv2ZRh6
 WkrBhw3RT16SRE5xU9L/pGF/0B6DoBnao7EMulIwHRhWoTPJmfSYNU/T4U/Zhpmmb8lA
 nAaJ95+5yNL1dD1Ih1DQxEh5A9+U0Icoa3l+6QMLlDZAX1SeBxgMTyFBip5IBA1xodDt
 7O2pgaeSPdRIOVcHrlpgDQsrs9eio67Bf1d7LzOe80FBR1pSVDZr3LlN+n065HL49qdJ
 UKlQ==
X-Gm-Message-State: AOJu0YwmwmKQbbgLOYbMlJfbj798cTdMZ+xbrZhQR5dAJbJeEgcPDccT
 KAIQPPH4llh+DiBN+bXnQjVuZj1cLOw=
X-Google-Smtp-Source: AGHT+IEHKpKzCPpCYe+V5Q1SKD9aQxbEt4IKk08ld7KWjEOckyw6LcNrws2VtoPPBn/IVCAuoIT86A==
X-Received: by 2002:a17:906:dac4:b0:9c4:4b20:44a4 with SMTP id
 xi4-20020a170906dac400b009c44b2044a4mr2298104ejb.48.1697736440782; 
 Thu, 19 Oct 2023 10:27:20 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 u27-20020a170906109b00b0099bcd1fa5b0sm3841448eju.192.2023.10.19.10.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 10:27:20 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu, 19 Oct 2023 19:27:16 +0200
Message-Id: <20231019172716.40836-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697736441; x=1698341241; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TWvDR9KZwXc3bVLH/YYv0amKW6mhBAxWqeSelF0RcyM=;
 b=Ks++RzQ0EZZehK7TgkowsISK9GHZ1FEUklKb6rHtX4ifDF5Qg+JXKz6tlFb4Sq1gkV
 GvTO1LsMJ2de76q2pprq7gCAsO5PKVg1fY3MaSoGvXRWZ0T3jVmLM7NyX5NLahvtN5+j
 39tPY4iZfWVbDgG4Ka27XlF9O4llXfvAdJDtURQgWK9RGSIPYR6Rvd4Z5zCYTRKc85LY
 +z12DCK1VLoRg5dYFD4o4HgNZUGUZHvildldDFSE48bvhs8p0p1hWzSxN+tfsH+vEWeM
 JCDECH02DQjpm3qXR5dAjKZxNaC9xfpjT76wdasNx8sAvvoRI2mK7ZqmBwK13HXcen80
 s1CQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ks++RzQ0
Subject: [Buildroot] [PATCH] package/janet: bump to version 1.32.1
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
 package/janet/janet.hash | 2 +-
 package/janet/janet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 15eaafc48..148b55d95 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  2ac3f69842f3e805a8d072a9e36f207f6287f063654c51cb3cd2b6e73b1cadf6  janet-1.29.1.tar.gz
+sha256  ac74444f1b545830c34738fe9ebb58c865ea4b819b0b0c3124315c646d9ce4cb  janet-1.32.1.tar.gz
 
 # Locally calculated
 sha256  95fca700e8dce9699248e7cc80ac88ce2357874c8352cd2be4d18f183dc9710b  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 9c87ba79f..aa7d85fd5 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.29.1
+JANET_VERSION = 1.32.1
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
