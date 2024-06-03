Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264F0C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 18:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 712EF40442;
	Mon,  3 Jun 2024 18:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yF8gnrXCejRP; Mon,  3 Jun 2024 18:12:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19772405D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19772405D2;
	Mon,  3 Jun 2024 18:12:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03CC81BF35F
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 18:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E191C82181
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 18:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3wSzV0gPbno for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 18:12:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01D8C82156
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01D8C82156
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 18:12:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4D21822AD; Mon,  3 Jun 2024 18:12:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 20:07:20 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 89492fe1a8cb27c49c12e85620abe182999bfc51
X-Git-Newrev: 4816c095d834ba352f59a18bb13e2e5755262018
X-Patchwork-Hint: ignore
Message-Id: <20240603181210.E4D21822AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/pkg-generic.mk:
 really make DL_SUBDIR inheritance work
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

commit: https://git.buildroot.net/buildroot/commit/?id=4816c095d834ba352f59a18bb13e2e5755262018
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

While bumping kodi, we figured out that the kodi-texturepacker and
kodi-jsonschemabuilder were both re-downloading the main Kodi tarball,
even though they contain:

KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
KODI_TEXTUREPACKER_DL_SUBDIR = kodi

Both are host packages, and turns out that changing those variables to
HOST_ ones made the download sharing work.

Commit efa7712b092950c92f994e2ee30c120a64e5451b ("package/pkg-generic:
host variant inherits target download settings") introduced
inheritance of host variables from target variables from a number of
variables, including DL_SUBDIR. But it missed the fact that earlier in
pkg-generic.mk, the following line was defined:

  $(2)_DL_SUBDIR ?= $$($(2)_RAWNAME)

So, when this later code kicked in:

 ifndef $(2)_DL_SUBDIR
  ifdef $(3)_DL_SUBDIR
   $(2)_DL_SUBDIR = $$($(3)_DL_SUBDIR)
  endif
 endif

In fact it never did anything because $(2)_DL_SUBDIR would never be
undefined. This commit fixes this issue by properly adjusting the
logic to inherit the value of the target variable when it exists, or
defaulting to $$($(2)_RAWNAME) otherwise.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a1c4d6c884c8aa871cc27166f33feecd1002b3e8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 577a148c1e..a2749320c3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -525,7 +525,6 @@ endif
 
 $(2)_BASENAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
 $(2)_BASENAME_RAW = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
-$(2)_DL_SUBDIR ?= $$($(2)_RAWNAME)
 $(2)_DL_DIR = $$(DL_DIR)/$$($(2)_DL_SUBDIR)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASENAME)
 
@@ -538,6 +537,8 @@ endif
 ifndef $(2)_DL_SUBDIR
  ifdef $(3)_DL_SUBDIR
   $(2)_DL_SUBDIR = $$($(3)_DL_SUBDIR)
+ else
+  $(2)_DL_SUBDIR = $$($(2)_RAWNAME)
  endif
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
