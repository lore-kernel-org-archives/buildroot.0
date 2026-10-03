Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAEFCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 11:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A5E381170;
	Sat,  3 Oct 2026 11:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMVZkZrpKY6f; Sat,  3 Oct 2026 11:37:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1BB438110F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791027428;
	b=iPfpgIkWNozT3LqO6tVeAhXpTyxI+6QvuxXFwhHxsW9K5qNt+jmUn1mB6TVjaR9z3yKr
	 pQMZBawgEWbUAihR0RzicjVkgI4VfWGZ/8A5LpkYGvPmnPm5e6zgaMd9CWqiY+8mMmjhk
	 qPkx8mqWnCNO/FdDkNAKtwQj373lDdKImSegjgo5whV0C/HrkY35QTAFi5a8NV/86F0Ei
	 WCx4/2NNPWIVK20AvkMgQ6nUv6ZbRoLJEA5S5JnB+xDxtaxCJiRjfhDpEO5JiUgFMfVP7
	 wMFbgJbKjWJ3gUQchssSVs9IHajjs9PnjXZoDi8Yi1RNkCG7yKJ3a/HUYvxJk5v2Lvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791027428;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Xf93z30lDCtgl41JxvuGU6GyiAJUoOtxV/LRexhE7T0=;
	b=bhBVsX8sM6Z9pcfz5sqNuQ/vH18Q56euiQGshoD9lN5adBrkgFPKeItAIqlbujhGPbOU
	 ac3U7B6UBN+zB5hBYOEU0WBLLT0yOU1qypXRCmklZgIjn+eeIpK6r0+FyeZJDFmGHax9K
	 bxehFJNxsCzNr5JAeugLgJKEDzAyrOVR2n4n1PFE4/7IZd0RlWOFoyVMWSbQo5YKAj2TA
	 CeFtPQvt9geuo1qdQooK5ZNI0L4uSSFetnNqkvVJOjxAcRSK8AsTYEhQ1+EqjBy3jav4s
	 5YLjRfHWMmuPom/0qMAcv8U7cJ1A/597XvXDkj8q8Z2VOaAzIKeHHwQgvcfGHGB+XsQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791027428;
	bh=Xf93z30lDCtgl41JxvuGU6GyiAJUoOtxV/LRexhE7T0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kUuol7J/9D6dsakyx8CWDJK3wONIQ8+1tUWbc2+WLYg2KxatVgmc9omSL8Z2sFE88
	 mHE3vDjh5CV8jkc9+m3Bhk4IzZ2KvpIvMCXB3eWlu6psTvx0YHwaEBK3bqytSSrTHk
	 1TE25J3OjjuwLKNdAHhI5v4zY3jQ61Yyf9CKU2LW9jxrj7midiRnndmHWml7U2G7WI
	 q0TPiYzEGSR0wLhiM8P7d1e6HAWzFt9Ei/KpisPtVyBdsiTpOS4U6CV3dE49CVV8be
	 gIj7Nv73K/CcTgn2XagWoRNG07743f7RaPpUz2/ej7GdTXMmA3KqLkH1XKDkyN4UaG
	 FjyZbL7Xr3ZFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BB438110F;
	Sat,  3 Oct 2026 11:37:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D5F94B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F60E60EE8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g8TghOCm5EcS for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 11:37:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D8C8B60EE7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791027426;
 b=EZjdxYgmbkNZvQkviE+HKKCBf73eKobVayvZxZtbtOsyiwzUCg7B1mMFvn4l9bisc0xF
 1k1TzPrRDtp+C28D99zr3kUlwdHb6kl9pPVIAw7PgjPJZp1KdmbQqK9qq8X4lMbANXo0A
 QSotJ3bm3CGwFbVJSsyiQ3EWF0sdqODeJ+w031rvguCayY5bN0tfo1RC2e1+z5W+Zuf0x
 AKmOwOgKmFdGxaQDZUrnvGYC87PjzqiGJs7iEbQl9+PER3MG8miOgO0ndsThbcoo0wsTN
 L50QTIpCH1WXTgk49GdWP/UizMLauKEp8ygFKeRBUtJCZp8Bkf2STBHnq7JzXkI+I2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791027426;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=38UcP2dHGD4SY4XaybW4mPhDtYntWk9cJv0rV2O9QFU=;
 b=YxrL4YzV9O1hLz64OarbCYFoYVb9d0QdL08KNeFz2fiGNQ3BHOPgH50hZ34Mit90UMAN
 D596ueKR3vPCYwekOS9IAs6lMoqYfVarKI+ogKt8SwqHDgw7sqhllTwhqUmxW0Y+FOsq1
 nGIMARhBnNReuDgV20+NJEZF9f6xh3b7h/BpHZDSOuIS7yQbKRkDiscHs8WVkwY3OwRgD
 mIV41cJ5v5KgrDa+60D7RvEmUxOkeAV/vixdmwA1w9V4P7ClP1xFB8cfPCva7QyICRZQM
 cxVqa6f4hrwpzH3KXFQt/QR/ZHtwi0RYe+hHMqe26iB5Nal7185ORVm44qX2NEGFK7w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mqj5Dpcw; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=mqj5Dpcw
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8C8B60EE7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791027422;
 bh=38UcP2dHGD4SY4XaybW4mPhDtYntWk9cJv0rV2O9QFU=;
 h=From:To:Subject:Date:From;
 b=mqj5Dpcwvtx39imNFavbpyjQbFdcUOXReXgyhm0ovIaEvAXFHDZjMVUzbsuHeNZqD
 Cn1W/M0Hxv7g8ry81tcMSA2ptZWJ3pCbsX+AjTVw9YVkXPR/8x5eF1OVbprFQD2usG
 iNPIQJtod87U2hmO3tLlkfTFwKM0B8/X9QtzWmNkzg7ePgv0c6vcXo+z4ctZUoXL7x
 eDU8LjquRu/9LtWHc2bJQiP/3pu7QT/6wQjmf7T40sUMf6jaAgxHQ8qgnB450wOOOx
 CmZdFhJG+QceYCGPOtXE5t3GghPChY0dSAd60nkX8agNUsNcBHRvEuRfVkfW/hMANJ
 LeoPG7vviEFyA==
