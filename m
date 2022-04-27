Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0645FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8BC960C18;
	Wed, 27 Apr 2022 19:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 062sy4Aq0ySE; Wed, 27 Apr 2022 19:41:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFBC060A75;
	Wed, 27 Apr 2022 19:41:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 724D11BF9B6
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AF1760C18
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pxrpk1XSSbtd for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:41:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD3B4607AA
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:41:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F1BAC84604; Wed, 27 Apr 2022 19:30:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 21:03:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6063f2378f8fbab296b7aa56cdc8a774e599708b
X-Git-Newrev: e01f3fc602e25ae5f336137b91eda9b05a6802ff
X-Patchwork-Hint: ignore
Message-Id: <20220427193052.F1BAC84604@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libevent: fix build with libressl
 >= 3.5.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e01f3fc602e25ae5f336137b91eda9b05a6802ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

In file included from bufferevent_openssl.c:68:
bufferevent_openssl.c: In function 'bio_bufferevent_free':
openssl-compat.h:44:28: error: invalid use of incomplete typedef 'BIO' {aka 'struct bio_st'}
   44 | #define BIO_get_init(b) (b)->init
      |                            ^~
bufferevent_openssl.c:124:7: note: in expansion of macro 'BIO_get_init'
  124 |   if (BIO_get_init(b) && BIO_get_data(b))
      |       ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/273f9aa354a08ef3af6140b8dec086408bf5d574

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...on-t-define-BIO_get_init-for-LibreSSL-3-5.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/libevent/0001-Don-t-define-BIO_get_init-for-LibreSSL-3-5.patch b/package/libevent/0001-Don-t-define-BIO_get_init-for-LibreSSL-3-5.patch
new file mode 100644
index 0000000000..33c349b11d
--- /dev/null
+++ b/package/libevent/0001-Don-t-define-BIO_get_init-for-LibreSSL-3-5.patch
@@ -0,0 +1,29 @@
+From 883630f76cbf512003b81de25cd96cb75c6cf0f9 Mon Sep 17 00:00:00 2001
+From: Theo Buehler <tb@openbsd.org>
+Date: Sun, 21 Nov 2021 21:38:20 +0100
+Subject: [PATCH] Don't define BIO_get_init() for LibreSSL 3.5+
+
+BIO_get_init() is available in LibreSSL 3.5 and later. The BIO type
+will become opaque, so the existing macro will break the build.
+
+[Retrieved from:
+https://github.com/libevent/libevent/commit/883630f76cbf512003b81de25cd96cb75c6cf0f9]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ openssl-compat.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/openssl-compat.h b/openssl-compat.h
+index a23e34251b..f5de25539f 100644
+--- a/openssl-compat.h
++++ b/openssl-compat.h
+@@ -40,7 +40,8 @@ static inline BIO_METHOD *BIO_meth_new(int type, const char *name)
+ #endif /* (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
+ 	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x20700000L) */
+ 
+-#if defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x20700000L
++#if defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x20700000L && \
++	LIBRESSL_VERSION_NUMBER < 0x30500000L
+ #define BIO_get_init(b) (b)->init
+ #endif
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
