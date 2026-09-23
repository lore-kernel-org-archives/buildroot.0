Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700CCC98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38CB740FC0;
	Thu, 24 Sep 2026 18:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id vSs6dRGL0jt3; Thu, 24 Sep 2026 18:58:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 32BAC40FC1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276316;
	b=Np3e+sC8PyEF8f7b7DlTCEsUu6Ew1zK6/PxibDmbqM+eOvmr2OHh9cdPgK8CR/4sethT
	 0KI1gWStHfK+0BJ3/c3av1Vm5Eu1pKsqy0NBOiit/nHZszNgy1PoqPLrVa8BVNTfLjjxY
	 +Ph4ir0BV2NZd1hFYfLnjTrd/E9SIxfIyKMXzr3fepL18ii40QvRCAa8vniQEUE2Kucx+
	 awMhryWJAXyqeMN2i9SHw6xEXMztgOl92PmBXDnh4LpZ7AkBe3lHUOa/aoJcyE0LKIeCd
	 kEXqlw+p/v9a1lB4nSl1VE9muuQIvedLLCWpZv+2aTG2563OPf9FC2O0DumVYlcFxsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276316;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=tpVUbTR2b8ThhiLSzGcLfqYeBjZUaB9GYNNc4dP1nH4=;
	b=aQAt+b9RJ6N590prANe2OOecgsGb6VlJnEX1TtV0xq/xbacHcRFwFPhSXNUVuvQkBN3R
	 QPDfnWB0T9NEy811rIXdV5QzbarlFzO8RV8tnpohYpSiKv0qmvEy6YwVISpQJkxLA+Lms
	 b+gUR4pvmIygRQs7/NkTi8hpNmqatqBukD8djUVr2DmKVoOM13Vcmfqm3FVBl6Kx5KJLp
	 l9t6ecXFT4D6uRJTNRPIPH9W3bPrOnrJIdHDTE1hYVNdTMxxJ2veTyF1KnERATmyQoRvZ
	 kaj8cDyALDQCYKfghvRQGyr+qEuORRzOCR4c7VEJFE9xkpaVC5WgoiUps31+bj2QoGw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276316;
	bh=tpVUbTR2b8ThhiLSzGcLfqYeBjZUaB9GYNNc4dP1nH4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DDAVWDavMjHMhr620P9B+An8RZgjarZtEkxIRJPo8VVL5GoBKfYMT25PcISWmhd9D
	 k1uZvOak771HoH8wIma8sMv05EcrswmztOpQUlSZCVqMXRenreM3v3Url397cZO7sn
	 YsfwnW0jM6cR8zZqnEwqYvtDvXMGxHnkIqTe1WnldmNQjpTlYMhGmGiOoHlX8UvHAY
	 wc1EXUTj6FJiL9mDBifCjOf6r2QnLJNOb0PlaURcqfoE9X2uizGMce5SV36wWo0VTC
	 QWFZ7BPy6WsJqrlpsiGQ3ydo5TisyIZRKPhPBuPEP/zNOSS/bFz3oclSkpKj5a/Xjh
	 qjPLAsx/+rs8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32BAC40FC1;
	Thu, 24 Sep 2026 18:58:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C155328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70A3D81232
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kMjRbgcqmCh for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8EAAF8122B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276210;
 b=sJW2bQ2Hg4POCeQRMhMh+PovC1VuVYwgSCzSJsFdD836Jt1nGbDfnYtB0oOMWBAy62VW
 Hcq7sny4i3lfu4cC4N0LPKXsudPKQtlI6HT0wyt0hzLlGsbybYzB3DkjKosv2TCAbwwMA
 XN1pL9p6yCBUSve++ObZ83EL+EbYNLdcMjJe8O8Jtaebf3RAbPE6qKOfCvSpHhV0vTxEo
 XBPXG4o+VwTiI9cfMZ4x6sS4QH5sXgqbxYXZ9STqTGVNSAKxmx07wK4NaToiBgtg032ME
 Zc3RkXwftCtzLkJtVqV6CKpVOO9Norg0aEif3ugalTSsLZDzgNKMf7wMikNXpqKPeLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276210;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gxoUJpGvkVFyLAl1bGWfOoaOmnMlIJ9tKlGaO1t2Gzk=;
 b=XyOAdpxqzUEjPDxPLlZKR50m9VYEy42+8sARZTcbXu9cgDgfF9onsMM0nf8t3qFc0ktW
 Lo1D4R9H7rNyMBMp3W683VBNJ2ChuBi+HMRqx03hAXYcVEbRWsA0kUUnAIiGJOapylSkO
 +ck0WgdQqrUn36Pj6JoaOOERuWk/Rt5XF5SjR+XwexrX7Nf6huW1nPE098fnQ/IkXa48J
 o07Mth9tCBraVwg7GIX4mmh6svgu5SCEULcTPGs6fC+jllI/X880rd7oJl+nEQ+CkiPB/
 Ho5A3E0A5eJbtoiN0hgAJtvQo5v+7Gllf49YPMgqZkoqbj69mWWNrLIT6wNYKHhrXFA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EAAF8122B
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 323E098330; Thu, 24 Sep 2026 18:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:46:36 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 4725deea9c38380925129aa4afb10422b434693f
X-Git-Newrev: 9521735392b5c4fe5a745b6d8fdfba5e7e51e754
X-Patchwork-Hint: ignore
Message-Id: <20260924185540.323E098330@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/zabbix: fix build
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
Content-Type: multipart/mixed; boundary="===============7195616641175613024=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7195616641175613024==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9521735392b5c4fe5a745b6d8fdfba5e7e51e754
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============7195616641175613024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7195616641175613024==--
