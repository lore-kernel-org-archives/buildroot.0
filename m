Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902E3CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5658060F20;
	Sat,  3 Oct 2026 13:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dw4tJtx5Sn2R; Sat,  3 Oct 2026 13:57:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 68C1060F29
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035827;
	b=GkOhvqeipH5XbAZdDoyRGPlZd70+qQZtfXgB/vMojvakZZZHGQ8nkMv6kfjaDqyoIk4A
	 feaLpitbPDBcE6H9pELcpD+QC/59/wLWfIrhilLyy42aNHh3mWOaXZ9gIMKRTz5EylyiG
	 Vwv7Ewgh3RJvi4Y1FNvdWE2yjx4Rh+DxlGDuOoZCCAxpxnZvMZpcyWMtxth357BaWvseR
	 TtGJ3OXM/KKD+6N1DMIW5UIafhAjhHtNBmfmWr1AOl+PmiLtPyGwQEhra3zguWzXcpiSU
	 UF17btMI2ZR7P5N9jvvV2iRuLcvg095eRvuU23GC9kObuzcqohSNmVNtKeeIw1eRWoA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035827;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2rH21qjblre//mW61L21qbtDjAUouUTwBI6waS5lLt0=;
	b=Xde2b3RVV9G7clmirEnOq79QNATCOYOu7+cIX2dqf1CYgZIuQviTndnKRphQpOCtzXGf
	 /0UJPj5E1NARXo09REcHWd9Ytl9jq6uacgWjBNXOQsrQ0F/5HI+i7JhC3spWi1CH5pf/3
	 WvUcc28l91FlMOYdtWuDhu/Aw5VHTWLnfqiVe5w3N0iunNL8z8myqoWt33cyhGfv/H8D7
	 9c9pShy58VHeqd72UnS2tsS9v9qjH1pV2Rh7sPOd/jmu1TPH2eji/Vo/jXT6M5EqClSpf
	 oXQMP2LPiUeUp2RTAhpBJ2AfaTFlfm/qKXRGX0a7yLSDi7vr2RA44xiOetyXzFZZitg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035827;
	bh=2rH21qjblre//mW61L21qbtDjAUouUTwBI6waS5lLt0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ew/3btd28iooCUAbx+qH25D4wfWCXjByBkQsf8+EGvuosS6GsTDXurXcLlC6ulBX7
	 ESuAH1SCs7i1twlHVxFPkhUoEH7DsDLH7lpylkLBDB1SpSSVTQbMLUMKDNnTTR4ge1
	 M8BGmn2klkcsRQaYSDVLEag6iCAkucevwk1uiQC+RLt0o5SIZCpIWtTY0n7E8SH2U3
	 YS3uZYgP5kmufQp2mVLEtDR+Ak9NZ8NqcW1j5+80ECArDpoyJWgWreuvEgPDrFNyqI
	 PisBH14fw0dyxCtdXpJM5jDkpcygF4DjNnBsU2H2Lp1zqDR2AJXsfsrOmrs6fEkys9
	 f+ilCZ0T3xM/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68C1060F29;
	Sat,  3 Oct 2026 13:57:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB4CC4B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0EE6414E7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCLs-9aO1KdM for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1A6FF414C9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035815;
 b=lR21ZWMuMp0R9yAG941+orV9FPJiGFleA1sYokSxu+/Zq7QAjQwtiZu/SD78YrxnAVuu
 YJ/cq90HzJZ9/PD02rfhrX5C1WCpsE5dqW3je65V7C1WuseE+r8oSROjQJOIBsCGnbXMj
 h9zH3lZ4xpE3uqw/bA+dXY+oScEuKn1qOney5NlJ051KZ9huRTfTbi3reTn/5k3dMcBmI
 8lHerv4hLCwgPUoNx5oKPigLHpw7mvgRuC98sUHa2EOlsVXfSGLyqgbhbMJ7iDPXhnRZO
 ptSCh+P3cBu6rbcMZBtug/qzKbfrU4Rn26RPkeqJnVQOvOUO48G2G2f2mu3zLGDpWgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035815;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xCDSsINYW8wni2I4SxXIe4ZB9LqWGPWbE62msMNG3VI=;
 b=DK4FYoWG9ElSylGDIZMf0nz75PEL7P3L81lKZhKuT3KewoAEfFtB31Q/M1MT/e77GNy5
 DOkfOX7xAnN0DO7TgvzKCT2m1s9O/KM77M4xESuJLcBRZoE6/51r4F1AkKqOyNfnlhoSE
 ezvXZ0IMJnjsXPIwDc7gUh4RfRV2JHxuMOT8Ks7txi2UsgkKfF1ggMMP5vYIJSfqVDLbM
 uYJAuE1TI+aLUC1B2+ZV5/GjbILozgrSxaE+ZM9Ca77o40YrDP1pr+3q+JlVCuiooAU+2
 cZWinDXaCHTCxiX9zveZpffPObUtYUS5KGKJt1S6yctitRoz6LtErxpOer3enC7UclA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A6FF414C9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F2E28A318; Sat,  3 Oct 2026 13:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3ea0f9c7480a1504a64d5f7674ddcc4b11e3397
X-Git-Newrev: fd66866c9a9bfdc8430298c3db33a1dd8319ce22
X-Patchwork-Hint: ignore
Message-Id: <20261003135540.4F2E28A318@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-certifi: bump to version
 2026.7.22
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fd66866c9a9bfdc8430298c3db33a1dd8319ce22
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 5f4706fd37..a0c24e66f3 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  238385f505d22767cd1860661f1c5743  certifi-2026.4.22.tar.gz
-sha256  8d455352a37b71bf76a79caa83a3d6c25afee4a385d632127b6afb3963f1c580  certifi-2026.4.22.tar.gz
+md5  926857e560a3ae443ee35c2de270d75b  certifi-2026.7.22.tar.gz
+sha256  741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55  certifi-2026.7.22.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 474b147873..17c6925ae7 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2026.4.22
+PYTHON_CERTIFI_VERSION = 2026.7.22
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/25/ee/6caf7a40c36a1220410afe15a1cc64993a1f864871f698c0f93acb72842a
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
