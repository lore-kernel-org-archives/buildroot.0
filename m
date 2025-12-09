Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC06D3B993
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4734680DD6;
	Tue,  9 Dec 2025 19:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0GJKbz7xebE; Tue,  9 Dec 2025 19:44:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7330E80D88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309477;
	bh=47xnP1o65yHlaWF0q0OwcVXGtnWcS6KJLagMBGfbJmU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DK2zeiemPTGSzIdTuF3npdPeSwlUHJrstrOdTjBIF0eS/wRmHOFJFXqFcl/tRJP5J
	 hPpkmnzK7qXHRN/AX7Tsh+y4gxupAHIk2LFOezBHGzvE4gZbAb6jp4btn+0KTz96Am
	 E1r6EWYFqrNGqGhpVKW8vMLOhcKDkel14O+40yJdRCKJ5E6M7ZF/bC8ZdljDEF1Rb3
	 iqFzAjvJhH/AeZrX0fcHdiW788e/umX91R4ngawVqlsNZZF3YmxIYDJVOG5OeeSd2Y
	 JHKsZqzme6zpo2fS0Geh9fbHUJwBGS6n+O6n8Vp10G/3b3zzEPUrmconmVSBrqDvFo
	 /051kcPsPOLmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7330E80D88;
	Tue,  9 Dec 2025 19:44:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CFA62C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63C3860A35
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhVTPVhuG1vq for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:44:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5108560A51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5108560A51
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5108560A51
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:44:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 81593A4C2CFD;
 Tue,  9 Dec 2025 20:40:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yv-000000006DN-2suW;
 Tue, 09 Dec 2025 19:39:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:44 +0100
Message-ID: <20251209193951.1000100-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309217;
 bh=P5iE9A95epC4ZWucylLdUJUs6Ke6rnJvR7D1e9NQJqg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VlqX/spevd98X7k0XCCcRJUa4oS23b8Ag6Vdj7uU/6rFrCWUCcAiCX6Ma8cL40wCD
 dYZm0vvRi+ibqy9BUQizLFP9Ir5x1MB+42sTM21zsm2ho1tlKpjRdJ9nM8uvAQdue0
 KpyJo4PKhWrC5RUuWa0CbOdkHqWmXwGLmvBEpxpOYUO+jA6kmXCtzg7Hke5MA4RGtD
 Q4B1pbEyF3SQv9hoQRiqrB+gIDMMvrxMWaqZtyzY3rZCN7JBEIl4O4uU5G1uPJG+ck
 JxotIGduH/AA4eB/5n80MjJnRdOTZKNw3HVxXT1B/rku4+lnGx+xYTO49N01gUmufA
 NL65SdYOoooMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=VlqX/spe
Subject: [Buildroot] [PATCH/next 24/31] package/python-brotli: bump version
 to 1.2.0
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/google/brotli/blob/v1.2.0/CHANGELOG.md

Added dependency to host-python-pkgconfig to fix build error which would
be introduced by this bump.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-brotli/python-brotli.hash | 4 ++--
 package/python-brotli/python-brotli.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-brotli/python-brotli.hash b/package/python-brotli/python-brotli.hash
index e8036d3bb8..ed8eea72eb 100644
--- a/package/python-brotli/python-brotli.hash
+++ b/package/python-brotli/python-brotli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/brotli/json
-md5  908d109a0309c33b626d01137eb4a060  Brotli-1.1.0.tar.gz
-sha256  81de08ac11bcb85841e440c13611c00b67d3bf82698314928d0b676362546724  Brotli-1.1.0.tar.gz
+md5  af164f216cba527bf6f24d09c9d3576b  brotli-1.2.0.tar.gz
+sha256  e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a  brotli-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3d180008e36922a4e8daec11c34c7af264fed5962d07924aea928c38e8663c94  LICENSE
diff --git a/package/python-brotli/python-brotli.mk b/package/python-brotli/python-brotli.mk
index 865c4e363f..e2343a24b2 100644
--- a/package/python-brotli/python-brotli.mk
+++ b/package/python-brotli/python-brotli.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PYTHON_BROTLI_VERSION = 1.1.0
-PYTHON_BROTLI_SOURCE = Brotli-$(PYTHON_BROTLI_VERSION).tar.gz
-PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/2f/c2/f9e977608bdf958650638c3f1e28f85a1b075f075ebbe77db8555463787b
+PYTHON_BROTLI_VERSION = 1.2.0
+PYTHON_BROTLI_SOURCE = brotli-$(PYTHON_BROTLI_VERSION).tar.gz
+PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/f7/16/c92ca344d646e71a43b8bb353f0a6490d7f6e06210f8554c8f874e454285
 PYTHON_BROTLI_SETUP_TYPE = setuptools
 PYTHON_BROTLI_LICENSE = MIT
 PYTHON_BROTLI_LICENSE_FILES = LICENSE
+PYTHON_BROTLI_DEPENDENCIES = host-python-pkgconfig
 
 PYTHON_BROTLI_CFLAGS = $(TARGET_CFLAGS)
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
