Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB086C61DA3
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 10:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AC76405BA;
	Fri, 24 Feb 2023 10:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AC76405BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yvn1UQL6NmsJ; Fri, 24 Feb 2023 10:10:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 985C4405B8;
	Fri, 24 Feb 2023 10:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 985C4405B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 224A31BF3C8
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 10:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFE4381E4D
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 10:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFE4381E4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IIqJDD_BD01X for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 10:10:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 994B081BC2
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 994B081BC2
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 10:10:50 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c12so13357218wrw.1
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 02:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b9KcCPRhyyDjbqjfb4xPL2qBrYXfa2qexKXBfA8Oqdg=;
 b=0vGm9TK8hYk1iT+yKmCSz5E1c4zr4yEX1xshE/HJ9czC4Pmw+KyOWSxeZeixICCUb+
 +PUu9/TwcBYmeRyl4Ajh1CE3f69YMhzjShQx2NeoC3VJRMuSlLHPU/cRYWivzl/i30o2
 12OGRvH3svA0TTJEye2mKnBDqtGr6z+8hGzNGIkQxHN7RfgFRupwwyx6VsnQlAFAQPEU
 a2/T5JITOhhIKfqHcyMjscsW3TcFLfflpOCDWAp0TNXEDJn5x7TlGQ8S+rFiAajyhrAG
 B6G2kyKe+psZtxovACyYSFRaK9DOiQGSKRa1qWOIW/EmqrigUFu1pJxxKNYovDXqjS29
 gaMQ==
X-Gm-Message-State: AO0yUKWlvZF9NVbT5X1VfyUhJqezCxZQIR863jt4WmeNArqC74lX1sJe
 IhzKSo0Wr7vR8R8KNlQP05L4XmOh8lY=
X-Google-Smtp-Source: AK7set9WRPEcrC473erM3RcnjfOfJXg479edK266cWzfRBeo5DZKy1SkPuzDj81qelgUlZFCWDKQ2g==
X-Received: by 2002:a05:6000:a17:b0:2c5:5938:e6d6 with SMTP id
 co23-20020a0560000a1700b002c55938e6d6mr12810670wrb.35.1677233448238; 
 Fri, 24 Feb 2023 02:10:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v15-20020a5d4a4f000000b002c7107ce17fsm4151239wrs.3.2023.02.24.02.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 02:10:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Feb 2023 11:10:39 +0100
Message-Id: <20230224101039.1445129-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b9KcCPRhyyDjbqjfb4xPL2qBrYXfa2qexKXBfA8Oqdg=;
 b=gfdSrDaxteP8EkOV8wK4OpgOlNwPNzRedSjBrTSBywSUisvmRZVuDcHBG6JF0UFN6d
 k4aijR2XDncf6XoxZdP+Oyh1pN/XWPLdeuaJBJ+mGjPPnWDIpZTeUQkSdqwbidg+WWl6
 1G06ySvGEPrNbE5jy2Eg9O+XqXwmkMkKNhERrqR2e2fIhrOGOQpIhya8qZFZ4vkhYSnN
 3HdLZCowtC7wjQHBJ6ERkmCTkVGiRUHsXAycoOPUTSz5X2CaCpwJFQX4M88g3CJ1FlIg
 cIecOJG6BWzh+d2xxuaUZVWENIbLdJLkvUsEaIOvxJ6h8+nh0X4LUnJkX3t1E3mgEPcy
 MaLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gfdSrDax
Subject: [Buildroot] [PATCH 1/1] package/libblockdev: needs locale
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

locale_t is unconditionally used since version 1.5 and
https://github.com/storaged-project/libblockdev/commit/4ed6f0b3a46fc77554dab661c22150829aa75966
resulting in the following build failure since the addition of the
package in commit 0c52826291d1884db0f8f35130216065fbc7b574:

module.c:33:37: error: unknown type name 'locale_t'
   33 | static char *strerror_l(int errnum, locale_t locale UNUSED)
      |                                     ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ede9eb1f13d56c77005cc448416fb2efa9d16ff0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libblockdev/Config.in | 6 ++++--
 package/udisks/Config.in      | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 4389fd794c..4f98621bd8 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBBLOCKDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -66,7 +67,8 @@ config BR2_PACKAGE_LIBBLOCKDEV_SWAP
 
 endif
 
-comment "libblockdev needs udev /dev management and a toolchain w/ wchar, threads, dynamic library"
+comment "libblockdev needs udev /dev management and a toolchain w/ wchar, threads, dynamic library, locale"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || \
-		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 253d5cdc6b..b1d02a31b2 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_UDISKS
 	bool "udisks"
-	depends on BR2_ENABLE_LOCALE # parted
+	depends on BR2_ENABLE_LOCALE # libblockdev, parted
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # polkit -> C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS # polkit
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
