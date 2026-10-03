Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C55CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B92540FB6;
	Sat,  3 Oct 2026 07:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zequwRVwy2Um; Sat,  3 Oct 2026 07:15:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A5FFA40F9E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011732;
	b=QnmHPL+tAi0ObUHl/8BAK4MtjHf3D2nxFi67QUwUZnzKE5pCARAw38XUk9NCM4/PRAIZ
	 b1HiJbqPr9EtI/2E+G0+0pC6tygrYxwDk8b7YuoAbdOsz8188ta09W3FfFHH1rbcW7E4A
	 Rxlwkmrz5i6rDfJgDb7OumEsKihL0QVBP4hgpnSuJd3QVsM0h4n/BQGJkM5/zbFlKeP11
	 NTSL0Owm9BSSOyTxNam55VFZdJdoeqYKoUtDnFg7Ah0N3slal++C0OPCP0nt34rW2Lhbe
	 MRVRRsAFwsrs4i+ef4zYMF0CNuAUxTJ/z52xl8OOuKGb213Bt7xV4TjfMEJBftdg7Tw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011732;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Im32ox94aGBFiUK4R/Ez+2QRhpSG9POIxx3ja0v0Rmc=;
	b=tWL80lzK09TzgypmFhfEZ/bfu6fWiYm+V+YIpluiLgiJKHcFKAJoAUeFqaZVM2iO8dM3
	 E1SRMSSfoJ1JrYDTs5KZLRsQtbTpQPK0YKpibJUMRDoMPLwgIPNdlyxQUi/P1JyMXw1RY
	 ulge/VVjOMdLCiyxNDF2KBs3/RPB8PaOtxguRTie5YMnvy6RiX8G0CSxSI8VEApXKPq1Z
	 +o6ZaR/ijS/SUG3VK5bK7/hNnlT7S/ymnMFsM/Erg3ApAj9lfmS3NK8s/oR1Q5xYEuhD1
	 I8zLZSDLkyVrWqtyN8tcvp26317IzqXrGz3qBhca1hEOfGbaRod3qKBJiTivGb6tHqA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011732;
	bh=Im32ox94aGBFiUK4R/Ez+2QRhpSG9POIxx3ja0v0Rmc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BrOsaS01mcN9/lyvyQoa6olsKxeDKNg/Ka0nYLXUAjIhnopR9c+74lNCpL7YsTwAh
	 Jjq0A1bWWYOzfhHPtR5WBJdDNAfL3RoqLmlVIuJz14wd2j4WS59HQXTd7DWp5sLIlD
	 U3u8CjSxB/usaTLMcWD/WysDVVCKG3YO27ZOJnzm8MPyw6NwrxLriQC8K5uMA8KN22
	 K/vDSz+46kRWReVPRC6FMJerZgA8Ai0P+MYbe/U/dnLZuEtBU3jUxTgQ8GNUY12LH3
	 KjWioWjdp9Uitn8R1jsgu9jfkCRvU4bRVy7wkGNfJmhi2gnd9sffBwywvgNdniKjx8
	 1ZxPHoRAQgWmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5FFA40F9E;
	Sat,  3 Oct 2026 07:15:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B926E34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ECA06064C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJcFWB_Fgtb1 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:15:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7358560621
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011726;
 b=XG7sUxxYLGrvJpbsLcE9jh72OfcLV6WY46RXGLkfoynM52TnPDGxGix7FR5UhTliRYSP
 VTjLkmD3yUnh/bIhb3vnmWYnsf9qpY7aWupECbzfiUIccPlb5dbgrfj/x4VqqhXSvqkjz
 xT3/i1JzjLW/zJsrm95XGEogpxLl4tozMl+BaeDqITWmqVqQCs9nurFBd7PBgXSPPTB33
 +Q+mOA4yWPV0rVDeTIVuZrgSAHZBYcw5xY4AcVeGqnGOo5S695fzgDasJXnoO1+y4DWUC
 JxrnzCru1obxI0qwVWtvbeJ/X2H3+xqL60QlI8YXdpec7hI86E8MgLYqErES81xnyww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011726;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=X/JQcSpR4zFFeu6w4ggl5nLjFjg2CMTYWb1J5XKtopk=;
 b=tc23/1dBzbjX26oYjAJmFoUejPpa0o9a+qBLjxyPXE/DDrgXyHuKfXkyWb/dGetJv1fk
 fTi+jauPuiR3uhrUdmXCKdZMOd5YZUvaH60JaoIhz2XZCo+IIeQY1Ge4NcqZWc5J8gCSO
 QjWwH6xxZ87KlCkBnsBXpRPG7WVesurBNKTwN/S3maP7CTqzjZf3wqXCQqmFt8E+kg6ob
 8SKl/I8ZTySMP9fxzbuhRRmwdAADXhVQJ5zklvX4xHpzZf/wwLARXO+JLYhhsHuuqbpjw
 M+mk8fDenA4xi9g/Cxy0D6MTf3mdBTA7Br1f05LrKBhYVn2m4+nLcSLO7btDZRv6KtA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=aDBu8YHG; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=aDBu8YHG
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7358560621
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010934;
 bh=X/JQcSpR4zFFeu6w4ggl5nLjFjg2CMTYWb1J5XKtopk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=aDBu8YHG1aeAORmtEjZofy8k6Vk1fUCWVHw8/+NRV6Ol7ORFmt+zeLSqZiIAAX7g3
 jxfBVWzxbjxQSy3FVNfcTZkmrYZeFUwewrNgkl66XIfYQk7jGG9+JQluLFNvBAdw8N
 axz9RYzqHuo8Ws2Ajt3YYIHGf87Ohm5mTrjzKxBwW6XeWObXAy3ExFNEwsjo0U+uwP
 KdLyZd3lh1dJYDJkhIgi4thxBBrEhINx0IrFB54NX320gKsvmjc1CZrbo1XelBQzQg
 zddMdyZyqorxOL8bTN2v/j4Q6w/gBjCDPyOsqSOaNqEGctD3Kabn/RK6Wwx96p0IqH
 YAYv79TjBtXrg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 2SD28TMgI2WS+IhCkN6JWLRDfIkkx27kgDr4ecbSNo1JR1qHr+5bQQkTK4snUu9edUyiFm8mC1w
 5oi6QtXTKh1IXQ+nuYM7Y957/eTlKMSkyJhdPkMJzcupXsWu2R6Sbl4Y44P77gHaK3FoKLiH4Su
 jaGWc4J9FwDPC/ddyPVMcpa4/R64AfY022vM9232RV+zeO+0X133PAWRxHD+OjtmSgbK9hlp9ck
 eNP+fDq/QC+IFS6A6qwIcET6wQ228s1DhqOzsy/JrtUEu01M/dcwnmXnxGfG3TvDyGiVF3kX/5w
 oUEUierhMFTNHB3g2E6ap05zphf1AebSPxT7/xXbgQgONvfRM0gklmeaCsfZAieMJEZ/tphwHUq
 m7p7nTWx3O3HvBvK5mz6Rzn2n69SDauwATK/9LQt6ywxp23zjK31XPbbdmO8KuElRD74Jp6VD90
 nd9dnbKJ5/sk9agRQ6i4AJJwbRrXttjY2XC1C8A/CO5Dmv1TnK5siddGG/xff/QYeavcCsx8LhM
 IJy/kWW2SPaML5RP7mmezNvAZLsq717wLDmrMd2lmDLHYRMqDpFbeJXORqdipGfooAQQZWtJa0c
 aMgISKnsYaUlWg+pVbo+46Z/uHIJSsOV26NR4cjtXP3S4VvylqGfiQQorM4AeKk=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5E60DA4C53CF;
 Sat,  3 Oct 2026 09:02:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkb-000000007Zo-29yM;
 Sat, 03 Oct 2026 07:01:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:38 +0200
