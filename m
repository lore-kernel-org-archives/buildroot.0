Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB94CA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF84B4062B;
	Tue,  6 Oct 2026 16:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id be-jRpzp4XSf; Tue,  6 Oct 2026 16:30:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CF9C340681
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304241;
	b=KUAQN8a5ObWxg7fiUDLjwCKLuAm64OqlIntRkDHJ7gwcwCggjCBcUpOFVL0xHERxX53x
	 lOKEJHi2Z3QxMGNBrAshSGrnxxisHaFRHvWauwQnBciHkWYUh1rOGkSrWsdZraUaowZ8P
	 Id/9i+ATEGfp34faK+nmZCzw9P8K9IZJ5EJ0lMVtY+5oG+Rc/Mo3TuNLaUn33JCvOT1Kq
	 J8IJvmMy4mlo9IF53k56WOL0dH/V27UuLl83usWoT83A+81psGXlmbFMiRLAumU/r3Ul8
	 vDnCZ6ihencs2tJREr1f4BSNnzQwFv35p6a86n5z4/AgryjL6TpUkyyecsG4ofdDHVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304241;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/cSN9M8mXvzxtHIdeFrtkUmMQgbdeMNjRY3lai1bJ2Q=;
	b=mI2gnMqyeYTO/r6NcrltodDTWQJGjvrWQvPdOHPH3dBhPSThsU3svVlAxIlswV5UU4/M
	 oC7ZpB45eLAiRamUN8Gfw03X7PrHMMNbSflPkMomH+mfi2Kz4L1bV8UIMz5jN4lSH7Tn4
	 5UVimHmb/c5HaAPwCinoZGBpaOznRJr1h03Kj0urwS8uiv6uYgw6IQbHfrN9RbTYk7h6s
	 LVU6mPljqb6uRwC5Q7wMBXdfm6Cxq9G+X+mud0igIze9jnBZWzu1Sg/CT8fUqZ+OQWnCu
	 87KhBo30K7Rksc+OS7n7MKpnppPI+ah8l1YiVr7R+edOJirep9outYBdeawwKCkRRrA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304241;
	bh=/cSN9M8mXvzxtHIdeFrtkUmMQgbdeMNjRY3lai1bJ2Q=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wa6qDdfOOlHz/URwP+mVaoAoq//DgdA7w5TXiv7UM/ArySiwdhopPqhJOpiprriX7
	 w06F+hsh2DCae6gyLstWLuiV0E1GscAI47dJpliysTBu+c8EiMjXZ4bfshfuHxWIyl
	 7VJerKFtZRoAvnKadMcrdLfxjGVLf/68WbwHZ3x54moI/UGtsDFtLjSF98xJgblmzY
	 KS9PI3srkcbmuRDvBxJgUenZS9oMQ06X/CTxtE37JHYG9C2mWfdSJES0fxFPpsmMCR
	 U92e0hxms9+hjICIDKwVJk41vxRUrY+dIG2mqngJas3DZ7nfiy1eLl5NfqxWNCsfQs
	 QSrNo2OojcTGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF9C340681;
	Tue,  6 Oct 2026 16:30:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 123F0317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECD4C402AF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZ0nHahzibhG for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:27:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0497E40274
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304022;
 b=AHWLdUJj0c+cr/HNYq50pHII3O0g82IkFBvIwjb7Bl8fiRel2sXgCjOXfnOeI3l7wEdr
 eTnXJaVJvieYChXF9sX7NnlUHEu6QAklRYyQOh8Nx08jYjBGRGIoMrprWfzEl9e5BakOG
 zFCDDNRpyhnSYCy8H4OI2ixDOSaBUPqZTyQm96bRACCDrb4RtUMpqBFv3x67cyOrr/Pvq
 lil4VnzX5uC95FEbixqlp7lipArtT6PTz1y8Odwi9M3bHIDtxL9uV4/mDcD++/uuHtLtF
 V3InR3m6Hk4cKu3rIYvmcqwW81So46CnXjig21a6HVUW1AC3QyAcwfNOnibrqD19C4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304022;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=n5bkT+yoQYQPpJXiPY2hGVQ25nZcbEJlRJVzuq7d/lM=;
 b=EccmbQteqv/mgkimfwTedRGgipKh6pipRIJqmTso4NhG6S34Zvt2S15p50ZLuPPmubpl
 pBp3x8vvwzDf/LKERwqgacdetmurrsPdqAFwu1g7kdKkAc+daTBxWJNsmRWDqydvB1n5t
 NL+Hvf3bhobe4oUzWxk0DBCI7Wk+C7CL7PgcG68RBwI1z7XgR6J/Dguh+TTPZjEtDA5pf
 AsyQ/7QdyvSXxPojQzLouun5bUYesc8hb7CfXvV1Y9jLSgc8Kj9dipFBC9nn/iaLiMQCo
 X7bIILlu0VI7Rf39z5Pg5RoRCR1bA1kwZHH8Qs1avfeyV4YUqgJjIu1AuFtB6M+WM1Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bCYWp099; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=bCYWp099
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0497E40274
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303705;
 bh=n5bkT+yoQYQPpJXiPY2hGVQ25nZcbEJlRJVzuq7d/lM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=bCYWp0992MLUB9ZqeJ0hfMpSpT+L6f0dTVGjCKTCd3ebZrOO482glUJV6Gb25xA7N
 ywmnuw48M3tcG1MQyB0bNt5yNMuJvD8TXqFF7KY1hJ8FGocYTeheEiuNBRm6Fx/yaU
 2hHf3GU7dm//4EOFssiFp1Qi8zvEdgqrcB1rnjx57eIgRCd8otxQaBk1si7pcSXMAo
 1KjxK0xSHIHH+BHs4LrtHQfkUv/D3FA6NSCtv27p9U1GftS8CERQzfEZ7BojTv6Kjs
 zbJagDlaIq/jR1QjnhlV4GztVesXfvyhj3r0mCsoDhkjSrhy+X75XRMMthQ5CZocu9
 cZmNVc/ZaHUsw==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 UEdkk8tdAS4CbwlMauGjtCwq3LUZGc4ApAGnyw8rKbMo5OE3AcCyGpAwo+yVXs5gEGZruKezRyL
 c4jkRcMTTXd5kPKauxOcOzxCHJcq7C1cKPcvrX9YdA9t5dMOko+W62lJvblZXn9+ZRLv6XA3EGS
 fJinza/F39qqZzW4S49yHWMwWWat0UulF76F3BV9PwyVf2/kPkbHAgOxhms2UgpYL80y/VXS4XL
 g5jXf+MU2+jgNBbUHYOfJcxyKg6tExu36ntigaN11d7WHbSwFh06KSbsJMkzcbbbnqXT8V1KYe6
 FOzPT8sbTeFjIF6a8AmTCSo4S6z8TnXuKx7fpfP4V+N1fg7BW1Uq1K20PCnRZsRKcbJFFpCvpf/
 wAgVv5PYwCLe03B06inmF1hZchHR/ZcJQ6vsoLK74KP9kiGMDGzjqb+qY2AXp9bXC6GOWl3gMQg
 CYbS0abfZmySDW38OveeDJB+n7OHkV0s+Lb/i6XZ21mRjr/XpWQhjztHzkTYYQemitajVoj2d4E
 Kkij0zBhwZn29z/i/b0p+VCTPXxkZ4kdTWNnDp1A+2FncBWfHshCnhZcU7stcZc6Pda5ufRj9lX
 bcvcnw4=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A2FE5A4C52DA
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7us-000000000ir-2orB
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:58 +0200
Message-ID: <20261006162106.3439373-78-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v8 77/84] package/kodi-pvr-waipu: bump version
 to 22.10.0-Piers
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

