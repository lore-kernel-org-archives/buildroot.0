Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5DEC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE6EA70CD1;
	Fri, 28 Feb 2025 17:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6rIbPoLvE2zO; Fri, 28 Feb 2025 17:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CFE97099B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CFE97099B;
	Fri, 28 Feb 2025 17:18:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ED0168
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9755C44805
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2RkSFxsLem8 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D56B142D50
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D56B142D50
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7AEF87C78; Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 13 Feb 2025 21:37:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6648d7046d760c2fc13ccf4fdbb2376151ac1c59
X-Git-Newrev: 56cc6fa2c71eff27efcb66d60f254da04439ac18
X-Patchwork-Hint: ignore
Message-Id: <20250228163039.C7AEF87C78@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-download: don't
 export the download command variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=56cc6fa2c71eff27efcb66d60f254da04439ac18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Exporting the download variables can cause unfortunate name clashes, as
occurred with the SCP variable used by Binman for compiling U-Boot [1].
Do not globally export the package download commands anymore; instead,
pass them to the dl-wrapper environment.

The issue can be reproduced by building the rock5b_defconfig.
In that case, compilation fails with output:

    usage: binman [-h] [-B BUILD_DIR] [-D] [-H] [--tooldir TOOLDIR]
                  [--toolpath TOOLPATH] [-T THREADS] [--test-section-timeout]
                  [-v VERBOSITY] [-V]
                  {build,bintool-docs,entry-docs,ls,extract,replace,sign,test,tool}
                  ...
    binman: error: unrecognized arguments: -o ConnectTimeout=10

This build failure is due to the naming clash on the "SCP" environment
variable. The "SCP" initially exported in package/pkg-download.mk
refers to the SSH Secure File Copy command. While the "SCP" variable
in U-Boot refers to the "System Control Processor firmware blob",
which is a binary file used by u-boot to build a boot image.

Even if the name clash has always been present, the build issues were
occuring since commit [2].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556697
(and many others)

[1] https://lore.kernel.org/buildroot/a023971c7c8bfa4826a9a8721500c7ff@free.fr/T/
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/4bce3270d68074d397b1ac9726f5c970eb517fcb
Cc: Julien Olivain <ju.o@free.fr>
Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien:
 - reorder variables alphabetically
 - add LOCALFILES variable
 - add info in commit log (build failure log, example to reproduce,
   details about the name clash)
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pkg-download.mk | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index ca01ff67a5..cf5959ea95 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -7,18 +7,6 @@
 #
 ################################################################################
 
-# Download method commands
-export CURL := $(call qstrip,$(BR2_CURL))
-export WGET := $(call qstrip,$(BR2_WGET))
-export SVN := $(call qstrip,$(BR2_SVN))
-export CVS := $(call qstrip,$(BR2_CVS))
-export BZR := $(call qstrip,$(BR2_BZR))
-export GIT := $(call qstrip,$(BR2_GIT))
-export HG := $(call qstrip,$(BR2_HG))
-export SCP := $(call qstrip,$(BR2_SCP))
-export SFTP := $(call qstrip,$(BR2_SFTP))
-export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
-
 # Version of the format of the archives we generate in the corresponding
 # download backend and post-process:
 BR_FMT_VERSION_git = -git4
@@ -118,6 +106,16 @@ define DOWNLOAD
 	$(Q)$(DOWNLOAD_SET_UMASK) $(EXTRA_ENV) \
 	$($(PKG)_DL_ENV) \
 	TAR="$(TAR)" \
+	BZR="$(call qstrip,$(BR2_BZR))" \
+	CURL="$(call qstrip,$(BR2_CURL))" \
+	CVS="$(call qstrip,$(BR2_CVS))" \
+	GIT="$(call qstrip,$(BR2_GIT))" \
+	HG="$(call qstrip,$(BR2_HG))" \
+	LOCALFILES="$(call qstrip,$(BR2_LOCALFILES))" \
+	SCP="$(call qstrip,$(BR2_SCP))" \
+	SFTP="$(call qstrip,$(BR2_SFTP))" \
+	SVN="$(call qstrip,$(BR2_SVN))" \
+	WGET="$(call qstrip,$(BR2_WGET))" \
 	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
 		flock $($(PKG)_DL_DIR)/.lock $(DL_WRAPPER) \
 		-c '$($(PKG)_DL_VERSION)' \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
