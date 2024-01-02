Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84141C47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EEB840A5B;
	Tue,  2 Jan 2024 20:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EEB840A5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2eZc2E2G8ZKu; Tue,  2 Jan 2024 20:18:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 255BE40A5F;
	Tue,  2 Jan 2024 20:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 255BE40A5F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9DDA51BF97F
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 776D660FA6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 776D660FA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JFEe-z5geJSs for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 961E460DA5
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 961E460DA5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8490F81DBC; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 21:06:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5cacb63082b9e58194c4b9f8b2af2c3e38ff15c
X-Git-Newrev: 98684ba7885b9a62ba05af9093aa0f1010d1ee02
X-Patchwork-Hint: ignore
Message-Id: <20240102201716.8490F81DBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: fix build without MMU
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

commit: https://git.buildroot.net/buildroot/commit/?id=98684ba7885b9a62ba05af9093aa0f1010d1ee02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 973b1eba5a4ee72f040bd471b147267e36be73ad removed third patch
because of
https://github.com/openssl/openssl/commit/78634e8ac253a8edf338d329965724dfa8e033ab
however OPENSSL_NO_MADVISE wasn't updated to reflect the new
HAVE_MADVISE logic resulting in the following build failure without MMU:

/home/buildroot/autobuild/instance-2/output-1/host/riscv64-buildroot-linux-uclibc/bin/ld.real: libcrypto.a(libcrypto-lib-mem_sec.o): in function `sh_init':
/home/buildroot/autobuild/instance-2/output-1/build/libopenssl-3.2.0/crypto/mem_sec.c:557: undefined reference to `madvise'

Fixes:
 - http://autobuild.buildroot.org/results/4328c025f6f2bcd2ebc5a4368c78e00da0aea1ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libopenssl/libopenssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 928f3379f8..7dc6d93256 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -26,7 +26,7 @@ LIBOPENSSL_CFLAGS += -DOPENSSL_SMALL_FOOTPRINT
 endif
 
 ifeq ($(BR2_USE_MMU),)
-LIBOPENSSL_CFLAGS += -DHAVE_FORK=0 -DOPENSSL_NO_MADVISE
+LIBOPENSSL_CFLAGS += -DHAVE_FORK=0 -DHAVE_MADVISE=0
 endif
 
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
