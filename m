Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB793C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 09:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D28140604;
	Wed, 19 Oct 2022 09:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D28140604
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-QsF25HJwiI; Wed, 19 Oct 2022 09:12:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 427D1403B7;
	Wed, 19 Oct 2022 09:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 427D1403B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4ED521BF28A
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 09:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36F77402F3
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 09:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36F77402F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id upESWyO-i5GQ for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 09:11:59 +0000 (UTC)
X-Greylist: delayed 00:10:00 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D17CC40154
Received: from mail.h6t.eu (cloud.h6t.eu [IPv6:2a01:4f8:1c1e:8216::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D17CC40154
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 09:11:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 203E02147B1; Wed, 19 Oct 2022 10:54:03 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 10:53:53 +0200
Message-Id: <20221019085353.8864-1-moritz@h6t.eu>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=h6t.eu; s=dkim; 
 t=1666169643; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=CzUgO8doHh5a3aYuADrtwBCClugg6pA186zWMf52KPM=;
 b=LAnLU9k+QwP8gw3b9s1Ft7KZOYTtMG3oOarQSkXb53aUnoFdr9+cSzyRnX29nSrO3Pmq0N
 +7JI8s6w+phjlYknAkdwWFtQiZIJ657kO61L3RsAu6kjawQrjOCA87P0avItrDpLu3vZoa
 iPmauJ3Bj9nxgo8hShjFIIg019cjWyjZJaA0GOP6ptcds1SQCuzovdb2rtWh5SgIe0G2L0
 07fBQlZGf4nGc4CYwqAzQcmF5VWXqlxkxaV90YM+V7hCf5VMVSzVjEtzUUCyj5vRBoe4zy
 PZA99ErXEyj2jjUae+ptWXkWxDJly71ifh86qAcOb8CuEBaxXuzO19LVF7voxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=h6t.eu header.i=@h6t.eu header.a=rsa-sha256
 header.s=dkim header.b=LAnLU9k+
Subject: [Buildroot] [PATCH 1/1] package/pkg-cargo.mk: fix handling of debug
 and runtime debug builds
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
From: Moritz Bitsch via buildroot <buildroot@buildroot.org>
Reply-To: moritz@h6t.eu
Cc: Moritz Bitsch <moritz@h6t.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Moritz Bitsch <moritz@h6t.eu>

* when not supplying --release to cargo various optimizations get disabled,
  resulting in slower runtime: use BR2_ENABLE_RUNTIME_DEBUG

* Debug symbol generation can be controlled with the RUSTFLAGS variable:
  add -g to RUSTFLAGS for debug symbols

Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
---
 package/pkg-cargo.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index f7e3f39503..7ce7867f67 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -51,9 +51,15 @@ PKG_CARGO_ENV = \
 # and should be removed when fixed upstream
 #
 ifeq ($(NORMALIZED_ARCH),arm)
-	PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
+	PKG_CARGO_RUSTFLAGS += -Clink-arg=-Wl,--allow-multiple-definition
 endif
 
+ifeq ($(BR2_ENABLE_DEBUG),y)
+	PKG_CARGO_RUSTFLAGS += -g
+endif
+
+PKG_CARGO_ENV += RUSTFLAGS=$(subst $(space),$(comma),$(strip $(PKG_CARGO_RUSTFLAGS)))
+
 HOST_PKG_CARGO_ENV = \
 	$(PKG_COMMON_CARGO_ENV)
 
@@ -119,7 +125,7 @@ define $(2)_BUILD_CMDS
 		$$($(2)_CARGO_ENV) \
 		cargo build \
 			--offline \
-			$$(if $$(BR2_ENABLE_DEBUG),,--release) \
+			$$(if $$(BR2_ENABLE_RUNTIME_DEBUG),,--release) \
 			--manifest-path Cargo.toml \
 			--locked \
 			$$($(2)_CARGO_BUILD_OPTS)
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
