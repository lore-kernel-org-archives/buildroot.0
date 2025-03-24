Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F6BC3600C
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 09:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D1EB60BB0;
	Mon, 24 Mar 2025 09:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XfqyYhIFTIPd; Mon, 24 Mar 2025 09:44:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 483C660BA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 483C660BA0;
	Mon, 24 Mar 2025 09:44:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB7455E
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 09:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCA9F60B5C
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 09:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7QrBI-bnuC6 for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 09:44:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D49FC60BA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D49FC60BA6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D49FC60BA6
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 09:44:30 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ac24ec112fcso65450366b.0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 02:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742809468; x=1743414268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zGPy1lbMb5kNqW8h5yPcS4VXV1n+1FgwD2TmH4ooE4E=;
 b=BG03s/RTkIvqExeOe7pGQV2llTjLcNUUTPSzfIt0eVLz86Rs/m+IYcuaPA0zdPGHTk
 CwIgRJ4qru76A4u0dLJcEFJU2XmAbz+J1oPv79ql5uiL7Msvdy93L7dE9adY0/K4Ejos
 bt+ck4IL2NtRAszcXwhwrn1Fo1IkGJnDjoeW/ptU42twWvfsNABxT84wslrW5qde8EP0
 +pIbQ+dUZtOXA3PKL3g3PHOVMk+DCPEi5wK+uIFYtRnFcTi+qPpmgIkliAQMiTd49OUZ
 BGsvnS2z/EECMHvypCxKfQ74FATHCwrPIgMqYoDy9xM7IFVOdnaV1mDPEMbrRBj9LrVd
 ecJQ==
X-Gm-Message-State: AOJu0YyOjzDLGsiiht6BOS3/wpjYrHb0YaiOp4zpLTS/gseJT7g5pVAX
 1YkWaHxcPLeXU+Rn05rOvudQHay95nXJqW8BVKIy7gZAH0dPFGN78+CPUJLWWcf85Yf6wah6E8i
 R
X-Gm-Gg: ASbGncsbC75EnEIBzalxIvRkVi5Q6M4UrKWbWwp6LARJvBpeGl+UodyTqGBeH1cQm1e
 efMb0YoAREtXmw5yx4hXyDLVNia0fmZdLUiEK9RTvrcDzjS89CVuwUdIXwnzH2+aE5+G67Gtxtl
 uMdXENHmUgGuF8rfUCYM4vcVOazWo6BgbRruHJfopWgb/F3JywQnqQueaHBFJqiOdPgLWP0h99M
 RVDPIKHNpP3lnYJF8GDtCopkI65T9l0PiyCcTdBiamTkCS+mLxLNEC91KtcpqjwzYOrAYnkTcRJ
 J84+wgitETXN5G9qSuMYkhWmF2UXWA/dvd81S6dyq5iMQ0au1umjdBjb35kktSfwYHW4J92O8Vp
 n/LvL4IUqYGZu3jan68X/tDbmaCyJj0S8KrK2i4S9O9od6wGh90mMv78+U1nAgqM/gTrdutf2kr
 ku0vYBlJdqhg==
X-Google-Smtp-Source: AGHT+IEbibyHu5CvmjvZH1474drD4+Bee42gw/yDE7JWCgts4IIRfGqkriyzgKJQRaPO6m7f5BB6HA==
X-Received: by 2002:a17:907:d786:b0:ac1:e3f1:6584 with SMTP id
 a640c23a62f3a-ac3f224db81mr502477066b.7.1742809467942; 
 Mon, 24 Mar 2025 02:44:27 -0700 (PDT)
Received: from fedora.arnhem.chello.nl
 (2a02-a211-a140-6480-ea4e-3e0b-5fd4-931c.cable.dynamic.v6.ziggo.nl.
 [2a02:a211:a140:6480:ea4e:3e0b:5fd4:931c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3ef869fd6sm653841666b.19.2025.03.24.02.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 02:44:27 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 24 Mar 2025 10:44:21 +0100
Message-ID: <20250324094424.428727-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324094424.428727-1-adam.duskett@amarulasolutions.com>
References: <20250324094424.428727-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1742809468; x=1743414268;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zGPy1lbMb5kNqW8h5yPcS4VXV1n+1FgwD2TmH4ooE4E=;
 b=ctnbBS+MNGQA1wDNzVjL8OCtwshwuZ9uFNQOwEUWWm0oHzvvJsrXmrHEslVndW6RgP
 sG53s2cdO03YMtBwqdW67eyk8/c42gOHTyJqI4HTyl+mSZUm9z86u7xB9OTfLXiLLvTh
 Q0g+3bNhTUn9eYBlRt/LYqALXF7hAWbOFHmVA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ctnbBS+M
Subject: [Buildroot] [PATCH 2/5] package/depot-tools: bump to version
 097e20723774957f21ac6d1808fcd0a91e8c7630
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/depot-tools/depot-tools.hash | 2 +-
 package/depot-tools/depot-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/depot-tools/depot-tools.hash b/package/depot-tools/depot-tools.hash
index 9395b254cf..cd5e34d26e 100644
--- a/package/depot-tools/depot-tools.hash
+++ b/package/depot-tools/depot-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b4dfe43021f40b360e33a252fdb21b0bb31c9a25629b6000bff987e0e178dbc0  depot-tools-58625e82c685426d441be5b422c9ad88e4867d20-git4.tar.gz
+sha256  d281138bad9dab92f3f67f5d62f8d7fe02bccd9bef1ab2dae4acf93c712967bb  depot-tools-097e20723774957f21ac6d1808fcd0a91e8c7630-git4.tar.gz
 sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
index 3ae0055fd6..b62f844b90 100644
--- a/package/depot-tools/depot-tools.mk
+++ b/package/depot-tools/depot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEPOT_TOOLS_VERSION = 58625e82c685426d441be5b422c9ad88e4867d20
+DEPOT_TOOLS_VERSION = 097e20723774957f21ac6d1808fcd0a91e8c7630
 DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
 DEPOT_TOOLS_SITE_METHOD = git
 DEPOT_TOOLS_LICENSE = BSD-3-Clause
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
