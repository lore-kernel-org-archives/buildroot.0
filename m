Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAFFCA5FA0
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6395A605F5;
	Sun, 27 Sep 2026 10:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6DO5eLRG6DSG; Sun, 27 Sep 2026 10:50:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 79B1F6062D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506243;
	b=bzx/EO42dsCOX3cUHnjazOU9ViezEFGj0d2NexGQgjC4P6MnQhZbJVUFJajt8yzrMjKP
	 cHo1DGNUBG9gNMaQwisgFkdGaJGopowidTIQoTcoWPlTy4kmUbXM2AZh35I2iyt14AcfF
	 miahAPoLy9QmuT4txm/ba+pBW0HuAt4+qN2jHNCMSJNtp1AAPXxvnEC//w4V377PFzDCw
	 zmzuHJUvG1D+bePsIazS2AYa4neGaMgW0VcqpY/1hZfoy7R9wyZrvlL8ppIR5O0km9lPC
	 YifHqi+SqAUKpFY9viMcAjUrj6RJFZ8jKqlE3lwpzxyWcNtU/LZgk4NWiOhUu4vK+fg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506243;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=P8hOHXJKavB4le/syYSXbAWAgefVbDUnt6T2NJbNYF4=;
	b=IkE7agBHfpS5Q6Sx+mKRItPNUSOk8K70Xwb/d2zNu/ZGd2Zp9ZPd7H0zSXncovc/3UcD
	 r+VRlEwrAw9HjzVvjSw3N6Dvjm/HJOd++u1jIuozC+XyBLXOGdi3+gHe297qVdtooEtfs
	 gwlpdSNvSfmq0MbFdlhB2iUmaOtyzYKUwml5/Ij//xEfbGyum7VYC3qbdn2EuO+lydnle
	 7PjZ1z6ZPOPBVn2gPhVuK1eUlU/RhhEWUgLy7QO8sJBFrYkRpv+DN/CPRWCWrDi1lWCNV
	 tWHybsquQj/2nY0d8t/Gk43tpr8fKpnFNLX9Hz7DO+eD9UKcdxEWG/FoF+tgGei/Epg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506243;
	bh=P8hOHXJKavB4le/syYSXbAWAgefVbDUnt6T2NJbNYF4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kgFX69D8rgNgYFKwcMcVV231VH9lE5ovug7O6PMFUSYeOqCsB6BTwU4plDRAdvADU
	 ZJ3rPvlcJaQC06Vx52+j9SU7QIMBmmpLm0n3AeMi/LMGCBEbem4ZIG9lXPZU1/xb5j
	 /0ZWVlUiQf1DlMUijOodDL5pNEmEboAGe25/+XFwwI310zyzlrGDa2HwT8/9S1mVzp
	 C9fuxCEjCmVJSsUmxnsVjiEZtAx60NQrqHj7P+YwVbu97Rr6rbiYPcLxEYMVoQRBbx
	 kyYPATV0lbk5Q1sHsmvmrS+uJtkMFMT8/sPiKkqhJ+ISNVwJfqQXVovbqMcnEVTyJt
	 N6HSXRLhVDePA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79B1F6062D;
	Sun, 27 Sep 2026 10:50:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 70761335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60FD5810C7
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4DfuQlcpX8m for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:50:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A3A70810C6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506241;
 b=GpOYD2tFvL1QXk3u6AaK671uRHDWEmQ2JcQcteoEaMHKCA741ehVxOQHQ3OaaG1ZtDhn
 P7FRKsREvI4HHKaV/MULnSllmr9Q33LZp35bphMFrjn6O3d4oeVEc0/YF8JLAYib/HV7I
 dfmcri3craZ2Tbm7/MwHBdsktyK/uRmQqA0UPWW1kejjeHuO7xbAaUIJ+nwnryIsDsQq3
 jkbyW+fiobbTy7D8D3wus09XO5G89H7PvfMkTBOfXg1bT9TaUJX9P3MDXzvQKJFu4UwFA
 raJFYTgh48YqJR0c0QZCkDayR84emkZ9lyhrEC/kBQ6jUl1q32mPSPCrIxI+g1ktzMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506241;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=JueFlQWk7oqV18ZJzA0M1O9sKUa3StfcZOAh8wv8LrA=;
 b=JQ2iqqlWFvOgIiuhuca4Q5wK54j/MGyT90vOkfYhvhQ/wKQqycQhuyoIMpdbxw1Re8yp
 C7SZNBWPWKXsrohgPj48BygMJ1v9WZQHo075ziy6H9HuTMTu13vJGfzRoz42ttGHSAbAT
 8QQp77GscEo2Xs6vLTXU9Dhs2jXvx4USySZGGU/iseMHz0HqNw19ZAQLpbn8PY+iICa0W
 ulSlCUs4XpJ5Hm5PXSmNzy7+Cn+9zWrtAir6ijQApEOwXBs6KT6fKEN3T//WXkBPhk8bt
 UdnDvWVa2d9icftCj/FyuahIGvFSA012K07psRde1LimXbnE/VmglTODNzCjBfE/Y8A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gcraVhob; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=gcraVhob
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3A70810C6
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505846;
 bh=JueFlQWk7oqV18ZJzA0M1O9sKUa3StfcZOAh8wv8LrA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gcraVhobSL3XDcKlAyc9M8HaRJY81S/YbmeGz3NoR2EzI0Z+63e9FTLTqcSPLeZFP
 /5TegYvkxNMxNwBmIcLIsWLUbPzsjhxybpNlaTRttXP8NbaDVhEsNoOgdWzhYt/rRp
 sUzsvQUW9eEQSq+7TXPnZzudiRco00AJmAczMufl9aTHr+KT+MVtvGXt3fdtTr0x47
 Wj0CYmd0IysMMdFXMvdsNwW9dBQLDFBI/j5j7Tou84xcJm/dlnwCaTuTaQdR6/ioRA
 MR41+MVfTzDUXIFaz6E0zDI2OJM2xevl75KSDh1+g7vaRsPHLPWKEGDUV9M1PROxTc
 yPO7My7ECQY8g==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 WzIoN+X+uIlrx2KDM7vwL0ysqe4LcYK4/x8QGhUJop0ySPB2bm47cSYXcS2VdKn8+m8eYzap3Bj
 wFxvXx0V4j1Pgsk+2ApJLKoS/Ncj5LAjwMq6Oc7FG595Ys/xa+wyk4115i46rws4stIqOqIk4vF
 PKppPKxSCYK4VjthBmOFBtI/Uz7s/TVKAbnPqsjM3Nt6AQE+WSesVz39UnHm23iY88tSq1HgZOk
 mMfU1c6bZunvFmJTDl0fK/n64Cx947vbG65GqevJAdRReedK3Lse2mAnTsi8j8v+3Hp1uDbNVVf
 4IPMX4I2Q4fu3h2X9vF1ME3US2eLvguTCt2VooztfZ81Ae+obqW6xqmzsr6qt+o+b71FsnQ5A7q
 ivD1D5zt4wJehOHSonjnpnNyGbuJiwfDUvBnBQvDrhgZKqaeMzfPSO7QHQwMVPX4Goislm402Xu
 SbYf7RKo6pMF3EfaHmXheLpCoXqo2njEm4PdNvtpmqUdhpbbEcQM2RkpROgUoOd3ADqxRsE13or
 8/1xCIHMUuGdSJOzko9FgHjlES5AjGnztsoz/QcKHu1y0z5ibSBcGfZ78xUO/CX+je/fnwADI18
 yv9sgFLN1abjRsY/e5EcpuYZX7nfzgVqXyD+9SzQr1z1w2AxGzQScS+lB835oxDwNlw/GvYNNBa
 ziqbZSlbCe+gKQ7YQXp8=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2133FA4C4F99;
 Sun, 27 Sep 2026 12:44:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLX-0000000007a-43Md;
 Sun, 27 Sep 2026 10:43:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:41:47 +0200
Message-ID: <20260927104301.1801638-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v6 09/82] package/boost: thread needs more
 dependencies
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
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

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 406a5b4d6c..70e99aef11 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -370,13 +370,18 @@ config BR2_PACKAGE_BOOST_TEST
 
 config BR2_PACKAGE_BOOST_THREAD
 	bool "boost-thread"
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
+	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_CONTAINER
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	help
 	  Portable C++ multi-threading. C++11, C++14.
 
 comment "boost-thread needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_TIMER
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
