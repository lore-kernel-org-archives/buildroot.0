Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4643AC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5E9D84396;
	Mon, 20 Feb 2023 23:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5E9D84396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jEiTnmLwsGY1; Mon, 20 Feb 2023 23:50:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12D368439E;
	Mon, 20 Feb 2023 23:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12D368439E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9C81BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC6064178B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC6064178B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X-2yf2W-IWje for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE68841782
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE68841782
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E98C686495; Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 21:54:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e9fb89785b9bbf4a3f7dba9e511332ba9b068146
X-Git-Newrev: 730e50f520d15c6522153381e8fba57421e78d79
X-Patchwork-Hint: ignore
Message-Id: <20230220205243.E98C686495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/flatbuffers: build
 position independent code
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=730e50f520d15c6522153381e8fba57421e78d79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The upcoming tensorflow-lite package requires flatbuffers to be
built with position independent code.

Fixes:
/home/buildroot/buildroot/output/per-package/tensorflow-lite/host/bin/../lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: /home/buildroot/buildroot/output/per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libflatbuffers.a(util.cpp.o): relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZN11flatbuffers11CharToUpperEc' which may bind externally can not be used when making a shared object; recompile with -fPIC

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flatbuffers/flatbuffers.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 9d286bf9e1..487d85ee1f 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -14,6 +14,7 @@ FLATBUFFERS_DEPENDENCIES = host-flatbuffers
 
 FLATBUFFERS_CONF_OPTS += \
 	-DCMAKE_CXX_FLAGS="-std=c++11" \
+	-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
 	-DFLATBUFFERS_BUILD_TESTS=OFF \
 	-DFLATBUFFERS_FLATC_EXECUTABLE=$(HOST_DIR)/bin/flatc
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
