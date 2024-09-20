Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A816FC78858
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 14:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45E9E42C10;
	Fri, 20 Sep 2024 14:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJQqbiI5tHsZ; Fri, 20 Sep 2024 14:54:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D640942C18
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D640942C18;
	Fri, 20 Sep 2024 14:54:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B1101BF39E
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 14:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59E236F589
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 14:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wMkES4UaXCt1 for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 14:53:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 779326062A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 779326062A
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 14:53:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58BCD84148; Fri, 20 Sep 2024 14:53:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 16:51:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06397d26a0cef5ddce0b04919acac8f4d63dacbf
X-Git-Newrev: 2100a76d9ef620d9749352fb85f83720412598ec
X-Patchwork-Hint: ignore
Message-Id: <20240920145344.58BCD84148@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts: fix RPATH fixups
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
Content-Type: multipart/mixed; boundary="===============6568247071136449495=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6568247071136449495==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2100a76d9ef620d9749352fb85f83720412598ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a87abcf6da65 (Makefile: run PPD and RPATH fixup in host-fialize)
(sic) moved the fixups peviously done in prepare-sdk, to host-finalize.

This exposed a bug in fix-rpath, when RPATH contains multiple entries,
like:  /PPD/host-foo/host/lib:/PPD/host-foo/host/lib/foo

In that situation, we want to get rid of /PPD/host-foo and replace it
with the finale HOST_DIR, so we mangle the RPATH with a sed expression.

However, that sed expression only ever replaces the first match, as it
is missing the 'g' option. Thus, the second (and following) parts of
RPATH are still referring to the PPD, and thus patchelf does not find it
relative to the final HOST_DIR, amd rops it. This eventually lead to a
final RPATH set as $ORIGIN/../lib instead of the expected
$ORIGIN/../lib:$ORIGIN/../lib/foo

This is the case for host-systemd, which installs some of its libraries
in $PREFIX/lib/systemd/ and adds an RPATH set appropriately to
/PPD/host-systemd/host/lib:/PPD/host-systemd/host/lib/systemd and that
gets incorrectly mangled.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/issues/39

Also fix a typo in the comment just above.

Reported-by: José Luis Salvador Rufo @jlsalvador
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Reviewed-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Reviewed-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/fix-rpath | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index 1e58646cea..d3421504a5 100755
--- a/support/scripts/fix-rpath
+++ b/support/scripts/fix-rpath
@@ -84,9 +84,9 @@ patch_file() {
     # work with the --make-rpath-relative ${rootdir} invocation as
     # the per-package host directory is not within ${rootdir}. So,
     # we rewrite all RPATHs pointing to per-package directories so
-    # that they point to the global host directry.
+    # that they point to the global host directory.
     # shellcheck disable=SC2001 # ${var//search/replace} hard when search or replace have / in them
-    changed_rpath="$(echo "${rpath}" | sed "s@${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@")"
+    changed_rpath="$(echo "${rpath}" | sed "s@${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@g")"
     if test "${rpath}" != "${changed_rpath}" ; then
         "${PATCHELF}" --set-rpath "${changed_rpath}" "${file}"
     fi

--===============6568247071136449495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6568247071136449495==--
