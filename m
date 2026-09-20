Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05A5C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DF0E40D88;
	Sun, 20 Sep 2026 17:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ruaYyNZdulGQ; Sun, 20 Sep 2026 17:11:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 88EA040DE9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924279;
	b=UPCZAjwZeffDGFjr3TLMZQHFJunTbLGPZBs8UgwupgwhgpBMeI9bttRe55y94MwbPJdJ
	 RfMa2JP2h1b3vvxUT8dolWYMWX/P4BVEmyjcgwOdwqplplJWMf8FalwZaXTTROH6g9Vrq
	 /QkGOXsAQ2ngHIu3Tan2pywD/cMZwyRmsqlCJg3+6YyjhP7CyWKQnVs/RLy1CTgOObcwg
	 +1IGADqLj/ybmzoK7Ntk3HMdUtOTktpN9IjI1+sV+uwdafpz2Ba976Xw3nOnn9GC8QVHN
	 Q5vD+Cu6rrc7wiaoMfvAAgvGygKggmm0BOgdHmMCxuGYDvG6mVwddzSmqHOGwJouZyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924279;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fpVOd1A/MRbpaDgz2JJ+Vwh1fhT32ciayDeIDpluHzk=;
	b=oGfMsR4Uv9C78r5FexaMsuJVX61ahfuErtkFchHd1kNdUd/abxEn2G2F5+yCIgcj/IZ7
	 asVf63kJQmQRpNVa7359an3kj5xbJJ2Wp4s5ldJmuIAjDZ7fqO1aLzTGW+4N254uO8WE1
	 8RcQ5LvVZGPuCOA5FfOpAOqpBtUNrIGt+DLv+HItL2Lz0AmqjyC/QasFszZY1rYl7cXb/
	 x8zjNJy/4YPwX+UUop/YoS4w0QRyLuYFmExzsl36eg+2QtKb56PtAKuj9k6aJWJP+YvXb
	 IwfEgAQ5fK4uYRfaSp9ExJk9eveKqsXM25FavS+sDmZ+m6rFIK2SdVh4tOVYwCdk1JA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924279;
	bh=fpVOd1A/MRbpaDgz2JJ+Vwh1fhT32ciayDeIDpluHzk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ise3HqgIP26feVrO75PGmSTukO/xNkX+tFDecD9i/JIVhh1pNhTkLLFsNUcgvspiy
	 jKME/oafu5vhAGwmjpO/nDcsTOZdNQlBELLONfVxAisdeBDjN7R8QfgS0ZQxWJrv6o
	 XEMdOBjL8xFW0+3V/HjRsrn/CV2Y9Pst54PIgpaX/iQg7R7B7xfzOvCEa6KqGxSuPa
	 7amASMPIhxMEMSUMUcIj19jRbqhp2ivE7qMEw7NNeckV1QIKVp+WHfPSI7G4WFVP2a
	 /9QvwbPuWm6IpkZ1HY8hCSCsdbNVSRDwRcfDL9JRnNr6xVT2VOhMw4VpCVojjVlAlz
	 o17D/YGZ97/XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88EA040DE9;
	Sun, 20 Sep 2026 17:11:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F705E4F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7167B4007E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FvbIFtabzQ1 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:11:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8B75940022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924277;
 b=OUDUfucKf+Hob8L1kzOGnhNiJm0eLtqwEmSnbV1aYQDLK/pnIC1kWnQBfXF/9DipE/y5
 t190EaERvxqSHOH/kwmO9zKag0kZEtSM2eCZcc8Sqc6ymgbVK4bAbZMQ+PEqkhlIeJAJB
 CcsiXTb/alOIiZe/sUoZvy9J8xvtBiFyeVv8yWJDMhyikuUj6b6DxCziUjQaNrpRidiVk
 G8LMATvHthzSk5M2Xfqn6NFCWjRwlIXkWMNEEbRI6A1PYfdcoaNYeLlR/pAQzhzzYivqO
 KBeuSI+b1bdml6h0SXWmZYcKqWCJphNyq2JmJ+2WN/NGcffKQDejqVv2g9+UUsGBVWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924277;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=OKN+zq+s0ezsuRpVS7QTYc0bNz6nRlCMaQ6LL22JouI=;
 b=hJmLrshzN56Y4HIpNtQxhILRlcDqLEpd0UNpl2I54m3L+2LHPh6JTIn58Y5Xs52rJFnN
 9fbTGjTkKmFyJ/78/2lUS4LeR7mE3YyaULGn4Xq4x/DYs0Gwcc41F8PhPXzGCziebUDe5
 nxTwRMMkl4MPaee7B3cqPW/qJ9NF7g2rvf4qns5Rzre2TQNNy/gul08g9yvK1LsAZOG44
 MBRrJCgQyeUMJyoJnUMYshZX892OqtWgpr67vBLx0mnd/UFd3NriqPpj3IH+oxL+92VI1
 C9CT/Rza70MaHiYJIGgr5GVmT7WxXz8k6nB50OCpshSRi+mN2u12lU454Da/R3PAauw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mC73g5u5; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=mC73g5u5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B75940022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924145;
 bh=OKN+zq+s0ezsuRpVS7QTYc0bNz6nRlCMaQ6LL22JouI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mC73g5u5C/eYHAUdEIJEyxx/e2EP2KO7HBLssUyyIh72Cd9kE3bex+dJ0xvRZhqml
 cCiDdtUaeLnv1CQh3gY7JdB8vdLXMyIXdUb9dp1+lNkphXkwn0KcnueN0Dc5YxTM2B
 cCqbnXCLzNAOKiamI4+UMx6dHPuIEJxGnM5BlVdfn7k7YjHifjxH1qePyZbZK7Vu0E
 qzr5eDG6AjRDFCh5uOLOhf1OJQaRSYf/odj8SsX0RLNR+r8tOilzLSCWREG0T+YFhz
 GzhqR76lmyoAaTMf86KAEYSIOzQ7oidbuc47pqfLPFt3/Zp20q8PCH6aiPphCB+x7R
 OTfhs6HFeIObA==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:O0mmalXYHaDCpNnIZ40xiVHvLfKZGFt6+VF9uTXPnU1w8jnYAIYsQLUNzGubGbFLDfEYooYBW8yaeofFBLd1c8EQInLRhAhECUeaZ1hLOMpkeEfJ7lBaBapNaQnUqQRK91ekJ01aiQwLkZZRi2+AJyRrsXVyl7kzOf5KVDFcBK82QJAFPDhUGDEPDEqzplEkSCQA30uLRDxsa+LqnGC9kKgafH7YpA+h7552eOS6O1IGSf3N4x73vyZEMyeLaTv64VgnJOfdGJY5sdZNvNQc03APpj4EJE1KEuybvAPK1juJBwagSwyv4qbIhzKqP0oa5WCfqjtMSs3ac+pAeHICqaEsNsQl0sOMcrsEF8MVpMmo0SE7CDM9dkfq25dbLPAAQ/KxBfTFwqX9wg3hXcuGn+/xB30kCsWR4puyHNQ2yuAjxmBpjfD/iHKy2rUGLReL6lucLLLnHp9bPxtJ+oMJiRgst6p2AEEYYzwMGwNBSDkSAoEUd9fXOHal0Bo61bFqTNMb9g5EmYny+zRxcfJxlZiteUg1Pjdad2xAiy2lpz8dxoTD4czdYalFxGC0thOFN0idsVA+3wN/Qp54Byhv1KfzMQhbEMY59cgfviTqQjrmnS
 nzSxu2mH6jnFcduOqw+2x1oXAP3sUME6jMgCCP5FjpYjkr8MqQRt+it30B5xA1XLhcu6q0eLwPWy8CqlF0KsOWJ06tiam7qjP2lyo8z+GLC4JTdGs=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20391A4C4871;
 Sun, 20 Sep 2026 19:09:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1g-000000000o7-3Im1;
 Sun, 20 Sep 2026 17:08:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:08:10 +0200