Message-ID: <20261003070128.1295458-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 006/114] package/python-beautifulsoup4: bump
 version to 4.15.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-beautifulsoup4/python-beautifulsoup4.hash | 4 ++--
 package/python-beautifulsoup4/python-beautifulsoup4.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.hash b/package/python-beautifulsoup4/python-beautifulsoup4.hash
index 32c331e28b..7c925030a0 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.hash
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/beautifulsoup4/json
-md5  c7e801c7d4e2300c1112eeb0b21ccb9b  beautifulsoup4-4.14.3.tar.gz
-sha256  6292b1c5186d356bba669ef9f7f051757099565ad9ada5dd630bd9de5fa7fb86  beautifulsoup4-4.14.3.tar.gz
+md5  a9d04db2259b78ec23fcdfddfed5bcb8  beautifulsoup4-4.15.0.tar.gz
+sha256  288e3ca7d54b06f2ac191970bc275c1939cb46d450b255bf6718b04aa37ab4f7  beautifulsoup4-4.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  55b4d8d4b1e5bc86d10efac91b74c87bcb77526b0f5b9edaf8b9cd2adc7397b2  LICENSE
diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.mk b/package/python-beautifulsoup4/python-beautifulsoup4.mk
index a9661345aa..0aa70fff81 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.mk
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BEAUTIFULSOUP4_VERSION = 4.14.3
+PYTHON_BEAUTIFULSOUP4_VERSION = 4.15.0
 PYTHON_BEAUTIFULSOUP4_SOURCE = beautifulsoup4-$(PYTHON_BEAUTIFULSOUP4_VERSION).tar.gz
-PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/c3/b0/1c6a16426d389813b48d95e26898aff79abbde42ad353958ad95cc8c9b21
+PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/43/65/318323f98dbee45d42dff61d8f047181bc6f2268a9068cfad035a46be5af
 PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = hatch
 PYTHON_BEAUTIFULSOUP4_LICENSE = MIT
 PYTHON_BEAUTIFULSOUP4_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
