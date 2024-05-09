Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBC7C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 922026131A;
	Thu,  9 May 2024 20:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WC_IRu8F12wD; Thu,  9 May 2024 20:47:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52790613DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52790613DF;
	Thu,  9 May 2024 20:47:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE66A1BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 416C683FF0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_4XwLClD5wb for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC4EB83FF8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC4EB83FF8
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:46:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D966186C8F; Thu,  9 May 2024 20:46:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:45:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c68d67bfad9223bba5eb1da2a50c80f775c71c39
X-Git-Newrev: b11956fb6690e0083eab9f30b5dc146fc40c2d5f
X-Patchwork-Hint: ignore
Message-Id: <20240509204628.D966186C8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/dependencies: require tar >= 1.35
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

commit: https://git.buildroot.net/buildroot/commit/?id=b11956fb6690e0083eab9f30b5dc146fc40c2d5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can't stay in the past forever and ever...

Since tar 1.35, the way some fields (devmajor and devminor) are stored
has changed. These fields exist for each file in the tarball, but only
used for device nodes. In previous versions of GNU tar, they were set to
zero; since 1.35, they are set to empty.

Although this doesn't change anything about the content of the tarball,
and it will be extracted in exactly the same way regardless of the tar
version used for extracting, it does change the hash of the tarball.
Therefore, we have to
- make sure that the correct version of tar is used;
- update the format version so that the filename is different from
  before.

Increment all BR_FMT_VERSION by one.

Require tar >= 1.35 instead of < 1.35.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Arnout: also increment BR_FMT_VERSION and extend the commit message]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-download.mk                |  8 ++++----
 support/dependencies/check-host-tar.sh | 19 ++++---------------
 2 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 61e565b002..4be45c9d12 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -20,10 +20,10 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 # Version of the format of the archives we generate in the corresponding
 # download backend and post-process:
-BR_FMT_VERSION_git = -git3
-BR_FMT_VERSION_svn = -svn4
-BR_FMT_VERSION_go = -go1
-BR_FMT_VERSION_cargo = -cargo1
+BR_FMT_VERSION_git = -git4
+BR_FMT_VERSION_svn = -svn5
+BR_FMT_VERSION_go = -go2
+BR_FMT_VERSION_cargo = -cargo2
 
 DL_WRAPPER = support/download/dl-wrapper
 
diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
index 7d6b3bf688..271080e365 100755
--- a/support/dependencies/check-host-tar.sh
+++ b/support/dependencies/check-host-tar.sh
@@ -27,18 +27,12 @@ if [ -n "${version_bsd}" ] ; then
     exit 1
 fi
 
-# Minimal version = 1.27 (previous versions do not correctly unpack archives
-# containing hard-links if the --strip-components option is used or create
-# different gnu long link headers for path elements > 100 characters).
-major_min=1
-minor_min=27
-
-# Maximal version = 1.34 (1.35 changed devmajor/devminor for files)
+# Minimal version = 1.35 (1.35 changed devmajor/devminor for files)
 # https://lists.gnu.org/archive/html/info-gnu/2023-07/msg00005.html
-major_max=1
-minor_max=34
+major_min=1
+minor_min=35
 
-if [ $major -lt $major_min -o $major -gt $major_max ]; then
+if [ $major -lt $major_min ]; then
 	# echo nothing: no suitable tar found
 	exit 1
 fi
@@ -48,10 +42,5 @@ if [ $major -eq $major_min -a $minor -lt $minor_min ]; then
 	exit 1
 fi
 
-if [ $major -eq $major_max -a $minor -gt $minor_max ]; then
-	# echo nothing: no suitable tar found
-	exit 1
-fi
-
 # valid
 echo $tar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
