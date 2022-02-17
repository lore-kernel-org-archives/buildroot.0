Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305B0C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 23:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FCD4400AB;
	Thu, 17 Feb 2022 23:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GgdaXCEdet4a; Thu, 17 Feb 2022 23:07:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8711940A01;
	Thu, 17 Feb 2022 23:07:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45A0D1BF4DB
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 23:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3464D8401A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 23:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=h6t.eu
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hsGYUiws47PG for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 23:07:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.h6t.eu (mail.h6t.eu [159.69.47.87])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D70E784019
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 23:07:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AAFDDE9D98; Fri, 18 Feb 2022 00:06:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=h6t.eu; s=dkim;
 t=1645139224; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=4tZ1ssIIVGhpYl4FKThkZVMnTrIk0gSyWtpffQRns8Q=;
 b=noxO1UnP8wTAzgUNTf68v1kUVmd/IDk/wgHHCo3/sJqXaweAHkgvQMfTzcR3mYZNnTGaV9
 nQnB8/0rBLS8T6lQfRQOHfF4V/mWFUc3pPU4dIWubuKEwu9P83JkwKtpDnAZlw8bci8ync
 VxA8DOTaNupq2UZ0NDfMSuVnbiJNYmWhYhAzz+abP0S9aN6C3LLYgvh2EK/HZ5QxFMMP0i
 3Cu8Sx3z9z6Uforbf0A12R9ciYJTYUgpMFNp0JCSATo6BAO0Y4bU7aq1snOh67ryNTV32q
 tbkCpg5/8AUPlu85ueJ+U8ao9HCLXgzZTnuj1HLlX4iSErYwTDYDgf2FPCc8Yw==
To: buildroot@buildroot.org
Date: Fri, 18 Feb 2022 00:06:38 +0100
Message-Id: <20220217230638.98748-1-moritz@h6t.eu>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/1] package/pkg-cargo.mk: fix building cargo
 packages on 32bit arm
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

there are duplicated symbols between rustc and gcc. Specifying
--allow-multiple-definition to the linker as workaround until
rustc is fixed.

rust-lang issue: https://github.com/rust-lang/compiler-builtins/issues/420

Fixes: http://autobuild.buildroot.net/results/53f/53f5598b8e520caaa135fb4923c09da382dab329
Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
---
 package/pkg-cargo.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index e74a8358bc..71d695d926 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -46,6 +46,14 @@ PKG_CARGO_ENV = \
 	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
 	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
 
+#
+# This is a workaround for https://github.com/rust-lang/compiler-builtins/issues/420
+# and should be removed when fixed upstream
+#
+ifeq ($(NORMALIZED_ARCH),arm)
+	PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
+endif
+
 HOST_PKG_CARGO_ENV = \
 	$(PKG_COMMON_CARGO_ENV)
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
