Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A939CDB46F
	for <buildroot@archiver.kernel.org>; Tue, 23 Jun 2026 15:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3A3680C10;
	Tue, 23 Jun 2026 15:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQDrWvb-sTfr; Tue, 23 Jun 2026 15:58:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CEE7817AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782230290;
	bh=/U7XWTl6D2AyAsMDcX/St4ACtD/WN+AvSx+hhgW7ZVg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gNgYadvUVMfhMLaGOUblOQOhQADmSI0pD3m0yoE6+8OUGDQQRERufT0yLeq2gH9QP
	 2dgFYOVuKeGpVwXl1GSW712/mVX4zFdye0hLnHb8/S/denRQWmvh1bX5zgUnYFN45u
	 AJ1luD34l4h2k/uSifAoA5lUfeWEd1DvCD+Yk4aqNIWn2QKC1HC32qLn+WcO/YiYgc
	 pfwOFefl4RPOLhhcwUn2cdf/6YllJmU+bSGmnwebhGPpMMfEowhWlaZhLZ40aWD8QD
	 puSEELopDe0V3Q1i8BhtCirca3ya5GXp133am3d4Kr4rcxPaSU80ZPSgZxCuitWe/5
	 Gni8kwZpRiTLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CEE7817AD;
	Tue, 23 Jun 2026 15:58:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA64B256
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 15:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C052260651
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 15:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OrOgw0kbqZRC for <buildroot@buildroot.org>;
 Tue, 23 Jun 2026 15:58:07 +0000 (UTC)
X-Greylist: delayed 308 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 23 Jun 2026 15:58:06 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AD64360646
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD64360646
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.72.192.73;
 helo=mout.kundenserver.de; envelope-from=paguilar@paguilar.org;
 receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD64360646
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 15:58:06 +0000 (UTC)
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue108
 [212.227.15.152]) with ESMTPSA (Nemesis) id 1MWAWq-1wdkF800pW-00UEkX; Tue, 23
 Jun 2026 17:52:48 +0200
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Cc: Pedro Aguilar <paguilar@paguilar.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 thomas.petazzoni@bootlin.com, ju.o@free.fr
Date: Tue, 23 Jun 2026 17:52:31 +0200
Message-ID: <20260623155231.3827936-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:RRMkUXR6QEnMfU5iH2kExXULxw7CyaTBE9IYD+Qa6hEgKJ1IYuX
 eamahjeRYaWbq03uEKmOlxkSexvFeLVy1T4HSUo7HsUxmtEHah98NmEcAHecroN/Fk1QgdG
 hOWXnH67timCirtc2+EwG7yauK7LrvDXxpwKgsvZTB4UuS4M5igOqwrO54edCQd4f+ps6KN
 oBIXGR5ywYmnmVIO5UOIg==
