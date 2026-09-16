Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E46C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29B564054F;
	Wed, 16 Sep 2026 21:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUtDjWdwxzZ7; Wed, 16 Sep 2026 21:02:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E92D24060A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789592553;
	b=AuwmLlP9V7aMh7t08Nj78y18TlqTiAkaUdu7MrN4iNe+jh7BN2KnJ3X7dL3PPsGAw5sq
	 UutKVWZZJABLrb+SCrTZP8kLyILr9ejErErtemJsoIqqEIUpG5GiMJac36Uj/0b6okG6v
	 cI8EepO7Va2ArhltGT3JHXVjFxfedD5/nOhCEhfK1Ep2kIamNYjEFoXQ7nB6mv/6t20Cj
	 1MHfjbAa4OPZcvnTotgCN2/WvVT2FlosDk9QxEJj/IsThEtX2Il4F2r2rwhTEXvmB9S8o
	 34tqQquu6tBC2KhFCSr9liyz1Ebv0rsl4eE07HP4ZqDqM3Q6gIw16qNtF74Q4BidyuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789592553;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Iu1U/7XQ0N7wjPqMHMwGvHZO7hUoUHyHqXf2GyqCfSw=;
	b=dBb7J5MxJIu/R3bPK3yCYs5HekTfmOh9dgGr13SaBHyq5zaBVk9/YmRYqs0sgHdEJSFB
	 PDlBWJiLHDue4TFwNeOmjrEGNcK+yobiJYqITwF3v61/40qXlBLonwvr29rRsZ8/iNXyg
	 ZY1OUYAPUdCyICfDo8UbqxGhLn7WkS1XsZXssEPPYTHbXuwUyjY7gUuP+0Lxa2kGq8UWM
	 mObXLKJa3oUbbrgjllH9voGhOmYP4S8JxRCb9CKqj013NYeBgy+Q22RK7LBoUy7hpU0CO
	 u+8Y8496zjgyrhYk5FTjVHB820Vh/3HaNH+pZd6QteSDgIdgsOflZel41Q2/UBXzTkA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789592553;
	bh=Iu1U/7XQ0N7wjPqMHMwGvHZO7hUoUHyHqXf2GyqCfSw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YY6VkYDr/VKHeHGAn2YPmq18gzxofxjOMcKtM3bhbmjpOa5GvLB46PT9yHQ+S8RT5
	 lpNSwx99sBAWU7Wm6DrDlCOq6NIMMfiEGZgGl11JNcXgqL1Az9Co+S1ogQ1jPmJJqG
	 B9enZ8mdLZY5tRf9q9D8fVERd75U0j1w3pou8f4UYv4MqCGhOmaph8/dad5w8WgthZ
	 axj7c++vgSjKYEUEDttYCI7PFvIrqk1d+QzVn91HvYm0EJx2kRBg3HemoYfxcidLeQ
	 1q93sWXOfIUQ5K5bnihKtUPbKsh7ichi0AtX/Ajc/dj0oqZeaxP70GfVvHuQR2vu+d
	 1bk0fjHCygl6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E92D24060A;
	Wed, 16 Sep 2026 21:02:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9EB69C2
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC2314060A
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9kiqQ6BsXMD for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:02:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D33144054F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789592548;
 b=g0R932fOQBPTd0aRX5UGgPZMZodD8hXgTCtRA5hUwGlwk6y8AVksfw8Eg2DaGaREuass
 LlwA74Ko6jEi4264HWQyqjoUiVVRMCUe15eARDJRnG4MyBRLanBpysHwM6bsaythb7X1T
 GyUYwhxXn+KrTOTFk3W80AbjRV1tRUIxuK8Ep9IwwpCKk7zPW17XfyDfxecSkZ/DedDds
 efIAz3t6aHRmkLgMLmd7a8p8IPUa8giPKV04uJJtQh9GLc50qKw996721Ve4P8OMyQ+Md
 R64g4N7THCJeuRqmujm2te+3DoLvCH4KmP94wgU2IJ33X59Zx6bp/P64HNIAVlftGjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789592548;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=abzynu+2yH62UWgy2t2+uCtszjY+5R+z2w0E5Cvi5rI=;
 b=W3V0dYFVKuOm4WOr3udDMl9Z3V9E9XsLetDFKAb3qjJiOE+uno56gIFFiEC/pGrMdO2q
 Lm/Jn4Vd4jbxDfsdQwH2ieR4ulRXoaNBa6dYKXYlW0henQGQxmiY9JLdl70B5v09Fc5Ny
 WRi6Ny8gnu9eir2rlHuk9QHuQjdKZaK6lwE05eoKph+CYp4F/KMq/nAYXkIkjwW1DVyzW
 74EV6Qg4ydo9i9KxoljqDxsTYHeWS/w6mEneqvoA1ViJOSwSHeXHjubjyt0PHB2M3+cmK
 32aSMVoi0t8KAu/42AfOVk/F34ZfYHyLhkGVlWKBlBpQfl3gQoclD1EfHWXtxaY8s4g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D33144054F
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:02:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5861196B14; Wed, 16 Sep 2026 21:01:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 23:01:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c4abe552f34bbbaac9139a0f5ca57de10d1cbcc
X-Git-Newrev: 8b009489f53147e652d2c197a1f814daacd33385
X-Patchwork-Hint: ignore
Message-Id: <20260916210122.5861196B14@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exim: bump version to 4.100
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b009489f53147e652d2c197a1f814daacd33385
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.exim.org/lurker/message/20260820.154633.91995f73.en.html

