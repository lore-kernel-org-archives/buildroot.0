Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE6CC982CF
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 12:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4711280EEF;
	Thu, 17 Sep 2026 12:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kvx5c444t-2T; Thu, 17 Sep 2026 12:52:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3FAB180E9E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789649572;
	b=AHNRSsd9ED1jGVkgxXTgn8IgfrQRvuGS17C5eiktBHZCb/Rxl4RUTeXPQ4TJTqrR4F6o
	 mH0lnDyRjZ1P6ZKn2EEHOchLOpbuW1IOuDBm3+lK7bA/FeRn1kQW5wZicaZMSQ6ZCo5RC
	 aaK/9k5oAAxUe3A17GI+lbCL19YorsSmFeSeheXUB0Eu4egMq0Az0/d9/eST5ul+6iRxu
	 4ps+5hxwTsI61cGF4WrHmu93SX9Ma5kf/ArfmAWto9zuuT+osm62dbNhKXYOwo+3N/xl/
	 BpUZYKdVmslCy3m96HmUoe4N5mqABYReBVWDCuF4YubPr3q3UbFPfNQfBc9x8AZ+0sw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789649572;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QNHeecvBn3ck9mQ4KhHSjR+2TlLT5DzXjofdXHvQH74=;
	b=Z0L6FI8oyF2LzctpE6ZzJOM/mbwXBknlAdzwUPMyVv7au7gVqF55cMQafNrwsBf5vOuZ
	 Q71ZEKRgIFmAo7YOJt0nwySIj97eOP+a6o7WL6XRQRt0jgp/OQdyNzYFhrw2IpBGFDNFf
	 CWZeO/TDMwYEHOxTpHN7s7iTdXKXqtKjtrE0UgzzoLwks31Vz+VdlNPjbrCPpxrrlZgUn
	 xIcSUDHNTI0uQtSvr1BbP9fyRqe7Ff8xV9xyUSPrMwnQGg7ZehpDTJ9yRAC3CrphSypCW
	 1KzoEUbL+C8sDdtytGjRc0ewRjhJ4eXh4igaufEh+dT6dfgIBZnMp8WSK7mKpnpbIwA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789649572;
	bh=QNHeecvBn3ck9mQ4KhHSjR+2TlLT5DzXjofdXHvQH74=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=YE90OY3UHp705QdtvL9azNe6OOaq2498XdsCc6gVLZ5Ek1SBaYcVHqmxOGkTPZv4A
	 dX1rjJZwvocyXPQ0yf5x4zQzWIU8IH2SKAFepAcPCAp4OCaGBaZUmgYkeLLJDjTr5F
	 WEd1MPjiAIZhIZjbmma3X0j4uoFy762eVR+QdDit2CEd/bu//M8sMTQXsOgZOFKsg+
	 wZ6b3V3XZOVFrDd1Wz7irBVOqBYX/nh5MX6jyvZCPwTqouH5FdmjOJqs2IQaiF8U1p
	 e8BUY9bK0zRXRw8Qrq5FOYHyXTybgncrI2eTkJgP9Q2nsbSKKHQTyd3b0jrfcpBnWn
	 zlDDU1NQAxnCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FAB180E9E;
	Thu, 17 Sep 2026 12:52:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D6CE465
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 12:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F92940355
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 12:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JLYcEvCyFwjO for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 12:52:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D6B6340346
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789649569;
 b=pnECrpbL9CvMAtY0a0DdCO4uXi/PBlr7ZS7I5iAM39oY8mNiNBk1d6UWY7H3urrtDOkZ
 nVXQLFsGQuAos1m06blT5AwuwMR9F4KtVGTKtjLl6NSm2tZ8M0FON+ICKYW822a1S0HdS
 9/SxrO0iF48MVN58BO6T+L5BGz6aWdEx4VTC1BNQVQN4EAQf3SvH+wK2+vaCk2CLLWrfB
 Q0mos7YVs5PgMEhnY+pV0pnSAJ3zbvqbLiyOkDEz/rFpFazchzDo5Nnoe3mSH/vpIZcR4
 OxadczZe+zg7G71AQUzMf7ZdNFJPO/sEnSXYUD90UYnVCn8FoVLU3w1gpWBNP+/34Bg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789649569;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=ARljHOBXyoWt7AkNZDbfFB8rbGL13cLxn9gEo3c4frM=;
 b=Q57j+tOQQKZaYNnf/U346jj2Ow4nP8fWv5uLQTGgRxwbBRwNnrSuODAS4or57vvUlPaE
 VEeI6dMjJMtDrJSGvHoZseAKqyz3KpyvKs7CRIQcZjowmYyeDP3ahI1M33DVgYV1K6kek
 fsLe/bZtPnt4EhROGcTQO+d36YBbyCLNKqYkef5ghlRMnAS0xsTzaavwf6dbSgUtwWr7v
 LGQc4zoDNLoRP9LW91Cx0GRE/72k1WBql+nzFRvy+4LWTXTiNaZOd4kgcg+weOTjredQL
 AolQZl0o5wRYNFlPlyN3c7TBoKHjx3/7ZD4m+KXDQe6hC1BA+JBkPwl0kjKbOgZE0Ng==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=KZNJiOM2; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6B6340346
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 12:52:47 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c2940ef15c1so98841266b.1
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 05:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789649565; x=1790254365;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ARljHOBXyoWt7AkNZDbfFB8rbGL13cLxn9gEo3c4frM=;
 b=kAKgjgRV1YYL8zS4CMSSNO3Q/MYTc8YzsDZuDMmQs8CBYkXbzX4Z2ITbVyszXk/8hF
 MRte3gWICWlO/lgvKM66qFB+X5faGReXZujJkg3+C4hWhgDRHI3Gew2cTgwUbRUoRcJE
 C4+pu/zTxvZsR3WFdCyZJYLi1ODbYOx4Y0sh74+TJLLoJb8o3wOK/OHXR/kHrCdbuns7
 E0l83Ge5hvVRgo/3uM9TtdZiNH1c5Tb/+98CMSdbVqR6JW2Jrh4z9wgGQGZqBZE2tN4S
 brBPV8ECvFPqDNz6ArIQ0IqJ+ZMtTgE2em3ERAU+JpGtPE2epSBnNwR9bu70mJ2cU2je
 I+wQ==
