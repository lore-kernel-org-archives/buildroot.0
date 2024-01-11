Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28053C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 20:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A01D16F767;
	Thu, 11 Jan 2024 20:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A01D16F767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0PrPjHpK4NiF; Thu, 11 Jan 2024 20:07:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED2F66F716;
	Thu, 11 Jan 2024 20:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED2F66F716
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EFCA1BF2E5
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 20:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8498342D0B
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 20:07:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8498342D0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z1Zy0QZGkn-9 for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 20:07:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DF6142CC0
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 20:07:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DF6142CC0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A0DE85ED1; Thu, 11 Jan 2024 20:07:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 21:06:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb3ede3b36fe8e38b4e3f17696c4b131e3f84b96
X-Git-Newrev: c07aafa087927ac6f10591bc13e30b7ecd5c7b7f
X-Patchwork-Hint: ignore
Message-Id: <20240111200704.7A0DE85ED1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/Makefile.in: set GIT_DIR=. in
 {HOST, TARGET}_MAKE_ENV
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

commit: https://git.buildroot.net/buildroot/commit/?id=c07aafa087927ac6f10591bc13e30b7ecd5c7b7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A number of packages try to detect if they are running in a git repo and run
git describe at build time instead of using the hard coded version number if
it succeed, leading to odd version numbers as they end up picking up the
Buildroot git version if building inside a Buildroot git checkout, E.G.:

rauc --version
rauc 2023.11-562-g9c954953b4+

This is because rauc builds with meson and uses vcs_tag:

https://github.com/rauc/rauc/blob/v1.11/meson.build#L168-L171

https://mesonbuild.com/Reference-manual_functions.html#vcs_tag

Another example is micropython, where we already work around it by passing
GIT_DIR=.

In the context of Buildroot the packages are never built in their own git
checkout, so pass GIT_DIR=.  to ensure git doesn't walk back up the
directory tree and finds the Buildroot git repo, which fixes the rauc (and
similar) issues.

>>> rauc 1.11 Building
..
ninja: Entering directory `/home/peko/source/buildroot/output-rauc/build/rauc-1.11//build'
[1/29] Generating version.h with a custom command
fatal: not a git repository: '.'

cat output-rauc/build/rauc-1.11/build/version.h
 #define PACKAGE_STRING "rauc 1.11"

 #define PACKAGE_VERSION "1.11"

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Makefile.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 9fbe960759..3e276d23d6 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -263,7 +263,9 @@ export PERL=$(shell which perl)
 # finds this perl module by exporting the proper value for PERL5LIB.
 export PERL5LIB=$(HOST_DIR)/lib/perl
 
-TARGET_MAKE_ENV = PATH=$(BR_PATH)
+TARGET_MAKE_ENV = \
+	GIT_DIR=. \
+	PATH=$(BR_PATH)
 
 TARGET_CONFIGURE_OPTS = \
 	$(TARGET_MAKE_ENV) \
@@ -307,6 +309,7 @@ TARGET_CONFIGURE_OPTS = \
 
 
 HOST_MAKE_ENV = \
+	GIT_DIR=. \
 	PATH=$(BR_PATH) \
 	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 	PKG_CONFIG_SYSROOT_DIR="/" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
