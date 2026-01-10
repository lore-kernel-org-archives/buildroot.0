Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF62D1A63D
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 18:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F88C40744;
	Sat, 10 Jan 2026 18:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQs82oYZTUbK; Sat, 10 Jan 2026 18:07:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F3114034A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768068420;
	bh=BoF5Pf8qU7inKP9HJ3Ic55DPe0LZJddDXV9zsdNXicM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eoOrpuRfZbZnHv1g6yb/aFjUvGUYI97abaLdIpQoKhPgVc4NOavofdMc8rg7DjbkI
	 Bmk+V01BjZT6ypZHP5WePhm1qGaYwnu+oqMmmiZrKNI89nFADeo0yagCWaouvxibhZ
	 8ps6/1KkKoeDd+GVG9FB9xR7FylN9RLwmWcuKBRoLCUlfdBwwrlC57B0lUKAsbEeKh
	 n4SoTtO+w76EoqHWak5IAcncdZPrPMFD5kILzanTU6Pw+/xJlBD3PqSpTs5Z6DyV+1
	 076Wei9uC9DViK4LsktRT2yL2ytY+XkfUn9XNYKJiLB+vJD9TrP/iaXTg56kqAHGut
	 D6TzZ+NwikYeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F3114034A;
	Sat, 10 Jan 2026 18:07:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D71B418D
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE1F581E20
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSQbMsXuUsU9 for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 18:06:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 47D9F81378
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47D9F81378
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47D9F81378
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:06:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6CAA7A4C362F
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 19:06:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56224)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vedMV-000000007xO-0fou
 for buildroot@buildroot.org; Sat, 10 Jan 2026 18:06:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 10 Jan 2026 19:06:54 +0100
Message-ID: <20260110180655.2221592-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768068415;
 bh=vcl0Y2C7IGK5+rWcaiw5raftDsljnGRlNVyxFdIKe1w=;
 h=From:To:Subject:Date:From;
 b=kNZO5QPswnn16xbPzOjaqDmMQwrjeJiIZdG4SJkHuHRFAVVgd+iB+krSRfzwBfoUs
 fbrbS+ts4j7W5WcDF0OjP3Ofwo9EkAQ0mktWiC1l1d+UtrjmX4SnqIaiqYZHtfzghv
 yXACyEmueJUqjXkUuJ2A2o1D+IGuHmm7sR2voyygr4FImP5QTM8yXAXD2z7kcpGlel
 YVdpbMItPoLQ9vyS5iSdV26lv3xm6zUIdkKqP2PYvKS6enCikgMeCb6cBS+ewCXWU1
 3ghWVb6lMYHlIHUqMrmj4nrzSkfbVg/O7h6iOt9bqsRZQ77tpwsd7WfeOZgxifjxHj
 TpWkoU7cN6FGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=kNZO5QPs
Subject: [Buildroot] [PATCH 1/2] package/alsa-lib: bump version to 1.2.15.2
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

https://www.alsa-project.org/wiki/Changes_v1.2.15.1_v1.2.15.2#alsa-lib

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/alsa-lib/alsa-lib.hash | 2 +-
 package/alsa-lib/alsa-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 8892ebdb0e..569b4887d4 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  7f983ca89ca420872ca16e8a9f8f97fb63db6c1c6e2585b91737a08bb03f566c  alsa-lib-1.2.15.1.tar.bz2
+sha256  637eefd4966ce738da44464494df2b2894e19778fac2f9e7c47277e2af9297f4  alsa-lib-1.2.15.2.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index a4713edf0a..08d96c3188 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.15.1
+ALSA_LIB_VERSION = 1.2.15.2
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
