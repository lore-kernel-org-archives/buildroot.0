Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBCAC98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B8B2606D5;
	Sun, 27 Sep 2026 10:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxc1hF_F5kvL; Sun, 27 Sep 2026 10:56:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 421AE606C2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506593;
	b=OTUMbtBiQh8X6Lc+m+k0uajndnwr9Hkzyh6f1Nz2yHUR4oIV5llMPYjMpbLS/2F/ETdm
	 qRiBF3DP/YpZbBxLC2PlE12lqYgHxUmyQnIwJNzPYWkgoB8tmJ8riqfEj6Bf3aKK7tVH+
	 2jq9vu0NVIfj2i1WX+XTWAc6hyYJomhcsf4nWqxU8jQWvzR33JYwEaWtcyE/cOwkJSH7w
	 YrgV7mK+jTbhTJk6u69E4NTgxVuQ0LNs4vBeBXhdE4uY0ORirDFmmstRyriLA1MbynDZx
	 HBsy+cfFZWGhpBS/aJ/6spkDtBdVNE42HbGLhvYraPWQx60L0E0WIUUg9k9SoqfNgMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506593;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TnW7QnnJGFHpzwovPj/MzrFcIsDVsmyzL9LIvI7KjoI=;
	b=my9Pgm84Rg6x1e/VklHNKb5dsUtiUuWC0gfEU/U+wOOPtJEPBSStdEILookJLPru61sk
	 MMbH3AttnQLZgVhYWn/xAI6/4AL6HlCoycJM6u3KdNbNZ5YpFp/OHxxu/taaOJar6y5SU
	 uLXIAxm91R0dB96sI1vZOc4d3G7LfYctxSF5xb9C72qe7LbDDpCTjWhJX6s3pz/qHeDfn
	 lYQ5lJipcDUUXDA/IhbdDKCjTctCtQsoa+Ig5jwEWCjagK86flRGg6Kq1tXaUC55nO5+m
	 NOPS1DCtNarKV9qGsSQbz+2cl2wNZoC2zOh/AwDDTMwUdThDsnDHUrwOlNlOSvFsIDw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506593;
	bh=TnW7QnnJGFHpzwovPj/MzrFcIsDVsmyzL9LIvI7KjoI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qPUOjqcQpLl8w0H3wecld0DwJrdLylpN1fnaPgtiiy5/I9E+NP6+glVzPmOBsmhRa
	 iNX1v7WQS6HhVTG/1dNk49VfiH8LDtvpWyHZtFR3EqEUNNkQbfFT41JHeK3N3kzi/A
	 Ykw1JS4nhYMD7J16aMzwTeGd1pVgH7jXmN29h/uE5ShvBpf3rBIWEp3wz6GUc13Vkr
	 5leJGzj7TMD68NWIwKcJx1ujq53bX4QfwSjd4l4mTwqxr4cWQIO8OfNsc3GykOJQn4
	 2bahg2bPfFLHRUesI792YnNDeBI6rjP8uPv5f3Tcg74YT9TkZFxkag5d6jVGdGxh1A
	 LaM/68pHYGQHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 421AE606C2;
	Sun, 27 Sep 2026 10:56:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E765D1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54D8F40068
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9W2gwR9ehiR for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:56:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2476D40059
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506591;
 b=V+BnBPjCl/+5agPsEfPY6Kuz1UGkHpx2UHLNgcwK7Eh9sZzzt0AtP2v+I6jwjf8ASH5B
 P2N0PIgeLxSHUteqMQ42wJb9V4LWtbuj+OQRuqBQMAr04YlW6gB1fV5DNT9QJNxZ7A6Tv
 /GZmRfC1z86iKkj4bAbUg3l0+gn4gM9zoTUjv3qkZj3GxIFihiMB8/84tEYD4sHlxlHIk
 IKnm0eNOegohfNT8CBhdVPN822sVLch+uiYKISxOB3DzKiPFe9dI6rBIufI41unzboW0v
 /8vhGqIVYOzND2WRXv3YyJWD/XLi2feuRaEoMBdtjKXg9C7Q2jFXDgzs3GZ9n42RP3A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506591;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=73jDUQh0xeWpwmS+ehtge8hew78j09XtI0zHFLemPX4=;
 b=N7EnFLdMhSSvfG1bcu5PHJsJgnudmGVXkrYof2LlVCDd2vH9t5D2kskJ+60HyazVja1A
 rRaP//eNgf42Vr0PA0G/g9uNB6pEV+NLV63aF7YbxNAz+tEu1JhIzKtAJY803KDFgcqZL
 pYVpVnApuHZMBL/kNIacePcOr3ac8boA13nq0TvZGV5ubuWZIvidqJXT+MIx4MjuAWF9I
 /LWDJBa05GWNqulMeB7smohXcdtYvuoMKDvlzCeS3w+rwHrV2NbvwxhT/YXK5wmD2cmJ3
 qf4DDMynwm0AWLVZKfjgaQBCIaYCoqOC0r/X46V+PzUDKEOo3MIek18Kj62B7JKQLpA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rz5tvuo6; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rz5tvuo6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2476D40059
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505861;
 bh=73jDUQh0xeWpwmS+ehtge8hew78j09XtI0zHFLemPX4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rz5tvuo6DiXJyafnDuZB7qJjv4lyIrW2S9t9zSa+DbUyEU7V6pNrVHLnR+aOyOq4j
 8i//JN6H5VAURvbNrTMCSgjidinBgFKE5YArbSbm40V+NzOPpZo0ihwP1jAMN+b8yF
 k38byCofZ66abFM3Nja4vRl2HMRI+zCsQb1WI45dUyu329opr4M/nNebZD/sWTryZg
 RpRlOEMaTPXDkaLL5mXMRo/yMR9lnJ79sGi7CYinn1Udsti+/oZGl+iYyPnd/VyWqe
 2oZKo+suGIuVTevi3QFfXgDpnGiY8xc4PgdT9szYygWou9kO92GopTXczF7pK4W9i5
 zOm0Er76vv/eQ==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 /QJezAx8RvwWd7JcgMjKnQ1fwhch9oMJ2DiG7lt0RFBt4qFrEZtizaKFiEskXBPnI7tjo8/g+3X
 U4jPMWe64DC1qk6wGsBm58pBpHKv8J9CTHGtU9sn/HUvbn9X3RxMBS6N8pimFW+l1hwjDPZTHq0
 vsZlB4rLiHlYn7VjtvkAg3PHAybf5yZHEzdkwzf9Bw5b5RcGoQpGhEFL65OqyqxwGKv30piEGeN
 3Ie+8+6xhxcYdiKykrRiKU+oU6szdksCMVZI9Ioyyb3VQdo06YcdZjUYnsQBxzSHmqv/tdj7ef0
 oNo5g8aQWpBRdTYlpVvwaYIpgzniKzvmjZnea8He/TVv6IoBnyUFflxwEUv/F5bTRw7NWr0ptmK
 ho+rUh8HeQV4f/gFOcNtTnibmZK1Hb1RWFIrf+8H1jTtyhA1+t8lgAfcTrRSxvtUlq74IkvRKYw
 rQGKKVVJk6lMet6WSKXQOrqD0vdcFWfQEPBABjriFnLZRFvYq1h3Tp1vtTQlNBLpomOkkx69TWr
 WpgtV5pszNHy01yowGRP6hLn8kZ5EvMFA25iYUDM5B3BX7A6r9POhSK2slGN8VxPTrEE1p1IKqe
 7C53WbfLwKRiY6J80+01knwgsu9CKDBajotYERNlzDHldpf80gj069IpaSABJPetQb1VPyBirY7
 lC7uuFiMNmetXEmkd0LtS
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C5A38A4C506F;
 Sun, 27 Sep 2026 12:44:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLc-0000000007a-2XZx;
 Sun, 27 Sep 2026 10:43:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:16 +0200
