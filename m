Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25984C88E45
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 14:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B86240841;
	Fri, 11 Sep 2026 14:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qVXNrSdxc0t6; Fri, 11 Sep 2026 14:26:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 88C424083D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789136799;
	b=gYcL2fXeWDpaXsbBtu34BLz9KLxW8OI1NNhT4NYBYs9NrZYTRm7EhWmJuHZtNEDaMbl3
	 iHxcUbL4R4QqnkvfUfNykxnDeL6RjnGvWp4FKSuXq+ZJjdlAxisFM+SsXisN5FKn7wQT4
	 0XweNaoKaG4fYoedki+FNaRyL14JRjP8QE4rJ3rxSnlH8sSCN98/rt7W4G0pWLQ1VbSt+
	 kqk6TW85flvhkPDjeCqkVyzEb4zXGI7evvX+AnpTPR6IBJH+5acRTxSEoIsXGKOtIPJZW
	 6uCcsVGGW8+f9g+Lh0jPjzxSCOtRYyCPQS7nyKeCUTTSXjglDPJakadzl/MTBkk1Vkw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789136799;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Sg1Nyg9NPy50v0hxd1yDPQT0HcSGTNJAOBzUD+x6FCM=;
	b=Ae0xAQ7Vz5lUrRyqauwBGHq094/2G0pJ0/a7cPameTrLwJItFWROkdkiu+RqAuU8gCdY
	 HwXP68O/1tp+CnPbbiv1Hz17QMXO8SF57i3YSCRu+ahmugss/si1rMz0KoUvNiSw9U6S1
	 76RpYuGOY+yS3nvpwMdqCwYyowFLcRyorzkdtfA41SpKSyVbbtnJ4LYEhkBNMK+W5T2j3
	 X9uXuXRNQoLrCf2FuICACr9/xAqeayvFBPaJI04eHltWutG+gYtidP20Hc0tz551wq8HD
	 ddxuucutLARxcNxUFRWz3nYIANTd94A5wBGdLfQnTLBhX834+bLLpnG2MrX4IvECi0Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789136799;
	bh=Sg1Nyg9NPy50v0hxd1yDPQT0HcSGTNJAOBzUD+x6FCM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Tsbpjt3U5KAUPXtGHI1SHXT08/MV7ClxVELnBUmEEI02ABEPUIdFOamtCmAMvU/76
	 vE5L11o10Z+SK51YcyIMmNy05tR48RJoxgl074QZLMhOcuZlgFmhr/eLj3y3aC0oNy
	 TgRxQ8jnwE4uVbTxcPYYflUD7qDtYV2hz+Tub/ck8wo/314yIPigj8GC7XnUl6Ttel
	 DRwTMlg4pyUTGTEvP8Ypv2OZfCtukIPbUdl3SrqglXuqUoSLSWvY2wQbuCArKxil2I
	 /ujhvWvzOWZTGgbrf0QJRzPzlmg37RORSN5d4OKE56PdQycgeQoaq0HcEdXs78hcOm
	 U4CcgSbS1jYYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88C424083D;
	Fri, 11 Sep 2026 14:26:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 031D414D
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 14:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E925280F78
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 14:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-DN_IofqcMm for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 14:26:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D7D3080F55
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789136798;
 b=U6fNuAX0rQmPqQa0u2XTn/6eQ0379iN8si/6Gnkn3TlEu8wtWqCxAVWcvG2a18XtpnW3
 CHC+4WnTz4EAhAzC6YY8y+Vt4YUa1HarvT7uwABUw16JIH4yaciDMK4H1g5b5yEwrSFVb
 64/qDxFOorcZGbCSjiDdhvM7kC6p70Vd1QNJiD48vu3L9eZ2G5kz+lTHCpmx4KoKXTxWx
 tFJOP0QTykc5V35lyATC6OmX3AkhvqFhV/9EQHoWs92GyFLrYxgLVGZdnmh36FApofsQe
 7/bIj2wRB7OIJxzAREW5u/Hf3t45Ev7Fly+SHgh2bbFn6ibSbjnqMW6OiiCb5QaMmPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789136798;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=KiUNMKIy1rCk5X+CRIFJ6nRavdGwwfh/LJfhixwr2RY=;
 b=D+0PBT50gU1GbaUjeqgWFitYPRWYsbg4Ke7/iqGYnvj7pd6lkRszU2y6JFkKkGyi32v1
 yaP6ywnnWTNBOPLoRuv5W3NHxdhfnBzeR71JX1sXU6Gq3ibvZzGHD5fqKHyGdk5GtOiVt
 bspCcHqLRbfFNswpeNrrXTbzbWumbs/JewUy0JiNDKwKAHScy5O0NEkb0bQl84QO6DxR4
 MFFmwcaZrFYKhVtjXVCukYwxQ9M0nvmplLJLzyDJNWOSXGv540EZdPHJdpoR4s0yTFQG9
 9dDHqgjmfXGcqIsta10SasWVL/LYiCzSIkT7D0VFvmaEM6bfh52PeKkOspIKhcfcbMA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=C+YUUfUJ; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7D3080F55
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 14:26:37 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c254f9c60b9so75116966b.0
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 07:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789136795; x=1789741595;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KiUNMKIy1rCk5X+CRIFJ6nRavdGwwfh/LJfhixwr2RY=;
 b=GNK36l5UHLTLG1Lt8JRKYIr/ddXWj3jFLwFzJXTcAomPjtVVebMCBfo2pWfLKsOFE+
 mtbRRf6lXnYv4VY1qqH43yLTi7zXDoSFclxOrITrEnpqTaFw/xsYNLOdzCsE+0n6GEPt
 G+9il+wQ+6Ya5+p6y0g7GB0gPrU/QQoKE/RXbv8d3MRHb908gIgmF17XSzkhGIv7yWST
 wC+VqhsKvbmEiYWdCTNcNQIogzU7hM1MDn/+kPeCM8kqwSvlBRNWX+JfHUKKRBf9f0tz
 SuLiW6GTfgGuKBL/xqYZA/SgNTxiwMvgY8+drVcvd/7XguiwWPE4E259WAK5bTR1pZjP
 QsuQ==
