Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECB7CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 11:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22E216063C;
	Wed, 10 Sep 2025 11:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIkBl1RyO7f2; Wed, 10 Sep 2025 11:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AD55611BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AD55611BE;
	Wed, 10 Sep 2025 11:19:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E2DD11AE
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DFAA41837
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_6ccroO8LK5 for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 11:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30F3C41835
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30F3C41835
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:19:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28F0C83D34; Wed, 10 Sep 2025 11:19:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Sep 2025 13:08:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55bc78bc03ae6089b93539b9217b7c26796caa48
X-Git-Newrev: fd4ece315109f327613ff9ca26d02894c73d8be6
X-Patchwork-Hint: ignore
Message-Id: <20250910111949.28F0C83D34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-golang: simplify installing
 multiple binaries
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fd4ece315109f327613ff9ca26d02894c73d8be6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, when a golang package defines multiple _BUILD_TARGETS, it has
to basically repeat the same list in its _INSTALL_BINS.

When a golang package defines multiple _BUILD_TARGETS, the pkg-golang
infra will forcibly use the basename (the notdir) of each target as the
name of the generated binary; there is no option to set a per-target
binary name.

However, the pkg-golang infra by default tries to install a binary named
after the package rawname. This forces packages to basically repeat the
same list as their _BUILD_TARGETS to override _INSTALL_BINS, when the
list of generated binaries is already known to the infra.

We change the pkg-golang infra to better cover such a case:

  - if _BUILD_TARGET is '.' (the default), keep the current scheme:
    install a single binary named after the package rwaname;

  - if _BUILD_TARGET is not '.', and contains a single word, use the
    notdir of the built target, but allow the user to override it with
    _BIN_NAME (the current behaviour);

  - otherwise (_BUILD_TARGETS is set to more than one word), do not
    allow the user to set _BIN_NAME (it does not make sense), but set
    _INSTALL_BINS by default to the notdir of _BUILD_TARGETS.

We still allow the user to set _INSTALL_BINS in the last case, to cover
the case for existing packages; those are going to be "fixed" in the
following commits.

We now consider that _INSTALL_BINS is an internal implementation details
that should no longer be exposed to the users, so we drop it from the
documentation; we rephrase the corresponding part for _BUILD_TARGETS.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 docs/manual/adding-packages-golang.adoc | 28 ++++++++++++++--------------
 package/pkg-golang.mk                   | 11 +++++++++--
 2 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/docs/manual/adding-packages-golang.adoc b/docs/manual/adding-packages-golang.adoc
index 6de0916a83..21b6a122a9 100644
--- a/docs/manual/adding-packages-golang.adoc
+++ b/docs/manual/adding-packages-golang.adoc
@@ -94,20 +94,20 @@ therefore only use a few of them, or none.
   defaults to +.+. We then have two cases:
 
 ** +FOO_BUILD_TARGETS+ is +.+. In this case, we assume only one binary
-   will be produced, and that by default we name it after the package
-   name. If that is not appropriate, the name of the produced binary
-   can be overridden using +FOO_BIN_NAME+.
-
-** +FOO_BUILD_TARGETS+ is not +.+. In this case, we iterate over the
-   values to build each target, and for each produced a binary that is
-   the non-directory component of the target. For example if
-   +FOO_BUILD_TARGETS = cmd/docker cmd/dockerd+ the binaries produced
-   are +docker+ and +dockerd+.
-
-* +FOO_INSTALL_BINS+ can be used to pass the list of binaries that
-  should be installed in +/usr/bin+ on the target. If
-  +FOO_INSTALL_BINS+ is not specified, it defaults to the lower-case
-  name of package.
+   will be built and installed, and by default we name it after the
+   package name; if that is not appropriate, the name of the binary can
+   be overridden using +FOO_BIN_NAME+.
+
+** +FOO_BUILD_TARGETS+ is not +.+. In this case, it is interpreted as a
+   space-separated list, and we iterate over the targets to build and
+   install a binary named after the non-directory component of the
+   target. For example if +FOO_BUILD_TARGETS = cmd/docker cmd/dockerd+,
+   the binaries built and installed are +docker+ and +dockerd+. If
+   +FOO_BUILD_TARGETS+ contains only one target, then it is possible to
+   override the built and installed binary by setting +FOO_BIN_NAME+,
+   as above; if +FOO_BUILD_TARGETS+ contains two or more targets, then
+   it is not possible to override the names of the installed binaries
+   (use a post-install hook for that).
 
 With the Go infrastructure, all the steps required to build and
 install the packages are already defined, and they generally work well
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index a4e8bd30cc..ff8d28aa7e 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -61,9 +61,16 @@ $(2)_BUILD_TARGETS ?= .
 # after each build target building them (below in <pkg>_BUILD_CMDS).
 ifeq ($$($(2)_BUILD_TARGETS),.)
 $(2)_BIN_NAME ?= $$($(2)_RAWNAME)
+$(2)_INSTALL_BINS ?= $$($(2)_BIN_NAME)
+else ifeq ($$(words $$($(2)_BUILD_TARGETS)),1)
+$(2)_BIN_NAME ?= $$(notdir $$($(2)_BUILD_TARGETS))
+$(2)_INSTALL_BINS ?= $$($(2)_BIN_NAME)
+else
+ifneq ($$($(2)_BIN_NAME),)
+$$(error $(1) sets $(2)_BIN_NAME while there are multiple targets in $(2)_BUILD_TARGETS)
+endif
+$(2)_INSTALL_BINS ?= $$(notdir $$($(2)_BUILD_TARGETS))
 endif
-
-$(2)_INSTALL_BINS ?= $$($(2)_RAWNAME)
 
 # Source files in Go usually use an import path resolved around
 # domain/vendor/software. We infer domain/vendor/software from the upstream URL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
