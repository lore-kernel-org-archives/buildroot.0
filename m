Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5273AC02182
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 14:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C183406EC;
	Sat, 14 Sep 2024 14:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mb6ITsTO-L14; Sat, 14 Sep 2024 14:37:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAEE64196F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAEE64196F;
	Sat, 14 Sep 2024 14:37:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E6D31BF28C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59FEB40516
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pj-0vsM4XFex for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 14:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2835C40130
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2835C40130
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12DD182D96; Sat, 14 Sep 2024 14:37:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 16:36:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0cc9fcfd0299f28413786bbdbac1ec9af459d724
X-Git-Newrev: 86bb1b2360bdaed069cd087541f4edad1d5ce925
X-Patchwork-Hint: ignore
Message-Id: <20240914143701.12DD182D96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: needs host-python3
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
Content-Type: multipart/mixed; boundary="===============5810781750748372569=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5810781750748372569==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=86bb1b2360bdaed069cd087541f4edad1d5ce925
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============5810781750748372569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5810781750748372569==--
