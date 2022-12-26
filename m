Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3716C4167B
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 21:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F48C40554;
	Mon, 26 Dec 2022 21:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F48C40554
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QTmHien7XOG0; Mon, 26 Dec 2022 21:19:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40FD44069B;
	Mon, 26 Dec 2022 21:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40FD44069B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B39E1BF3B9
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13E2C40291
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13E2C40291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nSEiko1_t5ge for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 21:19:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8366B400A6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8366B400A6
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 21:19:16 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d4so2898223wrw.6
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 13:19:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3ecV8ivQCsjyTvoq6cy/DZ9tp5z4XUrfe+ExUbBo6BI=;
 b=gAQ43imo2ezbtGCEWP72TLvZju0vxhrC1DZxQriy4qJVOg9ozvyd+3AN8urI7+aI6x
 O8vRKj4untJG2+z5Au2JbcbFoDJs1q9FMsnKl+g3KURCEQMh2gpz/3OqUPVbYeIRyn1/
 +TfHS/qOcO1q6PkZdz9LjhJT+ODZujo+FxdXZuXCjW7gwPWES9g0/dv2bThKktihs+WI
 ISC1U1YCSug9TUNYOj1ICvoRATTNBW64hX/VWQLJZNu48jWdipoPFUVKpb8o2DN5P2BY
 XZk6fFYEKZBxQ5OuUYgpNS31usolKc4OLRBaSQSekbGjAhWyxi9U48hEhtd7ehX/IqZA
 fuBA==
X-Gm-Message-State: AFqh2kow7NFlZsdm7k4vzbLwqRxb50k5vXS+ilUXMhvVOaug4Ih6faBB
 D7omX3cfDzuPBMpangKyvkA4JpVPRIo=
X-Google-Smtp-Source: AMrXdXujH4qKcbxeVU8rYSACDei/IWxfuEyyK3XABV67mHmUE/OQggoA91YH3CJl5PqoWlE7GyqMQg==
X-Received: by 2002:a5d:4008:0:b0:241:997a:4f57 with SMTP id
 n8-20020a5d4008000000b00241997a4f57mr12019061wrp.39.1672089554300; 
 Mon, 26 Dec 2022 13:19:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m5-20020adfc585000000b00236488f62d6sm11416217wrg.79.2022.12.26.13.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 13:19:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Dec 2022 22:19:10 +0100
Message-Id: <20221226211910.552376-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3ecV8ivQCsjyTvoq6cy/DZ9tp5z4XUrfe+ExUbBo6BI=;
 b=X3o62BjCEqrBaDZQDWcPHcLdEKlayw4l/qoWWQ6FBsGgKnlyOXUvaC2sm85Chy1KP9
 Bfz14jjW5DqcyEZdOVBjD5KNPL8/CGgcSMZ8JX7psnmlem5ELQbJaLlCIZOcCFKN894v
 gUn0qvXatlWweKnBEMNAQRgNHQkxDdhfO0BQ9r8UBkhjp0OXS0dZBdD7CykJrLLxtPwJ
 dx40aYveu9ltvOSB+SiUXoh8AO8qWE/QYwVokjMjFvDXZeYC6yDxT8uWnODMjdvHP8Wg
 EoW288SwBErA/l2xuMQOQuAjQPYaWTnbJdOpPZvKYmOEnmDztYvjihXNg+ehf4FJ2C53
 AAaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=X3o62BjC
Subject: [Buildroot] [PATCH 1/1] package/libdeflate: fix build with arm soft
 float
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with arm soft float raised since bump to
version 1.15 in commit c31087182fa545784d9a0a01f0b32715d78c3955 and
https://github.com/ebiggers/libdeflate/commit/84c76f6f2cf5e5ac4deca0b1c25faebb42469f58:

In file included from /home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/arm/crc32_impl.h:256,
                 from /home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/crc32.c:227:
/home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/11.3.0/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   31 | #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
      |  ^~~~~
In file included from /home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/crc32.c:227:
/home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/arm/crc32_impl.h: In function 'clmul_u32':
/home/autobuild/autobuild/instance-3/output-1/build/libdeflate-1.15/lib/arm/crc32_impl.h:262:9: error: unknown type name 'uint64x2_t'; did you mean 'uint16x2_t'?
  262 |         uint64x2_t res = vreinterpretq_u64_p128(
      |         ^~~~~~~~~~
      |         uint16x2_t

Fixes:
 - http://autobuild.buildroot.org/results/1445dcbf676893133f311a92ac21b29237fb75df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...or-due-to-PMULL-enabled-without-NEON.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/libdeflate/0002-lib-arm-cpu_features-fix-build-error-due-to-PMULL-enabled-without-NEON.patch

diff --git a/package/libdeflate/0002-lib-arm-cpu_features-fix-build-error-due-to-PMULL-enabled-without-NEON.patch b/package/libdeflate/0002-lib-arm-cpu_features-fix-build-error-due-to-PMULL-enabled-without-NEON.patch
new file mode 100644
index 0000000000..b13cbc48af
--- /dev/null
+++ b/package/libdeflate/0002-lib-arm-cpu_features-fix-build-error-due-to-PMULL-enabled-without-NEON.patch
@@ -0,0 +1,35 @@
+From 079a6dd171583c1953017b703ec63c5367a284b4 Mon Sep 17 00:00:00 2001
+From: Eric Biggers <ebiggers3@gmail.com>
+Date: Mon, 26 Dec 2022 11:32:47 -0800
+Subject: [PATCH] lib/arm/cpu_features: fix build error due to PMULL enabled
+ without NEON
+
+When building for soft float arm32, HAVE_PMULL_INTRIN is being set when
+it shouldn't be, causing a build error:
+
+    #error "NEON intrinsics not available with the soft-float ABI..."
+
+Fix this by making HAVE_PMULL_INTRIN depend on HAVE_NEON_INTRIN, as used
+to be the case, in order to get the 'defined(__ARM_FP)' dependency,
+
+Fixes https://github.com/ebiggers/libdeflate/issues/282
+Fixes: 84c76f6f2cf5 ("lib/arm: make crc32 code work with MSVC")
+[Retrieved from:
+https://github.com/ebiggers/libdeflate/commit/079a6dd171583c1953017b703ec63c5367a284b4]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/arm/cpu_features.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/arm/cpu_features.h b/lib/arm/cpu_features.h
+index 4092eba8..edcf7359 100644
+--- a/lib/arm/cpu_features.h
++++ b/lib/arm/cpu_features.h
+@@ -97,6 +97,7 @@ static inline u32 get_arm_cpu_features(void) { return 0; }
+ #endif
+ #if HAVE_PMULL_NATIVE || \
+ 	(HAVE_DYNAMIC_ARM_CPU_FEATURES && \
++	 HAVE_NEON_INTRIN /* needed to exclude soft float arm32 case */ && \
+ 	 (GCC_PREREQ(6, 1) || __has_builtin(__builtin_neon_vmull_p64) || \
+ 	  defined(_MSC_VER)) && \
+ 	  /*
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
