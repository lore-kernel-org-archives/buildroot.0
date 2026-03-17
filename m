Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90701FF6E8A
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 22:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 320D760873;
	Tue, 17 Mar 2026 22:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQzo7X6Y-Chv; Tue, 17 Mar 2026 22:16:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64BFA613E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773785793;
	bh=d7KGQEwEeFD+Yn6ujgqITURj9aziNpAwRxED2mgOCE8=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ANqdahg06/S0nvvs6drXzP6mPxQDTnjqp2sg3g2AtfSODQSlX8KTmWxjND3Ss8TOq
	 hTEvevSFx2q7LlNV5R4FhN+FTkDNYsWbPQGt6DtTcg6fR1zWz72mUDsQNMvdV0Oo9N
	 3/UQ4w1FutAsewYVD1J1Ion11dezL2m++wF9b1ZfhZ5mO4fPTmDv+kXCzWeNzmpRPS
	 ch/Xp6ErjYfVy5QyXeb42zX0ul98WLewY7mS/AfsYpmDxpTeeWu8GcuHvUYlh7rWOJ
	 oZCL2PKJ2LojbysT7cExhbpl0nnuykOM5qOvIviD8U2mmlguihb9R6Csw/NiePNnAF
	 WiF5beR40p4JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64BFA613E5;
	Tue, 17 Mar 2026 22:16:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA65A1B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9055A83D6A
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:16:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVxTBdBYdi5z for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 22:16:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C05EC80CBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C05EC80CBD
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C05EC80CBD
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 22:16:30 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-358e3cc5e7eso106929a91.0
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 15:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773785790; x=1774390590;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TudgzmyKRs0TDJtR+cwBroEi/iGztFXJ0Uh+MvO75Yg=;
 b=AicDcUjbPTZElOpuBGD+xHL76kfsawMq+vFc1ZVUIFwlicL1Kn3SpLafdnri9z2L9M
 ncZurS/kqYl1Sc+EZZCVFcSVD2GDKNXKB32mpOc8YZ+2q8Qn8lZ5MsbxUzARpBrhRKoW
 NlxEyfIK57GTQU53ZuEOxylGQEr3UoeE5V6L7sXbe6yBWr234/GSn0PjpGtIEkGlHjc3
 8R/eIFvIacqKrtTgE7nGYdxVxVbBFPl5wjKJnl1tbKF1g6BE6Myl3a3LOGG4zvdsn3Jc
 xgu/08gs4W8cccf5J3fyQG4YVAryQxGR2vg5pptOKhFCO0zWiWrdza9RMoodU+C8Yjcp
 sV3Q==
X-Gm-Message-State: AOJu0YxmAPaSjPkUA6PxNcBPyPnmOn99V8wh/givybiop+IsQIWNTmqN
 z/wAMW24yJd2WsofLv7m0KKkpN7WceEISOxTxhL24YLABFoeRN/aNcMH
X-Gm-Gg: ATEYQzxpuCu1mV1AX7n1nWkQJIdlfdm1+GHcu9r/JuCVfEN+t8OLXQilL0epLSl6Yyg
 MOIWbiobvOH0fGwuCxfzhCBspYfDd+3+ZLjgk2/2b06OAbLVIx2oCpSqDhnw/dlsG5d3tN3HIPY
 5V4zJC/S0iIV7IgoDuAoG+nSVIW/kwvjAaJTroTIdPvYqW4cic4yQpov3KnbAWOoAFB7roqcNrG
 IUHey50KT8hoI1dnoGUY2bwvDdnzeA1UvUeIn3tBkEjFTKyhJMeuDlm0JX90Auot9W0zJK3D+Ve
 ELYx2oX+xtZUpQX4UwCFOqhuwrKU6z1RqmYbJlMqsqM4eoNqtuJcpRmYlbEvgAeI/fkKsGrNAEg
 oFx2lFv+jf2lq4VCc362dzwd1GMPuwehjmXQSX94oudCO8QaaqgFqC4c1amLlP5RReF8HhgSeYz
 4rKC0+zPqWytHb2B8DmeJAZud5Hy8=
