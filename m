Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67992C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AD4941633;
	Wed, 28 Feb 2024 21:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DR3JtKROjvPI; Wed, 28 Feb 2024 21:26:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE4F54044D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE4F54044D;
	Wed, 28 Feb 2024 21:26:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E19C1BF955
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19DB04026F
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gEFATdbFCDx9 for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA7D9400AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA7D9400AB
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A682C87CDC; Wed, 28 Feb 2024 21:25:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:00:24 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c6767e03ba69fe7bf8e74cc2b43664b2ddf18673
X-Git-Newrev: b348beb3585336ce601f6bec69c6d0567186153d
X-Patchwork-Hint: ignore
Message-Id: <20240228212548.A682C87CDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/lynx: fix openssl
 static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=b348beb3585336ce601f6bec69c6d0567186153d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Use LDFLAGS instead of LIBS to fix the following openssl static build
failure raised because lynx filters out duplicates (i.e. -lz) in
CF_ADD_LIBS:

configure:12958: checking for inet_ntoa
configure:12995: /home/autobuild/autobuild/instance-7/output-1/host/bin/x86_64-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Ofast -g0 -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DLINUX  -static conftest.c -L/home/autobuild/autobuild/instance-7/output-1/host/bin/../x86_64-buildroot-linux-uclibc/sysroot/usr/lib64 -lssl -L/home/autobuild/autobuild/instance-7/output-1/host/bin/../x86_64-buildroot-linux-uclibc/sysroot/usr/lib64 -lz -pthread -lcrypto -lz -pthread  >&5
configure:12998: $? = 0
configure:13001: test -s conftest
configure:13004: $? = 0
configure:13014: result: yes
configure:13095: checking for gethostbyname
configure:13151: result: yes
configure:13232: checking for strcasecmp
configure:13288: result: yes
configure:13401: checking for inet_aton function
configure:13443: /home/autobuild/autobuild/instance-7/output-1/host/bin/x86_64-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Ofast -g0 -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DLINUX  -static conftest.c  -L/home/autobuild/autobuild/instance-7/output-1/host/bin/../x86_64-buildroot-linux-uclibc/sysroot/usr/lib64 -lssl -lz -pthread -lcrypto >&5

[...]

/home/autobuild/autobuild/instance-7/output-1/host/bin/x86_64-buildroot-linux-uclibc-gcc -DHAVE_CONFIG_H  -DLOCALEDIR=\"/usr/share/locale\" -I. -I.. -Ichrtrans -I./chrtrans -I.. -I../src -I.././WWW/Library/Implementation    -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DLINUX -I/home/autobuild/autobuild/instance-7/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include -I/home/autobuild/autobuild/instance-7/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/openssl  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Ofast -g0 -static  -Wl,-rpath,/home/autobuild/autobuild/instance-7/output-1/host/bin/../x86_64-buildroot-linux-uclibc/sysroot/usr/lib64 -Wl,-rpath,/home/autobuild/autobuild/instance-7/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib   -L/home/autobuild/autobuild/instance-7/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib -static -o lynx  LYebcdic.o LYClean.o LYShowInfo.o LYEdit.o L
 YStrings.o LYMail.o HTAlert.o GridText.o LYGetFile.o LYMain.o LYMainLoop.o LYCurses.o LYBookmark.o LYmktime.o LYUtils.o LYOptions.o LYReadCFG.o LYSearch.o LYHistory.o LYForms.o LYPrint.o LYrcFile.o LYDownload.o LYNews.o LYKeymap.o HTML.o HTFWriter.o HTInit.o DefaultStyle.o LYUpload.o LYLeaks.o LYexit.o LYJump.o LYList.o LYCgi.o LYTraversal.o LYEditmap.o LYCharSets.o LYCharUtils.o LYMap.o LYCookie.o LYStyle.o LYHash.o LYPrettySrc.o TRSTable.o parsdate.o UCdomap.o UCAux.o UCAuto.o  LYSession.o LYLocal.o  .././WWW/Library/Implementation/libwww.a -lz -static -lncurses -lssl -lcrypto -L/home/autobuild/autobuild/instance-7/output-1/host/bin/../x86_64-buildroot-linux-uclibc/sysroot/usr/lib64 -pthread
/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/x86_64-buildroot-linux-uclibc/11.4.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-7/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(libcrypto-lib-c_zlib.o): in function `zlib_oneshot_expand_block':
c_zlib.c:(.text+0xb8b): undefined reference to `uncompress'

Patching aclocal.m4 is not possible as autoreconf fails due to missing
AC_DIVERT_HELP macro.

This build failure is only raised by autobuilders since 2024 for an
unknown reason.

Fixes:
 - http://autobuild.buildroot.org/results/6d4119b54fc6b6111a03f81e131e83bae0d844d1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ef5d3327a1f030924cb5f000d568fc69f7e7ec53)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lynx/lynx.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
index 3f62f4f5b7..b441eacef7 100644
--- a/package/lynx/lynx.mk
+++ b/package/lynx/lynx.mk
@@ -53,6 +53,8 @@ LYNX_DEPENDENCIES += libidn
 LYNX_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libidn`
 endif
 
-LYNX_CONF_ENV = LIBS="$(LYNX_LIBS)" CFLAGS="$(TARGET_CFLAGS) $(LYNX_CFLAGS)"
+LYNX_CONF_ENV = \
+	LDFLAGS="$(TARGET_LDFLAGS) $(LYNX_LIBS)" \
+	CFLAGS="$(TARGET_CFLAGS) $(LYNX_CFLAGS)"
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
