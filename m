Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3E9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 09:14:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12CCF60F5B
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 09:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12CCF60F5B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=trabucayre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B191960723;
	Mon, 11 Oct 2021 09:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lnWHXrLRrwG4; Mon, 11 Oct 2021 09:14:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 078D1605BF;
	Mon, 11 Oct 2021 09:14:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 23F761BF3F3
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 09:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20478402BC
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 09:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LqTM69XAgLGK for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 09:14:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail (kmf.trabucayre.com [91.121.117.161])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1720402AF
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 09:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost [127.0.0.1])
 by mail (Postfix) with ESMTP id 30ABE39856;
 Mon, 11 Oct 2021 10:43:54 +0200 (CEST)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 10:43:52 +0200
Message-Id: <1633941832-35691-1-git-send-email-gwenj@trabucayre.com>
X-Mailer: git-send-email 1.6.4.2
Subject: [Buildroot] [PATCH v2] package/uhd: fix usrp2 build
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Fix build failure:
uhd-3.15.0.0/host/lib/usrp/usrp2/usrp2_impl.cpp:847:29: error: 'boost::math' has not been declared
for boost::math::sign and boost::math::iround

Backport and adapt commits:
- 3796175f32f0cc24c16809d8175d423bc7053de9
- d1c6290fe9c8b01068abfca6f272e2a1e031b9de

Fixes:
- http://autobuild.buildroot.net/results/aa2bd1fbe1b4880aa8de389238380a3d35f80b53/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
- backport the two commits in separate patches (Yann)
- add SoB and backport info (Yann)
---
 ...ost-math-iround-math-sign-with-std-l.patch | 60 +++++++++++++++++++
 ...explicit-template-type-for-std-min-T.patch | 28 +++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 package/gnuradio/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch
 create mode 100644 package/gnuradio/0007-usrp2-Use-explicit-template-type-for-std-min-T.patch

diff --git a/package/gnuradio/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch b/package/gnuradio/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch
new file mode 100644
index 0000000000..27e54a3515
--- /dev/null
+++ b/package/gnuradio/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch
@@ -0,0 +1,60 @@
+From 3796175f32f0cc24c16809d8175d423bc7053de9 Mon Sep 17 00:00:00 2001
+From: StefanBruens <stefan.bruens@rwth-aachen.de>
+Date: Wed, 5 May 2021 18:24:58 +0200
+Subject: [PATCH 003/121] usrp2: Replace boost::math::iround/math::sign with
+ std::lround
+
+Instead of multiplying zone with the sign repeatedly just make
+the zone a signed value.
+
+See #437, #438
+
+Signed-off-by: Aaron Rossetto <aaron.rossetto@ni.com>
+[gwenhael.goavec-merou@trabucayre.com: backport from upstream]
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+ host/lib/usrp/usrp2/usrp2_impl.cpp | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/host/lib/usrp/usrp2/usrp2_impl.cpp b/host/lib/usrp/usrp2/usrp2_impl.cpp
+index d780a6c6b..59fd9849c 100644
+--- a/host/lib/usrp/usrp2/usrp2_impl.cpp
++++ b/host/lib/usrp/usrp2/usrp2_impl.cpp
+@@ -20,6 +20,7 @@
+ #include <boost/format.hpp>
+ #include <boost/math/special_functions.hpp>
+ #include <functional>
++#include <cmath>
+ 
+ using namespace uhd;
+ using namespace uhd::usrp;
+@@ -916,22 +917,21 @@ double usrp2_impl::set_tx_dsp_freq(const std::string& mb, const double freq_)
+     const double tick_rate = _tree->access<double>("/mboards/" + mb + "/tick_rate").get();
+ 
+     // calculate the DAC shift (multiples of rate)
+-    const int sign         = boost::math::sign(new_freq);
+-    const int zone         = std::min(boost::math::iround(new_freq / tick_rate), 2);
+-    const double dac_shift = sign * zone * tick_rate;
++    const int zone         = std::max(std::min(std::lround(new_freq / tick_rate), 2), -2);
++    const double dac_shift = zone * tick_rate;
+     new_freq -= dac_shift; // update FPGA DSP target freq
+     UHD_LOG_TRACE("USRP2",
+         "DSP Tuning: Requested " + std::to_string(freq_ / 1e6)
+             + " MHz, Using "
+               "Nyquist zone "
+-            + std::to_string(sign * zone)
++            + std::to_string(zone)
+             + ", leftover DSP tuning: " + std::to_string(new_freq / 1e6) + " MHz.");
+ 
+     // set the DAC shift (modulation mode)
+     if (zone == 0) {
+         _mbc[mb].codec->set_tx_mod_mode(0); // no shift
+     } else {
+-        _mbc[mb].codec->set_tx_mod_mode(sign * 4 / zone); // DAC interp = 4
++        _mbc[mb].codec->set_tx_mod_mode(4 / zone); // DAC interp = 4
+     }
+ 
+     return _mbc[mb].tx_dsp->set_freq(new_freq) + dac_shift; // actual freq
+-- 
+2.32.0
+
diff --git a/package/gnuradio/0007-usrp2-Use-explicit-template-type-for-std-min-T.patch b/package/gnuradio/0007-usrp2-Use-explicit-template-type-for-std-min-T.patch
new file mode 100644
index 0000000000..e5f4dd2d25
--- /dev/null
+++ b/package/gnuradio/0007-usrp2-Use-explicit-template-type-for-std-min-T.patch
@@ -0,0 +1,28 @@
+From d1c6290fe9c8b01068abfca6f272e2a1e031b9de Mon Sep 17 00:00:00 2001
+From: StefanBruens <stefan.bruens@rwth-aachen.de>
+Date: Wed, 5 May 2021 18:49:40 +0200
+Subject: [PATCH 004/121] usrp2: Use explicit template type for std::min<T>
+
+Signed-off-by: Aaron Rossetto <aaron.rossetto@ni.com>
+[gwenhael.goavec-merou@trabucayre.com: backport from upstream]
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+ host/lib/usrp/usrp2/usrp2_impl.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/host/lib/usrp/usrp2/usrp2_impl.cpp b/host/lib/usrp/usrp2/usrp2_impl.cpp
+index 59fd9849c..e82a9fa71 100644
+--- a/host/lib/usrp/usrp2/usrp2_impl.cpp
++++ b/host/lib/usrp/usrp2/usrp2_impl.cpp
+@@ -917,7 +917,7 @@ double usrp2_impl::set_tx_dsp_freq(const std::string& mb, const double freq_)
+     const double tick_rate = _tree->access<double>("/mboards/" + mb + "/tick_rate").get();
+ 
+     // calculate the DAC shift (multiples of rate)
+-    const int zone         = std::max(std::min(std::lround(new_freq / tick_rate), 2), -2);
++    const int zone         = std::max(std::min<int>(std::lround(new_freq / tick_rate), 2), -2);
+     const double dac_shift = zone * tick_rate;
+     new_freq -= dac_shift; // update FPGA DSP target freq
+     UHD_LOG_TRACE("USRP2",
+-- 
+2.32.0
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