X-KAS-Sym: v3:f51bdf72230551df:mJPA4SDfLhxPrRu/FWFbTrUjAikigelt5bfgAZJ/yKh1D
 dzcXGnwXwN0DxfQR1jnq8cV3+HePCFFc9qEWGMyQTxWIOVeQwix+7z4VKSzQI67YJ4UxZMF5f/r
 p1eMUKVlDwz5hXumilNFhdjIAmXJ5OugUQIdZAvc7GH2vk8HHjjPKGxH5+fFVo2Pb5c/BM2x1df
 REcC5kyHhg0KNzUonEpfxMUTaunWrWw7y696LerWmocIQb4YslOlNEa7hvkZxsruA7g7TaJCj2t
 Nip0u7KSNsXlkEPupHpprzFYj9LAH/JtaIKCusjg9Y7hh7BSXrRGvd8Ih6V3byu3tpPIpGYQ==:
 71k3hG/Mi0wP1NqQEOku0QYUj6nO1FzofmTGMtk1AiMqeXamxh0Yi1binGY0zl29IGPQ7ifqpdY
 UaQRVZkvw3NJMZABgTkMZ/WI4EdKcpUit2xBsTUrk23yoggDISnMtxKn+QTIK4FV0Vwc2h2oHhU
 9Z/yvFpMcpQpvWWRdroARU42moui1CEWSoqQU0R7f91PiF9UVZULAlMwUIwt4RUSN21GoxSKxjO
 nwAQ5G8D/Tz7MiOjIB/wTm8k3FSz9BBwiGLOHjV5xgDi0srOaDe21sJrI2WhGnA4Q3Nx8QUBojD
 7ScfBD2NUJDqTovaUIUo86KXYvn33YegC8EgGwz0RPdxCWWzyrZv8al5qf1/cGQPDgckD0FSWgd
 Qb4CzBvV5X8CO41sZtjJ+cPBGuk5uqdTnIwd2n1EY+r+aaN7rf8RL5pbIxaWRiMjhEV636D+RbM
 VsDPmbGVynrek69sy702xuFJcVII8IpQOZl1lC7XcQiwklYbZoC2EsealCAqltIwftQW303MacW
 ZylhzFRut5ecGlt1gCDH3j3iEGDmI6p0BMR3Oshz664QbalIrL+TjbGZ7xKDwxqz1dWXY6xiJZL
 59s=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1EB04A4C5424
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:37:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52972)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCy34-000000005Zo-04J3
 for buildroot@buildroot.org; Sat, 03 Oct 2026 11:37:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 13:37:01 +0200
Message-ID: <20261003113701.442358-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: bump version to
 20260925
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

https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260925

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 6f465fd679..78aa1fe4df 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7614616d7b2988c278060486f47de716ef44c19317928cb45ac9e288fafd5bd1  intel-microcode-20260812.tar.gz
+sha256  0ec19023dad1e6dd0c5909174b8dff2555b91cf01671e36271a1ef36655c0cfc  intel-microcode-20260925.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 9c97b0aa5e..4c16142a69 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20260812
+INTEL_MICROCODE_VERSION = 20260925
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
