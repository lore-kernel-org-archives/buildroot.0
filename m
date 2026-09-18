Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB5FC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9A1A40B10;
	Fri, 18 Sep 2026 18:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_7iTm9Ng_Jm; Fri, 18 Sep 2026 18:54:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7052E40BA2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757684;
	b=jh5M0oyBKpakcj3Bx5sgmE88vhm9M2/a8uaXJJL9BVW5Ld6AZyfgOGWwCaXqHgNjqT77
	 sUOpE/VBg4tY4XxeAONi22euQSdQbp2Nhy30rYm+LkI80iYk5M7XdcX3tqhRRudKq2sG5
	 2NPji5xfKvIw9KHlvDo6J2dXdpO7l4hH6VPEGZ5p6BakskepKj+SauDaxGapfByN349bj
	 Jkb3P6mOiB89PWR13/5rxn3q4dVpMuos4tzh0XQrNlZoruWFysOtXEPyPPI67R4aqAq8Q
	 FijD3VNC1hrw5MsJO3BeszU0Wnz6vOFLHgVYiBRVBT2L0/YD531n9eGfEWU3Eh4gN0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757684;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=E8+qqsofRKJaQn3mUqUVdrNlKahRmKK8kQGPLWEHC9s=;
	b=mbxSctflMvjnebqvQ1pGQxHQhTCyTpk+q0WveOe8S1yUSIne8ym3LjYlW66KK57HDL3G
	 hf8HiaN8cVs6swhhvyE4Pa33Trycuqqp212heRzcgrlAbxIqPNAjB2U4oXgnc2MGoXG6K
	 xJXExZNXRlf2Xp5eSMhPhn166ta3lZ37B8pJhbG9ZUTT1vkT1OSL5Nx1IRRpfFh95foVf
	 Rfj97/6R9L885huOh6Bbtnee01s5kuOeNPpYF6JvBIgNfKW35B3PxkyvNXa9pC47gv3H8
	 CeeRsnl5fSRJY1Upep78zYodLBkxpoLqHJM4+S/965N+eDlS/ZfGaMBmoFPepvKm6rA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757684;
	bh=E8+qqsofRKJaQn3mUqUVdrNlKahRmKK8kQGPLWEHC9s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bjMhOoiO88kQvuw03t9CKKRq1AUVwUndEHzlcPzhGPogGF7Gx1WTXmaAu80g3ysQi
	 2VP4tFqaYp+b/qsa5uyHPYIQqCxHkFN7hcJO2s5z5ozMfhT0m9MIYdQokWtWcezCrS
	 q43bmfFYtNv3ZjX/641isBJIe1/0zoyw4ouUsoeUD7BL7Hm4kKIPan8nL8hen+e0m8
	 Jz4MFCqQfNAmrIDWzklEa0U/gzbuWjzXMM8UJLK+eqqaewb8NsczOZXhxgLzeUysZE
	 c9VL94o/CirVqTC40gjHLG0cSD7PIkgH2GSNa6kLE7vtntuyURUnAY9fIK9ZybiSbp
	 3TdKvrwPN3KaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7052E40BA2;
	Fri, 18 Sep 2026 18:54:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CABC237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F01860E95
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISl9mAD3imEg for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:54:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A925360E60
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757682;
 b=bIS7AK7Oq4eWWH4YWrHFCey6FRVHx+NA90xkfAIci9OcPQJ4bbZxZzG/xLANXu7J07hQ
 MwTVYS75yumKlHasjEOY9GZRLdG2ufxT2UBUAsPvG+zdxWIQ3F6ATBOiW9GtY29aaXgnC
 aQXyQxzvYs4ca4bL+cRIy0i9v/sY3P893MW4M8TngOrWMl7+vKlR/3s2Tpm4nZCSTRsmP
 TbZRZ+o5Cw0LOylj2MxVFcssoAfR63QSlPWNbPU470CyYpHSAeBqyQ2p9OgmAp2cW0Os+
 J6quVkzrJEZX4p07oqb887I+yDySl7lBsX7lTQqpSNI2GaUGhcA99ZJsghplo/zp+BQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757682;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=mS4JLavjzPnQeAKk7KeczDb6jqM5ePHP1MWrtE+89LQ=;
 b=g//8shiKqGnfNKecsmna+5vTnAVtgQs/UA8kQWgA/WSD8CRZ5q2glarsjYyhztOrfmF1
 xwemFwtz9P4Y0LF1xIV87h1ZjILpA+rHV2EnmEw/wqK+YE3OPzFIeijBilZu8QcQuacxU
 eewX7nrwQUM63uOo/fxCNP7wvESj7h3qiTzzXVRn4G9mQRWr3wYsKzozRRetluC7CkCkt
 QiNRPLdz5rnjY02C14XWHV+i2XRBsMobe/i7Vq98xOQNnuUUQ3vIgb5LU5gWHctBRw86O
 GbCZSEZi1/a61cFy6kpHViV0gpOwiqNxIcC3Hm88CIF6DNUYblrIZ5nMn1yZSMTmGww==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=acxklWr6; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=acxklWr6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A925360E60
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756944;
 bh=mS4JLavjzPnQeAKk7KeczDb6jqM5ePHP1MWrtE+89LQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=acxklWr6XfAfaK8aXMJ+l5WVnps3RNx21EFnIQa+fRPlJWsRJoTcuoVi94W8r2Ktw
 zGoV+YUgO3D2slHY4653Sd+4W9N3eGlBQ6N11C4qnQBWPyPyQGZnoPlpcIAl5HYB9P
 vulgqFEUEuwofjTM1wezY2EaaczL6wkFEieveTKbUBAGqcaso/IZ215J/UDahbrnMY
 L6EMAxOIF9AAAAnsVyaENxh4Ey/6CwIjdpE4x2Mn54JNzRIDPLNlo0IWfEjmD2UxwN
 wGYgLVCx6tLivSO+csXgr8+PBCYpFtw+PGuJDbYcyO7D9Kc1S0IbTXhdne3BRTDk5e
 0HO7JwIldxRbg==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:TpYAWUaOm2UsVJzzxxkX+30i/rQlhVN7jR0oYHNi+0JPY5vHeFgzfp+0heenKdW3XEzsWMsHae6RkhkU2la6lmofhhtp1QJFfN5HbacdRSOALCm9jxait3+Qaj2q/EaeHQxwLksZmxa+G2OrAvaSpbEJ58OhFTYKJ0ldbyo0lTbfhjmMEZyx9+4KiWdkbxfAljD9NxAaaEau7FGkyhQrxIRv0T3eReGUDT0lqUeVg8aBm9AVQ0miQarVErJUqRAvd9uMJZt9wK8dwsh1oua62P7HMblcVqvipet+dbXXTAC3fHrJ/akxD7zUbjBBANCmPYs4On57Kyc8QCS9uKogM8P3/WCJqdXlxfpK6mmYgfQ8+vlll2YzR2vwY+qurqxKxkXMWu6d8KPcpb0Y2CwgiumPr6qo1BdiB0I8cavvxUlwUNqTmSsg5lUaB9G3mHv2JKS8w7aZ8riLmrmQTOMBdp6b7Ntr3XtxIayhKRlu43T5ewTtaW7IHZoV0pBH9QRmo2Plco5/lvmlnU1Ep1EixGSqK4kq7KZb2c7H8EalPY0u0DF5J8X4E6ciADBRst5E7++oAhqLEjnn/dJP7xqvse6bstSwQw4Sn312A3h5em1PzL
 CyP8ONDtZb/33I+ZeOPcWJ3oIZu5a7aLiG8KFD8HNgoKdcSxkIUY0TDpm29IG3228X/MkedvQZ
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4EF5BA4C4745;
 Fri, 18 Sep 2026 20:42:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWx-000000007cB-3FRk;
 Fri, 18 Sep 2026 18:41:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:12 +0200
