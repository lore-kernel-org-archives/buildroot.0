Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30A4C54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 13:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D26C40A7D;
	Mon, 18 Mar 2024 13:33:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-tQeXZVlUqK; Mon, 18 Mar 2024 13:33:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0504340A77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0504340A77;
	Mon, 18 Mar 2024 13:33:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A55261BF954
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AC2281447
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rwuvn52zHjdH for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 13:32:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C46F481448
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C46F481448
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 13:32:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B29B582A14; Mon, 18 Mar 2024 13:32:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 14:29:45 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 34005948ef1b1cc9937e060a0b310efb88983a99
X-Git-Newrev: 50ae04570bff48734154104f79f3a8ddda8bf3fd
X-Patchwork-Hint: ignore
Message-Id: <20240318133246.B29B582A14@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/dracut: fix
 dracut_wrapper
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

commit: https://git.buildroot.net/buildroot/commit/?id=50ae04570bff48734154104f79f3a8ddda8bf3fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

As reported by Thierry Bultel [1], dracut doesn't work since the
version bump to version 059.

Further investigation by Andreas Naumann [2] reported that the issue
come from this commit d010fa0 refactor(dracut-install): fork() instead
of popen(), sanitise line reading [3].

The issue come from our dracut_wrapper and how DRACUT_LDD is defined.
Indeed dracut expect DRACUT_LDD=ldd or a single binary (without
arguments) but we are using "prelink-rtld --root='${sysroot}'".

With the change introduced by [3], our DRACUT_LDD is used
directly by execlp() leading to an error:

  execlp(ldd, ldd, fullsrcpath, (char *)NULL);

Use mktemp to generate a temporary dracut-ldd script using
prelink-rtld --root='${sysroot}' ${1}

execute dracut.real in a subshell to cleanup the temporary file
at the end of the dracut wrapper script.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243423 [tests.fs.test_cpio.TestCpioDracutGlibcMergedUsr]
https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243434 [tests.fs.test_cpio.TestCpioDracutMuslMergedUsr]
https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243567 [tests.fs.test_cpio.TestCpioDracutUclibcMergedUsr]
https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243559 [tests.fs.test_cpio.TestCpioDracutGlibc]
https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243504 [tests.fs.test_cpio.TestCpioDracutUclibc]
https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243498 [tests.fs.test_cpio.TestCpioDracutMusl]

[1] http://lists.busybox.net/pipermail/buildroot/2024-February/684145.html
[2] http://lists.busybox.net/pipermail/buildroot/2024-February/684503.html
[3] https://github.com/dracutdevs/dracut/commit/d010fa0d7f8ef42ad31729d027d2e4be6dd6e588

Fixes: 145f01ded5 ("package/dracut: bump to version 059")
Reported-by: Thierry Bultel <thierry.bultel@linatsea.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 82afcacb620b834cef157a8c2d9ad54ff76e4e4f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dracut/dracut_wrapper | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/dracut/dracut_wrapper b/package/dracut/dracut_wrapper
index 0464db17fe..968d65cbeb 100644
--- a/package/dracut/dracut_wrapper
+++ b/package/dracut/dracut_wrapper
@@ -31,8 +31,18 @@ if [ -z "${sysroot}" ]; then
 fi
 
 topdir="$(dirname "$(realpath "$(dirname "${0}")")")"
-export DRACUT_LDD="${topdir}/sbin/prelink-rtld --root='${sysroot}'"
+DRACUT_LDD="$(mktemp /tmp/dracut-ldd.XXXXXX)"
+cat >"${DRACUT_LDD}" <<EOL
+#!/bin/bash
+${topdir}/sbin/prelink-rtld --root='${sysroot}' \${1}
+EOL
+chmod +x "${DRACUT_LDD}"
+export DRACUT_LDD
 export DRACUT_INSTALL="${topdir}/lib/dracut/dracut-install"
 export DRACUT_LDCONFIG=/bin/true
 export dracutbasedir="${topdir}/lib/dracut"
-exec "${topdir}/bin/dracut.real" "${@}"
+(exec "${topdir}/bin/dracut.real" "${@}")
+
+if [ -n "${DRACUT_LDD}" ]; then
+	rm -f "${DRACUT_LDD}"
+fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
