Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D478FC9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99D8C40A18;
	Sun, 27 Sep 2026 10:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkX-9CLLuRd5; Sun, 27 Sep 2026 10:49:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C4E0040862
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506140;
	b=S5/5Mm9hLCiWZT5De3rEVYKn35OXUyJ7u+N/T9tRSsPimlGTWMxLy3a3XLksWZBGcF4M
	 C8uQBw9H5/oCAx/V/orq5b4pSuTmbP0fHaXroE5yyRbSihlt/XoP4BIt+9v2h8s26qiZf
	 BU9k+LXpawqSSay6Z9YjiGbHfvlPKXCwuxczxtski7IiJmGchJKkof/XSOXaGQYXJMop6
	 IQ9DTNuesN0FGypeHXE1tk4fpjn3F39jFcbaZszHWwciWLXtNQHRdQIKBYLdSY0NWOaU0
	 H1Qbz5Xa9EuOsc/K4sGho97uflBnyLSc84/srP3cGnMUcfDxAmkT111X/qYSOzlo14A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506140;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=235skMEz307yiyV9CXz+xd/ZQkAz+x4P3WQCD2hRQuM=;
	b=SBq4Vy5I6ggD5Uhp/IJ5HMbzFTCASE7fB2SQJHHzWWfFM54hvcupjrvqhDlWinAcAf2n
	 ngjs2S8UOMCIK4fnRYlXOaHjsFe9hKGlgGqLbb81TIaDMLqopexlFriPYmilpAWZVHHPM
	 T03hbcFbj3JCoEtHx+8b4ZqJBBrcUSWL0kUg90EBJEbtDraTAnCIgSHZBk88tFFxvZ1bM
	 qNTrkBzvBlfcZq4uriO5FxthcKdjF0LlRCqxeFS6QPd5MEzVL+U2F1Jq58KmtqMsiNgWQ
	 iHoXiOblQfBeJ/memPQj6TIJWJ3chMlmYrMwcaDc6vcuZWdA/hcFTwQf/PPm/112gJA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506140;
	bh=235skMEz307yiyV9CXz+xd/ZQkAz+x4P3WQCD2hRQuM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hQ7l63uKqQVS1gQhY3gTVqlnVOTrxzsaIP6RCrKegmEebO5npg/HwvoSGGhMryGYj
	 FGuCBDjICMV81iBJXoiDbY/BL36B/UznN4BuVX20HC76hGmp0E25tkRZmHL1nMRRpE
	 Ifa9NJOqu48bLleqMBEMR0t4iigD92c/hJTqIovZEHnMKXxmAxxWyebRhni20vmFoB
	 VKwkOyw9RZ7YkfjkRj8hXjkq75JbW+R4i1PtBJ41W8kFaldj+JX4DYrh8ICt31f4KU
	 PB/cuHemkxyZ6SNMb61znQfkayh0mOti361I82aB74b5I0tmYsuX8eTnKmgBXWfybv
	 RhfA5HA0lYJ7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4E0040862;
	Sun, 27 Sep 2026 10:49:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 87D82335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E0C2605F5
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jRcYw1FUYG2a for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:48:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 745AE605E6
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506138;
 b=DRq9hw84s46/an0EGAzm53DhS5g7rkOUKl1WcnzGecxb3/tihW5SpC8Jl2GZ6RLtaz/t
 JuaJO7dKb10Io090naFeCISD21Cldc53bSs5uy8/zJWq3kv/9EWTjMXll10rghZeZzYQE
 mpMF/rzaDlZrT6yyjH4PcWaKWVEseYZWAAxBP3sfJHIJHLVo9o4AKYuJ/tiKyE/WE/dbZ
 ZXq48AaS0Pyi1JnYyu7d3jZQdR5YNhaE3/IYl5Jc88rWvNNmRKfIrFhm/5pPd8G8X400e
 zkb0hWnMCQzZUDSqaHrRS5PW98+TdTDerWhc68FNfinT/TqVc5bfS6gTFdw6lNifObQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506138;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3aKZb4LJYzzut3vuILtIB9xtnqzSTwUpR3VdLJSINBs=;
 b=baHQ8zlTqXG+hUhKvsyUdVT5LMGVOTfl7ypR1OFCWKARBK3OWR1ADkr+h6uCJbbpioIH
 eET4bxNgoZuhCGPX8tsY2qpxLhmbZPrdzHIA3ZK3oQdP8HsKwyKKU7QIL6NP9p2TVr3m2
 a8vLC0qFWxzgn7uiNX2j6/l+b8qtp5C5QSEE3fL90up8opnlIT3MA52lgRpddwJzq/l3I
 FX49bsntBihPeHTIxvniyQ2QIJIOGink/RlvxdkG7z/vRYjiMZpea3SGVol34HF0DtGRN
 YGb7dWJFlhAixNB8lWI6hl2t/gIUNf/i+aGua1nT03maYtVCojbk+ORVvbGuhK5OZGw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BVSKMrZJ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=BVSKMrZJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 745AE605E6
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505841;
 bh=3aKZb4LJYzzut3vuILtIB9xtnqzSTwUpR3VdLJSINBs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BVSKMrZJZQyotu7UPt8Ig4a4US6WJUdreyfNBJ6I25FMwBXSDGEDcdwfGyXIQIERz
 FzgLLq7E17+51rK0o4rjvTITjN2n/sHizo8692pkylIYCoeLD6Xgw63ZJUxpF4J1RH
 IYfCvERB+73XH/UejaRLIohtkR5dxw6fT0G6Ib5P2wSWXzgv605dc3p3DzSGaPA6/H
 0HZPYapj6mjh8TOIbbqwSk6oHJbFU1zEcBNkS5suyeCR+r/VvIg5m5sY1G+L93vqH2
 sL5XXoJysEN9F6ddjldw1zpb0QWS7Bs/JCPbWPihgD4/g06cNvYOKvzMnfUbvB7p+X
 ZJOU380zxzq3g==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 bYUZ8NJGU4F4vUTer1cO9NiVg0aXihpcKkIFJbBgcCURt7L0N3g9/SWcdnK2KzeFtui2KNU6xFv
 gFToQ/9VRXe0JLS7jKfoE2wGyxoFSX3vh4mRhr7S+UgPSLa86cugZE56uQzDyxlIU1+wxluvfV0
 l3JwgePe/7N1n+tVNwtp1KN5rzTeTwI/kWLEyjxJwjHOeVWsxg8J/J2eQra5uXYE+KSdCnM8hAY
 n4twHn/+41zG5xojW2iVnjB9xOaACxWwKmyD+nCutGLhchaFIXma9Sjajf2TrJ6ySBkC/nDIHWX
 KywUhsthPqJZ0HHhz4sVZl4kgV3Cu1hwqSJMhgUPc3x8FlUX5V8uylIHE6w8/skbVAbFg3y1vXR
 hEew0RdO1Ju0zmb/2nqNWO9Ymd83obzBvmh/5x/CbS5UxyXsmbDJBuEwNFJaAgH4xTGwMq4kCSJ
 b31d7rlksOINtjZbMfXVN7fVLLLG/Ugo6wYwP1ufVAvpFamKy7dALnV8UDv/BXc1Qzl9sFNyEuv
 F/t99yI/2mv5EG+XZjUUTkWtSlcJAkVI4ZexgfhUUMnOWNTK2JxTHw+Rma8jmdTSkHRle0lq5Sr
 pUzXuNLL8x1jwAvgCAJNvOZ/FIeJ2xNnMnWEDlOGxYxDV9JgjHJZvhWbq+ix7PnTWF7nJqyZX/G
 YbgRzRT0lQ9IDYfP8VPV5
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 864E9A4C4F89;
 Sun, 27 Sep 2026 12:44:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLj-0000000007a-2Uin;
 Sun, 27 Sep 2026 10:43:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:54 +0200
Message-ID: <20260927104301.1801638-77-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 76/82] package/thrift: Fix build with OpenSSL
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