Rebased patch 0001.

Updated patch 0005, the previous version was applied upstream with
commit 497e9eb7e77ad27ae1d45281e23eefadfaa7a3bc but it did not fix all
linker errors so we sent a new patch upstream which replaces the
previous patch.

Updated hash of GPL-2.0 license file (address, name of president and
typos), a commit can not be provided from the source tree.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../exim/0001-Build-buildconfig-for-the-host.patch |   5 +-
 ...5-Fix-cross-compile-by-adding-LD-variable.patch | 106 +++++----------------
 package/exim/exim.hash                             |   6 +-
 package/exim/exim.mk                               |   2 +-
 4 files changed, 31 insertions(+), 88 deletions(-)

diff --git a/package/exim/0001-Build-buildconfig-for-the-host.patch b/package/exim/0001-Build-buildconfig-for-the-host.patch
index 6f4351a50f..2f2e23c1a1 100644
--- a/package/exim/0001-Build-buildconfig-for-the-host.patch
+++ b/package/exim/0001-Build-buildconfig-for-the-host.patch
@@ -2,7 +2,7 @@ buildconfig is meant to be executed on the host, so it has to be compiled
 using $(HOSTCC), not $(CC).
 
 Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
-[Bernd: rebased for version 4.99]
+[Bernd: rebased for version 4.100]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  OS/Makefile-Base |    4 ++--
@@ -22,4 +22,5 @@ index 29a6ad3..420ba60 100644
 +	$(FE)$(HOSTCC) $(HOSTCFLAGS) $(INCLUDE) -o buildconfig buildconfig.c
  
  
- util_deps: config ../src/utils/msgid.frag
+ UTIL_DEPS = $(CONFIG_DEPS) ../src/utils/msgid.frag
+
diff --git a/package/exim/0005-Fix-cross-compile-by-adding-LD-variable.patch b/package/exim/0005-Fix-cross-compile-by-adding-LD-variable.patch
index 99bf5ce667..51383329fd 100644
--- a/package/exim/0005-Fix-cross-compile-by-adding-LD-variable.patch
+++ b/package/exim/0005-Fix-cross-compile-by-adding-LD-variable.patch
@@ -1,95 +1,37 @@
-From a47de397eb1f28356086f315a443c288599d8657 Mon Sep 17 00:00:00 2001
+From cb7d04db69623673e606a3249bc7de1330c8f0b6 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sat, 1 Nov 2025 17:00:52 +0100
+Date: Fri, 4 Sep 2026 18:43:42 +0200
 Subject: [PATCH] Fix cross-compile by adding LD variable
 
-Fixes cross-build error due to commit
-a449ff8ca50e6df5faee2f1e83e1198c27738dfc.
+Upstream: https://code.exim.org/exim/exim/pulls/3244
 
