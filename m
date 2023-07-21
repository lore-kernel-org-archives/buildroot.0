Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF48FEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 18:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8220783163;
	Fri, 21 Jul 2023 18:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8220783163
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7OiU7DVstK4r; Fri, 21 Jul 2023 18:06:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A1B083A6F;
	Fri, 21 Jul 2023 18:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A1B083A6F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 068CF1BF5B4
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 18:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3D56403A9
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 18:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3D56403A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dfdhzwTzOAr3 for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 18:06:54 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8893D4036E
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 18:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8893D4036E
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5A200A4C0836
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 20:06:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43658)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qMuWV-0003kU-03
 for buildroot@buildroot.org; Fri, 21 Jul 2023 20:06:39 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 20:06:37 +0200
Message-Id: <20230721180638.215414-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230721180638.215414-1-bernd@kuhls.net>
References: <20230721180638.215414-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689962799;
 bh=iON33scGjZXt3zoUU9TvblOeLjcIewQDBNiOb5DCRvE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XYrXvXC1IFv3ek/2Pkr34sceOJl7ITpdOmyJdM+Mwy5AQ81JyGL86cQRJIMpa3EkD
 CC72mbjiD0GKBbd8DjSR7L5X4NIafXtbz8f8a/OotgRGyY0YJFZxHMQ38lHn7PQMIR
 fBKiCLYE+4rcmWdEK11eDNvmE3eQiycS57xLzPtQ/5QxbeVfy2YAj1H2+yz76p/Y48
 qj+TCq1M3AhcVDwHnT7ERxXLHvztHHLvyYI4Ckn/BuBfywFWehcfRY9NY4x+BxZIWL
 3eLtSXVZbs4sj4LAjZYnnp5dr8vfjE8g24qx5/jSnyElduYUdKMSp0cLe5xIakMUmG
 E4QDh4UF7mI5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=XYrXvXC1
Subject: [Buildroot] [PATCH 2/3] package/libopenssl: add -latomic to
 libcrypto.pc when needed
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Without this patch openssl adds -latomic only to Libs.private in
libcrypto.pc.

Instead of passing -latomic to Configure we use the target arch
"linux-latomic" which is provided by upstream especially for libatomic
handling and add $LIB_ATOMIC_LIBS to be used for creating libcrypto.pc.

Fixes:
http://autobuild.buildroot.net/results/fb4/fb4c6a97ac666a3a75345229a320769df6c0a909/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-latomic-to-libcrypto.pc-when-needed.patch | 87 +++++++++++++++++++
 package/libopenssl/Config.in                  |  1 +
 package/libopenssl/libopenssl.mk              |  1 -
 3 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 package/libopenssl/0005-Add-latomic-to-libcrypto.pc-when-needed.patch

