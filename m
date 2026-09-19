Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16C3C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4FA640D52;
	Sat, 19 Sep 2026 16:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0JirEWbC4X8R; Sat, 19 Sep 2026 16:15:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A6F2A40D41
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834512;
	b=qmdjP27ngdvZPC5pvjwUviwZvX8VPACcxYYsW4JYDOvOVXLimhBpX4ix5B5G+qvaWQXf
	 3RpS8BEXS1vOwF7kyPe5z16ZGvZmNcMLbUiOFz2akFRMZ3HTU1emeBcdPIwIqHj3u5H5R
	 euEHsGPz2UIVavL0bgSWJVO4ePqU/xaEkH1E0LzecVC+UpigEslNPAwVxjxPhJa3T+c1j
	 d0lwrO/gPPqmOv8qiDFVAsVanZ3ze2/fXNr++BYBnIgW6ZtRUI9vd3ot4EXNXZp/jxY9H
	 Mli41qk/rljNff2r/7/F9KQsRJBko3aFrd6vgpvVAobT1cfi/mkL3k3pbCQMjrTn8MA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834512;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UI0V/cL4KzQQ03sMby3R2tcnXugPQ5YwYspsxAP2Gj0=;
	b=TSEWJoLCSLGJPCHjJrcBGdrKYIbDvOQpogA/UuK/UUedd4oXC0PFqpNCeJn2uKTz47Hr
	 SLuqb5NEr+dXniuVUYRoKs9qnUpxxUFqUJTXr0gsqEv8UrKeZhqNe7HR+PUHENsoeINYN
	 G1SY4F8JhbabWXQjUcOG0x0icNiC8TmL3WHydjF80zHWIy/kapf9WWuPTw+Co9LZo52RL
	 0GJaBr54xhbUfnNtZMd2Qm9/u/u2mSAkiq8wgAz/dNQHF/EjGk8oP+cNTjffOJ2tHPmku
	 CX1l8PWayksfOICRE9OqpsGtHAMuHDf9v5BfyBllv6r5/NSbUk609yq9nDpVxruKjbQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834512;
	bh=UI0V/cL4KzQQ03sMby3R2tcnXugPQ5YwYspsxAP2Gj0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DPEkPg0t/l009t7ym5xotBGqOkKM5Wz449XAHO5f0gAG9tbY8HfUfwtFC7eG9aw6g
	 x38fVZKIVvECt/EiRxn4Q+vPAnnhIaTfbSVbj7m/SQOaGMHB/Rom0CausLWIcZ1kxb
	 InpUoXewTUoVIFpd6YTBYQan/aRxq6sLTIyQuAreV64eRV9+k2cVa9qdHcpz4TlcUi
	 OyS8BZVDl7dQVOdl4JJLZb9uSHEzTbfcGgn3tRqDa/QKVP2U+3t/6Us9O4tTgvvYoY
	 YmURegN2jGg3DIG6TsyJ+6a6atfUTpzo015pOeXyj+S6C4MZUihge1CbBkhGuKyRKj
	 uyNiMnvDDUCTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6F2A40D41;
	Sat, 19 Sep 2026 16:15:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A821A24D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 717F980F19
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mLQbdhwc322t for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:15:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 605C980F16
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834508;
 b=SJWFiLtyjwEOA3856VnM/B9ekv4Vcjt1ljnAHMUB2Kqhx+ewbo7kvPqKiPL55RnjWjAE
 7ReMoULx/LonQAv+zQ6L2GMfYBAagWPY45Y6m3EdORxtoVs/7DTNLtiLSW/juLD1U5D3Z
 K7OuShhhH1L9eY4gGRPQL6GVUgaQkX5KQaVWnmJb1BlQHXU2FhnCupiokAYe6vQvmboEA
 CEmyI8BZ7EAqy355KruGtuWtSFBY4kBWXDTsX/ogwj2BY6DLyHgZTlSE4cEP74UFdKTmf
 Fo0JWyPdccIvJEe9BsBpSFbJch4Q6RJLP32aT+YmrsqzFGEMtvet0g5UOvpYYWgKPww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834508;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=l02fEPHAbfQO0TZnT1s1a/4hCqW7ISI0Im3MOgR6//8=;
 b=JwNoEYYX0w4bnYgErWGu7hjen/wZKzlxCWv/Jh9D9qAby+wD2MW7XXG2LsegiA44iveR
 GNADP78eirEEQIMxKa1J0UgfUHr4U6fCjhO5FmYCmf9rjTIMViN1V7Cd48i1WxhK4LKhK
 GofY6CWb2tS2iMtLF8ZMZa9Va8jcW8HgMV7nW7uPV05yC/tK61jJkzuTf4p5ET49KSuSa
 kDIlA0GSte9GUGWZqwXGtbaSNs4yL4f5PIULwTqqF/y7kyXKZr+WZ9Mifr3Mrx+xvoCV5
 HnbpbGuItwzZ2CpCtToi2h/hZR/Ny1PU+E+oSajdkm+UzUzdn/7M7kgpAv+uxw3oc8Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=r2Rml7Hd; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=r2Rml7Hd
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 605C980F16
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833557;
 bh=l02fEPHAbfQO0TZnT1s1a/4hCqW7ISI0Im3MOgR6//8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=r2Rml7HdrjfoMQVNbxOY7G/FP1GHDOtmlSUULGGjEwMQSVLATDAIZnbiuHK9pp892
 qvu6jG6RZgVwfoCMRQi7z8PqnxzSSUQYhuZbkTW+GoBxn1F/JT7ULRLxn3wOLBnYyj
 sRTBQFMpm5DlIzxTuj2INH2Jc9Yv1/IX55QMWR0JomvNli0Zc4y9SjEl7oY1sutDzB
 uQ8g4jOm/e1urr0SgMd5VfLqm3azeSsGNrGknrYDiIwo5hyCxlkoKsR1JGOKEvpX10
 nQlQBBkqg+vC6Zxl/rdY4EzLdkIozrNg3DrEVjz5jXXsUI9WIg532NxspzCRovJ/iW
 4ypD2gyIeQk5A==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:1VExRCic2pfwMgEKmvnEs3wfJP5YWDCO2qUCiocjoOpn1o8QPwbIwltjFUPekeeyf0EUsEoE7yEB54OfC4LkqFfnXqVaobXawEamWoTg7TmuFq+AAffHR9cvEYmXBhUZzdjaeovSLeTA2JiOVf5QPZOuHOil60LBEaRg3ZG3+p1NgPG3FBlISRjfvgdcRKhHCjT0j+frUwoAxGu8+jUoL/wK6zuveVRgN/5pqwtpXBspetOBQQWV+NvDEKGcbKcPM3vHCaHUh0x7I0eLzH3NBoWXljkID+c+M4sce1B+gbLaxLzzXoMqGTo0hqDk7ZoLakU7wwi+D23wpT8OKtNORmYPlZ7mJWXvDCGi8q6KRzta6qafAtD7Ut3mbratZkXxBWM3/LwTLJaTzZqDJbKZlkuol/leGY+jplx9qsbUeDU+Gd4/Ai6T+k+f0pkgoO+Rszu2fUbXs/ubJl9/6oBHwitshXPS2wT6xmubYQTplH6EgEHiSjUcBI/b0R3hUMHHDW3btRskNUogcAX3UhO0oNbKPPZ7XwrUaqvOoyN0CafBb3WsD3gEF7ZHJunAEN4Nv9QUTDATmDtC/MTJaydOtPgIiyfZUyo4GpeQPxQdWIymBY
 oT57+Rem1yyjASZ68XF58aDEkI8df5WWEzHU0cD0MAkVMZxKcBS0L2IVSA+DqDZl+XPAyB
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6821BA4C4859;
 Sat, 19 Sep 2026 17:59:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSw-000000005Jx-0oDZ;
 Sat, 19 Sep 2026 15:59:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:32 +0200
