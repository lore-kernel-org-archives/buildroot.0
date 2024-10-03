Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDF5CF857A
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 11:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B62AF413F9;
	Thu,  3 Oct 2024 11:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTsC9f7xhcNs; Thu,  3 Oct 2024 11:16:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B42BD4054A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B42BD4054A;
	Thu,  3 Oct 2024 11:16:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFA521BF28B
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 11:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D80D94056E
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 11:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBH2TgoK7ysI for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 11:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FB7B4054A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FB7B4054A
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 11:16:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57B2E84BD0; Thu,  3 Oct 2024 11:16:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 3 Oct 2024 11:29:57 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: c4d4df57b3e1c450c75fbd22b9e87377236176fc
X-Git-Newrev: 7a4f80420781f533a2db61d6597d6c50c9ac54d1
X-Patchwork-Hint: ignore
Message-Id: <20241003111614.57B2E84BD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] boot/grub2: needs
 host-python3
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
Content-Type: multipart/mixed; boundary="===============3909045599760361423=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3909045599760361423==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7a4f80420781f533a2db61d6597d6c50c9ac54d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

When the build host does not have a Python interpreter installed,
host-grub2 is failing to configure due to this missing interpreter.
Note that host-grub2 is the first package to fail because it is a
dependency of grub2. The grub2 target package has the same dependency
requirement.

The issue can be quickly reproduced on a host without Python with the
commands:

    cat <<EOF >.config
    BR2_aarch64=y
    BR2_TARGET_GRUB2=y
    BR2_TOOLCHAIN_EXTERNAL=y
    EOF
    make olddefconfig
    make grub2

grub2 autotools configure.ac search for a Python interpreter since
upstream commit [1] 8b467844e "python: Use AM_PATH_PYTHON to determine
interpreter for gentpl.py", first included in grub v2.04 released
on 2019-07-04. For reference, grub2 has been updated to that version
in commit [2] ea7ec41c "boot/grub2: bump to verson 2.04".

This commit fixes the issue by adding the host-python3 dependency to
host-grub2 and grub2.

Fixes:

    checking for a Python interpreter with version >= 2.6... none
    configure: error: no suitable Python interpreter found

[1] https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=8b467844e11170077c8ca727c39d2bd36eeb5f08
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/ea7ec41cf64e86a692ac45e0d012c6e8199ef110

Reported-by: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 86bb1b2360bdaed069cd087541f4edad1d5ce925)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/grub2/grub2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 1263c63cfd..7c95adc739 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -9,8 +9,8 @@ GRUB2_SITE = http://ftp.gnu.org/gnu/grub
 GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
 GRUB2_LICENSE = GPL-3.0+
 GRUB2_LICENSE_FILES = COPYING
-GRUB2_DEPENDENCIES = host-bison host-flex host-gawk host-grub2
-HOST_GRUB2_DEPENDENCIES = host-bison host-flex host-gawk
+GRUB2_DEPENDENCIES = host-bison host-flex host-gawk host-grub2 host-python3
+HOST_GRUB2_DEPENDENCIES = host-bison host-flex host-gawk host-python3
 GRUB2_INSTALL_IMAGES = YES
 
 # CVE-2019-14865 is about a flaw in the grub2-set-bootflag tool, which

--===============3909045599760361423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3909045599760361423==--
