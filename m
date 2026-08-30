Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0657C61DE1
	for <buildroot@archiver.kernel.org>; Sun, 30 Aug 2026 18:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51EF880C23;
	Sun, 30 Aug 2026 18:55:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aKeh7hA1hemf; Sun, 30 Aug 2026 18:55:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788116101;
	bh=sysW/AIivFTwdoI50GfLLxcH8cYZCzPn+3dB3J8bX/U=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qwcvA0WNAhj7kw9+YEzi+OAumXOaXKt6lXmU9I+hJLL7lofXQ+Lz8663ugP0+Wv/y
	 U+s7Bn6/FMO91BavJV5BlEvqBEkNkEPv6MZ1uhOLTa0LgdcIlSlgYiSyYFBYUdjFvE
	 TEMwmKS0pLYiOfgiLqC+BHjNn+bBRMIXbV06TLGjjARY/BAtKEeVsoc1AT0FPvc+lB
	 aCmaejQR5Ttb6xGylYl/n2yw5Oc22HtdzrTTKFi6Gy+qoVyg0L8CKJwiyMJ6FxzdVS
	 +mrEtU7JVRcfxRsQCYHgQmLXMmMNofDoiyI2bulm4wocAPzzkSk8qAlUGkwiHMUOnK
	 iv4vArihkMFVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5586680C9A;
	Sun, 30 Aug 2026 18:55:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 77556F2
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 18:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D23E40599
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 18:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYf495jniaoM for <buildroot@buildroot.org>;
 Sun, 30 Aug 2026 18:54:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Zs4dB1ii
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03E7740593
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 18:54:58 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4953e04ef16so27136635e9.2
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 11:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788116096; x=1788720896; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=wmG6HewDdqfg3Ful58UpQDLe+JDY3FmDHqyrcSAyyDU=;
 b=Zs4dB1iiYOafqNfhH/XxhzCJxufP1Pg34SJQhc4plqyjpPUHbjMDOioiE2ccJ7inoP
 zP9IlV2GDQurGxUSEkYoBavEJ6xO7wN6A4VfwrRV+0sB3jIuP2DVjTQjkdArNjZ/Boi0
 P455J+f9NSiNJ6o5xADimV3QivCRgySxaA2XMhTVLhaxPo4BjTE507cTUff387kuwMSR
 wnrmKvioYxiib9XpHZk7g1RETREH+2bdkpQu2ETzaFDTaS109qdqojxY6rOu7NADLCe8
 NINEi6Rjf69e7rt4H5vOL4MmeRTV5hkEzRIwftRbJ94aO9YvZsuHeNVmf2vDvAfmi/Vs
 8JmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788116096; x=1788720896;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=wmG6HewDdqfg3Ful58UpQDLe+JDY3FmDHqyrcSAyyDU=;
 b=OhPGRuGXevVLYJn6nezEVKCSNizp+gcqgxwhFvNC2pJftKgrHQJlwQ4NyqWg3HqYK/
 3F7fal2sfcjzMJH4P97t16y13MEaOxt5FcuvRt8ho32mRjw1VboiYTXnmNU/yzsu8+mM
 tHzxbo/hfTRI/mziknhU9t5OjPcmJdqRE9042uWlGRF+kXlnwX1N8mfTIa8E+9dNtO8Y
 pC1p0uHd4zeu2W8uijqSD1lPgXfXkqDrXrZjtZjvo3Y65gAqJNsxjn8XHxTTDimK93oP
 8OUJWmoQHwBaN5KRQc+d+K7rWifYrUw+FuMMrKZHk/xY9A5cLBhOAnkTuMvSFK+V38zn
 n4kw==
X-Gm-Message-State: AFuF++nY4FWOfAsd+H/QfcBYsA6Xh07ye5m2YlsjgEE+Mjn39IhRGSG6
 W080Eaeao49sEg4zNqOSQgZZ00yMFSH8Riv1NJL8Aw5INhqiIUMVsf6B3s6AnQ==
