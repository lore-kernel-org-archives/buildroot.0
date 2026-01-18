Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC68C98315
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 22:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60D6240691;
	Sun, 18 Jan 2026 22:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUtSGmm1Nwcu; Sun, 18 Jan 2026 22:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86A6140664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768776632;
	bh=IVngXHvNEfLyoL6ykAe+T0+JLrrst9NFKcXViOvW55o=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mxdDVmHVGIyRGov0jAF9M0AxXEUKNVRWq51dG/KzMi7gIkqwx6fFk6dDm2pOKcIoN
	 WcLElEILCs7yGdTseSIIB/wnbqgselPR8wYpZnriUx4yVtlnZx2OTZ1vfce1OBeL9u
	 BaYuvAmf3+i8LAvLHIWYkDe0zjf0jJ2CekMJUg/7cnY+jwoVeMVmvmre+7qyCHcRho
	 z+OKvCwK71NnxS2+IhXmn4p5bVByI4emrKp84KchorJJVDowx8jBXNpApOJIIxR3Fm
	 cXlsYmMKu2WYUigT7kHDwyjIkdAdmRrS/mvDdHAcTJrt/OMtlAcH2CUpYgxyOg+M73
	 YR16zBUhw5Q8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86A6140664;
	Sun, 18 Jan 2026 22:50:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 299252A8
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E7C6400C0
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dDEQx0b-N4OQ for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 22:50:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F32C140055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F32C140055
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F32C140055
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:50:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7cb.dip0.t-ipconnect.de [79.214.199.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7D476A4C47A9
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 23:49:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vhbae-000000001R1-33pl
 for buildroot@buildroot.org; Sun, 18 Jan 2026 22:49:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 Jan 2026 23:49:44 +0100
Message-ID: <20260118224947.3879017-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260118224947.3879017-1-bernd@kuhls.net>
References: <20260118224947.3879017-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768776589;
 bh=4ucWq7F7F8pbTFPCTWphDaMFHkaD8vgTYg2p84J1aXc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=nYpoWcpFuy0XtSqGR2On/PbGFQLPSh0QWQnBHdNsCv1jrqXZGyOPVXqF2SPyuWHaK
 wabRkwNyawiy7pzLXst52+NJB8xqRtLoQdN8eAyaV7OVTMrpeH1IFDUd27iDjBeZQx
 iEoxn9eJXNnFRrU/hLKhWcST8ZvKwYoqdCoe8UwJJQkcFxMlGm6N2y9zxHX6+CLq2F
 /xJBkYtmCVAGEDe3IS/Ku3Dlt2/kpMOH/3yguouN9SwHj1ZWkXEzTRelNc3Sow5as0
 HWUg49jc+6ph/VgUZaJrFvWc3a6rIAB3jwx8KWCWa8ni7nhOeg13qceGdFAfbhdl7f
 K1F9xLywX6GTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=nYpoWcpF
Subject: [Buildroot] [PATCH 3/6] package/php-imagick: bump version to 3.8.1
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

https://pecl.php.net/package-changelog.php?package=imagick&release=3.8.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php-imagick/php-imagick.hash | 2 +-
 package/php-imagick/php-imagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-imagick/php-imagick.hash b/package/php-imagick/php-imagick.hash
index f6091c6b7e..fe6a80a6d2 100644
--- a/package/php-imagick/php-imagick.hash
+++ b/package/php-imagick/php-imagick.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bda67461c854f20d6105782b769c524fc37388b75d4481d951644d2167ffeec6  imagick-3.8.0.tgz
+sha256  3a3587c0a524c17d0dad9673a160b90cd776e836838474e173b549ed864352ee  imagick-3.8.1.tgz
 sha256  b6e00df9cb3b91977c0d64a7c4db48cb6f5041f6eeda6583c236775f70a35b78  LICENSE
diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
index 0223b6ae93..d1ff69de6f 100644
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_IMAGICK_VERSION = 3.8.0
+PHP_IMAGICK_VERSION = 3.8.1
 PHP_IMAGICK_SOURCE = imagick-$(PHP_IMAGICK_VERSION).tgz
 PHP_IMAGICK_SITE = http://pecl.php.net/get
 PHP_IMAGICK_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
