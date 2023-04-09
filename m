Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D15C77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 19:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A51828210E;
	Sun,  9 Apr 2023 19:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A51828210E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z2SXOZztfniH; Sun,  9 Apr 2023 19:44:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB3E481EBC;
	Sun,  9 Apr 2023 19:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB3E481EBC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8877B1C39F4
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 19:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F5BE40374
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 19:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F5BE40374
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DASzU3nC1em5 for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 19:44:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF49A40151
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 19:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF49A40151
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 987BA83B78; Sun,  9 Apr 2023 19:44:20 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Apr 2023 21:28:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39b5d5eb13013ec013bfdde6f22afb8181356ffa
X-Git-Newrev: d775b2ac05d473db490d2dc6babd2743b28cfbf5
X-Patchwork-Hint: ignore
Message-Id: <20230409194420.987BA83B78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-cargo: set RUSTFLAGS for host
 in HOST_PKG_CARGO_ENV
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

commit: https://git.buildroot.net/buildroot/commit/?id=d775b2ac05d473db490d2dc6babd2743b28cfbf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move RUSTFLAGS for host builds to HOST_PKG_CARGO_ENV so that they
are set for host cargo builds which don't use the cargo infrastructure,
e.g. python packages that include rust code.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-cargo.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 666c5ac971..5600c8e97e 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -57,7 +57,8 @@ ifeq ($(NORMALIZED_ARCH),arm)
 endif
 
 HOST_PKG_CARGO_ENV = \
-	$(PKG_COMMON_CARGO_ENV)
+	$(PKG_COMMON_CARGO_ENV) \
+	RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))"
 
 ################################################################################
 # inner-cargo-package -- defines how the configuration, compilation and
@@ -130,7 +131,6 @@ else # ifeq ($(4),target)
 define $(2)_BUILD_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
 	$$(HOST_MAKE_ENV) \
-		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
 		$$(HOST_CONFIGURE_OPTS) \
 		$$(HOST_PKG_CARGO_ENV) \
 		$$($(2)_CARGO_ENV) \
@@ -171,7 +171,6 @@ ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
 	$$(HOST_MAKE_ENV) \
-		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
 		$$(HOST_CONFIGURE_OPTS) \
 		$$(HOST_PKG_CARGO_ENV) \
 		$$($(2)_CARGO_ENV) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
