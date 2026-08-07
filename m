Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D935C5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 00:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBD09607F0;
	Fri,  7 Aug 2026 00:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IuupHnnrrDy3; Fri,  7 Aug 2026 00:20:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A588D607D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786062052;
	bh=rlbWuQMhpv4H/zleyei2fnqhSl1O6EXRpc9YZ78X7vQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mAmzgOYQopAN6LQi90cRE7OQoD/k5BxgNkzsEdYB8Dhw40WZudbGdmwVBnIgyLjj2
	 siJTaY/+QtE4oduOtkmVOAPJs7h+YmDgf+5oMjKhGyBcNY35I9vIWB+CUzx57mDtCW
	 z3tg4wvck2cDR8B9AKBE4eWd0YiE4yzYqzOoabQMlLrz/S4pTBrfH9aKQKNWQx1sCe
	 5LPZiv2ebK7vvnPNjM4hw0PJIEiUmsaaiz1tb6cXKj0N5YF/J9GHjrOMgZDFgz5pSw
	 0gZurr93Ka6H9NPnlAoSW1tjrSMsVQpzChGSoBcxK287YD1v9hKw8zDozHNXbKQNbB
	 vPh/F61qbWoiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A588D607D6;
	Fri,  7 Aug 2026 00:20:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DDF6392
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 00:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3314640313
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 00:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQ8w8OGYp1Ut for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 00:20:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com;
 envelope-from=alseycmiller@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F23C4009A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F23C4009A
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F23C4009A
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 00:20:50 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-51c16ac21acso17950111cf.0
 for <buildroot@buildroot.org>; Thu, 06 Aug 2026 17:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786062049; x=1786666849;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6w8vNDtMgAahRkPK75mIbNnRJTMPeYN1J425jdS6X6c=;
 b=l3Fq8fL4PuQmfN2D5AYqYK3xwXnciGjrEEoQyjE4CBb74h7mAmwx/mgtRk3441nmac
 tSrKA0TMJYg/Q+S6yrmrWNwz9iy+0O0tg1pBSRp7iRKaitTgu0fLpScOqGl57w/pJB/+
 4Fs8JcicBtQCdTjSCKLq9IW0W/MGLdTeeLV1o8KDyUM2068s4UpUmqmCVq/QUaBWvR0S
 f18CDBqcVhL/BRkdwoq+0cFhrWJH0NhPKPiMolukdIz+Shq4LdKqziI1ZOv+i04lyiLB
 wDkfPpCP7IygKgLRG3yRRlt99p7yBHqNA4tjJzdhrITvuO2FKJUUUPIQThQKN4RWkfdu
 zaMQ==
X-Gm-Message-State: AOJu0YxHhyqRzf/mHsfwLz8zhqh1OvaPIy75pOBIYqQEBGvrl7vxDgAx
 exvvLoJGH4+A4+nX7KLFxb1uVUAkb+4+X5V9r88xwc89tS7LbdluobCzj5JhNA==
X-Gm-Gg: AR+sD13578FVJrLieuQ5QWJn+3JjCg+x+dXkeKcHmUuA2QtVI/gGtH7ypA9AJTEwrwH
 ks+jQNEPSOf5ARgE6h4KW8uVwkibYXByNHmvU3KBqvWAynCxzSZ8AME/dlfwMWQtWWLkmuzOVtR
 aORjb6fia3B0pqsIlccKzRgxQwJjwXUuNMl5UKaYgJnL0cmXetPSQQ5epNtQdgG8IYFHYU0/wzN
 gDDWJvisp18+3qitXuZf1Fgcvi7PkEepQ+OSP4iRKb+TtdnlrndXpUP0/WcmiUJaFMFgP77HbUg
 bV4ORv/5DLC638gsMPXTmjmFctAAfQVu3reZFpsKhyggFNjgpUI3ePn3u9/p+rJCY22SlDtT03V
 o1vJvljJlsjaSNfn8aR3NHJRBDkgLMVwlzKagoJ+CN8YFlowyoAG9Lv/aIPJZoP1QE27r0BS79B
 9gFLKnCem1MRV37ZbRLWHojSW2A7sidY6fUz//UszeSS9SgiJ9V4IfL2i74wacvLSzlnHddm5CZ
 h1sFFQqXcx3Pqb4
