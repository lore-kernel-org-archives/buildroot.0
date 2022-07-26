Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BC6C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 16:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C640C41740;
	Tue, 26 Jul 2022 16:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C640C41740
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tpvZS9dBHhXB; Tue, 26 Jul 2022 16:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D34714014B;
	Tue, 26 Jul 2022 16:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D34714014B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CE731BF3D9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2338F4225B
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2338F4225B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AUBzt6u7brVn for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 16:40:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB43441BE3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB43441BE3
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 16:40:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id B7BF31BF209;
 Tue, 26 Jul 2022 16:39:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 18:39:49 +0200
Message-Id: <20220726163951.2111731-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220726163951.2111731-1-thomas.petazzoni@bootlin.com>
References: <20220726163951.2111731-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658853598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eLWmkQBapBUr5Pa80/5poNU1mXhAfXE1KoHWBhtG5cE=;
 b=Em4ckgrNKXnKc8bCsvyQ+lt2H98Dn6qUc2EBo4X/0hSliAWWM33OVKDT40lBQ+8IK4z9VQ
 uYhdQeDQnXtrcCUWbj9t4fGyKuOdSfxlqQLDrgbfoenPg58oAj3YFBCJqSfTwiw7duPALX
 5lL2IZAKrU+Q/8T00mD3SAL46NQEDHcd+tvzp8RNv261zVDpmht5JaJWLGmcgl/btxzjFq
 8mU1ot7cdSDZUI2ykbZNX+WK1ePwN6BaE/ABZ9Zf5X2WYIu2fw4yjrLI0s3Tiil2bQgUnx
 UuXrYzhtH0Q2PE/7tN+21eY85Ue4EoSQTy2Dp1wopGSmVgC6MY9qyuoMjEo3Ag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Em4ckgrN
Subject: [Buildroot] [PATCH v2 2/4] package/Makefile.in: add detection for
 the lack of C library
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We recently had several cases of architecture configurations for which
no C library was available, leading to a build failure during the gcc
build. In order to more easily detect those bogus configurations,
let's bail out very early by detecting the lack of C library
selection.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Makefile.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 508ea7c366..f8920c87a4 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -47,6 +47,12 @@ else
 TARGET_OS = linux
 endif
 
+# This happens if there is a bug in Buildroot that allows an
+# architecture configuration that isn't supported by any library.
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC)$(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_TOOLCHAIN_USES_MUSL),)
+$(error No C library enabled, this is not possible.)
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 LIBC = uclibc
 else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
