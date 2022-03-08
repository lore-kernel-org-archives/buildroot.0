Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F2DC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 20:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E06A409AC;
	Tue,  8 Mar 2022 20:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWSEN_1TNJ5O; Tue,  8 Mar 2022 20:16:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DB4A40339;
	Tue,  8 Mar 2022 20:16:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73E971BF86C
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 20:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EB2F8294A
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 20:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BJNCnux9ICkn for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 20:16:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5AF682907
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 20:16:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B598F837E6; Tue,  8 Mar 2022 20:07:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Mar 2022 21:11:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5259807318699646a7bb9cbc24fb137983bc5270
X-Git-Newrev: 8539378771f7201bf29f207b3d4d6c9e943f3952
X-Patchwork-Hint: ignore
Message-Id: <20220308200742.B598F837E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-golang: default to rawname to
 install binaries
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

commit: https://git.buildroot.net/buildroot/commit/?id=8539378771f7201bf29f207b3d4d6c9e943f3952
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default currently is to rely on the package name to decide what to
build and install if not specified by the caller. This works nice for
target packages, where a 'foo' package will by default build and
install a 'foo' executable.

However, for host packages, that will build and install a 'host-foo'
exzcutable, which is not really, even really not, what would be
expected.

We fix that by using the package raw name, i.e. the package name with
the host- prefix yanked away.

It is very improbable that there already are many host-golang packages in
the wild (in br2-external trees), but if there are, they would forcibly
define those variables to a sane value.  This change is not incompatible, as
the values provided by packages take precedence; it's just that those
packages now carry superfluous, if innocuous, variable assignments.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-golang.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 0cb2ed73cc..0b3dc3d32f 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -59,10 +59,10 @@ $(2)_BUILD_TARGETS ?= .
 # been specified, we assume that the binaries to be produced are named
 # after each build target building them (below in <pkg>_BUILD_CMDS).
 ifeq ($$($(2)_BUILD_TARGETS),.)
-$(2)_BIN_NAME ?= $(1)
+$(2)_BIN_NAME ?= $$($(2)_RAWNAME)
 endif
 
-$(2)_INSTALL_BINS ?= $(1)
+$(2)_INSTALL_BINS ?= $$($(2)_RAWNAME)
 
 # Source files in Go usually use an import path resolved around
 # domain/vendor/software. We infer domain/vendor/software from the upstream URL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