UI-OutboundReport: notjunk:1;M01:P0:qUZd9tYm3Xw=;/bJ3tecF9enivWYicBLCzdJCmAL
 8BvV/FflJdbhUV65l4MJmfqFyI/mmJ03eqCpP0hplQRsRIQeligUXvgQixMTDhhLFEr22eV+w
 8Os3iYHyIpZorfWA40LQEmQ3CpFJjDMzrst1zjOIkfVwOWg1vYd0frFfTArOSJaFS9+fWwZCJ
 XOWsBtj1u48qc02ylvD1fcFTvXViYQhl8DOMNwQud7kkmkLKt5PNhlCey8PVeu4H8C9aoHOK3
 GPfRJraNaAemRkFpX6TR6/Yc0hdqmJm1m7ftIICdrXJv6REZiDm3J01pUgxlWR5WaQQv1+0qd
 T/c0dH9YWmYP4MUpvzdY86jZpQcvyiscDcuzkmLQr7rt6FFo6Piqr2NfWj9QBXwyZticxyi3h
 NtZAYCuBObyhLP2iQIaEdur1r86Mt1F7iPlwW+FlylzgPTrlelav6qBgHfjHVdL22oMQn/RAF
 xoiWcHJ/Q5BiANP8G1Fy33dw0VmDYVdPU/l3LSqW1jyAJlBXgjGOxz7r/DM4bfFfhWlwCFw+k
 OHYLRt5wEMeHhq4GgFE7cZPkQ72KnxhwGfcgF9INXkx/EXte2xNqbKyVDWUUPsyV5/XSxdG9Q
 5onEwRNBVBKbY2BpyIMKwN7hgTl7MiPaZTf929kPOuU3YAHr+SGbvDHO8NyNVUVrg7RG/afIf
 YbVYQWkHSEfuHsNLvEdBdIci9UF3HnkzvvIJwoxJ9Bm7LuaIk3p6j46ZmZTnEbykQAcD4LRz5
 HB9v+ourHiZyKLt0i+8X6p97PaRbVSmVy4PcuIUj0gPTfrS0VQGGfamtbhTBEzUCSDIE4cdZQ
 Ix5SDuE+I0WUSeASyxcjUjad5nLISSoNHRTAzNGTz1FvnynCDUzjlVqPEyMTBXQz+WSDVxcic
 sfhcgnp+HnT4I49kBZKOe9Db4GH76s9vdMebtdpZU7+V9WNCfEBDJoS3HJOqyKyf619F3BpJu
 38TeqIFDRj0MRv2AXkY5dvYiuvTBtCFXgUpFeMwQ9tGgPVxixhwkTk4dDptUfDUk+DatYM2N+
 jlj8Tv3oEt3SXbusqik6wZtuYf8opjRM3pmlXbVCcI86IxIfk40KPdGaaO/QuqEhWiEOk9f3v
 mHw6ALxFSh8RMQMeYlMT79g91mmIQXp8PyvfMLTc5MXEGB4dJiRo33CKEdBUm3l1+UMq9MgYg
 3bd/jHsY8GXa6wH55HEYlqQXWlFYYGGK6ZVaM35H0U3pdyEAldZSirG+5I70JEGWoX/AsoHN4
 VbM7z2X7LovjKb2L2Dly5hlpxz63csmacJQ51fJvuxKW13M+5xFxsTwu4EJJv+0tgzf5k3lrC
 YW40HD3Dh/L6PrWeIxcwbDoXdCSOOlSjC/eTxJjUSI1KZ8SFJwVaQx0ouqQj+bT3Tf11IY4Gc
 tLmzVB6d802bt5aGdCBVEpYWJJ6D6+BpuZornDWN3ro0mxakRNvt3W7uiSZRhgdJ7aqh/qnPZ
 89AZkf7AjY4bgTVtR38jeRzIDgOHFAl/fUr0+BrvP3LLZ+zO/1t56zbdc4mDK+W3KcVwTukwE
 Gqx1hMQ1MidqnyFGh0aYXFm5cBwYlGqZWZu0PAZAziHFT/RHo7z2nJHHh3APmXd9LjyP4/NtB
 RMABjl/OMXpVD+M4px4O1o5aLAyPBY/Z9Xge6LiU613BwCxCSVXgT6Dfo1htHaFIHmMlPvEPm
 NTOKnKTeUZ+uyfgbX78gyOzT3SSTpsT/gm3/n/VrLMOC/mR/W624OQKWgaHZ2kfpC1ufHwa+G
 sEx8koPTvcMVWEXLJzRDErZiaAigZXsz4O5sX2sbEC/SwoMUKJJkWdnB23SWdi588RQ8+Uqz9
 LejbiqX4XSS8/rc0bgD3+L+cteuJ6EFijoTsu62Wjco8ijR5U8+d0YtiXiETNpftE4OuKnK60
 GKx05t6+7E1o4iTMEpVCoWAYfIt0/FpkVxDrt2d0IUfjDeqSYDnU0Y5jNc/GhkpfyAHoq0Hm3
 RyagwqRoX3rChSvE+Iaqjkc9Yqu5rMchuOCfl9n6Re4cf5GyPde4YxdiHsJwAQBVeJKEg9zw=
 =
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paguilar.org; 
 s=s1-ionos; t=1782230284; x=1782835084; i=paguilar@paguilar.org;
 bh=I7t+4GUespA8aXzG1zz5g1NI67uzuxVSW0LeHe6rDZc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=EBhW+KXChJsPdLHS7eRbKf/HRj5rvPWPrK3lMIuYH/UEXwqMac7AzrQBR7fF2yvN
 +Te+3xl5+4rElx3OwE+jBauOZC1cvmBcS91kY94YonJk229FkUL3ANCyxn5kdBEWc
 m5w7VboVZCDjiK9+nBG50fBBvWvnDX95BpVDcFi0CyBitnsBYAKEQzt9jRsBRxrnI
 2EazTPdtDaXliVN098j9nlFs1xMYGjUiKZP+jm0WRNfDGaJ0AZhCjRAIAANgNKfwO
 beDxLp5ce8TBGre3M7LkKxA83++tpcBcdSn/Qb5BwaVGq3YVmSgebtjFX6E8b+sxw
 3z4x8yysciy3+lfIJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=paguilar.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=paguilar.org header.i=paguilar@paguilar.org
 header.a=rsa-sha256 header.s=s1-ionos header.b=EBhW+KXC
