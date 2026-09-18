Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FC6C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7C9360E06;
	Fri, 18 Sep 2026 18:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nypnTlzOXMCX; Fri, 18 Sep 2026 18:46:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EF7AA60DE8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757196;
	b=I9ZsUd3dmvqZ5R3FGRNA2SSb3QMS7/CNOmcZCeNv1TbAxjMsCAvbCizQaeWuzuMbyWwg
	 WAilqWiBd8xNIlqkfPXuJF+yvr2kw+l/aVCgSXb9nk00914FaY3RuW8eREwhPEeK+r4qf
	 Q65HpxT5DU79v2kYhsfhOupsXTERWBEMp5mEAYWfGdeXJlqMapxel1msLYt0dIgXRk7V0
	 LbBY1v7DpC9TPmQTNibWU7v2ni2r2Fk5cFLfC3ASL8D6/4YbWlHSbatnbiYTiXoZ5KAa+
	 vwiD+NIErWi+BwvCExlkjpHd8pLl8J2S4NNU24KWvvrfrIrswi6CGob3W/itTznnCMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757196;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0+sZknX8TECdcly4qLiFcpwwQ06hNuA3M8UCpu0Bt94=;
	b=A1OUz7qViwC7LPHLWSmooywfejFlxy9Ks5Vb0gqGiPOihBVXQt7vBSufKOh807IvC+mF
	 /JTT5M4EdUDEpQGjvRTmF6D4/uqa3RCJNND3qCtz58bnl6goJqrS4Ik4aLsGnybnCItns
	 ImJeptVjtbtjwLlI+5ZomWu3pF471Iq7MBHwvZiHi0h5xxnl35LlZ1VAMces9IHFG6sFU
	 kspsZN9BmTot4MeHHGNj64dv5Ix/JMxCQHOto7gu5WC2RB9ZgDuJVkJSwcIWkSBV6Hxw+
	 sJGCKbIa1OYSjnuYeNaSCF9prhFGDfxHnuf7los7SOMNZM9yUPFk5iJAPfNIZN4lYJw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757196;
	bh=0+sZknX8TECdcly4qLiFcpwwQ06hNuA3M8UCpu0Bt94=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hJRl0LPRitifMkDJMn0/EiATCpmoXLS0Y2G9OB89J/T/UbrxpZrP05qnjLPtyujdB
	 SNEQC1jRUflvikL2MpjnOit9qVKhchA4ZfX20kTr8oo2qEh4pWYufKaAHqWWT3MoL3
	 aMSozOar22Ma3E007F7DY4XMVFGqQXjZiftEoPlzymnQsJ+pf85tYtiH0U8V11VWk1
	 4B3YpKCOEYKwxaSCM95YKab3HUh9CEdOfRSO5SeRcjxC+0918q+ceYlQaVZttl/Omb
	 Mcz+iprX2i3H7tlvpWwZvfkbyGQEbRfvrZlce5B4V6YcxX3bBj+za/klVS/duYWUnw
	 mAlixCQWaSw3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF7AA60DE8;
	Fri, 18 Sep 2026 18:46:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B1EE13D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01FEC812FC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lo_Osin9m2-8 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:46:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 109D3812FB
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757193;
 b=SCCmI+COGYnuQPdwqm4QXFsDMVCcwTZ4HJtInpqqLFBqKyryuLXxAnScm2nFslh+S6YJ
 sP4Il4gsqiMMdIu2KAhxCL15QkpiLlAEb/cYuM8qKheP1jaX8QQVY5NVPd9ckVIgk0jgz
 vlE/WBT7gkpY56jjOrz8AYmHPUkC10tZTNicF0DPvwqTTo0rm8NB/XMKD90JY+rws1ui3
 MAy3vUP8gvdNOR2NcRLKnsPkvD5fSmisi3K+k2dALjtKAJ6VTm9jFp1UvAfrL4EEWYmUs
 ZQfBBdWmCW/PPlkSGzIqqsLjbcPBTnT5791Fo+ux9JglGeu6dix0TivWWiCdD32XnCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757193;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=IsKJ6nhHUCpYF9rkotrVH9bxe6CSxYwy8ZH1pTyYrPM=;
 b=AARFu4Jfb7bDRcVYbMwxkawdpsdtwmSPDMERPC357g3Km99ETugpkuW1gyktAyglb+zX
 mN89wDfd7HUNvBIKyf08YXRU9cNX+1GF6GxGiy5kzKvS8LsKrc82YuvCWhsERbnEkZaX5
 LrdWMLTjMYnTmy61uuKdjxlvnQ9eF2BtxWKYnp+8MnRN50Iuk3yPFbtts00VB3yjxRvkh
 Owqza7AB+e30loT/GUWKb9hzoFFUmOucVjXNHaKpTvD+t0j9YeDjXqZDPJSaPb9WHhjon
 Teg9REH9pueAjlw1ZEeZVV1hc/tlHbX/F9jYsiG13lC/VF8gNyLrEMie35Zs58O/lhQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WfeokYFy; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=WfeokYFy
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 109D3812FB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756925;
 bh=IsKJ6nhHUCpYF9rkotrVH9bxe6CSxYwy8ZH1pTyYrPM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=WfeokYFyctvSyMrqrB46W7muJxJiDuImONgdj8ZQZ6e0RTqsaMg64FrkxMgUDNYdH
 Bd/C3j6/l5OyETQvO4RXAD+wnTBXIlTwqJpjvvuRYqY+PZImYfBfAy7ZYpdccTpI5S
 /XBz0kiNQvy3XQC4raDDgHE9sYM1eIlBZIg/Vp4ObUED+IK4k5yglN4gwvHLDkxls9
 7up/fEyRWtjixAdUlou8bhNH9y8yV+ahmRIkEFvFOK2B94w9caMo3taIciC9N2VQmb
 +EMctG+bPEZeYMpCnqJ15GmiSV49XuXuOx5iU1UxuB+1OE2+l1ckgaPuq533Lh1289
 +7qsJffQGIhJQ==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:NQnvbLtt9zQ6SjPoW5YMuDSLzAYD1zVhZ2ep1BN4OiT+sxTu9HawKBPIM+bl9rsNRykgxGiu5P583FN2p6h9L5++G1fkHgktOBk49Hs6PwwNYIT9tGSZuaNFZ39LX/8k76KMRsK0ep7uKVW9M9o1xntLpIBh72xA0vPG3oOlFp+oidDdWE7Ps5SmaHXjdqcJBbG8i9WW0yOG1QcSPXq35ecmJyWk/0hHaWb1oQQtJQ+e2Rk5NJpi+kTmdFqKQwoauLjvj7ukMxgXDv6Nepro7oesGHcuikvcPmNw93ZYwYyKW11N1lfYIoxmtdJhbcnb7gW0An0cQFDeao6VqW9aLSrqgGAf3xRMmm8cYEMhAbcEJb1pSGrJnz7wKwBkNMT5FANJuKNVb8fp2K37W5NCjeSc+iSGrPDjbAfWxgm4igHcjcM+xFup31OkDZholgTQ3ryj8NlBUReeH2/r/sBvKEgHi8EsQPd7t2gnPE55Jl5pG3/AlVPaS7njk/hi7T2gKY/gwDc1PjEtgORg4G90bYnx/lsvytbMtu9dahMlhPA6G85V2fiot9EwLYycHhOPMflGF/EXB8gIZ+3XwhHa8hf8Iu3LrdhlCWEl9DTpDYHOKu
 hu8B2k8iYKkOhXKa2KSY/wNKvVAw58mPHITRrb2XVehVOrNwPzscP5ndDjV4MJk4ZBVyNt1mrA
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AEEBFA4C4716;
 Fri, 18 Sep 2026 20:42:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dX2-000000007cB-1yIf;
 Fri, 18 Sep 2026 18:41:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:35 +0200
