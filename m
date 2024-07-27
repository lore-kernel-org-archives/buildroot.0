Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43960C3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 09:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9C6F80CC3;
	Sat, 27 Jul 2024 09:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZMsSncjrqKh; Sat, 27 Jul 2024 09:40:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB3DA80D8A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB3DA80D8A;
	Sat, 27 Jul 2024 09:40:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 127091BF2C9
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 09:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3B324026D
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 09:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezQ0N4iQTl1X for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 09:40:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 980E940003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 980E940003
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 980E940003
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 09:40:36 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ef1c12ae23so23568091fa.0
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 02:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722073234; x=1722678034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GMc5jF6gJlqNHydN27IzQyAV95zTvlyoPLNNtY/6TEQ=;
 b=mD1D57JxLUwzi0x3U8Kv7Okuwq4Bm5x/omP42OOEqsv90usc5XUlK4zhMu7sENk5c8
 UOpToHLiy07JTLhTE6J/cqDDGZg4s1jRO1tG7StptAjyW3jFWWOjpOWzYMb0KwM2fDL8
 JBzi1+WJyklI+anJ5EPVv24smfXxw53aCk0fzWbndC4ABWlPYhE4e93kips7ROM1Hli2
 S0cSSeb8ZBLOw+KUVeG5jgYN18SIIl/Lgcy8XM/ol2OZIUAkbcBbju2KMxP4WhiHMCf6
 81wRQGEmTXke/Ad9Z4cLNzyfZIhduLYREpMra4Mwavjia/dQuImQQ+BhnloGaE8GTMdJ
 PP+w==
X-Gm-Message-State: AOJu0YyD4VR6IpstRZJ1Ry8Ng+MiyWlnwVxVaQ05RorR6Keg1/D9q+9l
 mXFLKarHWxYt/wi0HwzwPC76DsPENAymPADYkez/T1vo4S+fy1kWSkA/SnYS+zK2SPvpBN8FTA6
 jWiI=
X-Google-Smtp-Source: AGHT+IE19laG4TaYzTa62saXdnYfumLpzBJ+SYufRZheodrbWW/apTDS3rdzD3zJwHejII+VYRvn5w==
X-Received: by 2002:a2e:800b:0:b0:2f0:1a19:f3ec with SMTP id
 38308e7fff4ca-2f12ee5ab1cmr14534171fa.33.1722073233626; 
 Sat, 27 Jul 2024 02:40:33 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.5.166])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f935954fsm153036145e9.9.2024.07.27.02.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jul 2024 02:40:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 11:40:29 +0200
Message-ID: <20240727094029.2609733-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1722073234; x=1722678034;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GMc5jF6gJlqNHydN27IzQyAV95zTvlyoPLNNtY/6TEQ=;
 b=hvqnFxikCDeFLxHFvKaUhHeJcer6hxs0uuClKh2ZlWAkUgG6GW3Frk6FQXLiPX1CHY
 StNQcaoMrAcn+u2L+knsiTXrxmLV5Z6rFC5i6OwlCXNzvtzpSaCM1VqaDWmkdRYdVZkC
 /heCaRbYwsMQDwssb0AF6aOj8rBjOaTr/Dec8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=hvqnFxik
Subject: [Buildroot] [PATCH 1/1] package/ntpsec: fix build on xtensa
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure on xtensa:

Waf: Entering directory `/home/buildroot/instance-0/output-1/build/ntpsec-1.2.3/build/host'
[1/2] Processing ntpd/ntp_parser.y
[2/2] Compiling build/host/ntpd/ntp_parser.tab.c
gcc: error: unrecognized command-line option '-mlongcalls'
gcc: error: unrecognized command-line option '-mauto-litpools'

The 'longcalls' and 'auto-litpools' options are added to CFLAGS for
xtensa in package/Makefile.in, but as highlighted by the error message,
in this case, the options need to be removed.

Fixes:
 - http://autobuild.buildroot.org/results/9321a637f2c340ce8dcb24249676bb6c44d0dfc6

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/ntpsec/ntpsec.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index 661af788423c..70c993ba6b10 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -37,6 +37,9 @@ NTPSEC_DEPENDENCIES = \
 	libcap \
 	openssl
 
+NTPSEC_TARGET_CFLAGS = \
+	$(filter-out mlongcalls -mauto-litpools,$(TARGET_CFLAGS))
+
 # CC="$(HOSTCC)" is strange but needed to build some host tools, the
 # cross-compiler will properly be used to build target code thanks to
 # --cross-compiler
@@ -45,7 +48,7 @@ NTPSEC_CONF_OPTS = \
 	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config" \
 	--libdir=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/ntp \
 	--cross-compiler="$(TARGET_CC)" \
-	--cross-cflags="$(TARGET_CFLAGS) -std=gnu99" \
+	--cross-cflags="$(NTSPEC_TARGET_CFLAGS) -std=gnu99" \
 	--cross-ldflags="$(TARGET_LDFLAGS)" \
 	--notests \
 	--enable-early-droproot \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
