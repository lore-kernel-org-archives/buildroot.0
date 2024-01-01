Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60130C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E67EF4051F;
	Mon,  1 Jan 2024 21:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E67EF4051F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-GZUf16V5-u; Mon,  1 Jan 2024 21:35:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5A6F40649;
	Mon,  1 Jan 2024 21:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5A6F40649
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2901A1BF3F9
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F180641BB0
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F180641BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 95lQ40Y3dsO5 for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:35:04 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D144541C4E
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D144541C4E
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a2358a75b69so1524258166b.1
 for <buildroot@buildroot.org>; Mon, 01 Jan 2024 13:35:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704144901; x=1704749701;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ySa/+XaGleOOeCyJCF0unRvbAzIzMtNnrQOokTuv6bU=;
 b=j7yD/spbRWyJXXMhQok9R6BTj6BdOvBA2zHvPt+bz2YLQR9EnwvRPL2Otm+M53RxnP
 meugcXCvfO+3ajY7GOht5N7LXsdE2U4B3+X7VRlAsVtJqrX85AwsIwnsPGKgbcaK4dRL
 cIey0zL0wv6Ah1w8zPPst1k+hp1ZF0j8XIUKKyNpF/dsGpAUpXHbAZPWtznVQ9XaPGsl
 KWcnQvLoxNazRmDQHuRHMwIkyIhqgpj+Wml0ngTywPJZv7r2ntykN4ueHIAl+yetD9Md
 Nj3CAARq/6J+gTLekRqocpCd8UhqMrz4uqy6FGNK3JZ8OGVi0r5ojdupbt/HrLJSGemF
 m5Rg==
X-Gm-Message-State: AOJu0YySpf5V4BdjmyW5g7uaTnxzW19GVIW3cmQHAELdBvK/UobVCRiz
 DhVCtwcCbEQOX5UWb4Moit2tJjJwtz70aQ==
X-Google-Smtp-Source: AGHT+IHK+c8nrxf4+9DfnPS2JMBreSrduSTZp8LKy+wCTJ7z4ntZAo4FuoP3OimGDDMpqlGCfC0KpQ==
X-Received: by 2002:a17:906:e20f:b0:a27:dc7f:bb49 with SMTP id
 gf15-20020a170906e20f00b00a27dc7fbb49mr2583562ejb.52.1704144901234; 
 Mon, 01 Jan 2024 13:35:01 -0800 (PST)
Received: from aleksandr-System-Product-Name.. ([91.218.192.226])
 by smtp.gmail.com with ESMTPSA id
 le19-20020a170906ae1300b00a2798d33c31sm3331384ejb.77.2024.01.01.13.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 13:35:00 -0800 (PST)
From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jan 2024 23:34:54 +0200
Message-Id: <20240101213454.558295-1-aleksandr.o.makarov@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704144901; x=1704749701; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ySa/+XaGleOOeCyJCF0unRvbAzIzMtNnrQOokTuv6bU=;
 b=Fvlcr8qF9/Vzi8hLkG3AsaFcRcKe1CrDA+xiyAlMqLyF9Ic+vT0B0bjs6To+Mf8e6f
 +lBq6t0BnJ1O8vZwYws2OM9AFoCQjkCEEA6aZhmviCZqEhoi4KNSttcIsbhO6Na+tC3T
 OiDHxRjwW5l29qTUqwYaGKV69tw7cWZUA5QeBn9PK8OR9pmu20oSPQJL2vI5NrJtwt6b
 FtjJ3mX3XX1BZ6jE+xWr+hZ8jrLEo2A8LMpIgApMD9avqXXtcoeJTDNtHe4YA/L6fE9N
 TafOmp2u1FpSQRSQvOYj8T6KDylfADRMCELcRf5Dvl5m/GIOhS0a5dAwGwDqmk4+3hyT
 s8Jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Fvlcr8qF
Subject: [Buildroot] [PATCH 1/1] package/haproxy: fix runtime 'FATAL ERROR:
 invalid code detected -- cannot go further'
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
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Forcing HAPROXY_CFLAGS on the haproxy build command line overrides CFLAGS
which were internally set by the package Makefile.

