Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A81CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EE4460E1E;
	Sat,  3 Oct 2026 15:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMtV2P2i8PhW; Sat,  3 Oct 2026 15:54:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9529F606BF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042885;
	b=N7hM6KLx3jIB3JeLsuxEs7oSvr8Y9PwSKvchmVpkFfHkeCAk/ZtJMCmsBsetP/r1SCEM
	 5PvxwzHQLPn6m8Dlr6CJcKoviKo9qGZIxp6OWVgKuGmCbDk01w5k07Y1O0ZL3EXFcXLLa
	 uf6Z97N1hL0wAbRG60xANndCgYlRzOcHYMozunOm9RzEY0wVdpKeBO3GMdNddbkK8Bv9d
	 e9ghBWZtO4cfsdEIQMLCwQFmQX9YoWzePvfIt4HRR3BTpG1RCgoYu8OlRhqX/G94XVo6Q
	 9KMcNO1LUrLjLLJrU3F/tgudsBnOrBHWzWjMeNfV2wOV8yBQEMLiTpJy+k2KUhI9/MA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042885;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hc9Q12naNrZwnz8q+P3m8m+0cBZlLvkTuOWyl+JcHUQ=;
	b=Atc0JscVoGkgLo3od0ccXDiRWaD2CS5SDSGFJR/n1qmAG7FwjrppQbx3LfICFvBGBPwU
	 rI2rkVQnviJIacxC4jfcMidJuIgTsKBNQQm39k0mcSi7AJGv6FISxhfgL+Nd92lIWrEMK
	 Wym4vBHOT6zBr6t6sEq5Ru0RIu5qgWAy33BTE5Pzx/8jVmuu7/A0FSACxcEivWVhC849I
	 kNt43QiZDHtpFcvpoRyY2Lrz9vp8FbSISXdNdmtWCqUequnGrJDKuopPRCwPTetS7KgxH
	 kp54l5b3g0EGnTmpYkPIBH2eTFcpIoOvYXSLLpOOzbTMyEtfvwJaUBoV5vvxlFcBRFg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042885;
	bh=hc9Q12naNrZwnz8q+P3m8m+0cBZlLvkTuOWyl+JcHUQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SzYnQI78tJzB3vwd44snNs0PF5gRSY0QCYrwt8DUk4bfwYbu7zlBPnf9lGsndTzUr
	 ZaKBbOcWoFWXLs509q+o6Eyuf4YPBDI4JbFYKK/J3yfh32QXZq+BqNVPxdTSscIP5K
	 VkwZ7O05PKguVLUO9KB266H4bs2MjHMCo1ni+moNwJmvWs4X3FwSbbGqa0C3nNTx+j
	 fQATWmVCwg06xBBhUm7HQYw6wJu0jLjlBSzIVhH7dFThsjdLdKpZQ5huRZakqfI32I
	 Vuo2k+F6deUXkgNYRgPBEUSRw1rcocvxtIUrWP7mObbjPAaR8RwG8Z36WHO2GgB6Q+
	 9WDMYUHwmXbQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9529F606BF;
	Sat,  3 Oct 2026 15:54:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE7A6335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0557400AF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UcFIXrw85Gji for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 215AD40055
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=gzY4VcgChXSxOP5n3xIBp591AxQEX3J1c3KU9Iqej4Wv2pkOCsYAkCQwhGIO0aJ59I7S
 TdPH5oItyeYLXotJ9H4/VOrYDr+791k5vMpGnehmKPqJgPe8ZbYZS+fgFZqQ+7uoNlyx/
 /KGIFz0pcHlv0gSaZbsPZZQquvLDjQyoQoazPR3I6TlfNWsMvO2gFl23Q+h2+/9xc2aIL
 TC7FxVRvx+9XTAfHrPGfvUnKcLs7N2oTmwIIyvF67Q39oY+nmEEDIr6SX3T/G7b50kwT+
 Cq5mSCgz2s2dMCjbUYhS7gQUbSQh+sWVm7z9COUX1LEDR1dX1K/TAcVsKAnPfDyiNvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4SGXYfJX7Lk9VnxDgsqOnEcY+KVkcTThYfyM4amyf4Q=;
 b=MGfk5AuBHv8UEbqlY0HtEVd+KHub3OHCC2/pWGm0gH8nOx8UWpLEMgsHDXmfsSvwXgMd
 YkuZChpRmOXTcB9TFXmyd+T41pzGnpIk+dLxUIyBRwcQAxYkpu2rK60/fFRWzxXxaL5sH
 PDyACm9xTtALbyqSdkuOkYyPAtw+jBcITx31D9u0iPsLGaNmRuFKNe/l2GGSx4bNLqRRA
 WMTUw1FHpKdtfyc5DBMDXtJn/5munYaFf5CC96fQXDOODkZAOJrC8WCrbWhc1CcLPARmQ
 mi4Qurd74eNLjkweIjUd7bNMlQOOcwEUaGeDpOPWI1LFk5NBZcS6jCrVvaBAk+3hg6Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 215AD40055
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6258A8A309; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fca22bcb7639288626a946e2356d30281eaea3e3
X-Git-Newrev: 46f451df12a28106e90ae2c064a17c52e4109dc3
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.6258A8A309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-service-identity: bump
 version to 26.1.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/46f451df12a28106e90ae2c064a17c52e4109dc3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-service-identity/python-service-identity.hash | 4 ++--
 package/python-service-identity/python-service-identity.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-service-identity/python-service-identity.hash b/package/python-service-identity/python-service-identity.hash
index 1d7f66fd5e..e76381e334 100644
--- a/package/python-service-identity/python-service-identity.hash
+++ b/package/python-service-identity/python-service-identity.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/service-identity/json
-md5  e575db51719742ec39191c896e4c2971  service_identity-24.2.0.tar.gz
-sha256  b8683ba13f0d39c6cd5d625d2c5f65421d6d707b013b375c355751557cbe8e09  service_identity-24.2.0.tar.gz
+md5  fc0ed70ba5b73387d25b51e88e2740cf  service_identity-26.1.0.tar.gz
+sha256  6358c52882c96e66ac4a55eb3a72c7dd4a70763f8cc6fa4e70abde2656f4bf3b  service_identity-26.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  24bd0a9ba7d0eae08a3a6e32a1b09f8e6871fa0325520a2fcb00e1539eaa602a  LICENSE
diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
index 7965811c6a..4b050fb7dd 100644
--- a/package/python-service-identity/python-service-identity.mk
+++ b/package/python-service-identity/python-service-identity.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERVICE_IDENTITY_VERSION = 24.2.0
+PYTHON_SERVICE_IDENTITY_VERSION = 26.1.0
 PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
-PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/07/a5/dfc752b979067947261dbbf2543470c58efe735c3c1301dd870ef27830ee
+PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/61/87/ad52e2c582c0f0e7f0a1b86950494c38d67422dc0f5ed9044a5fb9569a49
 PYTHON_SERVICE_IDENTITY_LICENSE = MIT
 PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
 PYTHON_SERVICE_IDENTITY_SETUP_TYPE = hatch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
