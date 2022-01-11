Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AFAC433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 21:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1896E40901;
	Tue, 11 Jan 2022 21:02:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XvnVWQsk0dAJ; Tue, 11 Jan 2022 21:02:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36FE740900;
	Tue, 11 Jan 2022 21:02:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BABEF1BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6F5E60F20
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:02:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d6SGjg9v0ROq for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 21:02:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C88460E73
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 21:02:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4DCF682DEC; Tue, 11 Jan 2022 20:55:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 22:01:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81945bde7c282d0ab5f304dc9795e2d68033cd98
X-Git-Newrev: ef4dfe8fcee9fff152d938619562776a9ae03c18
X-Patchwork-Hint: ignore
Message-Id: <20220111205543.4DCF682DEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbedtls: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef4dfe8fcee9fff152d938619562776a9ae03c18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since bump to
version 2.28.0 in commit 0f8aab08e762742d753d5920718f31c629d0f8d7:

/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/mbedtls-2.28.0/library/bignum.c: In function 'mpi_select':
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/mbedtls-2.28.0/library/bignum.c:1994:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for( size_t i = 0; i < T_size; i++ )
     ^
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/mbedtls-2.28.0/library/bignum.c:1994:5: note: use option -std=c99 or -std=gnu99 to compile your code

Fixes:
 - http://autobuild.buildroot.org/results/56ac0a8726d09eed8f45f865934fa7781a0e667a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mbedtls/mbedtls.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 5facb99b2a..8745ff33f4 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -7,6 +7,7 @@
 MBEDTLS_VERSION = 2.28.0
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
 	-DENABLE_TESTING=OFF \
 	-DMBEDTLS_FATAL_WARNINGS=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