Message-ID: <20260927104301.1801638-39-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 38/82] package/apache: Add support for
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
 .../0004-modules-md-Merge-from-icing-md.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/apache/0004-modules-md-Merge-from-icing-md.patch

diff --git a/package/apache/0004-modules-md-Merge-from-icing-md.patch b/package/apache/0004-modules-md-Merge-from-icing-md.patch
new file mode 100644
index 0000000000..b4f04ba47b
--- /dev/null
+++ b/package/apache/0004-modules-md-Merge-from-icing-md.patch
@@ -0,0 +1,57 @@
+From d534e42b07969755b27eff2892ea56cfd909f063 Mon Sep 17 00:00:00 2001
+From: Joe Orton <jorton@apache.org>
+Date: Tue, 9 Jun 2026 06:44:42 +0000
+Subject: [PATCH] * modules/md: Merge from icing/md -
+
+https://github.com/icing/mod_md/commit/9fd90380db0722f0ccc14ff1c4da0ca21d4da75c
+
+Add OpenSSL 4.0 compatibility:
+
+* Use getters instead of direct member access.
+
+* Struct was made opaque in OpenSSL 4. Getters exist since OpenSSL 1.1.0.
+
+* Keep OpenSSL 1.0.2 compatibility.
+
+
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk@1935161 13f79535-47bb-0310-9956-ffa450edef68
+
+Upstream: https://github.com/apache/httpd/commit/d534e42b07969755b27eff2892ea56cfd909f063
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ modules/md/md_ocsp.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/modules/md/md_ocsp.c b/modules/md/md_ocsp.c
+index aee799a7b3..2e7f14dff3 100644
+--- a/modules/md/md_ocsp.c
++++ b/modules/md/md_ocsp.c
+@@ -533,13 +533,23 @@ static const char *certid_summary(const OCSP_CERTID *certid, apr_pool_t *p)
+     serial = issuer = key = "???";
+     OCSP_id_get0_info(&aname_hash, &amd_nid, &akey_hash, &aserial, (OCSP_CERTID*)certid);
+     if (aname_hash) {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+         data.len = (apr_size_t)aname_hash->length;
+         data.data = (const char*)aname_hash->data;
++#else
++        data.len = (apr_size_t)ASN1_STRING_length(aname_hash);
++        data.data = (const char*)ASN1_STRING_get0_data(aname_hash);
++#endif
+         md_data_to_hex(&issuer, 0, p, &data);
+     }
+     if (akey_hash) {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+         data.len = (apr_size_t)akey_hash->length;
+         data.data = (const char*)akey_hash->data;
++#else
++        data.len = (apr_size_t)ASN1_STRING_length(akey_hash);
++        data.data = (const char*)ASN1_STRING_get0_data(akey_hash);
++#endif
+         md_data_to_hex(&key, 0, p, &data);
+     }
+     if (aserial) {
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