Message-ID: <20260919155845.5776-68-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 67/77] package/sscep: Fix build with OpenSSL
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
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
 .../0003-Fix-build-with-OpenSSL-4.x.patch     | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/sscep/0003-Fix-build-with-OpenSSL-4.x.patch

diff --git a/package/sscep/0003-Fix-build-with-OpenSSL-4.x.patch b/package/sscep/0003-Fix-build-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..61fdc692d4
--- /dev/null
+++ b/package/sscep/0003-Fix-build-with-OpenSSL-4.x.patch
@@ -0,0 +1,33 @@
+From 813ebb01ee32c35474ec8eb65464f698ccd6495f Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Thu, 10 Sep 2026 00:00:21 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.x
+
+Upstream: https://github.com/certnanny/sscep/pull/192
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/fileutils.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/fileutils.c b/src/fileutils.c
+index 7b846b7..27608f0 100644
+--- a/src/fileutils.c
++++ b/src/fileutils.c
+@@ -447,10 +447,10 @@ guess_ca_certs(const char* filename, X509_NAME *issuer_name,
+ 		if (!is_issuer) {
+ 			/* X509_get_key_usage(cert[i]) is not in older openssl */
+ 			ASN1_BIT_STRING *usage = X509_get_ext_d2i(cert[i], NID_key_usage, NULL, NULL);
+-			if (usage && (usage->length > 0)) {
+-				if (usage->data[0] & KU_DIGITAL_SIGNATURE)
++			if (usage && (ASN1_STRING_length(usage) > 0)) {
++				if (ASN1_STRING_get0_data(usage)[0] & KU_DIGITAL_SIGNATURE)
+ 					*sigc = cert[i];
+-				if (usage->data[0] & KU_KEY_ENCIPHERMENT)
++				if (ASN1_STRING_get0_data(usage)[0] & KU_KEY_ENCIPHERMENT)
+ 					*encc = cert[i];
+ 			} else {
+ 				/* no usability constraints */
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
