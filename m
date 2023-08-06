Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A936DC001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 560B081E1F;
	Sun,  6 Aug 2023 14:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 560B081E1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E_PQEpTWJ36b; Sun,  6 Aug 2023 14:38:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 705EA81D7D;
	Sun,  6 Aug 2023 14:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 705EA81D7D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EF641BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 697DC80AF4
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 697DC80AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id esaCJgbpuAhg for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:36:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C62C80C09
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C62C80C09
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59D8C844B4; Sun,  6 Aug 2023 14:36:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 16:35:52 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 92d51faedab5f738ad3b9e7b7084c177e100cc7b
X-Git-Newrev: 7dd27cbe5b9ec99e71760c77c78a7971a93c7615
X-Patchwork-Hint: ignore
Message-Id: <20230806143630.59D8C844B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/download: add support
 to exclude svn externals
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7dd27cbe5b9ec99e71760c77c78a7971a93c7615
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Like git which can have submodules, subversion can have externals. The
default behaviour for subversion is to retrieve all the externals,
unless told otherwise.

For some repositories, the externals may be huge (e.g. a dataset or some
assets) and may not be required for building the package. In such a
case, retrieving the externals is both a waste of network bandwitdh and
time, and a waste of disk storage.

Like for git submodules and git lfs, add an option that packages can set
to specify whether they want externals or not.

Since we've so far been retrieving externals, we keep that the default,
and packages can opt-out (rather than the opt-in for git submodules or
git lfs).

We must only set it when the package is actually hosted on svn, to avoid
passing -r when the package is not hosted by svn; otherwise, -r would
also be passed e.g. to a git-hosted package, triggering the download of
git submodules even when they are not requested. We need to do so,
because we have a default value, which we usually do not have in other
download options.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-generic.txt |  6 ++++++
 package/pkg-download.mk                 |  1 +
 package/pkg-generic.mk                  | 10 ++++++++++
 support/download/svn                    |  6 +++++-
 4 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index fbe37f9ca9..299017f9d2 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -347,6 +347,12 @@ not and can not work as people would expect it should:
   Git LFS to store large files out of band.  This is only available for
   packages downloaded with git (i.e. when +LIBFOO_SITE_METHOD=git+).
 
++ +LIBFOO_SVN_EXTERNAL+ can be set to +YES+ (the default) to specify
+  whether to retrieve the svn external references, or to +NO+ to avoid
+  retrieving those externals. Note that, contrary to other similar
+  options like +LIBFOO_GIT_SUBMODULES+ or +LIBFOO_GIT_LFS+, the default
+  here is to actually retrieve the externals; this is a legacy heritage.
+
 * +LIBFOO_STRIP_COMPONENTS+ is the number of leading components
   (directories) that tar must strip from file names on extraction.
   The tarball for most packages has one leading component named
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 0718f21aad..5a311a95c6 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -119,6 +119,7 @@ define DOWNLOAD
 		-n '$($(2)_BASENAME_RAW)' \
 		-N '$($(2)_RAWNAME)' \
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
+		$(if $(filter YES,$($(2)_SVN_EXTERNALS)),-r) \
 		$(if $($(2)_GIT_SUBMODULES),-r) \
 		$(if $($(2)_GIT_LFS),-l) \
 		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5d1c1da128..86b9c1f9d3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -643,6 +643,16 @@ ifndef $(2)_GIT_SUBMODULES
  endif
 endif
 
+ifndef $(2)_SVN_EXTERNALS
+ ifdef $(3)_SVN_EXTERNALS
+  $(2)_SVN_EXTERNALS = $$($(3)_SVN_EXTERNALS)
+ else
+  # Legacy: we used to always use externals by default
+  # Only set it when the package is actually hosted on svn
+  $(2)_SVN_EXTERNALS = $$(if $$(filter svn,$$($(2)_SITE_METHOD)),YES)
+ endif
+endif
+
 # Do not accept to download git submodule if not using the git method
 ifneq ($$($(2)_GIT_SUBMODULES),)
  ifneq ($$($(2)_SITE_METHOD),git)
diff --git a/support/download/svn b/support/download/svn
index 3e08a0ef36..1decb2310b 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -16,6 +16,7 @@ set -e
 #   -u URI      Checkout from repository at URI.
 #   -c REV      Use revision REV.
 #   -n NAME     Use basename NAME.
+#   -r          Recursive, i.e. use externals
 #
 # Environment:
 #   SVN      : the svn command to call
@@ -24,6 +25,7 @@ set -e
 . "${0%/*}/helpers"
 
 quiet=
+externals=--ignore-externals
 while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  quiet=-q;;
@@ -31,6 +33,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     u)  uri="${OPTARG}";;
     c)  rev="${OPTARG}";;
     n)  basename="${OPTARG}";;
+    r)  externals=;;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
@@ -52,7 +55,8 @@ _plain_svn() {
     eval ${SVN} "${@}"
 }
 
-_svn export --ignore-keywords ${quiet} "${@}" "'${uri}@${rev}'" "'${basename}'"
+# shellcheck disable=SC2086 # externals and quiet may be empty
+_svn export --ignore-keywords ${quiet} ${externals} "${@}" "'${uri}@${rev}'" "'${basename}'"
 
 # For 'svn info', we only need the credentials, if any; other options
 # would be invalid, as they are intended for 'svn export'.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
