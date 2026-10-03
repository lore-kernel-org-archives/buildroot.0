Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F397FCA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 22:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCC54606EE;
	Sat,  3 Oct 2026 22:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v61dVQh-TaQp; Sat,  3 Oct 2026 22:45:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A92FF60688
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791067504;
	b=IwAmytZCcK0qtDYEKaYWIAplXF8pJ2eJFSQl6Zd59rITsNiDoyCPHNqjXlPvjz9bHWyW
	 LZJqz9/VnqxObNl1WOo7H2ph8NeJeYWYoMzx2lPMuL1JNztKcVsVprvNWK/aUZ6j3PB5Z
	 1PBAN4wh7cFGYi1eKip5A5fgsye+LNFVicURkVz+mWGeQ9hF2nMA8pBuUqMAnLCRhKkvP
	 1gk9zavkR/F01kS7MK2f2hZmemSovcvIaKtyhFMsoR1KQ902nbi22/iPG2iWq6XxirL2N
	 C8/oeVdduVp1lV4uv3qGaAwyfw8uZFr105IiOxlaYl4AABSUVxqiji2PS8ykWcGYA8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791067504;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8VVMCDOQ5ix25tp6BPmpSmwXhLGWLWXGkWVTcv9ZRuU=;
	b=DE1e/OKFTF+mxDdSyUZNHuBRkprtnVOlw9ddPuu0RtTbPyysQAyk1EYd0LIY+IB1Yxa7
	 Y8w6Nch2hm4NQHbtWBWY0V9uDQw2Y4/z9hzrMyRIJJN0EQaQmje9VGY6QXJ/mSGhMYDzN
	 8KKPBB7B8xbspw/jy92yqevYFMC9AAkhH6lkLWVCSr1Ewl83l0XyHQF9tWybRYOjzrknh
	 UZPLCNxaGQFBP1pFhQCJfaB+5+Z3eCF0dQfY6VaG2tCZvtMrPEK1jMdswl7GKU+3QZfRM
	 pNBwQ6kkInOFKj2AgyLlVzt97lBBivNExs8QrsXY3h27Yv3yWQWlWi9eReHIo8rL+6Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791067504;
	bh=8VVMCDOQ5ix25tp6BPmpSmwXhLGWLWXGkWVTcv9ZRuU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Ki6l0ivtU8jyMJ8z+3DtzD4sSpnfBKaVhhD8ubVBfDGJFSjBVn0PddfcOobDG6KUd
	 LOXhtnI61FgKj7BYwnDMttfB3LmOUdh/i2ic85IDsai8/kE4JpB4lMAbAU/H2XlnQX
	 wvCxCCYyAsYvypViUNXYdCKjpOrhCIK+1FQ5ulhFZYiI5ThZV7dUNEtZqMo6URqQDn
	 EP2Yc8fi/bmVW9kQ01lmF02hCISN8siIRWB9rT8ELGOxMzwJjKVpzjdwIiYXbKJL6H
	 wI9kmPt++IwCcU8nhKyeKI8aSzxEaRBbz8xpA6w3njKSGC+shpWqqhUPDbkR6JdZVD
	 hWHOU/O4VpMtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A92FF60688;
	Sat,  3 Oct 2026 22:45:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33464282
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D9A640C9A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 91USsC-mhge9 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 22:45:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C917A40BF1
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791067502;
 b=cQsUS3VeTTyYFBIac5/pgcGLB45RxIMIJ2zOgCeycQE/BlL5nZo/GBt7t0mPFv+KbHdF
 VN/0VgJ23Sy3py29zyWJMbC3Kowhfh+JMCLM0+j1q7K1qvimDCh1WrLXUU5E3KBfn8Lpy
 g5NmS/jYTrOVYhgPf7yXTCIPlUYi4oJ53vIwe1qnDYGU6cVxMOfebFMmxGS6dsgW3AEck
 +Jy5iZpWh8u59KuchyHLv1MtEPSpsUqeuJ0AYXhxrLrKbWrqtzqrE3Lo0gWYrXUSY5/s2
 8VHwLfrslYLInTJrVam88tauckYj251FDmrK1PaPtTW41eekNkvtGCokI51GYh6tA0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791067502;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=GgN843Pfwd06VSYdcu6FQHjZd0xP+JzNds1oHvx+aRE=;
 b=lxQonlV1M5b3z6i0E+Si6ASSo8rZ+KPtKgzd25mruO66Cx88fx7aWyhRAL40tYg11wUm
 T989D12kQztAhjbvVbnXZvha9lQXE2WAuzdlVRajt8ch1LWXcMsTyIaUkfDT00XB4PcCW
 gKeoTUF+NJtJ5seIRcGO6BcBtnQdHmj/vk9kHYXgWerwj3iBb7wADpa7QQdQA2TSk0QGt
 tgkk3WWyF1ogxknYY11TMNk7KkGaB0kVLZfsXkq829JpVcc1E9wGMOczBThvk6FK4r9lJ
 9+ldTtpdu9eBA7yQg8S8TrDqRfHdpiDkqCqM/yQ1qxNgEgqsbJ6z9DjBzFQcj4yXv7g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=TTZm+VFQ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=TTZm+VFQ
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C917A40BF1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:00 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-82480e2d376so201284a34.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 15:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791067499; x=1791672299; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GgN843Pfwd06VSYdcu6FQHjZd0xP+JzNds1oHvx+aRE=;
 b=TTZm+VFQa+KlhLYG+gRyVbQAr5r8/j+RdV3UkRg5Kx6Sjy46Q7BaUl61Y1nA8+fdQg
 37vJpL7ke9kEseXsOfwQ7YZ30p1Og7ViuSUHO28B+3tpDRLVZm8EA9MIpd6qZyGb5tvP
 Z4JBRMdXFJT8YDNJlKqkmPQGyDVdSl2wANOAz9Wpdz2B14z8LqTs91R0Ak1VcP8a/BPr
 VxEeCMaP3uSSU9FL1GYf8BRJOCSMpBAujZdIPBEU/lg8fj4d7Bm7Pqp4Oqfzs0FPOe4Z
 MiM9i0xhmj2I3cYtdVwFKjBBL4rblK9+J3N6TXlXZ9MeRsKU1eolUENixX9y/ahvArzp
 IETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791067499; x=1791672299;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GgN843Pfwd06VSYdcu6FQHjZd0xP+JzNds1oHvx+aRE=;
 b=OMD6kViNMMFQpcmDA9SsQCm5FDeZ1EWOqR5klXCMhv7kUquqIFNAQOhncKv0s1UfkD
 mjvV1YNsRVBRUm0hd5M+N0OZDYebmBYX0G3qd8Mdw6CeTWSv3d/wXaxQ/wTq/iD6Zpd4
 gsW/KGzjGRP6CYWzlfb+u2RQltL5h6RteETZxzXdew4b0QiRLD1/Ee64v+kkAhp8S87H
 RSwkA5cAy5KQZk1D1Kvj3rRHmWc49dCBBED1e4zI9mm6Ai3X7Sv2QYtfGYgRANdQXDgn
 H9WwnLhFWufU4i8cbBz5oY70xFC2sG09XAS4L8ULofAwOUZgDMoejDt9fLOfMEeYCGiU
 iNEg==
