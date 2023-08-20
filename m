Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A711EE49AA
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 14:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C676B81F7A;
	Sun, 20 Aug 2023 14:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C676B81F7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id elhMmCiVQtNB; Sun, 20 Aug 2023 14:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 057B282022;
	Sun, 20 Aug 2023 14:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 057B282022
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FD591BF363
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2644E60B90
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2644E60B90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tM17eHRlbxKw for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 14:32:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 436EF6068F
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 14:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 436EF6068F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F69D85E43; Sun, 20 Aug 2023 14:32:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 16:30:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 80a1e728b0053e6fb7dc8ea9c1331749b3695f03
X-Git-Newrev: bf2d7f8f5395253e42c234f24ba0803eb85215bf
X-Patchwork-Hint: ignore
Message-Id: <20230820143215.2F69D85E43@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-generic: don't
 download svn externals by default
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf2d7f8f5395253e42c234f24ba0803eb85215bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 7dd27cbe5b9e (support/download: add support to exclude svn
externals) departed from the usual opt-in scheme, like is done for
git submodule or large files, in an attempt to keep the previous
behaviour unchanged, that is to download externals by default.

As an afterthought, we've concluded that the chances for svn-hosted
packages with externals that are indeed required to do the build,
are relatively slim. For those cases, it even makes sense to explicitly
requested the use of the externals.

So, we change the default to not download svn externals.

Since the generated archives may change, we bump the version suffix.
This will allow users to more easily catch the situation and decide if
they really need the externals or not.

We have a single in-tree package that uses svn, and it does not use
externals, so the generated archive does not change, and we just need
to update the archive filename in the hash file.

Finally, we add a new section to the manual, in the chapter about
migrating Buildroot to a newer version.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-generic.txt |  8 +++-----
 docs/manual/migrating.txt               | 14 ++++++++++++++
 package/libxmlrpc/libxmlrpc.hash        |  2 +-
 package/pkg-download.mk                 |  2 +-
 package/pkg-generic.mk                  |  4 ----
 5 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 299017f9d2..98f822c55c 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -347,11 +347,9 @@ not and can not work as people would expect it should:
   Git LFS to store large files out of band.  This is only available for
   packages downloaded with git (i.e. when +LIBFOO_SITE_METHOD=git+).
 
-+ +LIBFOO_SVN_EXTERNAL+ can be set to +YES+ (the default) to specify
-  whether to retrieve the svn external references, or to +NO+ to avoid
-  retrieving those externals. Note that, contrary to other similar
-  options like +LIBFOO_GIT_SUBMODULES+ or +LIBFOO_GIT_LFS+, the default
-  here is to actually retrieve the externals; this is a legacy heritage.
++ +LIBFOO_SVN_EXTERNALS+ can be set to +YES+ to create an archive with
+  the svn external references. This is only available for packages
+  downloaded with subversion.
 
 * +LIBFOO_STRIP_COMPONENTS+ is the number of leading components
   (directories) that tar must strip from file names on extraction.
diff --git a/docs/manual/migrating.txt b/docs/manual/migrating.txt
index cb1f5eacc9..2667aeab96 100644
--- a/docs/manual/migrating.txt
+++ b/docs/manual/migrating.txt
@@ -86,3 +86,17 @@ Whenever a package installs an executable that is linked with a library
 in +$(HOST_DIR)/lib+, it must have an RPATH pointing to that directory.
 
 An RPATH pointing to +$(HOST_DIR)/usr/lib+ is no longer accepted.
+
+[[migrating-svn-externals]]
+=== Migrating to 2023.11
+
+Before Buildroot 2023.11, the subversion download backend unconditionally
+retrieved the external references (objects with an `svn:externals`
+property). Starting with 2023.11, externals are no longer retrieved by
+default; if you need them, set +LIBFOO_SVN_EXTERNALS+ to +YES+. This
+change implies that:
+
+* the generated archive content may change, and thus the hashes may need
+  to be updated appropriately;
+* the archive version suffix has been updated to +-br3+, so the hash
+  files must be updated appropriately.
diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index 5d42dc0558..665ee31836 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  626e36295f43b320082bc7bdd961b46f39fbe2719535b5a417975a8e50c8f7f3  libxmlrpc-r3119-br2.tar.gz
+sha256  626e36295f43b320082bc7bdd961b46f39fbe2719535b5a417975a8e50c8f7f3  libxmlrpc-r3119-br3.tar.gz
 sha256  db7a6d3f187b218c3534010a83424c6bcdef88e6a0b6b1aa3a8762238bd642e6  doc/COPYING
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 5a311a95c6..e5cd83d859 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -21,7 +21,7 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 # Version of the format of the archives we generate in the corresponding
 # download backend:
 BR_FMT_VERSION_git = -br1
-BR_FMT_VERSION_svn = -br2
+BR_FMT_VERSION_svn = -br3
 
 DL_WRAPPER = support/download/dl-wrapper
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 820d2fd494..d55edb1b74 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -646,10 +646,6 @@ endif
 ifndef $(2)_SVN_EXTERNALS
  ifdef $(3)_SVN_EXTERNALS
   $(2)_SVN_EXTERNALS = $$($(3)_SVN_EXTERNALS)
- else
-  # Legacy: we used to always use externals by default
-  # Only set it when the package is actually hosted on svn
-  $(2)_SVN_EXTERNALS = $$(if $$(filter svn,$$($(2)_SITE_METHOD)),YES)
  endif
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
