Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FB0C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B276B81097;
	Fri,  4 Sep 2026 16:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9gbStpAGT5p; Fri,  4 Sep 2026 16:22:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A7D5C81177
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538946;
	b=di9gLvBEt3Yv8sD44CStm0k3UsuF7QPgztSN4wzvzXk60oYPcwlVkc2b05zp8/6bl+zx
	 E/ADNHia4Op2KVUpP9blhCOG/ht+8uaGDcK5ur7U3jpKEAFDHDJ8iWtkESrvtvpo3LI4m
	 hxrGeDo7PAY24qTjP4A/8ipM/mm6HzdKOuQlyG6IndA3sH7WbLv+I7WRLW3peopb86BUV
	 kG3lunUUQpvIk7dpZgL3p8rFUKT34aQz3zyK9OGhvfsahJL/ybuh1nvie4w4RTzFUBydi
	 yHMGy/Jo+hD6nRKH/2eEfRecksjfqRk7kbUi82TNh4x5iQfy+KMmEh0sJh20eq6vqug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538946;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=H6ue0GWbVqpI4p6nHLI6vWFK57aOKMXSjpUTFqMXP7M=;
	b=M/SGVO3ZUKdgsNbafjBXiyHapzFp2b6vnlIGoGvso3QhfyUFTOeIrFKspEqfGiggqKI/
	 3QcHUtkvwEOL7i3bH2j47MRNHQowCO7XbG7DdvokzS3bCyaSe1UNsqtBiRXVTbatb+gJz
	 HijuYopA541nEAigOp+6yfxRsB3HbdA46A6V/y/s0u/aLUC5E9KwXyQ5aBBZzsbsp/v5g
	 9F5gKWarehEdtYod4y/8E16ecLPX9w00eG8qEHHZYD8ShsKd6mAQKvCo0HRjlsiR0NLtp
	 IEZZoJU+VxXUUL5StAwsw0W4R9iO9sYPYGj8R3598m3C/x1R6Tcpel8Z2i/i+jXkWqg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538946;
	bh=H6ue0GWbVqpI4p6nHLI6vWFK57aOKMXSjpUTFqMXP7M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g2dtaQMIhoSWngEcpYYnTdYip9pi0RShfXzoKDWY+Bu2DiL/JS0nn9EckP0bXhIMJ
	 8G5RHrnMXR0c8NFgu2jTuNUfzdi32R54lxnFYkHx88Q7v2eu9d3/gXD4ppWAmw+iWq
	 H5ExS3FU9/uSCGnHfHA1+73sfQmYCLUiIp5xxH4zmBpZ5sH6mqTmCaoFTNLU9FZx0V
	 86I26ppEo/gfYXJAJl5ZpdNEpK5wNbTCs69tzgbosGJxJnot4wwOuSA/HWuhXqGnnz
	 DIME6DV6les6BoEPD8XBI04vY+JSZuxBwBKvANJz+QVHP6xU8iy1HBxKcqPJbgxAnU
	 m+ilEQmuTgYHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7D5C81177;
	Fri,  4 Sep 2026 16:22:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74BCCB2C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58F146069C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U5eF_m5daW6V for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7A48C60681
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538927;
 b=YLzZJxeCXS2Ks5W2BIiEAxHiXn0yOD/6AQsfPdtH2AlU11lIW9pw8fRmWHIhZPm6muZ6
 S1fw0dmOBTTa6DoPjcOMdnmHa54Yuk+QivKiip6UKyqFIthzQF62+AB/ZFtUGyQoqaZSr
 ERbrza2itJokTQ6njd3UP9v1Iq9zBcqJLVJ1E/gMgHDF7c2zwbKGKr9MbL1vq6aaevImw
 Njy8W3W2jdREI4cJgovNGhk/FBjTx0enkhOCzV+OObsRiuOL/7z5kXf10+5pWZe5Pz0Gb
 GCQggPC5RfBXqMZJ7uzdlEN7wjBzh6UOMDvFghNTBw5I5xzDuXwz41/cqVoVs8Rh2KA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538927;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4WyC8XwtRoMt5+X2gWHT/Kre/V+CeUORG+TjvPKWk8E=;
 b=tGN2l9vXsq6HmkDUr1RPnOm717yPVolA6cvs1/l0mIJ6i+L8YlwUOOVHazvhsiZeLfxe
 Ns0yE0uJ+ip74LEvJWfkgU2Rj32It5GuPt1EHtE0LqHWd1ZekxigiLWtyXt6Hhx7O9tAR
 F/mBgvnACoztHrNGRtuBEC+PXaauq/n3OjByE0mI+uITweuaVvA7qPGcfsqsR/GOuy/qw
 C63IzWcYCQAwJG9RqFayR3RNNA1nOHsokJ5e0t362X9LzcvW4lFd2IHK5pupBc6O2C3Ne
 u/fWybGAtH/YQJZAPAHcqAroGLM32YMvXnNEZlssykjycyNSIupv0ZByBFUsFj2FRCg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A48C60681
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED62B94CDC; Fri,  4 Sep 2026 16:21:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 23:08:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c36fe80fe2fc3352b0ade2fa9c19fd190bea9b9
X-Git-Newrev: 6851345aa8838e976cbbb1ce558bcfa0b158eaf5
X-Patchwork-Hint: ignore
Message-Id: <20260904162106.ED62B94CDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang: fix link failure on
 odbcserver
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3283176523577223496=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3283176523577223496==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6851345aa8838e976cbbb1ce558bcfa0b158eaf5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

