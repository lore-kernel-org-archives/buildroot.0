Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C7CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 10:30:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC73861980
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 10:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC73861980
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=trabucayre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9720B42581;
	Thu, 30 Sep 2021 10:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6YttWYOBvYjO; Thu, 30 Sep 2021 10:30:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00D694252A;
	Thu, 30 Sep 2021 10:30:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF5E21BF94B
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 10:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCC274252A
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 10:30:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wbUcEZkkbkjX for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 10:30:45 +0000 (UTC)
X-Greylist: delayed 00:05:19 by SQLgrey-1.8.0
Received: from mail (kmf.trabucayre.com [91.121.117.161])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA5F542525
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 10:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost [127.0.0.1])
 by mail (Postfix) with ESMTP id A2BEA39856;
 Thu, 30 Sep 2021 11:55:16 +0200 (CEST)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 11:55:15 +0200
Message-Id: <1632995715-74056-1-git-send-email-gwenj@trabucayre.com>
X-Mailer: git-send-email 1.6.4.2
Subject: [Buildroot] [PATCH] package/uhd: fix usrp2 build
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
 ...ost-math-iround-math-sign-with-std-l.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/uhd/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch

diff --git a/package/uhd/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch b/package/uhd/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch
new file mode 100644
index 0000000000..d2460dfd35
--- /dev/null
+++ b/package/uhd/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch
@@ -0,0 +1,56 @@
+From 025e8a9e9334ea1111003e3b42c75fcb3036c639 Mon Sep 17 00:00:00 2001
+From: StefanBruens <stefan.bruens@rwth-aachen.de>
+Date: Wed, 5 May 2021 18:24:58 +0200
+Subject: [PATCH] usrp2: Replace boost::math::iround/math::sign with
+ std::lround
+
+Instead of multiplying zone with the sign repeatedly just make
+the zone a signed value.
+
+See #437, #438
+
+Signed-off-by: Aaron Rossetto <aaron.rossetto@ni.com>
+---
+ host/lib/usrp/usrp2/usrp2_impl.cpp | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/host/lib/usrp/usrp2/usrp2_impl.cpp b/host/lib/usrp/usrp2/usrp2_impl.cpp
+index 1be4c7339..41bd0fa89 100644
+--- a/host/lib/usrp/usrp2/usrp2_impl.cpp
++++ b/host/lib/usrp/usrp2/usrp2_impl.cpp
+@@ -22,6 +22,7 @@
+ #include <boost/asio/ip/address_v4.hpp>
+ #include <boost/asio.hpp> //used for htonl and ntohl
+ #include <boost/thread.hpp>
++#include <cmath>
+ 
+ using namespace uhd;
+ using namespace uhd::usrp;
+@@ -844,20 +845,19 @@ double usrp2_impl::set_tx_dsp_freq(
+         _tree->access<double>("/mboards/"+mb+"/tick_rate").get();
+ 
+     //calculate the DAC shift (multiples of rate)
+-    const int sign = boost::math::sign(new_freq);
+-    const int zone = std::min(boost::math::iround(new_freq/tick_rate), 2);
+-    const double dac_shift = sign*zone*tick_rate;
++    const int zone         = std::max(std::min<int>(std::lround(new_freq / tick_rate), 2), -2);
++    const double dac_shift = zone*tick_rate;
+     new_freq -= dac_shift; //update FPGA DSP target freq
+     UHD_LOG_TRACE("USRP2",
+         "DSP Tuning: Requested " + std::to_string(freq_/1e6) + " MHz, Using "
+-        "Nyquist zone " + std::to_string(sign*zone) + ", leftover DSP tuning: "
++        "Nyquist zone " + std::to_string(zone) + ", leftover DSP tuning: "
+         + std::to_string(new_freq/1e6) + " MHz.");
+ 
+     //set the DAC shift (modulation mode)
+     if (zone == 0) {
+         _mbc[mb].codec->set_tx_mod_mode(0); //no shift
+     } else {
+-        _mbc[mb].codec->set_tx_mod_mode(sign*4/zone); //DAC interp = 4
++        _mbc[mb].codec->set_tx_mod_mode(4/zone); //DAC interp = 4
+     }
+ 
+     return _mbc[mb].tx_dsp->set_freq(new_freq) + dac_shift; //actual freq
+-- 
+2.32.0
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
