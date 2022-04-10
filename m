Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6FDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 21:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEF06408F5;
	Sun, 10 Apr 2022 21:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j4DjPbNosOXE; Sun, 10 Apr 2022 21:09:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D8794050C;
	Sun, 10 Apr 2022 21:09:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04E381BF3D8
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E805383FF2
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id My0zmnm7OLe1 for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 21:09:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A00E083FB9
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 21:09:48 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t1so2652838wra.4
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1FvM/+fzA3jD7nNPDwTfk0AsoL2wRrM7U1ViniOI5Sw=;
 b=IjOlapQymOU2usa3K9ZJpxc+mgLGbZT7OHCpIujkqc3R3drFaEDPLkOULk6gH497NH
 EICFcrY1e399Zp7tspiq0Iut9b7GKM7mDvXQU00uH2ERkSRxeVndTJqosIUJpXslCDXq
 w+PeqY3LjVks3M+CGr5h5G9hO6IG5qOhUO+5FGx49ngg/c2bjkUq4x4w/bdLLWhdtN1Y
 TaaJcgdz12gy6PR0holfNHZoZfSkeBZtDK2xbu/v3ZQEx5kTorPd8VgKDHXk+A/MYliJ
 jpr2365YvnjNIFp85FGrxz2TT8ifUkbK2XiHQ/uVBiZ+9N1pwpNN4kQ3QxXLV7zBpzyM
 rmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1FvM/+fzA3jD7nNPDwTfk0AsoL2wRrM7U1ViniOI5Sw=;
 b=gHbpkBI/Ud1kG/a5Mzo0Zd3JH64Zu61dbjSIGQkSRAc3AoB0OHMuu41eElkPIwP7xw
 +yfYqXASPuc2Ze/rQ6+PLsv0Y4pK/dZC/cHbI1nFC9WLQHj2pG9E9pyY21TjBBBowrU+
 7/4DKK+BBadCn/umtnhkkiOqoJHC/1E88p8w6xVxML78rnyAA+q4pl7cJHK73J2PgVT1
 hz5BK7P1Y23IzKXfIC/eicmrwtzu8xUDDLtj9PAYTtsI1js7zvWTan+Tmme6FMdEFkCF
 5aqNo9kLcE+JH5zt3eWPL6uWiZAWoO6tb28BTGPEEiJX0Jf74nn6tnh2K4SyoMWe3bKg
 gAYA==
X-Gm-Message-State: AOAM531aEwFoDEB4BaDw8uN2UThq5qga5lDiWidlvgzY8gcAuBPBp9Ij
 BiAwrAXzQ3w/XXCKSAzVY+4XYcy1NRY=
X-Google-Smtp-Source: ABdhPJyBVGne/E/dMs4S/oo3TuVZqSbBaVeQL75LHxE+PC2LqcEWR2glBxk420r+autPCm2jpgIMdw==
X-Received: by 2002:a05:6000:186f:b0:205:857d:dee8 with SMTP id
 d15-20020a056000186f00b00205857ddee8mr22691348wri.532.1649624986684; 
 Sun, 10 Apr 2022 14:09:46 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k129-20020a1ca187000000b0038e6e789f08sm15753507wme.39.2022.04.10.14.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 14:09:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 23:07:00 +0200
Message-Id: <20220410210700.1175518-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: fix openssl build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following openssl build failure raised since bump to version
6.4.29 in commit ba6fd52195f2e3d0b04baae40cfe084226824d31:

/home/autobuild/autobuild/instance-5/output-1/host/bin/arc-buildroot-linux-gnu-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -I/home/autobuild/autobuild/instance-5/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include -I/usr/kerberos/include  -L/home/autobuild/autobuild/instance-5/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/lib -L/home/autobuild/autobuild/instance-5/output-1/host/bin/../arc-buildroot-linux-gnu/sysroot/usr/lib -o fetchmail socket.o getpass.o fetchmail.o env.o idle.o options.o daemon.o driver.o transact.o sink.o smtp.o idlist.o uid.o mxget.o md5ify.o cram.o gssapi.o opie.o interface.o netrc.o unmime.o conf.o checkalias.o uid_db.o lock.o rcfile_l.o rcfile_y.o ucs/norm_charmap.o fm_realpath.o  pop3.o imap.o etrn.o odmr.o     libfm.a  strlcpy.o strlcat.o  /usr/lib/libssl.so /usr/lib/libcrypto.so
/usr/lib/libssl.so: file not recognized: file format not recognized

Fixes:
 - http://autobuild.buildroot.org/results/815f18f25017be178d478458c48712d9a8570d5a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...c-fix-cross-compilation-with-openssl.patch | 56 +++++++++++++++++++
 package/fetchmail/fetchmail.mk                |  2 +
 2 files changed, 58 insertions(+)
 create mode 100644 package/fetchmail/0001-configure.ac-fix-cross-compilation-with-openssl.patch

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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
