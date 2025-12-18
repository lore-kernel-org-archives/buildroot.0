Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5F1D711C8
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 23:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5698F6083B;
	Thu, 18 Dec 2025 23:46:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQNeQmLIF0uE; Thu, 18 Dec 2025 23:46:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6290E60A6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766101597;
	bh=uMiopQlPbxclEgNOtFeF/3dlCZtXUK0K7LaZfkeAnms=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pGkgO1FMH+1gcFJYKxc25pXEHqnBUpbQl7LIYwGS452XXjMmf9f6wOfR0Fdqv/ly5
	 QGte1N342Le+usM4yMfHVhgWLnEsswN3/bFMDaidyF0MO7k9URkxRBhpGg2CDfKSVY
	 hb1dzTbe1j6/qZa1xFxOcQ217ZbTT3xe2ZdouMG27VRBIhXD2kLmj8rghhOl/r/y6l
	 t3cDRkauks6VVrd6ibUUgWccih6Dvf1UQF1VhEkEYoiKqX1KWU8Cmb0vV3TByF383X
	 WOY06UynKApu+nnlLHLjAISBkRvSkU1FD0t3Ob40fKEYDcoMVKA4yDNUr+sXLO99rR
	 yKh99bAvwji5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6290E60A6C;
	Thu, 18 Dec 2025 23:46:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB6C2293
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 23:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C243940320
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 23:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hD-AEAvdq9rA for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 23:46:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 71E95402C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71E95402C5
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71E95402C5
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 23:46:34 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-477770019e4so9850225e9.3
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 15:46:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766101592; x=1766706392;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PqL5zJPLe9pgD0GKjBgHTBl0eu+nVitYa2dGUsSKG9c=;
 b=Oph/O4sZHCkmccY/rN+C1hfDhrTYf76DFOmi1DObCr2tfVhQXRRTJmWcJgTTQIwxD1
 r6druGJg/bIzlpwQvSxGd1T5ro2gJw03YtoRgQzwootthmhYPYoe6ogTnSBoO7atol8w
 8VMAZOy9sZqxgJZFpPh350ofC9+27Bh06Xy92PyArywbBMgNToYLkTNBUq+BcNZsJ4NC
 CN1JRm0bcOdJiVVrsnDEJr39tTicglbULsjUlaynIs3/pUlpWLx4adKwf+7op0qjx83i
 00540mKXt46GDIVttgpa93i+I209Ms+YFxt/cbAq0xNFpVf8/yPQkiR3iODMwFeNBtfr
 tnZQ==
X-Gm-Message-State: AOJu0YyPRnKXQMf8lOhd5WYk0BoR/1PnvpCxuZBMMOZSwC+osCMeZQN3
 Tmh/XJq1wV/RpWnCrwytiUidJQgtMRTkQriHVeU7tpzuSktSbGFaqoDlGWx6ljMH
X-Gm-Gg: AY/fxX66wDER4T6C+iSxNyyKRPvZ8bEdAFW1n55VBXEB5NUbFoI+/3GC4EGt97/KaIf
 2AxzuB7Vk+AwjEZWyVEihJtFMAmA89L0jaAkTtz2fpilwB/HQPdi+Qm8oEJTNrYStVUIXoWxsSF
 NfMK8aPm48UZ91tt2tv1Griegweo/uZoJPnv7yyknMeuujnnT24vSI67XpkqQn0Ff7SfA708MqS
 w6d1jS3h7dd6zhfcmoczCSGjeeFqYZ5ncbXNgRlLHxzz8dGMqiNcplCGbEYTpnLZ+aMtP+X02/y
 ikmrZkptVUukQ+9YjiDD8xOSAP2d0cPQqBhzreDn+UwdDURYMcC7oojT0wG04LYPF9Sjz0WWmvZ
 nQEiBeHg+EvKxJB2B7ciPpgYRo3LOUMEmfxr6aD3R0L4yn5HWp3J+QwKLAHGjuE29pfMvklrHjm
 v9L+Pk2EfPesAaiFKCP8fX0K34s2kyfBKxS9wh3SWNWAmHjEQmQxmWAP1OM9NRWJCD7pudQK1Tw
 6yXgGG2mzE4YE/mc3k1/A1awwcvRdJPNvFbZA==
