Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDEBC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1F2E40D74;
	Sun, 20 Sep 2026 14:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dMyA6l3pwkQq; Sun, 20 Sep 2026 14:08:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B5B6640B02
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913314;
	b=Mjp//iRifO2s7oGL0RYzrVl9o1aRaIHG+4TEvgmheWzSNTjrkNYTFhWHJsxUf/Zo86Dl
	 N/Uu5ydoFhPHUDuDw6FY+Le7Jw9XStXI1c/mSzYaGLGu3+xO9nnZ7fSe52sPhv4M02cKk
	 iA/xNQkbqFnX79Mu013eCo9AS1xu5ZuzrkGxMNCjcLvKRhxqOhpYO7snZ7sCrRBP3qg8E
	 t34e+xQl7et6f5uIukV4R9rGTAzq8kR/1Qvqk6N4Vdy9v8GFQ7S87rpS0HsUQLGrPMBt2
	 /cZkzxkQMb36B9ZMPZpesvXLsvB/TpGGjFMv4ZjgCQtkZy6esKgq6jeolyyR+Q9zUCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913314;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=235skMEz307yiyV9CXz+xd/ZQkAz+x4P3WQCD2hRQuM=;
	b=AMn3sjFwmaXOfAg5P7i9zMVg5ZTNB0CXHlkcQxtQAjUJcbsdTJJzl+hq2PETpXKAjf9A
	 o6xwsqcF5VNRLrgnvlRlAxux0DmjIgZNN+UEHAgJSh2gz5ciu3PpLis5ylol4nt/JcG8X
	 pHaslWHcgU/KIlapFLo6wa0qU9pjpzI1aDJ/FuEKlHkBRJ97dUopvT/NY4NFxqmRY0v/E
	 nUTx017ch2M0/PcZxDDrHp2aXVgv4uf/9lXKfJdKqWlfd1pBy3oPyZPUWveHkN1AxV1IM
	 NGaaQUE0dPema6pUQDdvIoAbd39xYErVoOwaSsyw4LPRSwlXCvgiUfEGCx+rD14p+jA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913314;
	bh=235skMEz307yiyV9CXz+xd/ZQkAz+x4P3WQCD2hRQuM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MPeyxhSTnRTWg504KzUGMNoioPS5++FqJkmls6YCH5Uoo3hJ6sz4QYkW57/8vsgHt
	 dmeYWWrL3OmOC2pE8Tp2jcy5XTBiPFXCSlJqnuGjiuJxMS0Kib+q8x0VUQHAFaFZtC
	 kSheiO4po0MIGARk0byN3Ljne+NJVvD2ctUwr3X+wb5R6H9I7qd2j8g4KpyBRLmmhl
	 suh5tyTq9rlsajlGT1pjAqkJm6B49B6WI0iG65WSDtA/lusT2eJ8/OrJciHfNiPGjr
	 V6IRpReo9AkCsEPCKl8p7evxZHuKlzHv09uodEmd7gGgWzyRArBOMpkkGjrJT7uS+q
	 tsaEprrwsrzoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5B6640B02;
	Sun, 20 Sep 2026 14:08:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63A903AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55394605FD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJvCJJdI5lzW for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:08:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 667AA60621
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913312;
 b=QLT3QIVH65fWQE1PiBrgVGabI4X84nkygV6QxzMD5GfALB+dnOL90Cths8xdd0njyZ11
 1L1Ftzrly+TE7aJLLH+sBnrCvl4+OcjstaLXRdtAcia6wUj0g0cHpq4JJ+7vIAZxfvFOY
 N4zY3ExpEltd4swYe/hxN/E1T7eJYMa5wXfUA+OSE7IpevageubM5BS+lJl5ij4JRZfFd
 hHwFKiOfMdK2q9eil06WFRcdMtaYRKBl1p19C76tMvIHlUsXjNW64iGrNO3bUtPBRhwh7
 ycOxo21YT5u9cvn9gu/947QUq6947RBuu9qYKb1uDk/BQOJb8+Up9VdzjWOQEBU9b9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913312;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3aKZb4LJYzzut3vuILtIB9xtnqzSTwUpR3VdLJSINBs=;
 b=BOm+P48bn70oN+pd9Dss7eaiVXOS32XDshHsoCbhAtUr6Th1+Jya3inD876gMvMZAuNS
 VkVZ762THNDzNHad3wDy1uf8D6Z2verLtHOJvzgkoEB3IU0L9nkVFlfYDUstzGiMa0EhC
 sgpk8FI3CN/Nn0Ad2QFzfcuuGqbllxSVCKBDeJq7QmQuWDx0XzRJQUAZ9zUfgJLo1zvpo
 5g+HJ8qHr9EYJ/y05adjboLsS7hZ2RuwPTHtfqJhe3WkhnADU7VUUJ64X3SNmhJW7Dt8I
 1JUvjqVvs9i8f3a2yAtf7u79G/yqyY9ZKr8HjosNIDI+hXebAAc605KMXa5WfNGCEZg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TSI8putl; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=TSI8putl
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 667AA60621
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913223;
 bh=3aKZb4LJYzzut3vuILtIB9xtnqzSTwUpR3VdLJSINBs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TSI8putl+llcgkoDeIpg5UhUXtWTaIVTINzy2hGOTjNtB5TiH0OLo8UHhoRi8Fx7o
 aKQaqrFur2iJxLJFJPxD94aGfmohD7wf1a98a+UFaUQTXndIgDUuia9bqOEcjpugTd
 8Cm6Zhfbpfkdey1vnq/bokvaKrzYY3IQ/ElHt3YNC/VIbB8B2M+A+4Smvzo9VsaLTf
 Z0jQuiHB8To6fwMcOFrrI+ahkR/l0Q9dRoPqaVVzawGWUn1/i7K3is88BJWmqEj0Zd
 CDDEL48fPsfJeUP3iGeLVUmPEhO/c2UdEztsLAKXz7fj2rYRZMIbh3NeqqOeNlP4xt
 4MJoKB99ynvpQ==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:S020EIXslzEKsDUdCi7G3bhIkp4OV6Q3/CC/8SqdxtyEPwi8c/PG4OmkFgip/fIW123JB6gqJWX9UQmEwZVrOoSvU+48jFqhv+s01F6701Dc/gR/0st5iWo6Iy8fwrauyMGgRRQQdM0Im3jtpZ0zT6k6bBVe6m1Yb98niWLWlSq+6UqjmtJtRQ2waAFa/NoCXQaWLi/D+VOEr/ppyZ7SBYo7iAP00s24skRJelA3SVUGGQpKg0gIYC64PEEtElvHin1i2p/DmW09c52+WjlgycRksaeWtVMl+kvrv4RugUDKea1XIeGkA4LL+qGDYJkMsCUHzR11rwTK5qltcu3vrG9fbcYNRgmwAH0CVZpZL1LGSUupBwZ6zu1HVcUWWRy/Q2qSUqRtCUqKTeIuBWzcMjND5Hj+8zCwFeA/v0bKT2GyPw3v5SEZeWMx4CzZ91kJvgaQGmIGPpt1VT+SZf5WRhPO/MV6XOsTEUnIQrNV2YkGLW+MNhHIV9RfJSKnTq5GqRxv9nZIW7leHvukCN+nVMeQGjsl+2U2EhJXZCHp2QCMTzcG/UYtsVmDtjE0kpRguKaiCLSHvcchsEy4+KqMoMlX9x+DPze27xK+s5tyKJjgbd
 3fBcu4GDHLC/a+EgDOF1eJddgcRRhJpjJ4rCH2BRYAle3MPBSclAgnStsWC8ISTIagXMqulI1e
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 62FD5A4C484B;
 Sun, 20 Sep 2026 16:07:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBO-000000002J9-3FnE;
 Sun, 20 Sep 2026 14:06:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:58 +0200
