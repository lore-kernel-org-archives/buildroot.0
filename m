Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFCFC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 21:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AC044088F;
	Sat,  5 Nov 2022 21:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AC044088F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WA5Zyk1y-Qr2; Sat,  5 Nov 2022 21:16:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 395DA4085B;
	Sat,  5 Nov 2022 21:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 395DA4085B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01DAC1BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D105A81DB2
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D105A81DB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-fk7sMffuxd for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 21:16:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B62B281DAB
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B62B281DAB
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 21:16:45 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id a14so11309247wru.5
 for <buildroot@buildroot.org>; Sat, 05 Nov 2022 14:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ls156o8hpHgky/2lX0y7KF+NIeBOwSRBIdzZr9sbGF4=;
 b=ETC4QqhEvUDWGbXHuRHD/d5ONjUuSc+xspa8X3RlTuv8vwyj1DJt884FG6l5RSa4Kb
 EneCYaA0jP5VO1Uc6BJkXaZ9/Dqd0ouV5Yxpy7d2XlN50XJqI1SRCURiets10ZOnPKNA
 0FSYlYd9ZZGu1kzNzAXQTu4BLUfBLZJ9tJhTUpEdrGgaagEQ/WLNGz2hzfFoZXHfNQYq
 AQE6texL7bZiLWGEZ1NxMhg6h20wbva/OHVbtFdNN1jb5i5whchnIkeJT85qRU+cwmLt
 b2DC70leMkJVioZ/fCJmbU8pJfW6Vge+r1PPinaQ5Ey7828w1854REjUCD1yuk5Ja+oA
 M+eA==
X-Gm-Message-State: ACrzQf3kxMcYid6hajL54IHsNV+Jo+1VhrDF/Bi6ivIA9c8F7YbSfrR9
 jffUFKq2omaxR9zPPDMMjkjm+2hj+Yw=
X-Google-Smtp-Source: AMsMyM4NM5qy1K2CEFaEYzHIAnomYnDIxDJP+GWnsK6rEBmgpdG4JklYIoE2G3xiltjYBkUgD6TQWA==
X-Received: by 2002:a5d:6350:0:b0:22e:67bf:8733 with SMTP id
 b16-20020a5d6350000000b0022e67bf8733mr398329wrw.483.1667683003469; 
 Sat, 05 Nov 2022 14:16:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c3b9500b003b4c979e6bcsm7517629wms.10.2022.11.05.14.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 14:16:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Nov 2022 22:16:39 +0100
Message-Id: <20221105211639.349885-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ls156o8hpHgky/2lX0y7KF+NIeBOwSRBIdzZr9sbGF4=;
 b=biIWIndHN7JJ0ZyqQy/lHnBsJX7BMJ8zuJ2JN+Di0JDporKtCXlpNE4Wg/fhpZZuIe
 Bi5bwLmaV0pA4c/8LUH8tlmcwsEfNelBpnAl6v8+Q0J7pqi63n5wgZJWhtUDno68ZsdF
 QpQJDx3OH7itDg0+80Efxl7vIIlOZITFHRV2wIvW8xbDeGQFnlabxNm2kteT9KV4NY0I
 l8Bpdbm5n2oMeeuqUB/8WohHKgn9zee6R5lr6UFGfYmzP0WiQgqkhoRv4z93uYIiiMES
 H9ZiJcj6RcYAWHCvoTB6Z0jiFdXSpqB/SL7z91mw6pW3F/iQV1e/vZIMZEUCKT7HgBL5
 e1pA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=biIWIndH
Subject: [Buildroot] [PATCH 1/1] package/bdwgc: needs MMU
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Pedro Aguilar <paguilar@paguilar.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raise since bump to version 8.2.2 in
commit d7619682552dd34f499e9f17b0234af53da743ec and
https://github.com/ivmai/bdwgc/commit/9d8c196268068bb75f86dee0ba75ccd024531e72:

os_dep.c: In function 'block_unmap_inner':
os_dep.c:2668:17: warning: implicit declaration of function 'madvise'; did you mean 'raise'? [-Wimplicit-function-declaration]
 2668 |             if (madvise(start_addr, len, MADV_DONTNEED) == -1)
      |                 ^~~~~~~
      |                 raise

Fixes:
 - http://autobuild.buildroot.org/results/2b9924cb8c36a75e1ca7aefe83e95dc11c10ded6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bdwgc/Config.in | 1 +
 package/guile/Config.in | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/bdwgc/Config.in b/package/bdwgc/Config.in
index aad2bc9ef2..1124ab0f60 100644
--- a/package/bdwgc/Config.in
+++ b/package/bdwgc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BDWGC
 	bool "bdwgc"
+	depends on BR2_USE_MMU # madvise()
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBATOMIC_OPS
 	help
diff --git a/package/guile/Config.in b/package/guile/Config.in
index f70e674018..3cf0ec863b 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GUILE
 	bool "guile"
+	depends on BR2_USE_MMU # bdwgc
 	depends on !BR2_TOOLCHAIN_USES_MUSL # no strtol_l
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # bdwgc
@@ -17,5 +18,6 @@ config BR2_PACKAGE_GUILE
 	  http://www.gnu.org/software/guile
 
 comment "guile needs a uClibc or glibc toolchain w/ threads, wchar, dynamic library"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
