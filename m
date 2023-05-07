Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C937BC77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 376D040642;
	Sun,  7 May 2023 21:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 376D040642
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01jyEUrQ57-r; Sun,  7 May 2023 21:02:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B791140636;
	Sun,  7 May 2023 21:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B791140636
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A19B21BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A2D383AE2
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:02:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A2D383AE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fj3ppgh5N1ur for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:02:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF95A83794
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF95A83794
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 969D086065; Sun,  7 May 2023 21:02:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 22:34:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64f1f82385b2af1c690d64ae3d72856a707b177e
X-Git-Newrev: c110bb17ade18f446dd663c984dc3ef48b20fc64
X-Patchwork-Hint: ignore
Message-Id: <20230507210246.969D086065@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-utils.mk: make kconfig
 set/disable operations quiet
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

commit: https://git.buildroot.net/buildroot/commit/?id=c110bb17ade18f446dd663c984dc3ef48b20fc64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In a previous commit [1], the use of `KCONFIG_ENABLE_OPT` was tweaked in
a way which no longer generates a default output unless the quiet flag
is unset (`Q=`). The use of `KCONFIG_SET_OPT` and `KCONFIG_DISABLE_OPT`
does not apply a quiet operation. In order to make all these kernel
configuration defines operate in a consistent way, adjusting both
`KCONFIG_SET_OPT` and `KCONFIG_DISABLE_OPT` to be default-quiet as well.

[1]: 66d2ff25bad813659ed4541b3f4c6c2a09455bd7

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 0945e6ed31..530638566c 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -34,9 +34,9 @@ define KCONFIG_ENABLE_OPT
 	fi
 endef
 # KCONFIG_SET_OPT (option, value [, file])
-KCONFIG_SET_OPT     = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=$(2), $(3))
+KCONFIG_SET_OPT     = $(Q)$(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=$(2), $(3))
 # KCONFIG_DISABLE_OPT  (option [, file])
-KCONFIG_DISABLE_OPT = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(SHARP_SIGN) $(1) is not set, $(2))
+KCONFIG_DISABLE_OPT = $(Q)$(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(SHARP_SIGN) $(1) is not set, $(2))
 
 # Helper functions to determine the name of a package and its
 # directory from its makefile directory, using the $(MAKEFILE_LIST)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