In such a way, a bunch of flags that were deduced by the package build script
in *_CFLAGS variables, specifically in SPEC_CFLAGS, are omitted. Compiling and
running haproxy without SPEC_CFLAGS taken into account results in runtime error:

$ haproxy
FATAL ERROR: invalid code detected -- cannot go further, please recompile!
The source code was miscompiled by the compiler, which usually indicates that
some of the CFLAGS needed to work around overzealous compiler optimizations
were overwritten at build time. Please do not force CFLAGS, and read Makefile
and INSTALL files to decide on the best way to pass your local build options.
...

This error is produced by haproxy.c [1] source which effectively ensures that INT_MAX+1
expression wraps around using twos-complement representation. It is only true when -fwrapv
gcc option is set in SPEC_CFLAGS.

To address this, append necessary *_CFLAGS variables to the CFLAGS in haproxy Makefile.

[1] https://git.haproxy.org/?p=haproxy.git;a=blob;f=src/haproxy.c;h=e1863255422459e806f7e50828e81976bb41c14c;hb=HEAD#l3304

Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
---
 ...fix-runtime-FATAL-ERROR-invalid-code.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/haproxy/0002-package-haproxy-fix-runtime-FATAL-ERROR-invalid-code.patch

diff --git a/package/haproxy/0002-package-haproxy-fix-runtime-FATAL-ERROR-invalid-code.patch b/package/haproxy/0002-package-haproxy-fix-runtime-FATAL-ERROR-invalid-code.patch
new file mode 100644
index 0000000000..39706048f3
--- /dev/null
+++ b/package/haproxy/0002-package-haproxy-fix-runtime-FATAL-ERROR-invalid-code.patch
@@ -0,0 +1,50 @@
+From 9dbf27180c5ae04b11076c46da029bfd1446782a Mon Sep 17 00:00:00 2001
+From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+Date: Mon, 1 Jan 2024 22:04:15 +0200
+Subject: [PATCH 1/1] package/haproxy: fix runtime 'FATAL ERROR: invalid code
+ detected -- cannot go further'
+
+Forcing HAPROXY_CFLAGS on the haproxy build command line overrides CFLAGS
+which were internally set by the package Makefile.
+
+In such a way, a bunch of flags that were deduced by the package build script
+in *_CFLAGS variables, specifically in SPEC_CFLAGS, are omitted. Compiling and
+running haproxy without SPEC_CFLAGS taken into account results in runtime error:
+
+$ haproxy
+FATAL ERROR: invalid code detected -- cannot go further, please recompile!
+The source code was miscompiled by the compiler, which usually indicates that
+some of the CFLAGS needed to work around overzealous compiler optimizations
+were overwritten at build time. Please do not force CFLAGS, and read Makefile
+and INSTALL files to decide on the best way to pass your local build options.
+...
+
+This error is produced by haproxy.c [1] source which effectively ensures that INT_MAX+1
+expression wraps around using twos-complement representation. It is only true when -fwrapv
+gcc option is set in SPEC_CFLAGS.
+
+To address this, append necessary *_CFLAGS variables to the CFLAGS in haproxy Makefile.
+
+[1] https://git.haproxy.org/?p=haproxy.git;a=blob;f=src/haproxy.c;h=e1863255422459e806f7e50828e81976bb41c14c;hb=HEAD#l3304
+
+Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index a66c9b69c..95fbb8a9c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -289,7 +289,7 @@ ARCH_FLAGS        = $(ARCH_FLAGS.$(ARCH))
+ # These CFLAGS contain general optimization options, CPU-specific optimizations
+ # and debug flags. They may be overridden by some distributions which prefer to
+ # set all of them at once instead of playing with the CPU and DEBUG variables.
+-CFLAGS = $(ARCH_FLAGS) $(CPU_CFLAGS) $(DEBUG_CFLAGS) $(SPEC_CFLAGS)
++override CFLAGS += $(ARCH_FLAGS) $(CPU_CFLAGS) $(DEBUG_CFLAGS) $(SPEC_CFLAGS)
+ 
+ #### Common LDFLAGS
+ # These LDFLAGS are used as the first "ld" options, regardless of any library
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
