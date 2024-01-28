Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026C6C47DA9
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 13:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B57998272C;
	Sun, 28 Jan 2024 13:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B57998272C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GgfkXSLXBJNw; Sun, 28 Jan 2024 13:22:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 045F7827A0;
	Sun, 28 Jan 2024 13:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 045F7827A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 274C91BF2C7
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2ADDA40179
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2ADDA40179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eFYhPUXuRS2p for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 13:21:04 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17FC9404A3
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 13:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17FC9404A3
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e72a567eeso39113555e9.0
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 05:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706448062; x=1707052862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v6G51KP89EohwFCQ1bC4Uq9i/EjFDvCgv/yVrRtlgA0=;
 b=RiI5CL/aeNLkxHTgNGK0aV5PNRlDh4/qEI40ENtoX7UmpgWrA3dx+kPkz52IVmQZCP
 l/nR7Eq2y4haT6WWqEqfqRqno0ZFgpv3lJhUZGgp5rO4jUs9amlo+dBsRMqLzruyfFpC
 FLu9SKwu9g6pwgGg4pZhcO4QfgouhJ6ReaBYn16csmQF1T3yehoBXmnxwSdXZqHaeUVU
 AA/G1Gq3aOB7IdqqfHyofvfqflRvhFKvkMCD6MnYQHvO/d5CXducketV+JNDWYWg18zr
 e26D/XJ7/EPg+oTUavQu36jC416DkkOuFsVgOaPyYETAWFU44tx4qzoTG5PD8FGGg7J9
 Bv3A==
X-Gm-Message-State: AOJu0YyQfVmOvUkyQGiFybkpdVinZ4IIcYwscUaY4CRCDX40K/cU/Zc+
 Vq3oJZORVh43z1TjNbRBmtLwv5XVaBEh3lbVDT8NDM3VAFVOGtI5RJ8RMoci
X-Google-Smtp-Source: AGHT+IHvIzk55Aq7XIIgVRU8p25eWUX6aa6Dr8CI1BGWA5DGeEINgRWdwKgSjplX4r5GgK2gAQO3KA==
X-Received: by 2002:a05:600c:444c:b0:40e:431c:4172 with SMTP id
 v12-20020a05600c444c00b0040e431c4172mr3047745wmn.13.1706448062090; 
 Sun, 28 Jan 2024 05:21:02 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 bv25-20020a0560001f1900b0033aec64ba7dsm747778wrb.78.2024.01.28.05.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 05:21:01 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Jan 2024 14:20:55 +0100
Message-ID: <7a6ed8af0a4692069c8b146c6b14647db89c9d23.1706448055.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706448062; x=1707052862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v6G51KP89EohwFCQ1bC4Uq9i/EjFDvCgv/yVrRtlgA0=;
 b=G6xeS+627jyPuKYNsuMtMrnbDkaRoDAVSZDOr1ZX91uoWzDXsOIlliwSzxTYfeowrT
 ozzRl2QFuBQp0jXljqmr863t0uEDWjVRdl790kACn+4OfV16UkeNl48Un8nax2oFsZWy
 uHsxcl7H33ONL/fy59sy4zYmq87SRBQjMg87DPgmGh9zQSg8rkQAo389eB/v1i/NMsRY
 E8PWmjQ9e9CKTX/8bcwb72uKDf7JZaJ0HZUHUAuI9CkSbn2/OjOJhMPYKz69yrC+Ainx
 puCONFghpTCu6VVi5BezXrMdj/U4AtMZbKKWNqM8+xntu5+oxyZKklGSgw+9+BOj9BkK
 Yzdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G6xeS+62
Subject: [Buildroot] [PATCH 06/10] package/petitboot: propagate depednencies
 from kexec/kexec-lite
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 719921bebe17 (package/kexec: bump to version 2.0.27) forgot to
propagate the new dependency on kernel headers to petitboot, which may
select kexec, causing unmet dependencies warnings (unfortunately, not
errors), such as;

    $ KCONFIG_SEED=0x84462FFC make randconfig
    WARNING: unmet direct dependencies detected for BR2_PACKAGE_KEXEC
      Depends on [n]: BR2_PACKAGE_KEXEC_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 [=n]
      Selected by [y]:
      - BR2_PACKAGE_PETITBOOT [=y] && (BR2_PACKAGE_KEXEC_ARCH_SUPPORTS [=y] || BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS [=n]) && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_PACKAGE_HAS_UDEV [=y] && !BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS [=n]

Propagate the dependency from kexec, and add comments about dependencies
also inherited from kexec-lite.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Julien Olivain <ju.o@free.fr>
---
 package/petitboot/Config.in | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index f931ab91cd..6a3d476b11 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -2,10 +2,11 @@ config BR2_PACKAGE_PETITBOOT
 	bool "petitboot"
 	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS || BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # lvm2
-	depends on BR2_USE_WCHAR # elfutils
-	depends on !BR2_STATIC_LIBS # elfutils, lvm2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, lvm2
+	depends on BR2_USE_WCHAR # elfutils, kexec-lite
+	depends on !BR2_STATIC_LIBS # elfutils, kexec-lite, lvm2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, kexec-lite, lvm2
 	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || !BR2_PACKAGE_KEXEC_ARCH_SUPPORTS # kexec
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_LVM2 # devmapper
 	select BR2_PACKAGE_NCURSES
@@ -36,3 +37,7 @@ comment "petitboot needs a toolchain w/ wchar, dynamic library, threads, udev /d
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_PACKAGE_HAS_UDEV
+
+comment "petitboot w/ kexec needs a toolchain w/ headers >= 3.17"
+	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS && !BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
