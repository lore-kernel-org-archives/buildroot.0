Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C071FC021B3
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 21:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7489040703;
	Sun, 23 Feb 2025 21:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZCeXKluAn1c; Sun, 23 Feb 2025 21:14:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5679F40709
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5679F40709;
	Sun, 23 Feb 2025 21:14:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E324943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E016406F6
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nD6Xi6tLLg64 for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 21:14:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6191C406FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6191C406FA
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6191C406FA
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:36 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38f2f783e4dso3292655f8f.3
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740345274; x=1740950074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X2Q3DMWgtpMLDT1czfkUrSVmlPnYryktAyfnVWLP4D0=;
 b=N8wlyl+ZfbzJT11Ah27T/1VC1A8OzRV2JuyyJhbsEjrdjarjyPMKWHPxx/4IkZ6Gca
 BHcn6+Nf3jDHBFXGWUgHLPXuQD2Oed+OAN1ZGVfkTlUJTg5nL9uz+U7l2TQ+GQTP0S57
 MhViQMfTp0OAFatNU5upYDSPIu/tBjmaTUuN2VR3NOuhW/xP1sCwCyTG9n5/4aQbJEnr
 yDsE84MJUtAx4FCHl2NP2BrysmIfRSbk/wBSwK6KYKf3/8oXD5Tx5up3Wt1isuXa3zJM
 8FFygku87eMGZPmmFbEqiS6EGkKEqaNPMcl9A4m93sAYbYe7NX/o1yjuUX2JA4A8aUvj
 0+Tg==
X-Gm-Message-State: AOJu0Yz6TFqtud2D4ZinqR3R05ub+p/J4DYRU60s6qjVS2Y0NgBu7+hn
 WvA88cHIx91Y7zsa3SEzO1Dqt00pbvI2pR8MRGsKsm8x+Dz3K5lzfX1NIA==
X-Gm-Gg: ASbGncvt5a0WMuR1KbynWzxYK0VFaNittI9MPJpea8Vc/VGHvBZIVXCvGLrtAxARatD
 nAnK4mrWGPp/8qEFLadYOsrl0PpPPyaxXYcNVDQXUjdaynT5A4ERDEhZ3/83fi8U4Fwbzk0Cxle
 MIdeQqJQsbm9u7hR4JnVJwLQY2mlz+nExbgOogAvilLM2XoUIhOBkK46o5///yVzMUDW/DRwmb+
 I8svlYLmNAoLh3S9qjcnDJ9FjzSuKkfgrrhP6SuJ9NPryMb7qBWiVRC9I7v+y+KEPZFD4A0lahc
 ADN2Mx4KfDhsotY4NUNqKkFK5ztnWfh8k/+j
X-Google-Smtp-Source: AGHT+IFYLIFORguqSS73Jd/z84Q5sFZv0l9zj6sv/lM+F5gKrhFhqR14+1jMPPgmizR7y9yzim4AOg==
X-Received: by 2002:a5d:59a9:0:b0:38f:4f07:fad6 with SMTP id
 ffacd0b85a97d-38f6e7561e3mr7758037f8f.5.1740345274278; 
 Sun, 23 Feb 2025 13:14:34 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b030be5esm86757955e9.30.2025.02.23.13.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 13:14:34 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Date: Sun, 23 Feb 2025 22:14:27 +0100
Message-ID: <2301544237b610361ab4cec945bfa72ef894c493.1740345268.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740345268.git.yann.morin.1998@free.fr>
References: <cover.1740345268.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740345274; x=1740950074; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X2Q3DMWgtpMLDT1czfkUrSVmlPnYryktAyfnVWLP4D0=;
 b=ZlHN1rTc9CkZfkeCiqBSFEzL05fXXfMZyDE+O1pjhHwg2fg2ASWdotugNJQpHXjIdd
 ouCpzWXowT43zMJGS/kXbtbzTSqop8v+9L+lSqZ7X1I5olja0mUj1sf/QjWV1Y/HJ+D2
 QidnWmKgfYCvEDPLqfz+38lHKjbpOFX+i9jsSn73lz5b6MVDSZ5dWZoqGvC9/u7s2ISR
 KkW43LLPL3nwbk69igfAmExtnG0TuYz9tyXq8vnhwrEsHnBK/C6s+cbUOwusBQRGuwgK
 jPoFdSQJg8ECUf2eOVqu3cpUgxsLtlWkL080a9F+QLw+/7UtZX6H7DyqcJy3jnc14zB+
 wV/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZlHN1rTc
Subject: [Buildroot] [PATCH 3/8] package/conmon: depends on systemd when
 enabled
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

When it detects it runs under systemd, conmon will want to log to the
journal. However, it needs to be linked with libsystemd to do so and if
it is not, will error out:

    Feb 22 11:10:03 buildroot conmon[199]: conmon 3b462ce6f2cc64f75c42 <error>: Include journald in compilation path to log to systemd journal

This prevents starting any container.

Add a dependency to systemd when it is enabled.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
---
 package/conmon/conmon.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
index 1e57786686..ed1a2554fa 100644
--- a/package/conmon/conmon.mk
+++ b/package/conmon/conmon.mk
@@ -18,6 +18,10 @@ else
 CONMON_DISABLE_SECCOMP = 1
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+CONMON_DEPENDENCIES += systemd
+endif
+
 define CONMON_CONFIGURE_CMDS
 	printf '#!/bin/bash\necho "$(CONMON_DISABLE_SECCOMP)"\n' > \
 		$(@D)/hack/seccomp-notify.sh
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
