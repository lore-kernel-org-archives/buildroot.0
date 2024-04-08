Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437E8C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 20:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D797740CA1;
	Mon,  8 Apr 2024 20:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3vuHUgIuHMDz; Mon,  8 Apr 2024 20:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B192C41181
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B192C41181;
	Mon,  8 Apr 2024 20:57:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04DA81BF2A7
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5EE060A4C
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ctHs0pCFMIob for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 20:57:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 174E8607E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 174E8607E7
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 174E8607E7
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 20:57:45 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-343b7c015a8so3055950f8f.1
 for <buildroot@buildroot.org>; Mon, 08 Apr 2024 13:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712609864; x=1713214664;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W155zfBBIp3Gpf0CAN/pwJtESmh7m9I+b59MBGDmOX4=;
 b=ubJx4QBBIRZzaQ4d00Beu4kt0Pfwv3Wk+9YZZrnoUYvKzIi0iFlJVarnXzFuuig4AV
 1OuJRQV5sYbunm39592vS0EZKmLRm4l8MSKIRP5Vp5IKW+U6ZtaOoE3TEntkCiVitsq/
 x/Tulm5kB5+669yCCuvrhAWeuvKDyT3M/7u5ZDZqNImOv8eThaCeTv9GwzOtq9c58Nqx
 eILHpNGg/9nXRm39EX2+mL6yz7B9SOWyQy8xoOUBtnQHh4+Epcq+A7KSsK06pO1QRIUH
 oPF6FLnS+y3O+sYM8akl0Q6L+BQ0sIsLvWn8OPl0VO6Ulf3CRr2g5LnN5qBm3qP+nm3o
 Wbqg==
X-Gm-Message-State: AOJu0YxzNBO1ksbbv0+THT/MHoMDbot/Oiz1jge4xL46y2dVTxfCO1cB
 IEb6ZhriRGccvTspTIL0+9mk/wMLdfgt76UYxhZMfrdE0mas9pAa7eCtPQJs
X-Google-Smtp-Source: AGHT+IGg0MLEZX3weUzdRsfVoFES1aO8KtNwmtusiPuY8wkS3z/qqIADzOQO+beRXTJuJgrEUfsESA==
X-Received: by 2002:adf:e24e:0:b0:33e:9116:bef4 with SMTP id
 bl14-20020adfe24e000000b0033e9116bef4mr6653136wrb.14.1712609863539; 
 Mon, 08 Apr 2024 13:57:43 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a05600c450c00b004161bffa48csm14633544wmo.40.2024.04.08.13.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 13:57:43 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon,  8 Apr 2024 22:57:42 +0200
Message-ID: <20240408205742.1422545-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712609864; x=1713214664; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=W155zfBBIp3Gpf0CAN/pwJtESmh7m9I+b59MBGDmOX4=;
 b=gWxdQbKHOKXO+L2ud+TDRSg/L6blW40bYcbjpEw2uCDwGyatyjmydnFjELVhyKl6LH
 TmDwJiqomznJiawP48u4SXgjsdnCdLAyTL/GmeV+QPayNNOfwlNG9DTTj+B5r0kl+hmZ
 iCDD/rYEiGFUY+ND6UKKytX96NDUQqU4TcoYUkUu299H4m88zZWUJEa9/SNgJgYoS5vE
 ND1XUI64rBSvzMtM+0F5wBfoDRrwrMG9UKr6tMLKXYIiUc9HhynY0aFlC4wjSHP82fU7
 Wfia0wZRWEZurYiOF9xZNN5Zs6jgp+QEVitxDUSRFCbogZ3qZ1c8LiwrFuC5r7+pg3K2
 7OHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gWxdQbKH
Subject: [Buildroot] [PATCH] toolchain/external: remove libcrypt from glibc
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 .../pkg-toolchain-external.mk                  | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index ddf1d70ab4..9b0652c4e5 100644
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
@@ -129,8 +129,23 @@ endif # gdbserver
 endif # ! no threads
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
+# uClibc, though mono-lib, still has a separate libcrypt as a stub
+TOOLCHAIN_EXTERNAL_LIBS += libcrypt.so.*
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
 TOOLCHAIN_EXTERNAL_LIBS += libnss_files.so.* libnss_dns.so.* libmvec.so.* libanl.so.*
+# Note: explicitly do copy libcrypt*.so.* even for glibc: it is not the same
+# SONAME as the one from libxcrypt, so no conflict, but some prebuilt binaries
+# may have it in their DT_NEEDED. However, do remove the headers, static lib,
+# and symlink to avoid conflict, as they are not needed at buildtime.
+TOOLCHAIN_EXTERNAL_LIBS += libcrypt.so.1
+define TOOLCHAIN_EXTERNAL_GLIBC_NO_LIBCRYPT
+	rm -f $(STAGING_DIR)/usr/include/crypt.h \
+		$(STAGING_DIR)/usr/lib/libcrypt.so \
+		$(STAGING_DIR)/usr/lib/libcrypt.a
+endef
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
@@ -599,6 +614,7 @@ define $(2)_INSTALL_STAGING_CMDS
 	$$(TOOLCHAIN_WRAPPER_INSTALL)
 	$$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
+	$$(TOOLCHAIN_EXTERNAL_GLIBC_NO_LIBCRYPT)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
 	$$(TOOLCHAIN_EXTERNAL_FIXUP_PRETTY_PRINTER_LOADER)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
