Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE2AC9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35FD3813F2;
	Thu, 24 Sep 2026 18:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LkH77-5J71gu; Thu, 24 Sep 2026 18:59:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 11A5E813E7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276342;
	b=LDi00ztQ0888wQHnplotgSAZndyD1+0S8tmQ8eOq+V1IDFm0Dge3RX7ZPSkxZb/yiqf5
	 ApwycZBNpFj248I1xdsy3cJqm5AhuL04oC4za75Ml1N+jVULAEQiL0xOgXWEgEvvM+Bal
	 uzMrOQoqDIvbCqqKB7FUUadC08lp5U2K2uUdb/9LBa8deeFxdGr7s8d5x6q2VQwYueNfz
	 QMx1JytyuQ4gNpD8ULTKFMIaQNHpyUjw6pMiOBlGD6L/U4VlUZQkBFkLikKG64Dy2bvw7
	 7NebBSrvm31cwbp+fbO0+/Ffk7XPPRALpOEa+NvyiIYoRgMaYx8z0dEDp/wD1XolU0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276342;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=oDkPYEmH/qzwD5YX97MbzEWZXGQp3MIKK1U2xt34Xbw=;
	b=aLH0DJu3sqFgGebqZK7Kd5rTemLqQcd/ybHZkYncxoOuIQIYRF0ohatn9xwWI2ZYfwE7
	 L2FrAEekr0Tc+IQmD1zB39VLD2atz+hFI1NFSSnxXbItim+aj4CZxHOGz6m1syZNaTk9K
	 KDmO0G5c9nnT2mXIwaWoQN0wUwkRmHu1ExCdVXNyuSBk+WEKXZ4YBias/VI4r3LGw3Qrg
	 HnuJJLwywShu2SqZLyePNzY9sGOoe2QSuS0MbVtM0Dl0vL/uW3gj3f6KgR4E/kOjvQzA8
	 8NAOThdZ4d+9DfxUViDXGjvwXsd8CILqqpq3RWRdH2OxOJiFscLFQZm4UQwm3TdH+Vw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276342;
	bh=oDkPYEmH/qzwD5YX97MbzEWZXGQp3MIKK1U2xt34Xbw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U+9NlRUDWSdT6V4MvYA1pQWcuQBBTGu+0qM2LW6c42AgZHjJiDHf5d6EOX7YHlpiX
	 8WQm5A59DrSAfiePRObwwFLumyidMuE71nfgtDNkPH+K3RxmOEhhHhiJtbWLg+/4gD
	 VuYTutRhXVO31FjCZGa2B0sVVsbXeyMMz8IiLTWz4pRqXKGmhDPVvQG0KDimZzyU6z
	 NgwLg+LZyGAAWCyU4ZJInOrcrBiHWJU/jdmZ1rHBqwsycOeY5ZFfyFIV4sQlYJtbeo
	 SIhuFhRWUEmE/UfIWq3wlW1N8Ry1bGLQ2NKaPY4eM8IQc+ScPgI3OOYdkBRESP5UGl
	 il10Qj9NE4+dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11A5E813E7;
	Thu, 24 Sep 2026 18:59:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BAE503B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC0E4404D2
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbcHGYsfGqvL for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org BA8964017A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276211;
 b=DQaR1kAoni1ScjvBDayWsZWg+kPbrJpAsMTGU9iKryhiV0N4b99dYqpxO8zNgPhQuLC0
 2dAsjKDd8S8Xm5sSm6ykLJTXsBUkSxWzeUI/PQdrUuKZi7gVtiynta3suY9OKC1JOf6cB
 vY3R80EPPamUPf/v3yI/v+W8OEeOJ6HMf6oJH/mPuNpYn4gQzf2ZaXZ2nuoTAuMMIjAHl
 DHFlspn+ISCBmS/au5zBU/x1Kal0bQaiwknlD6CmW8nI7QWNg8r64g53O10w0NOX3tYNW
 Ybe0OWh47C9B7Z9MkRvNPU82zYStjLS13g78ecZszgSKZDaWmv2g9to7Rw0+hlbDsRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276211;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=joOjd6WvXA3AB1Cw1g6OxvB6Gd9izuHf2tkQNohK2sk=;
 b=qS85FG+lzbtm58WwMQ+TVppht3T/NLz9ovn4pwNELKSjSLNjQ1FZFVhgF7qA6sCpPLCl
 zf6BD6NnrbXwpOOZ3XVxe09osuy84jTupjJZyfysCPghhg15iUqy+CxWk56Q1yq7vhTzo
 Lzg6df6HTZzms+E11H3bPpX5DwHDEo/34bZ0XqoBCioSbm9qUW9mVOrTePLh5ZAsgKrWU
 dPGfvCCQjo0KYg6JlklVJZ5XEW/FtoXK/PSer2GZMWyzzj0pjqvBuuQ9qcl5r9MmWXGav
 7z7cpkDR2oDk3mKLKHS51p2JRAGQoESoYFofJbw0ZB8csblLD/QjLnwVhZ/IvQcoRbA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA8964017A
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DE0A98372; Thu, 24 Sep 2026 18:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:06:35 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 9149362ba8c8bbfdf8e7987c6b869a83d459e3d7
X-Git-Newrev: 0d7171fffd9cae4bfb70bee72cbf2fd0258533f9
X-Patchwork-Hint: ignore
Message-Id: <20260924185541.5DE0A98372@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libest: bump
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
Content-Type: multipart/mixed; boundary="===============5690185642016783271=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5690185642016783271==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0d7171fffd9cae4bfb70bee72cbf2fd0258533f9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============5690185642016783271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5690185642016783271==--
