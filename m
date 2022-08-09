Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E618AC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 14:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D9C140193;
	Tue,  9 Aug 2022 14:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D9C140193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iRG7nGc5dDnh; Tue,  9 Aug 2022 14:41:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C7EF409EC;
	Tue,  9 Aug 2022 14:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C7EF409EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5CA161BF2F2
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 14:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35F9F408F5
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 14:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35F9F408F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N7LL0C84SdVs for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 14:41:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7C81408EC
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7C81408EC
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 14:41:39 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id l4so14530700wrm.13
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 07:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=mB9A+eXM09avUvyo+v0ZR3tQ4WtcmBfwSNG0dI0p/Ms=;
 b=26OHpzRGFwFoNhPqBzcGvIXuVzBHtLRCxQec62qz5Nd3Vti1J73zC3g1VIsDhawhyP
 s9scoFU6F1uoQ2C9QSQmqnDApiWGOMI8PDF5CWfYY851ELcTadhEL9+k+D/kY2sUZu7d
 53G0EhkUjat8yS/VOoV7KPKvL19os4IMzks7/Ty4tNA5sh6+pSEOYvVpSY1Q3jvpfjeA
 +ukBtLCRQ8kXS86Flt4LinZftoH1W02VZbDHNdqLDU/zcv6ASeDYez3IwzsHrRQ0/D7j
 FX33jBsp7fCyVsk3ZjXdre5SGdr+EgOQ+lsellR4Il9+5L7FxiTy+DAqG8y10LIrHPSk
 QpKQ==
X-Gm-Message-State: ACgBeo3HDpLaQa67oP/YU3hYCMvd6y41hI+Op1rK0vYBBhGZULhdyOKA
 tAtXCFYE4afcDCjth2RBDpyluJDRyCU=
X-Google-Smtp-Source: AA6agR5TCMV2AdYJAi5mcK7UKSbBU+vTKi6axJHnsg386X41KzRAGJabMcotc7jVWH/PSWAE9VsuqA==
X-Received: by 2002:adf:f085:0:b0:220:5a78:3a32 with SMTP id
 n5-20020adff085000000b002205a783a32mr14175810wro.223.1660056097682; 
 Tue, 09 Aug 2022 07:41:37 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o15-20020adfcf0f000000b0021d6a520ce9sm13705873wrj.47.2022.08.09.07.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 07:41:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 16:41:32 +0200
Message-Id: <20220809144132.1913960-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=mB9A+eXM09avUvyo+v0ZR3tQ4WtcmBfwSNG0dI0p/Ms=;
 b=lpdT1IKNpFosWxnkBFjdVT5UYb0H36iC6Dk2+61bdyqkiyw2Q5LJk1u0Si2Fy5jMt9
 WAKevgEynF7RTyzfz4dEZLCPD1B6CFhrwc3q5J6B7GVSDpAmcr0zLG6dj+ZoCTptAD6n
 lONH/MuHKjAga6MItwyi4xuDik0UPpXDUGMedfFtYyeh1nUJkehftaRp0VO3AXlApGlS
 iW1KhmXAvzv+Vk1U7VUxnOMCNq2z4hq8INANvXtg4T7CjYNNRYQnIHcRmgaDBdhbYcE+
 p13o7oko/dq5Oh4DMz0NCnilNQY97/D8FPRe8oNY4dU0z0FPozibd1jPFCTWwfORyrae
 7Omw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lpdT1IKN
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: fix webrtc build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update fourth patch to avoid the following build failure with webrtc
raised since commit a40a516c8ae2e8c11549115e10aa74d98a4fab5d:

../output-1/build/pulseaudio-16.1/src/modules/echo-cancel/meson.build:13:0: ERROR: No host machine compiler for 'src/modules/echo-cancel/webrtc.cc'

Fixes:
 - http://autobuild.buildroot.org/results/e60d72268667ed57a254d7552fa2d785e2e21726

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0004-meson.build-fix-build-without-C.patch | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/package/pulseaudio/0004-meson.build-fix-build-without-C.patch b/package/pulseaudio/0004-meson.build-fix-build-without-C.patch
index e6453d641d..e770927f54 100644
--- a/package/pulseaudio/0004-meson.build-fix-build-without-C.patch
+++ b/package/pulseaudio/0004-meson.build-fix-build-without-C.patch
@@ -1,4 +1,4 @@
-From 9de058e15a4caba4939a864fb7caf67e0164f07e Mon Sep 17 00:00:00 2001
+From ac88536d7c3fde3c22933368296c9029bb67b9fc Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Mon, 25 Jul 2022 21:49:25 +0200
 Subject: [PATCH] meson.build: fix build without C++
@@ -16,8 +16,9 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status:
 https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/737]
 ---
- meson.build | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ meson.build                         | 3 ++-
+ src/modules/echo-cancel/meson.build | 2 ++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
 index c5135330f..8248f263b 100644
@@ -37,6 +38,19 @@ index c5135330f..8248f263b 100644
    add_project_arguments('--coverage', language: ['c', 'cpp'])
    add_project_link_arguments('--coverage', language: ['c', 'cpp'])
  endif
+diff --git a/src/modules/echo-cancel/meson.build b/src/modules/echo-cancel/meson.build
+index 641cd35e7..3b998364e 100644
+--- a/src/modules/echo-cancel/meson.build
++++ b/src/modules/echo-cancel/meson.build
+@@ -6,6 +6,8 @@
+ # '-Wl,--unresolved-symbols=ignore-in-object-files' otherwise it fails
+ # at link time.
+ 
++add_languages('cpp')
++
+ libwebrtc_util_sources = [
+   'webrtc.cc'
+ ]
 -- 
-2.35.1
+GitLab
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