-Hard-coding "ld" when cross-compiling is a bad idea.
-
-Upstream: https://github.com/Exim/exim/pull/98
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
- src/OS/Makefile-Base      | 10 +++++-----
- src/OS/Makefile-Default   |  1 +
- src/src/miscmods/Makefile |  2 +-
- 3 files changed, 7 insertions(+), 6 deletions(-)
+ src/miscmods/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/OS/Makefile-Base b/OS/Makefile-Base
-index 5a15b0a6b..0250647f0 100644
---- a/OS/Makefile-Base
-+++ b/OS/Makefile-Base
-@@ -1065,7 +1065,7 @@ dynmodules: buildlookups buildrouters buildtransports buildauths \
- buildlookups: config
- 	 @cd lookups && $(MAKE) SHELL=$(SHELL) AR="$(AR)" $(MFLAGS) CC="$(CC)" CFLAGS="$(CFLAGS)" \
- 	   CFLAGS_DYNAMIC="$(CFLAGS_DYNAMIC)" HDRS="../version.h $(PHDRS)" \
--	   FE="$(FE)" RANLIB="$(RANLIB)" RM_COMMAND="$(RM_COMMAND)" \
-+	   FE="$(FE)" RANLIB="$(RANLIB)" LD="$(LD)" RM_COMMAND="$(RM_COMMAND)" \
- 	   INCLUDE="$(INCLUDE) $(IPV6_INCLUDE) $(TLS_INCLUDE) $(LOOKUP_INCLUDE)"
- 	 @echo " "
- 
-@@ -1074,7 +1074,7 @@ buildlookups: config
- buildrouters: config
- 	 @cd routers && $(MAKE) SHELL=$(SHELL) AR="$(AR)" $(MFLAGS) CC="$(CC)" CFLAGS="$(CFLAGS)" \
- 	   CFLAGS_DYNAMIC="$(CFLAGS_DYNAMIC)" \
--	   FE="$(FE)" RANLIB="$(RANLIB)" RM_COMMAND="$(RM_COMMAND)" HDRS="$(PHDRS)" \
-+	   FE="$(FE)" RANLIB="$(RANLIB)" LD="$(LD)" RM_COMMAND="$(RM_COMMAND)" HDRS="$(PHDRS)" \
- 	   INCLUDE="$(INCLUDE) $(IPV6_INCLUDE) $(TLS_INCLUDE)"
- 	 @echo " "
- 
-@@ -1083,7 +1083,7 @@ buildrouters: config
- buildtransports: config
- 	 @cd transports && $(MAKE) SHELL=$(SHELL) AR="$(AR)" $(MFLAGS) CC="$(CC)" CFLAGS="$(CFLAGS)" \
- 	   CFLAGS_DYNAMIC="$(CFLAGS_DYNAMIC)" \
--	   FE="$(FE)" RANLIB="$(RANLIB)" RM_COMMAND="$(RM_COMMAND)" HDRS="$(PHDRS)" \
-+	   FE="$(FE)" RANLIB="$(RANLIB)" LD="$(LD)" RM_COMMAND="$(RM_COMMAND)" HDRS="$(PHDRS)" \
- 	   INCLUDE="$(INCLUDE) $(IPV6_INCLUDE) $(TLS_INCLUDE)"
- 	 @echo " "
- 
-@@ -1092,7 +1092,7 @@ buildtransports: config
- buildauths: config
- 	 @cd auths && $(MAKE) SHELL=$(SHELL) AR="$(AR)" $(MFLAGS) CC="$(CC)" CFLAGS="$(CFLAGS)" \
- 	   CFLAGS_DYNAMIC="$(CFLAGS_DYNAMIC)" \
--	   FE="$(FE)" RANLIB="$(RANLIB)" RM_COMMAND="$(RM_COMMAND)" HDRS="$(PHDRS)" \
-+	   FE="$(FE)" RANLIB="$(RANLIB)" LD="$(LD)" RM_COMMAND="$(RM_COMMAND)" HDRS="$(PHDRS)" \
- 	   INCLUDE="$(INCLUDE) $(IPV6_INCLUDE) $(TLS_INCLUDE)"
- 	 @echo " "
- 
-@@ -1101,7 +1101,7 @@ buildmisc: config
- 	   CC="$(CC)" CFLAGS="$(CFLAGS)" \
- 	     CFLAGS_DYNAMIC="$(CFLAGS_DYNAMIC)" \
- 	     LDFLAGS_PARTIAL="$(LDFLAGS_PARTIAL)" HDRS="../version.h $(PHDRS)" \
--	     FE="$(FE)" RANLIB="$(RANLIB)" RM_COMMAND="$(RM_COMMAND)" \
-+	     FE="$(FE)" RANLIB="$(RANLIB)" LD="$(LD)" RM_COMMAND="$(RM_COMMAND)" \
- 	     PERL_CC="$(PERL_CC)" PERL_CCOPTS="$(PERL_CCOPTS)" \
- 	     PERL_CFLAGS="$(PERL_CFLAGS)" PERL_LFLAGS="$(PERL_LFLAGS)" \
- 	     INCLUDE="$(INCLUDE) $(IPV6_INCLUDE)" TLS_INCLUDE="$(TLS_INCLUDE)"
-diff --git a/OS/Makefile-Default b/OS/Makefile-Default
-index 858361bf3..c469c7f01 100644
---- a/OS/Makefile-Default
-+++ b/OS/Makefile-Default
-@@ -227,6 +227,7 @@ HOSTNAME_COMMAND=/bin/hostname
- 
- RANLIB=ranlib
- 
-+LD=ld
- 
- # EXIM_CHMOD is available to specify a command that is automatically applied
- # to the Exim binary immediately it is compiled. (I find this useful when
 diff --git a/src/miscmods/Makefile b/src/miscmods/Makefile