Subject: [Buildroot] [PATCH 1/1] package/guile: bump to version 3.0.11
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

The patch 0002-Makefile.am-fix-build-without-makeinfo.patch is not longer
needed since it builds even if 'makeinfo' is not installed, so it's removed.

Changelog:
Changes are detailed in the git repo logs:
$ git clone git://git.sv.gnu.org/guile.git
$ git whatchanged

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 ...kefile.am-fix-build-without-makeinfo.patch | 51 -------------------
 package/guile/guile.hash                      |  2 +-
 package/guile/guile.mk                        |  2 +-
 3 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch

diff --git a/package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch b/package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch
deleted file mode 100644
index 0d16f92387..0000000000
--- a/package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 9304ad88a5f4b083d348563c5de00da53b34cf46 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 6 Mar 2020 23:20:39 +0100
-Subject: [PATCH] Makefile.am: fix build without makeinfo
-
-Don't build doc subdir if makeinfo is not available otherwise build
-fails on:
-
-make[4]: Entering directory '/nvmedata/autobuild/instance-7/output-1/build/host-guile-2.0.14/doc/ref'
-  MAKEINFO guile.info
-/nvmedata/autobuild/instance-7/output-1/build/host-guile-2.0.14/build-aux/missing: line 81: makeinfo: command not found
-WARNING: 'makeinfo' is missing on your system.
-         You should only need it if you modified a '.texi' file, or
-         any other file indirectly affecting the aspect of the manual.
-         You might want to install the Texinfo package:
-         <http://www.gnu.org/software/texinfo/>
-         The spurious makeinfo call might also be the consequence of
-         using a buggy 'make' (AIX, DU, IRIX), in which case you might
-         want to install GNU make:
-         <http://www.gnu.org/software/make/>
-
-Fixes:
- - http://autobuild.buildroot.org/results/9605aac6f760bfff190d0ab95fa50f65486ffe90
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to bug-guile@gnu.org]
----
- Makefile.am | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index ebbf6d476..2270afb9f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -38,8 +38,12 @@ SUBDIRS =					\
- 	test-suite				\
- 	benchmark-suite				\
- 	gc-benchmarks				\
--	am					\
-+	am
-+
-+if HAVE_MAKEINFO
-+SUBDIRS +=					\
- 	doc
-+endif
- 
- DIST_SUBDIRS = $(SUBDIRS) prebuilt
- 
--- 
-2.25.0
-
diff --git a/package/guile/guile.hash b/package/guile/guile.hash
index b671edad9d..4db8b1855b 100644
--- a/package/guile/guile.hash
+++ b/package/guile/guile.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  1a2625ac72b2366e95792f3fe758fd2df775b4044a90a4a9787326e66c0d750d  guile-3.0.9.tar.xz
+sha256  818c79d236657a7fa96fb364137cc7b41b3bdee0d65c6174ca03769559579460  guile-3.0.11.tar.xz
 # Locally computed
 sha256  b51c6f20e6d029cb5b3e5bf235ac562c9a188c5bdc4ffcdc663897772d6e0260  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 82daaf5ad4..467a21f5a2 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GUILE_VERSION = 3.0.9
+GUILE_VERSION = 3.0.11
 GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
 GUILE_SITE = $(BR2_GNU_MIRROR)/guile
 GUILE_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
