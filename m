Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A4FC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20839606DF;
	Thu,  9 May 2024 20:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KcjQojWYO8qT; Thu,  9 May 2024 20:19:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3842E612D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3842E612D1;
	Thu,  9 May 2024 20:19:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5E071BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 929B641DFE
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTNcGim5GE0u for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BA2541DFD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BA2541DFD
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:19:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 813D386D9F; Thu,  9 May 2024 20:19:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:19:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dabd983c0d8f019a9b285bd3a1a843cbd5ed9d4d
X-Git-Newrev: a1c4d6c884c8aa871cc27166f33feecd1002b3e8
X-Patchwork-Hint: ignore
Message-Id: <20240509201956.813D386D9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic.mk: really make
 DL_SUBDIR inheritance work
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1c4d6c884c8aa871cc27166f33feecd1002b3e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
