Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06700C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7C5A40BE2;
	Sat, 19 Sep 2026 16:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aycbSy4iXKnm; Sat, 19 Sep 2026 16:10:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 017F840C91
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834200;
	b=RXP7k73Q97FcdMtbJfh/p2xBShcZayZ4qhFicZkNDvuz/qnSCzp6mExWUznvKaEW1jFH
	 +yjgaZ7GuLiTlgQ5JuDqUqoQpovqSureHhvR6C/KcYazk0bzI4VDiltZER/IEwIQFcoki
	 ItETnebZAcf8xLKHe4sbiqTNJ9UMxipIAbb3dyEN4JuuzCc/tRiK425MhBiuZHRrbKHbN
	 RhgD3DWgE4DO6NpVi2/HzzVoqnC1UrjHeD1KqDwlMbUbldu5YOfrfkbL1Hy7d1FcW2sQJ
	 L/W1SiWaNjzwSW+AtSQ3NOBkQogAdHsck805zPpZD0jiehFZjCM67+taceAp4n3KOIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834200;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ucz7e82WxgousALhhDGR1EfTybQC8SX3d/SPLOkG3qs=;
	b=HNxopvrgW9iC9Qg6ymt7Xyw0nlnxltTtqdtRr45WjepkjZNWTkKgYE6d70kNRUKdKIAQ
	 GSGdS/HU+TrFVtRbucGgfyq5DOb1lNDtld6WLr7kwbFBUIEzCOGs/T6c3q051QJ9i7kNs
	 wcncSXjk72oOKz4qWQuORO1RbgHczhEP/0eZad0jeeAAywlxHk4yt3GPZwXshbRv3qePv
	 6d9LvmSfLFglT8o4Lzw5ALjYvO9snkCXGvy+fUlEgTAMweAbTVhjP8WwUPzj1EFzrKqa5
	 0P3z5fUTDkZJT2tH6Yikm+4rRhkUT5j8XK8ic2lVSg4PMC+4E7np21NzT1uevosaToA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="RmZc+ib/";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834200;
	bh=Ucz7e82WxgousALhhDGR1EfTybQC8SX3d/SPLOkG3qs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RW/6k+sqlupblKP37KajOeo3iU8H/Of7+sBToVWUIH9FeEnLExUUWVTe0YEyqrSBb
	 UPlhA+rgl+AMsQGg2bi4ltgtLjYGI9tnRW/Mjww8wYEN8lAIywtqSqUxqXO4jLXhNd
	 NND0WnkRjE5Cx7CMHI8WkN5ika9oi98xnC4FgZdjLCaJV+j5nVz+tu32JELel3K2HT
	 eWjO98hgfMD5Zz5VY27E5NcvzLMdns2rctXhgmpgVJb6ERRfH8t++9a78ztaXVPFhT
	 6rmg+XfM4D7SgvIW1n9I4zE1LFXfoT5sW5c1SdXhwSC8DOMaEkzfRwsFgRpX4Zbz06
	 BtX+AaQktWaJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 017F840C91;
	Sat, 19 Sep 2026 16:10:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78D2724D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AA1740C91
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eS11whbFa5xP for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:09:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9205040BE2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834197;
 b=CiHNZIk45X4T+MVdzqm2DDHGe4WyTdDwd4DDWEE4T59pc0F65g75RS3nKwTxvMBUCffa
 76s3TVxjgqu9/BhVr9KEcoYGq40QR3Tvugr9h64sMDQ96yMJrTBag9Zo/0CZuLTNom+Xn
 5B6Zn4pTg+9CEHdgfxqZ1Oz+IRlxRFX1b4UzNj8Gbl4EBIzvyeEggJQg1JKHdXc/xYyce
 MBfO2r4THBqh3obswS4KXzj2q8EVmcmJoUm6EwBY9+8WcYc/aHPsrN+R/uN6EaCK6IwO0
 kTSsAHCkyD/WqhprxiwprHlBJ/pu4G9tVLNFrnxMQ9HOuxgOSNTuNb1hZnkPTEhb+bg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834197;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UUQhSERNaqV+RnDSJMFt/3+MnfHu5avWT+1tn5xaakQ=;
 b=SCs8y3fHokaeNfExxvMQyFbLz4uPpnHo9q3Q+C7vm8C4Z4SKOhe7eAVHLD+KicyoRf9R
 b4o/eKbhsQ15lhPGfnudqJACJh118maPNDwnOwYhS6WJCGvaqXAxpl4C39rU8oS2B00io
 uMtTZIBKOnLrSBBZnpodrsTD2KhhfFpFE0swcfvYfCjHfg44+wLp4FCz9XCXOwMb9BZUH
 gIT8dYp4U4j2wZmuSmcbUu/FYHmew7u6Q/ydwH06QJjf5oLKy2BRIleO1rokymrVWJJoi
 V0ZM8P+pQBlZWDzDEUgd4t9EHUA5fXRQY4dGkSl+zCDYuga45kDB7+i7H4cZBTqbO/g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="RmZc+ib/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=RmZc+ib/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9205040BE2
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833552;
 bh=UUQhSERNaqV+RnDSJMFt/3+MnfHu5avWT+1tn5xaakQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=RmZc+ib/Gjq10ie7+5Hm2RuF1c0s5qs8b0FS8Uc8Ut0E+5phkqapaMi7odROxsMEH
 wx63KigOF57m1XHz7+TPXknM3zPqf2LGRYbhrHUaAysjuvrZdV4Fg9qlU4xDPRri15
 0FcgkN2S+Me2HOulxhXLIsPohEi9yvnrfTTykedsjEVoP6EwkJbIrh9XJ7MsjfmS6P
 fS1xbZYvuQG2pXF7FNanlLUfsS8oq6s3EPgKDlGKnb2orNBMe+97KUP8eGeMbxQwto
 dAY0SnlNhzKIeQGOJFa3/huTJzK/vJ4SNo6aDfWvvDHsJDqzqK8ds0r0vAadGv4qAe
 bocXdQd2FzDaQ==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:BLR4sQjTDag6fDf613ltm6IoqirczrYU5O4rZ6TjzQ5bo6/06Cwo1l3pfWJLRpiYFoJN3uhWRHCEjV1kXB77gSfi6WZ+xzRmmc5rEJT6c9ot807/h9YhFdxIKtGP8WeXt3Vcz/8iSp/8tfFDO1L6bH1+E0w0f2b9n0WrPpOkVcmyW6A3N+0fUEEd1hRC/+jZciSQgcwjKaDLz2C6Zyccoan7z2YZ43jI+hBkxH8TUtFk5EoUZ+9Nv5jV1TEeiwnQYV+IgU9FMsgNK0D21jz8Hhza5ydOJUmXA4w+95MBDP/wFf4T1ELX2TJvRXS3DRCKg5kV9S9udRfyZqqqeQfBLCWhwZxk6p2mGzR5cXY4Gca1KyXodufgjj4F7oxSc7+BuXFx8+tSDkvHWfW+XjyM0ukYj1jGQlm+7SPzQCKQiCROVdyh5hyB3gcZPZ9fakXiGeSKgrXLlFAgMImjw2kjDuIUIGQq26sqm78SCKTy7lXdp8lrEw64twzOzPpvkBVXUqfCJ0bA/FZ85stgbX0x4lxAHeRKugxCLRmfInywFD+3r5SVI6NzNyX3FzD15M86VefJH9JNnlLRMTAOwBwighdQYqGsvx6WmKPU+I1hdhPTlA
 jJWJg7dyVcJp5HiqM55CYyqN95FrP7XOFTvc6RzG3Ullzb9hXeJ2a28xOPS1Rom63RYOAs+i1SK8Q779udnFC75YuSQFtEEBh4cMPJxRJqa1RhZI0=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 559B2A4C47D2;
 Sat, 19 Sep 2026 17:59:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSr-000000005Jx-1buv;
 Sat, 19 Sep 2026 15:58:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:12 +0200
