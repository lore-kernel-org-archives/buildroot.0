Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF68CDD1D5
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 20:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48A076071D;
	Mon, 30 Sep 2024 20:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JGFQsqFwxvSk; Mon, 30 Sep 2024 20:21:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34CD260703
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34CD260703;
	Mon, 30 Sep 2024 20:21:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68A351BF31E
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 20:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 572A14028D
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 20:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vCbUHUyZod62 for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 20:21:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8EE9C4027B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EE9C4027B
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EE9C4027B
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 20:21:46 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42cd74c0d16so44208495e9.1
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 13:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727727705; x=1728332505;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GRjohJOZArUGAXBG6eDqWSVa/DENpfoAWpR4h0SwnPU=;
 b=Rpw2z7Jcdunge0npqWV/z/CqTZe23lnUMKxRqPCDISDvxmN5TpEBYFcjSRq0PARKbT
 4uAVo2nWVAi2IVX4cMQuphLoI0ADyNvb/LbAFepYaO7/QtURpUPJtdcpGFAi+fuWdjZ8
 npIULB1OgYHKF0pZJrCBvsIi1kDt3bGxdZ4mG8KG4anejlCBYgZZS6TRiT2lavOZt4zl
 71C3Arwgfx2Mrn0njJbdwg/FTB5kNKP8UG9Sp58RtJ1ftmnHMvmfzzdoCexpjhH05egt
 3YCSoeEH0bZNsJo8dc0e9jAnAHXCLXi4UckUUjkfCNXdWbuGu5Zev+orZxlE7rMOwqdc
 TM4Q==
X-Gm-Message-State: AOJu0YxQUGg/GopfK3zPSdBRg3ztb90FybZMmO4+mUnmC05EHZCkFByh
 6ILrGEESJwfUADj2G0lbhMeoEczrlMVNKPDb1YG4a91aclMB8G+A4f/5QKiu/mT3yqlL2FCPv5h
 0Fu4=
X-Google-Smtp-Source: AGHT+IF4arvdUN9p1comjr4eUkV+ezK3L81NlTEOzaydtY8fGJHqxdKVsQ43JqfKaT/5B2Z3Li8sWw==
X-Received: by 2002:a05:600c:1d8a:b0:426:66a2:b200 with SMTP id
 5b1f17b1804b1-42f582a8be3mr104495175e9.0.1727727704728; 
 Mon, 30 Sep 2024 13:21:44 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.68])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm161456345e9.43.2024.09.30.13.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 13:21:44 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 30 Sep 2024 22:21:25 +0200
Message-ID: <20240930202125.13034-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1727727705; x=1728332505; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GRjohJOZArUGAXBG6eDqWSVa/DENpfoAWpR4h0SwnPU=;
 b=GRWXI0btpblDvhPxX1KUY2FAEj/mZK+xeSBEIJ7sT1F9wJ4sNAre2eyoLakWo/Mrbx
 JyIcCBRBeKiTNE8vs03FGnqFSPx+192ae+ihKGWL8mUFT4D7EpOAFbnanEyzLha03blf
 5E6WYDTatU0eyTSf8O5TUh4y2Zk3ALt2JXaW8GxzxtWdO5WdwdrucekyiubFsY/34D62
 Hpg2ovKnBOg2dX5LuZWyHhk9sfndxjYOQkI87635/MYmCfAk4cZpdyUPKsOTUSDyjkEE
 Jty7pPM/eCBaTMRvJjCRCbLDmiEwMKwyu2DAHInY9MR1yd6xpGZcpuEZfyKZosDBZ3Dt
 EVwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GRWXI0bt
Subject: [Buildroot] [PATCH 1/1 v2] package/gnuradio: fix build by removing
 unneeded package patch
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
Cc: Julien Olivain <ju.o@free.fr>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The gnuradio package patch 0001 was introduced in commit 81e6541ef
"package/gnuradio: fix build with fmt >= 11.x" [1] while Buildroot
was in a release client stabilization branch.
It was first in included in the 2024.08-rc2 tag. This is why the
gnuradio version was _not_ bumped at that time.

At the same time, the gnuradio package was also broken in the "next"
branch for the same reason. It was fixed by bumping the gnuradio
version in commit 101e7b69d "package/gnuradio: bump version to
3.10.11.0" [2] which contained the 0001 patch.

Both commits [1] and [2] are individually working. The gnuradio
package fails to build since the merge commit 3daa03752 "Merge branch
'next'" [3].

This commit fixes the issue by removing the package patch.

Fixes:
- http://autobuild.buildroot.org/results/dfda705bb1b3b975bde3d84c6b25a9b41c545c84
- http://autobuild.buildroot.org/results/7c32bd40b5e1420535734480bf5a4d4365b8896f
- https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800399

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/81e6541efe054df635947d0c143818f8cf7cb048
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/101e7b69da88148fa8333af05444e47bae631833
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/3daa037528c38b91caf616cb47992da7730f4343

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Julien Olivain <ju.o@free.fr>
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
