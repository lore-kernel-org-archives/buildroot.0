Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D7ACA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4729E4104C;
	Sat,  3 Oct 2026 08:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vso-XSAWfRV8; Sat,  3 Oct 2026 08:45:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5FDDF41049
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017145;
	b=aZusBgSdOgXmhv4Ey49LK/LjzkrCvWpwXx+DN31VTXpaCX/LEleBbDP7w4ltYwFayTiY
	 Z/WpwsXAi2LgKNHuSvjQ/vpHeiUwi9lJlfS9BqCUfjUdM3tEA46hfzgX+H7u5cgyywvbZ
	 yyHxdd+FSFWW7/PLZbbFdADcRlA/iJ+Xuu4NRmaqdkPvUMoqZKem+5aS+Wr3BZlKm69mr
	 UBm6o1JF50oKsSN3YFwhMlApp3iUfcHBkZc8j5JFwwliifAzsxk6zRjpcKmSdeJWcjIai
	 cLeInVbPiN0vEfMGZrGsV8fX4sDQ+n73ORDSjwQjDFhDg64ujAfxzp0ya5QzzB8b4cw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017145;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wdaST1Z8tEgKFdo3CvvOQcFjKZz0PpwY2pJDU9OMycg=;
	b=ENO/50IcKbpEQT42rFMuUpje82vdXj1++SiEO8g2vnMQY4xuAW5H2JxpNiCAeRoCFsYG
	 WTIhCJxzymkA+4DY6YnioF/Hpt9sMQgIHdHCVdqBz68kBP9HKSxAxMJ0lmcMWHTBZXgAu
	 JXni9Pt5E7l9AfmDZJGyfPzdmDOOoW269HHlclzk0tRRnaz3iorrCVOffjM2x6CThJaqW
	 1nXhOm7hnB1QJ1zQy8HZYqkZP0Ugu2BuhxbTWpYNxYOBDex4TSs8oUSBUykLmfyRaUmB+
	 ADwvzJwIbiVHz8sh+wqOADXcSCVCi5pRZchCrDFQr9WmylZYkhdtXra++niUxY0L/XA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017145;
	bh=wdaST1Z8tEgKFdo3CvvOQcFjKZz0PpwY2pJDU9OMycg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=l1TFuBaGSJijtXOMwUvQRNs6sN9NlF9Du+tA18VN1X3K7ssF+gm4S2cpdVruf6+ww
	 W+0+mdBovJ/fI5ETqLAbEAvhZW5csY7OF6sGiVZLzMU0Jn+0+r52JzWZn5/fKbr3OH
	 vORuh5LOIhcBGgXRNvvzrN2l3OOsNxXkGhaZb5nNy/EkK0Vx4yhJbG9lZbXsOnnUZe
	 H/ZCxifDFeaEcUNEJpR30vnp2mjP+7f3bWHxxprg82KQNf5p//eLwVhaC9KTkHwk8L
	 VG9j1dgQD6p7Gf1DbwDjGYY2n33wpX8suMa2qmWr/yqCTDdd72g81pS4csldd6UnVs
	 diASL4rql0bLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FDDF41049;
	Sat,  3 Oct 2026 08:45:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00F8C32F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E738940059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5GvLWogBPNu for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1751C40070
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017141;
 b=oSy2wiZZvGfe+PXfQrQYUFsvsQUZ9ROjY32UV3dSiaUA4fy/7MACdX2k3NqNHzVCsKBr
 KPHVhAUsEJI7bfTQfQ9LuQB2iGFN2ejANuF+70CHdQee7KJG2AKlAq1hIL2kDp1b05y0R
 Px7HxdhUSpuNq/1vbZ6MZRtHzjAK9DAQ1KUSeRMu8Uqiazxk9MeyD6Yk/79XlL+IEKR6N
 ZFzOfuY+2t4h/XBVi4bOg540FlEt3DBXLKxgpW1c/kqgxPqpR1XoVf3oKekUndqA4qzq/
 AV/LI9Ut8Tx9JFV6JEbDPedmnP8IIs0vYPKrUrlVhlHXvnPpz9ZFgAkKzqTLjAzVIWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017141;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=xAm+IOZISH3Ws/X+6zPQc5SnxtjRkCciklu9u78JCgw=;
 b=WDBoVIFgRj5AT4aAUHrK+JTvZacbTJLWaGb7pkms1h+GW98BcnovITK3OHStkaCWzmDC
 KrzOyciJsU/aAxK9V0cnByJTSWzptWkBjauIP0lVU1JPqwuluDLzKBM92XAtwIgT29MZr
 g1lhLMnAINdXojVvTtsCCRCoRgOQ6HDcvQD+RXhkTLJzEjAV+55FMOet4HmdfHJ0lOs1x
 j6dBWTv6owPnj9xzmiVZ6/IRvTWhD5RH9VQJGrO2zw6S1r6ik2Dx9Ishlye0ZcpdyNUWZ
 ACZ/QQYTB1qzr92sUUIJi26yYf8pzWCr6qtInjgRcKOxg0J6Jgt7Tlx3bHR57a7ia9g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=V3IKRgjp; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=V3IKRgjp
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1751C40070
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:40 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-821a7bee9b2so490599a34.0
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017140; x=1791621940; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xAm+IOZISH3Ws/X+6zPQc5SnxtjRkCciklu9u78JCgw=;
 b=V3IKRgjp7xsz9yZNXajLjJiNxCH5q29ovmKLuVRR5GwLcaharPZARo39jGPheXuDwi
 0TlnsuvifyJXEWYa31HJ838oOga/P3Y2xRkGRw7ZXIbMMVGDipOsDhBCLlalNastl9eA
 YsFr8vjJHUDfJqmcW3j4+U1yPQgE2098qXiZjvrmPhOkFQRmlmnUZEw7Bg0mo8/DGKDt
 ry/aLppwuC7pNtT2Kj0jlnaxkK6JUEgq0SRPN9hDLGJQFf/WwtBWPSTUyUwLyNsKGImk
 zGRpgVVpnhjsHJrm+2jqAf23vjRFJ81Y+20FeoriVIw1Iox4WWRjPPBDyN+Uqg6jJBU/
 IqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017140; x=1791621940;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xAm+IOZISH3Ws/X+6zPQc5SnxtjRkCciklu9u78JCgw=;
 b=vp383AbkyUlWkzAAVDqI8u3H+LLQud+D6noCLbuOo590dvZxJdrvYkZ8M5yJzawAqJ
 Vz/rCk7KBvA7D1docCtyga1R8w8HcrgUZ5Bd4qDTnoaGmRrcY/jFjYsUNXVg/uapzcrr
 b/6XBVzLUfT7OMA6LAM+eRjdJMC2e36vEr7jLygeBoq/PpG3AuZ4QvxknHmQOC3pVAvX
 zWxbqTabbyFzSL3TlO7GRqZWfHeVoJtSjTmeuCVm2IyrLXo+MScIZntNiWI84L/YbBJP
 prWxYP0LFXb6CUURJQ/FBeJtRmU0lSL3MFGeYx0A06mCcFi+dY1xy01brRt7vQWM8bee
 7S/Q==
