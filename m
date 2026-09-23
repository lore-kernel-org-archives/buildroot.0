Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CAEC98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF3698083B;
	Thu, 24 Sep 2026 18:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sj7BCs3lDykP; Thu, 24 Sep 2026 18:57:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AAF3881261
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276231;
	b=dnNMK5vsUxOnRspvGOkdGkVCoCDaHs4FElhzqF5J+nL+EYsVECDBzm/ldNp+MsnuibPn
	 suZdx6m7qg7IFLiz5mqXNU8jsyyl4nBp1XLwE6XS2HXoDHi+usYn9KCPwmIumaHNZpVaT
	 KYofl6y4iW8gCp6+/lJPCiIBYayFRs3i9hRSywSp2w6tjKgJGW/lYZi0bXRpuEHyE8MTs
	 HBhyGnuqFmcQP3muW8KT7qM1+YA0E+uBIfgTOaK4CkJk3T4Nqg1uiFPfZYURL8IpI6XIl
	 RvYM9WYlAU7enq9M4nP5IdgyZNf4N7Qh5TVIvLWldwF1qItmcZnviH120jT/qz7vaxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276231;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=+UC2ZrWjo2OfNThcwtxTzMkUDrAn9Dxi/d0tDn18sIY=;
	b=Mv61FyAyE/hnAjfsJJ89fcd3+uoz4O2ApHmDzJA7eGpneky/XsMhjGd09/jhL1Q/jO3m
	 I11Y2c3KE5NcQ78iNFUHTnb0UnnciWW6Bje2lyW0RfDBfRRe7bbEh3whjBYFWBUKrhaR9
	 OR/lMMow6b9T81y/HHqxUotIFmfbeeyF5UOPkElJ3tAF7uyRqft0n/nmnNWljb8P/QUqJ
	 8/JHpRoDYBXdowpzM/kILVIIn355e2YFmPVQGV2ABkMsK9bS6Q69lAi1hPdNFEZccx1TV
	 gUxpgOqnApeE/1lFV8eUYLk9f82pcB/nvzZf3oL9lJ/7fxBbOfwPGyKBP+oI5hFyOSA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276231;
	bh=+UC2ZrWjo2OfNThcwtxTzMkUDrAn9Dxi/d0tDn18sIY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BdbyOushAjjo3w/FlEk12aN4oCK2odoDXnPSp7jS0VhHHePWS+b34/cqJij9s525g
	 9IXx/br5K8ubPETdHNvarG8pJsqzDSStEw/JdgiRlgcTVOJQKnG5cptWQ0e6f+Mvvm
	 EKtgfiElcU0Lpsd6kgGdRHFMNdHwIaEr0EL1DQoHYAz7UmP8XdcrLIsFfLmVwYsRl9
	 K8fNfGU9DfOt80CzqWDMgQnPrRV9o1AD1vndojNBgGQJ0tGmc2I43HrSxnmIUQa5wi
	 U/3xUHSoBP2rLRwZU0QsxZFRoFJnqjiMlPyZUePKugLBFY8XZAOtSH8522PCrOS7jI
	 97wDXZg+WGm6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAF3881261;
	Thu, 24 Sep 2026 18:57:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A95D392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28BA940AD4
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unPCZxNn_aIo for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 387DD40AB6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276202;
 b=RQdcb34rznFDO0rdjZR07X3n0pDMPn+qVwnlHlY6bifZDA6Fh4s0DmS3OWjczl2Aw2SU
 SI08+VnuBba/6ah7vvApOP/6qGFRP3lcRNKL8y7oJN3vBbfbuPpyQy8383N5ejWTG6CMG
 ywr+TAmhcnwZEnclaNpAXTKC4pTssa0RJzq11NZ8vkVlkYobCNRLlhtj/iR5J/9AYfdJB
 Trvl+vUswBS/K3S8MmCj0jxmc2GRSwEYoTdWDnkI1EjqDHJGtUK4MK1VQaHQEmSZSEcmH
 uEX7xav9RiGFYXn7MG/gQlU4IVJzY5sHl9nhGA05kceW5rvhG8tKKSYU0AQ+oxky11Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276202;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+FwLzlGNn0QVbb5T3lfo8nd+7GCMholCX+11hmh9g/w=;
 b=qusOkmUkUZqTHSKqptllatQL1BMywg9Cpbykm94BUY218ot0N7kJd38avtCLFbk2w7vQ
 Lz6YF0oaeWigNszuRbik4WXq5+ggG3zj4MJg5nM8LaKEWQY0CNRk3KOc0d0V9GT82+YAR
 6nZmlPPlO2nCD50a7r2YeVd3J69rn4Lvp98FSiWbfEWv+iLBN3H2gdXDxeEMN9J+raA1h
 M/rFW3SdOCGiPSMtyr8ygJPCublAlvyFQwjWbP2HE5u5ebR3QBFRXJWHpy/Pjh0RQXaZq
 Ype9Xw13FLQ15SHNYfqqNQ6WzKjTWDjyXcUKnuToT+4jYNN/H4qOhFNL8cW5aUwEXzQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 387DD40AB6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D037298383; Thu, 24 Sep 2026 18:55:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:46:35 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fc4bfe4a15c96afae68b55683665a4b425d65633
X-Git-Newrev: 029033171c7194f66e526895268694b355a658d9
X-Patchwork-Hint: ignore
Message-Id: <20260924185531.D037298383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/zabbix: fix build
 without libcurl
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
Content-Type: multipart/mixed; boundary="===============4657373007556688923=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4657373007556688923==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/029033171c7194f66e526895268694b355a658d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Building zabbix without libcurl enabled would lead to the following
error:

