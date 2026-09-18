Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A9BC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3579740CBF;
	Fri, 18 Sep 2026 18:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11QSgCnkB7qH; Fri, 18 Sep 2026 18:50:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4F05F40CC9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757430;
	b=nRc4KP3/3fbFkg9AlOMPPaGijIYWGBtye4XfjujiZmUl+jHpMvqPXPteLc9hWz4hgttv
	 6UpSDPOmmQ5FqBA9SqUK/LuWR4wXXtHmhdL5SjEzMqLMFlaPYjpdeNifxiJCJvcT/2r6n
	 EVg0Hwn/YwDPi0X8JADZH8fJ8vmTQ38eET81YHxn8fz+NSovsqtSkVvvwWiVkB70qJyVi
	 YIb4GWimap1IF9Q/VQdEfk0RD4ERoifXIWuTHdrJSXSW/Es2Fu/wf/Ej/G2k3TTt3gZCy
	 RrzhiQi5aXh/I5m/RL72BB3EvBHAbPTby7FVLBFsuUjc5/NjmJbvqGfYbBN5lH1JJ0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757430;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TnW7QnnJGFHpzwovPj/MzrFcIsDVsmyzL9LIvI7KjoI=;
	b=AvifvdmedLMP/DNdslMwMAnRXMffPii/kBBIt54JByQ9ToJYsRh9BZ18RZ+i1YJnd5fJ
	 J0QIYii45jqNlkb1+zOU62GITJ3OWvV3BMkz9lNIpa3MaIxzp3Za5eMbs5d16du6Ox4jv
	 jx5prG0nt8dRWbuyUsktjux/mXLZs8LYn6PxaUeAYlKiHKdgFRBxDWe9EUzKzgZ9GuaPQ
	 LDClV2RQCBSzjojc8V1YxcBAykRVcN5B0JdxK1HsT2jIq9xn3j3b9dEIIcmgT1Br8oZi3
	 U3JU7LZRjVihoCp3WoZnuhUPmtQVJLPrYYIpuwHCv/DA1XEqZUQUKgX+Dlq+8cRTnSA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757430;
	bh=TnW7QnnJGFHpzwovPj/MzrFcIsDVsmyzL9LIvI7KjoI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oGrLt90naBQ8YoJCYAgSkyxW5iKmRAf9whMKGkcPAb2vL4T9pcHuVb7nOKGuoP2Ev
	 TfWqyagj1nD0CK+3nNKW14DM79WKHgcJco9q+ANGSTSUnf+gK3AHq2JA77kfQCkeoF
	 wSsNQa8v4KnYVBVrlaKzYkBXMjepFpeaOFwK2CN7ggglns/nW+Y3KYBWPiv2GtuRkE
	 kD7OD2hJ69Dui5P4zanUxf7SOVzquLpNqXAaQ8jGo/DlIxWXpdaJ3b0v6oeXwvDHuF
	 yvi0Fj9edJljMTRXfcBYCVACAgiVFWm4po4+g+eWO2LuvEAtdPj/eQ2mRYwLTUbHVS
	 CDmPTjH4e1K+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F05F40CC9;
	Fri, 18 Sep 2026 18:50:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A839A3B9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A558660E43
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHMb_6oq5wIN for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:50:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BD7DF60E3C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757428;
 b=GkBM6f91am8MgWTtU8lA7ZMh4KBGio5o3UO0+uhtYyhunxVRRoZBcMEjuglaYw0YeeMV
 HgqeYUrX4BfXjMS6eYyugy4h+sblM3fiHW5/1cgFZaWic4dAb6rEGJmTYJXxubVg0wQNL
 8Bthxs3Sdg2kJ+HiOVwhOAKxLvsoleI3+lxZwH08SoP7wqIdS3Oi+E1yOAM5oEB/ysOa7
 MVmYrRWHLSHJ3nGB7oqj+TrUmKmvqA1pkkTq3I/weemUPpW017/+tz8zWB3axgDJhnWSs
 DksDvumKYCSSKAmxIJGyWNjGKUQBGUfqr63qJxAwX7d5UGV9h9hkNLA9i4L7akohciA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757428;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=73jDUQh0xeWpwmS+ehtge8hew78j09XtI0zHFLemPX4=;
 b=qgKRheQFB0WageQfoyP2OhS9aUVARGtyGUj5GfXmf1m0davkjl7hA2U8g8Qe7B+oOt2R
 NeS4QY9+xqbY8e5UWPY2Rhqo4BcAzJbPdtBdmz4l6WcBBugvHw/FAUdKZ676buavnn/fk
 9bLFIV781bWWJSjeifq0ZdwHjw6492+QEh/dzfSCrby3hvPlVRRseKMJAaJ8NKlythzC4
 RQnu7LmausG+OqmvOK2lE/fbKZSr8GCPZQKF5gPbXeixe8EzW3KPP+mJJiRe7M8DO58ms
 NoFVQkFXq1z0cIutW/ejfmzNpvQXtYS0zrBIe9VGAYOEE7Apm/+fgXUwbkohGGZhSbw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=GNNqe5ht; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=GNNqe5ht
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD7DF60E3C
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756935;
 bh=73jDUQh0xeWpwmS+ehtge8hew78j09XtI0zHFLemPX4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GNNqe5ht1voWr/yKjVB1MwD++8bq470LJ61Jyoj0kkYWqy8btmlgtGdAoLD9sUp8R
 NcUTpOKLRuNjZNIp3AlgA28Bn7qSCAKrhEo5bDG2oPdDwX55dbbnrGhw9wHnbGzCO/
 dZyvrZtNIeTMjUvO5CGVUy/BQvFJUyACmzVUkIZwZgBGRdotb+NLWSL4Lm7TqnX0QH
 r3s64ull/RUvstbNIRP/SWXWzF2cXBEG/xeQthiTkGA7XJ9MYfXXY2Hsdn+6/c/sbd
 WgGnmDScgSv/r8qOqfRCqxxe6uAxPtPtAbauRwrRouBSd3JLGIlyBWgT15ZMV4wFIv
 5KRfxqw6pO3uw==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:RrRauo1yed5aur0ApwETIWfvH0I/5ORXNYmzGZxLUGb53EgvaJJ/hF6SCyFcoyDKrA19JundvFUmdi5DoYbPl9igb9b6zLOQVJcbaqNizv/PoCA3S5VKm+4t1UuHrpejaSkco6c74vqiMeCTHNZhzvThoYc7DlssaYuWhw8JyWFVCagKuxOQo0jmhoSbpckQPp5AE7A7OirG9fPgzj8O/53wu6xsf0pbjBXs1vFk4u4WXq+TT0zs1VFWAOe63lO8eDWVugDtr8zYGvrgt006/oMtUxZObpFqC9ybC8SSS5c5CK5wGcnuAchm6lu2F/y8gk0+8Lv8VDEyx7HypvWQtWNQ9u/VEiZei4QCu5DXTWgf808P56cwdXXVW+QXMKBIVbY4U2v9/t+b566WLdLawMK/7sziDlIEwngLANDrHXM/hesmFAhB1sxF9j1952LjuyBg4fUwNwWSwsgLr/QI9p4vko5xyPYo8NbPz2y5ZWNxkZEIf4OVB6GjWPmYdXAi6/lQgYdMuBqV3BsJkWsgOEpHxhSHNVNT+Gr2JLB+wD5ezBFyt36LYwb0BNMqJK4/EXv3kggtVfiLjC0i+kyFSH3KJtKirWwW4dRcTEHwHc2/mO
 Ay1ZxJuKgIDMxvvP7S+cQav3PLwUODpDsXm3HIWbommItt9gyeTOljNyf9yDoX6SjpueDzH27S
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 91396A4C472E;
 Fri, 18 Sep 2026 20:42:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWu-000000007cB-3yR1;
 Fri, 18 Sep 2026 18:41:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:54 +0200
Message-ID: <20260918184140.3631274-33-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 32/77] package/apache: Add support for OpenSSL
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
