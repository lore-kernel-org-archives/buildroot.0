Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E64CC0502C
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 11:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1B48408C0;
	Sun, 28 Aug 2022 11:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1B48408C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rh_Z5h4TRhv6; Sun, 28 Aug 2022 11:23:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86B6A408B2;
	Sun, 28 Aug 2022 11:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86B6A408B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF5561BF2A3
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 11:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6013408B2
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 11:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6013408B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GWSgAoy9-sPi for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 11:23:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 619AE40324
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 619AE40324
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 11:23:38 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id n17so6910108wrm.4
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 04:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=KEM+Hv74oEYsRt+cUpY2CPRJ0wS3PWxpsD89NFFcOQw=;
 b=7zsSjnaIFTIh7TpZYoSTo5OjcBHyOirDlGgaG/Kzccr5yQcnDYqDRO1Y/Zg7Xne1gy
 1jJyrexP/qvn0f+Ww8sjdMYGej3gMTB6UQZMGk6tATypXj6rnAHU3ps9YfcBqydX9gy8
 cjgqrfmRdiE3sBBbOxpcMzd673IU8xvT8olqb2XW5VbBzLYYUHsbutva5t2md+70q6bk
 7H9dIKGzdn4PXdD/NwR3gJ4826jK+qp0R4lYoopC7mBwDKY6djlParo4QZIk3P2NM8c9
 XhlvIxNXzL1kEo0IuB5tMwsHKgGyGTTq1MoDIeiQkb35E7WmoV3pQKYBElV+lUVLWihW
 5+xA==
X-Gm-Message-State: ACgBeo0BdsBkj3hPAT+GVuz7m2Yq0zNbMrhOQ+w3kqQKcKSrIMp6nDEz
 hyUgcpf2MPJXamUingCycpyKAuVZg6U=
X-Google-Smtp-Source: AA6agR6nbfkI52Auo6SgPeK/jBdWCWCE5hWpCy3Tnq/i9vJPoaP+4LGmrAyTx7lwlePEmoJWeqQSBw==
X-Received: by 2002:a05:6000:1448:b0:225:63f2:2421 with SMTP id
 v8-20020a056000144800b0022563f22421mr3724174wrx.527.1661685816163; 
 Sun, 28 Aug 2022 04:23:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c088700b003a5260b8392sm5721074wmp.23.2022.08.28.04.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 04:23:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 13:23:30 +0200
Message-Id: <20220828112330.12852-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=KEM+Hv74oEYsRt+cUpY2CPRJ0wS3PWxpsD89NFFcOQw=;
 b=Uz9x9y+M86I7d0eaNiDEarMczJ6xUTBU0KajEBsOFvuzIKFyUAyNdMDbdnIZeQoSyk
 ruve8ATCv1r2DkIG6+e1dZTESwCFFLDopF1SWEd8W8IEvDvQehNtJ88j7jGj2k1ehC1j
 fQkZdcGTTWUP4djsfhley4aYoqs80IpqIRPjlmhjc7Q9DOJCeGL/+I8GQnYKit+lURXU
 CiW51sF5q+UpiyMCiQJwymIAt8HymgWvwIM2El2TxRwIDkm024DbGuqUw1jJ1On1OEn5
 9kDrNnyPh2e/+tThGIomtoMipxS++KXnpm7uU5CCHFldH2wM/YfCWVf62pd2+/LnwpHE
 0osQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Uz9x9y+M
Subject: [Buildroot] [PATCH/next 1/1] package/memcached: bump to version
 1.6.17
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

- Refresh second patch
- openssl is an optional dependency since version 1.5.13 and
  https://github.com/memcached/memcached/commit/ee1cfe3bf9384d1a93545fc942e25bed6437d910
  which can be found through pkg-config since version 1.6.17 and
  https://github.com/memcached/memcached/commit/656dedad48c81541060448d008b90290196263c5

https://github.com/memcached/memcached/wiki/ReleaseNotes1617

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/memcached/0002-check-for-sys-auxv.h.patch | 8 ++++----
 package/memcached/memcached.hash                  | 6 +++---
 package/memcached/memcached.mk                    | 9 ++++++++-
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/package/memcached/0002-check-for-sys-auxv.h.patch b/package/memcached/0002-check-for-sys-auxv.h.patch
index 8c41bb4f01..ff6d84527c 100644
--- a/package/memcached/0002-check-for-sys-auxv.h.patch
+++ b/package/memcached/0002-check-for-sys-auxv.h.patch
@@ -40,11 +40,11 @@ index 26df879..05e61ff 100644
      }
  }
  
--#elif defined(__aarch64__) && defined(__linux__)
-+#elif defined(__aarch64__) && defined(__linux__) && defined(HAVE_SYS_AUX_H)
+-#elif defined(__aarch64__) && (defined(__linux__) || defined(__APPLE__))
++#elif defined(__aarch64__) && ((defined(__linux__) && defined(HAVE_SYS_AUX_H))|| defined(__APPLE__))
+ #if defined(__linux__)
  #include <sys/auxv.h>
- 
- #if defined(HWCAP_CRC32)
+ #elif defined(__APPLE__)
 -- 
 2.35.1
 
diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 3bdd1e5e33..78875dde66 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.6.16.tar.gz.sha1
-sha1  724f31c3462fb6b07264d72d0043fd65545fd84a  memcached-1.6.16.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.17.tar.gz.sha1
+sha1  e25639473e15f1bd9516b915fb7e03ab8209030f  memcached-1.6.17.tar.gz
 
 # Locally computed
-sha256  3051a93bf1dd0c3af2d0e589ff6ef6511f876385a35b18e9ff8741e4a1ab34da  memcached-1.6.16.tar.gz
+sha256  2055e373613d8fc21529aff9f0adce3e23b9ce01ba0478d30e7941d9f2bd1224  memcached-1.6.17.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index bddb713458..dbd59d91e6 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.16
+MEMCACHED_VERSION = 1.6.17
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
@@ -22,4 +22,11 @@ else
 MEMCACHED_CONF_ENV += ac_cv_c_endian=little
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MEMCACHED_CONF_OPTS += --enable-tls
+MEMCACHED_DEPENDENCIES += host-pkgconf openssl
+else
+MEMCACHED_CONF_OPTS += --disable-tls
+endif
+
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
