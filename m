Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA8DCA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0CB740704;
	Sun, 11 Oct 2026 13:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88c0qabZuOhb; Sun, 11 Oct 2026 13:11:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8723F40744
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724282;
	b=lh83xS6jcpdrzXIgFxI0uXiJNbGKDtwaghQ97mmZsd/rsHw5+w+PUynCoHuZ+kTa2l4d
	 bpHXj9/6Pl3d+WS8TwS/oI1sd0CC0TSiuCwkfSQ6IRixzqiNTY9+6D2cFhRUJoy+kdfgF
	 5nQk3O1ZlPkqrRmOfi5RcYI8iSip0rVRx95C0iW+ktrWZtzddUcgOzY6L1En9cawCBK08
	 xdxf8h0G2Ig1m+pjzoI9lyPgDyS93rGgwlDqNeDKCqoWdpx9mb0QZR4yAAbFzYAWj7EbD
	 eWc85OvrHGQbSG8H/qkpYVP5EIOn+AtZHRy8h8neJvtt1eYWbm4cUxY/fTK1NVwsU8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724282;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6hjXnt4c/eb9Sg4VmE4OoC6XWVW1CC/iSkrCgIdHvhU=;
	b=OwTmXIrYBuNWwIRTjO3JPlBb+LRblkW2EVSSMdemUHeIG8iUFsjW/97+j890McyOotcA
	 mO0D2rS8de6siCsXnwuEW0R1n5YkvA8S0GwBxFS/n/0Jj4c6+wghkLu3EWvqK3D/4+WOX
	 EiEbOIG9ZhUzCWSCWEJF/9XCBE9BQ/ovNTygcYyeVy6snonhK3InVJWZfSdtLYxtF43AP
	 XxUV+sLIGRhYYKlDOLRuR4CHjCZKFPn1MKp6RsBLs77AczujywjjI7D0KHZfsy0V7khHO
	 yHdsKPvpq0ATFZqNpFuGrKsiCiXIOqjjOIjApkEXe1JVlhguXgxHSbMdazSOkJE88jA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ZjVCQUq0;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724282;
	bh=6hjXnt4c/eb9Sg4VmE4OoC6XWVW1CC/iSkrCgIdHvhU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GJ0fTNtl2anJjf7zn0UfAQqH5TY567WnEAPDs4/+bn9WIUd1vQM1OLu4d1K4FLS9W
	 sS80wXk2T6xcwx79VzVU0Yhn5S93q3v2crso+kTF6WrWxlmlGeXNcyqfWDB+qIgtNQ
	 sXG/O9xBqAaUgQGi5skrxVnjFqAfsYgZ2LAXsjjKahjX0u3cjWCDxcwaoX890oOc4g
	 KVDl1luokjn7l8TmioOHKn33A+U/iQs6AL4GFCu0D5egaJO0oqCRVhUtrddD/kUNdP
	 2McjYo5o457II2ZwsUo33ZiwAlcuz/IkgHRzpwWvBWUuVS1+ixtT6Y89QiSC/Lhj+z
	 kemSSWXKNVegA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8723F40744;
	Sun, 11 Oct 2026 13:11:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C37FE75
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 822F140754
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0laL5lHmbqC for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:11:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 66CDD40704
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724278;
 b=NdWjDdi+BCNf3JDiMjVmDikYwArDWzCO0ZoCGJAyU7BewTGAfLpyXuhC2AjE0SEPhuuC
 GofXp5Ze8HJTNWpBLWRYl4gLskkXMre/G1UGrvF6ukTJT5CEfPDUAqPGR3yiw0cEg2i14
 MxMNeWTOp6BVhWU2LR1RwKlwrE3cHuMmtIrMQhGIrSYfR3J4fvw4aQl9/+oYFi6SsLP7e
 ZR38FeDXZbNdzrA951uksG1kwP/XCXADRmKuv/eciQgEUGXCcf1UjFuv5I48mtCYQYo2F
 8waX6eF/nVkX45VcbVNZx83G4kNo0Ihy/z+sZ+XMUvKTklLToO7jTHg1FbPagGq1ILg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724278;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=SYI/4m66Xmx7Wyvk2VyBnHKEMzdEGu4DTPdAk8Bs88c=;
 b=gePZUjvwH7TidGjxHCc97kPyYJznltcguN13edDp9OWiNVWzAPEECpLbKLB9gxPLvoT+
 +wVN5K0+vrZURZLYhOaysIR+XtX02b2KCpIYdjE0GAnnnoidiYLS1naEJkxQZo4LG90hX
 gN6AsmQFqw/i4Xgu7j1XEHer/aS277p0R0D/56rsE7Y8M6JiC9BJsABBfeLwu9cuwplMM
 /+1ew8MYHHrN8QVAzcss0RIwqDOevhGsMcvwbzQu8R+qc4i3eaQxjQXThRReDfyp2oGXC
 S08nlAVXISE9XJ3Mmm1CGKdcxufI55pvbINjHgTu9RjpiKMgfounxg9rJcowvkCKKhg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZjVCQUq0; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ZjVCQUq0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66CDD40704
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723685;
 bh=SYI/4m66Xmx7Wyvk2VyBnHKEMzdEGu4DTPdAk8Bs88c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZjVCQUq09oJoRB8eC6Fc+IRrMDXqx7XDAA8fHj0px4rgZdvSouUICydXVnx7eClbq
 tn4lD1Nm6jLZPtkcp5HPoU5UTw/GsOY3LCI3a5T5cn9e1BCgHz5FJ3CsCSFFFnU+/1
 bFJ4unhxQxQ8OoWhqy4EkXhc2d/LwJVPKSbLmhPSnF01L0ou4dQwDJvqGoRMtf0iiK
 l4EQrge+C4Mb+jTvIxBFexIbdw5tA8lANVWShHTEyIMitnR2J2dPdio2Cl14EnSToR
 PAlEn1hGttfqTQek3ZKoR+1bwBm3hRuRtDVq/0h8P8CfInKO3810DnU3cny6Io++P/
 PLP2NDpSKKchw==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 pG8MNZ5WFG8aOc0PrqlXElE9envEju2AW1CkmghHdbRwAubzbhDcNPO/CdtCBZy+GAROseXDQMm
 iC+L+GbFAIMi3duzjZOKKdTf2UP33DjhZ/j/wUf/fubWCJTrQWt1278nljoTqeMy0CznHwAz6dr
 pdYzs1IyTdU12lKBoLjuxhlztw1zmuJ7rPmNo6EKWocVdgUN6Y/UfxovAE+MyeZMBO8t0Se7oaE
 Ifyfaetp9lEPCZKJt7qG3U1sOPzdyF2oOYonKHLQ1Mpx3tM/V8a/s47VFFQcUTMxTFTO5nAVfNb
 oZWe/c0SIQpGGjNvYJGn5KcpjI91VOZ9j2ylcAeNB4C22Fk8SZzALgUKKUWgrUCqyTQDKgoVEJI
 ZZVD1/hWzd+//zpkpZfMyJLAHJeTt53PZeEToivfW78tNfV5l7s4OEPK4EX6W3E9g80OQqRPWix
 qEOpLwy6pUI/6OTKGAwu3xye9bz/UlXth9/tj15aJKpwPLImVmin1VRikevA5qmrt16TcFUkdEQ
 n6w1JF2QebDBRBeBzaMrTvXAITDWFSVpxUm1bVN0S+bQbcJCxB5baFPH4evXksqOI/gmRZCD1da
 Qngi1OSOIMpi+atPtOBufLxBNRS4JegDWtnWQrPuslS+HpyXYFmzDrYS51F68H1KlMaiClx0mRc
 ATGBEfTXkuqPNyde0XjYy4+IZJdB8Ba8acVzz3/8bMvHn4IzKzPVLzkGIuexn
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F7BCA4C58B5;
 Sun, 11 Oct 2026 15:01:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAp-000000007Fz-1KOP;
 Sun, 11 Oct 2026 13:01:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:56 +0200
