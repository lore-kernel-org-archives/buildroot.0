Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54207CA601E
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 19:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F15F8109E;
	Fri,  9 Oct 2026 19:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efgcCN-_3oxD; Fri,  9 Oct 2026 19:47:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 35FD6810AD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791575248;
	b=ldNA6SLtODC8Hi7+UxheKs7ECzSU2g5QK5ZKlSkV4aqOISjizBNUaWc1Y4Eru/4qgazc
	 OUWUEqrfzed+BIphkpOLKORJikVGIgCTXRZyu9esofAwCx7Xgqxk023rFxmgQAPfmnz/z
	 jcYbjsJ0BE4f5l2vY8emYswxaX4z3HUmJQqyRwkrMznL7cZECjTCwNHx9zL28+g77605Y
	 swM1vhe3PT0FKRPZq9i+G8COfDI99sH0dWRte9D9o0AWaJE19BGj2k7Bk9YOZIalyNQU9
	 R5lkqOyvxj4Npfcpd4IaaDCWhllURZokAHYxF0czek9p1WmGl/iudox2cYDh+y1Fz9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791575248;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1HZ8foxBFF4RWmHSe1cT9E77xSg84dQIoGq++yY0Cho=;
	b=XHS7U9u2xDrLv7DWwB9LUmy/o7Q9H4mQ3dNORTini/vn8JPlC0bsjZz/Bj9gL3/tNInA
	 G11iSQGPCT9V/gNriAHn7kXGAQPCDoysc8Il+A2/xa+8AxOab5d+FOzfE2/jCUPCNS9AZ
	 vpE1p/BctoH/GPDM6UDpHqS5fkII6e7nZULK+orxtfVTQtICJFxahy4z2t5/xu9TDQ0bx
	 33XZxDVe20AT59HcmWsH4tOJmD4TOfcLo2iEdW4NfbCIiEw5OuR3nqg/+AhET5IYtG1hL
	 jimaHH4krMt4eg0YLd3S4jJ3Wcb0err/x/0EgvWUqHDZhp6tFCMEnROCRWCwRt7KBXQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791575248;
	bh=1HZ8foxBFF4RWmHSe1cT9E77xSg84dQIoGq++yY0Cho=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tIK9tkuFLTymI0a1oCbNwvMc/ffs08CYwbtaSWedFgM9a4zpq+JMh+r+ulWUdkRHW
	 yKuPjsK/k/QZltX0XI2q+9ar1CUFan7W8p7x7WmxM47q76U051jNAzZ5JLkavHaFeH
	 UocdAMu8SPL1k1Fz9dKafWQz9KfMrDLxdMgD9BOplLsjWCgat6deuI7gw4UKUPLfT1
	 OtAg/EasW9CgGkmUWFqpspBUojibckwiRAyXUXqo5esmGW+8RyDpFKqwbgjM42T77h
	 Vew+/DI9CtrUJywozm7GDy0QS+u4o+dgX5fGGZxEUeVZ1qw2329FtWMQL48mS4UbvU
	 D+vMqgjkhrD7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35FD6810AD;
	Fri,  9 Oct 2026 19:47:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DEDD2317
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0B316061A
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ToTc3XSvINLW for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 19:47:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9FFA560616
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791575244;
 b=cNTOdvypSorQb9egr9zjAXJPY4kB+k3D2hVQqVI6JQX/iJMcVI2NfLXBNS7fcQCaigeM
 YFoWqLExXq/0qXPgaz8WVYONCxQqlMd5+ejuUsRkEWYuFFI1bXrEOiuWOZJMylRRP6Nfn
 R4lfjjfrrAxScdXG6a2y30EEOK7R03WklQff6mkj5nhO7Zpy1YNX2kjT5VfQo1YzCszDM
 Og07NkLxzuXhrr5Nw+6f1zpmfmfYk4M+hct2H0rsYEvoEaC/im8WSbBGv4gIRHZckR7Uc
 yv3P34xsECZ9yTzxJKfKHSlx6fjp2bzAjFVBH/apAXItWi4pc1BCl8KUvW64iPyCq0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791575244;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jKcXFqnSHqqiDMKCHwpcoPHJZHpXk0mtega1JVYUjls=;
 b=nekE3qMvLCYgRk6RiJa684OqRMnmchGA1DwTWcfp6DxvmScc+0aZmn4lAC56hUZhMF9I
 CHU99uUuiOkRQawamMEqrJCLpoqBdeNbyYowvyaO6EBUJ/1VMwdd4TVokSEQFdtgNDXOD
 uEKyTGuIcpAIaOQ6+CeYpLo2IxtpqbRO36BY8hXLkWWODzGj1k4PiXYTdHAyepvOS8j8O
 qbcR6dIGePSamRDfJ9GoWZh8qvOaIXFigm07GSP5u5nFqWCU2DsLEbxg7QzyBytvI//mE
 8LROLSfQKBC06mATXRlXHyvTB4eFN8Y6nluTFbVyrl9IqClcdG2GYdZaVHLM+3fj2MA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FFA560616
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:47:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA6BC8E0D4; Fri,  9 Oct 2026 19:46:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Oct 2026 21:46:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4bc6ffdfda9f77c304d084149b8814a854065346
X-Git-Newrev: 48d56536794f9ca33244cc11dc91a6ac203d175e
X-Patchwork-Hint: ignore
Message-Id: <20261009194606.CA6BC8E0D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proj: bump to 9.9.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/48d56536794f9ca33244cc11dc91a6ac203d175e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://proj.org/en/stable/news.html

Also the cmake minimum version is increased to 3.22.1

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
[Julien: add link to release notes in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/proj/Config.in | 1 +
 package/proj/proj.hash | 6 +++---
 package/proj/proj.mk   | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/proj/Config.in b/package/proj/Config.in
index 86966a4d10..063383f1e0 100644
--- a/package/proj/Config.in
+++ b/package/proj/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PROJ
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_WCHAR
+	select BR2_HOST_CMAKE_AT_LEAST_3_22
 	select BR2_PACKAGE_SQLITE
 	help
 	  proj.4 is a standard UNIX filter function which converts
diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index 38b4d81337..a0b42fe1d5 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from https://download.osgeo.org/proj/proj-9.8.0.tar.gz.md5
-md5  f04335154621e9ce9a5800ea08c8d96a  proj-9.8.0.tar.gz
+# Fetched from https://download.osgeo.org/proj/proj-9.9.0.tar.gz.md5
+md5  50ed234d73d68f7bf4378e9a020a40a7  proj-9.9.0.tar.gz
 # Locally calculated
-sha256  a8b493b00cf4d08b712b9e063ed5e53e2be90fcde46770e9dbd773341f378f43  proj-9.8.0.tar.gz
+sha256  791a0610547eeabb17006cfd49cdbd2034f3240f47ed5e88a1031811f4e2bcf3  proj-9.9.0.tar.gz
 sha256  6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 5e74f377c4..114f34b04e 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROJ_VERSION = 9.8.0
+PROJ_VERSION = 9.9.0
 PROJ_SITE = https://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
