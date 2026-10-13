Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62329CC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2343140448;
	Tue, 13 Oct 2026 20:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oza4m6JsEsDp; Tue, 13 Oct 2026 20:57:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3C302405B4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925056;
	b=La0kiJamTCRuO14D4InjKy8E4473ReNY+yAhrIEJp4BjcbA4fHw+Pyu31SHbCVqEotxn
	 0A2U4Po8fZ4fNoLlz91n2XZHTZ4ZV+WkfntYMERF07dAoQBovUAK/nnO6FdwN/TfiILkd
	 UlE4UEPiw5gTuuTha3xPO5Ji5S/Q4BHn9Nf4cTFqHxGbVM5jXNs/ZLBTDu0Uf8RdcdIap
	 ikw9faPMJWm9OnJqdLXf6FuWRhvoLhQANgmS/7kPsIt/9JNYHuy/bysT6rQDqjAzNTdTX
	 BjUwBPGamd1N8iBS48R6UmjbyauuUTj6h/e+DO81LzXBsn15pJ2dT/qrlriaMurhYeQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925056;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4Ns/o1+a0dKF0eUICjwz74TrbmcijXCFYiEfhvEyE74=;
	b=YNoIVqAlLtN6RYJMTpHIaDGgHTEHWFCLDloNmPuxzIuR5YZQ5T4HcA8+gwM5KpBBhjuX
	 cH/aZpd3ubA1dIuaZQRFx5iDYSrhkLigFN5m6PE3y1Dl8eXzYswvZOOfKxGndtiVF2/yE
	 q0ALCFH4hMwJXcY8azST+bVB4lK0L+borKpgfVuiJw8lcbEImwuXWdIuGwkVvBpDbZGB6
	 VPGFWv+PcRgy7cfPoeacrPao5H3cZ3omCRrC3IHAMZ3o67KKtJ+yB4FlyADX3y0IGWokh
	 Y2YCzXBnVXUbn5drFd48a4L/8BFLbC07WDM7OngefHy1cVNkzR5uWMwjVe8UEjG7w5A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925056;
	bh=4Ns/o1+a0dKF0eUICjwz74TrbmcijXCFYiEfhvEyE74=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I3OKG+aKDtXogHVXqoftkfdB/k4m4ommtTQxGFEEAvBw+aif4qJwYl2K8QtJFpovw
	 gCJ05XViUJAHaVHN1rOhC34YemZzw6P02VMUq1s4MuWGboPXs8XJjLlqdd6om7X1no
	 ToToumq+Bk9sW+GLIa/lUuljFqyg7qGkTTJS5I4lOshhI5D9LA8nakQf/Xdkll0Kk8
	 i/YGHqQI/D83yuEKYC2HVPeytB+RliMXR9HCUhn95uKX2JTKJn4+WD/JSl/vFIhCcy
	 t6OZiILYzfQWTvPq7/kNaaVDEWOh1rnW6eKwWSRG/S53YSB/0LYsy/b/sTsuqxri2d
	 A8ORf+O6lImWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C302405B4;
	Tue, 13 Oct 2026 20:57:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DA7943F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FDA780C23
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTWyK3HWx4nN for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:57:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 61FAD80ABD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925054;
 b=BBDOmXH/YX61kAdqW7WrDMVXmkiyud8WhDTDbNAxIzpZeWvP5yS7OTyLTr1Lz87Dbppt
 2ymYxS9BxKep5ClnTzV8Z8N4V2cfX2lcpndn+WiBNDMuH7MTyTWDtovGVKjCyzlB4V5z9
 cvd9j+cMXWuRGXnyBSPgAUI9ccq8nh9E/13qQlX1Ep/srRs+9Mth7zbOXV9hvZxMuNcMh
 z8lvPCtNjlEmXHMZjgoJpvGftbsNy1cbXHORl3A5o4a7G3heW0jD5dwlSSiiDgsaS2Y6M
 63VP3KILDyS94ady9GV3GBPTbw+HzZbX8dp/MtUd5Mez0Dl8gAaUchKFHpminJ61/ng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925054;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+GULv/nKspSXFumi4FOvjH5KuiT1BOG77T0m4Cf84Jo=;
 b=LWaKTRE5dO55oqpRbfq8Rt2/QCowUP9kDqhnfnODIrBx6Emy2LEXJ6B78JzBtrbooUgX
 F3gQ35eNsgw0UY9aW8Z2MxTeFECtHMuV1sQQVhmY270ew3K/zk4xu6l23Bso05+JlQJnk
 zrU0vZDTF9owEsiwU7BTCxTXE4xaRWZo5YMLdzBsK297CFAJ0EKLwHPLehNirQqFYwBsB
 iKANM0iFiNo7p9LnTxm5FVk83sKLAsVTijSTd5SxMY8QOBDOZY89f6IXVpBs/L8wwScfG
 HRPmiIahYvq20RfsNv9Np0rYe09pwriugGwZ0eAvLkLnhrsaWSslQSO8iPRoVOkMRQQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61FAD80ABD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B92495B62; Tue, 13 Oct 2026 20:56:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:54:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75b38bb91daf25c38d0d938e92c7e203ad9a695c
X-Git-Newrev: a5f741c8e8fd96315cf1226bffe99b4ac000a785
X-Patchwork-Hint: ignore
Message-Id: <20261013205614.8B92495B62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-async-lru: bump to version
 2.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a5f741c8e8fd96315cf1226bffe99b4ac000a785
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-async-lru/python-async-lru.hash | 4 ++--
 package/python-async-lru/python-async-lru.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-async-lru/python-async-lru.hash b/package/python-async-lru/python-async-lru.hash
index bd875cde78..e6a2894605 100644
--- a/package/python-async-lru/python-async-lru.hash
+++ b/package/python-async-lru/python-async-lru.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/async-lru/json
-md5  11ff9ba26a6a52d3ec751a57dcacbde5  async_lru-2.3.0.tar.gz
-sha256  89bdb258a0140d7313cf8f4031d816a042202faa61d0ab310a0a538baa1c24b6  async_lru-2.3.0.tar.gz
+md5  6cdb23de8d478e63e613176eab38bfe4  async_lru-2.4.0.tar.gz
+sha256  b0b0077d9b7596615b3c12d0aad4f6aeccaaa0ac75ceae472608ede89e764c08  async_lru-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ea65975679bc2093be925d520358e41096bd96fddedee3e929160a5faadcf573  LICENSE
diff --git a/package/python-async-lru/python-async-lru.mk b/package/python-async-lru/python-async-lru.mk
index 2825c46053..ff33383524 100644
--- a/package/python-async-lru/python-async-lru.mk
+++ b/package/python-async-lru/python-async-lru.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_LRU_VERSION = 2.3.0
+PYTHON_ASYNC_LRU_VERSION = 2.4.0
 PYTHON_ASYNC_LRU_SOURCE = async_lru-$(PYTHON_ASYNC_LRU_VERSION).tar.gz
-PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/e8/1f/989ecfef8e64109a489fff357450cb73fa73a865a92bd8c272170a6922c2
+PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/8f/43/9d22679e8dd0ed965182cca990d32c68b150730cce8046ad61b3179b5b7a
 PYTHON_ASYNC_LRU_SETUP_TYPE = setuptools
 PYTHON_ASYNC_LRU_LICENSE = MIT
 PYTHON_ASYNC_LRU_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
