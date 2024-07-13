Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC234C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CDA1400BA;
	Sat, 13 Jul 2024 20:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrzg0h-2iAdY; Sat, 13 Jul 2024 20:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50D4B404B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50D4B404B0;
	Sat, 13 Jul 2024 20:05:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EF551BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AC9240978
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5JyfXKHo_bdS for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:05:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8736F40976
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8736F40976
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8736F40976
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:05:08 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-36796bbf687so1654247f8f.0
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 13:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720901106; x=1721505906;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=edUioOH9RUKUIP7k+mtXcvBKzuMC7zSPJ56OCiLb0Gc=;
 b=M8GhrzOuEb5wtHGO2/fBkelXgUxZ07JWqk3OCu7D8l2gbZZxW8voVhs7Sh6ChLtTjn
 JM+nb+8i2pduI/xwXC917olDvd6heHEvV56wb69c7OfRlTWx3BysNvoGe1Au+zc4lmC3
 3xd6+1uKI/Xf8Sgz3ntVB6TiCEDy1ya8S/871p26ThYwhZfo9wMkxK7lt3dhfMNA4ohj
 /0twytTrzh3p3Dg5Ts/D2JHbE1cNLEZZE33zRVFfo5peclzusxzs8gv7X5YqBU/U31w4
 4dFL3pnx9g0mlZizzRW6yig66+IZHWldQUUGd8LqdOqVVJWh+EGnaamMrX+hVlIi558e
 TtHg==
X-Gm-Message-State: AOJu0YxSP6TXXj6SpuPZAKlPlco+Oyk/XxuNItxAWeTODb2zME9OuILx
 Uy7iCV2EnmW81j4qB0A32E4C3b+a0oaMNuxaDog9yl/jFyjo3pPwnJZqtw==
X-Google-Smtp-Source: AGHT+IG3KZafe5JEim2vOGCYqbj9L+oqKfsvypO+nwWbQzsiDe03nWM3JeX3w+EsydOpXDVvYO6Ksg==
X-Received: by 2002:adf:ecca:0:b0:367:998a:87b3 with SMTP id
 ffacd0b85a97d-367cea6b7f9mr9634251f8f.28.1720901105662; 
 Sat, 13 Jul 2024 13:05:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db04581sm2286421f8f.97.2024.07.13.13.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 13:05:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 22:05:01 +0200
Message-ID: <20240713200501.564630-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720901106; x=1721505906; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=edUioOH9RUKUIP7k+mtXcvBKzuMC7zSPJ56OCiLb0Gc=;
 b=J+ZF+aYAxBfFf82M7hg7/MjvWuQQwv4LSgyyK+lT5pLLCbftnu5h/j/oax5XywU0hE
 NUUaWpZZB+BAT/kCHCT4gEukkMSS2+NObbIMzaQslDk2ZfoEIwW6Q8m3HiR3si9JW9kR
 6o07EfCxMsCPyuRC3TLqjFVYJKW6PSsDXJe9rOR7KSUXzeQBdK6IrHOilaH+V+GOFRNi
 3+g8YH+DMqNjypG+JkuFWJQMIxoysXHX6+SPcTzULKeg0S0yLj8aEiz18pcVmnNxYJ31
 87jTzIFkLKVBgt1rCFaQR0FtKrTaDoV/evYy/mNtLlzZhNYv3+74CYTovJSNA6T/VGQX
 Q8SA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J+ZF+aYA
Subject: [Buildroot] [PATCH 1/1] package/libavif: add
 LIBAOMEDIA_CPE_ID_VENDOR
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:aomedia:libavif is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/5F25E3BB-870F-4513-96DB-34FF4FCF156C

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libavif/libavif.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libavif/libavif.mk b/package/libavif/libavif.mk
index b87597995a..1ca3add82b 100644
--- a/package/libavif/libavif.mk
+++ b/package/libavif/libavif.mk
@@ -8,6 +8,7 @@ LIBAVIF_VERSION = 1.0.4
 LIBAVIF_SITE = $(call github,AOMediaCodec,libavif,v$(LIBAVIF_VERSION))
 LIBAVIF_LICENSE = BSD-2-Clause, IJG, Apache-2.0
 LIBAVIF_LICENSE_FILES = LICENSE
+LIBAVIF_CPE_ID_VENDOR = aomedia
 LIBAVIF_INSTALL_STAGING = YES
 
 # Only the dav1d decoder is packaged at the moment.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
