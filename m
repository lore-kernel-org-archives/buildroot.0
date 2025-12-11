Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4A1D43343
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43CD040627;
	Thu, 11 Dec 2025 19:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ykDXMwcCKWRh; Thu, 11 Dec 2025 19:57:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72CAF40690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765483041;
	bh=YJHHlNSy5FMWis5ysuQjRvqLBJBC59vG2nG5ovb8qLs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mxXb8Gx8/2+0ywepf1/0HuLfxtLUsHBvqGcj88kp8EKnUhMDi520pJljuZXaPwKEc
	 XKUNSoSn6G61URZlQeBPNG8eEmJMDzZiam9FKFy6yzHkV5euN6b+AU9rF8Cx/rJMuC
	 USOsKCGGOn06npNE6XIe4fuQJ561w3p3Kv/odKjYgJ46N/bfEkylGqsQmIMrWUBTFT
	 skEo8pS4Pwi1XuE454oQpyT3EDO7xVTkCV8Ub9Vo/kVd9bqNhw0asxuEbl1vKXXky5
	 hWwyV7nIQXR/SM0+BueS6l/qJ1u72xJR80pstjh4tR1fl2AcaanroGp4wEzd0thAoS
	 PjUBZBo0JctEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72CAF40690;
	Thu, 11 Dec 2025 19:57:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D56DD2C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB7CE606B6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hq3rgHz2oX88 for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:57:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B181260657
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B181260657
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B181260657
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:57:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1D28AA4C3866;
 Thu, 11 Dec 2025 20:55:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml6-000000008Hh-3099;
 Thu, 11 Dec 2025 19:55:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:15 +0100
Message-ID: <20251211195527.3276900-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482936;
 bh=lT4wwqCRXvCwadqlrRwFqBXUHiyBiOfRrBHgXLaOSao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pS9Km0WTMqbFJcRL5/Qyx/jRS1itQpgk10NFEQsoTfP9Qh4E1fTTUMyubSGKCmEqg
 wt62RVg8w0Aactj+id/w/Dze3HJ1hkgsqvUEm2dkm5AYgnmPVFbb1Wk6fmSQclQ6T8
 Vobn7NDOnRvYCq2JW2VXEAZHKggGIpVPP29rY/JES25cNRVUBlDX9wSHGQJ9uu5A24
 lcW1L2sltkb2fFV0/YYRUsTDFdlYVRYzIK2yQTgAFlaEfV+ZhYBB8MByFFyCTY5gor
 1sLiRP30mm0/k9wuizfx+co7Vv38kuLpS3263cacwcpsu1hlueAz5DkgAnFhNMcSTz
 Vu89wHvVdjOIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pS9Km0WT
Subject: [Buildroot] [PATCH/next 09/21] package/python-fastui: bump version
 to 0.9.0
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pydantic/FastUI/releases/tag/v0.9.0
https://github.com/pydantic/FastUI/releases/tag/v0.8.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-fastui/python-fastui.hash | 4 ++--
 package/python-fastui/python-fastui.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastui/python-fastui.hash b/package/python-fastui/python-fastui.hash
index 37e7f0216b..a7a716d6e1 100644
--- a/package/python-fastui/python-fastui.hash
+++ b/package/python-fastui/python-fastui.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastui/json
-md5  bfc873f6ec7ab9cd406822793168ee7e  fastui-0.7.0.tar.gz
-sha256  08ec1b8437653fc37caaf3dae46566a43dbda3f190c62c43f8f3d063261dd1e8  fastui-0.7.0.tar.gz
+md5  0d618bea0cfdaa650efa7f0657abde35  fastui-0.9.0.tar.gz
+sha256  490ae906adea604f6fbb6270a8d1836611371dd304a1c556cad2785474a287f9  fastui-0.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1c39900853b2c98a5c98e1acc10e54ef06ba2693cdf85e8b28e3ede658888d79  LICENSE
diff --git a/package/python-fastui/python-fastui.mk b/package/python-fastui/python-fastui.mk
index 898bc26eb9..82906b1b79 100644
--- a/package/python-fastui/python-fastui.mk
+++ b/package/python-fastui/python-fastui.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTUI_VERSION = 0.7.0
+PYTHON_FASTUI_VERSION = 0.9.0
 PYTHON_FASTUI_SOURCE = fastui-$(PYTHON_FASTUI_VERSION).tar.gz
-PYTHON_FASTUI_SITE = https://files.pythonhosted.org/packages/87/97/3f001410200256026ff98a4588ec8cb4f3b48bc74a28325e32bfb3b08ffd
+PYTHON_FASTUI_SITE = https://files.pythonhosted.org/packages/c4/27/e52de3e3a3dd16cda6fac11d2b5b0ed8a54e14386a303bc8f757275df121
 PYTHON_FASTUI_SETUP_TYPE = hatch
 PYTHON_FASTUI_LICENSE = MIT
 PYTHON_FASTUI_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
