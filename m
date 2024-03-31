Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7096FCD1284
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 07:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A69D60689;
	Sun, 31 Mar 2024 07:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yzd5ijwcDTB7; Sun, 31 Mar 2024 07:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 433CF6070E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 433CF6070E;
	Sun, 31 Mar 2024 07:47:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C36531BF28D
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 07:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFA8640585
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 07:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tItDaQRtWn8Z for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 07:47:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 882E94057C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 882E94057C
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 882E94057C
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 07:47:33 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1def3340682so27718335ad.1
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711871252; x=1712476052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=56D7zEvpOoOd1yIL2FX3+R7oqrHAzir8B8bdrU4nCYU=;
 b=gIUcSoNhvqyT/GOwPjuuzk+LSQsBl2YL8Kge+FoYOnJGPRYjSKs6ZV+GUptfxl8Khy
 1vO7GWyqPK8mNJr6t8EFL6VbqiSD3nBQ4O4c/NVBbrfn4Moqe849RKG13qRhHcDcbbTC
 pfnWRxmWEudrzWK9rqatXOPggcOzrQJfobUmkC8z0BxtdHxBtu28wnUeVMMT/ubGBVwn
 1mEoibWnX2d/ikn7wyhEbbK96WOpViAWcYjFURrpaczHS1XrZkqltOp0Q1ZjLNlDTC3V
 zbaufQb1cSAAfx7m99Fi31a2LbBDUUk68gqTWrGW1OD3kpKgt0pQJID1UT2qlxQ7RPrX
 yKog==
X-Gm-Message-State: AOJu0Yx9ReMnIGWs2d64VClYEJAtQwKUS1AhhV5O2KP10eGij2qKkiVb
 oa5iKXf3NI4gbh6Zz+subjTSDCvdMyJouDX7oW1t3pkK1ITEdMypvbzOUZggYS/xrQfg4KvaOJ3
 PPRw=
X-Google-Smtp-Source: AGHT+IG0rDk8vTrHWhIwNDr7AjZU2DASwh3v4HlsJ4WS52fmshYWf4QWrTEojjxPbyfRtTfmvUscaA==
X-Received: by 2002:a17:903:2408:b0:1e0:e6b0:b770 with SMTP id
 e8-20020a170903240800b001e0e6b0b770mr9632117plo.69.1711871252550; 
 Sun, 31 Mar 2024 00:47:32 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 j9-20020a170903024900b001e22e8a859asm4402961plh.108.2024.03.31.00.47.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 31 Mar 2024 00:47:32 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 31 Mar 2024 00:46:14 -0700
Message-ID: <20240331074614.17359-2-christian@aperture.us>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240331074614.17359-1-christian@aperture.us>
References: <20240331074614.17359-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1711871252; x=1712476052; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=56D7zEvpOoOd1yIL2FX3+R7oqrHAzir8B8bdrU4nCYU=;
 b=lphVbzwonMo60Wqf2hwhfGuXF1F+y/FFnVAmON3yWHuFWR7qxyiF8s+FcERStxbgC3
 Zq0gdAuVX/rZi0O4/WfBmg1gVe92EAWugt3/aPwGLMSpMf8ybFzOg3EA7UDGPSg9/WtW
 EoGsLeEjbMHWaZaCwXWlR+Wlkn57Iw849MIKQj09L9YCD+8hywILg6Alyd0COBlb73s5
 Xgh8iZb0cb5lSBwMUAoqY+hPkAj/T6uNKifH9WJKsedszTX4O0lIXdzlpx4vqV/dK1Pe
 jy+WhXyhhKe8+OwJfZ/27UieE2NSkTXpdxk1XHoaQw/2H+8CdAEMqjRRdFD7d2S5ltjH
 CGcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=lphVbzwo
Subject: [Buildroot] [PATCH v1 2/2] package/docker-cli: bump version to
 v26.0.0
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Stefan Agner <stefan@agner.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to the latest major release of docker-cli.

https://github.com/moby/moby/releases/tag/v26.0.0

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 9c8d08bba5..26558814c1 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  72a54d131c28938221c81bd08364459fed9c71c093d4d615d324aaf31de6db1d  docker-cli-24.0.7.tar.gz
+sha256  96ed5d7c33a12f505d13fa03fa48f94cb41cf871178df0df84aa0b76839ad321  docker-cli-26.0.0.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 95fce27ffb..5f9242329a 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 24.0.7
+DOCKER_CLI_VERSION = 26.0.0
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
