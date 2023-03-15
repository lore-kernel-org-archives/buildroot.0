Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03879C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 14:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93E8340B74;
	Wed, 15 Mar 2023 14:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93E8340B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TMlXnBvIOtdo; Wed, 15 Mar 2023 14:12:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC57E40B7B;
	Wed, 15 Mar 2023 14:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC57E40B7B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F2EC21BF3C5
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA1004183F
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA1004183F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id txTj6z2cb8vq for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 14:11:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D80004183B
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 14:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D80004183B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4CE787403; Wed, 15 Mar 2023 14:11:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 15:10:13 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: fb1ba8f28064e5329d74096495ce29e54103e842
X-Git-Newrev: ef2bd60926ec78669b549cc7c154616102633b4a
X-Patchwork-Hint: ignore
Message-Id: <20230315141149.C4CE787403@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/proftpd: needs
 dynamic library
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef2bd60926ec78669b549cc7c154616102633b4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

proftpd doesn't build statically because it does not use pkg-config to
retrieve its dependencies since its addition in commit
5d173ec4122b89857e6d93fc337311b1f87631c9:

/tmp/instance-13/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: /tmp/instance-13/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/lib/libidn2.a(libunistring_la-striconveh.o): in function `iconv_carefully_1':
buildroot/build/libidn2-2.3.4/unistring/striconveh.c:233: undefined reference to `libiconv'

[...]

/tmp/instance-5/output-1/host/lib/gcc/arceb-buildroot-linux-uclibc/10.2.0/../../../../arceb-buildroot-linux-uclibc/bin/ld: /tmp/instance-5/output-1/host/arceb-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(bio_lib.o): in function `BIO_free':
bio_lib.c:(.text+0x3f2): undefined reference to `__atomic_fetch_sub_4'

Fixes:
 - http://autobuild.buildroot.org/results/09f3f37b63dc68d31b18816b818df86fa3be095c
 - http://autobuild.buildroot.org/results/2aba5297206e44dc086c3138ace70e85739196f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b1312da7650b41d95aecf29fab85fd6a9903c507)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proftpd/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index aed1958b8d..7b9f74895a 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PROFTPD
 	bool "proftpd"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
 	help
 	  ProFTPD, a highly configurable FTP server.
 
@@ -104,3 +105,7 @@ config BR2_PACKAGE_PROFTPD_BUFFER_SIZE
 	  0 uses the default size of 1024.
 
 endif
+
+comment "proftpd needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