X-Gm-Gg: AR+sD12Z1p1ddLb/VFCZkJop0G2f+cTbfGEpsJu0laJ2mCXTBabfJkEBP1usGBsUuvt
 23QxhxE0jVEUzK6RJLyLv2Er6fFGAeQbQKJAc/g10RJk4PDyTetIW0hS/S89UdlBqF0C3GO0iSM
 TKToEHdKBZv3dXM5lkBSdN6X7abLC915njUH0uunbqmiLNYyWtoC5+wgitAvdp/36Ip9CcDqaDT
 5K0BmydrS7U1xfRd6e7MsxiTfprrnJ5Ej8QAJoaJOA0LaG53IBAk8zS/zinZrZuSYOQpXKXPSVF
 iozSPatAi0bMAdocRqXh2JQSvYlbx5bO+a8D0F3NmYu8D3dlXHlRwZInY7zkv59GT3CbatynlQv
 vfFUfB89wBdtn5ffKT9x1zWeLWIWng1mRLSgsqacAZk8l89cHYHqf9Pf1IcTrryEUwRwhEKw/6b
 SHYufoEygxu2D4ePw5U4xVrAT5r24HXSx1xGJh1a3bnRH8dAuq9jkOZUttJHOm
X-Received: by 2002:a05:600c:3b20:b0:499:8704:242c with SMTP id
 5b1f17b1804b1-49b91bd78cdmr271538025e9.0.1788116096502; 
 Sun, 30 Aug 2026 11:54:56 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4dfdf00csm276021125e9.14.2026.08.30.11.54.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2026 11:54:55 -0700 (PDT)
From: =?utf-8?q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
Date: Sun, 30 Aug 2026 20:53:52 +0200
MIME-Version: 1.0
Message-Id: <20260830-alacritty-v1-1-a4965888e281@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC2MD3cScxOSizJKSSl2zRONki0Tj1JTUVHMloPqCotS0zAqwWdGxEH5
 xaVJWanIJyACl2loA1OOOhG0AAAA=
X-Change-ID: 20260830-alacritty-6a3c8a3edee7
To: buildroot@buildroot.org
Cc: 
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4806; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=uTvwL7iQggEoTj2dO9mBxwG2xDgl9y9qGdihIpyov8g=; 
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBqlHxFx99w0ZwBEgIDfWX5WwPuhwlTxsJlXT809
 51K6I70YxWJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCapR8RQAKCRDnIYpo1BLC
 tRqbD/4k5BNFzncRX1GyK+AHv7AEL2nILMH6rVEu63pHtxd5Dq3xaOz5RIsUQGTwfZ+4VL6S/Ht
 atr5fUzQTAvE9IcRFEsEBC4qvuBn5b7KTbAVN41m8cmWIlpdgkqrHdNKNNnrwiYJrSC75GFaSoY
 aqMHDt85LG2XnhEEovaNPRpOxYR7A+hHCx0IKMwF0XjZ7+eoZkMsRL/BquA5q15wfi5DrbxJoBW
 jCH8YumPvwrhtX1OvEsTT4Mi419jc/oplfcu4DONQSATFPFvREhW19EdX59O6NoVS6r5FWuA0zy
 jp86GCliPsjM7UZLzdaHgAqEl4sgvEyHT/jOUFCXVdjk1SOZBPBfmbjuWYTCSLCaL5HrbN4+LM/
 8+g3W23kGv39USSMBS2yzK65x9MhwdE6cRLWv5KwXQWTzFKTS6Kdf/syqPMC4Xkm76Yl+/hdBXB
 MTKH6a150n5a3P201gS0gXrHVnrUday2wBjLoPLGAKJPG6SuXWHm/kCdhcPeJ3jtMycEqyxUBG2
 s469NMX1GQ//BC0lCxsEAecKmRcK3dS9QC5NxyamaUGOTr4+i3IzfpEEFKxcIpmY1p4JUhCZmHw
 4V4N1R3QMizRxBqiW6CdP+EDBgMdij6W046nD63Ph/Uou0ucdOlquGzjgyj+bAoACh2YpDsJ+q4
 glYZhcEV0X+Uq/w==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
