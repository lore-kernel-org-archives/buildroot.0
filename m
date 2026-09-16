Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7B5C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6F51607E2;
	Wed, 16 Sep 2026 20:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NX95D1liG4Bg; Wed, 16 Sep 2026 20:08:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 61D156069D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789589296;
	b=n0nV3zFyoGVrfrYBvcr7BUh9wR8R6w2m/mXAzPXfUfRfXuZtz9KviJ/IUhoe8zlDW2zo
	 Our7Y8XsSSE8gHQc/Daw+u1+m2+6FOE1pDy/t54MSqILWCl3KcHtlu6LhhqyL9Kq3EC84
	 FW406wknGB1QH33/JY4xtwG191l5xcAsIfglqhpMZGSD8ghY1lGHZc29oUc3nwHCUkhzc
	 8+0nnlRfvXVmTEtuMkPqSkg0sTG8oE6U8Kt6cR4gd88aY4ITwx+AZAKYOpZXw2Jy1Wh8x
	 hMKngsQR8WR3IB6+BX/3PlSGS33lh0s6owxLmBb9SkAErl6bDq3uH1e6sFgbRBSG73A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789589296;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=j/bTMw8RWFSr6xr1nzHv5oYxi15ZZXoB2EWIPmA5Pn8=;
	b=PdMACx9iOMlYWit3JR3k8bXz2XsZKI6lu8XnXFAdf3eC15tpXeqPE7n4ovO5hsO1/B8h
	 m5fLGd+40MrjYAPpZAaxRTBGMdCTk5lcg616MPvbNZxNOItnBqdhfn88Oo93cUVqcv1ig
	 QQQBajuBsOPfkEF+KY0jzyxyfnfUGpK1Jb7r28j+VX92bZGEsPbTHxfe7fU80bdCsqmIC
	 iB4JtQyTxM8LWu9kypkdJ9MzJYi+BU2Ux7U3sqQRb7phE56I3yKwuJrtcSVfSCh76Fo0l
	 JQPeS7CZyxvw5wh9bqWrSikHc/X/o0PAjld73AV7zBaOuErXvte2McjunCBD8jRqnng==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789589296;
	bh=j/bTMw8RWFSr6xr1nzHv5oYxi15ZZXoB2EWIPmA5Pn8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H972RNZxDkAfbRGLdq0jgMJZP5a/lL8yT1Iikng/qpG6IcHDR0soL78DxFU41dxcA
	 CZQ8XPNiu7AuQx0WZO/uKmBxKvpK6W179dnYyfRnE3SPkuK48XtoHjd6BkwuvnDzBs
	 IkZ0HlkOviUpc6idLyLr76ecPy4KAxeY+93suQ/AAx+jcTxctB9YzYT8nE2jF2k4z+
	 9rFpxP64bOiesDvOeK/eyg+67i0tK0LdeyPe/R2NKBfh49RCz24JLcfnV4UTnWTd2U
	 +I8YEwBvfD5hA6fnCNIQt6rNtnbvuTqtV/JKnsniTuRdyx4Fsk38mahkuF/oyEyRzA
	 9bbhOWX84ORPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61D156069D;
	Wed, 16 Sep 2026 20:08:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60B679C2
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E05A404DC
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PhJBM-V6ENk5 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:08:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6865F4048A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789589291;
 b=NqZIGUaF0En/NCUXBYPL3FuNJ6hOjwSItutTAqKU58sLkoYZ/6hWF+mEEWLGk4qHHsNs
 Sn3lkFW15RyixDKwta8zoy6ciQoQJXltxq2EFqxnssiMNMpGbBEE5EhZeXTDjPwahB39u
 aEb/1/ucgbIRunb0+8rnB+R/W6lxQxDk1eoWpZU1vfp76OPi0/DjEJEPokmCdHX+vSE99
 dIpSJv31gZMQJXu/skwDHVN3rIWaLwoU3C1fkGL3pjmydK7ppz8+Mgv/l5Nn9osJv774i
 kULivKHE0Gh0kcM175XWAa3MOBLpDl1dErY1Gwmx098fhkEiahaO8Q84KfJUZWFZv3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789589291;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SVROYkF3GSD/7rOeJ3RyQDbcqHVu6YCL2gb/yJVEBIQ=;
 b=rIrBnNBCKzP0ww6728teBjx0Tlc1uXpGH7KiVg5IppWTxzLU1K1SlnD2e0NeZn8cfEZn
 2u7qY70GGRZY++DvIs51t+IQlvQhxwDW7KYwP/NZnMOey4poA7QB6GVoc/nFxxytEhhYn
 8DIMuHp5rcOWIMFOzlFs+LMfSbZm0vD6WLOgjnMZ9qAx+zb1gBhhpwsMKZ/BdjrOwhkE+
 E8AiZG//mvpK2g1OH3odYl2+8Tgvpl6YBuzx581I564l1VWGtlMvdJHepTH/WyzvPIYXC
 3oO8Do5fHBmRUyW8wvasfdONOCQrWl0orf4bFzVVyvRd7U3zD1NZQ5onCS8h2YaeegA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6865F4048A
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:08:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEE4496A92; Wed, 16 Sep 2026 20:07:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 21:48:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e1e3b5e09dfed6909e9de870ffb277862ca5110
X-Git-Newrev: 26122fd02e013f9470c5fb97bf964cf2540fb203
X-Patchwork-Hint: ignore
Message-Id: <20260916200704.DEE4496A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libest: bump version to
 r3.2.0-9-ga464ba8a6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/26122fd02e013f9470c5fb97bf964cf2540fb203
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The only commit in this bump
https://github.com/cisco/libest/commits/main/
is patch 0005 which was removed.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
