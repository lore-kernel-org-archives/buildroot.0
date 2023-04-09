Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A61EC77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 21:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F76D60FAA;
	Sun,  9 Apr 2023 21:00:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F76D60FAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AVYtRHr-RreH; Sun,  9 Apr 2023 21:00:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CABA60F23;
	Sun,  9 Apr 2023 21:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CABA60F23
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 130BA1BF2A9
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 20:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E20C4404A5
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 20:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E20C4404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aHsS05pBdAdg for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 20:59:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 185C640151
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 20:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 185C640151
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01C2183C07; Sun,  9 Apr 2023 20:59:19 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Apr 2023 21:59:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29d6f319a0aed8ebad6bb3aef18b13479886aa54
X-Git-Newrev: 60fdaf56fed83614ecdeab5e49de8087b78219cd
X-Patchwork-Hint: ignore
Message-Id: <20230409205919.01C2183C07@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: check files in
 support/
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

commit: https://git.buildroot.net/buildroot/commit/?id=60fdaf56fed83614ecdeab5e49de8087b78219cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The .mk files inside both support/dependencies and support/misc are not
package recipes, similar to package/pkg-*.mk. The check-package don't
apply to them. Therefore ignore such files.

In the test infra, some br2-externals are used as fixtures to provide
(sometimes) failure cases, so ignore files in these directories.

Files inside support/kconfig are files copied from linux upstream, so do
not generate warnings for them.

support/gnuconfig contains auto-generated config.{guess,sub} files,
so do not generate shellcheck warnings for them.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore | 42 ++++++++++++++++++++++++++++++++++++++++++
 utils/check-package |  6 ++++++
 2 files changed, 48 insertions(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index ae4356f500..81ca4d8de9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -288,3 +288,45 @@ package/x11r7/xdriver_xf86-video-savage/0001-cross-compile.patch Sob
 package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch Sob
 package/x11r7/xserver_xorg-server/S40xorg Shellcheck Variables
 package/xl2tp/xl2tpd TrailingSpace
+support/dependencies/check-host-asciidoc.sh Shellcheck
+support/dependencies/check-host-cmake.sh Shellcheck
+support/dependencies/check-host-gzip.sh Shellcheck
+support/dependencies/check-host-lzip.sh Shellcheck
+support/dependencies/check-host-make.sh Shellcheck
+support/dependencies/check-host-python3.sh Shellcheck
+support/dependencies/check-host-tar.sh Shellcheck
+support/dependencies/check-host-xzcat.sh Shellcheck
+support/dependencies/dependencies.sh Shellcheck
+support/download/bzr ConsecutiveEmptyLines Shellcheck
+support/download/cargo-post-process Shellcheck
+support/download/check-hash Shellcheck
+support/download/cvs Shellcheck
+support/download/dl-wrapper Shellcheck
+support/download/file Shellcheck
+support/download/git Shellcheck
+support/download/go-post-process Shellcheck
+support/download/hg Shellcheck
+support/download/scp Shellcheck
+support/download/sftp Shellcheck
+support/download/svn Shellcheck
+support/download/wget Shellcheck
+support/gnuconfig/update Shellcheck
+support/libtool/buildroot-libtool-v1.5.patch ApplyOrder Sob
+support/libtool/buildroot-libtool-v2.2.patch ApplyOrder Sob
+support/libtool/buildroot-libtool-v2.4.4.patch ApplyOrder
+support/libtool/buildroot-libtool-v2.4.patch ApplyOrder Sob
+support/misc/relocate-sdk.sh Shellcheck
+support/scripts/apply-patches.sh Shellcheck
+support/scripts/br2-external Shellcheck
+support/scripts/check-bin-arch Shellcheck
+support/scripts/check-host-rpath Shellcheck
+support/scripts/expunge-gconv-modules Shellcheck
+support/scripts/fix-configure-powerpc64.sh EmptyLastLine
+support/scripts/fix-rpath Shellcheck
+support/scripts/generate-gitlab-ci-yml Shellcheck
+support/scripts/mkmakefile ConsecutiveEmptyLines Shellcheck
+support/scripts/mkusers Shellcheck
+support/scripts/setlocalversion Shellcheck
+support/testing/tests/core/post-build.sh Shellcheck
+support/testing/tests/package/test_opkg/post-build.sh Shellcheck
+support/testing/tests/utils/test_get_developers/0001-package-binutils-change-.mk.patch NumberedSubject
diff --git a/utils/check-package b/utils/check-package
index e3b7d8515f..27070571c9 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -112,6 +112,7 @@ DO_CHECK_INTREE = re.compile(r"|".join([
     r"fs/",
     r"linux/",
     r"package/",
+    r"support/",
     r"system/",
     r"toolchain/",
     r"utils/",
@@ -121,6 +122,11 @@ DO_NOT_CHECK_INTREE = re.compile(r"|".join([
     r"fs/common\.mk$",
     r"package/doc-asciidoc\.mk$",
     r"package/pkg-\S*\.mk$",
+    r"support/dependencies/[^/]+\.mk$",
+    r"support/gnuconfig/config\.",
+    r"support/kconfig/",
+    r"support/misc/[^/]+\.mk$",
+    r"support/testing/tests/.*br2-external/",
     r"toolchain/helpers\.mk$",
     r"toolchain/toolchain-external/pkg-toolchain-external\.mk$",
     ]))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
