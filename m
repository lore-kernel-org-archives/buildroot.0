Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE970C79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 10:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94EFA605EB;
	Sun,  6 Sep 2026 10:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UCMxAw-0-Wvg; Sun,  6 Sep 2026 10:53:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 56062605F0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788692010;
	b=qvzf0eo7JS7RDhw4C65GZEZWtnf/3C5yYwqK4dlYM4omY8vGGUUuWFfs+PRAhhZvDsgA
	 kJ+oBqp8JUx6svGYKbH+1LBDwdB4JSSW4ZUXKB3/OW51KXzTEElnws2zmVt0otPtDf+sc
	 2cyvrsZW/4m8TIwOnubk8nOEDhHM+9jRB9MKO6glAQ0YN3JUVTxZJyKX9zc0EBHM2G1Kv
	 OZMvDJfRto+VSfp9sBMC0Sq4va4jbHBbHGwIc0L/Z1Y8kVc8eWbn4IDxOIKBe3ZvCKYk1
	 YN7HP1MqTt5jqEv/wz7U9ksUQBzfhsdKaMc2I2p4HzeC6wBFkTZZxpuIK9WIrRPx+Zw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788692010;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ACEDLfKCvjj9CGf6JsWyo8fQM4/gOONmWpAY5qOxV6E=;
	b=A+FxcRCzHb5ZjKFjrmM2/Gkr0PxNVBkaAfChVl5OdK1ZLmDIi7BQN7qt0x34aeY/fcgG
	 hlCO9jPaIeTgXRZgZXq1FfovmzDrcOcmBnYVaOV2nb3SgkiRb3dMbi2phP3pbURGxuwim
	 HaRt1ES9rS6XNhFc52+XT5MeyiSAZvQF+XArXP6TWjUhykYQz47PPcLxA7mfRKci1Wym7
	 H0881I52KsTpclOjD98PudNZv8gqy5PItB36qNVktiBoj7oeQY2Zpj3eAHrqF0fsfdBty
	 /DFSZkH/QT4BNMId4n5VO70J4hNzsxHh5xJR1NDHRbWGP+D3beDN75HEKS+gkUKzEYA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=eQReWi+F;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788692010;
	bh=ACEDLfKCvjj9CGf6JsWyo8fQM4/gOONmWpAY5qOxV6E=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KRQtdVohCs4L1q29+gnbl2SUBnyxIQxjDoVhmoc68ugIpMPQAhQgZaJ3w4htOjo5n
	 IOFPKCcunH+PVo9dlipRB1wPHac8qkKjWOQoO6ZwDrF2flAi8LIxuKqU4Q948GVVV6
	 mnme89USXs7LFCwABFJjdpMX9z1FRlKHqSd/NC4R0glSi+bvulAJPk8oLhNn4E1bjR
	 NIbbX7l+0WMC/exNDIQQ9Am0vzgUG5aY0Qi2eWbQqRzUv7cO7lw05BHL1C87KNNy7G
	 ATeme25aym9JUlpcuoASDpF5csKiiiHpCDvO2eunNO2RYtHh6LN6xBH2qNb6naYEtV
	 9CnbEe4C/qCcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56062605F0;
	Sun,  6 Sep 2026 10:53:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7955E3AF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F4AB605EB
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tPu0o6IR9yh for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 10:53:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 15192605F0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788692007;
 b=Fh83a7QfOQMKLflLhWfy/qMvrSECt40uu0+LQXGp0+khRh1Rg/C9tpstUeZWCY9yL/Kd
 GFZEHlGJcD6C55w5j0s2YwzcqJJK4dZVGCX2LbxJvkyXPuSzw8TRxgP045ZEmQbG7gdGY
 CfY1lrCH628F7AFQ7RM2DLCvN+wlfHJaUBVL5iPcuB2ECSCpzkTyXM6b7ijO/e3mGUF6k
 dj+bZjZ+RkZ64LfuDtVsgKeFexYXn8tnmlPVTOWgdhFUnVFBf0pqonx/tVfwaeUowynVp
 /tNGzBQyFYgD3E8/XLrLSyIqhvjPZx8bwYThiT78AIBBeSu9sRFkK1brGtkQdmof0OA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788692007;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=98d2yL9v3Lrs1bZqWVAuOuvdjTTZKbYRR9jLCzS1/1Q=;
 b=aXaSD+apWPpOIgselQ3JrZ2pi3eN/dr5PKOLQVHuqOALY83+Bae+T8NecS1EUFhaKvaM
 LpPjZ8mGdu/9qJIraZ+aB/lIYPsvjsrzYRE/HxC6fd4hPeBuNNk9kOiim/52Pw+6oZV2w
 X1yS0L7jj3JOfzpegoHRuZHtCHFPQ7n0Cc7p6oF33XrYqXlCTBxYUBv9Si/xOW/lVULnc
 9Nnr5Ru2Fh/QZ2BvDBy4iyVyj0wfxM+2sibavnfCULJaXDOL6/9kf1jPVSME190GlQrNa
 Sif2XRW9mRREoCLUTQBD1To4dfZlaAIRQ2WbvuOmMGCvi/1tReWmmqTLsHEpOWeJLuw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=eQReWi+F; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=eQReWi+F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15192605F0
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788691992;
 bh=98d2yL9v3Lrs1bZqWVAuOuvdjTTZKbYRR9jLCzS1/1Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=eQReWi+Fl6OOdyZliSyQQ7ppXxX+WuKbLmmUJWGXLv49+uztzhsX+1xy7l66NsYLY
 e/sR0vBGnOercCC8cLF1CwdxO98jkbGczHxlGKv55b0Dc7yFhSVUy+E+wSRRwlhgFm
 3DrTz3Lwuq4cEnzJBYMRWvyTMql0T3O1srIbhGN12yGWIW3xnhVhHSqSkqfiW0K37F
 IaJl03yUMF4/adY9zwVYBrZv+E0IEmcq1Rbico3wP98ndRR1ruAsJVRBK7PqZTBmOb
 MYd29kw3Z31JNe32a821iv0kGSH4/RNs8v8HzjVBTw2tQY8pgtTDfc0k5d8T/9df2m
 aACDfvaV+xQDA==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5608FA4C2F12;
 Sun,  6 Sep 2026 12:53:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55574)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3AUq-000000007lJ-0HfB;
 Sun, 06 Sep 2026 10:53:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Sun,  6 Sep 2026 12:53:09 +0200
Message-ID: <20260906105309.3690634-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260906105309.3690634-1-bernd@kuhls.net>
References: <20260906105309.3690634-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 2/2] package/exim: bump version to 4.100
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lists.exim.org/lurker/message/20260820.154633.91995f73.en.html

Rebased patch 0001.

Updated patch 0005, the previous version was applied upstream with
commit 497e9eb7e77ad27ae1d45281e23eefadfaa7a3bc but it did not fix all
linker errors so we sent a new patch upstream which replaces the
previous patch.

Updated hash of GPL-2.0 license file (address, name of president and
typos), a commit can not be provided from the source tree.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/24ccdda33622eebee11e88a9af4a6b63476d060b

 .../0001-Build-buildconfig-for-the-host.patch |   5 +-
 ...-cross-compile-by-adding-LD-variable.patch | 106 ++++--------------
 package/exim/exim.hash                        |   6 +-
 package/exim/exim.mk                          |   2 +-
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
