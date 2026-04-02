Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D582D6AAF7
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 18:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CCC840C6B;
	Thu,  2 Apr 2026 18:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xf3pN0A7uVvR; Thu,  2 Apr 2026 18:03:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92BF540DD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775153039;
	bh=mdVYCB+CS16ItOEGK4SXDr0EdjOcHEu7HapDZ0fD+/Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PbfKvHPJnJ/okoUKYRwjj8IUIb7w5ip6b1MTKilppr9jXYrydgf7pAeji457bCsSl
	 rzlCtNS+Ra65cObBzNYLTH8jnWbg6pdd1hgrc5phNgGWx+M9aZ0pbICTNvxJb7jYQ1
	 Aya+v9R4FiqN9xEhoFVWmMWEG8ETaFT3Q48FYiQjuuzm1qH9mLbpbTdYoGSBEl0ksV
	 he6n10PHs/i1+jLEyA1nHKtMCI7ciFYwV27LiyQXVeZ+r343GESRxErzMqvr4sUxZ6
	 dWptenr+9Uo0aKq3RgUGZM0aYbUg4jxVjRDFwNmEh0HhYPcZS8DKT6IxG0lAH0tiDw
	 xx7xYmuYaF35w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92BF540DD8;
	Thu,  2 Apr 2026 18:03:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9AFA2D3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FC0E607FE
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9JlEtD_T76Ku for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 18:03:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8523960777
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8523960777
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8523960777
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:03:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08f0.dip0.t-ipconnect.de [91.58.8.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B86B6A4C32CE
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 20:03:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41186)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w8MOZ-000000008Uu-0py7
 for buildroot@buildroot.org; Thu, 02 Apr 2026 18:03:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  2 Apr 2026 20:03:55 +0200
Message-ID: <20260402180355.2779992-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775153035;
 bh=ZF5CixgqkvBmBJ6Mb3zsmBubjJopqYjl+vayN/75uTM=;
 h=From:To:Subject:Date:From;
 b=mMBqj0L0MogNe2zVrbDJ7P8/3DkXfALj2rYAbwLOxsEyM8x8gUbGinysL277OOaxo
 p7nOMlRUEadRiwFGGvsDZXCF04A1/vzX6SBLRLStq8EIcT8+6JkmZtviVsXERKd8cA
 bJySnpGKzz5OZr95x3u2hme/P2NiMomivjHiGLwcBeCrMwaoVoo84ls6T/UrBcgvnf
 TU1/gZWuX1mCPRM4OHbUT1oUZ1eSOmGyge+Dw3lCciuKQNvbrdaw52hKzrbJVbCyHx
 1U/uE9YfamIDIkUVveOMx4/WflPBSVrGKxL2Tge9ehNpFWZe8pUvT2I+9od7r1tkDd
 UOiPEj0J7145Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mMBqj0L0
Subject: [Buildroot] [PATCH 1/1] package/libinput: security bump version to
 1.31.1
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

https://lore.freedesktop.org/wayland-devel/ac3BI2BjKx53LqmH@quokka/T/#u

Fixes CVE-2026-35093 & CVE-2026-35094.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libinput/libinput.hash | 2 +-
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index a942bb069c..ec6e52e1e2 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  af04645cef8ec4ef9b571664828086ea5a610c6f3e872880055c7fe2c9377de5  libinput-1.31.0.tar.bz2
+sha256  e0bb6537de892ce7c63fc5be9ad373eae894b7655c92220ef00316cc33097356  libinput-1.31.1.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index e018f87f00..8b930805b2 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.31.0
+LIBINPUT_VERSION = 1.31.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev udev
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
