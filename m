Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F60C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 20:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B63CB61589;
	Wed, 29 Nov 2023 20:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B63CB61589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZnGlBh2y5Th; Wed, 29 Nov 2023 20:08:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E2BB6061B;
	Wed, 29 Nov 2023 20:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E2BB6061B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 143681BF3B8
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 20:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0B606061B
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 20:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0B606061B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n_adu7tvPfn0 for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 20:08:39 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B03661587
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 20:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B03661587
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40b27b498c3so1437235e9.0
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 12:08:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701288517; x=1701893317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BWKapL+9JgEAzyEKK1eGUOc/AC2tOxTm/secXP8SBa4=;
 b=ijBiqiVOSwJChd7HI9YMrq5cszBUUEVBGTL0rqp1ow0SYficCwRfuv6+F63MSdLtP0
 b2uojS8sZttWLZoORQ9kFJjWBvsXsM1Nh1WnreIs6T5wdAHqIm8E4IxsJWkmjqsfVWTI
 MM0L5SvuEVtKtK2mHwkKKNyuE9sMkXCNqiOa6sABc7ZuJ8sx4OogK0r1j9mFu5pGsGIl
 y3wzpZHH5qdIgRh7PCH2KRi1czD2dvU+x5xp4Q6eSboIOl2EB760+lDne9FH5GRO/C19
 93K0Y1ImI6Y30pJziuJS/oAba+AyE2EhiLLiPinNZ+Lh+xg1wytHuguFos4EPvc4W5Ov
 WHkA==
X-Gm-Message-State: AOJu0YzieMUJW9tPDBAQUjMSeIChktWVxQCWjvj+2GTzHXdVuGCbh25v
 8bug0/YDAzK4uSUxJCnmpdEWH2M6Ky4=
X-Google-Smtp-Source: AGHT+IG9ssj85NxYs6qN/gXDk9IyT3MME0hE5FAEwkzVoA3MLq2HYhMQ9b6rcHYc2TXOcPNc2FAG0A==
X-Received: by 2002:adf:ee90:0:b0:333:ed:82e7 with SMTP id
 b16-20020adfee90000000b0033300ed82e7mr7731960wro.10.1701288516941; 
 Wed, 29 Nov 2023 12:08:36 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m17-20020a5d6251000000b0033310d8d0e8sm5188590wrv.63.2023.11.29.12.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 12:08:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 21:08:32 +0100
Message-ID: <20231129200832.580226-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701288517; x=1701893317; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BWKapL+9JgEAzyEKK1eGUOc/AC2tOxTm/secXP8SBa4=;
 b=QCt3Jsa9bJUb9JM7N3l5Tl2sn3H98+I0wxLlOJvhWOWLfkAiSbUzTXCE2WMLY/2oED
 nvN20a7/wnq9RJhvJ3wbJ5YScPeqHOUew+pTbYZIySZ1zyFFTW85EV4r2ienok52VphY
 diSk0TP5psjLQAvS79j8nO0btAxpO7CPhLkprUdQO71/U7/XwIEtV6e1CoK9/vyDvJ2I
 iDwJ2d1aPmhngHMXSNoEIgrvTJndW/F95xtuDzCUv1f+UWyqv8osGaFZosN4LBvo2Kzq
 gOMYJr0C6lMQ1dh2u/M9Zzzx9oOYrTLt+hq5qtJWHJKzNhIUAENOoXdM39VJuFkZpmkB
 uSKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QCt3Jsa9
Subject: [Buildroot] [PATCH 1/1] package/libgdiplus: needs C++
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Unfortunately, libgdiplus unconditionally calls AC_PROG_CXX since
version 6.1 for google-based tests resulting in the following build
failure without C++ since commit
5b6dd17b864cfb9133d3e2d78b9a15fed877b15b and
https://github.com/mono/libgdiplus/commit/4f9802230653ffe810ed2e535a572e42821fdf2d:

checking whether the C++ compiler works... no
configure: error: in `/home/thomas/autobuild/instance-3/output-1/build/libgdiplus-6.1':
configure: error: C++ compiler cannot create executables

Fixes:
 - http://autobuild.buildroot.org/results/3757921a2160ca209089a0b47414a445cc42e35e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgdiplus/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libgdiplus/Config.in b/package/libgdiplus/Config.in
index 6ddf44fd0c..d26a997d46 100644
--- a/package/libgdiplus/Config.in
+++ b/package/libgdiplus/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBGDIPLUS
 	depends on BR2_USE_WCHAR # libglib2 -> gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_XLIB_LIBXFT
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_CAIRO
@@ -13,7 +14,8 @@ config BR2_PACKAGE_LIBGDIPLUS
 
 	  https://github.com/mono/libgdiplus
 
-comment "libgdiplus needs a toolchain w/ wchar, threads"
+comment "libgdiplus needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