X-Gm-Message-State: AFuF++lfGRbqUb9UEnS+cKpCuHJtUnA2kXdWLFgOMu9Yr7iFZnHXNcL9
 R6lEm4V3XUjwXz31q6hFdUkSIKowdOokzsN82Ct74ycKFBMqKvuodEDW6NYBTw==
X-Gm-Gg: AYBFou0kng3TcJSNuvDIIqBUJgIDcHIn1VYamqiJB+uaxp1ssdbDna8iCtnnbyMtiQD
 uZ2WAfK8roR+c4MiX4Ud+f6M51rcaxMN7ek3nTHDwctbNnhdYH/U3DQ7qPs2wpZVAQ1RIvRijJ5
 ljrik/c6GFXuYZ/vvEnqwGvmzEPzMkL3DRUn7VsmGNYlvLsWlFzTzkQjqCfFDyeBcMpdwwE+iAj
 3MFWEL7J+P5jg7MloJCQL9vy3aWONtDwFCIUeV4GYrvmGOGPdFBzSpjrVe6gzoBqrzF9aXnYA1l
 VujQBaUSOi+L8K9vDkFeVIZhLULVqYLCDx7DXQad9rQiOA6tuu6gmnKBLlRi0gK3tLpOK4EUThb
 VxneayJk7219/8+iLK/VJF/dC9O62nQUCPO4YIFM93eAR50e5SfyZG653z2CU63y6txGbUfT0qP
 SM1yM+Ha8QTrNmNxSobZS4V7AiZyg0e4GYHFiypcyu+LCAtsbrSSJQrriwOWFnn3DsE0tQex0Xs
 F09rt0yfd49j/3R9uZvIPu/MZDYT+2aaNWYh033iBxEoQWi03lhZcgccI50gmSNlpI0sjoO5Ks/
 HCgGxLN5szVmCbAEiApkfnerClaB4HS8VJ+PdsFpP3lr1kKrAASusSkgs8WlO8d1nIBp81ADuyX
 TY7b7kbH+e0WgDpsLdnHOux1Vt2TTr4q97RX3KjhpLZU=