diff --git a/package/libopenssl/0005-Add-latomic-to-libcrypto.pc-when-needed.patch b/package/libopenssl/0005-Add-latomic-to-libcrypto.pc-when-needed.patch
new file mode 100644
index 0000000000..180755434a
--- /dev/null
+++ b/package/libopenssl/0005-Add-latomic-to-libcrypto.pc-when-needed.patch
@@ -0,0 +1,87 @@
+From f403579bb85c293d4b469b70dadb2865e17e5ebe Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 21 Jul 2023 18:37:34 +0200
+Subject: [PATCH] Add -latomic to libcrypto.pc when needed
+
+Upstream: https://github.com/openssl/openssl/pull/21521
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Configurations/10-main.conf       | 3 +++
+ Configurations/unix-Makefile.tmpl | 5 ++++-
+ Configure                         | 1 +
+ 3 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/Configurations/10-main.conf b/Configurations/10-main.conf
+index 8010087b46..c4102e6adb 100644
+--- a/Configurations/10-main.conf
++++ b/Configurations/10-main.conf
+@@ -701,6 +701,7 @@ my %targets = (
+     },
+     "linux-latomic" => {
+         inherit_from     => [ "linux-generic32" ],
++        atomic_libs      => threads("-latomic"),
+         ex_libs          => add(threads("-latomic")),
+     },
+     "linux-generic64" => {
+@@ -864,6 +865,7 @@ my %targets = (
+         inherit_from     => [ "linux-x86" ],
+         CC               => "clang",
+         CXX              => "clang++",
++        atomic_libs      => threads("-latomic"),
+         ex_libs          => add(threads("-latomic")),
+     },
+     "linux-x86_64" => {
+@@ -959,6 +961,7 @@ my %targets = (
+         cflags           => add("-m64 -mcpu=ultrasparc"),
+         cxxflags         => add("-m64 -mcpu=ultrasparc"),
+         lib_cppflags     => add("-DB_ENDIAN"),
++        atomic_libs      => threads("-latomic"),
+         ex_libs          => add(threads("-latomic")),
+         bn_ops           => "BN_LLONG RC4_CHAR",
+         asm_arch         => 'sparcv9',
+diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
+index 17e194f1ef..b7783cd536 100644
+--- a/Configurations/unix-Makefile.tmpl
++++ b/Configurations/unix-Makefile.tmpl
+@@ -382,6 +382,8 @@ CNF_CXXFLAGS={- join(' ', $target{cxxflags} || (),
+                           @{$config{cxxflags}}) -}
+ CNF_LDFLAGS={- join(' ', $target{lflags} || (),
+                          @{$config{lflags}}) -}
++CNF_ATOMIC_LIBS={- join(' ', $target{atomic_libs} || (),
++                         @{$config{atomic_libs}}) -}
+ CNF_EX_LIBS={- join(' ', $target{ex_libs} || (),
+                          @{$config{ex_libs}}) -}
+ 
+@@ -425,6 +427,7 @@ LIB_CXXFLAGS={- join(' ', $target{lib_cxxflags} || (),
+ LIB_LDFLAGS={- join(' ', $target{shared_ldflag} || (),
+                          $config{shared_ldflag} || (),
+                          '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
++LIB_ATOMIC_LIBS=$(CNF_ATOMIC_LIBS) $(ATOMIC_LIBS)
+ LIB_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
+ DSO_CPPFLAGS={- join(' ', $target{dso_cppflags} || (),
+                           $target{module_cppflags} || (),
+@@ -1406,7 +1409,7 @@ libcrypto.pc:
+ 	    echo 'Name: OpenSSL-libcrypto'; \
+ 	    echo 'Description: OpenSSL cryptography library'; \
+ 	    echo 'Version: '$(VERSION); \
+-	    echo 'Libs: -L$${libdir} -lcrypto'; \
++	    echo 'Libs: -L$${libdir} -lcrypto $(LIB_ATOMIC_LIBS)'; \
+ 	    echo 'Libs.private: $(LIB_EX_LIBS)'; \
+ 	    echo 'Cflags: -I$${includedir}' ) > libcrypto.pc
+ 
+diff --git a/Configure b/Configure
+index dd06aa4898..5009495804 100755
+--- a/Configure
++++ b/Configure
+@@ -3307,6 +3307,7 @@ sub print_table_entry
+         "ld",
+         "lflags",
+         "loutflag",
++        "atomic_libs",
+         "ex_libs",
+         "bn_ops",
+         "enable",
+-- 
+2.39.2
+
diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 26c8f4c085..fdfa135f52 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -26,6 +26,7 @@ config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH
 	# linux-generic{32,64}, see
 	# https://github.com/openssl/openssl/issues/9839
 	default "linux-generic64 no-asm"	if BR2_ARCH_IS_64 && !BR2_MIPS_NABI32
+	default "linux-latomic no-asm"		if BR2_TOOLCHAIN_HAS_LIBATOMIC
 	default "linux-generic32 no-asm"
 
 config BR2_PACKAGE_LIBOPENSSL_BIN
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 06eac8f3d9..41626d20e1 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -73,7 +73,6 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			$(LIBOPENSSL_TARGET_ARCH) \
 			--prefix=/usr \
 			--openssldir=/etc/ssl \
-			$(if $(BR2_TOOLCHAIN_HAS_LIBATOMIC),-latomic) \
 			$(if $(BR2_TOOLCHAIN_HAS_THREADS),threads,no-threads) \
 			$(if $(BR2_STATIC_LIBS),no-shared,shared) \
 			$(if $(BR2_PACKAGE_CRYPTODEV_LINUX),enable-devcryptoeng) \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