Message-ID: <20261011130058.3443432-52-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v9 51/52] package/python3: bump version to 3.15.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.python.org/downloads/release/python-3150/

Rebased patches using --zero-commit option for easier updates in the
future.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...e-the-build-of-pyc-files-conditional.patch | 14 ++---
 .../0002-Add-an-option-to-disable-pydoc.patch | 24 ++++----
 .../0003-Add-an-option-to-disable-IDLE.patch  | 18 +++---
 ...move-PY_STDLIB_MOD_SET_NA-further-up.patch |  8 +--
 ...option-to-disable-the-sqlite3-module.patch | 16 +++---
 ...d-an-option-to-disable-the-tk-module.patch | 18 +++---
 ...-option-to-disable-the-curses-module.patch | 14 ++---
 .../0008-Add-an-option-to-disable-expat.patch | 14 ++---
 ...ac-detect-unusable-termio-operations.patch | 16 +++---
 ...mpilation-of-Modules-_remote_debuggi.patch | 55 -------------------
 package/python3/python3.hash                  |  4 +-
 package/python3/python3.mk                    |  4 +-
 12 files changed, 75 insertions(+), 130 deletions(-)
 delete mode 100644 package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index dbc3c60d87..3dc6ddadb2 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -1,4 +1,4 @@
