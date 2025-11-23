Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FC9CFA46B
	for <buildroot@archiver.kernel.org>; Sun, 23 Nov 2025 16:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D671B8249E;
	Sun, 23 Nov 2025 16:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NG72Mlajb4be; Sun, 23 Nov 2025 16:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B3FB82369
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B3FB82369;
	Sun, 23 Nov 2025 16:18:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC0D0E4
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 16:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C95366066C
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 16:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkvRMFZ8WM0V for <buildroot@buildroot.org>;
 Sun, 23 Nov 2025 16:18:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 95DD3600BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95DD3600BB
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95DD3600BB
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 16:18:03 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-640aaa89697so4855330a12.3
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 08:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763914680; x=1764519480;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SBShcl9XSs1KAt3InBiSnTiEZqAoR2LcMLvnY/lRutY=;
 b=hPDynv+bdwe7P/Nj03qxmQjNWIXJB05/NzmDBwHGOMG1y//CVUKsbCwyVjlRnogw04
 RtcbKoVIFffzQsFEAEUbJiK3Ia3OEXX9v7HdoWgIhtUa66HPklKoSF1tpFQO+Hq+jSQ/
 KiUV0DxYoFjN/fZm5otV+YeGNNtTbgbdkXsOglkJkWQ+PeShXurYQMkyloZub8c9sEsm
 VP/wegoDTVLQUEJi6BNNoKRUKh1ZTb4vIeg+in8EZza/2xIa1+3t686EzkY5h7cIb9IP
 o9+M6gIfBQMrj9Dn73KSn281obF0jj4M374J8XZqBUqI3KTQLR6a/Df9tOs3/vLg5En5
 gkmw==
X-Gm-Message-State: AOJu0Yzpu89whb3VcfbNERsW2MLYP8cAiwcOls6PA8o/ywL6L9vvqpYl
 ryhBDHH9eGdNNZrnS+F59RtwjC4aTyhOiMz4Jrv5+3EKfOWyiCma8J36URFTozecuDkzqWYCvbC
 UNejA
X-Gm-Gg: ASbGnct4LAuq+v04NTpHCULEmyvqTVyi7YUWlYJpeH7QMNFF+LEJG6vlq1+DIk1KwLD
 HbzlPqZ/N+nDDrMKvTTEUodU5lKVb4ek9eJ/qXney+QGdMXkhVMJdbZ51sRb/cbqTrBrCpcPEU+
 z1eSnQ+v5DfT/jHYU3rqv3WPiSMtwKs9YmZkkt15gtNf45XdVdS2yAvvmdT3VSS9zVgXAWp/1sv
 jsvD7z6x0ip+Fj9eDfSCEUJWEu67MibbZZRYGWvk+gNChpF0SdkoA14xFQK8GPgB+I/NLbtWoxE
 3969S/Mv1/tPPoxceGCVfnamdNhQdAdtkj4WAELJ3FOBSWsDMuKF+eVLmyPxQxfYBViVFFy5XhC
 OAeB9yi3tXlu9n4o+GlIr2OcctEiIrkOAiqgqkF9FwfnLJTw1ch3/VoBmOLfaoftNub+S9rMH4e
 Esa6brrLr8T28cZfO8KITuBcdC6o5lA749vWsAmHyLiz2HQ0BUO7KnKp82Tt2cp0G5IPmNy/Ig4
 ca/3P4ULc/5PCzSxFdB0o4HFpkyBrCkJBf2c4OJyAAYiIwlcZJzQE5NAIYR
X-Google-Smtp-Source: AGHT+IHvst/4B/QpY2x7s0H5JF+aMwQKx2Xybyq6Q9A4k738KI+wbQEwC58k0tEdVIp/LC7lbJNbrQ==
X-Received: by 2002:a05:6402:1476:b0:641:7a6b:c84b with SMTP id
 4fb4d7f45d1cf-6455469c4ccmr7534229a12.27.1763914680089; 
 Sun, 23 Nov 2025 08:18:00 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-232-100-193.retail.telecomitalia.it. [95.232.100.193])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64536443784sm9531872a12.28.2025.11.23.08.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 08:17:58 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Juha Rantanen <juha@codercoded.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 23 Nov 2025 17:17:56 +0100
Message-ID: <20251123161756.574769-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1763914680; x=1764519480;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SBShcl9XSs1KAt3InBiSnTiEZqAoR2LcMLvnY/lRutY=;
 b=otNHmGNIBmBn5Wuuf5HKEJd8+HAeJ8+kJaqR1LWLk6nin/6uNHIBg6KaE8o26vQ/YK
 LKbSl75DWuyxVatGT4Yvtg7uZjzYrBFsIg51nPs8+Y0WScG4+r03XNiqEu8HSsVOlnX9
 C/lQBmcL3aZwGbFjuSvlTQywo4BIQULlbWW+A=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=otNHmGNI
Subject: [Buildroot] [PATCH 1/1] package/acsccid: bump to version 1.1.13
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

Release notes:
https://sourceforge.net/p/acsccid/news/2025/11/acsccid-1113-released/

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/acsccid/acsccid.hash | 8 ++++----
 package/acsccid/acsccid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/acsccid/acsccid.hash b/package/acsccid/acsccid.hash
index 25f894c577f3..ace061010c56 100644
--- a/package/acsccid/acsccid.hash
+++ b/package/acsccid/acsccid.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.12/
-sha1  6d9aa64b195e1b4d72a9b032f8ee70ad0798802d  acsccid-1.1.12.tar.bz2
-md5  34bf40daedd3428c07f9937d4ec43129  acsccid-1.1.12.tar.bz2
+# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.13/
+sha1  35be7ee00b331fd7b4f9b718d39e4f43a1fca5c1  acsccid-1.1.13.tar.bz2
+md5  80a017891884863feccf2221a656d6b8  acsccid-1.1.13.tar.bz2
 # Locally computed
-sha256  28f6075a5494a568ce2fd8666c489f6f4a51599b44fbc9390e1ddb48d3ccc5bd  acsccid-1.1.12.tar.bz2
+sha256  8b19aba103ec03c448b9d1b562c8322f8d2ff37cf21d4cb8b0cf522c5f385c9f  acsccid-1.1.13.tar.bz2
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
index 3be13795525c..9c5e0b13dcc5 100644
--- a/package/acsccid/acsccid.mk
+++ b/package/acsccid/acsccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACSCCID_VERSION = 1.1.12
+ACSCCID_VERSION = 1.1.13
 ACSCCID_SOURCE = acsccid-$(ACSCCID_VERSION).tar.bz2
 ACSCCID_SITE = http://downloads.sourceforge.net/acsccid
 ACSCCID_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