X-Received: by 2002:a05:6820:180f:b0:6cd:3fdc:a93d with SMTP id
 006d021491bc7-6df3612d9d3mr5468856eaf.90.1791067499322; 
 Sat, 03 Oct 2026 15:44:59 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a36943bsm7262522a34.19.2026.10.03.15.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 15:44:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 16:44:30 -0600
Message-ID: <20261003224447.744966-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-opcua-asyncio: bump to
 version 2.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the hatchling build backend.

Add the python-anyio runtime dependency.

Add the python-typing-extensions runtime dependency.

Drop the no longer required python-aiofiles dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-opcua-asyncio/Config.in                 | 3 ++-
 package/python-opcua-asyncio/python-opcua-asyncio.hash | 4 ++--
 package/python-opcua-asyncio/python-opcua-asyncio.mk   | 6 +++---
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-opcua-asyncio/Config.in b/package/python-opcua-asyncio/Config.in
index 139238b5e9..e51d9c1aae 100644
--- a/package/python-opcua-asyncio/Config.in
+++ b/package/python-opcua-asyncio/Config.in
@@ -1,13 +1,14 @@
 config BR2_PACKAGE_PYTHON_OPCUA_ASYNCIO
 	bool "python-opcua-asyncio"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
-	select BR2_PACKAGE_PYTHON_AIOFILES # runtime
 	select BR2_PACKAGE_PYTHON_AIOSQLITE # runtime
+	select BR2_PACKAGE_PYTHON_ANYIO # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	select BR2_PACKAGE_PYTHON_SORTEDCONTAINERS # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  opcua-asyncio is an asyncio-based asynchronous
 	  OPC UA client based on python-opcua, removing
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.hash b/package/python-opcua-asyncio/python-opcua-asyncio.hash
index 0bf137ef95..6fbb632cde 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.hash
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asyncua/json
-md5  8c41793e873928027dad4da9035aaf8a  asyncua-1.1.5.tar.gz
-sha256  d5edac9234fd7f1ed6a923fad1bd709bd0fd3f8a0d41637d645666620375173f  asyncua-1.1.5.tar.gz
+md5  0e7ce8a935969d74a4e14147d4514c78  asyncua-2.0.1.tar.gz
+sha256  f9f73804b4d56a12aaad7a2f062b15f08c856718d93a10c647d82a9f38f787df  asyncua-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
index e7da7482fb..15a5e9b525 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.mk
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_OPCUA_ASYNCIO_VERSION = 1.1.5
+PYTHON_OPCUA_ASYNCIO_VERSION = 2.0.1
 PYTHON_OPCUA_ASYNCIO_SOURCE = asyncua-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
-PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/49/be/be6dad2b7db58fc9e92260fa9fdda8604841f2863d60ec2c49dccb1f9661
-PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = setuptools
+PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/d9/7d/14830444700e18631853c417b05472c7036cd266e90866e8d0ae4bcd7c72
+PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = hatch
 PYTHON_OPCUA_ASYNCIO_LICENSE = LGPL-3.0+
 PYTHON_OPCUA_ASYNCIO_LICENSE_FILES = COPYING
 PYTHON_OPCUA_ASYNCIO_CPE_ID_VENDOR = freeopcua
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
