Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B43C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 10:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E832607C1;
	Sat, 13 Jan 2024 10:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E832607C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M4L3HKK7VQQO; Sat, 13 Jan 2024 10:07:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83D23607BC;
	Sat, 13 Jan 2024 10:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83D23607BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90EC51BF397
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 10:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 697E884B8B
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 10:07:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 697E884B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ohIU8l7s3TIJ for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 10:07:02 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D76584B88
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 10:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D76584B88
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e6d6274f3so2568805e9.0
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 02:07:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705140419; x=1705745219;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RcrX//0+A4ej3S90EFkHaxjgnj4xIfww4N+w0hFF3pg=;
 b=rxuoSZoYdu5Opy6XVDr0RomSv8UK4qjgYfF18ZQzTa6XDly/SW26n/kUOgO6NTWy7O
 Jf+6clgOGCDJ+uLw0axdh6AtxZkUpPi32SWuWCwsBLklrYAWW+9Qumu9bliK6Js4qyUe
 ph33RnPnrOarp8PrUzsFnvBCKmYgn9qhtWUFfSvjZZToO/bMotP3ueNomhJKelT/d1O8
 LUp/vRQyLcy8Wx6HyS5QfZ2wFhBEgjdE7RadMt7IhFkgRN9rSHjVBwd9e9Z5D0/LQ903
 cEJaAdtFk98TgOLTf04NUfP3ne3fpJ2p/VovxlLSBNW0WVXno7S9DEZoppHc8MteChmn
 OBGw==
X-Gm-Message-State: AOJu0Yz5dRiDj0th0ty4LwF9i6BtB8S8zgoKW5colaSNFhHboo38d26h
 6UI7jaMYe+PXzkx0JFEJwQaupnYD9fE=
X-Google-Smtp-Source: AGHT+IENqcTga8rpVveytKTdM1ucd8c9+yua2WSLLGNHCHKmyHOn+/eXpwSU9ArImvzDfoemWvloEA==
X-Received: by 2002:a05:600c:a05:b0:40d:271e:67bc with SMTP id
 z5-20020a05600c0a0500b0040d271e67bcmr1461283wmp.112.1705140418792; 
 Sat, 13 Jan 2024 02:06:58 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u6-20020a05600c138600b0040d5a9d6b68sm12848109wmf.6.2024.01.13.02.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jan 2024 02:06:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 11:06:54 +0100
Message-ID: <20240113100654.85904-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705140419; x=1705745219; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RcrX//0+A4ej3S90EFkHaxjgnj4xIfww4N+w0hFF3pg=;
 b=A6l32I5wBwKoyltv3//G59q0ZnRbBGRsFDqscJ11ebjMOw993XEVHY2u/MyYpDwLyO
 VWN7AOyX66J9anKHvBPSWWDupMom/5BZjHGqzhTgRWBguCKqG1BskXxa32kDFGIXUGjy
 /oFN1g3JFMZN4vnw87ZR0WFHbm/VVBCSLwwRXhBh7+UYkG5f4aNKN/30bS2+YRH2Ast1
 4oaUlBc8bO3dgov2Y1QertkNbZRt/LLlh+2HDgsPYXyRp4aYHU3cU2yMfYh1KDyNtiEO
 9Nw1KbDibfggQBvjJ9rAQIw/qA0Hc2ZzUMGicQ568IjE8IzNYwkmQA3QxFa4v7PqyQ1e
 RxpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=A6l32I5w
Subject: [Buildroot] [PATCH 1/1] package/apcupsd: set LD to TARGET_CXX
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As found out by Yann E. Morin in [1], apcupsd configure script is ugly,
and uses gcc to do the link line-wrapping which will raise the following
build failure with gcc 13:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64le-buildroot-linux-gnu/13.2.0/../../../../powerpc64le-buildroot-linux-gnu/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64le-buildroot-linux-gnu/13.2.0/../../../../powerpc64le-buildroot-linux-gnu/lib/../lib64/libsupc++.a(eh_alloc.o): in function `std::basic_string_view<char, std::char_traits<char> >::compare(unsigned long, unsigned long, char const*, unsigned long) const':
eh_alloc.cc:(.text._ZNKSt17basic_string_viewIcSt11char_traitsIcEE7compareEmmPKcm[_ZNKSt17basic_string_viewIcSt11char_traitsIcEE7compareEmmPKcm]+0x44): undefined reference to `std::__throw_out_of_range_fmt(char const*, ...)'

It will also raise the following build failure on sparc/arc:

/home/autobuild/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arceb-snps-linux-uclibc/9.2.1/../../../../arceb-snps-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-3/output-1/host/arceb-buildroot-linux-uclibc/sysroot/lib/libsupc++.a(eh_throw.o): in function `__exchange_and_add_dispatch':
/SCRATCH/arcjenkins2/slaves/ru20-custom-arcgnu2/workspace/arcoss_verification/arc_gnu_toolchain_release/arc_gnu_toolchain_release/bd-uclibceb/gcc-stage2/arceb-snps-linux-uclibc/libstdc++-v3/include/ext/atomicity.h:82: undefined reference to `__gnu_cxx::__exchange_and_add(int volatile*, int)'
/home/autobuild/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arceb-snps-linux-uclibc/9.2.1/../../../../arceb-snps-linux-uclibc/bin/ld: /SCRATCH/arcjenkins2/slaves/ru20-custom-arcgnu2/workspace/arcoss_verification/arc_gnu_toolchain_release/arc_gnu_toolchain_release/bd-uclibceb/gcc-stage2/arceb-snps-linux-uclibc/libstdc++-v3/include/ext/atomicity.h:82: undefined reference to `__gnu_cxx::__exchange_and_add(int volatile*, int)'

Instead of trying to patch the configure script as advocated by
Yann E. Morin, set LD to TARGET_CXX as:
 - this solution is quicker
 - usptream is dead (last release in 2016)
 - this solution has already been used in other packages (nodejs, zmqpp)

[1]: https://patchwork.ozlabs.org/project/buildroot/patch/20200812171821.2517-1-Evgeniy.Didin@synopsys.com/

Fixes:
 - http://autobuild.buildroot.org/results/6096c3ddc5edf3204635c2c90246c2e8c8e074e7
 - http://autobuild.buildroot.org/results/d8a/d8a3ab31c5b86871c7e1117f4ffa7b6cedfcb7e0/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apcupsd/apcupsd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
index 80ed0b0832..97e6d6a558 100644
--- a/package/apcupsd/apcupsd.mk
+++ b/package/apcupsd/apcupsd.mk
@@ -71,8 +71,8 @@ APCUPSD_CONF_OPTS += --disable-usb
 endif
 
 define APCUPSD_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/platforms
+	$(TARGET_MAKE_ENV) $(MAKE) LD="$(TARGET_CXX)" -C $(@D)/src
+	$(TARGET_MAKE_ENV) $(MAKE) LD="$(TARGET_CXX)" -C $(@D)/platforms
 endef
 
 define APCUPSD_INSTALL_TARGET_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