-From 52bb6f2a3ef352cda16d95a588a0356da562de8e Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:21:31 -0800
 Subject: [PATCH] Make the build of pyc files conditional
@@ -15,7 +15,7 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 2 ++
@@ -23,10 +23,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 9 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 08ad5f4921d..486a35ed99b 100644
+index 965244d8d2d..00b8828e222 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2812,6 +2812,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2915,6 +2915,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		patch --force --reject-file "$(abs_builddir)/app-store-compliance.rej" --strip 2 --directory "$(DESTDIR)$(LIBDEST)" --input "$(abs_srcdir)/$(APP_STORE_COMPLIANCE_PATCH)" || true ; \
  	fi
  	@ # Build PYC files for the 3 optimization levels (0, 1, 2)
@@ -34,7 +34,7 @@ index 08ad5f4921d..486a35ed99b 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST) -f \
-@@ -2821,6 +2822,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2924,6 +2925,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -43,10 +43,10 @@ index 08ad5f4921d..486a35ed99b 100644
  # bpo-21536: Misc/python-config.sh is generated in the build directory
  # from $(srcdir)Misc/python-config.sh.in.
 diff --git a/configure.ac b/configure.ac
-index bd4446e9488..ad0781f9ee6 100644
+index ed8b53dd3a4..38615380f11 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1533,6 +1533,13 @@ fi
+@@ -1567,6 +1567,13 @@ fi
  
  AC_MSG_CHECKING([LDLIBRARY])
  
diff --git a/package/python3/0002-Add-an-option-to-disable-pydoc.patch b/package/python3/0002-Add-an-option-to-disable-pydoc.patch
index 294520f815..bdb779763b 100644
--- a/package/python3/0002-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0002-Add-an-option-to-disable-pydoc.patch
@@ -1,4 +1,4 @@
-From 8ba9dc9a12687d37454dd949409599f108f1ce44 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:07:56 -0800
 Subject: [PATCH] Add an option to disable pydoc
@@ -18,7 +18,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 9 ++++++++-
@@ -26,10 +26,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 486a35ed99b..c3732bedb30 100644
+index 00b8828e222..aedc2d55814 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2513,7 +2513,9 @@ bininstall: commoninstall altbininstall
+@@ -2581,7 +2581,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -39,15 +39,15 @@ index 486a35ed99b..c3732bedb30 100644
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
  		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
  		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
