Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A402C43334
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 07:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AF9584514;
	Sat,  4 Jun 2022 07:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p83wsTV5Ze9b; Sat,  4 Jun 2022 07:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B71F48446E;
	Sat,  4 Jun 2022 07:56:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C813D1BF429
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 07:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6DC94018F
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 07:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cmDeFtvgpsfr for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 07:56:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D207405D3
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 07:56:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1389984606; Sat,  4 Jun 2022 07:44:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Jun 2022 09:55:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1061ed6c6273e90618b05ddc0cb66be17364da33
X-Git-Newrev: 2a9ef1f5721990322b6965e00b7f099239d7ad23
X-Patchwork-Hint: ignore
Message-Id: <20220604074421.1389984606@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts: handle paths with regex
 characters in per-package
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a9ef1f5721990322b6965e00b7f099239d7ad23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some constraints on a setup ended up with a plus sign in the path
for historical reasons and would then fail to match on the comparison
of the host/lib dir match. So, the =~ for bash can be augmented
with a double quote expansion to preserve the literal value of
the characters in the variable.

Example Path: /home/vagrant/test+buildroot/per-package

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/check-host-rpath | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index 9a3866982b..b27cb883f3 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -98,7 +98,7 @@ check_elf_has_rpath() {
 	    # PER_PACKAGE_DIR and therefore ${perpackagedir} points to
 	    # a non-existent directory, and this check will always be
 	    # false.
-            [[ ${dir} =~ ${perpackagedir}/[^/]+/host/lib ]] && return 0
+            [[ ${dir} =~ "${perpackagedir}/"[^/]+/host/lib ]] && return 0
         done
     done < <( readelf -d "${file}"                                              \
               |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
