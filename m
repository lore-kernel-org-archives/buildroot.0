Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9DECC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F11E76082B;
	Tue, 13 Oct 2026 20:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XUhWMw4BUF6i; Tue, 13 Oct 2026 20:52:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2192060830
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924777;
	b=BREIrVTRu+WhE9cFvqqsogr+uGEzoiFhWATLLlQQ+OzIS67SuZJkpyZzwxHx9mFz9LRd
	 B9tzwXBurBUNltheCQaHodauGoBIo1Sx8DGquA07hGONQQYLMyT74suOSxVkx3RsEsKAE
	 APoOnwQUjNUv3pyOmz3Qzl7z803DoQKSpaFayWpLWzmwhXVwAGmS+ld+FFtjC34t5mGOX
	 TAvdAao4zr895AFfpnj10/msps3S0NIcJ+w7ViJ1I5vIBeBb1iTHQVBVRCjyBkg1b8DOg
	 xp90P6ENBBBkzqXo5i2XPQK/SmcMMrquOfpYhgJDcb6zAqs8TXO64oh0OZSIodRgjIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924777;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7DkyZzokK9XlbXqZIGHqX0uLycTtmhxPrkVryjiVmxw=;
	b=d5C6nLnqAoQH8YiC6EbYoWBjmqTiilJfqtTrOOCRgwkLs6gqcQqHrmPewNKtzsd0CgNW
	 J9M95kpvBpenVx5zIqWNAsceizq0yuQ6hafRT5qx4GJ9pTHBzbAwXouD3mcprXQ7cjImd
	 XyoAYDyugdptlvg0/5f5YUpaIj0UglpY6fwAmprM9bR6oBSoo6s8iCqPzWUvEjLQMBWJU
	 fZlgN1efTXxladCBLi9dSEq+3j59QaXiQ2b1fCCrTI6IjNLumwreJ12Tul5e9cVCiGBT8
	 bIEPrxrik91xExWLdtTBcM5ZC1pEf3Ej85rPwH7SlrE3oS9eGV7Kn4kPLLdFsnYi9wQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924777;
	bh=7DkyZzokK9XlbXqZIGHqX0uLycTtmhxPrkVryjiVmxw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fVw8OoqoXSCZDzbH/j+ny11f+3x6TPuseUHjnpXD8Ff8Vy3YYVfk7Zy0IFX9E7XFj
	 1HT8yKZX5VuaqTQ2CQWPoVAahuqv6lJL69QwZd6zUpsGycd+gNTGbXwlh2ZjF6hODq
	 a7fgUV595I+rA8fntiHRfw37/Y8YIxWe9NKHo5Nlq3eL860I3l41SgYQIW9fLcCDV7
	 2kEo6jEboVlXOE4LeKv/F2XxmuJ6PXUFjV3IhiUq3C7hiFXtrL9mVoRE7h68WMbsjZ
	 iC9lp6PajR7Xb3q3Tdww5v2PZck91LVJ3sOnlkY9DpaMj1iMaPG/ZiX4+aMmtuyCMZ
	 xHFQ+Dugc5S8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2192060830;
	Tue, 13 Oct 2026 20:52:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EC9243F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D460607D1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2TmcDSHMqxl0 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4FB0A607D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924746;
 b=l7r/nUGtWaiXCy3sVoJkGs/qsStCS/3BuetI2D6D1Wpuq6rfdev6mkkvR/oZH/GVIEBE
 pGCZdLJqhTjcb9uTfWTdEixZkRjKiADdLeK6o+yh3LPQSx00lHKcex+PcqI7cd20p5Xzj
 5BW6DAB1NNo7Ff9hoE5h56IM00ViHyV1IGjOWw0DSr3HeAusldVfg/vpoWGZYYVrAN66L
 FRV5q3CbotYBoXV0LIVSFzuTyb5xE2p7wPMNAkYFhBfAi48IJeFCaqQ/pwzwR7HIpDhdS
 IRr3xQ+q0tVFaxjPycZgPOluC/zkiW8OrKLruiCtwhYIMjzeWRpN//1Mvk0KMCwPW4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924746;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wB9e3sAAsdUyab40gBXtQeCScgvg4hsCM3IP39oWifo=;
 b=hWMJR0xE9d8Gdg9IAsiibtBZwrVEpHY+aqGIwUoHt42Lbe6DGS3GnGRQpK6tnIH4jszo
 X8BxZ3P/TMl/DO38Rw3udGE2WzynHmgWVcheA9pPI36y6ud8JUU0rzNktIXdiog4eZptC
 Dw2GYzK2DmMGeyl9Sw3oyM3coP/w1fgBCQBIcMzMhG0IymCyqoeMJZF62l8zZ97LUuI2f
 YXywX0tS1ir+pLziRgrzSGT0UM7SFvwoCBBD1Q8eqtBj/LrHCyapXhCQmVlc4WL886ANL
 b83BK6UkfEfqOiYPh77agwHMdpCq+XSaU4YfszIjGA4fNpI2QVkZkHNLZxC4us0h7lw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FB0A607D5
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A1D3956D0; Tue, 13 Oct 2026 20:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c642f13b1d5e3a7816cb83ab6a518fbe0728f173
X-Git-Newrev: 73b26ce87e19b24e73ba87e5e912faf3440bde75
X-Patchwork-Hint: ignore
Message-Id: <20261013205106.8A1D3956D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-platformdirs: bump to
 version 4.13.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/73b26ce87e19b24e73ba87e5e912faf3440bde75
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index 7f7590a6c8..b9051298de 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  7aed05d0c6d803af78de34d929e51bac  platformdirs-4.12.3.tar.gz
-sha256  427fc0bb321ae0c5b037fa03238ca74820437be162e78b4848c4d4055b9b766c  platformdirs-4.12.3.tar.gz
+md5  5872f9a2772efb2608f4444b5339f833  platformdirs-4.13.0.tar.gz
+sha256  1aa0b0d3f224c1f07c295121e312a5a24a180d6ae5a8425ea1784b3e3863e9c0  platformdirs-4.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index 9610dccc64..dba59abfdd 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.12.3
+PYTHON_PLATFORMDIRS_VERSION = 4.13.0
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/42/23/4a86fc741c38c5b69792a4ef954b281afa69bea9f083f881de1b0d23bc07
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/80/a8/66d45abadff219e36e2a824181b8f6a67e7ed4572934d6252c71c29d5731
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