-@@ -2564,7 +2566,6 @@ LIBSUBDIRS=	asyncio \
- 		logging \
- 		multiprocessing multiprocessing/dummy \
- 		pathlib \
+@@ -2641,7 +2643,6 @@ LIBSUBDIRS=	asyncio \
+ 		profiling/sampling/live_collector \
+ 		profiling/sampling/_vendor/d3/7.8.5 \
+ 		profiling/sampling/_vendor/d3-flame-graph/4.1.3 \
 -		pydoc_data \
  		re \
  		site-packages \
  		sqlite3 \
-@@ -2731,6 +2732,10 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2834,6 +2835,10 @@ TESTSUBDIRS=	idlelib/idle_test \
  
  COMPILEALL_OPTS=-j0
  
@@ -58,7 +58,7 @@ index 486a35ed99b..c3732bedb30 100644
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
-@@ -2959,7 +2964,9 @@ libainstall: all scripts
+@@ -3062,7 +3067,9 @@ libainstall: all scripts
  	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
  	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
  	$(INSTALL_SCRIPT) $(SCRIPT_IDLE) $(DESTDIR)$(BINDIR)/idle$(VERSION)
@@ -69,10 +69,10 @@ index 486a35ed99b..c3732bedb30 100644
  		"`echo $(MACHDEP) | sed 's/^\(...\).*/\1/'`" = "aix" ]; then \
  		echo; echo "Installing support files for building shared extension modules on AIX:"; \
 diff --git a/configure.ac b/configure.ac
-index ad0781f9ee6..00d2b54ead5 100644
+index 38615380f11..7405aae5f5e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4789,6 +4789,12 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4975,6 +4975,12 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
diff --git a/package/python3/0003-Add-an-option-to-disable-IDLE.patch b/package/python3/0003-Add-an-option-to-disable-IDLE.patch
index 3a386b7a29..4af0f7242d 100644
--- a/package/python3/0003-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0003-Add-an-option-to-disable-IDLE.patch
@@ -1,4 +1,4 @@
-From 463c64020b288b8ddfd32a63c4a23ab7369b9669 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:45:14 -0800
 Subject: [PATCH] Add an option to disable IDLE
@@ -17,7 +17,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 9 ++++++++-
@@ -25,10 +25,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index c3732bedb30..2197bb18434 100644
+index aedc2d55814..827bc608c1a 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2511,7 +2511,9 @@ bininstall: commoninstall altbininstall
+@@ -2579,7 +2579,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -38,7 +38,7 @@ index c3732bedb30..2197bb18434 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -2560,7 +2562,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2628,7 +2630,6 @@ LIBSUBDIRS=	asyncio \
  		ensurepip ensurepip/_bundled \
  		html \
  		http \
@@ -46,7 +46,7 @@ index c3732bedb30..2197bb18434 100644
  		importlib importlib/resources importlib/metadata \
  		json \
  		logging \
-@@ -2736,6 +2737,10 @@ ifeq (@PYDOC@,yes)
+@@ -2839,6 +2840,10 @@ ifeq (@PYDOC@,yes)
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -57,7 +57,7 @@ index c3732bedb30..2197bb18434 100644
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
-@@ -2963,7 +2968,9 @@ libainstall: all scripts
+@@ -3066,7 +3071,9 @@ libainstall: all scripts
  	$(INSTALL_SCRIPT) $(srcdir)/install-sh $(DESTDIR)$(LIBPL)/install-sh
  	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
  	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
@@ -68,10 +68,10 @@ index c3732bedb30..2197bb18434 100644
  	$(INSTALL_SCRIPT) $(SCRIPT_PYDOC) $(DESTDIR)$(BINDIR)/pydoc$(VERSION)
  endif
 diff --git a/configure.ac b/configure.ac
