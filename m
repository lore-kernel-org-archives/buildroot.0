Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3340C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 11:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68EC3403C0;
	Mon, 12 Aug 2024 11:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnNlJHsMUZJG; Mon, 12 Aug 2024 11:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 329F5403C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 329F5403C2;
	Mon, 12 Aug 2024 11:27:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 569821BF2A5
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 11:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43D7F403C7
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 11:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sO59k-96nja for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 11:27:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 404B1403C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 404B1403C0
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 11:27:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AEFF84AE9; Mon, 12 Aug 2024 11:27:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 13:20:18 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: d9bddddd2341cd8dd841a09884c808b6e57af5de
X-Git-Newrev: 65af7b6ee47a5eb611441e52210a7912c4124dcc
X-Patchwork-Hint: ignore
Message-Id: <20240812112738.3AEFF84AE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/pkg-cmake: remove
 override of CMAKE_ASM_COMPILER
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

commit: https://git.buildroot.net/buildroot/commit/?id=65af7b6ee47a5eb611441e52210a7912c4124dcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

CMAKE_ASM_COMPILER is supposed to point to a compiler wrapper (i.e.
gcc), _not_ to as directly. If it is not set, it will use the value of
CMAKE_C_COMPILER. That's exactly what we want, so there is no need to
set CMAKE_ASM_COMPILER at all.

For target, we don't set CMAKE_ASM_COMPILER either.

Setting CMAKE_ASM_COMPILER leads to build failures for any package that
actually tries to build .S files for the host - like llvm. This is why
llvm has an override for it.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 22af5f2939089b996aeda9ce072ab2f9b3ee6c2d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-cmake.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 8f391eb4c9..c7032312fb 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -147,7 +147,6 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
 		-DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
 		-DCMAKE_SHARED_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
-		-DCMAKE_ASM_COMPILER="$$(HOSTAS)" \
 		-DCMAKE_C_COMPILER="$$(CMAKE_HOST_C_COMPILER)" \
 		-DCMAKE_CXX_COMPILER="$$(CMAKE_HOST_CXX_COMPILER)" \
 		$(if $$(CMAKE_HOST_C_COMPILER_LAUNCHER),\
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