Subject: [Buildroot] [PATCH] package/alacritty: new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxhY3JpdHR5IGlzIGEgbW9kZXJuIHRlcm1pbmFsIGVtdWxhdG9yIHRoYXQgY29tZXMgd2l0aCBz
ZW5zaWJsZQpkZWZhdWx0cywgYnV0IGFsbG93cyBmb3IgZXh0ZW5zaXZlIGNvbmZpZ3VyYXRpb24u
ICBCeSBpbnRlZ3JhdGluZyB3aXRoCm90aGVyIGFwcGxpY2F0aW9ucywgcmF0aGVyIHRoYW4gcmVp
bXBsZW1lbnRpbmcgdGhlaXIgZnVuY3Rpb25hbGl0eSwgaXQKbWFuYWdlcyB0byBwcm92aWRlIGEg
ZmxleGlibGUgc2V0IG9mIGZlYXR1cmVzIHdpdGggaGlnaCBwZXJmb3JtYW5jZS4KCkFsdGhvdWdo
IHRoaXMgcHJvamVjdCB3b3JrcyBib3RoIG9uIFdheWxhbmQgYW5kIFgxMSwgaXQgaXMgZm9yIG5v
dyBvbmx5CmVuYWJsZWQgd2l0aCBXYXlsYW5kIHN1cHBvcnQuCgpQcm9qZWN0IG1haW5wYWdlOiBo
dHRwczovL2dpdGh1Yi5jb20vYWxhY3JpdHR5L2FsYWNyaXR0eQoKU2lnbmVkLW9mZi1ieTogUmFw
aGHDq2wgR2FsbGFpcy1Qb3UgPHJnYWxsYWlzcG91QGdtYWlsLmNvbT4KLS0tCiBERVZFTE9QRVJT
ICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsrKwogcGFja2FnZS9Db25maWcuaW4gICAgICAg
ICAgICAgICAgfCAgMSArCiBwYWNrYWdlL2FsYWNyaXR0eS9Db25maWcuaW4gICAgICB8IDIwICsr
KysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL2FsYWNyaXR0eS9hbGFjcml0dHkuaGFzaCB8ICA0
ICsrKysKIHBhY2thZ2UvYWxhY3JpdHR5L2FsYWNyaXR0eS5tayAgIHwgMzMgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCA1MzEwNGNjNjBiNTQu
LmY2N2EwZGRlMDI1MCAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBA
IC0yODMxLDYgKzI4MzEsOSBAQCBGOglwYWNrYWdlL3B5dGhvbi1weXF0NS1zaXAvCiBOOglSYW1v
biBGcmllZCA8cmZyaWVkLmRldkBnbWFpbC5jb20+CiBGOglwYWNrYWdlL2JpdHdpc2UvCiAKK046
CVJhcGhhw6tsIEdhbGxhaXMtUG91IDxyZ2FsbGFpc3BvdUBnbWFpbC5jb20+CitGOglwYWNrYWdl
L2FsYWNyaXR0eS8KKwogTjoJUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5k
LmJlPgogRjoJcGFja2FnZS9ndW1iby1wYXJzZXIvCiBGOglwYWNrYWdlL2piaWcyZGVjLwpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCA2MDU4
ODAwNjgyYjQuLmNkYThjOTczZjI5ZSAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4KKysr
IGIvcGFja2FnZS9Db25maWcuaW4KQEAgLTMwNCw2ICszMDQsNyBAQCBlbmRtZW51CiBtZW51ICJH
cmFwaGljIGxpYnJhcmllcyBhbmQgYXBwbGljYXRpb25zIChncmFwaGljL3RleHQpIgogCiBjb21t
ZW50ICJHcmFwaGljIGFwcGxpY2F0aW9ucyIKKwlzb3VyY2UgInBhY2thZ2UvYWxhY3JpdHR5L0Nv
bmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvY2FnZS9Db25maWcuaW4iCiAJc291cmNlICJwYWNr
YWdlL2NvZy9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL2RybS1pbmZvL0NvbmZpZy5pbiIK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvYWxhY3JpdHR5L0NvbmZpZy5pbiBiL3BhY2thZ2UvYWxhY3Jp
dHR5L0NvbmZpZy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmY4
Zjc3MTYxNjNmYgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvYWxhY3JpdHR5L0NvbmZpZy5p
bgpAQCAtMCwwICsxLDIwIEBACitjb25maWcgQlIyX1BBQ0tBR0VfQUxBQ1JJVFRZCisJYm9vbCAi
YWxhY3JpdHR5IgorCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRfQVJD
SF9TVVBQT1JUUworCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSEFTX1VERVYKKwlkZXBlbmRzIG9u
ICFCUjJfU1RBVElDX0xJQlMgIyB3YXlsYW5kCisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hB
U19USFJFQURTICMgd2F5bGFuZAorCXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDCisJc2Vs
ZWN0IEJSMl9QQUNLQUdFX1dBWUxBTkQKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfV0FZTEFORF9QUk9U
T0NPTFMKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCWEtCQ09NTU9OCisJc2VsZWN0IEJSMl9QQUNL
QUdFX0ZSRUVUWVBFCisJc2VsZWN0IEJSMl9QQUNLQUdFX0ZPTlRDT05GSUcKKwloZWxwCisJICBB
bGFjcml0dHkgaXMgYSBtb2Rlcm4gdGVybWluYWwgZW11bGF0b3IgdGhhdCBjb21lcyB3aXRoCisJ
ICBzZW5zaWJsZSBkZWZhdWx0cywgYnV0IGFsbG93cyBmb3IgZXh0ZW5zaXZlIGNvbmZpZ3VyYXRp
b24uCisJICBCeSBpbnRlZ3JhdGluZyB3aXRoIG90aGVyIGFwcGxpY2F0aW9ucywgcmF0aGVyIHRo
YW4KKwkgIHJlaW1wbGVtZW50aW5nIHRoZWlyIGZ1bmN0aW9uYWxpdHksIGl0IG1hbmFnZXMgdG8g
cHJvdmlkZSBhCisJICBmbGV4aWJsZSBzZXQgb2YgZmVhdHVyZXMgd2l0aCBoaWdoIHBlcmZvcm1h
bmNlLgorCisJICBodHRwczovL2dpdGh1Yi5jb20vYWxhY3JpdHR5L2FsYWNyaXR0eS5naXQKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvYWxhY3JpdHR5L2FsYWNyaXR0eS5oYXNoIGIvcGFja2FnZS9hbGFj
cml0dHkvYWxhY3JpdHR5Lmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MDAwLi43NDY5ODA2OTViYWEKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2FsYWNyaXR0eS9h
bGFjcml0dHkuaGFzaApAQCAtMCwwICsxLDQgQEAKKyMgTG9jYWxseSBjb21wdXRlZAorc2hhMjU2
ICBjMTAxN2ExOTJkNjA2Yzk2OGU0NzFiODM2M2MyOWMyNTk4NDdiYjg0Yzk3MDAwNDRhNTIxODU2
ZWRkN2FiYTA3ICBhbGFjcml0dHktMC4xNy1jYXJnbzYudGFyLmd6CitzaGEyNTYgIDY1MTk5OTMx
OWMyN2U5MmZlOGVhZjc2NDUxZjE4MjM3MTA3MjMwYjI3Y2Q2ZDU4MGEwYWI5OWYxYzYyMmQxNjcg
IExJQ0VOU0UtQVBBQ0hFCitzaGEyNTYgIDU2NzVjYThhY2RkMjgwNjIyZjkzYzZmZjY0YzNhMjcx
NGQ5MzIyZGE0MzM3YzIwMjhkNGRiYjA0NzU2ODZmZjIgIExJQ0VOU0UtTUlUCmRpZmYgLS1naXQg
YS9wYWNrYWdlL2FsYWNyaXR0eS9hbGFjcml0dHkubWsgYi9wYWNrYWdlL2FsYWNyaXR0eS9hbGFj
cml0dHkubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi42NTY3NWE0
NTI0YTIKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2FsYWNyaXR0eS9hbGFjcml0dHkubWsK
QEAgLTAsMCArMSwzMyBAQAorIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgYWxhY3JpdHR5
CisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitBTEFDUklUVFlfVkVSU0lPTiA9IDAuMTcK
K0FMQUNSSVRUWV9TSVRFID0gJChjYWxsIGdpdGh1YixhbGFjcml0dHksYWxhY3JpdHR5LHYkKEFM
QUNSSVRUWV9WRVJTSU9OKSkKK0FMQUNSSVRUWV9MSUNFTlNFID0gQXBhY2hlLTIuMCwgTUlUCitB
TEFDUklUVFlfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UtQVBBQ0hFIExJQ0VOU0UtTUlUCitBTEFD
UklUVFlfREVQRU5ERU5DSUVTID0gd2F5bGFuZCB3YXlsYW5kLXByb3RvY29scyBsaWJ4a2Jjb21t
b24gZnJlZXR5cGUgZm9udGNvbmZpZworCitBTEFDUklUVFlfU1VCRElSID0gYWxhY3JpdHR5CitB
TEFDUklUVFlfQ0FSR09fQlVJTERfT1BUUyA9IC0tbm8tZGVmYXVsdC1mZWF0dXJlcyAtLWZlYXR1
cmVzPXdheWxhbmQKK0FMQUNSSVRUWV9DQVJHT19JTlNUQUxMX09QVFMgPSAtLW5vLWRlZmF1bHQt
ZmVhdHVyZXMgLS1mZWF0dXJlcz13YXlsYW5kCisKK2RlZmluZSBBTEFDUklUVFlfSU5TVEFMTF9B
RERJVElPTkFMX0ZJTEVTCisJIyBDcmVhdGUgZGVzdGluYXRpb24gZm9sZGVycyBpZiB0aGUgZG8g
bm90IGV4aXN0CisJJChJTlNUQUxMKSAtZCAtbSAwNzU1ICQoVEFSR0VUX0RJUikvdXNyL3NoYXJl
L2FwcGxpY2F0aW9ucworCSQoSU5TVEFMTCkgLWQgLW0gMDc1NSAkKFRBUkdFVF9ESVIpL3Vzci9z
aGFyZS9waXhtYXBzCisKKwkjIEluc3RhbGwgLmRlc2t0b3AgZmlsZQorCSQoSU5TVEFMTCkgLUQg
LW0gMDY0NCAkKEBEKS9leHRyYS9saW51eC9BbGFjcml0dHkuZGVza3RvcCBcCisJCSQoVEFSR0VU
X0RJUikvdXNyL3NoYXJlL2FwcGxpY2F0aW9ucy9BbGFjcml0dHkuZGVza3RvcAorCisJIyBJbnN0
YWxsIFNWRyBpY29uCisJJChJTlNUQUxMKSAtRCAtbSAwNjQ0ICQoQEQpL2V4dHJhL2xvZ28vYWxh
Y3JpdHR5LXRlcm0uc3ZnIFwKKwkJJChUQVJHRVRfRElSKS91c3Ivc2hhcmUvcGl4bWFwcy9BbGFj
cml0dHkuc3ZnCitlbmRlZgorCitBTEFDUklUVFlfUE9TVF9JTlNUQUxMX1RBUkdFVF9IT09LUyAr
PSBBTEFDUklUVFlfSU5TVEFMTF9BRERJVElPTkFMX0ZJTEVTCisKKyQoZXZhbCAkKGNhcmdvLXBh
Y2thZ2UpKQoKLS0tCmJhc2UtY29tbWl0OiBlMWVjOTM2Y2Y3MzJlNTBiZGRiNTg4OTg1YThkNjcz
OGI0M2RhM2FjCmNoYW5nZS1pZDogMjAyNjA4MzAtYWxhY3JpdHR5LTZhM2M4YTNlZGVlNwoKQmVz
dCByZWdhcmRzLAotLSAgClJhcGhhw6tsIEdhbGxhaXMtUG91IDxyZ2FsbGFpc3BvdUBnbWFpbC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
