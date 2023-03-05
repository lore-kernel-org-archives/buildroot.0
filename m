Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E211C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 18:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12F2360FB9;
	Sun,  5 Mar 2023 18:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12F2360FB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ly6lLO5GzPBL; Sun,  5 Mar 2023 18:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4536960FCB;
	Sun,  5 Mar 2023 18:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4536960FCB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 525A21BF3DA
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F3A160E66
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F3A160E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GR-p2QfPwhFN for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 18:37:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A474E60F99
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 18:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A474E60F99
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 907B9867E7; Sun,  5 Mar 2023 18:37:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 19:36:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 091655d9ad3a3b3f05be4216b5936b644a596267
X-Git-Newrev: b1312da7650b41d95aecf29fab85fd6a9903c507
X-Patchwork-Hint: ignore
Message-Id: <20230305183743.907B9867E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proftpd: needs dynamic library
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1312da7650b41d95aecf29fab85fd6a9903c507
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
