Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D2FC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F25640F45;
	Sun, 20 Sep 2026 17:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dyHsC3GXG0La; Sun, 20 Sep 2026 17:15:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2A25840F13
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924554;
	b=eljLO/rQxZnNV61xSegYKA5BQ+wfABIDtYAQulhWtu7xXzriPLYlLBmKw2PUdi/DH+gR
	 YlYiI8y4cZPJcfPhq0YpKDCWRd0q2JbUh4cEJz8UY+BgHyhaEiKq0IW9hM3IQerO5dNAc
	 PJjfjwi9BHv1AzXp+vQE0cbiDDTyqLPssZiALWOw7DdkDPeom/dfXE/Bs69g2Y9wqh5Vl
	 FhD054Y8LfeMHIDs1v/p7/WTfP+gAWM1w6gB9s4Qg+EIPWQnLQL4KF5eV9a2xlWocKKUH
	 cQNaOo1JiptTwn6k7fMYzYXICCB1lXAyP3IWw6h8DHnX29gYNnEE9iq6ufBAN5JYCsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924554;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TnW7QnnJGFHpzwovPj/MzrFcIsDVsmyzL9LIvI7KjoI=;
	b=diXUH7K1I+MZUlnusi5IjMWXJ7VnwpHT009y36U9QL+xXwx9eayR7NZeew5748eZwqOm
	 T/W2cuhaGbaMMbazK/dSA9EGrVlvMZ6cu0K8FvKMKKZNkCmPpGNh150H1esK6b7zBfECQ
	 E5YWdWa0Ft+13TfyxxRaAAHCptXi/HSXLTH2D5ri3WCLskLzevGRM27s5x3TCIF4Q1G7y
	 uDw4OZGJk8AHXzuMVDWaica/9BljRdG3ZaeAposZk96lEnzT0qNdj4URDkUvuVKPARXjL
	 F5EWPH+4nItpTFrBlSXHbsI6PJR91BM+qwMMcD0VclG3rPW/3qy4eeQVbUa9JiAF0wQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924554;
	bh=TnW7QnnJGFHpzwovPj/MzrFcIsDVsmyzL9LIvI7KjoI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RaMRYmqm2gGtlzqAEqbPQ7xpFjmgcW8cPgpaplgOcSgk86wvcEcFjdCjjlLj53bYH
	 hJxWZP7U4ZkKO5VvZP0EkBZfIOhcBh8MzIG6uBe3fcPOS2hu73dm6XQlvA0OHEYQhX
	 t0akC8z3kCRvH7a75Fy+II+QLltFdS1FDMblNOp+Pkhpahv5RdPmKXsBIEOtKiuUmQ
	 zUsZ7oKrzZDltGsBr1UXhpmmehn9tv6v6mAf7z6XNP5se/qDioYocsy7l8dFnpHjAT
	 cdvGU/RuK8WSvqidHZiBsKseyW2b5rK35fLthHlbVv8oEz06oOEZT1xxPtOeltmKxw
	 42SAHUjjBtjPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A25840F13;
	Sun, 20 Sep 2026 17:15:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E6A37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 023944007E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JEro6mfll__Y for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:15:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 26AB340022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924552;
 b=MVTfvW7Wa50QGjrB+rmaGCrHFHNQlnEoacQVEYVQcVVKZMXQk6JSXb0KoFXwgfM7loDv
 iVwhWZ2ecf1yl+VNtaIHD/5TAxw/wuB4nlmD0BbRzZa+zBuM89dnZmXpagrEOT67vE+IV
 cuIhPkbzV0LpThfum3p3XKzxgiXextyTTbL+Ap3GuFhfdQZa5pja0dyzBDb9t7ronA6P2
 hjCofeEvsnhVU2yL9j40FnDmsix+RibJ1SfpyGfOiM0v+NNg8+Pi86MJyQXfBHlPoLiaw
 qq7pPMxvX6ubZ6IaFfNCwZ5KMeHib6W1lJY+F4w/SAvC/DBgeeasE1OMQVHsyzsjkkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924552;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=73jDUQh0xeWpwmS+ehtge8hew78j09XtI0zHFLemPX4=;
 b=H5GA/Yniy7/1hWtA8lB1bEGB8K7o3s7+/KUs9l5ljjii9aCMTbcHcMn52cCmV4KAnNbM
 JRNrenzMrBQ6q3FMsZKotHA4l9T+FE0TgVQR1mu9twm8CHx9RmM23FNr0ME8UBTo1Er6O
 GFd8X0tVN87kFQqEJMUjraH2CJZM/3waJeHKkbkQ+PuXHE5aruAAmP+ZK+evW3CpQAbo2
 wnIWSDnHjwBKAW1VRzOVVd6+CktLYI1o1czPE25Am+MIDmc1tfxHOpRvaEB0mHGd95hav
 6K0L/O6SHwEktnqLR5C1/d7t2T1N6FyFAxbd0in5mGkyMfTVIoX0s9N+5JaG8zi+giQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="fCJ/UfHr"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=fCJ/UfHr
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26AB340022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924154;
 bh=73jDUQh0xeWpwmS+ehtge8hew78j09XtI0zHFLemPX4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fCJ/UfHrCGVzIqCgDILFjK8PSHlFhC0oBvUDUts4Ea1h+t999a9HjVdeMQEbbc/Fu
 JLgoG0FCXVQ2YOVaSLW/3+ZmHDB5dZZR8aehvbzVMIYxhU2FdGo+i3enaHLnWXOTWQ
 e7JiKBQ53kAtdZLb7cwDG9I6/cSAv843GH9hoEDKE7tOKrS8n/HhXdb4YoKNhLTvEB
 +kGBqlZrMTRIo508W/wncbWylcbJUL/f05ISd2t+mCLHOjDnNEyAWg+sITOuNVqTEJ
 UJmdtEVTYOzb1HrFMnYmtJ29HeXzgMlKhsUerhH4JilN0mvbCaGJQGVp4V56eYdWQi
 P/RU5T14ffiBA==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:WpkpXVqaLXZkuZT52cBZkxi0NLCBMYSjjXy/tn5ESY2MQUvBcHTVxT/IzFRWipYq7pzDnQXo4UfOn+sGGyppCAdPWxOXwV/UZZYVMQj+aEbwBJE1ek+CoCdsrJrUrRirwN60zOXUJyCjBBTkkFdQgJsOd4RUVCuzBk4zUg4Fy6JbEM8vhYnY/uFhFuJvBapU7maVWV2acvMGZUnRXGdafK4Gt+AvSPRTTox1uizkw8AoZRAbhl2YGAqJDdEaehEzG/T7UJhdSERhnHhZjQLS6w/eagCwZ7J1JhD78PhGtlgD9sDbVXst9/j29yOzOKcAioOAgGa4YV/7f2lvrSVOnAIyGpPLURLTQNSWcFj1xQLC68CWllPm3anggHzYMSvngfDD96kHodhFCzVnrN6N1K+7gyEWifMzYQEiUb+E0viSa+B+qaUAiHxPNrs5pklJZAt8SlSMUMvyns9ke8rZGU65IjfabmieZ5HzvmN+HCi6wXWFldg4LuaArE52wOlk88gNt/sksrVCyd2dc0wsg1w2ge9+xhX6rwZwNZpmMavVlyZkePJBgjLgwRM/6BtXnPP9ahf4mYX9kQWUSaOLsy8zrNwB2Z1rHqyIPZWl2V9bMo
 YCygPVYzoF1U2Ktu8+1DDhx2IpWT0j+dMX/WjQ4Nw+LYBKhsBJcTUVib1N9iSgrGIFNcU5kU8=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A9BD7A4C4888;
 Sun, 20 Sep 2026 19:09:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1Z-000000000o7-3smX;
 Sun, 20 Sep 2026 17:08:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:31 +0200
Message-ID: <20260920170815.240247-25-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v5 24/67] package/apache: Add support for
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
