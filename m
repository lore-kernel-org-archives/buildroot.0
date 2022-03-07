Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F309BC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC0E941720;
	Mon,  7 Mar 2022 21:24:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8WCljwN01pGs; Mon,  7 Mar 2022 21:24:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E655041721;
	Mon,  7 Mar 2022 21:24:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C9821BF982
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78C3840475
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LMj_eYVpvKFv for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:24:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB271403A4
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:24:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E45B480118; Mon,  7 Mar 2022 21:15:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 22:21:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08f6960f53b84c6e333548b99fff04928aa454e1
X-Git-Newrev: f439f7c60b3734d3920c32aee027c2cb73621682
X-Patchwork-Hint: ignore
Message-Id: <20220307211545.E45B480118@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-cargo.mk: fix building cargo
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f439f7c60b3734d3920c32aee027c2cb73621682
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are duplicated symbols between rustc and gcc. Specifying
--allow-multiple-definition to the linker as workaround until
rustc is fixed.

rust-lang issue: https://github.com/rust-lang/compiler-builtins/issues/420

Fixes: http://autobuild.buildroot.net/results/53f/53f5598b8e520caaa135fb4923c09da382dab329
Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-cargo.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 6f5125f1d4..f7e3f39503 100644
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
