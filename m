Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C04EC36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 20:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C984660904;
	Sat, 29 Mar 2025 20:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C0nVPxFml_k5; Sat, 29 Mar 2025 20:22:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2D1D60AF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2D1D60AF6;
	Sat, 29 Mar 2025 20:22:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED013121
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEA2F4090C
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LuK1XMKQB_Wr for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 20:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00B57408EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00B57408EB
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 20:22:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBCC7838C2; Sat, 29 Mar 2025 20:22:02 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Mar 2025 16:55:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ba1055d3da2d98874aae1eedf1983a2ed933605
X-Git-Newrev: b974c91fe438541781c2df6f4fe0b8a48ab0a124
X-Patchwork-Hint: ignore
Message-Id: <20250329202202.EBCC7838C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-golang: support _SUBDIR
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

commit: https://git.buildroot.net/buildroot/commit/?id=b974c91fe438541781c2df6f4fe0b8a48ab0a124
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages have their actual source tree in a sub-directory (even if
that is the only source in the repository); this is the case for example
with the Amazon ECR credential helper (to be packaged in a follow up
commit):
    https://github.com/awslabs/amazon-ecr-credential-helper

Do the build in _SUBDIR, and also do the vendoring in there.

We don't need the build to generate executables inside _SUBDIR, so we
just keep using $(@D)/bin as a place to generate them (and install them
from).

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
Reviewed-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pkg-golang.mk            | 13 +++++++++----
 support/download/go-post-process |  5 +++--
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index bdf8de4d66..a4e8bd30cc 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -79,8 +79,8 @@ $(2)_GOMOD ?= $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)
 # Generate a go.mod file if it doesn't exist. Note: Go is configured
 # to use the "vendor" dir and not make network calls.
 define $(2)_GEN_GOMOD
-	if [ ! -f $$(@D)/go.mod ]; then \
-		printf "module $$($(2)_GOMOD)\n" > $$(@D)/go.mod; \
+	if [ ! -f $$(@D)/$$($(2)_SUBDIR)/go.mod ]; then \
+		printf "module $$($(2)_GOMOD)\n" > $$(@D)/$$($(2)_SUBDIR)/go.mod; \
 	fi
 endef
 $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
@@ -91,6 +91,11 @@ $(2)_DL_ENV += \
 	GOPROXY=direct \
 	$$($(2)_GO_ENV)
 
+# If building in a sub directory, do the vendoring in there
+ifneq ($$($(2)_SUBDIR),)
+$(2)_DOWNLOAD_POST_PROCESS_OPTS += -s$$($(2)_SUBDIR)
+endif
+
 # Because we append vendored info, we can't rely on the values being empty
 # once we eventually get into the generic-package infra. So, we duplicate
 # the heuristics here
@@ -135,7 +140,7 @@ endif
 # Build package for target
 define $(2)_BUILD_CMDS
 	$$(foreach d,$$($(2)_BUILD_TARGETS),\
-		cd $$(@D); \
+		cd $$(@D)/$$($(2)_SUBDIR); \
 		$$(HOST_GO_TARGET_ENV) \
 			$$($(2)_GO_ENV) \
 			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
@@ -147,7 +152,7 @@ else
 # Build package for host
 define $(2)_BUILD_CMDS
 	$$(foreach d,$$($(2)_BUILD_TARGETS),\
-		cd $$(@D); \
+		cd $$(@D)/$$($(2)_SUBDIR); \
 		$$(HOST_GO_HOST_ENV) \
 			$$($(2)_GO_ENV) \
 			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
diff --git a/support/download/go-post-process b/support/download/go-post-process
index ef96a76948..edc23ec564 100755
--- a/support/download/go-post-process
+++ b/support/download/go-post-process
@@ -5,10 +5,11 @@ set -e
 . "${0%/*}/helpers"
 
 # Parse our options
-while getopts "n:o:" OPT; do
+while getopts "n:o:s:" OPT; do
     case "${OPT}" in
     o)  output="${OPTARG}";;
     n)  base_name="${OPTARG}";;
+    s)  subdir="${OPTARG}";;
     :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
     \?) error "unknown option '%s'\n" "${OPTARG}";;
     esac
@@ -22,7 +23,7 @@ fi
 post_process_unpack "${base_name}" "${output}"
 
 # Do the Go vendoring
-pushd "${base_name}" > /dev/null
+pushd "${base_name}/${subdir}" > /dev/null
 
 if [ ! -f go.mod ]; then
     echo "ERROR: no vendor/ folder and no go.mod, aborting"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
