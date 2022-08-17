Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A058C28B2B
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 06:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 689BB41B61;
	Thu, 18 Aug 2022 06:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 689BB41B61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t2MBZLmNlPrk; Thu, 18 Aug 2022 06:17:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EDE441B59;
	Thu, 18 Aug 2022 06:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EDE441B59
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 908D41BF3FC
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C644408B0
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C644408B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id co4vnzDqGw2Y for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 06:17:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0820400E4
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 06:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0820400E4
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2D931876FD; Thu, 18 Aug 2022 06:02:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Aug 2022 13:25:24 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 68101bd0c931ab6377b0b3824c88f34d54ab413a
X-Git-Newrev: e5a43f0038c9e0dd54eba78b1eb3b2b27f91b817
X-Patchwork-Hint: ignore
Message-Id: <20220818060241.2D931876FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/pkg-utils:
 prevent KCONFIG_ENABLE_OPT from changing =m to =y
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5a43f0038c9e0dd54eba78b1eb3b2b27f91b817
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

The KCONFIG_ENABLE_OPT is intended to enable a required kernel configuration
option when a package requires it.

However, this will often override an existing enabled module with `=m` with `=y`
which overrides the module to be built-in instead of separate.

This is undesirable behavior; we often want these as `=m` and not `=y` to reduce
the size of the kernel image.

This patch changes KCONFIG_MUNGE_DOT_CONFIG to prevent changing `=m` to `=y`.

Signed-off-by: Christian Stewart <christian@paral.in>
Co-authored-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998@free.fr:
  - drop  || exit 1, it is superfluous
  - don't change the match in the SED (just append &&)
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 66d2ff25bad813659ed4541b3f4c6c2a09455bd7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-utils.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 7d1aea7710..e5dba2add0 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -22,12 +22,17 @@ KCONFIG_DOT_CONFIG = $(strip \
 
 # KCONFIG_MUNGE_DOT_CONFIG (option, newline [, file])
 define KCONFIG_MUNGE_DOT_CONFIG
-	$(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3))
+	$(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3)) && \
 	echo '$(strip $(2))' >> $(call KCONFIG_DOT_CONFIG,$(3))
 endef
 
 # KCONFIG_ENABLE_OPT (option [, file])
-KCONFIG_ENABLE_OPT  = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=y, $(2))
+# If the option is already set to =m or =y, ignore.
+define KCONFIG_ENABLE_OPT
+	$(Q)if ! grep -q '^$(strip $(1))=[my]' $(call KCONFIG_DOT_CONFIG,$(2)); then \
+		$(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=y, $(2)); \
+	fi
+endef
 # KCONFIG_SET_OPT (option, value [, file])
 KCONFIG_SET_OPT     = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=$(2), $(3))
 # KCONFIG_DISABLE_OPT  (option [, file])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