Message-ID: <20260920140605.3005461-61-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 60/66] package/thrift: Fix build with OpenSSL
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
 ...recated-OpenSSL-API-ASN1_STRING_data.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch

diff --git a/package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch b/package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch
new file mode 100644
index 0000000000..279daef4e2
--- /dev/null
+++ b/package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch
@@ -0,0 +1,35 @@
+From d586077a37e14446cf385893608ea9e60a59d083 Mon Sep 17 00:00:00 2001
+From: Brad Smith <brad@comstyle.com>
+Date: Sun, 23 Aug 2026 01:26:50 -0400
+Subject: [PATCH] Replace deprecated OpenSSL API ASN1_STRING_data()
+
+ASN1_STRING_data() has been deprecated since OpenSSL 1.1.0. Replace
+with ASN1_STRING_get0_data(). ASN1_STRING_data() has been removed
+with OpenSSL 4.
+
+Upstream: https://github.com/apache/thrift/commit/d586077a37e14446cf385893608ea9e60a59d083
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/cpp/src/thrift/transport/TSSLSocket.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+index bb8dfd13f..48b96ebf7 100644
+--- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
++++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+@@ -770,7 +770,11 @@ void TSSLSocket::authorize() {
+       if (name == nullptr) {
+         continue;
+       }
++#if OPENSSL_VERSION_NUMBER >= 0x10100000
++      const char* data = (const char*)ASN1_STRING_get0_data(name->d.ia5);
++#else
+       char* data = (char*)ASN1_STRING_data(name->d.ia5);
++#endif
+       int length = ASN1_STRING_length(name->d.ia5);
+       switch (name->type) {
+       case GEN_DNS:
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