X-Google-Smtp-Source: AGHT+IEXxsxNaxF3f0DOpqK6tZ8Wew+4L/J2rsvsqcc6p1Ij/1SHDw4HnbAFwsF7eHhang3zmlM4Xw==
X-Received: by 2002:a5d:5c89:0:b0:431:38f:8bc4 with SMTP id
 ffacd0b85a97d-4324e70d84emr1112329f8f.61.1766101591992; 
 Thu, 18 Dec 2025 15:46:31 -0800 (PST)
Received: from cuervo.intranet.jlsalvador.online
 (151.85-87-136.dynamic.clientes.euskaltel.es. [85.87.136.151])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa2bdfsm1703107f8f.32.2025.12.18.15.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 15:46:31 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Date: Fri, 19 Dec 2025 00:45:27 +0100
Message-ID: <20251218234526.3317029-2-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766101592; x=1766706392; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PqL5zJPLe9pgD0GKjBgHTBl0eu+nVitYa2dGUsSKG9c=;
 b=CjvcIA8q3Tmg1s4sNMMV3p1/ZLexVMZP38oxdHiMZ3vobtKF5VwJ20/Ky1ekGpVVQZ
 PES01f9Mhmi91bFOckIMppezyIz/9Zw8QaTz5ht65Fr2eMIf4BygvB8UqauDDy8gQHzB
 jeq/Btmx7j+1Db1HRhip6XDEwl+Q1n+yowXbVQVj31oGUM+RTwG/Q9SXdoZLUhH4/eih
 jBXLeHKZyiAzj2Vou/5hmft3flKFbQDJlkzyoIizw8XbabYpDEx3HWEVpC0WmBVq6N9/
 tSjygutEuDrD+n9N9MPOWXGXDXBIhWfZiERJOtqlecvijPSkWqYLn8vH2bUt+ijeR4E0
 nuCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CjvcIA8q
Subject: [Buildroot] [PATCH v2 1/1] package/zfs: bump version to 2.4.0
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

