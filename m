Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23196C67861
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 21:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B322E8143D;
	Tue,  9 Apr 2024 21:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmkTzzib4-xS; Tue,  9 Apr 2024 21:54:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BCFD81448
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BCFD81448;
	Tue,  9 Apr 2024 21:54:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E0AD1BF97D
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3ADE981458
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 21:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wb9jPS7_QrjC for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 21:54:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 092798143D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 092798143D
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 21:54:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6EA985E2F; Tue,  9 Apr 2024 21:54:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 9 Apr 2024 23:54:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 700ba1df1e4320bd02fcd99b47c2e2c71b1b4b9c
X-Git-Newrev: df2540adeac1a924dfa4fe1da7d654db49151420
X-Patchwork-Hint: ignore
Message-Id: <20240409215444.E6EA985E2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/external: remove libcrypt from
 glibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=df2540adeac1a924dfa4fe1da7d654db49151420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note: this commit only deals with glibc and its internal libcrypt (or
lack thereof); other C libraries, musl and uClibc-NG, are not considered.

libcrypt from glibc has been deprecated for a long time, and it has now
been entirely dropped with glibc 2.39. Now, packages that need crypt(3)
features need to explicitly depend on the libxcrypt pacakge.

However, the set of files installed both by glibc and libxcrypt is not
empty:

    glibc                           libxcrypt
    /usr/include/crypt.h            /usr/include/crypt.h
    /usr/lib/libcrypt.a             /usr/lib/libcrypt.a
    /usr/lib/libcrypt.so            /usr/lib/libcrypt.so
    /lib/libcrypt.so.1
    /lib/libcrypt-2.23.so
                                    /usr/lib/libcrypt.so.2

The two libraries have different SO_NAME, so they do not conflict on the
library filename. However, the .so synlink is present in both, and thus
conflicts. The header and the static library also conflict.

So, the situation is that, with a glibc 2.39 or later, packages have to
use libxcrypt, which is a drop-in replacement. With glibc 2.38 or
earlier, they can use either.

Since we already bumped to glibc 2.39 for the internal toolchain, we
have already converted quite a few packages to use libxcrypt. That works
well with an internl toolchain, because glibc does not install the
conflicting files.

However, for external toolchains, we may very well end up in three
situations:

  - a glibc 2.39 or later, without libcrypt
  - a glibc 2.39 or later, without libcrypt, but with libxcrypt [0]
  - a glibc 2.38 or earlier with libcrypt

In the first case, all is OK and we are in a situation similar to the
internal toolchain, but in the latter two cases, we end up with a
conflict.

We could introduce BR2_TOOLCHAIN_EXTERNAL_HAS_LIBCRYPT os something
along those lines, but this is going to be a bit complex on packages,
which would have to select LIBXCRYPT if GLIBC && !_HAS_LIBCRYPT.

So, to simplify things, we want to get the external toolchains into a
situation similar to the internal one, where libcrypt is not provided by
the toolchain; packages have to select libxcrypt for glibc toolchains,
without having to care whether this is an internal or external toolchain
or some more complex conditions.

So, we remove from staging whatever could be used to compile and link
with libcrypt. We however keep the SO_NAME file, if it exists, and we
also install it in target/, for those pre-built binaries that may be
linked with it [1]. The glibc SO_NAME has always been libcrypt.so.1, so
this is what we copy exactly, to avoid copying the libxcrypt one, which
is libcrypt.so.2.

[0] that could happen if a toolchain provider tried to be helpful and
suplies a toolchain with libxcrypt to be trasnparent to users, in which
case that would conflict with ours...

[1] if such a prebuilt binary (executable or library) is used with a
glibc 2.39 or later toolchain, it will obviously not work at all.
libxcrypt is supposed to be a drop-in replacement for glibc's libcrypt,
so we could look into symlinking libcrypt.so.1 to libcrypt.so.2. In a
later patch, maybe...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external/pkg-toolchain-external.mk      | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index ddf1d70ab4..5343f257e0 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -120,7 +120,7 @@ TOOLCHAIN_EXTERNAL_LIBS += libssp.so.*
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-TOOLCHAIN_EXTERNAL_LIBS += libc.so.* libcrypt.so.* libdl.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
+TOOLCHAIN_EXTERNAL_LIBS += libc.so.* libdl.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 TOOLCHAIN_EXTERNAL_LIBS += libpthread.so.*
 ifneq ($(BR2_PACKAGE_GDB)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
@@ -129,8 +129,24 @@ endif # gdbserver
 endif # ! no threads
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
+# uClibc, though mono-lib, still has a separate libcrypt as a stub
+TOOLCHAIN_EXTERNAL_LIBS += libcrypt.so.*
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
 TOOLCHAIN_EXTERNAL_LIBS += libnss_files.so.* libnss_dns.so.* libmvec.so.* libanl.so.*
+# Note: explicitly do copy libcrypt.so.1: it is not the same SONAME as the
+# one from libxcrypt, so no conflict, but some prebuilt binaries may have
+# it in their DT_NEEDED. However, do remove the headers, static lib, and
+# symlink to avoid conflict with libxcrypt (the prebuilt binaries do not
+# need those either).
+TOOLCHAIN_EXTERNAL_LIBS += libcrypt.so.1
+define TOOLCHAIN_EXTERNAL_GLIBC_NO_LIBCRYPT
+	rm -f $(STAGING_DIR)/usr/include/crypt.h \
+		$(STAGING_DIR)/usr/lib/libcrypt.so \
+		$(STAGING_DIR)/usr/lib/libcrypt.a
+endef
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
@@ -599,6 +615,7 @@ define $(2)_INSTALL_STAGING_CMDS
 	$$(TOOLCHAIN_WRAPPER_INSTALL)
 	$$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
+	$$(TOOLCHAIN_EXTERNAL_GLIBC_NO_LIBCRYPT)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
 	$$(TOOLCHAIN_EXTERNAL_FIXUP_PRETTY_PRINTER_LOADER)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