/usr/bin/ld: .../src/libs/zbxxml/xml.c:515:(.text+0x1c64): undefined reference to `zbx_vector_str_append'

This issue has been addressed in the upstream commit [1] and backported
as a patch in Buildroot.
For more information see the upstream issue [2].

This error is reproducible with the following defconfig:

cat >.config <<EOF
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_PHP=y
BR2_PACKAGE_ZABBIX=y
BR2_PACKAGE_ZABBIX_SERVER=y
BR2_PACKAGE_ZABBIX_SERVER_COPY_FRONTEND=y
EOF
make oldefconfig
make zabbix

[1] https://git.zabbix.com/projects/ZBX/repos/zabbix/commits/e8333ca2128
[2] https://support.zabbix.com/browse/ZBX-27635

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 489aefc22af70996cae8d49694f5646be67d90bb)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...ix-server-and-proxy-build-without-libcurl.patch | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/package/zabbix/0002-fixed-Zabbix-server-and-proxy-build-without-libcurl.patch b/package/zabbix/0002-fixed-Zabbix-server-and-proxy-build-without-libcurl.patch
new file mode 100644
index 0000000000..b90c7536da
--- /dev/null
+++ b/package/zabbix/0002-fixed-Zabbix-server-and-proxy-build-without-libcurl.patch
@@ -0,0 +1,69 @@
+From 0a29a6b4cfa608e0c2e393125f60f4bbb271e8b8 Mon Sep 17 00:00:00 2001
+From: Artjoms Rimdjonoks <artjoms.rimdjonoks@zabbix.com>
+Date: Mon, 27 Apr 2026 12:36:47 +0300
+Subject: [PATCH] .......PS. [ZBX-27635] fixed Zabbix server and proxy build
+ without libcurl
+
+Merge in ZBX/zabbix from feature/ZBX-27635-7.5 to master
+
+* commit '142cefe8703dd25afaf8c7f05379d61136e773fd':
+  .......PS. [ZBX-27635] fixed or includes
+  .......PS. [ZBX-27635] updated include
+  .......PS. [ZBX-27635] added Changelog
+  .......PS. [ZBX-27635] fixed Zabbix server and proxy build without libcurl
+
+(cherry picked from commit e8333ca2128bf9ac2ab50ee1ee06445766b6192c)
+Upstream: https://github.com/zabbix/zabbix/commit/0a29a6b4cfa608e0c2e393125f60f4bbb271e8b8.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ ChangeLog.d/bugfix/ZBX-27635        | 1 +
+ src/libs/zbxsysinfo/simple/simple.c | 5 ++++-
+ src/zabbix_js/Makefile.am           | 2 +-
+ 3 files changed, 6 insertions(+), 2 deletions(-)
+ create mode 100644 ChangeLog.d/bugfix/ZBX-27635
+
+diff --git a/ChangeLog.d/bugfix/ZBX-27635 b/ChangeLog.d/bugfix/ZBX-27635
+new file mode 100644
+index 000000000000..a8b07470a37d
+--- /dev/null
++++ b/ChangeLog.d/bugfix/ZBX-27635
+@@ -0,0 +1 @@
++.......PS. [ZBX-27635] fixed Zabbix server and proxy build without libcurl (arimdjonoks)
+diff --git a/src/libs/zbxsysinfo/simple/simple.c b/src/libs/zbxsysinfo/simple/simple.c
+index 599816c517a1..3bc324a08b1a 100644
+--- a/src/libs/zbxsysinfo/simple/simple.c
++++ b/src/libs/zbxsysinfo/simple/simple.c
+@@ -25,9 +25,12 @@
+ #include "zbxcomms.h"
+ #include "zbx_discoverer_constants.h"
+ 
++#if defined(HAVE_LIBCURL) || defined(HAVE_LDAP)
++#	include "zbxip.h"
++#endif
++
+ #ifdef HAVE_LIBCURL
+ #	include "zbxcurl.h"
+-#	include "zbxip.h"
+ #endif
+ 
+ #ifdef HAVE_LDAP
+diff --git a/src/zabbix_js/Makefile.am b/src/zabbix_js/Makefile.am
+index 1e4fd93d9fd2..2ef20fb9f911 100644
+--- a/src/zabbix_js/Makefile.am
++++ b/src/zabbix_js/Makefile.am
+@@ -9,7 +9,6 @@ zabbix_js_LDADD = \
+ 	$(top_srcdir)/src/libs/zbxembed/libzbxembed.a \
+ 	$(top_srcdir)/src/libs/zbxjson/libzbxjson.a \
+ 	$(top_srcdir)/src/libs/zbxregexp/libzbxregexp.a \
+-	$(top_srcdir)/src/libs/zbxalgo/libzbxalgo.a \
+ 	$(top_srcdir)/src/libs/zbxthreads/libzbxthreads.a \
+ 	$(top_srcdir)/src/libs/zbxmutexs/libzbxmutexs.a \
+ 	$(top_srcdir)/src/libs/zbxprof/libzbxprof.a \
+@@ -23,6 +22,7 @@ zabbix_js_LDADD = \
+ 	$(top_srcdir)/src/libs/zbxhttp/libzbxhttp.a \
+ 	$(top_srcdir)/src/libs/zbxvariant/libzbxvariant.a \
+ 	$(top_srcdir)/src/libs/zbxxml/libzbxxml.a \
++	$(top_srcdir)/src/libs/zbxalgo/libzbxalgo.a \
+ 	$(top_srcdir)/src/libs/zbxstr/libzbxstr.a \
+ 	$(top_srcdir)/src/libs/zbxnum/libzbxnum.a \
+ 	$(top_srcdir)/src/libs/zbxtime/libzbxtime.a \

--===============4657373007556688923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4657373007556688923==--