X-Gm-Message-State: AFuF++nvD/Zya8yHNRDGzApVEGtxBDkCSqV5KMYPwe1UnTKhe0fzyLJP
 bX2KZAxcL5p0hoXuYSroFLa9ocZ5Lzt6BLf118jDk8bMxj325+unA3o5/jJNnA==
X-Gm-Gg: AYBFou0vgF9Bau/FXHId1iTu5g9KL9WsYgdFK/lrUd9NVGAfF+S2ikMmDSugyqJbpYk
 TaoCzzJxtfCv/G1n/xUPgHdK6jGYjKHJnId3EinQmsOBbmqgeJIkIXZ7E0ZVvMOn90MbZh6QEOI
 8L7hGr9fmJyybK5CbROu/8pdlWQ8oxTQdjaWVj+ZoZWGboGJyJQiRBk8dovOqWEQFTJ7haaE4bT
 LWzXvFc2maeNN2TTNIP4dWe6aMcU1cqeHd34I0359GDg4F0tAk71uG+IROXLiV285S+UI/9rOsU
 O2wvcZE/fOBfYkPVnObQr11j2jezLXG0Sd3Bj/z3dqxZhlOIsAFwOxva96Dqdl+7tLSQivDlkWl
 BSus38ydFBVRmPlHcci000Pvp9nrMlyaOiItYxRkTUTxU/3mKsDpRHoVgzyFxPpugH71YZeIv4s
 fpwGX/slAYsiOZrWG3A34W7o2nn15X8oo7mHwqs+XX/tEHrrG3lpyiRyab5WEVQKTGDuYVP7RU7
 r/22cZ/uDnCIIiEArBLIwHdKKo74bk+RoQ9dONbfpnCRDkTB8EH0JkbyGZq4qpECMLzfs+6Fe0r
 Cb4amfkZxONsu67LPsw3vQl5jijhkPQh2Sp3092H4IoEZKJKL5aehOjVYEfZCvGTD6H/V2XzJ/f
 Hoq01hEbBlNpUtWXzQai45dMvRGxDqF9VosRV1lXrIQ==
X-Received: by 2002:a9d:6c8a:0:b0:823:167b:b81b with SMTP id
 46e09a7af769-823167bb8edmr2182443a34.8.1791017139747; 
 Sat, 03 Oct 2026 01:45:39 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:08 -0600
Message-ID: <20261003084453.545653-23-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-platformdirs: bump to
 version 4.12.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index 3e2f4ea59a..a237667ad8 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  6b9f7a12243ab0609a433bcf2f641c6b  platformdirs-4.9.6.tar.gz
-sha256  3bfa75b0ad0db84096ae777218481852c0ebc6c727b3168c1b9e0118e458cf0a  platformdirs-4.9.6.tar.gz
+md5  9d6b65f596852735dcdcb3109127d454  platformdirs-4.12.2.tar.gz
+sha256  eab5f70271a490ef74618bb314fbb86e3c7e82fa3b9c922c2ea0e0a1a155d329  platformdirs-4.12.2.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index c3a7df9037..d3463254f4 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.9.6
+PYTHON_PLATFORMDIRS_VERSION = 4.12.2
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/9f/4a/0883b8e3802965322523f0b200ecf33d31f10991d0401162f4b23c698b42
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/17/c8/721b3855fe457da514fe249247d404b9b39c5d16532278f70ebaa6acf18b
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
