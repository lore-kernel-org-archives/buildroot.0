Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE54ACD37B3
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 15:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51B7681EE7;
	Sun, 17 Sep 2023 15:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51B7681EE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HUllZiuSl4RZ; Sun, 17 Sep 2023 15:23:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85D7581EE0;
	Sun, 17 Sep 2023 15:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85D7581EE0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 53A2E1BF3E5
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 15:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2979861119
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 15:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2979861119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJLk6VYseWu4 for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 15:23:07 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA0C66110E
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 15:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA0C66110E
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31c8321c48fso3040909f8f.1
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 08:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694964185; x=1695568985;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jtndqfnkv4ZWHti6Sk/CohmRnUcdAN76ZyG5L8A+5KI=;
 b=WUiI7G4oghk6ZjHRy6+jvuIifcSCIEmsDAmMH7zsohwIhTri5qeu6ggsIiDkbh7ar9
 yhVBBB1mDF8+58Wx2PrYZUaPPUcIvWPItJXb7iYwrHaqzGPIRqrKXQevi4D6/rMU7WJN
 OyV2ODwkBNOi/03EtCC8JxnVxLA9PEqEShqOGmAA9tPkzOdMLGeonI7EIb9b59SJaDgY
 5WHanbzZqf4aoyb3rIJLM8U5QJXz6NocQar+ciyYwde7ktcE/JwPjDSFui5eDDD0ZVp+
 G6k7xVNVEFpypHEQYtUcPNYkuWM+0o98QLSjGpEsM5Q8j4UChUxsq+sdH840pHId+pGn
 WhbQ==
X-Gm-Message-State: AOJu0Yx/eE8gxykAI6cnUi6VWL5a0QQnsC/jPa2BFMfcLlRYb31NChMc
 KuL00a5Ck5RFUUAOzN0qcY0oxk66wYA=
X-Google-Smtp-Source: AGHT+IGvEZf8hvM5am8xu1xZjE6j2Yy6iCojmkETK0AcnuMVmSr7lUqgiTzgj6csw2lMNIO5TBJmWA==
X-Received: by 2002:a5d:6dcd:0:b0:31c:2f95:8056 with SMTP id
 d13-20020a5d6dcd000000b0031c2f958056mr4754246wrz.23.1694964184354; 
 Sun, 17 Sep 2023 08:23:04 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:6a7e:c3f3:1d37:8ba2])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a5d6585000000b0031accc7228asm10064516wru.34.2023.09.17.08.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Sep 2023 08:23:03 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 17:23:03 +0200
Message-Id: <20230917152303.1300577-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694964185; x=1695568985; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=jtndqfnkv4ZWHti6Sk/CohmRnUcdAN76ZyG5L8A+5KI=;
 b=Y2F4/SxAXPQJfvnwErzlS1PTxKTOX3QgNaG2cnksQGVxJz3ogKcUDJm4N19sTMj/yk
 4Z2L/y5NKKQ2IU13539EEmvyMn2LfgLv6v8bWhdnvb1g99GHsqlDHnZ7a2eXj4vRtXPM
 WO+RJmAx4wn4B7OCyIH5HFcQBeqJG+RYEUtvJe3kLz4ksvAmULeSY2emD1OreHHeFlQa
 +hwcNvXGIAcN0gVIl0NaV8YuAqQ1yBAWj7QNIVg698FRj9nfDhkzsmKo3UV3PWjNPO1f
 hZ2GhRR//rmIFzDFwqMcrGjLTF5pgUfUq1W/dL4Vd4lRy7WDmvtlIpPni5WmOwuORmBN
 yJkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y2F4/SxA
Subject: [Buildroot] [PATCH] package/gdb: gdbserver does not need zlib
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since 3341ceb1e585 (package/gdb: zlib is mandatory, not optional), zlib
has become a mandatory dependencies of the gdb package.

However, zlib is only needed for the debugger, gdb itself, while the
server, gdbserver, does not use it.

This means that, when building an SDK to be later reused as an external
toolchain, the zlib headers and libraries are present in the sysroot of
the toolchain, tainting the toolchain and making it unsuitable to be
reused.

As Julien noticed, for example, tcl will try and link with zlib if
available, and at build time it is. But at runtime, it is not, and thus
tclsh fails to run; see 7af8dee3a8a0 (package/tcl: add mandatory
dependency to zlib)

When we only need to build gdbserver, we still need to configure and
build the whole gdb distribution, which means we call the top-level
configure script; that script has no option to disable the detection
of zlib: it wants to either use a system one, or it will build the
bundled one.

So, when we onlyt build gdbserver, we tell configure to not use a system
zlib, which triggers a build of the bundled one, which we do not use...

Reported-by: Julien Olivain <ju.o@free.fr>
Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdb/Config.in |  2 +-
 package/gdb/gdb.mk    | 14 ++++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 20fd262c93..e4ab39a2bd 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -24,7 +24,6 @@ config BR2_PACKAGE_GDB
 	# The or1k musl port is incomplete, elf_gregset_t definition is missing:
 	# https://git.musl-libc.org/cgit/musl/tree/arch/or1k/bits/user.h?h=v1.2.3
 	depends on !BR2_or1k || !BR2_TOOLCHAIN_USES_MUSL
-	select BR2_PACKAGE_ZLIB
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
@@ -61,6 +60,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	depends on !BR2_sh
 	select BR2_PACKAGE_GMP if !BR2_arc
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_ZLIB
 
 comment "full gdb on target needs a toolchain w/ wchar"
 	depends on !BR2_sh
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 0d41548ed0..070598b385 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -32,7 +32,6 @@ GDB_PRE_CONFIGURE_HOOKS += GDB_CONFIGURE_SYMLINK
 # also need ncurses.
 # As for libiberty, gdb may use a system-installed one if present, so
 # we must ensure ours is installed first.
-GDB_DEPENDENCIES = zlib
 HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses host-zlib
 
 # Disable building documentation
@@ -131,22 +130,29 @@ GDB_CONF_OPTS = \
 	--disable-sim \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
 	--without-included-gettext \
-	--with-system-zlib \
 	--disable-werror \
 	--enable-static \
 	--without-mpfr \
 	--disable-source-highlight
 
 ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),y)
+GDB_DEPENDENCIES += zlib
 GDB_CONF_OPTS += \
 	--enable-gdb \
-	--with-curses
+	--with-curses \
+	--with-system-zlib
 GDB_DEPENDENCIES += ncurses \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 else
+# When only building gdbserver, we don't need zlib. But we have no way to
+# tell the top-level configure that we don't need zlib: it either wants to
+# build the bundled one, or use the system one.
+# Since we're going to only install the gdbserver to the target, we don't
+# care that the bundled zlib is built, as it is not used.
 GDB_CONF_OPTS += \
 	--disable-gdb \
-	--without-curses
+	--without-curses \
+	--without-system-zlib
 endif
 
 # Starting from GDB 11.x, gmp is needed as a dependency to build full
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
