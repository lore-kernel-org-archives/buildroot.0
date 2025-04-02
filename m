Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050BAC28B20
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 04:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 711FE8397A;
	Wed,  2 Apr 2025 04:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_p49ROJ0hrt; Wed,  2 Apr 2025 04:41:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D545820B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D545820B8;
	Wed,  2 Apr 2025 04:41:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0834D6C
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 04:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E234540C79
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 04:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 142X_6PoXINi for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 04:41:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 20031406CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20031406CC
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20031406CC
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 04:41:16 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-22622ddcc35so51723885ad.2
 for <buildroot@buildroot.org>; Tue, 01 Apr 2025 21:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743568876; x=1744173676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G9vzY6/IPYihaPJypwCjKoN5Kz1qCgTZ9FhJii0E5Mo=;
 b=GT43ydhAv5sXlqRhghTV21j/D4+8Q6SYQ4VYhcComvmL86tHP8et38yVZQocqEK9Pw
 /jBLREEmsbgDlSYjUMwFo5w+MPOj2e6nTE1BM5dqc9vcwpHLhr8D1UNL7HO+qe7Qj8w7
 cNd5PZGHWLm6o/VYLlVNL5lSGOHPUdg20NXz9djS8NrO9xMRYIpGP1nsxwhEYIoNzNBj
 rqncdAzWp9wAJE7AXyRorH3H41l4Lv4X3WDdioD/obZo7XFsbPOFSGxX9zJXK+EEo9FD
 VVpFoIf/Hb5PGpwzAutWR2ViIe7PMlkG2nKIkXXici/6ZTcT3Z5RQLx/jVGcD5EoVm4O
 yw+g==
X-Gm-Message-State: AOJu0YwVRyGYNPn9C05Dh2JzECE1xMkM5HbKYhadH2m+xcZn+iJHtWyy
 mq9T8GiqvQsw6420TWaG+d40j5RnVbKG6JdSjWRNsNXGfNWVH3o+i0iKMmba6rwmBTC83FDXSVW
 L
X-Gm-Gg: ASbGnctPohh4M0n0JqLvLhZeA7s5j56aCQndpBDaLYKsrnLzRDLLFt4OmK7RHX661Dc
 xMia83uhLSuwTsRhePGghNjt57LfQOCv4d3K8/XThoC5YcKeO5SQZI9fZ4GCfJppylcOEjko4Kc
 jQu/kzuyKxVcUJnmjRkWc0a6ThUEosCsLdTk7vxXVd/6swvYv+QLGzyLaX2oOi2zuFMK2ZhWNWe
 jWthn+OfG6PQedXXemFpy7ZFJBee7YPqFoGNnMnZTLmZ8S7/nYg/XHhthECTpq0O1QcsOa1VmFr
 qWIyq4MjsribS2mEgOERD91VNCmtEuD3r5h1JAx96DisLkf+TtWRCq4j3TH4mRth0f9x3TM=
X-Google-Smtp-Source: AGHT+IHF9z7Zjt3ACSqhiU3ehMhRDOFYJAwp8IKbxIrfezOFfXGbJ8KX+7Hn/gvoALOeuCkHvPSvhA==
X-Received: by 2002:a05:6a00:238a:b0:736:5822:74b4 with SMTP id
 d2e1a72fcca58-739c7965d2dmr1357829b3a.21.1743568876103; 
 Tue, 01 Apr 2025 21:41:16 -0700 (PDT)
Received: from localhost.localdomain ([94.156.149.175])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7397106ad9bsm9947121b3a.117.2025.04.01.21.41.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Apr 2025 21:41:15 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christian Stewart <christian@aperture.us>
Date: Tue,  1 Apr 2025 21:41:07 -0700
Message-ID: <20250402044107.4128-1-christian@aperture.us>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1743568876; x=1744173676; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G9vzY6/IPYihaPJypwCjKoN5Kz1qCgTZ9FhJii0E5Mo=;
 b=gN5t3PiLYz3OfaQw1GP2Ya8ySzyAAmq7TcIi3VIG94Vls+H31WwNxLavW6XCEEbHtn
 gGGwiHsyM8JkyMX/2qmKX32WP5yWXRI3/OiZFKqS9hmUD4UXOcpHJaMnCmCGJVlIETXR
 1TS/IGzhT+kYRqoUy53B5jpc3Erhw0t9ywwfNypMtWrekhNJK7pKuGNuhK2wiR0Bs+xv
 jqFskN8WHWxG77aVcd+mHyIWgCdAa6TAE/8AY7lm9z43t+lDz1ltfIntWsqw3ylM41rD
 bWWMPGjgbtO2UnkgiSbkpH/kDqTtzcHBBcthHNf36arpOkatHU5H7Vt/pU6dCXtAdPO4
 XVvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=gN5t3PiL
Subject: [Buildroot] [PATCH v1 1/1] package/hiredis: force cmake version 3.5
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Builds fail with latest Ubuntu due to host-hiredis.

The CMakeLists.txt within requires CMake 3.0.0, but newer CMake forces
at minimum version 3.5, leading to build failures:

https://github.com/skiffos/SkiffOS/actions/runs/14208988354/job/39812576139#step:8:638

Add the suggested build flag to force version 3.5.x and fix the error:

  -DCMAKE_POLICY_VERSION_MINIMUM=3.5

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/hiredis/hiredis.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index 86f35bd4cd..55a9ba80ad 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -23,6 +23,10 @@ HOST_HIREDIS_CONF_OPTS = -DENABLE_NUGET=OFF -DDISABLE_TESTS=ON -DENABLE_SSL=OFF
 HIREDIS_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
 HOST_HIREDIS_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
 
+# This package requires CMake 3.0.0 but our CMake requires >=3.5
+HIREDIS_CONF_OPTS += -DCMAKE_POLICY_VERSION_MINIMUM=3.5
+HOST_HIREDIS_CONF_OPTS += -DCMAKE_POLICY_VERSION_MINIMUM=3.5
+
 ifeq ($(BR2_PACKAGE_OPENSSL)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 HIREDIS_CONF_OPTS += -DENABLE_SSL=ON
 HIREDIS_DEPENDENCIES += openssl
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
