Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F70C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 08:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 780B54091B;
	Tue,  4 Jan 2022 08:28:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gFLG1jDueJoG; Tue,  4 Jan 2022 08:28:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDF5D408E4;
	Tue,  4 Jan 2022 08:28:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 656591BF28B
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 08:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 534CB60B68
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 08:28:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBQlZCaNc60e for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 08:28:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8587360B57
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 08:28:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C52DA82A54; Tue,  4 Jan 2022 08:22:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 09:27:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78a989b1f15311d7e9e01717111c3dc306a0dbaa
X-Git-Newrev: f0db062f4b6a7e249602e540204e7e428fc5ff2e
X-Patchwork-Hint: ignore
Message-Id: <20220104082233.C52DA82A54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-waf.mk: enable verbose compile
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0db062f4b6a7e249602e540204e7e428fc5ff2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Honour the buildroot verbose flag ('V=1') for the waf compile step by
adding '-v' to the build command.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-waf.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index a593476a69..d546b4a817 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -20,6 +20,8 @@
 #
 ################################################################################
 
+WAF_OPTS = $(if $(VERBOSE),-v) -j $(PARALLEL_JOBS)
+
 ################################################################################
 # inner-waf-package -- defines how the configuration, compilation and
 # installation of a waf package should be done, implements a few hooks
@@ -74,7 +76,7 @@ ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
-		build -j $$(PARALLEL_JOBS) $$($(2)_BUILD_OPTS) \
+		build $$(WAF_OPTS) $$($(2)_BUILD_OPTS) \
 		$$($(2)_WAF_OPTS)
 endef
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
