Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9594FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 08:24:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A6D66127A
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 08:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A6D66127A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A817E6079C;
	Sat, 25 Sep 2021 08:24:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VeVMthUfSZXp; Sat, 25 Sep 2021 08:24:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6B6360778;
	Sat, 25 Sep 2021 08:24:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D8A241BF2FB
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 08:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C35DE402E3
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 08:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qv1GNAQBihcD for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 08:24:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60A59400DE
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 08:24:34 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i23so34547531wrb.2
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 01:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gyrCqCZJaeD1MrY1anSZQrw3r8M/qQAIRhcFo/DBCxY=;
 b=keev9g058YeYBFDQi0X/+3m+DW3XiMCwqRZpL6p7VcnvXldRXILkHbYzutS/+U8HAe
 HiiSR1reYYKuwkQ7P08zskUYmm6qqRkR1dIp4756xGsX26B8der4nnvNpeAQxHCLjqB1
 pqlhxrPfZU+3UV0h+x2MfxFnTLpexre4M0Cl1U9dGZtFA3Vj1NIJQ4+oMZyqLjfDqajE
 XPIIwVybNCQVIeYuUW1ozAulLKpalXnVf8fM7NJKd5V1KHjMjHHqmGR7SwirVlOsGYsn
 7pZ9PouJJojSATrN3OIs5bz4HQmxk1Zesa5iLuuaVsm1udp28ADtX8ThPs3XvkSMyK+O
 Crhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gyrCqCZJaeD1MrY1anSZQrw3r8M/qQAIRhcFo/DBCxY=;
 b=isLspwUmrQ8y6X7/EBeHaRgHM7m/deZCXZD3MvPqFAwcIaD4viN1MgDDfVCi1m1JiU
 ScCGO2VNiG7J5OFQya+qGfS/7PX8mkqpujBr/vree0zLsvFqp51xbf27Q+D2tHrhAa9T
 7t1DhaHpoBiEsJTvFA+rtvpJyUQdCFNLNs5kV4hz0V8QWjC9Au0XDxi+U4y4XJIcR46U
 9CQCNhf1Mi4yRUGK12km4Y8FgbkOnsBh6PdR7E0gQBYoyyHs5hBShy92YuimFk9/3oXK
 6Bj6zoig6YiVzGZBntKaIu6UoEz2bzU65TlSjGPDvFAWX648DDc37+DfMchnLXSp7/sj
 GUkw==
X-Gm-Message-State: AOAM533eDy24S+SLfRCUk/bNQIaK+AaTf3Bwp2TmL7xukCFrnQrMpbVF
 rARqK9Ig+zsQpdWO7rsIojg5SC3CiLA=
X-Google-Smtp-Source: ABdhPJxOWKzxkfaYZlFO/kuEmzEH3Gy3a0Sr86g73GX0TBsYlzvSeM+5l4XwkLMpfe5O7RzzbZxU6Q==
X-Received: by 2002:a05:6000:144d:: with SMTP id
 v13mr15560753wrx.303.1632558272289; 
 Sat, 25 Sep 2021 01:24:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id m29sm10667608wrb.89.2021.09.25.01.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 01:24:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Sep 2021 10:24:03 +0200
Message-Id: <20210925082403.3231261-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/uhd: fix build of examples
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 130a0163af4eca54fd917529edb44ad9bfe8eb5c:

../lib/libuhd.so.3.15.0: undefined reference to `int boost::math::sign<double>(double const&)'

Fixes:
 - http://autobuild.buildroot.org/results/a38856930b20a0d6fda28fe52f8a4c90c9df4e3a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ove-boost-math-in-favor-of-std-cmath.patch | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 package/uhd/0005-core-remove-boost-math-in-favor-of-std-cmath.patch

diff --git a/package/uhd/0005-core-remove-boost-math-in-favor-of-std-cmath.patch b/package/uhd/0005-core-remove-boost-math-in-favor-of-std-cmath.patch
new file mode 100644
index 0000000000..9530b0213f
--- /dev/null
+++ b/package/uhd/0005-core-remove-boost-math-in-favor-of-std-cmath.patch
@@ -0,0 +1,105 @@
+From dc187b5597779b14d0de4087db4aa54752a15d07 Mon Sep 17 00:00:00 2001
+From: Michael Dickens <michael.dickens@ettus.com>
+Date: Fri, 2 Jul 2021 16:43:41 -0400
+Subject: [PATCH] core: remove boost::math in favor of std cmath
+
+YA Boost removal!!!
+
+Justification
+---
+const int if_freq_sign = boost::math::sign(fe_conn.get_if_freq());
+_dsp_freq_offset = if_freq * (-if_freq_sign);
+// boost::math::sign : 1 if x > 0, -1 if x < 0, and 0 if x is zero.
+// ==> if if_freq_sign > 0 then * by -1 else +1 (effectively)
+
+// std::signbit : true if arg is negative, false otherwise
+// ==> need 'not' of input argument to invert for same result as prior algorithm
+double fe_if_freq = fe_conn.get_if_freq();
+if (!std::signbit(fe_if_freq)) {
+  if_freq *= -1.0;
+}
+---
+The above should result in the same algorithm except possibly
+if fe_if_freq is exactly 0.0 in which case the results might be
+off by the sign (+0.0 versus -0.0).
+
+[Retrieved from:
+https://github.com/EttusResearch/uhd/commit/dc187b5597779b14d0de4087db4aa54752a15d07]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ host/lib/usrp/cores/rx_dsp_core_3000.cpp      | 15 ++++++++-------
+ host/lib/usrp/cores/rx_frontend_core_3000.cpp | 14 ++++++++------
+ 2 files changed, 16 insertions(+), 13 deletions(-)
+
+diff --git a/host/lib/usrp/cores/rx_dsp_core_3000.cpp b/host/lib/usrp/cores/rx_dsp_core_3000.cpp
+index 879748fa2..1c15180ae 100644
+--- a/host/lib/usrp/cores/rx_dsp_core_3000.cpp
++++ b/host/lib/usrp/cores/rx_dsp_core_3000.cpp
+@@ -8,7 +8,6 @@
+ #include <uhd/exception.hpp>
+ #include <uhd/types/dict.hpp>
+ #include <uhd/utils/log.hpp>
+-#include <uhd/utils/math.hpp>
+ #include <uhd/utils/safe_call.hpp>
+ #include <uhdlib/usrp/cores/dsp_core_utils.hpp>
+ #include <uhdlib/usrp/cores/rx_dsp_core_3000.hpp>
+@@ -81,19 +80,21 @@ class rx_dsp_core_3000_impl : public rx_dsp_core_3000
+         _iface->poke32(REG_DSP_RX_MUX, reg_val);
+ 
+         if (fe_conn.get_sampling_mode() == uhd::usrp::fe_connection_t::HETERODYNE) {
+-            // 1. Remember the sign of the IF frequency.
+-            //   It will be discarded in the next step
+-            int if_freq_sign = boost::math::sign(fe_conn.get_if_freq());
++            // 1. Remember the IF frequency
++            const double fe_if_freq = fe_conn.get_if_freq();
+             // 2. Map IF frequency to the range [0, _tick_rate)
+-            double if_freq = std::abs(std::fmod(fe_conn.get_if_freq(), _tick_rate));
+-            // 3. Map IF frequency to the range [-_tick_rate/2, _tick_rate/2)
++            double if_freq = std::abs(std::fmod(fe_if_freq, _tick_rate));
++            // 3. Map IF frequency to the range [-_tick_rate/2, _tick_rate/2]
+             //   This is the aliased frequency
+             if (if_freq > (_tick_rate / 2.0)) {
+                 if_freq -= _tick_rate;
+             }
+             // 4. Set DSP offset to spin the signal in the opposite
+             //   direction as the aliased frequency
+-            _dsp_freq_offset = if_freq * (-if_freq_sign);
++            if (!std::signbit(fe_if_freq)) {
++                if_freq *= -1.0;
++            }
++            _dsp_freq_offset = if_freq;
+         } else {
+             _dsp_freq_offset = 0.0;
+         }
+diff --git a/host/lib/usrp/cores/rx_frontend_core_3000.cpp b/host/lib/usrp/cores/rx_frontend_core_3000.cpp
+index eef25f27d..b9d908534 100644
+--- a/host/lib/usrp/cores/rx_frontend_core_3000.cpp
++++ b/host/lib/usrp/cores/rx_frontend_core_3000.cpp
+@@ -119,19 +119,21 @@ class rx_frontend_core_3000_impl : public rx_frontend_core_3000
+ 
+         UHD_ASSERT_THROW(_adc_rate != 0.0)
+         if (fe_conn.get_sampling_mode() == fe_connection_t::HETERODYNE) {
+-            // 1. Remember the sign of the IF frequency.
+-            //   It will be discarded in the next step
+-            const int if_freq_sign = boost::math::sign(fe_conn.get_if_freq());
++            // 1. Remember the IF frequency
++            const double fe_if_freq = fe_conn.get_if_freq();
+             // 2. Map IF frequency to the range [0, _adc_rate)
+-            double if_freq = std::abs(std::fmod(fe_conn.get_if_freq(), _adc_rate));
+-            // 3. Map IF frequency to the range [-_adc_rate/2, _adc_rate/2)
++            double if_freq = std::abs(std::fmod(fe_if_freq, _adc_rate));
++            // 3. Map IF frequency to the range [-_adc_rate/2, _adc_rate/2]
+             //   This is the aliased frequency
+             if (if_freq > (_adc_rate / 2.0)) {
+                 if_freq -= _adc_rate;
+             }
+             // 4. Set DSP offset to spin the signal in the opposite
+             //   direction as the aliased frequency
+-            const double cordic_freq = if_freq * (-if_freq_sign);
++            if (!std::signbit(fe_if_freq)) {
++                if_freq *= -1.0;
++            }
++            const double cordic_freq = if_freq;
+             UHD_ASSERT_THROW(uhd::math::fp_compare::fp_compare_epsilon<double>(4.0)
+                              == std::abs(_adc_rate / cordic_freq));
+ 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