UmVtb3ZlZCBiYWNrcG9ydGVkIHBhdGNoOgogLSAwMDAxLXVzZS1zeXNfc3RhdGgtaW5zdGVhZC1v
Zi1saW51eF9zdGF0aC5wYXRjaApNZXJnZWQgdXBzdHJlYW0gaW46Cmh0dHBzOi8vZ2l0aHViLmNv
bS9vcGVuemZzL3pmcy9jb21taXQvY2NmNWE4YTZmY2ZkZmJkYWEyZjBmZGNhNWQ3ODc5NTgyMjRi
ZjA2ZAoKRm9yIHJlbGVhc2Ugbm90ZSwgc2VlOgpodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96
ZnMvcmVsZWFzZXMvdGFnL3pmcy0yLjQuMAoKU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2
YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIHYxIC0+
IHYyOgogIC0gZml4IHVwc3RyZWFtIGNvbW1pdCB1cmwKCiAuLi51c2Utc3lzX3N0YXRoLWluc3Rl
YWQtb2YtbGludXhfc3RhdGgucGF0Y2ggfCA4MiAtLS0tLS0tLS0tLS0tLS0tLS0tCiBwYWNrYWdl
L3pmcy96ZnMuaGFzaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLQogcGFja2FnZS96
ZnMvemZzLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIHN1cHBvcnQvdGVz
dGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5ICAgICB8ICAyICstCiA0IGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgODYgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQg
cGFja2FnZS96ZnMvMDAwMS11c2Utc3lzX3N0YXRoLWluc3RlYWQtb2YtbGludXhfc3RhdGgucGF0
Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3pmcy8wMDAxLXVzZS1zeXNfc3RhdGgtaW5zdGVhZC1v
Zi1saW51eF9zdGF0aC5wYXRjaCBiL3BhY2thZ2UvemZzLzAwMDEtdXNlLXN5c19zdGF0aC1pbnN0
ZWFkLW9mLWxpbnV4X3N0YXRoLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA1
ZTVkMjFlYzUyLi4wMDAwMDAwMDAwCi0tLSBhL3BhY2thZ2UvemZzLzAwMDEtdXNlLXN5c19zdGF0
aC1pbnN0ZWFkLW9mLWxpbnV4X3N0YXRoLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsODIgKzAs
MCBAQAotRnJvbSBjY2Y1YThhNmZjZmRmYmRhYTJmMGZkY2E1ZDc4Nzk1ODIyNGJmMDZkIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogY2xhc3NhYmJ5YW1wIDw1MzY2ODI4K2NsYXNzYWJi
eWFtcEB1c2Vycy5ub3JlcGx5LmdpdGh1Yi5jb20+Ci1EYXRlOiBXZWQsIDI3IEF1ZyAyMDI1IDE3
OjQyOjMyIC0wNDAwCi1TdWJqZWN0OiBbUEFUQ0hdIGxpbnV4OiB1c2Ugc3lzL3N0YXQuaCBpbnN0
ZWFkIG9mIGxpbnV4L3N0YXQuaAotCi1nbGliYyBpbmNsdWRlcyBsaW51eC9zdGF0LmggZm9yIHN0
YXR4LCBidXQgbXVzbCBkZWZpbmVzIGl0cyBvd24gc3RhdHgKLXN0cnVjdCBhbmQgYXNzb2NpYXRl
ZCBjb25zdGFudHMsIHdoaWNoIGRvZXMgbm90IGluY2x1ZGUgU1RBVFhfTU5UX0lECi15ZXQuIFRo
dXMsIGluY2x1ZGluZyBsaW51eC9zdGF0LmggZGlyZWN0bHkgc2hvdWxkIGJlIGF2b2lkZWQgZm9y
Ci1tYXhpbXVtIGxpYmMgY29tcGF0aWJpbGl0eS4KLQotVGVzdGVkIG9uOgotICAtIGdsaWJjOiB4
ODZfNjQsIGk2ODYsIGFhcmNoNjQsIGFybXY3bCwgYXJtdjZsCi0gIC0gbXVzbDogeDg2XzY0LCBh
YXJjaDY0LCBhcm12N2wsIGFybXY2bAotCi1SZXZpZXdlZC1ieTogQnJpYW4gQmVobGVuZG9yZiA8
YmVobGVuZG9yZjFAbGxubC5nb3Y+Ci1UZXN0ZWQtQnk6IEFjaGlsbCBHaWxnZW5hc3QgPGFjaGls
bEBhY2hpbGwub3JnPgotU2lnbmVkLW9mZi1ieTogY2xhc3NhYmJ5YW1wIDxkZXZAcGxhY2V2aW9s
ZXR0ZS5uZXQ+Ci1DbG9zZXMgIzE3Njc1Ci0KLVVwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20v
b3Blbnpmcy96ZnMvY29tbWl0L2NjZjVhOGE2ZmNmZGZiZGFhMmYwZmRjYTVkNzg3OTU4MjI0YmYw
NmQKLVNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9z
ZWx1aXNAZ21haWwuY29tPgotLS0tCi0gY29uZmlnL3VzZXItc3RhdHgubTQgICAgICAgICAgICAg
ICAgICAgfCA2ICsrKy0tLQotIGluY2x1ZGUvb3MvbGludXgvc3BsL3N5cy9zdGF0LmggICAgICAg
IHwgMiArLQotIGxpYi9saWJzcGwvaW5jbHVkZS9vcy9saW51eC9zeXMvc3RhdC5oIHwgMiArLQot
IDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQotCi1kaWZm
IC0tZ2l0IGEvY29uZmlnL3VzZXItc3RhdHgubTQgYi9jb25maWcvdXNlci1zdGF0eC5tNAotaW5k
ZXggMDMxNWY5M2UwYzIwLi4xYmE3NGE0MGU5YjggMTAwNjQ0Ci0tLS0gYS9jb25maWcvdXNlci1z
dGF0eC5tNAotKysrIGIvY29uZmlnL3VzZXItc3RhdHgubTQKLUBAIC0yLDcgKzIsNyBAQCBkbmwg
IwotIGRubCAjIENoZWNrIGZvciBzdGF0eCgpIGZ1bmN0aW9uIGFuZCBTVEFUWF9NTlRfSUQgYXZh
aWxhYmlsaXR5Ci0gZG5sICMKLSBBQ19ERUZVTihbWkZTX0FDX0NPTkZJR19VU0VSX1NUQVRYXSwg
WwotLQlBQ19DSEVDS19IRUFERVJTKFtsaW51eC9zdGF0LmhdLAotKwlBQ19DSEVDS19IRUFERVJT
KFtzeXMvc3RhdC5oXSwKLSAJCVtoYXZlX3N0YXRfaGVhZGVycz15ZXNdLAotIAkJW2hhdmVfc3Rh
dF9oZWFkZXJzPW5vXSkKLSAKLUBAIC0xNCw3ICsxNCw3IEBAIEFDX0RFRlVOKFtaRlNfQUNfQ09O
RklHX1VTRVJfU1RBVFhdLCBbCi0gCQkJQUNfTVNHX0NIRUNLSU5HKFtmb3IgU1RBVFhfTU5UX0lE
XSkKLSAJCQlBQ19DT01QSUxFX0lGRUxTRShbCi0gCQkJCUFDX0xBTkdfUFJPR1JBTShbWwotLQkJ
CQkJI2luY2x1ZGUgPGxpbnV4L3N0YXQuaD4KLSsJCQkJCSNpbmNsdWRlIDxzeXMvc3RhdC5oPgot
IAkJCQldXSwgW1sKLSAJCQkJCXN0cnVjdCBzdGF0eCBzdHg7Ci0gCQkJCQlpbnQgbWFzayA9IFNU
QVRYX01OVF9JRDsKLUBAIC0yOSw2ICsyOSw2IEBAIEFDX0RFRlVOKFtaRlNfQUNfQ09ORklHX1VT
RVJfU1RBVFhdLCBbCi0gCQkJXSkKLSAJCV0pCi0gCV0sIFsKLS0JCUFDX01TR19XQVJOKFtsaW51
eC9zdGF0Lmggbm90IGZvdW5kOyBza2lwcGluZyBzdGF0eCBzdXBwb3J0XSkKLSsJCUFDX01TR19X
QVJOKFtzeXMvc3RhdC5oIG5vdCBmb3VuZDsgc2tpcHBpbmcgc3RhdHggc3VwcG9ydF0pCi0gCV0p
Ci0gXSkgIGRubCBlbmQgQUNfREVGVU4KLWRpZmYgLS1naXQgYS9pbmNsdWRlL29zL2xpbnV4L3Nw
bC9zeXMvc3RhdC5oIGIvaW5jbHVkZS9vcy9saW51eC9zcGwvc3lzL3N0YXQuaAotaW5kZXggMDg3
Mzg5YjU3YjM0Li5hZDI4MTVlNDYzOTQgMTAwNjQ0Ci0tLS0gYS9pbmNsdWRlL29zL2xpbnV4L3Nw
bC9zeXMvc3RhdC5oCi0rKysgYi9pbmNsdWRlL29zL2xpbnV4L3NwbC9zeXMvc3RhdC5oCi1AQCAt
MjUsNiArMjUsNiBAQAotICNpZm5kZWYgX1NQTF9TVEFUX0gKLSAjZGVmaW5lCV9TUExfU1RBVF9I
Ci0gCi0tI2luY2x1ZGUgPGxpbnV4L3N0YXQuaD4KLSsjaW5jbHVkZSA8c3lzL3N0YXQuaD4KLSAK
LSAjZW5kaWYgLyogU1BMX1NUQVRfSCAqLwotZGlmZiAtLWdpdCBhL2xpYi9saWJzcGwvaW5jbHVk
ZS9vcy9saW51eC9zeXMvc3RhdC5oIGIvbGliL2xpYnNwbC9pbmNsdWRlL29zL2xpbnV4L3N5cy9z
dGF0LmgKLWluZGV4IGE2MDVhZjk2MmE2ZC4uMTNjYzBiNDZhYzkzIDEwMDY0NAotLS0tIGEvbGli
L2xpYnNwbC9pbmNsdWRlL29zL2xpbnV4L3N5cy9zdGF0LmgKLSsrKyBiL2xpYi9saWJzcGwvaW5j
bHVkZS9vcy9saW51eC9zeXMvc3RhdC5oCi1AQCAtMzMsNyArMzMsNyBAQAotIAotICNpZmRlZiBI
QVZFX1NUQVRYCi0gI2luY2x1ZGUgPGZjbnRsLmg+Ci0tI2luY2x1ZGUgPGxpbnV4L3N0YXQuaD4K
LSsjaW5jbHVkZSA8c3lzL3N0YXQuaD4KLSAjZW5kaWYKLSAKLSAvKgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS96ZnMvemZzLmhhc2ggYi9wYWNrYWdlL3pmcy96ZnMuaGFzaAppbmRleCA2ZWJjZmI3YTNk
Li44N2Y0ZTQ2MmYxIDEwMDY0NAotLS0gYS9wYWNrYWdlL3pmcy96ZnMuaGFzaAorKysgYi9wYWNr
YWdlL3pmcy96ZnMuaGFzaApAQCAtMSw1ICsxLDUgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1Yi5j
b20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLTIuMy41L3pmcy0yLjMuNS5zaGEy
NTYuYXNjCi1zaGEyNTYgIDMyNmFlMGNiYThhNjE1YWZhNDJjNjg5MTY0MGU3NmFjYzRiZDIzMGY2
ZDZkZGVjMTIwYzExZTMwYjEzOTIwNjcgIHpmcy0yLjMuNS50YXIuZ3oKKyMgRnJvbSBodHRwczov
L2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLTIuNC4wL3pmcy0y
LjQuMC5zaGEyNTYuYXNjCitzaGEyNTYgIDdiZGYxM2RlMGE3MWQ5NTU1NGMwZTNlNDdkNWU4ZjUw
Nzg2YzMwZDRmNGI2M2I3YzU5M2IxZDExYWY3NWM5ZWUgIHpmcy0yLjQuMC50YXIuZ3oKIAogIyBI
YXNoIGZvciBsaWNlbnNlIGZpbGVzOgogc2hhMjU2ICAxZmZiNzBjMzNjNGY3OWYwNGU5NDdmYWNj
NWM3ODUxZjI4OTYwOTI1NmFhY2I0N2ZjMTE1ZjcwMDQyN2Q5NTIwICBMSUNFTlNFCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL3pmcy96ZnMubWsgYi9wYWNrYWdlL3pmcy96ZnMubWsKaW5kZXggNzEyZjJh
ZmI1NC4uMzAyMDdmN2NmNyAxMDA2NDQKLS0tIGEvcGFja2FnZS96ZnMvemZzLm1rCisrKyBiL3Bh
Y2thZ2UvemZzL3pmcy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCiAKLVpGU19WRVJTSU9OID0gMi4zLjUKK1pGU19WRVJTSU9OID0gMi40LjAKIFpGU19TSVRF
ID0gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0k
KFpGU19WRVJTSU9OKQogWkZTX1NFTElOVVhfTU9EVUxFUyA9IHpmcwogWkZTX0xJQ0VOU0UgPSBD
RERMCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5w
eSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5CmluZGV4IDY5OGQ4
ZDhiYmQuLjM4NGZhZDdlMzMgMTAwNjQ0Ci0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3Rlc3RfemZzLnB5CisrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rf
emZzLnB5CkBAIC01Nyw3ICs1Nyw3IEBAIGNsYXNzIFRlc3RaZnNCYXNlKGluZnJhLmJhc2V0ZXN0
LkJSVGVzdCk6CiAgICAgICAgICAgICAic2hhMjU2c3VtIC1jIC90bXAvdXJhbmRvbS5zaGEyNTYi
LAogICAgICAgICAgICAgInpwb29sIHN0YXR1cyAtdiIsCiAgICAgICAgICAgICAjIENoZWNrIFB5
WkZTCi0gICAgICAgICAgICAiYXJjX3N1bW1hcnkiLAorICAgICAgICAgICAgInphcmNzdW1tYXJ5
IiwKICAgICAgICAgXQogICAgICAgICBmb3IgY21kIGluIGNtZHM6CiAgICAgICAgICAgICBzZWxm
LmFzc2VydFJ1bk9rKGNtZCwgdGltZW91dD1zZWxmLnRpbWVvdXQpCi0tIAoyLjUyLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
