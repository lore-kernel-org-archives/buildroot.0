Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C06CC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4188C406CF;
	Tue, 13 Oct 2026 20:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-_f3xm488Ac; Tue, 13 Oct 2026 20:57:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 559ED406E8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925068;
	b=eA4NXnJ5CygPHJOtnyPQLpg/U+jF8pPxVSEurBj3O1vkSDi+6Vt72K/lzby6uKE0WYrP
	 r8nRpT62IAJdF3MupqTA4MmVXKXp/rzfgD8kNapUG4TqDIv2+wcz0w6CyJ/g2REuYv1U/
	 95Ehih+PzjIvqbs42PTgWaJoLGCHv4RKAyM9BX6yQ+Y/rqQ9fVLirfwr6rNTMn5M771/K
	 rwvtyrmNbbuTSQr5rXpDhfFqYRn7PQZucuU/kVMx4WINp53Bjj4os0K3C4z3c2H3Kwwsd
	 E0vWvqnzEcePfGX85ktWoTkmJY5uGSIeJxyXH97t6eSgDqK8APybVebtVSZuEc4mdcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925068;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=caI8351NPdBUkpnGWDNJLQHiYaxDpeJ023FngHeHKeE=;
	b=elYJa1X4dLtSLFt76yuVTLuTECwrZ6P6JSqZNCbite49uvAQarIJfuYtpLiL31uOWQke
	 QQBNttVWM7jlrTBDKsZCPxGh0BVv2c2UisMhZFEkTnkDe9OInvssQRJju908UIP+0ama0
	 J4jbR6UiV4or29v8wLJGYzs4Gjk6GBo8qYYbOY+jxzEpgG/9ubZiZG8rijeK3yT7ElU1V
	 b/pDWHffWHSfX1PPGx+ltU7+3SHwnflxdNOW/l5gONjtqHgrnUGLyoGvexk+GcBWYCg0+
	 5e61tWzu8KQiJtIi0xWx9sqOfh0+FXhTPwElucl9B4J17n2bOhAecAfrX/fdZ3u1j3w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925068;
	bh=caI8351NPdBUkpnGWDNJLQHiYaxDpeJ023FngHeHKeE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UdQT3vNDer++Lgo5ZIv3EmpCMjAeE6lTVlZhcaMzwFOmxeBXAqU2tPFriTjoC++w4
	 3U1Bt3L8VR/+/tSOe+dYFPl1PGEizlmziVKd4Bwbo2NO1qmJlqLVROzy1cRkg/Wmgx
	 I0UapHDKEoih9o+BQDlKiZs1IWJ+MkqFMbggH3ORncvmoxWorbxUBfzDrHYvIEir7C
	 2GxXIvWtAaOm5wWCDUdpjaELwJ76diG5VIfMZO/XBw566A1qIRV7ONQxmv5A6GNbqA
	 WqfxeM7+3hKEl6JgU6k5Fa7ZeDZr/Avnt3XtUng/F1Iio4b9IdNkJ9y42KVIMw3siV
	 YVGF/h03F/IRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 559ED406E8;
	Tue, 13 Oct 2026 20:57:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E79E62AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D62684008F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id so4jel57oSGy for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 28320400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925055;
 b=kfFE3t6shcLtNA27KSHn0zufR3CaOtfeFpNIK560ig/iagaDZfLs/qsVV7tALI74e9gG
 +0aUIghiCcPTayxh4B/Gl56jYKQ/TXFpAv+2P6FXoVGQYpE1NHSlKG065IiVjFSElh3pb
 oeyvtx2dBLvLrqsvZfgbFDLrZJ09kNPXereiBCNbwyz+EG9moRYXkMGKjTJiNfxIVwMpg
 tzJFV22Hu6JD1uQ5TNp78wnIaM8pmKGLPYETbJmcSd0cYf+VeCZIgOxTd+RnX0ZB5pweu
 aK18xzU8B4I4JjL5jhFVHGTiWyDPF8h3gVnyeUr8NlOPh28yryzasnzQJzlvMpyULUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925055;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MDv44sRX7dNkjcynNfMjPhi3VdB8t07xPgfFneREZfQ=;
 b=jV0Cunx9r7ETZUdhPRHKj27sV6k8N9x6RhwGhQstEm44Cd2YdJTAK0Lf+j/IMf5azH+p
 q1sgCrxUMsAJBQ58ek5+i87m0gHBDhHu/08blcPAzoWsDP1jskvXQz+b4TNgq/4nE+q87
 il7AUWbKlPh5aUknXEsSjoEWqeZuJc7MchhkNty8xrPxLRxXtGIB0IgzgPFWjiKatOkoH
 gJNvYHKi4Pa4tzproVkopbgjArDQEsJ/pOFAaZ1q+uCwBP4K8s1fA5bFPmPNiszBskOL8
 afUTafIUVyL5fSdPFXa7D/NNW5Sx2rtadFUZHbE/xUWoGDRZbDdRNi9DqbrSJf/k2Wg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28320400DB
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4015495B66; Tue, 13 Oct 2026 20:56:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:55:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4b3da6de31b7fbdf7b94087523c8effa026c178
X-Git-Newrev: efcd03cf457dca3991d5c49732f20224924c2b09
X-Patchwork-Hint: ignore
Message-Id: <20261013205615.4015495B66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-serialx: bump to version
 1.12.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/efcd03cf457dca3991d5c49732f20224924c2b09
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Drop --skip-dependency-check now that upstream restricts the
setuptools-rust build requirement to Windows and macOS.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-serialx/python-serialx.hash | 4 ++--
 package/python-serialx/python-serialx.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-serialx/python-serialx.hash b/package/python-serialx/python-serialx.hash
index 36ef9681f7..11c2b7a512 100644
--- a/package/python-serialx/python-serialx.hash
+++ b/package/python-serialx/python-serialx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/serialx/json
-md5  e9646009ff5c2b7149cb7ef63df94c65  serialx-1.11.0.tar.gz
-sha256  38a4b60212d994449c9f3314c523ec629f1ccf629f4767b3867c7a5381366ab9  serialx-1.11.0.tar.gz
+md5  9b0b380643606d0d84339bbff9df67de  serialx-1.12.0.tar.gz
+sha256  e19e45ba198e919b86952f428376207c8dae39b741546e02e8e5657981cc3b1d  serialx-1.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-serialx/python-serialx.mk b/package/python-serialx/python-serialx.mk
index b0bfd48a61..0ce0a81112 100644
--- a/package/python-serialx/python-serialx.mk
+++ b/package/python-serialx/python-serialx.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-PYTHON_SERIALX_VERSION = 1.11.0
+PYTHON_SERIALX_VERSION = 1.12.0
 PYTHON_SERIALX_SOURCE = serialx-$(PYTHON_SERIALX_VERSION).tar.gz
-PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/9b/c5/8c3f3e7985ca108fab641cc453ae015e1f6f15344064b99f115281c8bbdc
+PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/c7/68/efe61ac6dd5fe536eba0a3a23e92d09caa9e78cc59f97bdeb594a0098ada
 PYTHON_SERIALX_SETUP_TYPE = setuptools
 PYTHON_SERIALX_LICENSE = Apache-2.0
 PYTHON_SERIALX_LICENSE_FILES = LICENSE
 PYTHON_SERIALX_DEPENDENCIES = host-python-setuptools-scm
-PYTHON_SERIALX_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
