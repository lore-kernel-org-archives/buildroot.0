Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00F9CCF2CA
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79151406FD;
	Sun, 18 Oct 2026 20:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uB-2laWouYM8; Sun, 18 Oct 2026 20:51:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8241B406F0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792356681;
	b=Sm+Ot3BBH6C4DZ19DAUbPatKqY3XbrsY3arqCBi9QLAe5H1hau1huiahhGkfsw58qY4q
	 PJf4oPIHdiVdsiniTEvV1PT3KmEaUruxoUtmQQ0/srIbYh72M+S4XBfQgd4+9GoHgPryJ
	 JcN0kPnAe0GlPfds02qMg/sVRrGCz6+SISK1Bhu8Gl1dxk8cje7yIAV2UCco6tp4y3ke1
	 lkOBr1EOTLiVtnWT4IZrtXsk68CAlgRpMgQU4MfaEjZaZ486YOMrVPqwV58b/Kb8efoWb
	 wJcgi/v8q7A662sBpayw8UFhnOz0Nn19JZ8rtacn5NYdtQWJs2llxw5fACiyKCM+Akw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792356681;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eocEQcp5VaOYLVm4NTcSk711q/yQDVmUohOqcOSJRbw=;
	b=dT7JWFW6Dx+QMEDEWIZ4n9qlRsvA4WxQDGdSeqRYEoievlMNCkXN8i36Jlf6JZ1XWCG9
	 UiHRhgMzT5IFnSlBz92Q1AdVTU4Es1JbbLKbLGyqHGURqrUJIugHZOlMYbMN4tenffU/C
	 41ID4FyEYnK1FOAWUDcm1NebG9qYAd7Sn2Ksa5z24L9fZs4fZtv1hvqgSSRugffPGBck9
	 uWouMy0/L1o972wdjKKec1wHF+bPxvzT5vNB6oTvIgg95+oc3qvSJT/fqHJa3mkp/Clkb
	 4043IdAybErThRTA/mA37z3DNmehJX90L+tJgMlfVMDdM8eKAAfZwuSXlkjRIJ1OWtQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792356681;
	bh=eocEQcp5VaOYLVm4NTcSk711q/yQDVmUohOqcOSJRbw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T8E1Uz+m4RGYK34/e8+aRK4k77kaZ1Viz876adsgyZXAzH9UfKVS3Ov/oHKCCFvle
	 sQdsedTO0H3e/E8C7i2DUhk2mhR2XEx8tBXUFaozp0SBxGu58aw5OkNFfLDCn04bfV
	 4zj1LzK3KW0wN8/fC/1hEyKl23ENJfNy4u4acIMwZFIAEqrswf2HrmYFHiDIWI6Sdr
	 tM77AlU22TWJeybFUdbPGcmQgmlSTvFjq4E1gl1ebWlbOP3sQtYdBNE+ZNpp4GSEpi
	 uRFh99YnhJ0/Imnn7LRNWk8Yf8tmLlcZLbsWKT+aN2aOvMS+ZPJ2FPWaBs7uRzMV+c
	 HTi+05T+cfuTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8241B406F0;
	Sun, 18 Oct 2026 20:51:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CAB7D7E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BE6660638
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B1RPDsc_xfyS for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:51:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 495E96072F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792356676;
 b=fARrc2PBFC2/iEGAfYXUNW7SsjLvxkfazTR+EunMuUSUlSBrl8Wpzal581mvPXN0BHvL
 S++gmHyM5VeYUE/orQgjLZPcal7yW5bw32a3gGNreLOrmVqKEIs9nREcbt31pgmYMY43L
 61wnZvv5bux9vR1noGFoFalgwinA7rJJtr6qDlKhcr/+6g/I2pMg4TfC+Bhfzl7mh9Nzv
 iZx6VA+B33JXYWZKL04mPC7DyYDw5ngOp18t324y4jws99b5+Z3i++GKSz7F5Y6aFCozf
 T/biOiIp2vPuvWRGwpS27SnGXb3p6D9W5UXZbgyqSISLciZvEhkMH7zBaTXRIn9KPGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792356676;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=k0Gx6LaMmre737QrE616TcQKXCwD8MKYki4kExglRcs=;
 b=oduWEjkivKyYQ/hzUq+zwzYA5+7pzTcSAF/BQ3+0AZ+1LrfQ666xcbq6exBwPCXgblqp
 Wge7jvGjI7R7lnFm6Enk+TwiPyv2PeOb4Yo5F+dlMBLuc3/o72Ci1+QQIoh/XFyz881fO
 4Hi1IUgmZVuVV7oC18H2aIPbJ97mEm6+ocs6QQvAGrsI+jIAViZrjRTYdlrSx9M1aD4WT
 4X+4Ca91+ZGlj3gsqzDc1ezXa4h61f47O8lDAY3iSeMOnRCtD/my7jypsV+uGJ5pPPJ2X
 1oN4PPx7AMLNNJV4goOzY6cCy51iwpKeox6CL5EK25qRPNkYN9tn5Xh+i+PDWj8wMqg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 495E96072F
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:51:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 050BA98433; Sun, 18 Oct 2026 20:49:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 22:50:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd10a0172fa27be4d2d9a90a756319dc8a3371fe
X-Git-Newrev: 32627e5b61d0a303ed6499cf589d8e2548cac966
X-Patchwork-Hint: ignore
Message-Id: <20261018204954.050BA98433@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-certifi: bump to version
 2026.10.18
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/32627e5b61d0a303ed6499cf589d8e2548cac966
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index a0c24e66f3..c6e0206ea8 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  926857e560a3ae443ee35c2de270d75b  certifi-2026.7.22.tar.gz
-sha256  741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55  certifi-2026.7.22.tar.gz
+md5  915d53b5fceb004991800f62b552e0c0  certifi-2026.10.18.tar.gz
+sha256  b9995d97b64d0431a5af837d8ca8cd6238104d1f319f04bd93ea43124d6c861e  certifi-2026.10.18.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 17c6925ae7..5430596350 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2026.7.22
+PYTHON_CERTIFI_VERSION = 2026.10.18
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/7e/eb/a2aa1ac3ea30dd3f30ca57f40232138b6b0040719316ecb85daf61167771
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
