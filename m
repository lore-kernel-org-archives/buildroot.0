Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEF0C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CFBD40B6F;
	Sat, 19 Sep 2026 16:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_PR2FT6hkTZ; Sat, 19 Sep 2026 16:06:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 39DDC40B4B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833972;
	b=aWHXGHYbSAijYuwVPHm1Ts7HHv8OS3gk7rPgXrnnMDFxpIGYHTX2B53c/ppe2ZXPWU9i
	 jF5VcOvrIh8yp+DiEv11bGv10hC4dhfFbAmEbsmmzQlFXEP8JByhlLEdA+zW9QixAJ0bz
	 83ov+ZI1skDiP/f4q0aubfGVVOSS/ipEZBcs6/xTFjp1JK9p1u0D2DVVebhiERtZqTEdJ
	 NWoaIIVnEn3Jqj89K1TTNaDu/b0RrfAel1V7lsrh5tSR0wUNC75RmPyrmXiaOCSCwY5gq
	 BwVgWmD7EUSXA0da+AqSVCySCYu8DzM/5bjO4m6duJToZXFkTFVnMaUocbBMjWKJkGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833972;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TnW7QnnJGFHpzwovPj/MzrFcIsDVsmyzL9LIvI7KjoI=;
	b=RnVv9K1zjw5ZJQao9SmKyO2jaS0q3IEIk6zdERtJ3othBnLlzFxlqOZxytM6gOtWuhqO
	 dyyBAkp/aVzUVboW88qZYAJY48vnzOtJvhKetO3z6sM6OMJ4uZTCV2ZiNgHhD+rERtXmF
	 Hk8cA0Z23/8sYdJ3cwR/l5XlvNAR2vJ5S73NJQafoFxhk6qu5e2UKWZv9R2w+zZgqUfS5
	 9S0RISfIwmK+UFQ5nvyJcw9oJQlU9XGeLv6FvXxdZmv04YgaFOhir4JExuajDordEGerf
	 87aZCXgQ97RKV+hlruDUtl3JYP1mDxDQIkGkbiRPhumq/iInVl24OgKN3usp0piIuWA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833972;
	bh=TnW7QnnJGFHpzwovPj/MzrFcIsDVsmyzL9LIvI7KjoI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=d3QFzuFf6Gkb61vd1+6lpJPMIz+U8bSzxPjc7oSWvll0hPR3MpUNZM+/6vZMerJd2
	 v0+hNq4zJD66BTXvN3c/Nr7gtrcskuim7ZT3OQaDEb130Z2JuDgSwbVif6M1DXBRpZ
	 cllqhsaON98k98a38XXlKyxZM3uRtpwIEB9BWVDFiYqQeRthBg9WALWPgTWa/OIkUE
	 cahh3PK80jG1pO6HOaZ4KhlmEAVIXpdI3u7zqYFvO5LX99/MXAn2EPHKqDN3Qgl9yV
	 +ksW0/k/4xLEqeDT7Bm2gv79VD7gUHxBgn17Af/8DArMt40L3Fjn9poujtynBzO9bY
	 sZ4UrUzvfPVHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39DDC40B4B;
	Sat, 19 Sep 2026 16:06:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFD0A37A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D215B400BA
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8R3pff_HtIzP for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:06:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org EA11E40026
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833969;
 b=LXa02mUCIJd6UMqRkEzr84WxfR4hu7Sm1ZCbF4w3AcsC2gxmWqf5YoBhLlAlkhkG35nP
 xplEnx2xBF0kjufzzfE0ZPwT55gc9hongyDLv7R54nHKn+M+ufdoOSv8l4UPYjYNGsbOX
 WK3WCb9vY71I3kmoXo5XHD9e6V4OvybyuwqcKR16ZoEqJE1sVA/twukxhWjp3rojQ5IEG
 bZXhip4BbKxpeUuMornOnfxGp/zKxPUBHdLicC4/R2xcEPRYHYhVIs+BDsCPshdn2Tk44
 AhPu19TflXkj5WmXA1HtmIPxe4WRFx2u473cGFWxeRJCQWzeaVVilb4txaItz+vyeIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833969;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=73jDUQh0xeWpwmS+ehtge8hew78j09XtI0zHFLemPX4=;
 b=jZ/rZfs6CEAOiQpQnSCz08g+XH9zdosqemAFBN23K19Z7Gq0TVWa8pNtD1qUfhOhHa8h
 0qjflqae4ydV6IM3JLaaQO3YF/S+IRLhF/Ge2pBHqdA51pItfC614YiOimr9Kf3zq58Uc
 uZmcPavB9yejOL1DeRz+Zr0/LCMvW5v2y69z4/04cE9RyH1S0wLXQiHA82WMefhvgurwk
 bVky50/zQotaE3VC0fg8pyhS1nIyT/5RoA28SIxKPu6BHWg1nOwYBl8dub0qeXFjCCt53
 GUlLAu0XUl+7ON7CQnVdHcW2RYDSVzOnqwkGC/+k8kBUwL2fPbl6nZkJLKVJ/n91TBA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=r4wkZxne; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=r4wkZxne
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA11E40026
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833547;
 bh=73jDUQh0xeWpwmS+ehtge8hew78j09XtI0zHFLemPX4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=r4wkZxne4vJ66YJIkQOOytf5TT0HWswwyim/oDMamS83LLXiiZistB12iky0tRNGg
 tc1JHXh588PCZg7TtxIJ3sWQus4/uFlNqtNMplbYpksBd6/WA6iNHY/wvM8mysMI8J
 rVIakk6XU0B+HlRAqm6mWhnkoZXv+jOkzjqb52U7+Z2EoqV9JQrN2cTDlu4n/k3KL0
 ikyTqZBfpMn+Bg3qOCTATqwwzXF3UUcIk7/RIrw4tQe2x9e8ug2hkgwBcAOtgrforc
 w2vbMiZyUx2YFdyGBSw17/dcU1vtGh7jnS6uqCT7awns5Oc4xkkPPJuUu8x9AwK4o4
 ubTRERsQJDEFg==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:rlEadIlQ0m374nLrfeHh5w9kLx3SDfCBGdo0dm1F/8LVj5kHM9AyM5jbs41zFgZ6kFcC1YlaN1W1qvfk2v3CFl5GcmUuM3FLfiwE7vnQgTVnGe0tMINz4DpGUJycALkTFs8JDXM+Q5XlmOf4fcv30JGulhZzHmNIHhT6VlvwKNYgrK4BseEnH/d+KVSU987g16ji8MGyRtlBkfk4ueo/tyvmnnl95PnfBlVFkgxa5Mi4fzu4keLWFTDu+FVonCwv08tJzMKPzDyvXyf+UUMWl++YxBxTj21jOxsFqz0yPgCe9F8R6aSgxFzDVXeI7zuimXQ9pVrd8EbeA2ZpydnJNlOiNajLDWdcnrQpjLwVl99jZO3LVLg9gsvTuqaXMnYnggZ1zecdNF6tZO3oj7S4AcbWXCn6CuAwN3WJ+s2hGr1qodkpaENSB9ZwWpzshziO60rA/j7ywqWFtXD2jRoD5vuNwlns5j9A60ZneOjNLvAerohCCsE/OSJbr7qFrpTCG+pNTOU2S6I8It7tOJy6Kt3BZu98i1s9axF1hHKm8jtis9aMuiDEtDn3NFTfc5cTIxX9u8hptK68FP2D6kPgVFZvjKToxCTDpvSvDAtIf/1DUM
 ycEei/QmZ9HJK7+KRpVxYtv3sWBtG/R4ZbGQQhUMLH8GYNuNapk+FOE91rUEi2RtDo/yhj
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EA265A4C47C2;
 Sat, 19 Sep 2026 17:59:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSp-000000005Jx-16aJ;
 Sat, 19 Sep 2026 15:58:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:57 +0200
Message-ID: <20260919155845.5776-33-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 32/77] package/apache: Add support for
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