Replaced dependency rapidjson with nlohmann-json:
https://github.com/flubshi/pvr.waipu/commit/5d74289b7501625ab2d9098ac16af0f66b8b4b98

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-waipu/Config.in           | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-pvr-waipu/Config.in b/package/kodi-pvr-waipu/Config.in
index ee0cc2bdad..855e4ddc5f 100644
--- a/package/kodi-pvr-waipu/Config.in
+++ b/package/kodi-pvr-waipu/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_WAIPU
 	bool "kodi-pvr-waipu"
-	select BR2_PACKAGE_RAPIDJSON
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	help
 	  Waipu.tv PVR Plugin for Kodi
 
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index 96cfeb940b..04746da530 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  80e4723a228b27447fe6e83c9e2aa4e9ebfc0d2a3618fbe0491b6d2440124b64  kodi-pvr-waipu-21.12.6-Omega.tar.gz
+sha256  9e7e71df13dd3f6d01a8899ec2da794d7a5d0c080cd6fefc0279fccaf612a29b  kodi-pvr-waipu-22.10.0-Piers.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 177c1236b1..c68af9aa57 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 21.12.6-Omega
+KODI_PVR_WAIPU_VERSION = 22.10.0-Piers
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-KODI_PVR_WAIPU_DEPENDENCIES = kodi rapidjson
+KODI_PVR_WAIPU_DEPENDENCIES = json-for-modern-cpp kodi
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
