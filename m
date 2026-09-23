Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565BCC9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2732140359;
	Thu, 24 Sep 2026 18:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqNSBhHKdVuV; Thu, 24 Sep 2026 18:57:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D073340B5A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276238;
	b=HViizhcAwYQFCynncLsXVM7HbRTAEzJqNThXtvBylAFdHlujA9AehsDXYNIw7jPneCgX
	 42NNcQhSjvjMZ3dId5jd5Zo+mPLVSWrghhZXFZWem5C2IXWWVIbglEQyZ9dhazvDIz4pQ
	 fbupLj45wxuQifjQY3ZniNzQ+UnPuo/vCtREtdVZrbQD6vwornmS2h8gF9nbWyKEK+KAy
	 u4lrK4Mz2eeSWt3EgI1ulnsT8py5vvCKXZ+CC2bXD2zc820O1BQHXE6E59MQvVbQDmBjk
	 RWOUkBBHVW5KBrqAoTH50jdFjgzKbyY+Vlw5Gn1DZOpiBf4yzkel5lWdnzpD4RmFyPQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276238;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=IIY4gQnOXLmarw8jESreuzN2CIixtZLxa/Lq1J5Hqfc=;
	b=ewxdcbCUoz0s6bRqUkr12Md027AQxjTw4LcrVYdOc8n8EE718dvRZo7Ff1hiuLkHrrLC
	 SSvSqWq+2XE0hZl8w0QPSVsfPs/M/vTSINVJgjvdm8LrGBo+gCcGFmC3/QnL+uLRTrdtI
	 zyWylhb2d5A9xLMAolMPIW+L3IZGdEUxVdHwYLUt866sodPXYLGDy3IBwEGlHZbocqCGt
	 Hs0YdrA/TRCej+GePf9FZCGWkaQAjH7zM44iYTJIrRgkErOsBKtZ3cqhEjteoVk99teyS
	 sxYoNlFdxBIHNVyl8yd/7mIAuBV8g/lM6kf1f3w184KPraWPdDw48BHdaMAbr+8G0aw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276237;
	bh=IIY4gQnOXLmarw8jESreuzN2CIixtZLxa/Lq1J5Hqfc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qXBFf2rqM/3djL9lAbieABQcX2FC9mmBn0GEpFgQz3s+EhXhTOpL5aBrMYJGnhVm+
	 RLkgI6QmBH6tqER8JNqtWA/suwtrM3MHgW5h1iQ3YVMx5NyypjEKqU5dzWhNRJ/Bdj
	 /0siru2UH2ksJEjgznso3gS0zM2E7E0ZCD2R9UJU98xZr+1NGAS8MWzE79xQQAvygk
	 /dfLM4RBU8UJPBkTltUJOYQsP0wNKyPatWqx7kJ5o9Mo+1d67NI2ZnsqEMXsdZ7q7Y
	 lT+eKmuHZcnW2o4KL8qVUSmJG6HPnkwJtxUQ4tRhyZKWdrkdz5x4hGr08KQokO45v/
	 b0JClgfI9PvAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D073340B5A;
	Thu, 24 Sep 2026 18:57:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E40E328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BAE081217
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pAQl7-0XBXNG for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A6CD881209
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276203;
 b=d9rTG6/3ujEOfS0yNdKzUlJXVb77WZzFuqbnETJouNcXkZi3EOy/fMq6AE7t+3R0JfkH
 wz98I5TyFqRztVQtdbUi/sFw+4aIRzxNAtKBWNy7dqOQKR/OthbGfy4ItuZ7YGzuP5F46
 FOjCda+ozYGZgnsBFIqYrk1eBoAytHlOH01mRxeabd2x7zdQf/nUhAFSM9m3tdmlMn8Ju
 7Y5KblHsH8O25GLVEPp79fFrT9wnq96dsdbDO96NVt6VajvG30B12LnyROmIIwIQbqAiv
 4TrsHRu7l+ZLdoeYSQ/nXC5IMxOFmxBEALVNaNCD11/JdTSBlFQkd2tteTOerU46crg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276203;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3RCHRqwO7b0Bhi/calJsadnJ3IwGH6Zno9ThaMcIokk=;
 b=k38d5xEVYfF2wPgdi3upIRYRTIe/OJWCMIPlkrv5Z43s9uBMHsHoEKrh6x9TVxi5w0oK
 rjKrNdnEXOirWMYVVm20WiGqmHePP83spLP34hnOVyYlrXTaRbAT1DwqLu+Dc0AQGg1G8
 ccZupbCBIJWJbFCTvxoEz2kV4deWNp/D0cWF5KdgCb3eDuexUrsjdYP/SLcj/4n1o4o7P
 RfguUOrvx5QvCO4XHQIAQ4cfnUme2HLM2maQeujb/Knn7APSxf6YP+ZzlisoEnQxwjNzJ
 8Hu+j+3zLMQmnlGdzSzYYBtEzxC0RdXoTMbZJQ0HxNl/RjAcNDQu5LrEH2nFhbGItbw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6CD881209
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EC6098385; Thu, 24 Sep 2026 18:55:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:15:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 707a7026fcb906fed9b5b959e282c294afe2eb0e
X-Git-Newrev: e673c80cb759f592700cc5fa0496f082496f4601
X-Patchwork-Hint: ignore
Message-Id: <20260924185533.3EC6098385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/exim: bump
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
Content-Type: multipart/mixed; boundary="===============4225706630403642716=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4225706630403642716==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e673c80cb759f592700cc5fa0496f082496f4601
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============4225706630403642716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4225706630403642716==--
