Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32918CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA06E60652;
	Sun,  4 Oct 2026 16:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a1UcISJehYEU; Sun,  4 Oct 2026 16:08:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1F989606D5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130092;
	b=OOec/HQ+I0DRBXzDec3SwA/3kfm90QcDAo6W7B/pMCZdukXFPXdat18hAgz2q9xPWXwr
	 0QAkNhvVSiFerXl1u+8SxpMNtOMqp58IM4PQSRlbtELKsNda+yZQ4Df78LIHOrh9+997D
	 rvyZVbrufvTjW//Cxsh4NILpnGPUExc2lPWcb2mjl4yfGBE+uLeLnM1BIh9q/ewEQcoij
	 BFUTyoG84FYJh5KQDG3Bykhoj5RKdNK6EuNTmi6dAVT8UdQBkACzY6qMEV5GhBfXzo8GZ
	 7s1bTdWrSzpiPOlQ7c7flI4fYN4v/EhnuOVc0ASxyuT4ETDPuQdVZ9fJJySNe7x7X2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130092;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VyEDMks1VMcCuDgzVLOrndDFdWGVNfZgLsG5jYVKiQI=;
	b=E1rWeFrbhLYpHCQcBNN5k1PlKNd6U4h5ZCqex4rIYkwQbjriy8ugfnBT2p04zvObsnur
	 4iJdJut5eBEAILF05UNqaanrBj/TdqUzVvPF2FbCd3feVAsWMaIvg4zqDSqyHTlsbkNV2
	 LHNwulKusprt8SYGaHgRR5Mcc8G+vvFUKSDKjk3gfky4uIcP3iqsF8Pqb/h8+eKoLVAu3
	 91BHa4NSjwezcPA1fztfg+eaFng7eRk9q2dyXEKgHscyMRD1NuuWuKm9hRoJJSFXpY7ns
	 iDYQgSLWYxTFiC2EEy9AWFNg40qrpG7neWOuzpsGtsDys/p14QzAtvG9W6lC8uz6WwA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130092;
	bh=VyEDMks1VMcCuDgzVLOrndDFdWGVNfZgLsG5jYVKiQI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pzbyQKgro8083svSUstjkwO5Y6+cgPWHNH1HZ8mMqHSYc/RkQgANtKLOzXk0kehYO
	 yP5ai4nAofS/uzg3F5DBoZx8kPrvjSjRuJyrMBWHPBgd+F4d4n+z7xEEy4VXasA+73
	 MABcZAPYKUh0n3qBFSobZjRZzWx1UVLbYpT+siZBGRDqdiOScTdpFFbHAX8KqO5ydK
	 fv4+p5Hwbr1n6Us2W2yp+osPnshz+nCcT3t5A0qnf40PwrqPR2l9JFwDQPW7LATrrY
	 tV/5KoXEK22aoTGIpM0o/+pqXgauBAr1x/23z82rwY6I+KR2gtUMxnZOcfhrsadoiV
	 Mp6CTFnh+MRCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F989606D5;
	Sun,  4 Oct 2026 16:08:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C7FF435
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D9E860664
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ex-E78YoxiBQ for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 742CC606EA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130077;
 b=YMtxVoRbHHMU1657UEyGL0wbJEmMk5ZGW2789tOUJs80t9MQm/5s2EjelozAfhqhD99a
 Cpj3Nf7fwaJI2EOr/VyJQiQe+Cu8Szz6qNwxkd1v5lzrXLki823d5SGCRn3GcUGCCaEuS
 tU8cOUL81AuLgkQUOevIXYkZTBWF7W+j7VERmkHUXuav4Tcxo2ZbmG855ZvIoQ6rMf4em
 xrMrp3YsnmxqD6BWw1MdsCDCZ8S3gfWyvSBydStgqwGiAlf9NDDpIqQNcSaI9ds8Gsjad
 mwuKNbauJlP3LeJr1x/4T5belM0lxIh3dEVfEXTW6rRkecppT1haoU/adXbRPeXwXtQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130077;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YWrT3bQf+xy0wN49/0PkR7KvDSpsrFT2/fYDDB94QNo=;
 b=DfyPgP1CYuAl1IwUF74dE3zWPcToGcl+u7xdppnhUyip8NX0iR2G98+QAFJ1GUsmMrMJ
 +HnE4Z5Qjfa7e2x7T/R1p4Sm4xQ1YCEmkbBjfx/4/VgpxJz0VyZkxkYo9B68xmqk9TS6M
 jW2MO5+UboRgEK4TlNVltbtnfBK3W+1abPAYe8DYFUUwA8YTfSy3NEIV0dmLORTFi6qS+
 oKhZxZixZFITE9QFNFKzj0Hebow2BKkbcgQu11xEc8D6wKiGEP7TxjKNY9QoCeBwlqzn/
 XvwAXa7mDLtxHcGnF17PYeYpYY2sE0GcVfrrTA4mtHfwKFkAvA0VKYl9A94XaY52QhQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 742CC606EA
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39B4B8D21E; Sun,  4 Oct 2026 16:06:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 18:03:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a398dc7a543f7d099911b227a28bc4e0c3577423
X-Git-Newrev: 5914a445d925a2e233c910e0ca20c47690b1426a
X-Patchwork-Hint: ignore
Message-Id: <20261004160642.39B4B8D21E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-selenium: bump to version
 4.50.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5914a445d925a2e233c910e0ca20c47690b1426a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to copyright year update:
https://github.com/SeleniumHQ/selenium/commit/fbd3b6de2f8f79d9ab0e7c86de462d454ef4de04

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-selenium/python-selenium.hash | 4 ++--
 package/python-selenium/python-selenium.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index f2048092e3..4ac6965323 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  fc578e57f98032ab4d89193bfdfed5dac965362d08aa436b8b713e182ea43f4c  python-selenium-4.39.0-cargo6.tar.gz
+sha256  6cf2734ba0e1651163a936122739140a4a9689226a58f1c57fd56ef67dcc3fac  python-selenium-4.50.0-cargo6.tar.gz
 # Locally computed sha256 checksums
-sha256  1ee8454a0696ac46b0d5b67f85b2a0e3af2b7726e1b82cd182af60fd285bcba3  LICENSE
+sha256  307012b4481479a56605420e81db14686a0274d246d06d224c363ee09297d330  LICENSE
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
index 8308325ffe..fdb9a5c7fe 100644
--- a/package/python-selenium/python-selenium.mk
+++ b/package/python-selenium/python-selenium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SELENIUM_VERSION = 4.39.0
+PYTHON_SELENIUM_VERSION = 4.50.0
 PYTHON_SELENIUM_SOURCE_PYPI = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
-PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/af/19/27c1bf9eb1f7025632d35a956b50746efb4b10aa87f961b263fa7081f4c5
+PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/1f/6c/09a5bdf96a5f850a2bf69ee670a246ae30a132dca3975c7fb081aae09338
 PYTHON_SELENIUM_SITE = $(PYTHON_SELENIUM_SITE_PYPI)/$(PYTHON_SELENIUM_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_SELENIUM_SETUP_TYPE = setuptools-rust
 PYTHON_SELENIUM_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
