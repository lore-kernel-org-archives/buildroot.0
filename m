Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7E4CC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FF3A60816;
	Tue, 13 Oct 2026 20:57:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xVeep0vmAS9; Tue, 13 Oct 2026 20:57:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A2D646081A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925061;
	b=dYXCNlxog6y5ZzRx/JuqAbUhQORxLbZB2WSHGJYHMWVw0ZhJ2U2DFTJxR11cyN3EW8SQ
	 AQV1Mz5XLxI7bTtHeIDGbAK/Q7hW3Io+WcHST0NdG0JJoilHQ5Y8ZyhDEMrSYXLfRJ0CQ
	 YsyUG8I0/IUalDh5ZZh2B09m8WcEiwuXOI4aktcWsWglCq4d6xItYiJHMwL2ANh1pjS58
	 7IXUQnIQCoJplC0qB+tPw2HEU6oiw0zYaUr87Ra2ue+Mxi84BjhPJvzXCaUwwqxf5FERn
	 uztcIVewbV/2IXRM0JinfGaOCHEcnYZWFkr8BIhSr5s6soN/ZcEZohnvMV4tYmyOpGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925061;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1MxdlFLENEpp6be5UzIiwXjU+OiSFKZSdcln4CxXtyI=;
	b=RoApRXCz7VqoqxrY3bIOTE/GJL2PX/r8JocQRubfeJ2jHXnuSpV0QU7mhsQXrn8gkDou
	 EK29fFhUBc7AMyYnwu/jdzkh6nYDU5Yfbhbh9oCsv0zFBEC24A63r4+bggUufLClrSYSi
	 vdVhwTBfwlVpKTEqkMekEoqOUq3ph6zrIkDONZpjAGiX+Cqe50mcQdZYXdylqTDdgZfMP
	 OR0y+Gq8aE1sccnpGavhBDXWKe2Lvi3z5YJ0sqaYjD+Wyc8VKtGd2Pojh20sQ6ruy3Gy5
	 ooLg/QWl+3IqDO+tyniFMx9FVD+fssKxGlwonh1KhGwA5m1sWTdO6mO2UG24sY4okZg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925061;
	bh=1MxdlFLENEpp6be5UzIiwXjU+OiSFKZSdcln4CxXtyI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RUys7f6L4Ij8ORDhzy9vH1o+1WpUUUMyRB2+Gf4JNto/7mntEMqKaysNqYkrO6wEV
	 h52wkbEG2A1dcAzA/pqm0rk/WozOSwsgmTnkdSVWcAqRhyIofQNtwRK0Hho9m82aUw
	 ioKYesnk2HQ8xSEfPH7HbuD/FRrOhlL0TEFre0hLiJurboPpKLecrAUZz3xRqhBTOd
	 4KRUP6OqoclGbIAP5rtmOQEeSWhJt2erBswmRzrc1Yh67RzijKA72+hPOxRf0UnphB
	 AWsPvhCgQuOIB5JJmCSqM0eH/zuuTMgt3FLn9PnuHLoUTad/jeF5f5UDL8K9Z5wuOX
	 oOOsyRSAU1mwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2D646081A;
	Tue, 13 Oct 2026 20:57:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FB5B2AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43FAC60816
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJgYsgX2HUzw for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:57:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7D07B60810
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925054;
 b=lw/qw8cmSvxfskE3BLF7novJ7dG8+5y0jAskClPJv3Sl86f7ue/cKHQ1pNGyACm6Drft
 i0gSS65gg5oKR3XcxlyHI4hgbg29y0fdJq/z/4UbCv1MoRbAnbZC3iekXdY7f8/lsWMb0
 U+mnMPsox8N69FnO2HXU+p6mm8kWXfhG8TBiYcO//oFFs7CpCPq5urauKIQ+pYHqsu0H2
 u9Ux4ayilMUpSHFxbuSm0QbOtcA+rTIvMEZbFlbZYX7q/hyM3zh8Ehe4cL30KVoZGPYAw
 rj/CXoCPCkh/a8qAZSFnj6RTVq6e8pKxJ7Q54uEU6lVclQ3qSdCn5+VdtIIQDL/og/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925054;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=02S/QwvNi5cg0pNj8dmHLzjSQy5AB2gaw6kfU16H7kQ=;
 b=tAXU7F6lshtVPmlsIXuwkEZWriWv3S67Wgr8Lh+RA8HfYzlDdFKhhVu7YZwPexcvpke7
 +CeEy+gl2AxrOvTJ4xd1iNMCN0YPYwUWN3XLc3ltw5qnPL874U/biflWwS5CIP1SbcDmV
 j044aLXipeRxhNq3LepfG2ikIMBlGB58majqRLd9+Eg9uNsi6J4fOV2+ps4MCDXSdV5/1
 zkktQshC7iLDgvdFnO4LnSm/woY6IVFY62VBT5XVuZvEw4Tn8NbKI/vlyC39yJ1Z1HV7P
 4Dq2tPdDlRSz6c8piF8sHvap1L2vYKlmEnDgR7+VCk/Q5aA+PUxwAmRmrHCLrW5CS5g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D07B60810
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A83B2956E8; Tue, 13 Oct 2026 20:56:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:54:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ccbe9fdf4c0a85ffce7e0605da2b87063a9916f
X-Git-Newrev: 696e2c4c5ab163b9091c28aad97377cd0fefcec4
X-Patchwork-Hint: ignore
Message-Id: <20261013205614.A83B2956E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-installer: bump to version
 1.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/696e2c4c5ab163b9091c28aad97377cd0fefcec4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-installer/python-installer.hash | 4 ++--
 package/python-installer/python-installer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-installer/python-installer.hash b/package/python-installer/python-installer.hash
index 0a4c9f6dd6..0b4ffee0e4 100644
--- a/package/python-installer/python-installer.hash
+++ b/package/python-installer/python-installer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/installer/json
-md5  c919fdc746e46b0a93ae53ed375e047f  installer-1.0.1.tar.gz
-sha256  052c7fc3721d54c696e2dea019be67539d7b144e924f559f54beb3121831c364  installer-1.0.1.tar.gz
+md5  b621d65e0ff2a13335f3f651ff86f944  installer-1.1.0.tar.gz
+sha256  5adc0c01ce62d809989e246987cd68944fe5df8af562d0358f65b2ab15cb5de7  installer-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  37b8b9f2569892fa54406383d431169dbb2115980d78b7efba6eeae5664c484f  LICENSE
diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
index 20cf1cb744..e4d2fe96d2 100644
--- a/package/python-installer/python-installer.mk
+++ b/package/python-installer/python-installer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INSTALLER_VERSION = 1.0.1
+PYTHON_INSTALLER_VERSION = 1.1.0
 PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
-PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/06/fe/b9f481cf0cc867958a21338baa900357b7b7d86cac9b025948049d77923c
+PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/56/d3/2fab33d15004d41ae8e7b5d3e310510f7f34a7e1dd032a3e60d8b38d8fba
 PYTHON_INSTALLER_LICENSE = MIT
 PYTHON_INSTALLER_LICENSE_FILES = LICENSE
 PYTHON_INSTALLER_SETUP_TYPE = flit-bootstrap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