-index 00d2b54ead5..5395e82384b 100644
+index 7405aae5f5e..9752d431cba 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -8189,6 +8189,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$TEST_MODULES" = yes], [test "$ac_cv_func_d
+@@ -8644,6 +8644,12 @@ AC_SUBST([JIT_SHIM_BUILD_O])
  # substitute multiline block, must come after last PY_STDLIB_MOD()
  AC_SUBST([MODULE_BLOCK])
  
diff --git a/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch b/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
index faf990430c..3cd20d883b 100644
--- a/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
+++ b/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
@@ -1,4 +1,4 @@
-From 930c4763ac46d180880615eceeb68698e9b35e85 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Tue, 6 Feb 2024 22:46:59 +0100
 Subject: [PATCH] configure.ac: move PY_STDLIB_MOD_SET_NA further up
@@ -11,14 +11,14 @@ Upstream: N/A
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac | 13 ++++++-------
  1 file changed, 6 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5395e82384b..ec9a24c5311 100644
+index 9752d431cba..25a40069fa2 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -95,6 +95,12 @@ AC_DEFUN([PY_CHECK_EMSCRIPTEN_PORT], [
@@ -34,7 +34,7 @@ index 5395e82384b..ec9a24c5311 100644
  AC_SUBST([BASECPPFLAGS])
  if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
      # If we're building out-of-tree, we need to make sure the following
-@@ -7701,13 +7707,6 @@ if test -n "$_PYTHREAD_NAME_MAXLEN"; then
+@@ -8092,13 +8098,6 @@ if test -n "$_PYTHREAD_NAME_MAXLEN"; then
  fi
  AC_SUBST([_PYTHREAD_NAME_MAXLEN])
  
diff --git a/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
index 77c2f22bc5..3283d27a32 100644
--- a/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,4 +1,4 @@
-From 8f6beca556599479705444af7cc7c49b2b964af8 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Tue, 6 Feb 2024 22:12:20 +0100
 Subject: [PATCH] Add option to disable the sqlite3 module
@@ -14,7 +14,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 5 ++++-
@@ -22,18 +22,18 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2197bb18434..c8f7ab1e6a9 100644
+index 827bc608c1a..334a05ecbcf 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2569,7 +2569,6 @@ LIBSUBDIRS=	asyncio \
- 		pathlib \
+@@ -2646,7 +2646,6 @@ LIBSUBDIRS=	asyncio \
+ 		profiling/sampling/_vendor/d3-flame-graph/4.1.3 \
  		re \
  		site-packages \
 -		sqlite3 \
  		string \
  		sysconfig \
  		tkinter \
-@@ -2741,6 +2740,10 @@ ifeq (@IDLE@,yes)
+@@ -2844,6 +2843,10 @@ ifeq (@IDLE@,yes)
  LIBSUBDIRS += idlelib idlelib/Icons
  endif
  
@@ -45,10 +45,10 @@ index 2197bb18434..c8f7ab1e6a9 100644
  
  .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
-index ec9a24c5311..e8e201206bc 100644
+index 25a40069fa2..22ff89256bd 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4795,6 +4795,13 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4981,6 +4981,13 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
diff --git a/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
index b928cd9435..9b8230555a 100644
--- a/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
@@ -1,4 +1,4 @@
-From b53a2758ac431bc2493a460e6c886561e2397518 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:23:42 -0800
 Subject: [PATCH] Add an option to disable the tk module
@@ -11,7 +11,7 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [ Adam Duskett: ported to Python 3.12.1 ]
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
@@ -25,10 +25,10 @@ Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
  2 files changed, 12 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index c8f7ab1e6a9..2c91d0dda71 100644
+index 334a05ecbcf..7e9eef79b06 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2571,7 +2571,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2648,7 +2648,6 @@ LIBSUBDIRS=	asyncio \
  		site-packages \
  		string \
  		sysconfig \
@@ -36,7 +36,7 @@ index c8f7ab1e6a9..2c91d0dda71 100644
  		tomllib \
  		turtledemo \
  		unittest \
-@@ -2681,7 +2680,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2783,7 +2782,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_pyrepl \
  		test/test_string \
  		test/test_sqlite3 \
@@ -44,7 +44,7 @@ index c8f7ab1e6a9..2c91d0dda71 100644
  		test/test_tomllib \
  		test/test_tomllib/data \
  		test/test_tomllib/data/invalid \
-@@ -2703,7 +2701,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2806,7 +2804,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_tools \
  		test/test_tools/i18n_data \
  		test/test_tools/msgfmt_data \
@@ -52,7 +52,7 @@ index c8f7ab1e6a9..2c91d0dda71 100644
  		test/test_unittest \
  		test/test_unittest/namespace_test_pkg \
  		test/test_unittest/namespace_test_pkg/bar \
-@@ -2730,6 +2727,11 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2833,6 +2830,11 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/xmltestdata/c14n-20 \
  		test/zipimport_data
  
@@ -65,10 +65,10 @@ index c8f7ab1e6a9..2c91d0dda71 100644
  
  ifeq (@PYDOC@,yes)
 diff --git a/configure.ac b/configure.ac
-index e8e201206bc..840976ec1bd 100644
+index 22ff89256bd..be9428dc2cb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4808,6 +4808,13 @@ AC_ARG_ENABLE(pydoc,
+@@ -4994,6 +4994,13 @@ AC_ARG_ENABLE(pydoc,
  	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
  	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
  
diff --git a/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
index 729cb5d624..bfb3f25b79 100644
--- a/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
@@ -1,4 +1,4 @@
-From baef276faa676d1b0faf64a91fa627b5f8fcc5e0 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:31:51 -0800
 Subject: [PATCH] Add an option to disable the curses module
@@ -13,7 +13,7 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 5 ++++-
@@ -21,10 +21,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2c91d0dda71..fb11e416731 100644
+index 7e9eef79b06..174164142c0 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2555,7 +2555,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2623,7 +2623,6 @@ LIBSUBDIRS=	asyncio \
  		concurrent concurrent/futures concurrent/interpreters \
  		csv \
  		ctypes ctypes/macholib \
@@ -32,7 +32,7 @@ index 2c91d0dda71..fb11e416731 100644
  		dbm \
  		email email/mime \
  		encodings \
-@@ -2732,6 +2731,10 @@ LIBSUBDIRS += tkinter
+@@ -2835,6 +2834,10 @@ LIBSUBDIRS += tkinter
  TESTSUBDIRS += test/test_tkinter test/test_ttk
  endif
  
@@ -44,10 +44,10 @@ index 2c91d0dda71..fb11e416731 100644
  
  ifeq (@PYDOC@,yes)
 diff --git a/configure.ac b/configure.ac
-index 840976ec1bd..1d7ba91ccc9 100644
+index be9428dc2cb..1f28a1de74d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4802,6 +4802,13 @@ AC_ARG_ENABLE(sqlite3,
+@@ -4988,6 +4988,13 @@ AC_ARG_ENABLE(sqlite3,
  AS_IF([test "$SQLITE3" = "no"],
        [PY_STDLIB_MOD_SET_NA([_sqlite3])])
  
diff --git a/package/python3/0008-Add-an-option-to-disable-expat.patch b/package/python3/0008-Add-an-option-to-disable-expat.patch
index 4093d6fa76..046a1dd7b5 100644
--- a/package/python3/0008-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0008-Add-an-option-to-disable-expat.patch
@@ -1,4 +1,4 @@
-From 2a7412e43554830ffbc831454de8df903e765b73 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:40:45 -0800
 Subject: [PATCH] Add an option to disable expat
@@ -19,7 +19,7 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in |  5 ++++-
@@ -27,10 +27,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 17 insertions(+), 12 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index fb11e416731..c261b3f9cd7 100644
+index 174164142c0..e0b46d2fe3a 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2576,7 +2576,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2653,7 +2653,6 @@ LIBSUBDIRS=	asyncio \
  		urllib \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
  		wsgiref \
@@ -38,7 +38,7 @@ index fb11e416731..c261b3f9cd7 100644
  		xmlrpc \
  		zipfile zipfile/_path \
  		zoneinfo \
-@@ -2749,6 +2748,10 @@ ifeq (@SQLITE3@,yes)
+@@ -2852,6 +2851,10 @@ ifeq (@SQLITE3@,yes)
  LIBSUBDIRS += sqlite3
  endif
  
@@ -50,10 +50,10 @@ index fb11e416731..c261b3f9cd7 100644
  
  .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
-index 1d7ba91ccc9..3980548b253 100644
+index 1f28a1de74d..021d8a6df5a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4065,17 +4065,19 @@ LIBS="$withval $LIBS"
+@@ -4260,17 +4260,19 @@ LIBS="$withval $LIBS"
  [AC_MSG_RESULT([no])])
  
  # Check for use of the system expat library
diff --git a/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch b/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch
index 78c0fe057c..83fd1435c8 100644
--- a/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch
+++ b/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch
@@ -1,4 +1,4 @@
-From 2d336d1fedb692350a1e4f131246f60a1195cd93 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 7 Dec 2025 13:57:06 +0100
 Subject: [PATCH] configure.ac: detect unusable termio operations
@@ -15,7 +15,7 @@ done using a new m4 macro PY_CHECK_IOCTL.
 
 Upstream: https://github.com/python/cpython/pull/142380
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.15.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Modules/termios.c |  8 ++++----
@@ -23,10 +23,10 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 30 insertions(+), 4 deletions(-)
 
 diff --git a/Modules/termios.c b/Modules/termios.c
-index efb5fcc17fa..3177cb0747a 100644
+index 38743e176f0..a2defe4b270 100644
 --- a/Modules/termios.c
 +++ b/Modules/termios.c
-@@ -1115,7 +1115,7 @@ static struct constant {
+@@ -1122,7 +1122,7 @@ static struct constant {
  #ifdef TCFLSH
      {"TCFLSH", TCFLSH},
  #endif
@@ -35,7 +35,7 @@ index efb5fcc17fa..3177cb0747a 100644
      {"TCGETA", TCGETA},
  #endif
  #ifdef TCGETS
-@@ -1127,13 +1127,13 @@ static struct constant {
+@@ -1134,13 +1134,13 @@ static struct constant {
  #ifdef TCSBRKP
      {"TCSBRKP", TCSBRKP},
  #endif
@@ -53,7 +53,7 @@ index efb5fcc17fa..3177cb0747a 100644
  #endif
  #ifdef TCSETS
 diff --git a/configure.ac b/configure.ac
-index 3980548b253..48604024fcf 100644
+index 021d8a6df5a..b87ebaa79a8 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -101,6 +101,26 @@ AC_DEFUN([PY_STDLIB_MOD_SET_NA], [
@@ -83,7 +83,7 @@ index 3980548b253..48604024fcf 100644
  AC_SUBST([BASECPPFLAGS])
  if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
      # If we're building out-of-tree, we need to make sure the following
-@@ -8217,6 +8237,12 @@ AC_ARG_ENABLE(idle3,
+@@ -8672,6 +8692,12 @@ AC_ARG_ENABLE(idle3,
  	AS_HELP_STRING([--disable-idle3], [disable idle3 IDE]),
  	[ IDLE="${enableval}" ], [ IDLE=yes ])
  
@@ -97,5 +97,5 @@ index 3980548b253..48604024fcf 100644
  AC_CONFIG_FILES(m4_normalize([
    Makefile.pre
 -- 
-2.51.1
+2.47.3
 
diff --git a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
deleted file mode 100644
index 833bcc9cc8..0000000000
--- a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 528429e329047ee572248da0e1212f7cc1ef7d11 Mon Sep 17 00:00:00 2001
-From: Pablo Galindo Salgado <Pablogsal@gmail.com>
-Date: Thu, 25 Sep 2025 00:16:44 +0100
-Subject: [PATCH] gh-139275: Fix compilation of
- Modules/_remote_debugging_module.c when the system doesn't have
- process_vm_readv (#139307)
-
-Upstream: https://github.com/python/cpython/commit/1963e701001839389cfb1b11d803b0743f4705d7
-
-[ Bernd Kuhls: ported to Python 3.14.7]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- .../2025-09-24-17-32-52.gh-issue-139275.novrqf.rst              | 2 ++
- Modules/_remote_debugging_module.c                              | 2 +-
- Python/remote_debug.h                                           | 2 +-
- 3 files changed, 4 insertions(+), 2 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Core_and_Builtins/2025-09-24-17-32-52.gh-issue-139275.novrqf.rst
-
-diff --git a/Misc/NEWS.d/next/Core_and_Builtins/2025-09-24-17-32-52.gh-issue-139275.novrqf.rst b/Misc/NEWS.d/next/Core_and_Builtins/2025-09-24-17-32-52.gh-issue-139275.novrqf.rst
-new file mode 100644
-index 00000000000..8cb4b972ad6
---- /dev/null
-+++ b/Misc/NEWS.d/next/Core_and_Builtins/2025-09-24-17-32-52.gh-issue-139275.novrqf.rst
-@@ -0,0 +1,2 @@
-+Fix compilation problems in ``_remote_debugging_module.c`` when the system
-+doesn't have ``process_vm_readv``. Patch by Pablo Galindo
-diff --git a/Modules/_remote_debugging_module.c b/Modules/_remote_debugging_module.c
-index b46538b76df..e86a27d5812 100644
---- a/Modules/_remote_debugging_module.c
-+++ b/Modules/_remote_debugging_module.c
-@@ -1329,7 +1329,7 @@ _Py_RemoteDebug_GetAsyncioDebugAddress(proc_handle_t* handle)
-             _PyErr_ChainExceptions1(exc);
-         }
-     }
--#elif defined(__linux__)
-+#elif defined(__linux__) && HAVE_PROCESS_VM_READV
-     // On Linux, search for asyncio debug in executable or DLL
-     address = search_linux_map_for_section(handle, "AsyncioDebug", "_asyncio.cpython", NULL);
-     if (address == 0) {
-diff --git a/Python/remote_debug.h b/Python/remote_debug.h
-index 8f9b6cd4c49..b7d17a0f345 100644
---- a/Python/remote_debug.h
-+++ b/Python/remote_debug.h
-@@ -1174,7 +1174,7 @@
-             _PyErr_ChainExceptions1(exc);
-         }
-     }
--#elif defined(__linux__)
-+#elif defined(__linux__) && HAVE_PROCESS_VM_READV
-     // On Linux, search for 'python' in executable or DLL
-     address = search_linux_map_for_section(handle, "PyRuntime", "python",
-                                            _Py_RemoteDebug_ValidatePyRuntimeCookie);
--- 
-2.47.3
-
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index ae4a00c319..2546b249c9 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-3148/
-sha256  c2215904f02b175596dc49351585104f4bc20341e1c47378b26a2c274360ce73  Python-3.14.8.tar.xz
+# From https://www.python.org/downloads/release/python-3150/
+sha256  ba4bed1ba346b916890b76d9e320451420aa69f6408997d33c66482eeae3d575  Python-3.15.0.tar.xz
 # Locally computed
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b86453f145..0c5fd19d78 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
+PYTHON3_VERSION_MAJOR = 3.15
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).0
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
