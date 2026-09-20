Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96063C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6209A40E71;
	Sun, 20 Sep 2026 14:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjXbB7P5qPJd; Sun, 20 Sep 2026 14:19:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 80D9340E49
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913975;
	b=BuTU5uqOhfhdIwaE6bfbGdjV8DbC6Ole8eLl5vOp98rZyF0OM7WAyq9Q0gO80X4jmsJR
	 Y2TphqvYYN4q7sP6OeKrQzbWj7M3/1a+jmF5M+hNb2mhyE2cxRcSPab6dpy/7fAJYddAG
	 VQaCfvuVrkxpdRpmrkx31QU32gnDf8HMS8XGqq4zTlDAomeFBDl9TrsmLdM9zxpXF4GfW
	 HXdeT5014135mCVtU27LCjWD2XqrPIHpWrO5m51xoIF+V3o2BTFkTSNlUhZ/jjRXT+dWi
	 7ju5Efo/vd7inxMoFO3GGfU7hgIaHjmIY7Gop34JLWL+/oFJ7GpGhBvqdDc+YWbCIuw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913975;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9px9d3qOtNpqdDl3zCxSkXoN7KMCzOx5Yk4Fzmii2HA=;
	b=dyxbUHx3rBjjL7yDPpd5DT9fMIIiTkHf9fXWesdbCDRzcm/S/JmaqUBdNcdY5IQUnSJp
	 Y4FIrq9LwYZ7WI9ffN/uckzUXzVnul2Tz5yKUNn8FngXSaF5cDeaeItp/Qdb9uYKUYIa4
	 oVNkL8DARUiDAvIib7I6+2HwPoaT1/GSBdyVNchDjSBBI2o55YiMMqqwMFIvaJH79Vu8a
	 xBR+eAuFRiY+c6aqw7brkes59a5rmBM9p7ZrvWiIRJLRt0EDjkiTjLOWp/l3D90R9hBwD
	 W/9nrx16tQNyVcsoIzgrVbdy4o491mfSFSPS3SoqcBTpx39EOLl1aS2mTno1rPgmX0A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913975;
	bh=9px9d3qOtNpqdDl3zCxSkXoN7KMCzOx5Yk4Fzmii2HA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qoCcCttpTPK3BLLeawr6CSOBuE5xAveRaaEfHk68fyCNeozHlAsFcb936Ju92ecqF
	 U2hKBvhnrP0YQsj9CUCNMcR20K1OZEoUCPEMhESWp28I22XaDX4nlCxF5UQI9vw0iT
	 fP5Rezpa64Kc4FuaSwzNDyCmmqKRqdGeKChpFegB4r1vH0UKSyf4uRrFgXs/LrEgnM
	 3fel259RKQIQs4S3ekgx4vBiCZ+k7vN0mmofwJDHab8GcZCzRDgzCWJmOQ6D8Wdx8d
	 TCkVWQhpEJH7RZQo8162ZENe4Yx+E0x5FnkVLuozON4EX3Ch3V0JM1DjV3I7shIk92
	 xxHF1q584Tudw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80D9340E49;
	Sun, 20 Sep 2026 14:19:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DE46224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03C34400D1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0fTW7mkUY6PL for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:19:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0C83440022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913973;
 b=PeT732K82geoBqhEqC3WYcd+YmAxqj64aorGbbc0yos+8XyDCVJWtwXHktUXPoxjfFu4
 4I8oxnAikz7au4Q5RvIuRCnBvX0twgXCYOLl/2BZE4PbPH0hiv8ZEQUDV0LXfWWBL7KIN
 86sOZw8wWAx5iwdS7xcpuHsjyiovd+OeoZil461RGqQa3ZNG4CAXs8WhQY0fIyRRoChVq
 OqKoJ0AfNIpyvZAFlWR/uYtUgozLamndpgMWidOXZGnHVBE35jpneLBXk57CnkSOPPgL1
 2xJqG2FHYkPCnkq0M5L5HlB5pggjw7uwYyVodY2vLwzgaAorpaRwJ4eQ6j5Es46ttkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913973;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=40iENv0yBWyNrjjHcKXw07A5F+SLvc356scGKiuAJSs=;
 b=C05/ztTMFglgyuGfQb18qeeWNNXX7GjpHISvsfW4BhY9l+Iq5DjqVyqhJSZyC0HMxDjO
 ps+3UY8q2Lq17pJWMSHkK04Hf3fvjnvDP8JhULTLgOrE4PSnjgiWAlptw//s+6HG6opfF
 QzmJUgacth/9sgP+YN+kCQ1WCiWt20bjcZlXrchxZ6Vo77VZbShve56F9DIhQVXnP45yr
 c+cH7EK0wo2LpohVQYESe6XA0PpUrJ3qheqmB2og7o6i3WwbcJ8SRfzr9La1dNw29xBOF
 V/D2Bjl1x3tZUCoB9rs9nghyq+Uy5Vdxfn2bLlDSx0QGN1BzAfBT9xOdbtgwTisAelQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=OaPfWj2I; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=OaPfWj2I
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C83440022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913244;
 bh=40iENv0yBWyNrjjHcKXw07A5F+SLvc356scGKiuAJSs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=OaPfWj2IqmLRxmoSJGSDgBCTL82zxtgJX3rikV6p8i5QDm3GZq78Oe5lqI8xazfGB
 8MgWKI2iM5wEsUdlek4C84cIHDh6+f0UmkLsM7i+Hpu+eJo0bNI+uR6MTAz/Onb6XB
 6k5PFuuhZYdgqHfaA7gQturp1MsU4VHI3Ogq7ZbbMbEAWbU3C9Zm5Au5nR6jyqBff1
 uUQ3vZel0Kqjz0GzLqmxfCP+2dkyx/o2Uw3+Hm0EDECvbL5SOX05aD2UDSzkdHJlgr
 NIHDwmk+tl/RUDs9PO/Rtca/+KImoBzsFfm5sjHIUBk3MY3V110MNRSZ2AVWVM5qlP
 +60xP9JgRqz7g==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:x4tpkVtwQXpLs5xnv/GbUJIbZMfZlSKymx1OHr7bsTg0qmmZRPPKIgM63L+tYrVYUsh/+BQph7KKU6Ij2fyWuOIoLC9dP0p6ObtAOJW82HsCAh9KsskSsvBHAiCLmaIkpjYNgLfFZKJjAwlpgI4xkCFJG+ePjUDWTOYsTw0adt6webjJYn3USRYAcCM2uZbl+lbeqciZS9ESP37ipF72YULu4Fjnrs2mIeOGaT0YPAzvuPlxfxf2epeMtCLAMHtCUtsEB7qJJ6jH304RH/46GrwRmMjl90Q0eaiXK1GdlCWxWWWW0jE9Ehmgm1//Qccvb1tB5yiPpbveZjpIyr+IkJisiGwxNsR2o1bmFCWDWH2Om4wABwTsfHdFJsMLGevkD+vX4VKhUcts5NHwFF71tZFzPXf3Cdpb86IRWNWxzBZXg7GGp6BUOjM1Wl+L8IDx1AKB9BBeRlZ4S39VZ03l4NFgUexRgYNoDwcbY0XBH2GpgUyiMVIFkwjHd6JLUgs/rzQFekujU3BgYDlYK9A3LO3Aw5hAdC6QIjx45gECtFGHXMfrJgfOI/rjxs9YZxSHG3CBCXSgT7NaOHG79wLy+fQywrb3t/jjPaItYevLz+HCkx
 3cFe7qE7Z9AMv9LDvZEk/O6wUlZhkg5wCgkwIky/kJLhUKjuglvmKVS/EnumuX7i5EbUSn7gUDJfDS18iENhLZYgb2IOAYN9JwvboJoaZNRTqiXsa1
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3134CA4C488D;
 Sun, 20 Sep 2026 16:07:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBN-000000002J9-2YEU;
 Sun, 20 Sep 2026 14:06:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:51 +0200
