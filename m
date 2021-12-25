Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DEDC433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 10:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC4D5402FA;
	Sat, 25 Dec 2021 10:54:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uDW1ixOSK9dN; Sat, 25 Dec 2021 10:54:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FDB740286;
	Sat, 25 Dec 2021 10:54:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C307F1BF83E
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 10:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A86E2400FE
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 10:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZRj7258aPzl for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 10:53:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1FE640111
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 10:53:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6939B82ACF; Sat, 25 Dec 2021 10:47:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 25 Dec 2021 11:52:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45c28b417a9debe1f60c6a59dd6724374b680e89
X-Git-Newrev: 443abba065d396514de73535898a91993f377afa
X-Patchwork-Hint: ignore
Message-Id: <20211225104744.6939B82ACF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnetconf2: disable tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=443abba065d396514de73535898a91993f377afa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tests are not disabled since bump to version 2.0.24 in commit
721f05420cb5908aa19eef47f96418aa6cd04398 and
https://github.com/CESNET/libnetconf2/commit/2cd716353d0922ff57c34ead58fbcd14b7fb92af
resulting in the following build failure if cmocka is found:

In file included from /home/buildroot/autobuild/instance-2/output-1/build/libnetconf2-2.0.24/tests/client/test_client_ssh.c:8:
/home/buildroot/autobuild/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/cmocka.h:2334:47: error: unknown type name 'va_list'
 2334 | void vprint_message(const char* const format, va_list args) CMOCKA_PRINTF_ATTRIBUTE(1, 0);
      |                                               ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/fe793ae69d952a7a07d6d07e179925b67469dff4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnetconf2/libnetconf2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 33e1fadf76..ddbb99b7ed 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -13,7 +13,7 @@ LIBNETCONF2_DEPENDENCIES = libyang
 HOST_LIBNETCONF2_DEPENDENCIES = host-libyang
 
 LIBNETCONF2_CONF_OPTS = \
-	-DENABLE_BUILD_TESTS=OFF \
+	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF
 
 ifeq ($(BR2_PACKAGE_LIBSSH_SERVER), y)
@@ -31,7 +31,7 @@ LIBNETCONF2_CONF_OPTS += -DENABLE_TLS=OFF
 endif
 
 HOST_LIBNETCONF2_CONF_OPTS = \
-	-DENABLE_BUILD_TESTS=OFF \
+	-DENABLE_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF \
 	-DENABLE_SSH=OFF \
 	-DENABLE_TLS=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
