Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E41ACC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEFA840704;
	Tue, 13 Oct 2026 20:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ex5uUSmLxutv; Tue, 13 Oct 2026 20:53:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EF88140705
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924784;
	b=BjQPBURbG5rwkMzRr/K0jJTS1v1yfozIvHGpysxgYx3gfQPjOHRvmlCEHbmnQHPmhTNo
	 ZM0fx38/2S3eiBHelzMKix+HmcjTc7xf0Rx2Z6PvdLGIsKTDcHB79owoNvV27vc48a1tr
	 Etfv9IMJ5ocNFQ3HCxobdmojn4osffg29U3M3sddqTaZOVnhCNNs0M0y6Bcp7mV+wrTgP
	 IPgk4NgV12BR9P1uGXBexIPaJRNP0GPZmHrdUuhrQ1yjttL0mBf/+6LceJi0rmKDJ5g6z
	 tCxCML6qs5ct2NPeYBwPBGexuKfK08/aL6jncPOgn70BPiYR/YiHiBU7nsPoE3heNIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924784;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jIpkW/YYSzB8xyGjZc3GW8gboUz4LFrZnUPkPvqoqTs=;
	b=S/MvdNblapcMxPtMNhxqrXYdOE0sl47dLOKkweYC5naYQdwTcfKj1GavuPm/ftaX4m7N
	 i6lcH4/dPluyhA9z0YbIKUKSS4+2TSdnwPlOH9cwe4QNdiZBwJXxpmbwPHToAheBv+sl7
	 iPQ5i3YsRc+xF0ShmWeyrcPA6r84r44Q/bUHn1JKAIcvMcelC/wFo5loCuwCeeHe0WV2M
	 X+k0gWKlmmuHVSR2wAiRw0zpoiTZuTp4mP4fvw3o9Bz2BfWU4QFcV+8h7kr2JkvvUq123
	 99qnlfsQUnBRowZ7R1zUXCqE7UN8//fmQEKKI4lzDueIDeTyMOBL69Ke20wwY/fwZXA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924784;
	bh=jIpkW/YYSzB8xyGjZc3GW8gboUz4LFrZnUPkPvqoqTs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U2zAS+SMF8IZjaKa977gUgzbiQ2aAWadaJaBEXD2SZLAX5L0ZKNzCeix9RfHUx4zQ
	 Hg0pDxAoaxrWyep1fhFg2481J1x681SdBN6R4ufSZMrcmkPsYkxA7oVxAZKVsVavNk
	 WNNlTXwnoaVN8W+QHX62LKt7XeV5GlZBPj8WcrytW4PteWhf0F3G4DvtYVuZXokqcE
	 cQv47qbv7FhoNpzwn4Jqz6DGQYS595AC+26Y6sPa3srr+gfCwZjFWBDHL9V/GT4ad5
	 KC/ADiAhC/tFGXihTQmdYKakMTRTq1JDLSjJfZuq0pUMJRk1imtIOapPBfmGVn6YZL
	 g2qKJgZE1qOHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF88140705;
	Tue, 13 Oct 2026 20:53:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 78D092AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E966605CF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2E8iWM4ADkH for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A5AD660705
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924746;
 b=Cxkvad5dhUpvuf8l/ogEyioRXQXKl8ZIgicpTRVOh0p67dvNRQVysZR0Ro/RNTioML9N
 pcchmHRWdu8wCP7st8P8ou80M/ZEq02J3apZETMdOny7NL4txM0UH93ReuCFDqstzfBkc
 FBwLGy2UzaI6dlzA1s9jJKM11avtjgT1C6UZedhWeurk2oQE9KrjQDELTiuEv4SjITXkl
 +dXy2WoY5r+6dtnP3KTCYtJYHu6sHiHDzRLEDu7KjpsSiSTePFvLjyOkA3/ooXu90ilXF
 8CQCnvvo2V/XZosLT8/mYO11o6E3GnSE2iblECUHech0Xj6TUHLgWGc4U5FBegaqTJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924746;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JMXjcm1dwE034m3nWxJQk8RIlGMRA0BvvQnAo5aoCS8=;
 b=Y678Vv5Cupf9BtI+6FUlk07ctZdtpEllfziyfHLWNtPl8pIJBsdB2b+NUFGrluMOnKeM
 eLsL6D/mDt330FrL1GlvZQS+7eZhQPtqv+qCE82bnIv+33ASseSFrybP4E8uUZPAZvi5p
 n25+M5bekMj2+F91Us6mUP/TlT6Jgh7kQNp1Li9D3ALY1jR/RTH3hsJAcj/avMY/C9Lu5
 J5uMePyA81i8l09qc9ueTh3zP01s4AJ/mqOIjSztCJQ3yJUVsjs2/xc+PNoRC177M27q0
 DjrOGTlgerUg+jFiMkI6lm0YACCSyl5z38hhrwhnRyJAcaYe/Js8rMJnm74dviEw1vA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5AD660705
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF014956E1; Tue, 13 Oct 2026 20:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a22a140461b1c72695847be61308d67a4ebcfe61
X-Git-Newrev: a96edd9e453c547facfba48abc0d8789212b747f
X-Patchwork-Hint: ignore
Message-Id: <20261013205106.DF014956E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pymodbus: bump to version
 3.16.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a96edd9e453c547facfba48abc0d8789212b747f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 85eaa0e103..2e05002a8a 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  fc14238eed9f8d3ae4287e82911f9111  pymodbus-3.15.0.tar.gz
-sha256  4c5f715128bfeba59f4c9fb3542b0c32a8afd4b90081111e39c12f7af0c89aae  pymodbus-3.15.0.tar.gz
+md5  41a9113d266bc1839563a681c57846ab  pymodbus-3.16.1.tar.gz
+sha256  19e571826dff37860afc31c845c1fd2fb72acffca02a233506b32d94fa022c33  pymodbus-3.16.1.tar.gz
 # Locally computed sha256 checksums
 sha256  572a4d6fa7541553f70cc6d494fbcbee7eb7d3f2fbd16080d39b20cccda26f0b  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 40f0e14c3b..6f87d54c61 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.15.0
+PYTHON_PYMODBUS_VERSION = 3.16.1
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/e5/b8/03dace16e0e5d1c3eb16e8b9bcce9885f5e8a38db34345ec375cd70ed2e2
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/65/ca/2552fdc467e87a04654af2b6cd994a29653cf767e371792810e15f4715f6
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
