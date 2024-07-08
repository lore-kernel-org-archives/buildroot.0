Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA209C3DA41
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 21:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72751402C4;
	Mon,  8 Jul 2024 21:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crQCSVUsOtJI; Mon,  8 Jul 2024 21:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E97324026E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E97324026E;
	Mon,  8 Jul 2024 21:09:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C09B31BF3BD
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADB6040266
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vX__cn1E22s for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 21:09:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87FC54026E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87FC54026E
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 21:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DEDA8415D; Mon,  8 Jul 2024 21:09:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 23:06:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d037d9c2d63e9cd47b3701aaef8e28c32b8f5b37
X-Git-Newrev: 9995ca7caaf75f34e72918218829bc15702432d5
X-Patchwork-Hint: ignore
Message-Id: <20240708210943.6DEDA8415D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shairport-sync: fix patch fuzz
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

commit: https://git.buildroot.net/buildroot/commit/?id=9995ca7caaf75f34e72918218829bc15702432d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, shairport-sync fails to build with output:

    Applying 0001-configure.ac-find-sndfile-through-pkg-config.patch using patch:
    patching file configure.ac
    Hunk #1 FAILED at 304.
    1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                               | 1 -
 .../0001-configure.ac-find-sndfile-through-pkg-config.patch       | 8 +++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f53d785162..d0061485fb 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1314,7 +1314,6 @@ package/setserial/0002-tiocghayesesp-build-fix.patch lib_patch.Upstream
 package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netfilter_conntr.patch lib_patch.Upstream
 package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch lib_patch.Upstream
 package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch lib_patch.Upstream
-package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch lib_patch.Upstream
 package/shairport-sync/S99shairport-sync Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch lib_patch.Upstream
 package/shellinabox/0001-Makefile-disable-always-building-statically.patch lib_patch.Upstream
diff --git a/package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch b/package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch
index bd97ec0c3d..b593703a2a 100644
--- a/package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch
+++ b/package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch
@@ -13,7 +13,9 @@ Fixes:
  - http://autobuild.buildroot.org/results/92ed30a6855ca11800b779718822bcba4a69c9a3
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/mikebrady/shairport-sync/pull/1263]
+Upstream: https://github.com/mikebrady/shairport-sync/pull/1263
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  configure.ac | 9 ++++++++-
  1 file changed, 8 insertions(+), 1 deletion(-)
@@ -22,9 +24,9 @@ diff --git a/configure.ac b/configure.ac
 index f77087c5..9b982c51 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -304,7 +304,14 @@ AC_ARG_WITH(convolution, [AS_HELP_STRING([--with-convolution],[choose audio DSP
+@@ -303,7 +303,14 @@
+ AC_ARG_WITH(convolution, [AS_HELP_STRING([--with-convolution],[choose audio DSP convolution support])])
  if test "x$with_convolution" = "xyes" ; then
-   AM_INIT_AUTOMAKE([subdir-objects])
    AC_DEFINE([CONFIG_CONVOLUTION], 1, [Include audio DSP convolution support.])
 -  AC_CHECK_LIB([sndfile], [sf_open], , AC_MSG_ERROR(Convolution support requires the sndfile library -- libsndfile1-dev suggested!))
 +  if  test "x${with_pkg_config}" = xyes ; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
