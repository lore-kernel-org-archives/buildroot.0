Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED139C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 21:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95BFD4011D;
	Thu, 11 Jan 2024 21:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95BFD4011D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KeZ1G6wjhlKw; Thu, 11 Jan 2024 21:30:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A450040159;
	Thu, 11 Jan 2024 21:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A450040159
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB8101BF275
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 21:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B45B46F63C
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 21:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B45B46F63C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mSZ1zpQSMlAi for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 21:30:47 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79CF56157D
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 21:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79CF56157D
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40e5508ecb9so33987545e9.3
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 13:30:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705008645; x=1705613445;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=isi21BLUCqBddxydoWLPf2/Hn7hceUHuD1RatxEw7OE=;
 b=OG3TxUHDt+p4YRw2+kF4uuSEmiNtdr3BtuH8KCsJSbr6kS7M1/t367Bjr4maXM8dkE
 eeGHqsMCgYksHdxB0qZN0fvrECoVolUXTn8AmhH39s4OSfVpnXu8lNF7lnsmTkojaGxS
 2OE5FW+XcIf4oGSVfZ0qZrdH1Aa2dcSy1fHszC3QhakceHLS3a0PI1yF6nVABC+T4EOR
 OKM0Tqk4FRCVtPhEdCu64teZXHnt1to8SnnWV+TR9x2vuV8ZCc+JmjzEJpjvGLHA6ge5
 P+VURewy6KoLr4TIBZUl4jt8cwaHF+lu8/Jspoodv/2xr78vKgsUpBEgt1/lkh/9SbY8
 XePQ==
X-Gm-Message-State: AOJu0YxPyqX2CU3Uc5n3kqhET91m/m/Oo6jSiJxeROx9dsErGv3a6SEv
 EeJpQbp6CcGDdcQ1Wszlm8SCDcv0GGU=
X-Google-Smtp-Source: AGHT+IGKoeP/L4zeVZL3Txa5clXgOZezJaQy+wFI33ZSvltE2av9SSmS/zEIGlD8iHJLqUcN87i+3w==
X-Received: by 2002:a05:600c:2290:b0:40d:850b:a19e with SMTP id
 16-20020a05600c229000b0040d850ba19emr305839wmf.82.1705008644505; 
 Thu, 11 Jan 2024 13:30:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o23-20020a05600c511700b0040e4c1b0c14sm7317567wms.34.2024.01.11.13.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 13:30:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 22:30:40 +0100
Message-ID: <20240111213040.2677044-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705008645; x=1705613445; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=isi21BLUCqBddxydoWLPf2/Hn7hceUHuD1RatxEw7OE=;
 b=SIecQ9YA6HesDhfdnV/VhohAeyvM7mM0trVFs1JEVUrdRanmu/Mc54v3plX4H29xdz
 mH6ymGsm9G0LbISMxD4+JORYCpfo7IYzgApz5OIYEoX8/t/F3LiFlFlfrCItrcg35IwW
 8fxxcYndvpIKQCOOU+e/Q66UfC7Pe+NIqxqr9btCv37LosrPKaFTBiPDv8f2462Hq+j9
 D0Mpdzo1LY+HeX59qxtXsC6bmcbBsyUagG8+52PZTA7m3wJ2tXgfIHY9gCkjiZjKw2IP
 z7n/IJReT2Vh1Lt3e540tZpGEIkgyU2iffgw34D67PkxkQm8cAJA/MdCjPLkceTtuxYy
 y1HA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SIecQ9YA
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to version
 4.0.12
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

- GVCP dissector crash. CVE-2024-0208.
- IEEE 1609.2 dissector crash. CVE-2024-0209.

https://www.wireshark.org/security/wnpa-sec-2024-01
https://www.wireshark.org/security/wnpa-sec-2024-02

https://www.wireshark.org/docs/relnotes/wireshark-4.0.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index a6ef69b1af..6610eb7781 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.11.txt
-sha1  4af3140d69f9d41e1c4e161fad66304a6920ddce  wireshark-4.0.11.tar.xz
-sha256  4c341cc33a6c512d983f4126e6f3e5c249f604e14ab7f337d38b1cbe58199e3d  wireshark-4.0.11.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.12.txt
+sha1  e00d90769995bf786b05c05bdd9a2c6c8e372e70  wireshark-4.0.12.tar.xz
+sha256  e4e3d618ba11e159fb163f0dc4716a8b72a065aafd1111db9405332552a5a115  wireshark-4.0.12.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 6fb4b60f2b..3759f9bf94 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.0.11
+WIRESHARK_VERSION = 4.0.12
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
