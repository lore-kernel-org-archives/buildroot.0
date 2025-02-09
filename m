Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A09C02199
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 15:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B013B60748;
	Sun,  9 Feb 2025 15:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gdTuHSsMuAkk; Sun,  9 Feb 2025 15:10:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C10BC607C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C10BC607C0;
	Sun,  9 Feb 2025 15:09:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6274C1B5
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51E0E40946
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3UEyf86G4Hk for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51F89405DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51F89405DD
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 411DD87458; Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 15:17:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 402b1afcdff446b335cc249d00e661e81b6b4759
X-Git-Newrev: 13deac1e39855cc8df1433299a6741a085afca46
X-Patchwork-Hint: ignore
Message-Id: <20250209150951.411DD87458@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download/{curl, cvs, git,
 svn}: disable new shellcheck 0.9.0 errors
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=13deac1e39855cc8df1433299a6741a085afca46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As for SC1090 and SC2016 [1], disable SC1091 and SC2294 too since they
are now reported by shellcheck 0.9.0:

In support/download/curl line 42:
    eval ${CURL} "${@}"
                  ^--^ SC2294 (warning): eval negates the benefit of arrays. Drop eval to preserve whitespace/symbols (or eval as string).

[1] bcee3ca6d66d30de4b0cd8186ce4c72020705df8

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/curl | 1 +
 support/download/cvs  | 1 +
 support/download/git  | 2 ++
 support/download/svn  | 2 ++
 4 files changed, 6 insertions(+)

diff --git a/support/download/curl b/support/download/curl
index bea4485a6c..2124fe7cad 100755
--- a/support/download/curl
+++ b/support/download/curl
@@ -39,6 +39,7 @@ _curl() {
 # Note: please keep command below aligned with what is printed above
 _plain_curl() {
     # shellcheck disable=SC2086  # We want splitting
+    # shellcheck disable=SC2294
     eval ${CURL} "${@}"
 }
 
diff --git a/support/download/cvs b/support/download/cvs
index a6840fea7b..a52e543e44 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -47,6 +47,7 @@ _cvs() {
 # Note: please keep command below aligned with what is printed above
 _plain_cvs() {
     # shellcheck disable=SC2086  # We really want word splitting in CVS
+    # shellcheck disable=SC2294
     eval timeout 10m ${CVS} "${@}"
 }
 
diff --git a/support/download/git b/support/download/git
index d49016e90c..8123bc3153 100755
--- a/support/download/git
+++ b/support/download/git
@@ -22,6 +22,7 @@ set -e
 #   GIT      : the git command to call
 
 # shellcheck disable=SC1090 # Only provides mk_tar_gz()
+# shellcheck disable=SC1091
 . "${0%/*}/helpers"
 
 # Save our path and options in case we need to call ourselves again
@@ -91,6 +92,7 @@ _git() {
 # Note: please keep command below aligned with what is printed above
 _plain_git() {
     # shellcheck disable=SC2086 # We want word-splitting for GIT
+    # shellcheck disable=SC2294
     eval GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
 }
 
diff --git a/support/download/svn b/support/download/svn
index 1decb2310b..ff33f1fa39 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -22,6 +22,7 @@ set -e
 #   SVN      : the svn command to call
 
 # shellcheck disable=SC1090 # Only provides mk_tar_gz()
+# shellcheck disable=SC1091
 . "${0%/*}/helpers"
 
 quiet=
@@ -52,6 +53,7 @@ _svn() {
 # Note: please keep command below aligned with what is printed above
 _plain_svn() {
     # shellcheck disable=SC2086 # We want word-splitting for SVN
+    # shellcheck disable=SC2294
     eval ${SVN} "${@}"
 }
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
