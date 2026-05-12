Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4F6CD4F21
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 19:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 990298254A;
	Tue, 12 May 2026 19:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DqZHZHlN8nV9; Tue, 12 May 2026 19:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F54F82531
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778614625;
	bh=9Hj+eDHbwDGNbMvr29XbhZdMviR7KeUZD6ZiWVdbjAM=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sufsmdMxzVhQ4ENqKBl1rky5Rondw84XQdBlJARCc54+MHjXIrOzmBscN7FXklNUF
	 4WdANqH2JeaIr1ZFE4/739GBLs25vD1jKXx5IiWz9ZD5J86AbAcuTKx5nuGB44c8Le
	 GFtXyeVUG4EKREeLcSAPCVYzAdu37U+nob0GAJNm6hXq/8nZbfSvRtaYLBC5b1iaF5
	 oqKUa+1OO5MOT37v5blUIiYcC7mUT1x/ACdZNbyQn5AwcnnYvga7POytdmm+h9Lzs4
	 5jmBpTfVbbIMMoq/UEJi5PyoWDSIZN3OpKx+6RjehilSOWSYo7epDU2FoLKrDxpzav
	 dWTSEWlewL8lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F54F82531;
	Tue, 12 May 2026 19:37:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C18C219
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3167D82521
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4NI9qvIL6T4 for <buildroot@buildroot.org>;
 Tue, 12 May 2026 19:37:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5917C82531
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5917C82531
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5917C82531
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:37:01 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-83d5bbef760so2122959b3a.1
 for <buildroot@buildroot.org>; Tue, 12 May 2026 12:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778614621; x=1779219421;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=F48KGPXrscFuJj5/Pg2l9FPUQstqEK+GKKmeftUgZGM=;
 b=dhy/C/9+mb6VvtvQ2Di1d1VQmknwiOaZuY5UadgEmqNu696NSWhLa5PhFbqnBr1z3X
 8N6ZRarg3At7ctbqyrBYNHS0nd13WKsr/LdN5mAfxRSeQ6S6Q66AuqIbmrydIaBVn1Pi
 9Ya1uTNPzNHtNJOMBIHDxZ/sVqVd9lWBJxiT8vkDJs9hIOk6r0oFCjsMEacXb0aZ6kda
 bicBoRn1vGl9lI1WCFMF2tiK1KNWCwCSOOEsgD8WOpE4l35QSQyyNSDxeNVRh19zCx+e
 cX62BZjuklxnpJ1A1N3RQrDRYNSeKtLQ9u7TzwjpDl9LI62XgpILMHaCw511OpkTLtDu
 /d+A==
X-Gm-Message-State: AOJu0Yyte1jGno/J8qrhMQ/EXbRwb7P1kBpdeluNJ/FeIIeFq8LLy0fN
 3UEx9BLLWyySdMMGZf0J+glXGzJqgvYWCTlyIy61MpJzME26lQLRAvTI
X-Gm-Gg: Acq92OHVbbjiX2qmAsEj7FqEv3JkcH418x5vA6PNxDNO1dGiF6Pz33H4G0cvF4Mng+q
 je6egrwwHVweyjlU5VPCJ+DDDpoOS2rAIYjmoogw8SgHJhTKVvX1NGP+RxXnfTpsvEOnJ2sKVzD
 g9ePv5SJFVaFJbjPCqZK+M1PViUnp0flI8xWjMq/ecRD62P5/4Fa/f9yYVRJrghomzBDkRmBMHe
 RJSlYl4cTRVf/xmUTwU8PsmNHZjRhtu6IxLbh/L8b3m+bi40YPkwVAciZB00l26JPJqfXz9q8SX
 xqYJoWjYuDoqTvn4VlqvH6OJ45Prz8mXtBeIKneUvwYAY1R4Vy+drz/NioDmGkpNx7WoYaaYu6H
 X5jCYBVynQ1VO9YGUDp7BsEqK5I7tKtN5+9wsigrsD/NMeeWpkik2+cZZf3lXeLJ/u/p17hCfDj
 ykE9sxFJ+Scn7BCvYztUUeoN6C
X-Received: by 2002:a05:6a00:420b:b0:82c:f035:6748 with SMTP id
 d2e1a72fcca58-83f042d52bamr49458b3a.42.1778614621173; 
 Tue, 12 May 2026 12:37:01 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-839679c8634sm28932799b3a.39.2026.05.12.12.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 12:37:00 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 12 May 2026 12:36:30 -0700
MIME-Version: 1.0
Message-Id: <20260512-virglrenderer-v5-1-1806e588eb59@gmail.com>
References: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
In-Reply-To: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778614619; l=1974;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=eHS0p8oY9m2jKzThjZd58Nvew/G16pSs3pcqFdEG578=;
 b=+quSwGnddCPNmNJHdQSvVhdyid+ZzMzVowBpq6EV48xZm9I4YH57+YNJKa21D1pH37inqo7lU
 Z9Ru1ENSonpDBQhM15TghF1DjAcD77PH48ju8V2s9wxOfJBW3M+enfw
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778614621; x=1779219421; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F48KGPXrscFuJj5/Pg2l9FPUQstqEK+GKKmeftUgZGM=;
 b=RvdlrYNSSSIpBdoazyeTE0Mw4CWtTnYrvCPu4qZKeuww9r85NXDk1EY6Ny9Wy8utm5
 XjUn7nVcSMeIcSTEdMzRoCj0c11ApfOtHPWIRVCZqP6N2BFqsoqwt/xbwkHO4kyifRbt
 Qm4YTxPbxRNIq1y5H83uqc+yS7IgL/wjeuBY2Iy0iC3Bqtxs7T9MBUBT8BHZzI7lRAeF
 C7m0pY/shee2yAgL32mxvxFTTOMpmNVaavnVGj/TNmOTaSpkHZZz8vgEqdEc0PlRzL5e
 RhvBkyJyEUXs2Y+pQw4Qy0e+SD1NN24asHLZn9XhDXYqCiMvVraPmrgGVgxqmS/XFnWr
 oRfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=RvdlrYNS
Subject: [Buildroot] [PATCH RESEND v5 1/5] package/libepoxy: remove gl/egl
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
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
