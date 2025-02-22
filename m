Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA73C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 785944074C;
	Fri, 28 Feb 2025 17:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwU68t2cl0ue; Fri, 28 Feb 2025 17:23:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 188FC407B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 188FC407B0;
	Fri, 28 Feb 2025 17:23:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 051C71DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D4BC42DC3
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWG85ZlEaoTR for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFF5347A21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFF5347A21
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5B1783577; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Feb 2025 22:18:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0748e761e2962e085ecc266bd79bb7991ff71462
X-Git-Newrev: dcb5d1d91849bf3e22639b38657bdae6e50767d1
X-Patchwork-Hint: ignore
Message-Id: <20250228163046.C5B1783577@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-golang: allow
 packages to provide extldflags
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

commit: https://git.buildroot.net/buildroot/commit/?id=dcb5d1d91849bf3e22639b38657bdae6e50767d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, only the -static extldflags may be set in the
golang-package infra. However, in some cases, it might be necessary to
pass other flags, either because they are needed on a specific
architecture, or a specific C library; packages may also have a need
to pass arbitrary linker flags when they use CGO linking.

For example, on AArch64, go forcibly uses ld.gold, but it is not
available in all toolchains, and ld.bfd works nowadays (following
patch); another case is musl, where PIE is not supported with go.

Introduce FOO_EXTLDFLAGS, which we use to set those flags, and that
packages can set to pass such flags.

Migrate the current setting of -static to use that new variable.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Tested-by: Nathaniel Roach <nroach44@nroach44.id.au>
Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Reviewed-by: Yann E. MORIN <yann.morin@orange.com>
Reviewed-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 docs/manual/adding-packages-golang.adoc | 6 ++++--
 package/pkg-golang.mk                   | 6 +++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-golang.adoc b/docs/manual/adding-packages-golang.adoc
index aa25426591..6de0916a83 100644
--- a/docs/manual/adding-packages-golang.adoc
+++ b/docs/manual/adding-packages-golang.adoc
@@ -84,8 +84,10 @@ therefore only use a few of them, or none.
   infrastructure will automatically generate a minimal +go.mod+ file
   in the package source tree if it doesn't exist.
 
-* +FOO_LDFLAGS+ and +FOO_TAGS+ can be used to pass respectively the
-  +LDFLAGS+ or the +TAGS+ to the +go+ build command.
+* +FOO_LDFLAGS+, +FOO_EXTLDFLAGS+, and +FOO_TAGS+ can be used to pass
+  respectively the go +LDFLAGS+ (via the `-ldflags` command line flag),
+  the external linker flags +EXTLDFLAGS+ (via the `-extldflags`
+  command line flag), or the +TAGS+ to the +go+ build command.
 
 * +FOO_BUILD_TARGETS+ can be used to pass the list of targets that
   should be built. If +FOO_BUILD_TARGETS+ is not specified, it
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 33cf9bfb1a..a3421af288 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -114,10 +114,14 @@ ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 
 ifeq ($(BR2_STATIC_LIBS),y)
-$(2)_LDFLAGS += -extldflags '-static'
+$(2)_EXTLDFLAGS += -static
 $(2)_TAGS += osusergo netgo
 endif
 
+ifneq ($$($(2)_EXTLDFLAGS),)
+$(2)_LDFLAGS += -extldflags '$$($(2)_EXTLDFLAGS)'
+endif
+
 # Build package for target
 define $(2)_BUILD_CMDS
 	$$(foreach d,$$($(2)_BUILD_TARGETS),\
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