X-Received: by 2002:a17:90b:4a47:b0:359:82cb:4ebf with SMTP id
 98e67ed59e1d1-35bb9f7c444mr864127a91.28.1773785789914; 
 Tue, 17 Mar 2026 15:16:29 -0700 (PDT)
Received: from wash-13.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35bada2bfdbsm3997231a91.3.2026.03.17.15.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2026 15:16:29 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 17 Mar 2026 15:16:22 -0700
MIME-Version: 1.0
Message-Id: <20260317-virglrenderer-v4-1-ed223e222bb6@gmail.com>
References: <20260317-virglrenderer-v4-0-ed223e222bb6@gmail.com>
In-Reply-To: <20260317-virglrenderer-v4-0-ed223e222bb6@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, Joseph Kogut <joseph@anodize.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773785788; l=1974;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=psXy7hFr7xzliScleQYAy119z8YH3IvBIyt4tuxRW48=;
 b=aWrSt3TptF3lOQ+osos4hQma2YJraUG1zPFwg7RSyQs9L9nqjbl0Cn5/MrO74U7wZlZ/hRtdi
 usQOs7cQpxcAzAJyQV0lPU897NplZM45RVpwzs10mWYTyvFSEUTxxsJ
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773785790; x=1774390590; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TudgzmyKRs0TDJtR+cwBroEi/iGztFXJ0Uh+MvO75Yg=;
 b=fFrViOvo7FZA9v1W+jwW6n/CS2Bmq1GN0zgu8zQ9+k3mPqDWgDkKRsO++CElaHE9Bx
 SzJbXvNylN8XqEvBXJA3o8R68V14esUe6dMJso9m1otR34/9kf1MblPry7mkEMT5fqD2
 ulvTVOy3mUdQZIIuIcynl0LV1XkgiIgmM4BHvKDSnVz9xv4kHVcIRYed6tlqjQPvBwuD
 cw4P7Tz8cMEPKi2bh0OHEsxKr0YfwEBo/k9pH00hx08VP991n90kD5ePKLF7rbCfcEde
 U8h8hTLwZSDVmS0s2m6nUN0REk73V3eA+knnsaKHi06TQMSSV1n21bkIa6toCPABDOcq
 2DAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fFrViOvo
Subject: [Buildroot] [PATCH v4 1/5] package/libepoxy: remove gl/egl
 dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Joseph Kogut <joseph@anodize.com>

Libepoxy is a library for handling OpenGL function pointer management.

It has backends for egl/glx, which may at one point have been mandatory
to enable, but the library now builds with none of the above enabled
features, as seen below.

  libepoxy 1.5.10

    User defined options
      Cross files            : /home/joseph/br-test-pkg/arm-aarch64/build/libepoxy-1.5.10//buildroot-build/cross-compilation.conf
      b_pie                  : false
      b_staticpic            : true
      buildtype              : release
      build.cmake_prefix_path: /home/joseph/br-test-pkg/arm-aarch64/host/lib/cmake
      default_library        : shared
      docs                   : false
      egl                    : no
      glx                    : no
      libdir                 : lib
      build.pkg_config_path  : /home/joseph/br-test-pkg/arm-aarch64/host/lib/pkgconfig
      prefix                 : /usr
      strip                  : false
      tests                  : false
      x11                    : false

Removing these dependencies allows for some applications that require it
as a build dependency, but otherwise can run headless or without GL, to
build and function.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/libepoxy/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
index 9da190b895..27d2b968d2 100644
--- a/package/libepoxy/Config.in
+++ b/package/libepoxy/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_LIBEPOXY
 	bool "libepoxy"
-	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	help
 	  Epoxy is a library for handling OpenGL function pointer
 	  management for you.
 
 	  https://github.com/anholt/libepoxy
-
-comment "libepoxy needs an OpenGL and/or OpenGL EGL backend"
-	depends on !BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_HAS_LIBGL

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
