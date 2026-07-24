Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58492C531C9
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 17:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68E5040642;
	Fri, 24 Jul 2026 17:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rXcgHjUabNR; Fri, 24 Jul 2026 17:16:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8444F40ABA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784913369;
	bh=sYrZqXWLIEp9c3q9+KKmBmS/NMQ2+zOxE569POYa8YY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rXhYcfY5quCF/7FCrATmWTHx4jJFnRRH/d3yZrOFKRz3XFOkw2TfrxcxGoNY0RkyC
	 wegeuCqVz6m2mC6bowEX7nZUgAZ8oVADHk7GZ0GUtb1PW5ZYr+8gqrmIGMjPYMumNv
	 WSmNMtdbetwGxCEuyEDWIQbOfLer6JDcWQdEEcFIapjl+8J2gpVhAPFZdZqHVpz4hu
	 dxwm1Yfb5FJvdiQa4Dn/5gK6xMEFkfIzmYQLmZK90xjEoJ5qVliDdODpRGCIcONcLi
	 YhPy0X5UZXqSrTGGFAfMg6rDapT0RNGUWZkkDrBkKYumbA8NN5Z394XcQCNCR6Zg6P
	 0z6EVYrcxyy2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8444F40ABA;
	Fri, 24 Jul 2026 17:16:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9169142D
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 17:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8327E8117B
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 17:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0PWmmR_xOYR for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 17:16:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C7B9B8116A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7B9B8116A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7B9B8116A
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 17:16:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a00d2.dip0.t-ipconnect.de [91.58.0.210])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AA97EA4C40EF
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 19:16:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52638)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wnJVD-000000006t2-3Dx7
 for buildroot@buildroot.org; Fri, 24 Jul 2026 17:16:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 24 Jul 2026 19:16:03 +0200
Message-ID: <20260724171603.316901-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784913364;
 bh=wsoINWOcjQHNOfkpQJJHb9F3Ji628z9VQ2ZiSaTGSDU=;
 h=From:To:Subject:Date:From;
 b=nSPHjSQvZUHMsbs6j/2vpN9P48UW3+yNODJzgX/Z5/lTzUm6pmWBJgeZb8KThDEFZ
 cWeCE3dh7o1TY05YXOZMGA/I6EwCA5f5we3KjXSJ+I08yQAM7R8a16nai/htrrxdBJ
 wLRy+kk4+2R7ZlkjWvytB9g0MuZADFtWfZMIVrrzdFIWqqUcViXqQ/lmjm+gmed6J+
 UvFUoTehDSFntuP6S4HwnQRjaIpw0wOjOvWmSzzU+1RudfV+rTBq2qq4UezWvsrDvE
 eSxig3SOoRJhhTMK7bbSTsdmvlS0W1NdXV7n9/2ndSMpNnrHtMXl+hxxhvNUk9P9nZ
 hfsryq/NtLSEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=nSPHjSQv
Subject: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 1.5.4
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

https://code.videolan.org/videolan/dav1d/-/blob/1.5.4/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/3643071f8cd1e3750c3fa180ebd911edb87a38c5

 package/dav1d/dav1d.hash | 4 ++--
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index b6bae42e8f..8c1a989c16 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,4 +1,4 @@
-# From https://download.videolan.org/pub/videolan/dav1d/1.5.3/dav1d-1.5.3.tar.xz.sha256
-sha256  732010aa5ef461fa93355ed2c6c5fedb48ddc4b74e697eaabe8907eaeb943011  dav1d-1.5.3.tar.xz
+# From https://download.videolan.org/pub/videolan/dav1d/1.5.4/dav1d-1.5.4.tar.xz.sha256
+sha256  686616b7c69eb88d44459391ab25cac13b6647a3b288835c5784e71c1514a5c5  dav1d-1.5.4.tar.xz
 # Locally computed
 sha256  dd92c3c2247c5651606fc23a5e2d6a1ebc5ace9a3e49cbde0e12f05ad1cb1ee5  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 011ab2ddf0..6808d8a078 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 1.5.3
+DAV1D_VERSION = 1.5.4
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
 DAV1D_SITE = https://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
