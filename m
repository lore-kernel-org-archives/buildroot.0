Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB39BC25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 08:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BC3F611E8;
	Thu,  6 Jun 2024 08:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vv8Ch90ApfJj; Thu,  6 Jun 2024 08:19:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C45A61449
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C45A61449;
	Thu,  6 Jun 2024 08:19:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BEC01BF599
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54D494031A
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MpGpduS-OKb7 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 08:19:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=stephan.lukits@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE2EC400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE2EC400BA
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE2EC400BA
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 08:19:28 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-35dc984b3d2so465525f8f.1
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 01:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717661967; x=1718266767;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ez8VJJtTdQVhQW2gQ01F7+5C75FPjb0Dw4jyUykOB0s=;
 b=tcYDKTWPeQ8r7VFGKxoPjIhF/+fg1uclIbg/KyV4uhdtXqe0Y0Qf5sBAKTnfUAJBIJ
 9sYfMVFFqcEJzah3hIQzw9mUD6B+9tpKjQEY9+5ihNaP07VaoxNHkHpsi1VVPSSjFzpp
 fBYmowNHNcwlIHDH98cmSCgMsuE8dRwUwf/amOHAlJUJcFa0FCZIvjSoNBSeXM63osLo
 S3QgQMicNEkGINsutydkj15zOWXXgzRCuvuC3u7OlZf9bHCBT7CD0PRMDicNNUSCUUCx
 jRT8j2DCPPuv0sfSV1OhT4wKyQm9miwLpfU0nWAUlZYVcLYtaCofR3JhnxpXse6cRZSI
 0wUA==
X-Gm-Message-State: AOJu0YxYOXaVPLqz52oTQRv4AoNhNZ60kN8i1tObFFKdrRNS8SEvgzRx
 GdBvnXtsgk/wzQZdUDFUOGw9aQQzrXQAtjrZ06dIyVMoGQq/jvkyczcI0g==
X-Google-Smtp-Source: AGHT+IGy9q7MPELMq27t3iFtV7oETKQqLEMikCszFIAbl4dCHXCt4D9IT8Xo4ur75kD6KKytpGdpfw==
X-Received: by 2002:a5d:6e8a:0:b0:354:f9d9:c374 with SMTP id
 ffacd0b85a97d-35e8eeff5f1mr3804282f8f.26.1717661966564; 
 Thu, 06 Jun 2024 01:19:26 -0700 (PDT)
Received: from ?IPV6:2001:9e8:2de8:6f00:d9ca:cd2c:1414:c520?
 ([2001:9e8:2de8:6f00:d9ca:cd2c:1414:c520])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d4ad2esm883697f8f.43.2024.06.06.01.19.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 01:19:26 -0700 (PDT)
Message-ID: <d94896a3-989a-429f-9c3d-f8b744aa91b8@gmail.com>
Date: Thu, 6 Jun 2024 10:19:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Stephan Lukits <stephan.lukits@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717661967; x=1718266767; darn=buildroot.org;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ez8VJJtTdQVhQW2gQ01F7+5C75FPjb0Dw4jyUykOB0s=;
 b=NdPKkAc3UHyFfv/Gp1yE3pNqkIdVToqipmsXOo0abFja8Z7ZHO4uCeib36gzft5sTu
 LDk+03SDk50SN9VWfPGVEJ58wbdgHurnh0h9d+obePcvhUMqkCo4qu+4ii/p6rOVeW8x
 dmuVWauM2pursPHIAGfghjzLG+oO4WdFaFHklcmw2Fo0fN8k8yhPVhz12lqssj6Vouq7
 LfwNEeg8s4tanYh06oE7tbJFZydKbDRzRZGaOJcDtYXEnZiyV/lanXAwviomLr+dQm+2
 9pCtJd2zCJLO/qsTMsg00SIUSJCzPwFVPuxRxeBWvzuxcL3R4vFmEam6FwjjnrPCCkgS
 xUow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NdPKkAc3
