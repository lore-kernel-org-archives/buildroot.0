Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC99CD13DE
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 16:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD07781E54;
	Sat, 31 Aug 2024 16:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yzj-9A_N224F; Sat, 31 Aug 2024 16:25:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6359381985
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6359381985;
	Sat, 31 Aug 2024 16:25:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A7191BF2C3
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 16:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 834D5400B9
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 16:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RbdPsb-jU2Ui for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 16:24:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53191400F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53191400F9
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 16:24:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F55586785; Sat, 31 Aug 2024 16:24:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 18:20:36 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: fe60ac7a779c7cc958eb2046834ce481cc65deee
X-Git-Newrev: 4aff9fae454495d071829cbe651643b2fcc94a96
X-Patchwork-Hint: ignore
Message-Id: <20240831162459.3F55586785@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/am335x-pru-package: fix download issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=4aff9fae454495d071829cbe651643b2fcc94a96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

am335x-pru-package is downloaded with the github helper, so the tarball
is generated "on-the-fly" by github.

It looks like the process to generate those tarballs has changed,
again.  The hash for the archive has recently changed. The delta is in
the way directories are stored in the tarball: it looks like the
"basename" of the directory path has been split off from the
"dirname", into a separate field:

@@ -270078,8 +270078,8 @@
 0041efd0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 0041efe0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 0041eff0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
-0041f000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
-0041f010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
+0041f000  50 52 55 5f 50 52 55 74  6f 50 52 55 5f 49 6e 74 |PRU_PRUtoPRU_Int|
+0041f010  65 72 72 75 70 74 2f 00  00 00 00 00 00 00 00 00 |errupt/.........|
 0041f020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 0041f030  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 0041f040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
@@ -270104,8 +270104,8 @@
 0041f170  34 61 64 35 37 63 63 31  39 35 66 32 38 62 66 35 |4ad57cc195f28bf5|
 0041f180  65 35 38 35 63 33 64 34  34 36 61 62 61 36 65 65 |e585c3d446aba6ee|
 0041f190  37 30 39 36 2f 70 72 75  5f 73 77 2f 65 78 61 6d |7096/pru_sw/exam|
-0041f1a0  70 6c 65 5f 61 70 70 73  2f 50 52 55 5f 50 52 55 |ple_apps/PRU_PRU|
-0041f1b0  74 6f 50 52 55 5f 49 6e  74 65 72 72 75 70 74 00 |toPRU_Interrupt.|
+0041f1a0  70 6c 65 5f 61 70 70 73  00 00 00 00 00 00 00 00 |ple_apps........|
+0041f1b0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 0041f1c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 0041f1d0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 0041f1e0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|

Switch to using a git download, which uses our reproducible way of
generating archives.

Once extracted, the files have been verified to be identical to the ones
in the archive on s.b.o.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5206e1dba2ccb8e65fc960362017c72799b0e5df)
[Peter adjust filename/hash for 2024.02.x]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/am335x-pru-package/am335x-pru-package.hash | 2 +-
 package/am335x-pru-package/am335x-pru-package.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/am335x-pru-package/am335x-pru-package.hash b/package/am335x-pru-package/am335x-pru-package.hash
index ad386fe04b..a6fc8109af 100644
--- a/package/am335x-pru-package/am335x-pru-package.hash
+++ b/package/am335x-pru-package/am335x-pru-package.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2a902f825ccc1885c5dccd83e1ccee104aa30e601c9964a24f49459f76f674b9  am335x-pru-package-5f374ad57cc195f28bf5e585c3d446aba6ee7096.tar.gz
+sha256  065807a896717a112a8630883ae87271a7586db7c72f21ec3572f76dd77ec34b  am335x-pru-package-5f374ad57cc195f28bf5e585c3d446aba6ee7096-br1.tar.gz
 sha256  f0fcdf9b2090896389eb4b784f23be96d5544c5ce5282d84f82ae9a8e8331beb  pru_sw/utils/LICENCE.txt
diff --git a/package/am335x-pru-package/am335x-pru-package.mk b/package/am335x-pru-package/am335x-pru-package.mk
index 24a5df4815..9c65ee1387 100644
--- a/package/am335x-pru-package/am335x-pru-package.mk
+++ b/package/am335x-pru-package/am335x-pru-package.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 AM335X_PRU_PACKAGE_VERSION = 5f374ad57cc195f28bf5e585c3d446aba6ee7096
-AM335X_PRU_PACKAGE_SITE = $(call github,beagleboard,am335x_pru_package,$(AM335X_PRU_PACKAGE_VERSION))
+AM335X_PRU_PACKAGE_SITE = https://github.com/beagleboard/am335x_pru_package
+AM335X_PRU_PACKAGE_SITE_METHOD = git
 AM335X_PRU_PACKAGE_LICENSE = BSD-3-Clause
 AM335X_PRU_PACKAGE_LICENSE_FILES = pru_sw/utils/LICENCE.txt
 AM335X_PRU_PACKAGE_DEPENDENCIES = host-am335x-pru-package
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
