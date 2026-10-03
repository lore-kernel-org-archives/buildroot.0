Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A188CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E13B60628;
	Sat,  3 Oct 2026 07:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q82qmxb2mxXd; Sat,  3 Oct 2026 07:02:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 313EB6061C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791010960;
	b=rrZMZ8pk5fxW6dBz8xvWCNQ7+FuF1wwukxPe//efBZvOXsHTPOZgZEdGkMi26v3USdZY
	 IAfZ+E/u63m3CXoaoLT5IjpHcf8oAT7aFDYyuJ3+YBcx7Cm555KjQ8E2OL6HPNtCpYyXH
	 JJj2z88bPN39F1LjP1bgSIpmoV0iyy1ZEtfP5Ucw5TnVn9HUZ1uxd0LEx/JGhVZa//VfY
	 SEz3K2Mx3dR1yOk0IKNRBIOdpSFZZaycuVR3V6udX2O7DsYnss+sYOg5F614TEWCm166L
	 P+GYeaIkkA3LvBjDl9YM1YeeeAA4DyEuBn8BGXVovi01LUUVYhtasXzXK7RLC+qS7Zw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791010960;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KOtHMyfnFS7XvGcvw7PBeivv5MuEZSrrUlwjmxh3fpI=;
	b=BFafQl/W4HjWGf5fPsc4erVHtdWR+9WNE1t1Ps7tUxWUEHSRrougKylwnP85jddcJN0o
	 yWV1cVKUPzPHw2t442H5o9rG40wxKlEwg1Gguoo5KJpuWtHI2crk9u6oaFvj0u3FpXa2W
	 oDQL6ntzluUfQLxaWi7161Fz+EYOfllecDmbqHoO7ASPWzi3xGTODqqj5okE0uRH/6UM3
	 C4WrGJA2QtzKENWlbvStAW+Cee3i8aInrZ7oKXDmiQ0cI7yFNGYeUkoNys5mh2pT8XF8n
	 kbohPoUxVD5SgHnFH7x+ixdeXbrfrIMSXFHNpzouRnwhUXLbpyFmFOIMySo8ktM5APw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=NtgoviF5;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791010960;
	bh=KOtHMyfnFS7XvGcvw7PBeivv5MuEZSrrUlwjmxh3fpI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Alal0oKOsTkXAof8gXJoJas4OUw9rVHVNtr+gnjdV9qazYVxukWX4ncjc85D3BjwN
	 TcT80QC7GcOUEpwIDNfatAVbArldvNXgkB2yvUamGjT3rey3qlzeQFdG+xecy1gKLx
	 fgl4x/Fdmc1DywB15PH8hMpGaT+SGJv4orGxjvg2kOtWkyxVUkkuGPAxJVQE5Y5Zja
	 B0tN2o7MzOvlso762oPkjKMc/D8L+o/D6gRHGxBTvsBcVXuk3WmL0hilPOHJbSOipN
	 jWq26dQFSVL2tcfd3xE5EQi2f+G2v8S0REey4Z5kyWAVW8qxu3jt/30vF5k6k84R7p
	 VBjMU3ygHIJPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 313EB6061C;
	Sat,  3 Oct 2026 07:02:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D2E5E2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B95786061C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gxxQviyzpPuA for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:02:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C014560609
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791010958;
 b=AN2xpKUEfstswCerPvGojXjCq/VDm3SLmZMylnaQIb54yARzh6wRdhHqFxyWjqeoAhAM
 VnZfmW7dnio1fUiijtvc17ruRWTrqzc87uZqrbCIwU0Xotb1dyXHamF1KMd9XSpLA18Ja
 iI0fpmZl80XgYquG3fwSUmt8L1yDUBnrrEpczHtLYKq41fXHEP39Fb5ck1c+UPbigwA9H
 WQeiEGRWnusF5k8GZDP1YG4Ok9c/g3SmMYz3AM1/mI9Jqbec5saYfXkbDcTRcBbtvBT+e
 ZirstkTZAPgxVMDrKp1hF+0onbNYpI7NAs9Qio4ondQ7lM485S2jcnpCLI3iMM/4G1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791010958;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=LwiCl9ZZFLfZybaon0PUbfBSygrWX/t9Qe1umwVufGw=;
 b=NMZk40pWAzsxMODUmMqfuxVHYDPy3zMwfBZ5fV8gSySs6teYrhiO048VR3pUzIbyV1G5
 /ZcRRtsvNgRMbz1iiPviqmm6M8jHYQ1vZw5x9nFC61mw9HoAYSXY4mlKGjUsflVwo/DBp
 S4aObdh6ZcDhmGCmVyVMNgN03EUcZvD0+LK1viCKW1gw3l95qjSGwJ+M9Uqa6vliWz4Kj
 4BrYjiBxfUSsD7D2tZGrT28yYiyuC9vKpQ75xvHEwv8WOKkQ5lWNHTGKrX8JKYw7JC+zz
 dmYzCZTLbvPaTE8osecIyliZ/kIzsL+/3ZEGuGvj5FVe6S7jw7LiiLWu3yx26YMw4NA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=NtgoviF5; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=NtgoviF5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C014560609
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010921;
 bh=LwiCl9ZZFLfZybaon0PUbfBSygrWX/t9Qe1umwVufGw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NtgoviF52juNOCi1z2nYm7MxxOO7cSrFF2tgEj7dEF1oIu3k4gOD9W0rah4/8qQ1c
 7s2Fbf2XyqMJ3zTdqlaZAbiL4nR2FB2wHuEuCt4v7JcLJlQYrevdkEx3TE3XcajPV+
 sc8sIT22rV+XcCa+6URIUFNS9JBRDlHfezfKACzc9MerM7FrqTzyQLNhLrTrpIefoG
 ud0ETaYxLQtAMTS6C/STTzr5r+cXg57Lfcl9o44g8ZpybpRfleqV0uh3BdGLakYTQL
 pysWGXWaZVpkMWVG2QSX8zR5XtU/dl6Vg3B9xaUH6EWNX21PDQTyM1wPr0CZv6mJd6
 /jtjUAr4d2djQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 S2VX21pLs2KFTIRyItApiF/gbOJ4bpEgGe9GuENDfPeX2gi2zzqwUl7SNpWsxuqkfxSxmzc9di9
 Yy5InKHyCXAdi5x0oJl0JGlEDkFBOgVE3xwU4eCWBnos46NFesXlQC+307NEBg/ICFQbAiNMLJO
 nVDCafRRaQl2hBEqs0LH/AjErXV8hjgwPW3ACvIlIlRHLVnHvCwZCyUhQGqdTFXDFvmWP2HpV1H
 EQV40gbHjgGyGPoTnhMNrWPjndwcMLb+yQxrk2K4Vlrs5L7kDRwyVB00Cyh9Itn+jFsXAd16Kje
 irgnKUGwSAcvUT5V1RRuiWk0ZNt2yJzL4shH3tJKGwGW2FM9VW9JkP4zm8Z6M7tCYvwp5B4Ir7s
 lZQJSC8IK/mN+HkiudCx+kXAj9+vPUG7Bs0JOh6KxVjAqEjITYUSfo0EaTauTSP9lioWc8ztsmZ
 cRVUm6dZslAAHngjDN4u7vkONbO9aLWVijTbKXmY5cLm9dRkRsap7eySWl4CEooxDXm8f11YftE
 2oe2M5y4SLmmOtDBCcUFBNipmGBW/uJx5WJeUDcsbEDhmlcvdKeGjWadAOeBrtrwhlc/Pf6GJiM
 wUlqviiif7DSEF6w1bWfzr8OsSV46KYDEEVNbCemgFaJVyyso/r6Z5HkZ0orGoNOa3R04Fo+pck
 sfCyjQ98qgDl4b4UtgKrY
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 820C0A4C53D0;
 Sat,  3 Oct 2026 09:02:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkj-000000007Zo-0fxF;
 Sat, 03 Oct 2026 07:01:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:16 +0200
Message-ID: <20261003070128.1295458-104-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 104/114] package/python-urwid: bump version to
 4.1.7
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-urwid/python-urwid.hash | 4 ++--
 package/python-urwid/python-urwid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index ec81bb59e3..b106a0d9e9 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urwid/json
-md5  d9dca1925cd4f8324cbb4817c22ef85f  urwid-4.0.0.tar.gz
-sha256  58ddc5c65eb3109b69e2e95469553f9f86070645cc1b553d6ee3fe8dbac2e0ba  urwid-4.0.0.tar.gz
+md5  32766817ecb7ed597cb2822939c63b03  urwid-4.1.7.tar.gz
+sha256  e69c299f0e9cdedb839d5ec6d58d31b08fa6895cfc5dfd59c8cb016377aab26f  urwid-4.1.7.tar.gz
 # Locally computed sha256 checksums
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index b6622864a6..58b212a61a 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 4.0.0
+PYTHON_URWID_VERSION = 4.1.7
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/1c/09/afbd44c7c57b1124d94ffe6321154798b816bd09c00e0aaabb701583a1c8
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/6f/55/ae4b607277b6c6a7d02e145e9a24c777e5bd2b9189d7145f0afc731bf639
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
