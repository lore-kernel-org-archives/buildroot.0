Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249AFC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 13:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2B5B600C7;
	Sun, 14 Jul 2024 13:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wW6ZzuutvC0Z; Sun, 14 Jul 2024 13:14:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC38C60606
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC38C60606;
	Sun, 14 Jul 2024 13:14:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8486F1BF3D8
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 13:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 723AA80C24
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 13:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLUFL4-5Iw_n for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 13:13:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94CDC80B7F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94CDC80B7F
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 13:13:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DDDB8673A; Sun, 14 Jul 2024 13:13:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 14:56:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51a58ff0624f62ca0fa0ca6494928e8bd1410f69
X-Git-Newrev: e9960267e6208423b4656a152b3e576b4e5bd027
X-Patchwork-Hint: ignore
Message-Id: <20240714131358.7DDDB8673A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-download: restore user's
 original umask for the whole download process
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e9960267e6208423b4656a152b3e576b4e5bd027
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Root makefile imposes 'umask 0022', and this may be more restrictive than the
user's original umask - which could have provisions set to share files/dirs
with other users.
As an example, the imposed value makes the per-package download directories not
writeable for the group, but just for the owner - the user that issued the first
build that populated the per-package dl dir for the first time (say user A).
Thus, if a BR package changes its version (e.g. for buildroot update), and
another user (say user B, in the same group of A) starts a build, BR fails the
creation of package-xxx.tar.gz inside the dl dir, because user B has no write
permissions on that path. Furthermore, in the case of the git backend, this
makes the git cache not updatable by a different user. This is disruptive for a
host used by many users, all belonging to a certain group.

So, to allow sharing of a rw BR2_DL_DIR location among users, we save the
original umask value and restore it during the download process.

Signed-off-by: Luca Pesce <luca.pesce@vimar.com>
[Arnout:
 - CURR_UMASK -> CUR_UMASK.
 - BR2_ORIG_UMASK -> BR_ORIG_UMASK.
 - Don't check if the umask is more permissive, apply it regardless. If
   the user explicitly doesn't want to make their DL_DIR readable by
   others, that's fine.
 - Don't export BR_ORIG_UMASK.
 - Only set BR_ORIG_UMASK if it we recurse, and only set umask if
   BR_ORIG_UMASK is set.
 - Add DOWNLOAD_SET_UMASK to simplify the latter.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile                |  4 +++-
 package/pkg-download.mk | 10 ++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 138cfc5f8d..cd8498edf6 100644
--- a/Makefile
+++ b/Makefile
@@ -66,13 +66,14 @@ endif
 CANONICAL_CURDIR = $(realpath $(CURDIR))
 
 REQ_UMASK = 0022
+CUR_UMASK := $(shell umask)
 
 # Make sure O= is passed (with its absolute canonical path) everywhere the
 # toplevel makefile is called back.
 EXTRAMAKEARGS := O=$(CANONICAL_O)
 
 # Check Buildroot execution pre-requisites here.
-ifneq ($(shell umask):$(CURDIR):$(O),$(REQ_UMASK):$(CANONICAL_CURDIR):$(CANONICAL_O))
+ifneq ($(CUR_UMASK):$(CURDIR):$(O),$(REQ_UMASK):$(CANONICAL_CURDIR):$(CANONICAL_O))
 .PHONY: _all $(MAKECMDGOALS)
 
 $(MAKECMDGOALS): _all
@@ -81,6 +82,7 @@ $(MAKECMDGOALS): _all
 _all:
 	@umask $(REQ_UMASK) && \
 		$(MAKE) -C $(CANONICAL_CURDIR) --no-print-directory \
+			BR_ORIG_UMASK=$(CUR_UMASK) \
 			$(MAKECMDGOALS) $(EXTRAMAKEARGS)
 
 else # umask / $(CURDIR) / $(O)
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 90da201bab..ca01ff67a5 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -107,9 +107,15 @@ endif
 #
 ################################################################################
 
+# Restore the user's original umask during the whole download, in case he has
+# provisions set to share the download directory with his group (or others).
+ifneq ($(BR_ORIG_UMASK),)
+DOWNLOAD_SET_UMASK = umask $(BR_ORIG_UMASK);
+endif
+
 define DOWNLOAD
-	$(Q)mkdir -p $($(PKG)_DL_DIR)
-	$(Q)$(EXTRA_ENV) \
+	$(Q)$(DOWNLOAD_SET_UMASK) mkdir -p $($(PKG)_DL_DIR)
+	$(Q)$(DOWNLOAD_SET_UMASK) $(EXTRA_ENV) \
 	$($(PKG)_DL_ENV) \
 	TAR="$(TAR)" \
 	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