X-Gm-Message-State: AFuF++lhHig2EiK6yXyY1+FwXZH7jhEYo0xaG16mcKYypVzHqXwzmVYN
 iC/HCwsWMIT0FZKrGrnTCgV9uADfikyMmPQe+YTODAcRT70MxPeSeAaBb4uX2Q==
X-Gm-Gg: AYBFou2cEv4bUuGXVMCfYglqerqtp6cO1PubohTMirdrbnwD3YSfsSlbkZjKA4ga9fS
 TUWuoDr95XC2RnlJh+ayyF9gGth56TVa53p5Utyi1+/1CmcleYOtt9EWie2OMSWdkBA8HUj7kuJ
 2q22ZtMKsFTAjo9ls4wuB/jSb+mhHSmNQDhihRJs0wWiR/E6T7mHmRQP8FiVpRPRzkujOnkV0Z1
 QMbB4x/rHwV04Q12E+AsPgifSuTnQpymwhkumkSTlwb1KU3J+7WeIH9ahzMa2jDaSEJemWQR8pr
 AxuZyGEHxnf0NLZv1u8ZVV06iVolYVo08fzBoRRYtMGNx7UdLd5aAjH/F9SJWm/hqXm4ok9amLU
 NaUGk+AnO7FwQWtwy3sKb02h6fWRzpLJOUfYJiA/9FLFQzURQUCm15Mujf6KBlfA/uPN45el8Ll
 jGuJHf1We0cHkg8Ln26U/LGNq7wR80Nck5t8+jIIqmBSNvHvpQsIZo6KvlcWgGD/89+gDnAv8A8
 3z7mfuDlyzAhTSyzUGUbjTkTLBx1MW79OdoAlRaBWnTdGk=
X-Received: by 2002:a17:907:1b18:b0:c26:19e3:e98e with SMTP id
 a640c23a62f3a-c29e534d7bamr437068466b.46.1789649565055; 
 Thu, 17 Sep 2026 05:52:45 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c29de454038sm288652466b.18.2026.09.17.05.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 05:52:44 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 14:52:42 +0200
Message-Id: <20260917125242.1307618-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/stunnel: fix build on ARM Thumb-1
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

Fixes:
https://autobuild.buildroot.org/results/3d691184ba83ba4d881632f2b2bb4da5aa50f491/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---
Changes v1 -> v2:
  - add fixes tag

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
