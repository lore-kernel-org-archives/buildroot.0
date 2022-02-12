Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02E7C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 22:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C8E6400AB;
	Sat, 12 Feb 2022 22:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qcNNwgWTX0xl; Sat, 12 Feb 2022 22:19:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34FCC400C9;
	Sat, 12 Feb 2022 22:19:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E1B81BF3AF
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B6FD400AB
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P5YBoEK0l2SJ for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 22:19:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86D7040022
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 22:19:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B099082518; Sat, 12 Feb 2022 22:11:37 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 23:18:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6e2920c94baa70fb78af57b7cc6afcbf621c4d0
X-Git-Newrev: 5050f07fdfbd6b7cb4447745b4eb18606692dbf7
X-Patchwork-Hint: ignore
Message-Id: <20220212221137.B099082518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/guile: Fix build failure due to
 missing libiconv
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

commit: https://git.buildroot.net/buildroot/commit/?id=5050f07fdfbd6b7cb4447745b4eb18606692dbf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building package guile with BR2_ENABLE_LOCALE=n
we get the following error:

```
In file included from filesys.c:95:
ports-internal.h:26:10: fatal error: iconv.h: No such file or directory
   26 | #include <iconv.h>
      |          ^~~~~~~~~
compilation terminated.
```

So let's fix it by selecting BR2_PACKAGE_LIBICONV and
adding libiconv package as dependency.

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/guile/Config.in | 1 +
 package/guile/guile.mk  | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/guile/Config.in b/package/guile/Config.in
index b1182a4cee..f70e674018 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_GUILE
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_BDWGC
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Guile is an interpreter and compiler for the Scheme
 	  programming language, a clean and elegant dialect of Lisp.
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 0f245fca76..03420407f8 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -18,6 +18,10 @@ GUILE_CPE_ID_VENDOR = gnu
 GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf
 HOST_GUILE_DEPENDENCIES = host-libunistring host-libffi host-gmp host-bdwgc host-flex host-pkgconf host-gettext
 
+ifeq ($(BR2_ENABLE_LOCALE),)
+GUILE_DEPENDENCIES += libiconv
+endif
+
 # The HAVE_GC* CFLAGS specify that we will use internal callbacks
 # instead of the ones provided by
 # bdwgc. Eg. HAVE_GC_SET_FINALIZER_NOTIFIER specifies that we won't
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
