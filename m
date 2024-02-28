Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D31AC47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57FC3416A2;
	Wed, 28 Feb 2024 21:27:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tt_U-efSBccN; Wed, 28 Feb 2024 21:27:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3608741774
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3608741774;
	Wed, 28 Feb 2024 21:27:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2CDE1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 473F5818DC
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osAhWgRV4M5r for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49B36818D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49B36818D7
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E91D087CE2; Wed, 28 Feb 2024 21:25:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:00:08 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: f24d68dde05e83f3baa5e56c50fcd6cfaf699caa
X-Git-Newrev: 111c2eeef14de20a3b3b1e9ebc2247346cb5b855
X-Patchwork-Hint: ignore
Message-Id: <20240228212551.E91D087CE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/lynx: fix openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=111c2eeef14de20a3b3b1e9ebc2247346cb5b855
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
