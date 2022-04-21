Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B701C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46317411F3;
	Thu, 21 Apr 2022 19:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id seDAVynCufB3; Thu, 21 Apr 2022 19:42:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 384EA411C1;
	Thu, 21 Apr 2022 19:42:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CA491BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BB3D84367
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:42:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AZ9BXoTH5xyG for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:42:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F112B84343
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:42:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D052084031; Thu, 21 Apr 2022 19:32:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 21:41:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53efc185bbd8f777f80b46ba45077c0836844631
X-Git-Newrev: 786f96627cd6e4b4ee5297782e9abbed9453cfd9
X-Patchwork-Hint: ignore
Message-Id: <20220421193211.D052084031@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fetchmail: fix openssl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=786f96627cd6e4b4ee5297782e9abbed9453cfd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following openssl build failure raised since bump to version
6.4.29 in commit ba6fd52195f2e3d0b04baae40cfe084226824d31:

/home/autobuild/autobuild/instance-5/output-1/host/bin/arc-buildroot-linux-gnu-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -I/home/autobuild/autobuild/instance-5/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include -I/usr/kerberos/include  -L/home/autobuild/autobuild/instance-5/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/lib -L/home/autobuild/autobuild/instance-5/output-1/host/bin/../arc-buildroot-linux-gnu/sysroot/usr/lib -o fetchmail socket.o getpass.o fetchmail.o env.o idle.o options.o daemon.o driver.o transact.o sink.o smtp.o idlist.o uid.o mxget.o md5ify.o cram.o gssapi.o opie.o interface.o netrc.o unmime.o conf.o checkalias.o uid_db.o lock.o rcfile_l.o rcfile_y.o ucs/norm_charmap.o fm_realpath.o  pop3.o imap.o etrn.o odmr.o     libfm.a  strlcpy.o strlcat.o  /usr/lib/libssl.so /usr/lib/libcrypto.so
/usr/lib/libssl.so: file not recognized: file format not recognized

Fixes:
 - http://autobuild.buildroot.org/results/815f18f25017be178d478458c48712d9a8570d5a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ure.ac-fix-cross-compilation-with-openssl.patch | 56 ++++++++++++++++++++++
 package/fetchmail/fetchmail.mk                     |  2 +
 2 files changed, 58 insertions(+)

diff --git a/package/fetchmail/0001-configure.ac-fix-cross-compilation-with-openssl.patch b/package/fetchmail/0001-configure.ac-fix-cross-compilation-with-openssl.patch
new file mode 100644
index 0000000000..fff848196a
--- /dev/null
+++ b/package/fetchmail/0001-configure.ac-fix-cross-compilation-with-openssl.patch
@@ -0,0 +1,56 @@
+From 262aa59c1a7a7100e1dd4e73a6d0112d9becc701 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 1 Apr 2022 19:23:06 +0200
+Subject: [PATCH] configure.ac: fix cross-compilation with openssl
+
+Don't call AC_LIB_LINKFLAGS when the libraries are retrieved through
+pkg-config to avoid the following build failure when cross-compiling
+raised since commit 77503f545d2806d07ab83c59ed9a96f435d281da:
+
+/home/autobuild/autobuild/instance-5/output-1/host/bin/arc-buildroot-linux-gnu-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -I/home/autobuild/autobuild/instance-5/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include -I/usr/kerberos/include  -L/home/autobuild/autobuild/instance-5/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/lib -L/home/autobuild/autobuild/instance-5/output-1/host/bin/../arc-buildroot-linux-gnu/sysroot/usr/lib -o fetchmail socket.o getpass.o fetchmail.o env.o idle.o options.o daemon.o driver.o transact.o sink.o smtp.o idlist.o uid.o mxget.o md5ify.o cram.o gssapi.o opie.o interface.o netrc.o unmime.o conf.o checkalias.o uid_db.o lock.o rcfile_l.o rcfile_y.o ucs/norm_charmap.o fm_realpath.o  pop3.o imap.o etrn.o odmr.o     libfm.a  strlcpy.o strlcat.o  /usr/lib/libssl.so /usr/lib/libcrypto.so
+/usr/lib/libssl.so: file not recognized: file format not recognized
+
+This build failure is raised because AC_LIB_LINKFLAGS will override the
+pkg-config target libraries by the host openssl libraries:
+
+configure: Enabling OpenSSL support in /home/autobuild/autobuild/instance-5/output-1/host/arc-buildroot-linux-gnu/sysroot/usr.
+configure: SSL-check: trying pkg-config for openssl
+checking for SSL... yes
+checking how to link with libssl... /usr/lib/libssl.so /usr/lib/libcrypto.so
+configure: From pkg-config: Adding /usr/lib/libssl.so /usr/lib/libcrypto.so to LIBS. LDFLAGS= -L/home/autobuild/autobuild/instance-5/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/lib -L/home/autobuild/autobuild/instance-5/output-1/host/bin/../arc-buildroot-linux-gnu/sysroot/usr/lib
+
+Fixes:
+ - http://autobuild.buildroot.org/results/815f18f25017be178d478458c48712d9a8570d5a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.com/fetchmail/fetchmail/-/merge_requests/42]
+---
+ configure.ac | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index bd042d51..80e5bf91 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -838,15 +838,13 @@ else
+     PKG_CHECK_MODULES([SSL],[$i],[
+ 	  set -- $SSL_LIBS
+ 	  while test $# -ge 1 ; do
+-		  case $1 in -l*|lib*) :                     ;;
++		  case $1 in -l*|lib*) LIBS="$LIBS $1"       ;;
+ 				    *) LDFLAGS="$LDFLAGS $1" ;;
+ 		  esac
+ 		  shift
+ 	  done
+ 	  CPPFLAGS="$SSL_CFLAGS $CPPFLAGS"
+-	  AC_LIB_LINKFLAGS([ssl], [crypto])
+-	  AS_MESSAGE([From pkg-config: Adding $LIBSSL to LIBS. LDFLAGS=$LDFLAGS])
+-	  LIBS="$LIBS $LIBSSL"
++	  AS_MESSAGE([From pkg-config: $SSL_LIBS])
+ 	  found=1
+ 	  break],[: ignore-error])
+     done
+-- 
+2.35.1
+
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index b97f01a423..25dfcae87b 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -12,6 +12,8 @@ FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
 FETCHMAIL_LICENSE_FILES = COPYING
 FETCHMAIL_CPE_ID_VENDOR = fetchmail
 FETCHMAIL_SELINUX_MODULES = fetchmail mta
+# We're patching configure.ac
+FETCHMAIL_AUTORECONF = YES
 
 FETCHMAIL_CONF_OPTS = \
 	--with-ssl=$(STAGING_DIR)/usr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
