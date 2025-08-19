Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A04CA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 14:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 489E640BAA;
	Tue, 19 Aug 2025 14:03:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KXMpAimIOnq; Tue, 19 Aug 2025 14:03:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 657C540B98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 657C540B98;
	Tue, 19 Aug 2025 14:03:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E6C3E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 14:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0860840B98
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 14:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4uFzC5CIURx for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 14:03:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A70240B35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A70240B35
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A70240B35
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 14:03:38 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45a1b001f55so24712895e9.0
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 07:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755612216; x=1756217016;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FT1OK5HiApKE+XTIWyOJuPnmID4LpoirsAvGlAOht1E=;
 b=FnIJKv72neBKY2Ip9PjjY4BOYBD5XTgvQ+YDbHNp/Rp5/hGdie5OLoOIFC+YxNSlCa
 2oBsMr6q42kmFw0Z5eWniOJ/QnteI50FoRJ7qXvulFGmOqVVtrT9E8QwWrgjJQmH9WAM
 YsebazUPYnpFVtTr/HROVlDGZ1cRiZMl3g6o2qCEiVCV71HX76GGq/6gIM6fFoLGTVFu
 ZyKilTk21W8grHSr5sPuiUNnf/02VZPIGjQedb5j65ArwDPusEIiVLL8DjJIKpwEH931
 PH0ynZMWdpGhF07QJnC2O0njv9uVY5v8LFA7RThPa3C+GP/IWREPAcS2k4a9lGHf1On4
 JeNQ==
X-Gm-Message-State: AOJu0YzXRbZhhGbLyEc2Ohhum6NB9dhWsqrqap0HnK90TcwBzBxwMrxn
 YkjML6k+MqDwLLkW7wPB3kHVouJ65ACqQkKsuofo2iMhFRqHTEm9DcrPrKY7fNRL
X-Gm-Gg: ASbGncs4k9wC8yNJib72OthIyZKOGW1ibPVnlSsfyGIBx+4pXrJOmevH0Ne67Xc3ue3
 BVTmGkQqWeMsG2Z8Ws9NBBRRjtkCnL9OzGTVlEbZn9zmHCODSN+wISWgn6Z2QyOsxloKEZbQDd9
 2ye3Os9PuffGP/NR7m+uvLuRgvMEa3JhJKnzE/FZ2x4ttKTKjBMQuQWRjFDXkjfC6wGWIol6YXz
 4genL/c/zVg2BhYfsyx8qogkQ2Cud650Ndeg0u6v5+0wdnwGqFt/91xNnEfdMDPaNStfHWp90ar
 5Tm5B61ZXNXyL94LzuvOF2xj8hnOIfINTU300Z882SOahWq9+cBsWdzz5y1yVdYyhUFF/7gklC7
 tyvFGMK4x2juu+rjdxEPjg9imWpFz4IbjaQeBRQN7SPQuNw==
X-Google-Smtp-Source: AGHT+IHUSOFhE0YnQ3bZPx0N2NFtieeuSHf6i8SNlr4Akgymm5jMxpf2GDma0EVPrcW/dNrbpFtMrQ==
X-Received: by 2002:a05:600c:198e:b0:458:c045:ee99 with SMTP id
 5b1f17b1804b1-45b43e129c9mr19179935e9.28.1755612215516; 
 Tue, 19 Aug 2025 07:03:35 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b42a97c02sm46563695e9.23.2025.08.19.07.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 07:03:35 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 19 Aug 2025 16:03:31 +0200
Message-Id: <20250819140331.1518506-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755612216; x=1756217016; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FT1OK5HiApKE+XTIWyOJuPnmID4LpoirsAvGlAOht1E=;
 b=a1qlxMbfkcCGmDJzhrsFN70lvzU+WLpWsgixxZDR1IPtpUfrC7b+aRe1YsR8M1zQZy
 W3mIvzPD5sW2AEJucPjAxfjLKRigpccQ8r4v5YtmwtcQvkNvq//5QapHQKAE2hpi82+r
 ura8KeiQhekXUxE7mcmLR5QISdsASzL/wyb6VNO7WFRQq2YnCjkXcOMHlinbMPJO+XWZ
 pIJzjIh9L7Me+wcEMA3UP19WWLIHnY+hLJhCxKziyIB9j9GkTWhFZFqLSoCXktK3G40Y
 QsbFIWzgYNmK1R9fPh4oKqpJtqISqy54KMcMgRe4JMMTca+Vx/Xbm3EaDcze1sFakQx9
 v5Jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a1qlxMbf
Subject: [Buildroot] [PATCH v2] package/jq: security bump to version 1.8.1
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

Changelog:
https://github.com/jqlang/jq/releases/tag/jq-1.8.1

COPYING:
Add LICENSE notice of NetBSD's strptime() to COPYING

Fixes the following security issues:

- CVE-2025-49014
  Fix heap use after free in f_strftime, f_strflocaltime.

- GHSA-f946-j5j2-4w5m
  Fix stack overflow in node_min_byte_len of oniguruma.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---

v1->v2:
* Updated COPYING hash (Thomas P)

 package/jq/jq.hash | 4 ++--
 package/jq/jq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jq/jq.hash b/package/jq/jq.hash
index 344f73d463..4596134620 100644
--- a/package/jq/jq.hash
+++ b/package/jq/jq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  91811577f91d9a6195ff50c2bffec9b72c8429dc05ec3ea022fd95c06d2b319c  jq-1.8.0.tar.gz
-sha256  ea9e53f5974239869c51ace8bb6849c9751dee7c9d592180957987a1a133caff  COPYING
+sha256  2be64e7129cecb11d5906290eba10af694fb9e3e7f9fc208a311dc33ca837eb0  jq-1.8.1.tar.gz
+sha256  ad2b4a266b2268939c1446979759706077421cf906a203aa188c6f396e8cfd74  COPYING
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index f3f4704f37..3077a76b17 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQ_VERSION = 1.8.0
+JQ_VERSION = 1.8.1
 JQ_SITE = https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)
 JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
