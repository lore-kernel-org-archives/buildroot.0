Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BDEC98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F38340CDA;
	Thu, 24 Sep 2026 18:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zidKyMtOwpQD; Thu, 24 Sep 2026 18:57:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9AD5040CF6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276253;
	b=L8CT9j+SEbUTQyLZz0TmAYa3tmBxwzTfvNxnDawqpGqYs6vW584kDzgZVgxa+HE9jRf6
	 VvylELss/cMcP5O/AkHl2KwfC9UNf/5m8OmntICjQ/pjyw7a/O/bh8CnGd0KPnxmtZsLG
	 EDWJpGHlUMY6M0KQIclmYx1CeX8n6ydgltSaa5odgPdFp28L77/EK6+anA9huMJwArLad
	 UXq1RJYWww2/jzKQ+KkbQjDSys6AYqNVTLvcxzRtGtkLKzgsC4hyUOvR9to2m5YhQgapl
	 WuUrcJKJcRRpb8wwL17zzrR+lBjFmhzkNriPx+7B686VaNzc598fR4QFPqM6f1GkbxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276253;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=DY2N6XzjPuZQ7ew2dbmeasUOt2PS/FMrPNAoirsEirI=;
	b=J56uAADIk31x93B81iuIwHRuJjWBAogIEOFLYH4tEziuSTVBUV7ZoBCIDwm0hP9FXm4c
	 BXgOJqddt27bZ+FopqS6Qjl9X9u80v+s5086RS69uysySnvKDTefg7LzDmR+Ali+WykOV
	 Zxf5PkgcDcvyb4PHRailpb3ZxAkO/4IXI1wg61Y58p9sGjVdxq0uIECUwg+yuxHgSDA9Y
	 PNYK+VCoARix5hQGO5lm4Rub+6uvCmevXBHlYtfUWy+x7bRiH+HtOkE8Swx9ynocxq8eG
	 aeIOIWOpnjm9hc+muXDlzULSu9xDVzEj9tFPGscWbA3rlUr1MUBzyp9qgHgwgyUUE+Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276253;
	bh=DY2N6XzjPuZQ7ew2dbmeasUOt2PS/FMrPNAoirsEirI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K5rR69vvenSvqYc0InFz79DCNRwOG9Xng7KSS957cG35JMfTjCUujtbC5DYdB2uL6
	 Z303H9PQP36HVyL6NTWmgew07kURA9VJmDHHQu64A9IXdpsfZDzh1NAlabgqLp0Ub5
	 5dfG01ihtXux9TsYLMsStU1AoHjXVqpyjvbQUd3Fd7Ah4o+3DnCMBFNZzVOLsR9LmQ
	 Yb9vRfsKd5nokHxPr6w6bL/KBT/r5DBXbC+ecgjyvK69L6ucJ1V08C8G8IdBY73k2E
	 KfC9DWQidVEH1c/Pim8PB6pkChH4K+icdIMzOslDJydkgR2L9MTrhvr6bmlxKh7iZu
	 bs0yoDC8L0Oiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AD5040CF6;
	Thu, 24 Sep 2026 18:57:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3A033B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEEC040ACC
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qk9eIBizsnaw for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 25C7F40AC9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276203;
 b=exoSF2eBLG/WTF0PjBq+7PpmyyBaM1hZxrcpVvOczs+O0Kij+NYxwu2bdcyqCZp3QF0Q
 dxTJ17szeMeJNYrrrwsppHL49W9of0j1cWsH/J7ejZsL6rVXGa8o/H0Dkif+5UWHS2nwc
 pOlLFnj3RrJs8bZlExSwit4hsGeaFtlkoOFAlf7LuBjklvnRNF0DoafEIXrRaQ2KBCSuO
 NP9OCYI8aeS2e9tz4CM5svjXbBOMNX2mwXEWRJLGV/dljlLOvqDgu/J6nfp/aG3DmpPFd
 5JLU8LVmdrlSxS8vuIdJPmSbhU1OAzZWU8sIQyFLzkWifmiPN+69pW5116Detk4tLww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276203;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=A/S9JlQNqxC64YgEB8ibWLOL7QykeyOHiE7zsKk6eAE=;
 b=hmsHyw6JdKwgYdFsoquCycs7FsQtuvoVLmZEhtag9zS2XF1qzd+38LCkjGhmu9wXIc3q
 nZAN1R0kHPjm5BDhUeWymYE1hhBW4UyEkMQ6S2oY9U9LgXWFrE4uWb3uPGwZ1fcnoVuXx
 ZvsB+XAVlXptIcjsEztlXiof61IcJ1Nq8/L3ZmxkMftkR4IJILJn6f/rk+Gjc0O+E/VRE
 4qVHV7RVN5MIJQwCF9E+OVmKFm3JrWoah51YaY8ucjcE9Kc85Rg6qxFCPkH8lO3pJ5f7w
 ZW7Au/NhjTQimvJj7h3FEPjzMUsH4wFokLooWk7jmnIE4jPKblJ8HpeFD/hrj3JVldQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25C7F40AC9
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA28D98385; Thu, 24 Sep 2026 18:55:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:06:33 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8b348cd4a744e1d168a2a627053bf25c380154b6
X-Git-Newrev: df1e103aadc7e5eb1c544358ee09f181e5fba20a
X-Patchwork-Hint: ignore
Message-Id: <20260924185532.BA28D98385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libest: bump
 version to r3.2.0-9-ga464ba8a6
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
Content-Type: multipart/mixed; boundary="===============8030410507117221598=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8030410507117221598==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/df1e103aadc7e5eb1c544358ee09f181e5fba20a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The only commit in this bump
https://github.com/cisco/libest/commits/main/
is patch 0005 which was removed.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 26122fd02e013f9470c5fb97bf964cf2540fb203)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ..._locl.h-add-missing-extern-on-e_ctx_ssl_e.patch | 42 ----------------------
 package/libest/libest.hash                         |  2 +-
 package/libest/libest.mk                           |  2 +-
 3 files changed, 2 insertions(+), 44 deletions(-)

