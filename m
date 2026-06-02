Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2238BCD6E4A
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 12:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE8A960C00;
	Tue,  2 Jun 2026 12:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUWnIiGePka4; Tue,  2 Jun 2026 12:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0900D60C05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780404067;
	bh=XXFl58EjUXxxnqnpvpAthYxPTSYNMWUtHjXmCpyXEJs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RCh4Uxrxuivs3lPtgtrLhfdCJ9Y+7a/7fxIQIu+FiFAWsNy9SRXNXs/9Kr7b14kcu
	 NwtQcJQO/EX4ghx1OEkOvykSJCCXLm7fQfbV6uhKydw2/O2CaKtDy3pv+5c42ThJu1
	 YfCwIW/pr7ypHavJwDvLYAP+dshSQS2NnNbVR50DMcPSbZr9vZnjyjUx7vOwpXrJ6e
	 YdrvfMPENfOCtGlhVFWj3Nc8VV0oMvhx7aniLbZDsFphr2byeDPcM7tu5N7P89s68J
	 HTYXWohoAMXCzFCz+emk38wqDcgrT6VqjzOQ50NFj6Pv4DoCTwE50Mpw7GZN4ykTQt
	 8thu3n+E1aXVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0900D60C05;
	Tue,  2 Jun 2026 12:41:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A6B5F4
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 12:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97E4940556
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 12:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nY606N4XBr1 for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 12:41:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B6C3D40571
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6C3D40571
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6C3D40571
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 12:41:04 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-45ef82204c6so1887012f8f.3
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 05:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780404063; x=1781008863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WWjx1HZ0+T7kTGsGxPsRFFHOjbSbkRjyT8DzJ13ImdQ=;
 b=AsU7G1Vg/YHhnutrH2zzgvWJ/EML8G+NHUXHXYHB/eeE3F7fWGLz4foe1vydZlG8g1
 9LyfO1bakAA5gnm9VHmt9/3NW7zz1CSTei9VuYW3lN+CloOmfK9y9vbCoj53O4hM1Fzm
 tQr07hgG+gpyiv2Q/1zVLlA9gmXxNe5kcxRO5m/KW5cwvBnk+CC/XiXSt54CUY2QsmIv
 2MEdy6JFFgcPet3fRvsoKMHV+TmrX234EeUWSLalx3V434oJwv4IkX2mdwX1njlapbO3
 A2nwNuOJT8kGF+ZX/UWf76uFEq0c6wPGyoMmav576bR0bxvl163/S2fpHO0DmNArucPi
 4/FQ==
X-Gm-Message-State: AOJu0YyBDXVdq1S8o1fMMYUerF2C1YkmV9bx/BHN9Pl+3rpSsVD+0Jrw
 3jnuGYVLDO8CXs5Xh+w3c6k7Shj9rEQWJ2wUXFgINoQfq8m9KTDd7Pr3TNB/UwzYTgramy9EVq1
 9GoJp
X-Gm-Gg: Acq92OH2ye/uWj2vOO2Cl8mTyVzYDc4eoCwhG0MwvQvwfge4NDJ/FJRhsMjps2YweMj
 /DtcUom/8s/vnuRtN7jjtJC/dP5VkXftnZPTWiiRyVT3ivC5aF5xr/SvkCNl/vtKk3e1nuSPxQA
 n1fnmRABjjSByJBqVUV7lNht7hDqEBnK+hyTPNFSC40aBbwEAxyM5W80XggWvH427hfTGYxArmm
 y29TcSCI5CB4R2Se6LnoaXXz043ZRw91J9qLAlKW86TLvJ8wmUZlnunNdK2AAV3obs7WmRXXT8U
 tuQRPwUrX7Epy9q1pHDfpkOYM3AWa3Tkr/t/CLw5I8uqk7WAtItW5MxwKOC/FwTtkg6OwkkhvdZ
 Mscl3RiuwhTB2xJYD7q9yG8bes/Nxxhvwc6mkBbC18xIwldNqhR3EYoWY4FMKMCSBWG38bWjy9Q
 Fs6ZhbOMI4k6VKQjjVAldPaDFKWGlksFFRwM0Xta2CaTQgDEPdpuHe5jComQ==
X-Received: by 2002:adf:f7d0:0:b0:45e:e076:7fb9 with SMTP id
 ffacd0b85a97d-45ef6b3a0f8mr22110660f8f.15.1780404062665; 
 Tue, 02 Jun 2026 05:41:02 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef356b129sm42395629f8f.32.2026.06.02.05.41.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 05:41:02 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 14:41:01 +0200
Message-ID: <20260602124101.287936-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780404063; x=1781008863; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=WWjx1HZ0+T7kTGsGxPsRFFHOjbSbkRjyT8DzJ13ImdQ=;
 b=I6xai7to642X82l2eP/bpx2cRHwhwxmReMCiIxYMW5HwdWPskH3oa4ctWXgu7++CPo
 9s0XQZqanBwGrl8nrzBcXlWtHfT5lKnE+GsuzEWczzH6/GJSJsZ4tkp6HIF3daWisq2e
 vJPGQ9VT7fHSsPCVAtVWtyp1pt0U5fjSkrQbqr5qO4iGrJD0hq448ThioAmqcG/Sa3wO
 NNnuvJ+VC1Tt+qOSEMlgO7IUYIDEuksV2KkAcsv/OVBW9XMCwTdGegncGHghEEzvm0dE
 dfYwWJTnwC1rTJXKeZSHbSNVa3hnKAgpoeQ+5purGPfqEJESL+oqHySZlRB7RQSFNzzT
 T5/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I6xai7to
Subject: [Buildroot] [PATCH] package/gstreamer1/gst1-plugins-good: add CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE 'freedesktop:gst-plugins-good' is correct for this package [1].

Also used in conjunction of 'gstreamer:gstreamer', see the package
vulnerability history [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-46470
[2] https://security-tracker.debian.org/tracker/source-package/gst-plugins-good1.0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index cd1b9f45b9..1b48d83c8b 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -9,6 +9,8 @@ GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
 GST1_PLUGINS_GOOD_LICENSE = LGPL-2.1+
+GST1_PLUGINS_GOOD_CPE_ID_VENDOR = freedesktop
+GST1_PLUGINS_GOOD_CPE_ID_PRODUCT = gst-plugins-good
 
 GST1_PLUGINS_GOOD_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 GST1_PLUGINS_GOOD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