Message-ID: <20260920140605.3005461-54-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v3 53/66] package/socat: Add support for OpenSSL
 4.0.0
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch

diff --git a/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch b/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
new file mode 100644
index 0000000000..6c53500d02
--- /dev/null
+++ b/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
@@ -0,0 +1,35 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 13 Aug 2026 07:00:00 +0000
+Subject: [PATCH] Fix build with OpenSSL 4.0: use ASN1_STRING accessors
+
+OpenSSL 4.0 made ASN1_STRING opaque. Direct access to struct members
+(->data, ->length) is no longer possible. Use the accessor functions
+ASN1_STRING_get0_data() and ASN1_STRING_length() instead.
+
+These accessors have been available since OpenSSL 1.1.0, so this change
+is backward compatible.
+
+Upstream: Submitted [socat@dest-unreach.org]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+Downloaded from https://github.com/openembedded/openembedded-core/commit/aa435ebaaf7446ec07a88586f2de4109e02a2d38
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xio-openssl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/xio-openssl.c
++++ b/xio-openssl.c
+@@ -1898,8 +1898,8 @@
+ 		  case GEN_IPADD:
+ 		     {
+ 			/* binary address format */
+-			const unsigned char *data = pName->d.iPAddress->data;
+-			size_t len = pName->d.iPAddress->length;
++			const unsigned char *data = ASN1_STRING_get0_data(pName->d.iPAddress);
++			size_t len = ASN1_STRING_length(pName->d.iPAddress);
+ 			char aBuffer[INET6_ADDRSTRLEN]; 	/* canonical peername */
+ 			struct in6_addr ip6bin;
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
