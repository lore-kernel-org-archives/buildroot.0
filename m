Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BACC98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B27A40D79;
	Thu, 24 Sep 2026 18:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKaOivCom9o1; Thu, 24 Sep 2026 18:59:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B04DC40D94
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276352;
	b=AV6R4scXuft2xmj9k3Pn+1Z+J36HCtF7hiRN9GCrrnWFYT6Six3nJYeJcpWhloJg7Ecq
	 nOY88tJwK+V8wbfFIqHtojLCqRWZvNtBmOGetWGfMUpZEwo1s7vGNVd5trWT5mV+Wu2s0
	 gIfWiO9J0ebtR31F4NXq1+aNJdtT3YK0QL4nRRaUVmSCDCPjMx9adN7BrJvfpk0fTWU8W
	 p4q62SDmE6Ow87aHoOS6RtY/9ev4B8VssxHOLtKBP8v4gTxlmCpraAyKEHVhc4GmhHpR5
	 9O9JGoH2hNJxUij3kMX0whz2UnvscqPVQ52QKie8feSGbH6eOoDHoQ1sxiJrEQCxgXg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276352;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Ab0xIACzrAYBDz16c28dcO4QPmT9gFaUljbpvkT6pqc=;
	b=EGrJiwWH7ndeTh/TFstSlT0cJ3kR7nS219GnhW4QINvRZ7z+Rmhvp7mDULZgU4WaAicn
	 iNLgshu6z4IANPNI/k4m8HfpnUB2xzfhao5TWAc1PTA+H/eyQ+lubhWz7cFtM+m6BG0Jz
	 Wvn/0TLchDA+e5e0bgy3/4LL0+2VC6JvC/lgpOL9O1w9V5FiJi/S4T8J4BI+QPtgaZRCi
	 XddznwCP1M67xgtWPwqcGwBszC7iyvJpG1Eo/NQGND3xqTw27F4YaDsvy+Byzlm3aJdac
	 Z0AixWxwcH9OF2yFU7gb/lTO5hKqc0EpjNDfOR1nT1w44cntyXcdhGKUGmDhZuTfiMw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276352;
	bh=Ab0xIACzrAYBDz16c28dcO4QPmT9gFaUljbpvkT6pqc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ebddm0QaUr3FigZkhkoFDzzupHfE3u+pNcHU7Ljdo+Kh3I8By8OkG0z+B7Vc5ysjY
	 sFF4UHL3gm6DpoyxVmEtk2AX2QTSukvt465F+eWhgbaz4yfvKoUrhGf0+logN0n+F5
	 X5kaOXbwK0Lwxm10vYqdCafhO3OdtoSsFlHzCQ14m2ZLZF4Tx8vz5VooKtlUbMcczE
	 1YbVQAtaEVw5/p5Jk9vhLSLyuxpejysEQCZ3ohAhMV4PZUL6jEPPSCPCRoT7GYg6O5
	 0xkFAP06lldEXmq1Fm67H+h7BzHHGp3QTeAbWInzYbWJk5snMYwZyZvv2PE1Qy667g
	 nMqMfQlr+cCpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B04DC40D94;
	Thu, 24 Sep 2026 18:59:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79A96328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AFA0404CD
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5PwEeWjWy8xU for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4B290404B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276212;
 b=p/ZWvqJbA+JRQrZT56pjoG5/zzkoMiJ6DgszdiIKaZvgtpNv2zqfGPVmdz9iC7+t4TAq
 o/9883ySRnpfcMyVpMP1dkPK0m7ZvysPRhiNPlcUrfSShRx2QzPozJb+8/h9sq6uTPN1k
 KbbePL7p4yTSebQ052vT3leNQFgZtPmjC3ylqAixjWs/anw0BpQKFQdQf4I6sjVNUFatw
 fIh0Q/6HqBgw+nVp1BqK89FSsnHKOLVJmc764Kp9SWknnd8/J/YddyRzwoASzqqCoP3Fb
 NAG9S0AE62bbWoWS4s5ipVDl/mKW+LtSLcxwjkWpoNd2cQV8o1VY8yZ3Z8a8Usp8ROw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276212;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=d13JBpOZBsnAGLxfySSd/2SIUjjJnwjrvkjfbjAfyUU=;
 b=U9XS7tNYxcdTcptuMNFlcV+dY0BAtUmjvp2P/WwG3XZz2j4EoU66QpOIoZkVclEOpY//
 xyyk4PKZtLuaVnlb3fSqia6uphE20vs0r/5n12K0XWQkUN1S5wQ8itty5slo4HMJIVOGb
 oXmNH/95FQ+7MQL2SSzbgHFTS+3k/Gsd5xEaA3EZ47MTqeFf719dkVWhoyCWhNG32imsi
 izLZLW+BOekvKk6bsHepHHuwwh0b/gEl66yhyuCKqFofNspSIUPlZ7tod9A9Pu9Q2Harb
 /gXW/v9oE3Fqp3UUh8OuQ6UYVVYQSihJa/nrfz/qfEUaQUL/AS7Nitpl9awXnBAG4lg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B290404B1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E285594AA9; Thu, 24 Sep 2026 18:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:15:42 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 0f4211f335804c0a471504c9e93e02be7cf455eb
X-Git-Newrev: ebce679ef608828f5576efdbc3397ecb25d30f6c
X-Patchwork-Hint: ignore
Message-Id: <20260924185541.E285594AA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/exim: bump
 version to 4.100
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5572494663863664198=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5572494663863664198==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ebce679ef608828f5576efdbc3397ecb25d30f6c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit 8b009489f53147e652d2c197a1f814daacd33385)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============5572494663863664198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5572494663863664198==--