Subject: [Buildroot] few patches for raspberrypi3_qt5we_defconfig
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Good afternoon, on my way to build raspberrypi3_qt5we_defconfig with
buildroot 2024.02 I had to do the following patches in order to proceed.
I did NOT do these patches as described in
https://buildroot.org/downloads/manual/manual.html#submitting-patches
(I'm not there yet) but with 'quilt' so I put them all in this mail to
more aid the maintainer of 'raspberrypi3_qt5we_defconfig' then to
actually provide patches.

Following https://github.com/google/snappy/pull/169/files I made a
0001-check-NEON-for-ARMv8-CPUs.patch

Index: snappy-1.1.10/CMakeLists.txt
===================================================================
--- snappy-1.1.10.orig/CMakeLists.txt
+++ snappy-1.1.10/CMakeLists.txt
@@ -194,9 +194,9 @@ int main() {
  check_cxx_source_compiles("
  #include <arm_neon.h>
  int main() {
-  uint8_t val = 3, dup[8];
+  uint8_t val = 3;
    uint8x16_t v = vld1q_dup_u8(&val);
-  vst1q_u8(dup, v);
+  val = vmaxvq_u8(v);
    return 0;
  }" SNAPPY_HAVE_NEON)


Following 
https://lore.kernel.org/buildroot/20231025205233.1925727-1-kadir.c.yilmaz@gmail.com 
I made a 0003-python3.11-regex-error.patch

Index: 
qtwebengine-chromium-0ad2814370799a2161057d92231fe3ee00e2fe98/chromium/tools/metrics/ukm/ukm_model.py
===================================================================
--- 
qtwebengine-chromium-0ad2814370799a2161057d92231fe3ee00e2fe98.orig/chromium/tools/metrics/ukm/ukm_model.py
+++ 
qtwebengine-chromium-0ad2814370799a2161057d92231fe3ee00e2fe98/chromium/tools/metrics/ukm/ukm_model.py
@@ -42,7 +42,7 @@ _INDEX_TYPE = models.ObjectNodeType(
  _STATISTICS_TYPE =  models.ObjectNodeType(
      'statistics',
      attributes=[
-      ('export', str, r'^(?i)(|true|false)$'),
+      ('export', str, r'(?i)^(|true|false)$'),
      ],
      children=[
          models.ChildType(_QUANTILES_TYPE.tag, _QUANTILES_TYPE, 
multiple=False),
@@ -94,7 +94,7 @@ _EVENT_TYPE =  models.ObjectNodeType(
      'event',
      attributes=[
        ('name', str, r'^[A-Za-z0-9.]+$'),
-      ('singular', str, r'^(?i)(|true|false)$'),
+      ('singular', str, r'(?i)^(|true|false)$'),
      ],
      alphabetization=[
          (_OBSOLETE_TYPE.tag, _KEEP_ORDER),


Following 
https://salsa.debian.org/qt-kde-team/qt/qtwebengine/-/commit/32198a3e0694401b745b4d01add18cdcddf658b4 
I made a
0004-fix-building-with-gcc-12.patch

Index: 
qtwebengine-chromium-0ad2814370799a2161057d92231fe3ee00e2fe98/chromium/third_party/skia/src/utils/SkParseColor.cpp
===================================================================
--- 
qtwebengine-chromium-0ad2814370799a2161057d92231fe3ee00e2fe98.orig/chromium/third_party/skia/src/utils/SkParseColor.cpp
+++ 
qtwebengine-chromium-0ad2814370799a2161057d92231fe3ee00e2fe98/chromium/third_party/skia/src/utils/SkParseColor.cpp
@@ -8,6 +8,8 @@

  #include "include/utils/SkParse.h"

+#include <iterator>
+
  static constexpr const char* gColorNames[] = {
      "aliceblue",
      "antiquewhite",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