X-Received: by 2002:a05:622a:488d:b0:528:3c2c:5c72 with SMTP id
 d75a77b69052e-52ce6130a25mr214716671cf.32.1786062048836; 
 Thu, 06 Aug 2026 17:20:48 -0700 (PDT)
Received: from optiplex-7020.tail176fc.ts.net ([67.21.186.162])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-908800cabedsm64387426d6.46.2026.08.06.17.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 17:20:47 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  6 Aug 2026 20:21:09 -0400
Message-ID: <20260807002109.2479876-1-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786062049; x=1786666849; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6w8vNDtMgAahRkPK75mIbNnRJTMPeYN1J425jdS6X6c=;
 b=hpEk/qjLvkhipLB0CQmRJVzs9OJrhzVl9KJuKMBlfgPLA4EIg4EK4BHlwaWkz5RCr3
 ARre+rO3zQx7alUYpo+BNCtFg0WAJJXr9LrFuzZ9D729ZjVPzpPwuqHxGU4/zIkPmKc4
 SJgoNCJx4NOaL2Oaw+TymZvya7u+kRlQYnrZbeXEfdreByr8bbFYSPgaUtnEix6lv5uD
 FfkcyH+fuMuekmfvbMuKXta4N2u6fzdNcq7M8Tqb3/zpXRXoslmNyA9+Ri0XttXU9eED
 eeHzUf41CbnhJAb1iBoukAkTPBG1rPbG57rASQSYi8rOcFgLi8rzI06xmuu7YYS+mdKG
 DxoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=hpEk/qjL
Subject: [Buildroot] [PATCH] package/libxkbcommon: build libxkbregistry when
 libxml2 is available
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

libxkbregistry is the keyboard layout catalogue half of the library. It
parses the XML layout registry and so needs libxml2, which is presumably
why it was disabled unconditionally rather than wired to a dependency.

wine needs it. Its configure.ac requires XKBREGISTRY_LIBS alongside
wayland-client, wayland-scanner, xkbcommon and linux/input.h before it
will build the Wayland driver, and wine.mk passes --with-wayland for any
build with BR2_PACKAGE_WAYLAND - which turns that notice into a hard
error:

  checking for wayland-client.h... yes
  checking for wl_display_connect in -lwayland-client... yes
  checking for wayland-scanner... .../host/bin/wayland-scanner
  checking for xkb_context_new in -lxkbcommon... yes
  checking for wayland-egl.h... yes
  checking for wl_egl_window_create in -lwayland-egl... yes
  configure: error: Wayland development files not found, the Wayland
    driver won't be supported.
  This is an error since --with-wayland was requested.

Every other term of that test passes; only XKBREGISTRY_LIBS is empty, so
wine and wayland together could not be built on any architecture.

Gated on BR2_PACKAGE_LIBXML2 rather than turned on outright, because
meson.build takes dependency('libxml-2.0') unconditionally once
enable-xkbregistry is set, so a target without libxml2 would fail to
configure.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---
 package/libxkbcommon/libxkbcommon.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 21a2b937ef..406affe401 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -12,8 +12,14 @@ LIBXKBCOMMON_CPE_ID_VENDOR = xkbcommon
 LIBXKBCOMMON_INSTALL_STAGING = YES
 LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
 LIBXKBCOMMON_CONF_OPTS = \
-	-Denable-docs=false \
-	-Denable-xkbregistry=false
+	-Denable-docs=false
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+LIBXKBCOMMON_CONF_OPTS += -Denable-xkbregistry=true
+LIBXKBCOMMON_DEPENDENCIES += libxml2
+else
+LIBXKBCOMMON_CONF_OPTS += -Denable-xkbregistry=false
+endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBXKBCOMMON_CONF_OPTS += -Denable-x11=true
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