host-erlang build can fail with the following error:

  make[5]: Nothing to be done for 'opt'.
   MAKE	opt
   CC	../priv/bin/x86_64-pc-linux-gnu/odbcserver
  /usr/bin/ld: ../priv/obj/x86_64-pc-linux-gnu/odbcserver.o: in function `encode_column_dyn':
  odbcserver.c:(.text+0x6b4): undefined reference to `ei_x_encode_tuple_header'
  /usr/bin/ld: odbcserver.c:(.text+0x6c2): undefined reference to `ei_x_encode_tuple_header'
  /usr/bin/ld: odbcserver.c:(.text+0x6d4): undefined reference to `ei_x_encode_ulong'
  /usr/bin/ld: odbcserver.c:(.text+0x6e7): undefined reference to `ei_x_encode_ulong'
  /usr/bin/ld: odbcserver.c:(.text+0x6fa): undefined reference to `ei_x_encode_ulong'
  /usr/bin/ld: odbcserver.c:(.text+0x708): undefined reference to `ei_x_encode_tuple_header'
  /usr/bin/ld: odbcserver.c:(.text+0x71b): undefined reference to `ei_x_encode_ulong'
  /usr/bin/ld: odbcserver.c:(.text+0x72e): undefined reference to `ei_x_encode_ulong'
  [...]

This can be reproduced with the following minimal defconfig (and
libei.so present on host, see details below):

  BR2_x86_64=y
  BR2_TOOLCHAIN_EXTERNAL=y
  BR2_PACKAGE_ERLANG=y

Those missing symbols are part of the erl_interface, exposed by libei.a.
host-erlang builds correctly libei.a _before_ odbcserver.c (it can be
found in lib/erl_interface/obj/x86_64-pc-linux-gnu/libei.a), but the
failure is actually due to the build command generated and used for
odbcserver.c, especially the link arguments:

  /usr/bin/gcc \
  [...]
  -o ../priv/bin/x86_64-pc-linux-gnu/odbcserver \
  ../priv/obj/x86_64-pc-linux-gnu/odbcserver.o \
  -L/usr/lib64 \
  -lodbc \
  -L/home/alexis/src/buildroot/erlang-master/build/host-erlang-custom/lib/erl_interface/obj/x86_64-pc-linux-gnu \
  -lpthread -lei

/usr/lib64 is searched before the path where libei.a has been built, so
if whether a valid libei.a or libei.so is found there, it shadows the
expected libei.a. In the build from which the logs above come, the
notable point is that the host system indeed have a valid libei.so, but
is completely unrelated to erl_interface; it rather exposes the Emulated
Input protocol aimed at Wayland stack; and so it obviously contains none
of the expected ei_* symbols.

Upstream has already identified and fixed the issue, the fix is already
released in versions >= 27.x.y. Erlang 26 (the version currently
packaged in buildroot), isn't supported anymore (only the three latest
releases are supported, see
https://github.com/erlang/otp/blob/master/SECURITY.md), so there won't
be any new minor update that will release this fix.

Pick and backport the fixing patch so that the current version packaged
in buildroot can still build.

The issue affects 2025.02.x, 2026.05.x and master.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...bs-order-to-avoid-picking-up-system-libei.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/erlang/0001-Change-libs-order-to-avoid-picking-up-system-libei.patch b/package/erlang/0001-Change-libs-order-to-avoid-picking-up-system-libei.patch
new file mode 100644
index 0000000000..c21311cbb3
--- /dev/null
+++ b/package/erlang/0001-Change-libs-order-to-avoid-picking-up-system-libei.patch
@@ -0,0 +1,32 @@
+From de58cbe979942308eb8823a526cd68b06d5dc662 Mon Sep 17 00:00:00 2001
+From: Sacha <sachahony@gmail.com>
+Date: Wed, 13 Mar 2024 13:28:41 +0100
+Subject: [PATCH] Change libs order to avoid picking up system libei
+
+Upstream: https://github.com/erlang/otp/commit/de58cbe
+Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
+---
+ lib/odbc/c_src/Makefile.in | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/lib/odbc/c_src/Makefile.in b/lib/odbc/c_src/Makefile.in
+index d1b26743a6a4..03ed314f6a26 100644
+--- a/lib/odbc/c_src/Makefile.in
++++ b/lib/odbc/c_src/Makefile.in
+@@ -80,10 +80,10 @@ ODBC_INCLUDE = @ODBC_INCLUDE@
+ # ----------------------------------------------------
+ CC =  @CC@
+ CFLAGS = $(TYPEFLAGS) @CFLAGS@ @THR_DEFS@ @DEFS@
+-EI_LDFLAGS = -L$(EI_ROOT)/obj$(TYPEMARKER)/$(TARGET)
++EI_LDFLAGS = -L$(EI_ROOT)/obj$(TYPEMARKER)/$(TARGET) $(EI_LIB)
+ LD = @LD@
+-LDFLAGS =  $(ODBC_LIB) $(EI_LDFLAGS)
+-LIBS = @LIBS@ @THR_LIBS@ $(EI_LIB)
++LDFLAGS =  $(EI_LDFLAGS) $(ODBC_LIB)
++LIBS = @LIBS@ @THR_LIBS@
+ INCLUDES = -I. $(ODBC_INCLUDE) $(EI_INCLUDE)
+ TARGET_FLAGS =  @TARGET_FLAGS@
+ 
+-- 
+2.55.0
+

--===============3283176523577223496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3283176523577223496==--