X-Gm-Message-State: AFuF++niQYPYoSJh4m/7UxidaDIYd+iSkDueEYPo6YBqD5HnyqUajTLY
 +u35Mb/G7rGa0bjR90Qowa4KnZQnj4eBfp1kewCTjImibs/1KriS1U4LzY7pNA==
X-Gm-Gg: AYBFou1Ez7OAzSDDb3xPFun5UAXnZ8cvLoddzB/D4Vc8907mTIjsajPBusNSIx99JF4
 oFqIldeGg2kNY51MPchvMPVbUl6PrXibf77CH/VPAi70j1FBmfF7JhPZnl/Qj/RiV8DUoj256lo
 qv4BO3vsbe7OBSB+2DUzs40FLh1s3FvEgRZHIi1OV4TP4pmzDk3mDu58VjTmQHAqHcC1YF3D3CV
 +k5rgeoVjX0R/Aw+7KU9h+rdHWhcfnFmvy3nQDxtjC2TJhHK8W7Rxfp5FFlRRjX6aYFEBdmqJVt
 9YqOj3ztWJ8fXJxiWDCa1iH2nUyrmon5bVve5S7l9fIN9pDH2h+kwoXfnhZ2E+blLE+3sTqBBpG
 wyRyGhHcOD7fwxOc+608stozGrPW6qUbUorL8PesAhI04ODbSXh6Z89AbTDX+dllpUngBd0C3OE
 bFbv/h6YUk78rbK/GctG5eudZznIPy+OCLdY3A42FFNs9H07ePqHcXin7oFgzG0fvC2C5ZjY8J5
 O8JnZfuHokv1XD59Ovbk1lYm+X38YbkQryyZfWMg/fqyBU=
X-Received: by 2002:a17:907:1c1f:b0:c25:8b1e:3750 with SMTP id
 a640c23a62f3a-c2962beff28mr249733666b.12.1789136795321; 
 Fri, 11 Sep 2026 07:26:35 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c29660219d0sm83457766b.18.2026.09.11.07.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 07:26:34 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Sep 2026 16:26:26 +0200
Message-Id: <20260911142626.1164053-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/stunnel: fix build on ARM Thumb-1
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

stunnel's configure unconditionally probes -fstack-clash-protection
using AX_APPEND_COMPILE_FLAGS. The probe compiles a trivial conftest.c,
which succeeds, so the flag ends up in CFLAGS. However, on ARM Thumb-1
gcc implements stack clash protection through -fstack-check=specific,
which it refuses for any real function body, so every source file fails
to build:

  stunnel.c:1003:1: sorry, unimplemented: '-fstack-check=specific' for Thumb-1

Force the corresponding autoconf cache variable to "no" on Thumb-1, in
the same way cmocka already works around this gcc limitation, and
consistently with the existing -fstack-protector-strong override.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---
 package/stunnel/stunnel.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index a8eb652bff..473fc81900 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -17,6 +17,11 @@ STUNNEL_LICENSE_FILES = COPYING.md COPYRIGHT.md
 STUNNEL_CPE_ID_VENDOR = stunnel
 STUNNEL_SELINUX_MODULES = stunnel
 
+# gcc for ARM Thumb1 doesn't implement -fstack-clash-protection
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+STUNNEL_CONF_ENV += ax_cv_check_cflags___fstack_clash_protection=no
+endif
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 STUNNEL_DEPENDENCIES += systemd
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