Message-ID: <20260918184140.3631274-74-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 73/77] package/turbolua: Fix build with OpenSSL
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
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
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
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
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
 ...-Replace-deprecated-OpenSSL-API-ASN1.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/turbolua/0001-turbo_ffi_wrap.c-Replace-deprecated-OpenSSL-API-ASN1.patch

diff --git a/package/turbolua/0001-turbo_ffi_wrap.c-Replace-deprecated-OpenSSL-API-ASN1.patch b/package/turbolua/0001-turbo_ffi_wrap.c-Replace-deprecated-OpenSSL-API-ASN1.patch
new file mode 100644
index 0000000000..efd1dfb080
--- /dev/null
+++ b/package/turbolua/0001-turbo_ffi_wrap.c-Replace-deprecated-OpenSSL-API-ASN1.patch
@@ -0,0 +1,49 @@
+From e473a5b44af312679c89b759e6be2608357de57b Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Wed, 9 Sep 2026 11:16:12 +0200
+Subject: [PATCH] turbo_ffi_wrap.c: Replace deprecated OpenSSL API
+ ASN1_STRING_data()
+
+ASN1_STRING_data() has been deprecated since OpenSSL 1.1.0. Replace
+with ASN1_STRING_get0_data(). ASN1_STRING_data() has been removed
+with OpenSSL 4.
+
+Upstream: https://github.com/kernelsauce/turbo/pull/374
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ deps/turbo_ffi_wrap.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/deps/turbo_ffi_wrap.c b/deps/turbo_ffi_wrap.c
+index f4a9e94..92cd88d 100644
+--- a/deps/turbo_ffi_wrap.c
++++ b/deps/turbo_ffi_wrap.c
+@@ -77,7 +77,12 @@ static int matches_common_name(const char *hostname, const X509 *server_cert)
+     if (!common_name_asn1) {
+         return Error;
+     }
++
++#if OPENSSL_VERSION_NUMBER >= 0x10100000
++    common_name_str = (char *) ASN1_STRING_get0_data(common_name_asn1);
++#else
+     common_name_str = (char *) ASN1_STRING_data(common_name_asn1);
++#endif
+     if (ASN1_STRING_length(common_name_asn1) != strlen(common_name_str)) {
+         return MalformedCertificate;
+     }
+@@ -113,7 +118,11 @@ static int32_t matches_subject_alternative_name(
+     for (i=0; i<san_names_nb; i++){
+         const GENERAL_NAME *current_name = sk_GENERAL_NAME_value(san_names, i);
+         if (current_name->type == GEN_DNS){
++#if OPENSSL_VERSION_NUMBER >= 0x10100000
++            char *dns_name = (char *)ASN1_STRING_get0_data(current_name->d.dNSName);
++#else
+             char *dns_name = (char *)ASN1_STRING_data(current_name->d.dNSName);
++#endif
+             dns_name_sz = strlen(dns_name);
+             if (ASN1_STRING_length(current_name->d.dNSName) != dns_name_sz){
+                 result = MalformedCertificate;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