diff --git a/package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch b/package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
deleted file mode 100644
index ba0ecb4a86..0000000000
--- a/package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 32fe99fa403d2f51931615745a64f8aede1ca46f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 8 Jan 2022 13:38:17 +0100
-Subject: [PATCH] src/est/est_locl.h: add missing extern on
- e_ctx_ssl_exdata_index
-
-Without this extern, the variable gets re-declared in each compilation
-unit including est_locl.h, causing gcc >= 10 to complain with:
-
-/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_client.o:(.data+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
-/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_server.o:(.bss+0xc): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
-/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_server_http.o:(.bss+0x3b8): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
-/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_proxy.o:(.bss+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
-/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_client_http.o:(.bss+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
-/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_ossl_util.o:(.bss+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
-/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_client_proxy.o:(.bss+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
-/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_enhcd_cert_auth.o:(.bss+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
-/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_server_coap.o:(.bss+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
-collect2: error: ld returned 1 exit status
-
-Upstream: https://github.com/cisco/libest/pull/107
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/est/est_locl.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/est/est_locl.h b/src/est/est_locl.h
-index 62dcbea..b16f62d 100644
---- a/src/est/est_locl.h
-+++ b/src/est/est_locl.h
-@@ -590,7 +590,7 @@ typedef struct est_oid_list {
- /*
-  * Index used to link the EST Ctx into the SSL structures
-  */
--int e_ctx_ssl_exdata_index;
-+extern int e_ctx_ssl_exdata_index;
- 
- LIBEST_TEST_API void est_log (EST_LOG_LEVEL lvl, char *format, ...);
- LIBEST_TEST_API void est_log_backtrace (void);
--- 
-2.33.1
-
diff --git a/package/libest/libest.hash b/package/libest/libest.hash
index dc9bc05255..2c2804a76f 100644
--- a/package/libest/libest.hash
+++ b/package/libest/libest.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  83983ac05137fd73586ddcb4874e30689fe694ee9a329797b60b3defc9a87327  libest-f8a6e5b53a5f70e72fe4029981df0693b17cbb32.tar.gz
+sha256  2e5c46610f6a3c12c1916c8a84de77421a88c9722e776e862a716f4a48220f2a  libest-r3.2.0-9-ga464ba8a66717419ba71d289ef82c7b2315b2006.tar.gz
 sha256  fbdb055f98babf8d86095d6f9b9e34d2ff21a8212e442b8f18bdcb403e44366c  LICENSE
diff --git a/package/libest/libest.mk b/package/libest/libest.mk
index 9f3168767d..5f93b2ab32 100644
--- a/package/libest/libest.mk
+++ b/package/libest/libest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEST_VERSION = f8a6e5b53a5f70e72fe4029981df0693b17cbb32
+LIBEST_VERSION = r3.2.0-9-ga464ba8a66717419ba71d289ef82c7b2315b2006
 LIBEST_SITE = $(call github,cisco,libest,$(LIBEST_VERSION))
 # We don't build examples, so we're not affected by the OpenSSL
 # license

--===============8030410507117221598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8030410507117221598==--
