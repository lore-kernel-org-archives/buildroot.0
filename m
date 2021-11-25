Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B814AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 19:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48F2F408EA;
	Thu, 25 Nov 2021 19:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5dSrKbzfoyOW; Thu, 25 Nov 2021 19:47:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BF75408E4;
	Thu, 25 Nov 2021 19:47:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0AEA11BF401
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 19:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED343401D4
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 19:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D8QuKQ7HPz6G for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 19:47:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C279C400A4
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 19:47:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 999E78F2A8; Thu, 25 Nov 2021 19:42:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 20:41:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad2b4b8cc796767ec610cebc06ff009bb66bd4c0
X-Git-Newrev: 0fcf166db06df5e2d583ff33ba8b3273cb6be9d6
X-Patchwork-Hint: ignore
Message-Id: <20211125194230.999E78F2A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uhd: fix usrp2 build with boost
 1.77.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fcf166db06df5e2d583ff33ba8b3273cb6be9d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build failure:
uhd-3.15.0.0/host/lib/usrp/usrp2/usrp2_impl.cpp:847:29: error: 'boost::math' has not been declared
for boost::math::sign and boost::math::iround

Backport and adapt commits:
- 3796175f32f0cc24c16809d8175d423bc7053de9
- d1c6290fe9c8b01068abfca6f272e2a1e031b9de

Fixes:
- http://autobuild.buildroot.net/results/aa2bd1fbe1b4880aa8de389238380a3d35f80b53/
- http://autobuild.buildroot.net/results/22b022f360d0f0f23161bc279b736e6a80f87c1a/
- http://autobuild.buildroot.net/results/f65ea915509a8669c624ddab85e76576c8522005/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ce-boost-math-iround-math-sign-with-std-l.patch | 57 ++++++++++++++++++++++
 ...-Use-explicit-template-type-for-std-min-T.patch | 28 +++++++++++
 2 files changed, 85 insertions(+)

diff --git a/package/uhd/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch b/package/uhd/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch
new file mode 100644
index 0000000000..b0cbffc245
--- /dev/null
+++ b/package/uhd/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch
@@ -0,0 +1,57 @@
+From 3796175f32f0cc24c16809d8175d423bc7053de9 Mon Sep 17 00:00:00 2001
+From: StefanBruens <stefan.bruens@rwth-aachen.de>
+Date: Wed, 5 May 2021 18:24:58 +0200
+Subject: [PATCH] usrp2: Replace boost::math::iround/math::sign with std::lround
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
+index 1be4c7339..c0719a316 100644
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
++    const int zone         = std::max(std::min(std::lround(new_freq / tick_rate), 2), -2);
++    const double dac_shift = zone * tick_rate;
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
++        _mbc[mb].codec->set_tx_mod_mode(4 / zone); // DAC interp = 4
+     }
+ 
+     return _mbc[mb].tx_dsp->set_freq(new_freq) + dac_shift; //actual freq
+-- 
+2.32.0
+
diff --git a/package/uhd/0007-usrp2-Use-explicit-template-type-for-std-min-T.patch b/package/uhd/0007-usrp2-Use-explicit-template-type-for-std-min-T.patch
new file mode 100644
index 0000000000..c5d303cd0a
--- /dev/null
+++ b/package/uhd/0007-usrp2-Use-explicit-template-type-for-std-min-T.patch
@@ -0,0 +1,28 @@
+From d1c6290fe9c8b01068abfca6f272e2a1e031b9de Mon Sep 17 00:00:00 2001
+From: StefanBruens <stefan.bruens@rwth-aachen.de>
+Date: Wed, 5 May 2021 18:49:40 +0200
+Subject: [PATCH] usrp2: Use explicit template type for std::min<T>
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
+@@ -845,7 +845,7 @@ double usrp2_impl::set_tx_dsp_freq(
+         _tree->access<double>("/mboards/"+mb+"/tick_rate").get();
+ 
+     //calculate the DAC shift (multiples of rate)
+-    const int zone         = std::max(std::min(std::lround(new_freq / tick_rate), 2), -2);
++    const int zone         = std::max(std::min<int>(std::lround(new_freq / tick_rate), 2), -2);
+     const double dac_shift = zone * tick_rate;
+     new_freq -= dac_shift; //update FPGA DSP target freq
+     UHD_LOG_TRACE("USRP2",
+-- 
+2.32.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
