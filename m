Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087C8CEDD85
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 11:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 880AC40242;
	Wed,  9 Oct 2024 11:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyaVAWh0blc7; Wed,  9 Oct 2024 11:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DFB340248
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DFB340248;
	Wed,  9 Oct 2024 11:34:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C4EF1BF263
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 11:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B52880BAC
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 11:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9Ci-w6NVvrg for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 11:34:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.5;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B74C804F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B74C804F8
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B74C804F8
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 11:34:36 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [223.102.84.255])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wD3P01EagZnj3RKAA--.16952S2; 
 Wed, 09 Oct 2024 19:34:30 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 04:34:10 -0700
Message-ID: <20241009113410.5077-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-CM-TRANSID: _____wD3P01EagZnj3RKAA--.16952S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw1kGF48uFWfWw1DXw1UWrg_yoW5CF1xp3
 9xC393tF92qryfJwsaka18Kw1F93ykJa48Crn7Z34UKr47Ary8Gr97tryDGry7WrZY9FyY
 vFnrAF1UCr47Zw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUwIhUUUUU=
X-Originating-IP: [223.102.84.255]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXA1zjWcGKoyTrwABsV
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=C+5Uh
 0THOXbnhz7kD3xefFXxF6wM2Pdz/uY4Lk21F0c=; b=YuJ8KYk5Y/aPd4W8cEVjg
 fXjbf+0dqauW7EBuED39m2tfVB54memfjQsZzdDukcqGD9hcaIj1Sr+ElFNvxVet
 0iw3OBIJtAz/rsTfzOnYhr6uYHjQB183KtQDiXrrtwNI0gtiKn8IBr3pd5ie1Jw0
 zwv3eGYQbUtBZxgI9HUkhU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=YuJ8KYk5
Subject: [Buildroot] [PATCH 1/1] package/gnutls: add patch to fix build
 failure
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch needs to be applied before [1], otherwise it will cause the
following build failure:

  In file included from dlwrap/zstd.c:12:
  dlwrap/zstd.h:11:10: fatal error: zstd.h: No such file or directory
     11 | #include <zstd.h>
        |          ^~~~~~~~
  compilation terminated.

  In file included from dlwrap/brotlienc.c:12:
  dlwrap/brotlienc.h:11:10: fatal error: brotli/encode.h: No such file or directory
     11 | #include <brotli/encode.h>
        |          ^~~~~~~~~~~~~~~~~
  compilation terminated.

  In file included from dlwrap/brotlidec.c:12:
  dlwrap/brotlidec.h:11:10: fatal error: brotli/decode.h: No such file or directory
     11 | #include <brotli/decode.h>
        |          ^~~~~~~~~~~~~~~~~
  compilation terminated.

[1]: https://patchwork.ozlabs.org/project/buildroot/patch/20240912113855.3983-1-tianyuanhao3@163.com/

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Francois Perrad <francois.perrad@gadz.org>

---

After version 3.8.7, configure.ac made many changes [2] [3], that
indirectly fixed this issue.

[2]: https://github.com/gnutls/gnutls/commit/1a80e038da2bd0dd7948cb7278a28905fb5311a6
[3]: https://github.com/gnutls/gnutls/commit/63b16acfafcff014f227509dac9075348a6d118b
---
 ...TLI_TRUE-and-HAVE_LIBZSTD_TRUE-value.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/gnutls/0001-Fix-HAVE_LIBBROTLI_TRUE-and-HAVE_LIBZSTD_TRUE-value.patch

diff --git a/package/gnutls/0001-Fix-HAVE_LIBBROTLI_TRUE-and-HAVE_LIBZSTD_TRUE-value.patch b/package/gnutls/0001-Fix-HAVE_LIBBROTLI_TRUE-and-HAVE_LIBZSTD_TRUE-value.patch
new file mode 100644
index 0000000000..b389e387e4
--- /dev/null
+++ b/package/gnutls/0001-Fix-HAVE_LIBBROTLI_TRUE-and-HAVE_LIBZSTD_TRUE-value.patch
@@ -0,0 +1,32 @@
+Fix HAVE_LIBBROTLI_TRUE and HAVE_LIBZSTD_TRUE value
+
+"with_libbrotlienc", "with_libbrotlidec" and "with_libzstd" may be
+empty, which is equivalent to "no".
+
+Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
+---
+ configure.ac |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: gnutls-3.8.7/configure.ac
+===================================================================
+--- gnutls-3.8.7.orig/configure.ac
++++ gnutls-3.8.7/configure.ac
+@@ -1158,7 +1158,7 @@ if test x$ac_brotli != xno; then
+ else
+     AC_MSG_RESULT(no)
+ fi
+-AM_CONDITIONAL(HAVE_LIBBROTLI, test "$with_libbrotlienc" != "no" && test "$with_libbrotlidec" != "no")
++AM_CONDITIONAL(HAVE_LIBBROTLI, test "$with_libbrotlienc" = "yes" && test "$with_libbrotlidec" = "yes")
+ 
+ AS_IF([test "$ac_cv_dlopen_soname_works" = yes], [
+     save_CFLAGS=$CFLAGS
+@@ -1203,7 +1203,7 @@ if test x$ac_zstd != xno; then
+ else
+     AC_MSG_RESULT(no)
+ fi
+-AM_CONDITIONAL(HAVE_LIBZSTD, test "$with_libzstd" != "no")
++AM_CONDITIONAL(HAVE_LIBZSTD, test "$with_libzstd" = "yes")
+ 
+ AS_IF([test "$ac_cv_dlopen_soname_works" = yes], [
+     save_CFLAGS=$CFLAGS
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