-index 1e46d4456..cfae5aac2 100644
+index 807d6f377..5bac23a7f 100644
 --- a/src/miscmods/Makefile
 +++ b/src/miscmods/Makefile
-@@ -62,7 +62,7 @@ dkim.o:
- 	$(FE)$(CC) -c $(CFLAGS) $(INCLUDE) pdkim.c
- 	$(FE)$(CC) -c $(CFLAGS) $(INCLUDE) $(TLS_INCLUDE) signing.c
- 	$(FE)mv dkim.o dkim_tmp.o
--	$(FE)ld -r -o dkim.o $(LDFLAGS_PARTIAL) \
-+	$(FE)$(LD) -r -o dkim.o $(LDFLAGS_PARTIAL) \
- 		dkim_tmp.o dkim_transport.o pdkim.o signing.o
- 
- # Similarly, we want a single .so for the dynamic-load module
+@@ -96,7 +96,7 @@ dmarc.o dmarc_native.o:
+ 	$(FE)$(CC) -c $(CFLAGS) $(INCLUDE) $*.c
+ 	$(FE)$(CC) -c $(CFLAGS) $(INCLUDE) dmarc_common.c
+ 	$(FE)mv $@ dmarc_tmp.o
+-	$(FE)ld -r -o $@ $(LDFLAGS_PARTIAL) dmarc_tmp.o dmarc_common.o
++	$(FE)$(LD) -r -o $@ $(LDFLAGS_PARTIAL) dmarc_tmp.o dmarc_common.o
+ 
+ # dmarc_native is special in the same way as spf_perl
+ dmarc.so dmarc_native.so:
+@@ -112,7 +112,7 @@ sieve_filter.o:
+ 	$(FE)$(CC) -c $(CFLAGS) $(INCLUDE) sieve_filter_body.c
+ 	$(FE)$(CC) -c $(CFLAGS) $(INCLUDE) sieve_filter_input.c
+ 	$(FE)mv sieve_filter.o sieve_filter_tmp.o
+-	$(FE)ld -r -o sieve_filter.o $(LDFLAGS_PARTIAL) \
++	$(FE)$(LD) -r -o sieve_filter.o $(LDFLAGS_PARTIAL) \
+ 		sieve_filter_tmp.o sieve_filter_body.o sieve_filter_input.o
+ 
+ sieve_filter.so:
 -- 
 2.47.3
 
diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 4cdedb724d..c075b2fe96 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  c2d2f80adc7c71d424fd82a46655eaa2d7d9b4ca2e77883eba9076947b7ee627  exim-4.99.5.tar.xz
+sha256  5bd0a3e353dbfcd5c8174388b824316a61ee2455d9052ea2f0877dee939d33b3  exim-4.100.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  28fd15d0d4e0114129fd42140fb5d5920fcd5cbfb6ac816197e3567c3d2ece6ec73367b43bd8d47d2b543adb89ad28a5e4c58a23210887f867a5c41c24e181b5  exim-4.99.5.tar.xz
+sha512  e7f2cc1ba9af4b1113d9a40b384bf2e5439f539381126018fb9a15d3afaf687fd209d06d1cfa96e61426df0d9f4e7988e49e1192510abc02b2aa19b14b051abc  exim-4.100.tar.xz
 # Locally calculated
-sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 482c7ca2c1..a8395a2309 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.99.5
+EXIM_VERSION = 4.100
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
