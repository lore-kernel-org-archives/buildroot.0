Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D614C5CFEB
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 13:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4B1C60B01;
	Thu, 13 Aug 2026 13:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQ8Ox94cwA-p; Thu, 13 Aug 2026 13:11:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E96D60AED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786626663;
	bh=wPAJLI4A7i8yADxmCtwtwo+uGPyF3gs5wxw5e6V62zQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=GAXSxePdZ+5W3XBp0kTB8pozYmyEcvlUJ4qeMIGAx2Rda0IBZkSbYRAg5R++cSerw
	 j3+5vzmfInm6Vt9ZHtfKEARYN8pjaEUhAPQjK2VVSlDngR7a/lk7qdOleHSuwBkJDB
	 naoBLfC5vfFluv03oMuwYCIodbBNPysv4dksSRw4Emsk/Hi6ROBNG/9xQyqMjZJGE/
	 ISy8SAJ6ZH7ReM/hCMsy8Pzu2z+JnqaBajwgZcfw+AOPcwMw3lz7ZtKEIzMyvCi5Yy
	 qksZ7eOXJYrDmgsFS6Wwo+AxEaUR8qfPkzKwWiJcTMT35EXfEzQupuwuesDUGAET2O
	 HslDFGsYi8B9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E96D60AED;
	Thu, 13 Aug 2026 13:11:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 55DB13A0
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 13:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B7D640959
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 13:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOu68kqL8tOU for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 13:11:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77F6440947
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77F6440947
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77F6440947
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 13:11:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3E2781A15F8;
 Thu, 13 Aug 2026 13:10:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 04394602B8;
 Thu, 13 Aug 2026 13:10:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 62D9C11C4D861; 
 Thu, 13 Aug 2026 15:10:55 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Thu, 13 Aug 2026 15:10:52 +0200
Message-ID: <20260813131053.899334-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786626657; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=7HN5A6AjQlmh0w0L+9hV+z3fGUmGHdIep9Rn4RS0yxc=;
 b=LjEUz5fCwsVjTC60BahII7DZIIUBQ79wTuI0LbrLCi8V488TGKaVkgp5GeQ6g67lgF4vnm
 vmkVHDbozWec4EUKIkoujNkf0Vryxm4gEB4maXOt9UCIYHk+UYtUJwEmtBgJW8ybYAM0uF
 UNKsPngsvIOaYCqGz+yvFNf+xcvJrigDflVsdmMREtVxiFGdZfHhpjRtA56UmvtIEKhGWB
 ACD/J2/puU2qs+qVGc6ipf6cnbxRlvq0NEA6BEMrAkZiOqCJViZpS7/XCvJXdY2N+aL1T9
 C/lEvPX5rjv43+7FsnZm/kcse8EmgcwzgbF1zM6lymVJ45zEiwN3+85wYXBGnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=LjEUz5fC
Subject: [Buildroot] [PATCH] package/gcc: fortran support now requires MMU
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since upstream commit
c66d1ba685b0d03b28967d2f7a48f6c64687efa2 ("Fortran: Add a shared
memory multi process coarray implementation [PR88076]"), libgfortran
now unconditionally uses fork(), which makes it impossible to build
Fortran support on noMMU architectures.

In follow-up commit efb497c23a6f4109bf8794342617cbc161c08301, it was
made even more clear: if you don't have fork() and you're not on
WIN32:

+#else
+#error "no way known to start child processes."
+#endif

There are apparently no autobuilder failures for this issue, but the
simple defconfig below allows to trigger the build failure:

BR2_arm=y
BR2_cortex_m7=y
BR2_GCC_VERSION_16_X=y
BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y

Even though this issue is only starting from GCC 16.x, we make Fortran
unavailable on noMMU configurations regardless of the GCC version,
with the reasoning that:

1. Fortran on noMMU is unlikely to be in use

2. Moving forward, all future versions of GCC will have this
   restriction

Cc: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index d8b89d942c..bc3223eb59 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -98,6 +98,8 @@ config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
 	# on architecture building libquadmath, wchar is required
 	depends on !BR2_TOOLCHAIN_HAS_LIBQUADMATH || \
 		(BR2_TOOLCHAIN_HAS_LIBQUADMATH && BR2_USE_WCHAR)
+	# requires fork() since gcc 16.x
+	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Enable this option if you want your toolchain to support the
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
