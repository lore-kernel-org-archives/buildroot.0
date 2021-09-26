Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F99DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:03:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB95D60EB4
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 20:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB95D60EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C46F081CE1;
	Sun, 26 Sep 2021 20:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EYzMQ8dkdwhh; Sun, 26 Sep 2021 20:03:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E364A81CA5;
	Sun, 26 Sep 2021 20:03:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B35A01BF95D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C73E6077F
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AULDBtWZB9rz for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:52:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2934E6077C
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B3FC58D25B; Sun, 26 Sep 2021 19:50:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:29:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41606634b7c8d6c32b6dac4ce2575a43b41c6cb2
X-Git-Newrev: 6b92b0d5b7611dc25af4791d469f431aa345a88f
X-Patchwork-Hint: ignore
Message-Id: <20210926195018.B3FC58D25B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uhd: fix build of examples
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6b92b0d5b7611dc25af4791d469f431aa345a88f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 130a0163af4eca54fd917529edb44ad9bfe8eb5c:

../lib/libuhd.so.3.15.0: undefined reference to `int boost::math::sign<double>(double const&)'

Fixes:
 - http://autobuild.buildroot.org/results/a38856930b20a0d6fda28fe52f8a4c90c9df4e3a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e-remove-boost-math-in-favor-of-std-cmath.patch | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
