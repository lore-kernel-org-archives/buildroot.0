Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E526EC27C53
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 07:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D827402E4;
	Wed,  5 Jun 2024 07:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9A6U7PScYIB; Wed,  5 Jun 2024 07:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B7FA4048D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B7FA4048D;
	Wed,  5 Jun 2024 07:06:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B40B1BF5E9
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 07:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 353B540975
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 07:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KAtgNek3CN7T for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 07:06:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0704940972
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0704940972
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0704940972
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 07:06:17 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-35e4d6f7c5cso4036297f8f.2
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 00:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717571176; x=1718175976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8LjR9TMYY0ImjCXDUcWIzx2PTV4/uA0ctfEkMHzonbI=;
 b=oKH1uzLTmtAZy+6yjaD1BKU18BmNMx05Nv/KmmpkwSvZRE2nUlayJzMFjVoNYQbAcQ
 X/G4r/m4ZajfnN4XpiLhKizsbmVPUiLMHbRUkKMX94ULB1ukKqjKIzwOo0MoRTeR1mem
 qY7nwLvpmeefWTDP8j/w8YH8Yr/OtZiia9xMO0F4R4vs08DKuHAnYPNXfA6C+wAMoDCL
 opsOa3NOGclNBRnW2vtk0MccDITHH8pcMDzg5/iSOqn/1uHqyJlGsQ4zbnkCxiGxmqTh
 4beWKqvXzdW5z9mMfB/sqVuKHs0Dj0jfA/v6yMg82TyVzjjD9BZwwS/O1zsSkpxAhUkD
 CAdQ==
X-Gm-Message-State: AOJu0YybstCP7zicRH6nMDOEuklEEsO/qie9ZJ3xvBmm1+frLtR6aSaE
 HIjnxyTx+xH7g6X2q824gqHZiAwTDZX270hJFziL7Dv7KEM78jWShT2vC8SNtaZfEkY6snU+dXY
 j
X-Google-Smtp-Source: AGHT+IGgwm4cCyc0gyReBTSPJOn6dkaeA1NOowqd4SRFyZ8FaeCOWFlF+THp6R8+DV1Lb7y4B6rAag==
X-Received: by 2002:a5d:4e45:0:b0:354:f316:6189 with SMTP id
 ffacd0b85a97d-35e840677d9mr1152217f8f.24.1717571175768; 
 Wed, 05 Jun 2024 00:06:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.12])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04da29csm13525684f8f.55.2024.06.05.00.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 00:06:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 09:06:04 +0200
Message-ID: <20240605070604.2388248-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1717571176; x=1718175976;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8LjR9TMYY0ImjCXDUcWIzx2PTV4/uA0ctfEkMHzonbI=;
 b=ATtReP0TqvHJsRqq6cVELZos+TyheakjjIatkcCDbd2ZM/mF+vOyuFAaI29+H7uhjF
 rlWMy248DDRjfg75Oug3A+wauJN5kHmEsmbUSaBICCZH5xaMB5xFkabBGXP+bef3ZW5J
 reiVaV38/7AfYDEFMXw2AgYCQpsR/DwHbgpV4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ATtReP0T
Subject: [Buildroot] [PATCH 1/1] package/sudo: don't use stack protection if
 BR2_SSP_NONE=y
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The sudo package enables the use of compiler's stack protection by
default, but allows this feature to be disabled using the "--disable-ssp"
configuration option.

The patch disables the compilation of sudo with the compiler's stack
protector if the Buildroot option BR2_SSP_NONE is selected, thus
ensuring that the package is built consistently with the Buildroot
configuration. All this also affects the size of the binaries created by
the compilation.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/sudo/sudo.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 7961a9900248..df86591ac554 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -18,6 +18,7 @@ SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
 SUDO_CONF_OPTS = \
 	--with-tzdir=$(if $(BR2_PACKAGE_TZDATA),/usr/share/zoneinfo,no) \
 	--enable-tmpfiles.d=$(if $(BR2_PACKAGE_SYSTEMD),/usr/lib/tmpfiles.d,no) \
+	$(if $(BR2_SSP_NONE),--disable-ssp,) \
 	--without-lecture \
 	--without-sendmail \
 	--without-umask \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
