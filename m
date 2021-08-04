Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C925C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:23:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 057676023B
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 057676023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAAD8401AE;
	Wed,  4 Aug 2021 17:23:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FRxac3ltX48L; Wed,  4 Aug 2021 17:23:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B19A40239;
	Wed,  4 Aug 2021 17:23:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2F521BF41B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A32C40641
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:23:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DngYILyCqqOA for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 17:23:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 825AF40633
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 17:23:10 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id l18so3085315wrv.5
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 10:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RuF95r1jl62MZfmmhB6lUYJ72a7lgScWCugmHIFrasc=;
 b=nglHBri0fMojKc5gLEHJkJz6z1dg7GKvnLO5maboZhpndtl4MTo6QkLyZ56pf/7jLD
 qpaOs+OiCW0HnF9Mij6s9rV6EzOfZasYKP+axx6+/oJGDExye49wt4+L272280xw6bdi
 IksSX8XfGNzOtUV+BCwFLTSQ2gx9fKbOGh4oFiUHo8lVquk9eK/U41+LgNoNeriyUzv9
 jYv5J8WdFTNEFB83P+XgEtIC2wcaTdErKFIsFJeOE35ak/oM7dkWWszkBYoUvwVyS+GP
 bJOOT7cjDMKI+RzzXR/QBq8LbrmeaRulv78u0wOQqoj1wgg+vGQqypgAvq//sB3sHR5x
 kbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RuF95r1jl62MZfmmhB6lUYJ72a7lgScWCugmHIFrasc=;
 b=cwIaXpJ5gFGtN8SAJocKMAfrIFmfwp1E1B5VKU9aKdmqBQ/rnc3cdGrhloEetcYWv+
 dlOHS4eSn9ymbNHtz3HglgYjTeudF7YYRZLZZhDBVBSF5dopTuBG7cF7LIsMJu8Nfo2i
 bDSsZVNQRk46Pg25y5V0nPO168yvc61IhZCGMJCe4KBJpReF4mn8znhwy2HPqkrDfPjO
 xf6Hhdm+YLj7J+S1kdKDHvDG8qxU4apkT+Nil1+0jMuCOsD8dUKuUZfBLdxgUxyCxp+d
 8FC3xKSViJrMqbax1Uq0Wip3vYfdEwczwRJpU+vyW6GBqY8d0bEWOwa+tgnSuSNcOFAO
 QL8w==
X-Gm-Message-State: AOAM532+sGgqwLs2LPoMlRxpt0Rc9JuwW5YbZ3ZzDpq2NxsPgeRQ/cUm
 ue9MsPqil1fvMB8sayWOq0jy0cMnnVTKwaRt
X-Google-Smtp-Source: ABdhPJyvj7Ibq/ZtRC0MduMD3pBhe8ryI2pCzfi9U8svfOG28V/VyWClRlYmF73Mc7abLonI/8BURg==
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr480133wrr.92.1628097788665;
 Wed, 04 Aug 2021 10:23:08 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id n8sm6119279wms.11.2021.08.04.10.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 10:23:07 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 19:22:59 +0200
Message-Id: <20210804172259.9143-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [RFC][PATCH 1/1] package/glibc: bump version to
 2.34-5-g9995d0588f4f9adc68419224d2b3698e2ca4f77e
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Also upgrade to on RISC-V (that could have been done in d5ce3b5db5)

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

I tested it with building pc_x86_64_efi_defconfig, adding nfs-utils,
ltp-testsuite and few other tools. Not sure if this is enough for
testing.

Kind regards,
Petr

 .../glibc.hash                                            | 7 -------
 .../glibc.hash                                            | 2 +-
 package/glibc/glibc.mk                                    | 8 +-------
 3 files changed, 2 insertions(+), 15 deletions(-)
 delete mode 100644 package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash
 rename package/glibc/{2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f => 2.34-5-g9995d0588f4f9adc68419224d2b3698e2ca4f77e}/glibc.hash (70%)

diff --git a/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash b/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash
deleted file mode 100644
index 558591522e..0000000000
--- a/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# Locally calculated (fetched from Github)
-sha256 c3828224d69a42f5b6982cbec8ae01cf494fe975ce9023e36ff2c10a2fb93e42 glibc-2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99.tar.gz
-
-# Hashes for license files
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  b33d0bd9f685b46853548814893a6135e74430d12f6d94ab3eba42fc591f83bc  LICENSES
diff --git a/package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash b/package/glibc/2.34-5-g9995d0588f4f9adc68419224d2b3698e2ca4f77e/glibc.hash
similarity index 70%
rename from package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash
rename to package/glibc/2.34-5-g9995d0588f4f9adc68419224d2b3698e2ca4f77e/glibc.hash
index 4b8d8297ec..8b5aacb535 100644
--- a/package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash
+++ b/package/glibc/2.34-5-g9995d0588f4f9adc68419224d2b3698e2ca4f77e/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  3e2004b16ec6b79a19a88ed4736719ef9e419f9d8e7013faced654c0339e23dc  glibc-2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f.tar.gz
+sha256  77af51b251591d013ad4634863a42ac8ce62f4b2c7c29cba38a2ad5098d2727f  glibc-2.34-5-g9995d0588f4f9adc68419224d2b3698e2ca4f77e.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 1c8c409878..320848bd01 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -11,13 +11,7 @@ else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-ifeq ($(BR2_RISCV_32),y)
-# RISC-V 32-bit (RV32) requires glibc 2.33 or newer
-# Until 2.33 is released, just use master
-GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
-else
-GLIBC_VERSION = 2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f
-endif
+GLIBC_VERSION = 2.34-5-g9995d0588f4f9adc68419224d2b3698e2ca4f77e
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