Message-ID: <20260919155845.5776-48-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 47/77] package/libkrb5: Add support for
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
 ...eck_host-to-verify-KKDCP-server-cert.patch | 252 ++++++++++++++
 ...Improve-future-OpenSSL-compatibility.patch | 327 ++++++++++++++++++
 2 files changed, 579 insertions(+)
 create mode 100644 package/libkrb5/0002-Use-X509_check_host-to-verify-KKDCP-server-cert.patch
 create mode 100644 package/libkrb5/0003-Improve-future-OpenSSL-compatibility.patch

diff --git a/package/libkrb5/0002-Use-X509_check_host-to-verify-KKDCP-server-cert.patch b/package/libkrb5/0002-Use-X509_check_host-to-verify-KKDCP-server-cert.patch
new file mode 100644
index 0000000000..d1411cf0d5
--- /dev/null
+++ b/package/libkrb5/0002-Use-X509_check_host-to-verify-KKDCP-server-cert.patch
@@ -0,0 +1,252 @@
+From f5bbfa4821cf590a4748f96d0e016bc0485e95c4 Mon Sep 17 00:00:00 2001
+From: Greg Hudson <ghudson@mit.edu>
+Date: Wed, 25 Feb 2026 19:05:40 -0500
+Subject: [PATCH] Use X509_check_host() to verify KKDCP server cert
+
+In the k5tls module, rely on X509_check_host() and
+X509_check_ip_asc(), which were added in OpenSSL 1.0.2, instead of
+doing our own verification.
+
+There is one notable difference in behavior: X509_check_host() admits
+wildcards with a prefix or suffix (but not both) within the label,
+like "kdc*.mydomain.com".  The old code only allows a wildcard to
+match a complete label.
+
+ticket: 9198 (new)
+
+Upstream: https://github.com/krb5/krb5/commit/f5bbfa4821cf590a4748f96d0e016bc0485e95c4
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/plugins/tls/k5tls/openssl.c | 211 +-------------------------------
+ 1 file changed, 6 insertions(+), 205 deletions(-)
+
+diff --git a/src/plugins/tls/k5tls/openssl.c b/src/plugins/tls/k5tls/openssl.c
+index aab67c01cbc..42d72dc9ec2 100644
+--- a/src/plugins/tls/k5tls/openssl.c
++++ b/src/plugins/tls/k5tls/openssl.c
+@@ -71,218 +71,19 @@ flush_errors(krb5_context context)
+     }
+ }
+ 
+-/* Return the passed-in character, lower-cased if it's an ASCII character. */
+-static inline char
+-ascii_tolower(char p)
+-{
+-    if (KRB5_UPPER(p))
+-        return p + ('a' - 'A');
+-    return p;
+-}
+-
+-/*
+- * Check a single label.  If allow_wildcard is true, and the presented name
+- * includes a wildcard, return true and note that we matched a wildcard.
+- * Otherwise, for both the presented and expected values, do a case-insensitive
+- * comparison of ASCII characters, and a case-sensitive comparison of
+- * everything else.
+- */
+-static krb5_boolean
+-label_match(const char *presented, size_t plen, const char *expected,
+-            size_t elen, krb5_boolean allow_wildcard, krb5_boolean *wildcard)
+-{
+-    unsigned int i;
+-
+-    if (allow_wildcard && plen == 1 && presented[0] == '*') {
+-        *wildcard = TRUE;
+-        return TRUE;
+-    }
+-
+-    if (plen != elen)
+-        return FALSE;
+-
+-    for (i = 0; i < elen; i++) {
+-        if (ascii_tolower(presented[i]) != ascii_tolower(expected[i]))
+-            return FALSE;
+-    }
+-    return TRUE;
+-}
+-
+-/* Break up the two names and check them, label by label. */
+-static krb5_boolean
+-domain_match(const char *presented, size_t plen, const char *expected)
+-{
+-    const char *p, *q, *r, *s;
+-    int n_label;
+-    krb5_boolean used_wildcard = FALSE;
+-
+-    n_label = 0;
+-    p = presented;
+-    r = expected;
+-    while (p < presented + plen && *r != '\0') {
+-        q = memchr(p, '.', plen - (p - presented));
+-        if (q == NULL)
+-            q = presented + plen;
+-        s = r + strcspn(r, ".");
+-        if (!label_match(p, q - p, r, s - r, n_label == 0, &used_wildcard))
+-            return FALSE;
+-        p = q < presented + plen ? q + 1 : q;
+-        r = *s ? s + 1 : s;
+-        n_label++;
+-    }
+-    if (used_wildcard && n_label <= 2)
+-        return FALSE;
+-    if (p == presented + plen && *r == '\0')
+-        return TRUE;
+-    return FALSE;
+-}
+-
+-/* Fetch the list of subjectAltNames from a certificate. */
+-static GENERAL_NAMES *
+-get_cert_sans(X509 *x)
+-{
+-    int ext;
+-    X509_EXTENSION *san_ext;
+-
+-    ext = X509_get_ext_by_NID(x, NID_subject_alt_name, -1);
+-    if (ext < 0)
+-        return NULL;
+-    san_ext = X509_get_ext(x, ext);
+-    if (san_ext == NULL)
+-        return NULL;
+-    return X509V3_EXT_d2i(san_ext);
+-}
+-
+-/* Fetch a CN value from the subjct name field, returning its length, or -1 if
+- * there is no subject name or it contains no CN value. */
+-static int
+-get_cert_cn(X509 *x, char *buf, size_t bufsize)
+-{
+-    X509_NAME *name;
+-
+-    name = X509_get_subject_name(x);
+-    if (name == NULL)
+-        return -1;
+-    return X509_NAME_get_text_by_NID(name, NID_commonName, buf, bufsize);
+-}
+-
+-/* Return true if text matches any of the addresses we can recover from x. */
+-static krb5_boolean
+-check_cert_address(X509 *x, const char *text)
+-{
+-    char buf[1024];
+-    GENERAL_NAMES *sans;
+-    GENERAL_NAME *san = NULL;
+-    ASN1_OCTET_STRING *ip;
+-    krb5_boolean found_ip_san = FALSE, matched = FALSE;
+-    int n_sans, i;
+-    int name_length;
+-    struct in_addr sin;
+-    struct in6_addr sin6;
+-
+-    /* Parse the IP address into an octet string. */
+-    ip = ASN1_OCTET_STRING_new();
+-    if (ip == NULL)
+-        return FALSE;
+-    if (inet_pton(AF_INET, text, &sin)) {
+-        ASN1_OCTET_STRING_set(ip, (unsigned char *)&sin, sizeof(sin));
+-    } else if (inet_pton(AF_INET6, text, &sin6)) {
+-        ASN1_OCTET_STRING_set(ip, (unsigned char *)&sin6, sizeof(sin6));
+-    } else {
+-        ASN1_OCTET_STRING_free(ip);
+-        return FALSE;
+-    }
+-
+-    /* Check for matches in ipaddress subjectAltName values. */
+-    sans = get_cert_sans(x);
+-    if (sans != NULL) {
+-        n_sans = sk_GENERAL_NAME_num(sans);
+-        for (i = 0; i < n_sans; i++) {
+-            san = sk_GENERAL_NAME_value(sans, i);
+-            if (san->type != GEN_IPADD)
+-                continue;
+-            found_ip_san = TRUE;
+-            matched = (ASN1_OCTET_STRING_cmp(ip, san->d.iPAddress) == 0);
+-            if (matched)
+-                break;
+-        }
+-        sk_GENERAL_NAME_pop_free(sans, GENERAL_NAME_free);
+-    }
+-    ASN1_OCTET_STRING_free(ip);
+-
+-    if (found_ip_san)
+-        return matched;
+-
+-    /* Check for a match against the CN value in the peer's subject name. */
+-    name_length = get_cert_cn(x, buf, sizeof(buf));
+-    if (name_length >= 0) {
+-        /* Do a string compare to check if it's an acceptable value. */
+-        return strlen(text) == (size_t)name_length &&
+-               strncmp(text, buf, name_length) == 0;
+-    }
+-
+-    /* We didn't find a match. */
+-    return FALSE;
+-}
+-
+-/* Return true if expected matches any of the names we can recover from x. */
+-static krb5_boolean
+-check_cert_servername(X509 *x, const char *expected)
+-{
+-    char buf[1024];
+-    GENERAL_NAMES *sans;
+-    GENERAL_NAME *san = NULL;
+-    unsigned char *dnsname;
+-    krb5_boolean found_dns_san = FALSE, matched = FALSE;
+-    int name_length, n_sans, i;
+-
+-    /* Check for matches in dnsname subjectAltName values. */
+-    sans = get_cert_sans(x);
+-    if (sans != NULL) {
+-        n_sans = sk_GENERAL_NAME_num(sans);
+-        for (i = 0; i < n_sans; i++) {
+-            san = sk_GENERAL_NAME_value(sans, i);
+-            if (san->type != GEN_DNS)
+-                continue;
+-            found_dns_san = TRUE;
+-            dnsname = NULL;
+-            name_length = ASN1_STRING_to_UTF8(&dnsname, san->d.dNSName);
+-            if (dnsname == NULL)
+-                continue;
+-            matched = domain_match((char *)dnsname, name_length, expected);
+-            OPENSSL_free(dnsname);
+-            if (matched)
+-                break;
+-        }
+-        sk_GENERAL_NAME_pop_free(sans, GENERAL_NAME_free);
+-    }
+-
+-    if (matched)
+-        return TRUE;
+-    if (found_dns_san)
+-        return matched;
+-
+-    /* Check for a match against the CN value in the peer's subject name. */
+-    name_length = get_cert_cn(x, buf, sizeof(buf));
+-    if (name_length >= 0)
+-        return domain_match(buf, name_length, expected);
+-
+-    /* We didn't find a match. */
+-    return FALSE;
+-}
+-
+ static krb5_boolean
+ check_cert_name_or_ip(X509 *x, const char *expected_name)
+ {
+     struct in_addr in;
+     struct in6_addr in6;
++    int r;
+ 
+     if (inet_pton(AF_INET, expected_name, &in) != 0 ||
+-        inet_pton(AF_INET6, expected_name, &in6) != 0) {
+-        return check_cert_address(x, expected_name);
+-    } else {
+-        return check_cert_servername(x, expected_name);
+-    }
++        inet_pton(AF_INET6, expected_name, &in6) != 0)
++        r = X509_check_ip_asc(x, expected_name, 0);
++    else
++        r = X509_check_host(x, expected_name, 0, 0, NULL);
++    return r == 1;
+ }
+ 
+ static int
diff --git a/package/libkrb5/0003-Improve-future-OpenSSL-compatibility.patch b/package/libkrb5/0003-Improve-future-OpenSSL-compatibility.patch
new file mode 100644
index 0000000000..6b68af89e9
--- /dev/null
+++ b/package/libkrb5/0003-Improve-future-OpenSSL-compatibility.patch
@@ -0,0 +1,327 @@
+From 5e4e8452328804948d042235bbf58ca457795857 Mon Sep 17 00:00:00 2001
+From: Bob Beck <beck@openssl.org>
+Date: Mon, 16 Feb 2026 15:15:55 -0700
+Subject: [PATCH] Improve future OpenSSL compatibility
+
+Avoid calling deprecated OpenSSL functions when compiling against
+versions of OpenSSL where they are deprecated.  Add
+-DOPENSSL_NO_DEPRECATED to the linux-clang-openssl CI build to help
+detect calls to deprecated functions in the future.
+
+Use const pointer variables to hold values retrieved by accessors
+which will return const pointers in OpenSSL 4.0.  Define macros to
+make certain functions accept these const pointers in versions of
+OpenSSL where they don't already do so.
+
+Use accessor functions instead of direct field access for ASN1_STRING
+values, as the type will become opaque in OpenSSL 4.0.
+
+The PKINIT code is written to assume that DHX support was not present
+until OpenSSL 1.1, but it was added in release 1.0.2, causing a
+compilation error against 1.0.2 from a double definition of
+EVP_PKEY_DHX.  Minimally fix the compilation error.  (The custom DHX
+marshalling code to support 1.0.x could be removed, as 1.0.2 is the
+minimum version after commit f5bbfa4821cf590a4748f96d0e016bc0485e95c4,
+but the plan is to remove 1.0.x compatibility shortly.)
+
+Contains work by Frederik Wedel-Heinen
+<frederik.wedel-heinen@dencrypt.dk> and Dimitri John Ledkov
+<dimitri.ledkov@surgut.co.uk>.
+
+[ghudson@mit.edu: combined numerous commits; added compatibility
+macros; rewrote commit message; fixed 1.0.2 compatibility issue]
+
+Upstream: https://github.com/krb5/krb5/commit/5e4e8452328804948d042235bbf58ca457795857
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .github/workflows/build.yml                   | 10 ++--
+ .../preauth/pkinit/pkinit_crypto_openssl.c    | 54 ++++++++++++++-----
+ src/plugins/tls/k5tls/openssl.c               | 26 +++++++--
+ 3 files changed, 68 insertions(+), 22 deletions(-)
+
+diff --git a/.github/workflows/build.yml b/.github/workflows/build.yml
+index f12422d19a..97f1082c59 100644
+--- a/.github/workflows/build.yml
++++ b/.github/workflows/build.yml
+@@ -16,17 +16,17 @@ jobs:
+                     - name: linux-clang
+                       os: ubuntu-latest
+                       compiler: clang
+-                      makevars: CPPFLAGS=-Werror
++                      flags: -Werror
+                       configureopts: --enable-asan
+                     - name: linux-clang-openssl
+                       os: ubuntu-latest
+                       compiler: clang
+-                      makevars: CPPFLAGS=-Werror
++                      flags: -Werror -DOPENSSL_NO_DEPRECATED
+                       configureopts: --with-crypto-impl=openssl
+                     - name: linux-gcc
+                       os: ubuntu-latest
+                       compiler: gcc
+-                      makevars: CPPFLAGS=-D_FORTIFY_SOURCE=3
++                      flags: -D_FORTIFY_SOURCE=3
+         steps:
+             - name: Checkout repository
+               uses: actions/checkout@v1
+@@ -39,7 +39,7 @@ jobs:
+             - name: Build
+               env:
+                 CC: ${{ matrix.compiler }}
+-                MAKEVARS: ${{ matrix.makevars }}
++                FLAGS: ${{ matrix.flags }}
+                 CONFIGURE_OPTS:  ${{ matrix.configureopts }}
+               run: |
+                 # For the ksu tests, allow homedir access from other users.
+@@ -49,7 +49,7 @@ jobs:
+                 cd src
+                 autoreconf
+                 ./configure --enable-maintainer-mode --with-ldap $CONFIGURE_OPTS --prefix=$HOME/inst
+-                make $MAKEVARS
++                make CPPFLAGS="$FLAGS"
+                 make check
+                 make install
+                 (cd clients/ksu && make check-ksu)
+diff --git a/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c b/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
+index d1fe18e5ab..aa969aa37c 100644
+--- a/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
++++ b/src/plugins/preauth/pkinit/pkinit_crypto_openssl.c
+@@ -209,13 +209,20 @@ create_identifiers_from_stack(STACK_OF(X509) *sk,
+ #define EVP_MD_CTX_new EVP_MD_CTX_create
+ #define EVP_MD_CTX_free EVP_MD_CTX_destroy
+ #define ASN1_STRING_get0_data ASN1_STRING_data
++#define X509_STORE_CTX_set0_trusted_stack X509_STORE_CTX_trusted_stack
+ 
+ /*
+- * 1.1 adds DHX support, which uses the RFC 3279 DomainParameters encoding we
++ * 1.0.2 adds DHX support, which uses the RFC 3279 DomainParameters encoding we
+  * need for PKINIT.  For 1.0 we must use the original DH type when creating
+  * EVP_PKEY objects.
+  */
++#ifndef EVP_PKEY_DHX
+ #define EVP_PKEY_DHX EVP_PKEY_DH
++#endif
++
++/* Make X509_NAME_print_ex() accept a const name pointer by adding a cast. */
++#define X509_NAME_print_ex(a, b, c, d)          \
++    X509_NAME_print_ex(a, (X509_NAME *)b, c, d)
+ 
+ /* 1.1 makes many handle types opaque and adds accessors.  Add compatibility
+  * versions of the new accessors we use for pre-1.1. */
+@@ -295,6 +302,10 @@ compat_ECDSA_SIG_set0(ECDSA_SIG *sig, BIGNUM *r, BIGNUM *s)
+ #define EVP_PKEY_get_bits EVP_PKEY_bits
+ #define EVP_PKEY_get_base_id EVP_PKEY_base_id
+ 
++/* Make X509_dup() accept a const pointer by adding a cast. */
++#define X509_dup(a) X509_dup((X509 *)a)
++#define i2d_X509_NAME(a, b) i2d_X509_NAME((X509_NAME *)a, b)
++
+ /*
+  * Convert *dh to an EVP_PKEY object, taking ownership of *dh and setting it to
+  * NULL.  On error, return NULL and do not take ownership of or change *dh.
+@@ -318,6 +329,11 @@ dh_to_pkey(DH **dh)
+ }
+ #endif /* OPENSSL_VERSION_NUMBER < 0x30000000L */
+ 
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
++/* Make X509V3_EXT_d2i() accept a const pointer by adding a cast. */
++#define X509V3_EXT_d2i(a) X509V3_EXT_d2i((X509_EXTENSION *)a)
++#endif
++
+ /* Encode a bignum as an ASN.1 integer in DER. */
+ static int
+ encode_bn_der(const BIGNUM *bn, uint8_t **der_out, int *len_out)
+@@ -1134,6 +1150,13 @@ oerr_cert(krb5_context context, krb5_error_code code, X509_STORE_CTX *certctx,
+     return oerr(context, code, _("%s (depth %d): %s"), msg, depth, errstr);
+ }
+ 
++/* Convert an OpenSSL ASN.1 string value to krb5_data, without copying. */
++static inline krb5_data
++asn1string_to_data(ASN1_STRING *s)
++{
++    return make_data((char *)ASN1_STRING_get0_data(s), ASN1_STRING_length(s));
++}
++
+ krb5_error_code
+ pkinit_init_plg_crypto(krb5_context context,
+                        pkinit_plg_crypto_context *cryptoctx)
+@@ -1775,7 +1798,7 @@ cms_signeddata_create(krb5_context context,
+             goto cleanup;
+         X509_STORE_CTX_init(certctx, certstore, id_cryptoctx->my_cert,
+                             id_cryptoctx->intermediateCAs);
+-        X509_STORE_CTX_trusted_stack(certctx, id_cryptoctx->trustedCAs);
++        X509_STORE_CTX_set0_trusted_stack(certctx, id_cryptoctx->trustedCAs);
+         if (!X509_verify_cert(certctx)) {
+             retval = oerr_cert(context, 0, certctx,
+                                _("Failed to verify own certificate"));
+@@ -2002,7 +2025,7 @@ cms_signeddata_verify(krb5_context context,
+         unsigned char *d;
+         *is_signed = 0;
+         octets = CMS_get0_content(cms);
+-        if (!octets || ((*octets)->type != V_ASN1_OCTET_STRING)) {
++        if (!octets || (ASN1_STRING_type(*octets) != V_ASN1_OCTET_STRING)) {
+             retval = KRB5KDC_ERR_PREAUTH_FAILED;
+             krb5_set_error_message(context, retval,
+                                    _("Invalid pkinit packet: octet string "
+@@ -2058,7 +2081,8 @@ cms_signeddata_verify(krb5_context context,
+         /* We cannot use CMS_dataInit because there may be no digest */
+         octets = CMS_get0_content(cms);
+         if (octets)
+-            out = BIO_new_mem_buf((*octets)->data, (*octets)->length);
++            out = BIO_new_mem_buf(ASN1_STRING_get0_data(*octets),
++                                  ASN1_STRING_length(*octets));
+         if (out == NULL)
+             goto cleanup;
+     } else {
+@@ -2118,7 +2142,7 @@ cms_signeddata_verify(krb5_context context,
+ 
+         /* add trusted CAs certificates for cert verification */
+         if (idctx->trustedCAs != NULL)
+-            X509_STORE_CTX_trusted_stack(cert_ctx, idctx->trustedCAs);
++            X509_STORE_CTX_set0_trusted_stack(cert_ctx, idctx->trustedCAs);
+         else {
+             pkiDebug("unable to find any trusted CAs\n");
+             goto cleanup;
+@@ -2156,7 +2180,7 @@ cms_signeddata_verify(krb5_context context,
+         i = X509_verify_cert(cert_ctx);
+         if (i <= 0) {
+             int j = X509_STORE_CTX_get_error(cert_ctx);
+-            X509 *cert;
++            const X509 *cert;
+ 
+             cert = X509_STORE_CTX_get_current_cert(cert_ctx);
+             reqctx->received_cert = X509_dup(cert);
+@@ -2316,7 +2340,7 @@ crypto_retrieve_X509_sans(krb5_context context,
+     krb5_principal *princs = NULL;
+     char **upns = NULL;
+     unsigned char **dnss = NULL;
+-    X509_EXTENSION *ext = NULL;
++    const X509_EXTENSION *ext = NULL;
+     GENERAL_NAMES *ialt = NULL;
+     GENERAL_NAME *gen = NULL;
+ 
+@@ -2379,8 +2403,7 @@ crypto_retrieve_X509_sans(krb5_context context,
+         gen = sk_GENERAL_NAME_value(ialt, i);
+         switch (gen->type) {
+         case GEN_OTHERNAME:
+-            name.length = gen->d.otherName->value->value.sequence->length;
+-            name.data = (char *)gen->d.otherName->value->value.sequence->data;
++            name = asn1string_to_data(gen->d.otherName->value->value.sequence);
+             if (princs != NULL &&
+                 OBJ_cmp(plgctx->id_pkinit_san,
+                         gen->d.otherName->type_id) == 0) {
+@@ -2414,12 +2437,13 @@ crypto_retrieve_X509_sans(krb5_context context,
+         case GEN_DNS:
+             if (dnss != NULL) {
+                 /* Prevent abuse of embedded null characters. */
+-                if (memchr(gen->d.dNSName->data, '\0', gen->d.dNSName->length))
++                if (memchr(ASN1_STRING_get0_data(gen->d.dNSName), '\0',
++                           ASN1_STRING_length(gen->d.dNSName)))
+                     break;
+                 pkiDebug("%s: found dns name = %s\n", __FUNCTION__,
+-                         gen->d.dNSName->data);
++                         ASN1_STRING_get0_data(gen->d.dNSName));
+                 dnss[d] = (unsigned char *)
+-                    strdup((char *)gen->d.dNSName->data);
++                    strdup((char *)ASN1_STRING_get0_data(gen->d.dNSName));
+                 if (dnss[d] == NULL) {
+                     pkiDebug("%s: failed to duplicate dns name\n",
+                              __FUNCTION__);
+@@ -3094,8 +3118,10 @@ int
+ pkinit_openssl_init(void)
+ {
+     /* Initialize OpenSSL. */
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+     ERR_load_crypto_strings();
+     OpenSSL_add_all_algorithms();
++#endif
+     return 0;
+ }
+ 
+@@ -4766,7 +4792,7 @@ crypto_retrieve_X509_key_usage(krb5_context context,
+ }
+ 
+ static krb5_error_code
+-rfc2253_name(X509_NAME *name, char **str_out)
++rfc2253_name(const X509_NAME *name, char **str_out)
+ {
+     BIO *b = NULL;
+     char *str;
+@@ -5227,7 +5253,7 @@ create_identifiers_from_stack(STACK_OF(X509) *sk,
+     int i = 0, sk_size = sk_X509_num(sk);
+     krb5_external_principal_identifier **krb5_cas = NULL;
+     X509 *x = NULL;
+-    X509_NAME *xn = NULL;
++    const X509_NAME *xn = NULL;
+     unsigned char *p = NULL;
+     int len = 0;
+     PKCS7_ISSUER_AND_SERIAL *is = NULL;
+diff --git a/src/plugins/tls/k5tls/openssl.c b/src/plugins/tls/k5tls/openssl.c
+index 42d72dc9ec..7763327b7a 100644
+--- a/src/plugins/tls/k5tls/openssl.c
++++ b/src/plugins/tls/k5tls/openssl.c
+@@ -38,6 +38,24 @@
+ #include <openssl/x509v3.h>
+ #include <dirent.h>
+ 
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++/* Make X509_get_subject_name() accept a const pointer by adding a cast. */
++#define X509_get_subject_name(a) X509_get_subject_name((X509 *)a)
++
++/* OpenSSL 1.0 did not have TLS_client_method(); use the best alternative. */
++#define TLS_client_method() SSLv23_client_method()
++#endif
++
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
++/*
++ * OpenSSL 4.0 constifies the result of X509_STORE_CTX_get_current_cert() and
++ * the input of X509_check_host() and X509_check_ip_asc().  For prior versions,
++ * make the latter two functions accept const pointers via a cast.
++ */
++#define X509_check_host(a, b, c, d, e) X509_check_host((X509 *)a, b, c, d, e)
++#define X509_check_ip_asc(a, b, c) X509_check_ip_asc((X509 *)a, b, c)
++#endif
++
+ struct k5_tls_handle_st {
+     SSL *ssl;
+     char *servername;
+@@ -51,9 +69,11 @@ MAKE_INIT_FUNCTION(init_openssl);
+ int
+ init_openssl(void)
+ {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+     SSL_library_init();
+     SSL_load_error_strings();
+     OpenSSL_add_all_algorithms();
++#endif
+     ex_context_id = SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
+     ex_handle_id = SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
+     return 0;
+@@ -72,7 +92,7 @@ flush_errors(krb5_context context)
+ }
+ 
+ static krb5_boolean
+-check_cert_name_or_ip(X509 *x, const char *expected_name)
++check_cert_name_or_ip(const X509 *x, const char *expected_name)
+ {
+     struct in_addr in;
+     struct in6_addr in6;
+@@ -89,7 +109,7 @@ check_cert_name_or_ip(X509 *x, const char *expected_name)
+ static int
+ verify_callback(int preverify_ok, X509_STORE_CTX *store_ctx)
+ {
+-    X509 *x;
++    const X509 *x;
+     SSL *ssl;
+     BIO *bio;
+     krb5_context context;
+@@ -246,7 +266,7 @@ setup(krb5_context context, SOCKET fd, const char *servername,
+         return KRB5_PLUGIN_OP_NOTSUPP;
+ 
+     /* Do general SSL library setup. */
+-    ctx = SSL_CTX_new(SSLv23_client_method());
++    ctx = SSL_CTX_new(TLS_client_method());
+     if (ctx == NULL)
+         goto error;
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
