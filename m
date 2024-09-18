Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D25CDD541
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 15:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D48B401EB;
	Wed, 18 Sep 2024 15:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXV2_QLk1i2w; Wed, 18 Sep 2024 15:19:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40018402E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40018402E0;
	Wed, 18 Sep 2024 15:19:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C6741BF5A5
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 15:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 288A360A3D
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 15:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7lMUwjNHxkK for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 15:19:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0FC7E608D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FC7E608D9
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FC7E608D9
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 15:19:22 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so755847066b.3
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 08:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726672760; x=1727277560;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WfByFlJKTEWnWztYvxn48rwvN3nGs3qOljGLY8xZuE0=;
 b=uLZSA8vQTazvk85sL4qN6QNhX7A5UE1quV1ym5aQ9XGDyDBvsp06sv/I8GzcYjDF1O
 ySjYs/yexpUu7CuvE3PvEMLlcp585hup7GRJtqTltxkEMkWXSp8Ml6covBRKQew4tkhe
 Yo8Mx+oqX9aW8421dF+WQkcg1i7W5yPLA7gXJ2kJnXde6faiZLd6IPu2XSHJ8vOdhj17
 178ZrznNzCAvWEqyiBx6/8H/t0GIpmf3woYlOKmiQJWsRzZLl9BgEj/0TPNJIoI6ED5O
 ttqznsRYLLlnZBHeu7jd1XHd+cJLxCQ2L6X+HX78S1b8SLl7T7g/xtsBWaQfPsf22H4X
 yz3w==
X-Gm-Message-State: AOJu0YyHnJJ5Dr3aWjMB1QA9aA6yYr6dfg4XLVDqE6lmB3f/p/cKwDEs
 Z14hjeXuR2exn/sng66/bFwiSr0vVxgxVgLJEVTsT7YLr9b5bOIZBZvK6lp9HVHaLtRtVJUG6An
 B5NU=
X-Google-Smtp-Source: AGHT+IHa2PMXmRvBMmOqcRPi/SX9FrzUGNUPQBxErmjqwIQxXnKEt34XW9px6c/X5DOdoP8AK4IZGA==
X-Received: by 2002:a17:907:2da9:b0:a86:7fc3:8620 with SMTP id
 a640c23a62f3a-a9047d357e8mr1866136366b.31.1726672760509; 
 Wed, 18 Sep 2024 08:19:20 -0700 (PDT)
Received: from localhost.localdomain ([193.32.29.227])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061330c73sm596528466b.208.2024.09.18.08.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 08:19:20 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 17:18:36 +0200
Message-ID: <20240918151836.909590-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726672760; x=1727277560; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WfByFlJKTEWnWztYvxn48rwvN3nGs3qOljGLY8xZuE0=;
 b=UILrqAjAd4tLxyQcRjkjE+swRJdNuJqxkDn/d/rhFphjFGv1cWsUpxqACKVqQdh083
 3IpNL2QDu975Z1r8+NKGXFuLUEEVD3+bQzgEREXV4wyb2/YPyh2MOWNToDijRCeN02di
 kj09Vxue8DDdtEMb63NXj4IP1y0NOxd3ZW7wYHOW0hQLDCWxWI4ct+owGV/50Um2B+M2
 1x7LvEHQDgkRLDtr/vGSQ1Z5zpE6jMoOa1u9+sz3JJC2Lx80WU1BoQnjueAjwK+wrdD2
 C9eflNtZbuli1gD8tyFYm0w6S9zYcQ+67AwIXqoSFMAfWM7s5zQ225Oou/GeiOeJSHJe
 bD5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UILrqAjA
Subject: [Buildroot] [PATCH 1/1] package/gnuradio: fix v3.10.11.0 bump
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With GNURadio bump to v3.10.11.0, this patch is now part of that release.
See https://github.com/gnuradio/gnuradio/commit/ead459813367e7fd679dad067d1b020010d49b4f

Fixes:
  - http://autobuild.buildroot.org/results/dfd/dfda705bb1b3b975bde3d84c6b25a9b41c545c84/
  - http://autobuild.buildroot.org/results/7c3/7c32bd40b5e1420535734480bf5a4d4365b8896f/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...o_signature-include-spdlog-ranges.h-.patch | 38 -------------------
 1 file changed, 38 deletions(-)
 delete mode 100644 package/gnuradio/0001-blocks-runtime-io_signature-include-spdlog-ranges.h-.patch

diff --git a/package/gnuradio/0001-blocks-runtime-io_signature-include-spdlog-ranges.h-.patch b/package/gnuradio/0001-blocks-runtime-io_signature-include-spdlog-ranges.h-.patch
deleted file mode 100644
index 6a08b8edee..0000000000
--- a/package/gnuradio/0001-blocks-runtime-io_signature-include-spdlog-ranges.h-.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 03c9a40883e610e54b8fc3c3ce1842d68d7ce2e4 Mon Sep 17 00:00:00 2001
-From: Kefu Chai <tchaikov@gmail.com>
-Date: Mon, 15 Jul 2024 09:27:16 +0800
-Subject: [PATCH] blocks,runtime: io_signature: include spdlog/*/ranges.h for
- using fmt::join()
-
-fmt::join() was moved into fmt/ranges.h since fmt 11, so let's
-include the corresponding header in spdlog for using it.
-
-Signed-off-by: Kefu Chai <tchaikov@gmail.com>
-(cherry picked from commit 19b070051c1c2b5fb6f2da8fb6422b27418c3dfa)
-Signed-off-by: Jeff Long <willcode4@gmail.com>
-Upstream: https://github.com/gnuradio/gnuradio/commit/ead459813367e7fd679dad067d1b020010d49b4f
-[Julien: backported commit ead45981 from v3.10.11.0]
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- gr-blocks/lib/message_debug_impl.cc | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/gr-blocks/lib/message_debug_impl.cc b/gr-blocks/lib/message_debug_impl.cc
-index 1e81aec0d..415d2be97 100644
---- a/gr-blocks/lib/message_debug_impl.cc
-+++ b/gr-blocks/lib/message_debug_impl.cc
-@@ -14,6 +14,11 @@
- #include <pmt/pmt.h>
- #include <spdlog/common.h>
- #include <spdlog/fmt/fmt.h>
-+#if __has_include(<spdlog/fmt/ranges.h>)
-+#include <spdlog/fmt/ranges.h>
-+#elif __has_include(<spdlog/fmt/bundled/ranges.h>)
-+#include <spdlog/fmt/bundled/ranges.h>
-+#endif
- #include <functional>
- #include <utility>
- #include <vector>
--- 
-2.46.0
-
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