Message-ID: <20260920170815.240247-64-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v5 63/67] package/trousers: Fix build with
 OpenSSL 4.0.0
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
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
 package/trousers/0004-openssl4.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/trousers/0004-openssl4.patch

diff --git a/package/trousers/0004-openssl4.patch b/package/trousers/0004-openssl4.patch
new file mode 100644
index 0000000000..5ef6cb19b0
--- /dev/null
+++ b/package/trousers/0004-openssl4.patch
@@ -0,0 +1,26 @@
+Description: Fix for OpenSSL4 compatibility
+ Replace direct access to opaque ASN1_OCTET_STRING->data field with
+ ASN1_STRING_get0_data() accessor. ASN1_STRING is fully opaque in OpenSSL 4.0.
+Author: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Bug-Ubuntu: https://bugs.launchpad.net/bugs/2155003
+Bug-Debian: https://bugs.debian.org/1138451
+Forwarded: no
+
+Patch downloaded from Debian:
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1138451#12
+
+Upstream: https://sourceforge.net/p/trousers/bugs/240/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/src/tspi/tspi_asn1.c
++++ b/src/tspi/tspi_asn1.c
+@@ -237,7 +237,7 @@
+ 
+ 	if (*rawBlobSize != 0) {
+ 		if (decBlobSize <= *rawBlobSize) {
+-			memcpy(rawBlob, tssBlob->blob->data, decBlobSize);
++			memcpy(rawBlob, ASN1_STRING_get0_data(tssBlob->blob), decBlobSize);
+ 		}
+ 		else {
+ 			TSS_BLOB_free(tssBlob);
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
