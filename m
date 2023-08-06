Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803E0C04A6A
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 11:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36C93815CD;
	Sun,  6 Aug 2023 11:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36C93815CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oo3oMqYyiH7C; Sun,  6 Aug 2023 11:55:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78B07818A2;
	Sun,  6 Aug 2023 11:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78B07818A2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52E431BF293
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B1C3400DD
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B1C3400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 804Zytkf9dTI for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 11:54:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9C8640192
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 11:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9C8640192
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4786842F3; Sun,  6 Aug 2023 11:54:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 13:48:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4f053c7b0582251c8441def72619bbe18bb78ea
X-Git-Newrev: bcfa3d6d1b45e8aedea38142c12665d7d76f390b
X-Patchwork-Hint: ignore
Message-Id: <20230806115456.C4786842F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tvheadend: needs __sync_*_8
 intrisics
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

commit: https://git.buildroot.net/buildroot/commit/?id=bcfa3d6d1b45e8aedea38142c12665d7d76f390b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/992/99235aa2aca1afe031a088baebbd46057fe75fcd/

/home/autobuild/autobuild/instance-15/output-1/build/tvheadend-fe47ecb5504a521fed9c1ca9705fb0dd2bb8443a/src/atomic.h:253:
 undefined reference to `__sync_lock_test_and_set_8'
/home/autobuild/autobuild/instance-15/output-1/build/tvheadend-fe47ecb5504a521fed9c1ca9705fb0dd2bb8443a/src/atomic.h:81:
 undefined reference to `__sync_fetch_and_add_8'

The build error was introduced by the latest bump of tvheadend with
commit 67cbbbfe6e9632deacd0784bdbf51496ad76701d.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tvheadend/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 3d21897c6d..fa06f345e9 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,14 +1,14 @@
 comment "tvheadend needs a toolchain w/ NPTL, headers >= 3.2, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_HAS_SYNC_8
 
 menuconfig BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
 	depends on !BR2_STATIC_LIBS # dladdr()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_HAS_SYNC_8
 	select BR2_PACKAGE_DTV_SCAN_TABLES
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
