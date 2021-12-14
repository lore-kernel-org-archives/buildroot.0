Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9FEC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 23:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D740640179;
	Tue, 14 Dec 2021 23:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6NYYQN-Mw_fo; Tue, 14 Dec 2021 23:00:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7ECC401DD;
	Tue, 14 Dec 2021 23:00:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C37281BF681
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 23:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2150409BA
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 23:00:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UX0N_jV4UoIi for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 23:00:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD2D3409B2
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 23:00:25 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u17so35022652wrt.3
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 15:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YpXikl9I9i4ycdTT3ikk+RmkrQZmRz8syYNj2D7XLJM=;
 b=aZ+Q+yLknYjA8TNAwHD+NnPma+e3gV9fLMIS3B6giBMVx29MJxUY9SGgh8+JUEn85h
 Y9r1lb81kiRi8Tqg1INYdvAAvMwr3VtO71sGDsJpPc2L9VNa7Qnf1zA7tvTM7XAjIA6J
 zry2c8ZRuuH1Q7uTxoo/KSHYYjqURYbdoWWLz4EhggmZhRoatQAEvCSNWyeQAw6mpleg
 GccpOpYHh/Y9DXZDhWxfYRP7YNLnvM6STlTckRcO1dE8PXdXMPCpWrWZ9Q+LNm11BKft
 ANHtMxo3zdGUzdTuBCtDjhRbkrbBx4cFkFziBO+1pgLTQKzLFyjwq+lmKVOarknPaMeJ
 xW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YpXikl9I9i4ycdTT3ikk+RmkrQZmRz8syYNj2D7XLJM=;
 b=fDOZ0j+6jn+NZP/x5lcO3Yiti1WgSFkRYAAtTRGIYv+jyiW848aTdmZBpU5EBQuXc6
 wtDOoK9EE41++h5ErnwxFa8FnQKlpUcfOzjxJP9Xs+ax3QA7XFjhgyzUoySl9ovDklfU
 3zKUx/VuXaEyWl/16WWJDAYeXKG0IcR8fIfW6It8s5aTTojozUk2PfV8XPrW1JyluOF9
 25BkK3jGm6qM5V0KH5JPDABPY4RCKI/cmwsAGqPCCQxjP+9y2geqlOfkqfccpktVD+va
 XjWO2jqLogYqcC+am0C8mEwHmqgG6BGobmKF9km9E3B1WSQro7M5O6rhyU9Rlhltv+Yn
 RknQ==
X-Gm-Message-State: AOAM533EomE6jL3cqgqDWVUPVPsa11T2jrproirBNW2IPWg2pADjyK0H
 4ADmQjo2MtlKYnC6ZMKDK7TiEWb+t/UBvA==
X-Google-Smtp-Source: ABdhPJw1mT0n684KX8TcqUw+wNmVWTlTj5VynS+d/pLgxuxx22LwRf2LijPk0m46iptgYRVmnj+l1Q==
X-Received: by 2002:adf:9d83:: with SMTP id p3mr1746864wre.711.1639522823772; 
 Tue, 14 Dec 2021 15:00:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id bg12sm191786wmb.5.2021.12.14.15.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 15:00:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 23:59:58 +0100
Message-Id: <20211214225958.3253335-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/guile: bump to version 3.0.7
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libtool is not a dependency since version 3.0.6 and
https://git.savannah.gnu.org/cgit/guile.git/commit/?id=2e26538d6a51bdd6c2e68ad4539ab3750ef8670a

https://git.savannah.gnu.org/cgit/guile.git/tree/NEWS?h=v3.0.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/guile/Config.in  | 1 -
 package/guile/guile.hash | 2 +-
 package/guile/guile.mk   | 5 ++---
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/guile/Config.in b/package/guile/Config.in
index c26c296e47..b1182a4cee 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_GUILE
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_BDWGC
-	select BR2_PACKAGE_LIBTOOL
 	help
 	  Guile is an interpreter and compiler for the Scheme
 	  programming language, a clean and elegant dialect of Lisp.
diff --git a/package/guile/guile.hash b/package/guile/guile.hash
index a163f59fce..c2719fa7f2 100644
--- a/package/guile/guile.hash
+++ b/package/guile/guile.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  6b7947dc2e3d115983846a268b8f5753c12fd5547e42fbf2b97d75a3b79f0d31  guile-3.0.4.tar.xz
+sha256  f57d86c70620271bfceb7a9be0c81744a033f08adc7ceba832c9917ab3e691b7  guile-3.0.7.tar.xz
 # Locally computed
 sha256  b51c6f20e6d029cb5b3e5bf235ac562c9a188c5bdc4ffcdc663897772d6e0260  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index b62d06e704..c74325252f 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GUILE_VERSION = 3.0.4
+GUILE_VERSION = 3.0.7
 GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
 GUILE_SITE = $(BR2_GNU_MIRROR)/guile
 GUILE_INSTALL_STAGING = YES
@@ -15,8 +15,7 @@ GUILE_LICENSE = LGPL-3.0+
 GUILE_LICENSE_FILES = LICENSE COPYING COPYING.LESSER
 GUILE_CPE_ID_VENDOR = gnu
 
-# libtool dependency is needed because guile uses libltdl
-GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf libtool
+GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf
 HOST_GUILE_DEPENDENCIES = host-libunistring host-libffi host-gmp host-bdwgc host-flex host-pkgconf host-gettext
 
 # The HAVE_GC* CFLAGS specify that we will use internal callbacks
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
