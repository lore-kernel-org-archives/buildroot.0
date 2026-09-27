Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF04BC9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93C1640944;
	Sun, 27 Sep 2026 10:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZtfZkCvSUVI; Sun, 27 Sep 2026 10:49:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B54A4408C4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506178;
	b=aOz+AD3a/0rL3oHZlHVcYIHU8bEg+ste96SG9gihhT+PBaSJ00cBTMnrTwz9bMy9r/G9
	 6qhXYTXtDYl7cEef/E82HepfVYbdOVmRvG5lFnBPiDdKr8uixwkS9jQzNWJN9ckZV6Do9
	 DCztVuBx+dGOY0x0/i7yRZpVWspZqk2QG1cMKSQNcdjcMqOKBr8wmZRP03q0ufTDPu99A
	 5JK+2sGBjCLoCfCr/sCNhH3s1rZtvkIaMr4orHSrJ8pWEuWbzdV7qYWHcmHxzq+QzOLU+
	 lBTFd94+RVmWGu0rn9J8+/J6YbDI6Iecw2Hv00Q2duLf8ztB/KwibCpMXDG+sUO7XYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506178;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fpVOd1A/MRbpaDgz2JJ+Vwh1fhT32ciayDeIDpluHzk=;
	b=Wo0aadnF6p/RzjuGV0uMxsNm3JEjuH156KhdTpadjol0ZdMaO1otTrs5B0F9pm8g0tWR
	 o24SakXSLDbu5HHz2guVTwZaKbQJ+haxRKR94CBvZd6/WWYn7mQMSToiit41zzYzU74DX
	 TRiAv9QNzRWIiecB+8sgPg1UUQaWY1zv/tq530iEwdQXY4BTOvhQGqu7EnY5WX3nBnhB2
	 zgS7RyEkrh0dO9NIPdU5n9j+bxH38Xlao6sYhsZfMuflJ3VraT8FSk7MxCCEQfloWCD4N
	 mm3kh57I2OOJwfp+tHAzHB9QOKmqkup1D4CgOafGPlIWLLuiLHhiXJ8c57fjc6KHQfg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506178;
	bh=fpVOd1A/MRbpaDgz2JJ+Vwh1fhT32ciayDeIDpluHzk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DQWP5Rj3GHu/ccpfea+do8nBy8j3YbC5zm8yLm2YRtokFdTHFBfZAR1eJuAM/9r+0
	 o0gmPQlUqfILUopwd0bLBgk/M4fQdSNy5gD/pvOt8QrLTg1mvyNSQ1KbA+YFOyzcsi
	 kpsa6IWAA2lmmFe90X+UKA7v8w8GY13gPRlBwWXsyLZKtDDzQS715mObaDXaeVUYQK
	 Kgrs6XGcx/TOoLcfajBwOo+3K5K76fijFxWY+PxZ0lRl1DEIkVmWtxv0amb44eSgVV
	 5pfaEvyYM5DQPhPlpbi4xDViY6ogftuN4ONTCqCUIAcXObn54p6TbJ4V/5dlHxzfYJ
	 TfGR5caI5xMDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B54A4408C4;
	Sun, 27 Sep 2026 10:49:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D8D0335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F2A8810C6
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nedAYTVUeyEF for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:49:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3EAD4810CA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506176;
 b=kAZ7Q4emf2gKRMK7VWaCuVSQ3DXA1gLFjvYJeGYE5St+CQ61gqvupssKa5A226OOV/eM
 vB//I4qO3NxSgvSNbxruGvHwGqpdaR8jCQfjq+uQRpl03Qh1u/DbPOfhPID3n7tLgI0Xl
 ctJrMcFM+YiyJjA/GFAQFFoU1c0U7laJg/Cpf8LOTkE7PyiVz0+/LQDR/FP3zXcYpSnbh
 li9ow3Mwektfzqd5RogqwFg7vdrbKB4sjWbWUSK3j+hZ2mDRbGhb/TWxkFijKAzGwxs0z
 tJNwN/r4/Fc5neM3uFTNkWIs6s4SSafp1fqcLiLuusz6mMc/0cyzvPetSlBNbqZ5LJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506176;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=OKN+zq+s0ezsuRpVS7QTYc0bNz6nRlCMaQ6LL22JouI=;
 b=MoCai3A3Hjz6rI2it/C5wWSsd0a9MpI+y6zB34Qodig17+AxXjeW/s6Ntoh8pfkyU+4c
 9Mmt4jPNO7jcVWg9aqETIJJhWY9RiFxnwtxjD0JfSqJZm5VF9LSyfKYG9VywHq1tGMRCI
 H734bq1Strmdbizx3C8D717GB6gFcOE64wAZNPFZfTcyv5xpz87YfQ3ACYNeAllM9UPUi
 G3n/hz5qaNht2Efb/Ux9k9LjywchuD/VCinLkRygnHftYZ1TIlvsFYdLSWnTOZscLeQRA
 Co3Kya0L8crnkT4LEWEwlUDvVPy5H1EPcpYAKZyABawzs7uQhnjcTXf3K7ZxPUT4Vfw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=o1NKcG6M; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=o1NKcG6M
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EAD4810CA
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505843;
 bh=OKN+zq+s0ezsuRpVS7QTYc0bNz6nRlCMaQ6LL22JouI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=o1NKcG6MCnaj+Mh66JtTd65gEL7DM9/+LVO8Uh78J2Xs8Q8YHMByUjp6EP6cr+f8b
 UcxQ98OQ8TeKWwZNRg1BMLDYJNl6Tc4VwQ5PnzloN1scJkW8EzzKJshSha78NlGR6A
 tT/mm+SJzycrTuXp4ag/LaP3FOeZ4j3OSjVMyo62m4XsyiID3gF6zeMZzfTSHZuKdu
 LyZbwZknrtBbklqG/UDAxxGo8+KSy3AsnqgPhib1jyqBi+VD67K2gbGNqfJF3DoMg7
 K9U6+8/Qpi1l6ddqNNmmFeRpzmxPY6pEENtQRAAYt/bmsDT7zdJIUjnpXsBHhpObMq
 wdu1rQkvCmryw==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 kPti9qj2aEiFhTyVWn2MP0c7RZMQu4hzjGbispFl2wMdjovI/8Vp9DFwDfhB9XLRilgfeCuvsv6
 GNnAq9FKyCofzotOyXT4CjMNtN+6W7MSds7RO1SmCgfHxDA9EuaTL6cj3ZA51eyfL5VJgT8BhvF
 G4Upq0JS6npBYjjAVJvYNnIe8zWDBKPyLs6SzGWGh84dtUDOp7f4bXTYMyR/+E0aLmEUQ1Hv6Pj
 zKiVjvfGKufhCNjwUCfrWkOlY3wSlS3AXUjBi6x7XEult05DqEPklAm/fAtWrGufheYZvbI6G7Z
 ZGiI5XaVsPl5NmWKzJ0Elbx+5kdvbdlPu5SwUAawhs4dVIJxgpbEU8iY//J24EvABPjCBbLLvj5
 HWvq0zLx+3vihujKeb+DL2D+SCUzw6MJ3qKJZw1W76Mh+vuqWOBt/JsJggOgo+VvaqlVuVldOXJ
 B9We4tLMkC8s+8QnijTpdD+pERq/7xeQ+nLDpS7m1uqU4A5qa/t3Mfwghc+aLu8UvCZD3OOUNMd
 vc4puieQJ7xZ79rwKQlb90KimYLB8xNLqd1a6SJXAQCq1MvBPsw7sSwbWYbOSyxhvXXAHdBkDpR
 yYDImLdzLwC9yWvw+7Oks7XaSkolKOci6yIQOzSVWoxkQ4qG4ZmGhBVFNZm8hBYogYwIMeRO0Db
 bymyyiWmMdj4BCVTOlGJD+SlIiG4+z6vOGrwF+w/3Fnnm2WwTD47SpQ1qlXAVVg==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8D062A4C4F90;
 Sun, 27 Sep 2026 12:44:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLj-0000000007a-3SPI;
 Sun, 27 Sep 2026 10:43:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:56 +0200
Message-ID: <20260927104301.1801638-79-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 78/82] package/trousers: Fix build with
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
