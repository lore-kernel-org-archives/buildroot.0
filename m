Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEF7C5518F
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 11:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B496F832C9;
	Fri, 20 Feb 2026 11:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ew_CdMB7Bw34; Fri, 20 Feb 2026 11:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B92C4832FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771586396;
	bh=6+dMFvaAInCYN8p8LDHN9l9u3l7gH6gDNNjibrIO1Fw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UvXA+7pZBWwk6L7AcYYeVP7lH4RvGT2ZanVPwQixelEHP81jSespLFtZGF+3VEPjC
	 +BXykvLHsoTkRhgD+jN6lAlE6AEzUSFOpUIXX5bKWyYaVAcDapvWJSu+KKXp4I3RT1
	 pM8ZfVDSDrKIT8iGpzhVyzktW5wkRiXECGD7cOY/FrGJtL44j4CEvEOoq5z2TbmzU9
	 hXUgum0OVGGt8ygs35TwNALsx0jkZnRF7TzlIzj5JMyazzpxX940BlF5rgKj7I6zDd
	 86IxBl4nQ6Ywh08mjQ1yWn8GvZ0oQT6T8RrPsEDyTurxNLYxEC8yuIPWxpTfu2Nalf
	 2+hT63nqfVhNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B92C4832FF;
	Fri, 20 Feb 2026 11:19:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C64A3206
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99B5540284
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mFDfiIbSQl_D for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 11:19:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 45BE44003D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45BE44003D
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45BE44003D
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:19:50 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id tOXzvqEY73rWitOY0vuDwU; Fri, 20 Feb 2026 12:19:48 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 20 Feb 2026 12:19:46 +0100
Message-ID: <20260220111946.2137330-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfG+mh4clJ9/KZeR5pmRhyVNG8LYdEhczfbC4yfC94qQdoB1LVdTFZyyPq+XZHQWCaNuRzmb0knKxYY8xCfsBbAnyjAzydcxOFz0mWaIlAHyKANwGcqTP
 YQYI15NI7DwQmvSHhzbAtdvuL9OwkbReIMI6TeX4olN+iBSGs0WxZD7qVII3HqJOHEOU1K/1QkzruwMqSYpI4UUjLpUwvFU6NO/5lRs7iVFHP8bMjgIxy3Jj
 ZixWXhGuGM9djCzOj+udRSfexbWYON4UVkJ/6Pg5Mms=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1771586388; bh=BhBFCxeWfKXUpyftkm2meHW7IOumB+jfrvPfS4OX4dE=;
 h=From:To:Subject:Date:MIME-Version;
 b=m5HzHsV5XqidfZiSMd7YOUy0wbaWyRLL7byzWB9ZoVFeFG2f09QbEcPsyd1toAoKB
 pPonauuBhYEPvk8hpYSA2t313J5vWfY2hQnzP1hgXIXrrUaXGsbbgxhVARwF9kd9vN
 nOUlmeKMTZI4EnC/b7IkgNWIC+g1gCtm7rbC6yIEjf/5fTgZNjZ/B6fRjB7k97rTlI
 gMoHjuD9mHRjggT+3lc5ieh4xwmyvdsUBGTx2uhXug2U/kMjm3lQIaiDPzRaU02mwN
 o4kO03Q+e5PVq1L0x5N23z9dPX44KnKitW8N0AXXuoknQuU6rfgJS6O/I+7mPPeMRc
 bXayRRNVIjyYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=m5HzHsV5
Subject: [Buildroot] [PATCH] package/wireshark: bump to latest upstream
 stable v4.4.13
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

See the release notes:
- https://www.wireshark.org/docs/relnotes/wireshark-4.4.9.html
- https://www.wireshark.org/docs/relnotes/wireshark-4.4.13.html
- (and all patch versions inbetween)

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 88eb7ef494..87d5781eed 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.9.txt
-sha1  dc91c68b03b389645fa6dade92960863d74bca1d  wireshark-4.4.9.tar.xz
-sha256  60551dc787f41e87aeaa1e9c33304f9008037e3baf9fa11aef9c2d584cc0b54b  wireshark-4.4.9.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.13.txt
+sha1  2e85bc1231775283d3e1593ce700566e0dc4efb9  wireshark-4.4.13.tar.xz
+sha256  cdaaf455954b45990651ba334ddcc691ee446fcfb332e78d27b0a8451f22dc0f  wireshark-4.4.13.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 9ccd8f9a9e..196ac63271 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.9
+WIRESHARK_VERSION = 4.4.13
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
