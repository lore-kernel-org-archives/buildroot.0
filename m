Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F8AC47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 20:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21D4660B0F;
	Wed, 31 Jan 2024 20:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21D4660B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rxU90df4QSw0; Wed, 31 Jan 2024 20:26:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33C1B60F33;
	Wed, 31 Jan 2024 20:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33C1B60F33
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75AA21BF5A4
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 20:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B36360B6A
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 20:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B36360B6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-q0jcgnD8ud for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 20:25:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E71560B1A
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 20:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E71560B1A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1964E864EE; Wed, 31 Jan 2024 20:25:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jan 2024 21:21:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 459620aa98fbdace1a9f76d1fa40f7f27a2c4afa
X-Git-Newrev: ef5d3327a1f030924cb5f000d568fc69f7e7ec53
X-Patchwork-Hint: ignore
Message-Id: <20240131202531.1964E864EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lynx: fix openssl static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef5d3327a1f030924cb5f000d568fc69f7e7ec53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