Message-ID: <20260918184140.3631274-51-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 50/77] package/luvi: Fix build with OpenSSL 4.0.0
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
 .../luvi/0002-feat-support-openssl-4.0.patch  | 403 ++++++++++++++++++
 1 file changed, 403 insertions(+)
 create mode 100644 package/luvi/0002-feat-support-openssl-4.0.patch

diff --git a/package/luvi/0002-feat-support-openssl-4.0.patch b/package/luvi/0002-feat-support-openssl-4.0.patch
new file mode 100644
index 0000000000..fa35b70435
--- /dev/null
+++ b/package/luvi/0002-feat-support-openssl-4.0.patch
@@ -0,0 +1,403 @@
+From 529b4a42eeb2b77f8f8c829f856977c5b50d0b7b Mon Sep 17 00:00:00 2001
+From: zhaozg <zhaozg@gmail.com>
+Date: Thu, 16 Apr 2026 14:04:32 +0800
+Subject: [PATCH] feat: support openssl 4.0
+
+Upstream: https://github.com/zhaozg/lua-openssl/commit/529b4a42eeb2b77f8f8c829f856977c5b50d0b7b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ deps/lua-openssl/src/asn1.c      | 59 +++++++++++++++++++++++++++++++------------------
+ deps/lua-openssl/src/crl.c       |  9 ++++----
+ deps/lua-openssl/src/csr.c       | 30 +++++++++++++++++--------
+ deps/lua-openssl/src/openssl.c   |  2 ++
+ deps/lua-openssl/src/private.h   |  2 +-
+ deps/lua-openssl/src/ssl.c       |  2 +-
+ deps/lua-openssl/src/x509.c      |  2 +-
+ deps/lua-openssl/src/xalgor.c    |  2 +-
+ deps/lua-openssl/src/xname.c     |  2 +-
+ deps/lua-openssl/test/helper.lua |  2 +-
+ 10 files changed, 71 insertions(+), 41 deletions(-)
+
+diff --git a/deps/lua-openssl/src/asn1.c b/deps/lua-openssl/src/asn1.c
+index d7972738..566d78ee 100644
+--- a/deps/lua-openssl/src/asn1.c
++++ b/deps/lua-openssl/src/asn1.c
+@@ -499,7 +499,14 @@ openssl_asn1object_new(lua_State *L)
+       ret = 1;
+     }
+   } else if (lua_isnone(L, 1)) {
+-    ASN1_OBJECT *obj = ASN1_OBJECT_new();
++    /* ASN1_OBJECT_new() is deprecated in OpenSSL 4.0,
++     * but there's no direct replacement for creating an empty object.
++     * We create an object from a dummy NID instead. */
++    ASN1_OBJECT *obj = OBJ_nid2obj(NID_undef);
++    if (obj == NULL) {
++        /* Fallback: create from empty string */
++        obj = OBJ_txt2obj("", 1);
++    }
+     PUSH_OBJECT(obj, "openssl.asn1_object");
+     ret = 1;
+   }
+@@ -658,11 +665,13 @@ openssl_push_asn1type(lua_State *L, const ASN1_TYPE *type)
+ {
+   lua_newtable(L);
+ 
+-#define P(V, v)                                                                                    \
+-  case V_##V: {                                                                                    \
+-    V *s = (V *)type->value.ptr;                                                                   \
+-    AUXILIAR_SETLSTR(L, -1, "value", (const char *)s->data, s->length);                            \
+-    break;                                                                                         \
++#define P(V, v)                                                  \
++  case V_##V: {                                                  \
++    V *s = (V *)type->value.ptr;                                 \
++    AUXILIAR_SETLSTR(L, -1, "value",                             \
++                     (const char *)ASN1_STRING_get0_data(s),     \
++                     ASN1_STRING_length(s));                     \
++    break;                                                       \
+   }
+ 
+   switch (type->type) {
+@@ -695,7 +704,7 @@ openssl_push_asn1type(lua_State *L, const ASN1_TYPE *type)
+ 
+   default: {
+     ASN1_STRING *s = (ASN1_STRING *)type->value.asn1_string;
+-    AUXILIAR_SETLSTR(L, -1, "value", (const char *)s->data, s->length);
++    AUXILIAR_SETLSTR(L, -1, "value", ASN1_STRING_get0_data(s), ASN1_STRING_length(s));
+     break;
+   }
+   }
+@@ -1004,8 +1013,9 @@ openssl_asn1group_set(lua_State *L)
+ {
+   ASN1_STRING *s = CHECK_GROUP(1, ASN1_STRING, "openssl.asn1group");
+   int          ret = 1;
++  int          type = ASN1_STRING_type(s);
+ 
+-  switch (s->type) {
++  switch (type) {
+   case V_ASN1_INTEGER: {
+     ASN1_INTEGER *ai = CHECK_OBJECT(1, ASN1_INTEGER, "openssl.asn1_integer");
+     long          v = luaL_checklong(L, 2);
+@@ -1044,16 +1054,19 @@ static time_t
+ ASN1_TIME_get(ASN1_TIME *time, time_t off)
+ {
+   struct tm   t;
+-  const char *str = (const char *)time->data;
+   size_t      i = 0;
++  const char *str = (const char *)ASN1_STRING_get0_data(time);
++  size_t      len = ASN1_STRING_length(time);
++  int         type = ASN1_STRING_type(time);
+ 
++  if (len < 13) return 0;  /* Invalid time format */
+   memset(&t, 0, sizeof(t));
+ 
+-  if (time->type == V_ASN1_UTCTIME) /* two digit year */ {
++  if (type == V_ASN1_UTCTIME) /* two digit year */ {
+     t.tm_year = (str[i++] - '0') * 10;
+     t.tm_year += (str[i++] - '0');
+     if (t.tm_year < 70) t.tm_year += 100;
+-  } else if (time->type == V_ASN1_GENERALIZEDTIME) /* four digit year */ {
++  } else if (type == V_ASN1_GENERALIZEDTIME) /* four digit year */ {
+     t.tm_year = (str[i++] - '0') * 1000;
+     t.tm_year += (str[i++] - '0') * 100;
+     t.tm_year += (str[i++] - '0') * 10;
+@@ -1086,7 +1099,7 @@ openssl_asn1group_get(lua_State *L)
+ {
+   ASN1_STRING *s = CHECK_GROUP(1, ASN1_STRING, "openssl.asn1group");
+   int          ret = 0;
+-  switch (s->type) {
++  switch (ASN1_STRING_type(s)) {
+   case V_ASN1_INTEGER: {
+     ASN1_INTEGER *ai = CHECK_OBJECT(1, ASN1_INTEGER, "openssl.asn1_integer");
+     BIGNUM       *bn = ASN1_INTEGER_to_BN(ai, NULL);
+@@ -1128,7 +1141,7 @@ openssl_asn1group_i2d(lua_State *L)
+     break;                                                                                         \
+   }
+ 
+-  switch (s->type) {
++  switch (ASN1_STRING_type(s)) {
+     /*
+     P(ASN1_BOOLEAN);
+     case V_ASN1_BOOLEAN:
+@@ -1220,7 +1233,7 @@ openssl_asn1group_d2i(lua_State *L)
+     break;                                                                                         \
+   }
+ 
+-  switch (s->type) {
++  switch (ASN1_STRING_type(s)) {
+     /*
+     P(ASN1_BOOLEAN);
+     case V_ASN1_BOOLEAN:
+@@ -1374,7 +1387,8 @@ openssl_asn1group_eq(lua_State *L)
+   ASN1_STRING *s = CHECK_GROUP(1, ASN1_STRING, "openssl.asn1group");
+   ASN1_STRING *ss = CHECK_GROUP(2, ASN1_STRING, "openssl.asn1group");
+ 
+-  lua_pushboolean(L, (s->type == ss->type && ASN1_STRING_cmp(s, ss) == 0));
++  lua_pushboolean(L, (ASN1_STRING_type(s) == ASN1_STRING_type(ss)
++                      && ASN1_STRING_cmp(s, ss) == 0));
+   return 1;
+ }
+ 
+@@ -1434,7 +1448,7 @@ openssl_asn1group_toprint(lua_State *L)
+   unsigned long flags = luaL_optint(L, 2, 0);
+   BIO          *out = BIO_new(BIO_s_mem());
+   BUF_MEM      *mem;
+-  switch (s->type) {
++  switch (ASN1_STRING_type(s)) {
+   case V_ASN1_UTCTIME: {
+     ASN1_TIME *a = (ASN1_TIME *)s;
+     ASN1_TIME_print(out, a);
+@@ -1484,7 +1498,7 @@ static int
+ openssl_asn1group_dup(lua_State *L)
+ {
+   ASN1_STRING *s = CHECK_GROUP(1, ASN1_STRING, "openssl.asn1group");
+-  openssl_push_asn1(L, s, s->type);
++  openssl_push_asn1(L, s, ASN1_STRING_type(s));
+   return 1;
+ }
+ 
+@@ -1517,7 +1531,7 @@ openssl_asn1time_adj(lua_State *L)
+   int        offset_day = luaL_optint(L, 3, 0);
+   long       offset_sec = luaL_optlong(L, 4, 0);
+ 
+-  switch (at->type) {
++  switch (ASN1_STRING_type(at)) {
+   case V_ASN1_UTCTIME: {
+     ASN1_UTCTIME *a = (ASN1_UTCTIME *)at;
+     ASN1_UTCTIME_adj(a, t, offset_day, offset_sec);
+@@ -1549,7 +1563,7 @@ openssl_asn1time_diff(lua_State *L)
+   ASN1_TIME *from = CHECK_OBJECT(1, ASN1_TIME, "openssl.asn1_time");
+   ASN1_TIME *to = lua_isnoneornil(L, 2) ? NULL : CHECK_OBJECT(2, ASN1_TIME, "openssl.asn1_time");
+ 
+-  luaL_argcheck(L, to->type == from->type, 2, "asn1_time with mismatched type");
++  luaL_argcheck(L, ASN1_STRING_type(to) == ASN1_STRING_type(from), 2, "asn1_time with mismatched type");
+ 
+   ret = ASN1_TIME_diff(&day, &sec, from, to);
+   if (ret == 1) {
+@@ -1644,12 +1658,13 @@ openssl_push_asn1object(lua_State *L, const ASN1_OBJECT *obj)
+ int
+ openssl_push_asn1(lua_State *L, const ASN1_STRING *string, int type)
+ {
+-  if ((string->type & V_ASN1_GENERALIZEDTIME) == V_ASN1_GENERALIZEDTIME && type == V_ASN1_UTCTIME)
++  int strType = ASN1_STRING_type(string);
++  if ((strType & V_ASN1_GENERALIZEDTIME) == V_ASN1_GENERALIZEDTIME && type == V_ASN1_UTCTIME)
+     type = V_ASN1_GENERALIZEDTIME;
+-  else if ((string->type & V_ASN1_UTCTIME) == V_ASN1_UTCTIME && type == V_ASN1_GENERALIZEDTIME)
++  else if ((strType & V_ASN1_UTCTIME) == V_ASN1_UTCTIME && type == V_ASN1_GENERALIZEDTIME)
+     type = V_ASN1_UTCTIME;
+   else if (type == V_ASN1_UNDEF)
+-    type = string->type;
++    type = strType;
+ 
+   switch (type) {
+   case V_ASN1_INTEGER: {
+diff --git a/deps/lua-openssl/src/crl.c b/deps/lua-openssl/src/crl.c
+index 4950b4ca..2958daa0 100644
+--- a/deps/lua-openssl/src/crl.c
++++ b/deps/lua-openssl/src/crl.c
+@@ -770,7 +770,7 @@ static int openssl_crl_parse(lua_State *L)
+       lua_setfield(L, -2, "sig_alg");
+     }
+ 
+-    if (sig != NULL && sig->length > 0) {
++    if (sig != NULL && ASN1_STRING_length(sig) > 0) {
+       PUSH_ASN1_STRING(L, sig);
+       lua_setfield(L, -2, "signature");
+     }
+@@ -995,16 +995,17 @@ static time_t
+ ASN1_GetTimeT(const ASN1_TIME *time)
+ {
+   struct tm   t;
+-  const char *str = (const char *)time->data;
++  const char *str = ASN1_STRING_get0_data(time);
++  int type = ASN1_STRING_type(time);
+   size_t      i = 0;
+ 
+   memset(&t, 0, sizeof(t));
+ 
+-  if (time->type == V_ASN1_UTCTIME) /* two digit year */ {
++  if (type == V_ASN1_UTCTIME) /* two digit year */ {
+     t.tm_year = (str[i++] - '0') * 10;
+     t.tm_year += (str[i++] - '0');
+     if (t.tm_year < 70) t.tm_year += 100;
+-  } else if (time->type == V_ASN1_GENERALIZEDTIME) /* four digit year */ {
++  } else if (type == V_ASN1_GENERALIZEDTIME) /* four digit year */ {
+     t.tm_year = (str[i++] - '0') * 1000;
+     t.tm_year += (str[i++] - '0') * 100;
+     t.tm_year += (str[i++] - '0') * 10;
+diff --git a/deps/lua-openssl/src/csr.c b/deps/lua-openssl/src/csr.c
+index b9aaeece..fd4743e8 100644
+--- a/deps/lua-openssl/src/csr.c
++++ b/deps/lua-openssl/src/csr.c
+@@ -120,8 +120,8 @@ static int
+ copy_extensions(X509 *x, X509_REQ *req, int override)
+ {
+   STACK_OF(X509_EXTENSION) *exts = NULL;
+-  X509_EXTENSION *ext, *tmpext;
+-  ASN1_OBJECT    *obj;
++  const X509_EXTENSION *ext, *tmpext;
++  const ASN1_OBJECT *obj;
+   int             i, idx, ret = 0;
+   if (!x || !req) return 1;
+   exts = X509_REQ_get_extensions(req);
+@@ -138,7 +138,7 @@ copy_extensions(X509 *x, X509_REQ *req, int override)
+       do {
+         tmpext = X509_get_ext(x, idx);
+         X509_delete_ext(x, idx);
+-        X509_EXTENSION_free(tmpext);
++        X509_EXTENSION_free((X509_EXTENSION*)tmpext);
+         idx = X509_get_ext_by_OBJ(x, obj, -1);
+       } while (idx != -1);
+     }
+@@ -157,7 +157,7 @@ static int
+ X509_REQ_to_X509_ex(X509_REQ *r, int days, EVP_PKEY *pkey, const EVP_MD *md, X509 **x)
+ {
+   X509         *ret = NULL;
+-  X509_NAME    *xn = NULL;
++  const X509_NAME *xn = NULL;
+   EVP_PKEY     *pubkey = NULL;
+   ASN1_TIME    *notBefore = NULL, *notAfter = NULL;
+   ASN1_INTEGER *serial = NULL;
+@@ -412,9 +412,21 @@ static int openssl_csr_sign(lua_State *L)
+     /*
+      * In the interests of compatibility, I'll make sure that the bit string
+      * has a 'not-used bits' value of 0
++     *
++     * Instead of directly manipulating the internal flags (which is not allowed
++     * in OpenSSL 4.0+), we use ASN1_BIT_STRING_set_bit to properly manage the
++     * unused bits count. Setting the last bit explicitly ensures the unused
++     * bits count is calculated correctly by OpenSSL.
+      */
+-    sig->flags &= ~(ASN1_STRING_FLAG_BITS_LEFT | 0x07);
+-    sig->flags |= ASN1_STRING_FLAG_BITS_LEFT;
++    if (siglen > 0) {
++        /* Set the last bit of the signature to its current value.
++         * This forces OpenSSL to recalculate and set the unused bits count
++         * to 0 (since the signature is byte-aligned). */
++        int last_bit = (siglen * 8) - 1;
++        int bit_value = (sigdata[siglen - 1] & 1) ? 1 : 0;
++        ASN1_BIT_STRING_set_bit(sig, last_bit, bit_value);
++    }
++
+     lua_pushboolean(L, 1);
+     return 1;
+   } else {
+@@ -442,7 +454,7 @@ parse x509_req object as table
+ static int openssl_csr_parse(lua_State *L)
+ {
+   X509_REQ  *csr = CHECK_OBJECT(1, X509_REQ, "openssl.x509_req");
+-  X509_NAME *subject = X509_REQ_get_subject_name(csr);
++  const X509_NAME *subject = X509_REQ_get_subject_name(csr);
+   STACK_OF(X509_EXTENSION) *exts = X509_REQ_get_extensions(csr);
+ 
+   lua_newtable(L);
+@@ -457,7 +469,7 @@ static int openssl_csr_parse(lua_State *L)
+       PUSH_OBJECT(alg, "openssl.x509_algor");
+       lua_setfield(L, -2, "sig_alg");
+     }
+-    if (sig->length) {
++    if (sig) {
+       openssl_push_asn1(L, sig, V_ASN1_BIT_STRING);
+       lua_setfield(L, -2, "signature");
+     }
+@@ -585,7 +597,7 @@ static int openssl_csr_subject(lua_State *L)
+   int       ret = 0;
+ 
+   if (lua_isnone(L, 2)) {
+-    X509_NAME *xn = X509_REQ_get_subject_name(csr);
++    const X509_NAME *xn = X509_REQ_get_subject_name(csr);
+     if (xn) {
+       openssl_push_xname_asobject(L, xn);
+       ret = 1;
+diff --git a/deps/lua-openssl/src/openssl.c b/deps/lua-openssl/src/openssl.c
+index 42004449..985b342b 100644
+--- a/deps/lua-openssl/src/openssl.c
++++ b/deps/lua-openssl/src/openssl.c
+@@ -544,7 +544,9 @@ openssl_initialize()
+             sizeof(LOPENSSL_VERSION LUA_VERSION OPENSSL_VERSION_TEXT));
+ #else
+   OPENSSL_init_ssl(OPENSSL_INIT_ENGINE_ALL_BUILTIN |
++#if defined (OPENSSL_INIT_ENGINE_OPENSSL)
+                    OPENSSL_INIT_ENGINE_OPENSSL |
++#endif
+                    OPENSSL_INIT_LOAD_CRYPTO_STRINGS |
+                    OPENSSL_INIT_LOAD_SSL_STRINGS |
+                    OPENSSL_INIT_ADD_ALL_CIPHERS |
+diff --git a/deps/lua-openssl/src/private.h b/deps/lua-openssl/src/private.h
+index c6010209..00728c6a 100644
+--- a/deps/lua-openssl/src/private.h
++++ b/deps/lua-openssl/src/private.h
+@@ -332,7 +332,7 @@ int openssl_push_x509_signature(lua_State *L, const X509_ALGOR *alg, const ASN1_
+ #define PUSH_ASN1_OCTET_STRING(L, s)      openssl_push_asn1(L, (ASN1_STRING*)(s),  V_ASN1_OCTET_STRING)
+ #define PUSH_ASN1_STRING(L, s)            openssl_push_asn1(L, (ASN1_STRING*)(s),  V_ASN1_UNDEF)
+ 
+-int openssl_push_xname_asobject(lua_State*L, X509_NAME* xname);
++int openssl_push_xname_asobject(lua_State*L, const X509_NAME* xname);
+ int openssl_push_bit_string_bitname(lua_State* L, const BIT_STRING_BITNAME* name);
+ 
+ ASN1_OBJECT* openssl_get_asn1object(lua_State*L, int idx, int retnil);
+diff --git a/deps/lua-openssl/src/ssl.c b/deps/lua-openssl/src/ssl.c
+index a71d71fd..9a8598fd 100644
+--- a/deps/lua-openssl/src/ssl.c
++++ b/deps/lua-openssl/src/ssl.c
+@@ -158,7 +158,7 @@ openssl_ssl_ctx_new(lua_State *L)
+     method = TLSv1_client_method();
+ #endif
+ 
+-#ifndef OPENSSL_NO_SSL3_METHOD
++#if OPENSSL_VERSION_NUMBER < 0x40000000L && !defined(OPENSSL_NO_SSL3_METHOD)
+   else if (strcmp(meth, "SSLv3") == 0)
+     method = SSLv3_method();
+   else if (strcmp(meth, "SSLv3_server") == 0)
+diff --git a/deps/lua-openssl/src/x509.c b/deps/lua-openssl/src/x509.c
+index 99096090..4dcc960e 100644
+--- a/deps/lua-openssl/src/x509.c
++++ b/deps/lua-openssl/src/x509.c
+@@ -466,7 +466,7 @@ int openssl_push_x509_signature(lua_State *L, const X509_ALGOR *alg, const ASN1_
+   if (sig != NULL)
+   {
+     lua_pushliteral(L, "sig");
+-    lua_pushlstring(L, (const char *)sig->data, sig->length);
++    lua_pushlstring(L, ASN1_STRING_get0_data(sig), ASN1_STRING_length(sig));
+     lua_rawset(L, i==0 ? -3 : i);
+   }
+ 
+diff --git a/deps/lua-openssl/src/xalgor.c b/deps/lua-openssl/src/xalgor.c
+index 95957b6f..2d7c5668 100644
+--- a/deps/lua-openssl/src/xalgor.c
++++ b/deps/lua-openssl/src/xalgor.c
+@@ -151,7 +151,7 @@ openssl_xalgor_set(lua_State *L)
+   obj = OBJ_dup(obj);
+   if (val) {
+     val = ASN1_STRING_dup(val);
+-    ret = X509_ALGOR_set0(alg, obj, val->type, val);
++    ret = X509_ALGOR_set0(alg, obj, ASN1_STRING_type(val), val);
+   } else {
+     ret = X509_ALGOR_set0(alg, obj, 0, NULL);
+   }
+diff --git a/deps/lua-openssl/src/xname.c b/deps/lua-openssl/src/xname.c
+index f2fa9be6..ed5939df 100644
+--- a/deps/lua-openssl/src/xname.c
++++ b/deps/lua-openssl/src/xname.c
+@@ -10,7 +10,7 @@ x509.name module to mapping X509_NAME to lua object.
+ #include "sk.h"
+ 
+ int
+-openssl_push_xname_asobject(lua_State *L, X509_NAME *xname)
++openssl_push_xname_asobject(lua_State *L, const X509_NAME *xname)
+ {
+   const X509_NAME *dup = X509_NAME_dup(xname);
+   PUSH_OBJECT(dup, "openssl.x509_name");
+diff --git a/deps/lua-openssl/test/helper.lua b/deps/lua-openssl/test/helper.lua
+index ea64feb7..0634ea3c 100644
+--- a/deps/lua-openssl/test/helper.lua
++++ b/deps/lua-openssl/test/helper.lua
+@@ -6,7 +6,7 @@ local M = {}
+ M.luaopensslv, M.luav, M.opensslv = openssl.version()
+ M._luaopensslv, M._luav, M._opensslv = openssl.version(true)
+ M.libressl = M.opensslv:find("^LibreSSL")
+-M.openssl3 = M.opensslv:find("^OpenSSL 3")
++M.openssl3 = M.opensslv:find("^OpenSSL 3") or M.opensslv:find("^OpenSSL 4")
+ 
+ function M.sslProtocol(srv, protocol)
+   protocol = protocol or openssl.ssl.default
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
