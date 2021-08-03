Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E6EC4320A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 16:04:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14A2361078
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 16:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14A2361078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1B42607C0;
	Tue,  3 Aug 2021 16:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SpiAHyETvgZB; Tue,  3 Aug 2021 16:04:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ED2A60658;
	Tue,  3 Aug 2021 16:04:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 186E91BF304
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 16:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05D45402E1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 16:04:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MRt3XNo5z2YW for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 16:04:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31483402CC
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 16:04:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F05C483F2A; Tue,  3 Aug 2021 16:04:04 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 17:56:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14377e38871704554f1dc324b690de5d7ef3c029
X-Git-Newrev: 4b2be770b8a853a7dd97b5788d837f0d84923fa1
X-Patchwork-Hint: ignore
Message-Id: <20210803160404.F05C483F2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ripgrep: add workaround for cargo
 bug #3349
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=4b2be770b8a853a7dd97b5788d837f0d84923fa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To fix this bug we have to use an undocumented test variable to enable
the nightly target-applies-to-host feature so that the target linker
doesn't get used for host binaries like the build-script.

Fixes:
error: failed to run custom build command for `ripgrep v0.8.1 (/home/buildroot/buildroot/output/build/ripgrep-0.8.1)`

Caused by:
  process didn't exit successfully: `/home/buildroot/buildroot/output/build/ripgrep-0.8.1/target/release/build/ripgrep-59eeb7069534e1ef/build-script-build` (exit status: 1)
  --- stderr
  /home/buildroot/buildroot/output/build/ripgrep-0.8.1/target/release/build/ripgrep-59eeb7069534e1ef/build-script-build: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found (required by /home/buildroot/buildroot/output/build/ripgrep-0.8.1/target/release/build/ripgrep-59eeb7069534e1ef/build-script-build)

Details:
https://github.com/rust-lang/cargo/issues/3349
https://github.com/rust-lang/cargo/pull/9322

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ripgrep/ripgrep.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 2cc578383d..450bb020e3 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -11,11 +11,14 @@ RIPGREP_LICENSE_FILES = LICENSE-MIT
 RIPGREP_CPE_ID_VENDOR = ripgrep_project
 
 RIPGREP_DEPENDENCIES = host-rustc
-RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
+RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo \
+	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
+	CARGO_TARGET_APPLIES_TO_HOST="false"
 
 RIPGREP_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(RIPGREP_CARGO_BIN_SUBDIR)
 
 RIPGREP_CARGO_OPTS = \
+	-Z target-applies-to-host \
 	--target=$(RUSTC_TARGET_NAME) \
 	--manifest-path=$(@D)/Cargo.toml
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
