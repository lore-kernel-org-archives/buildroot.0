Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C57DC5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 17:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52A4C61660;
	Wed,  4 Jun 2025 17:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yobExzsNEKMk; Wed,  4 Jun 2025 17:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65FE961650
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65FE961650;
	Wed,  4 Jun 2025 17:20:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C1F5DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2298541C64
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IDo0biHnda3s for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 17:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EE0341C4F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EE0341C4F
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:20:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D960878EB; Wed,  4 Jun 2025 17:20:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:24:29 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 25ea5d567acbb9896164f8b398f69456ea5d57e2
X-Git-Newrev: 89c82ec8e820eed9e8e9fb7448b4dc99e10ed5db
X-Patchwork-Hint: ignore
Message-Id: <20250604172010.3D960878EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/download/dl-wrapper: add basic support for smb file download using
 curl
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=89c82ec8e820eed9e8e9fb7448b4dc99e10ed5db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

It allows to download files from smb share in buildroot packages.
Usage is specified in manual.

Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
[Peter: reword documentation]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e240b889f183b8ad00c116a4cab222135ec7f17b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/manual/adding-packages-generic.adoc | 7 +++++++
 package/pkg-generic.mk                   | 2 +-
 support/download/dl-wrapper              | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index 7e2e066c16..6827b9975e 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -337,6 +337,13 @@ not and can not work as people would expect it should:
      for +local+ packages, no patches are applied. If you need to
      still patch the source code, use +LIBFOO_POST_RSYNC_HOOKS+, see
      xref:hooks-rsync[].
+  ** +smb+ for retrieving source code from a SMB share. Used by
+     default when +LIBFOO_SITE+ begins with +smb://+. It uses +curl+
+     as download backend. Syntax expected:
+     +LIBFOO_SITE=smb://<server>/<share>/<path>+. This method might
+     require to define -u option in +LIBFOO_DL_OPTS+. For more
+     information, please refer to the
+     https://curl.se/docs/tutorial.html[curl documentation].
 
 * +LIBFOO_GIT_SUBMODULES+ can be set to +YES+ to create an archive
   with the git submodules in the repository.  This is only available
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f22b6e981a..95ff9135bd 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1260,7 +1260,7 @@ else ifeq ($$($(2)_SITE_METHOD),hg)
 DL_TOOLS_DEPENDENCIES += hg
 else ifeq ($$($(2)_SITE_METHOD),cvs)
 DL_TOOLS_DEPENDENCIES += cvs
-else ifneq ($(filter ftp ftps,$$($(2)_SITE_METHOD)),)
+else ifneq ($(filter ftp ftps smb,$$($(2)_SITE_METHOD)),)
 DL_TOOLS_DEPENDENCIES += curl
 endif # SITE_METHOD
 
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 5445aad5a7..b70c8edbd9 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -96,7 +96,7 @@ main() {
         backend="${backend_urlencode%|*}"
         case "${backend}" in
             git|svn|cvs|bzr|file|scp|hg|sftp) ;;
-            ftp|ftps) backend="curl" ;;
+            ftp|ftps|smb) backend="curl" ;;
             *) backend="wget" ;;
         esac
         uri=${uri#*+}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
