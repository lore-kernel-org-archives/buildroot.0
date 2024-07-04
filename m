Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F7DC30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 18:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CF8D81E9E;
	Thu,  4 Jul 2024 18:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLdsQJCzYxWl; Thu,  4 Jul 2024 18:05:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1778081E7D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1778081E7D;
	Thu,  4 Jul 2024 18:05:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A2951BF2B4
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 18:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87F306072C
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 18:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_Ml83gBLn9K for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 18:05:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C6BD86071E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6BD86071E
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6BD86071E
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 18:05:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqaxO-1s3HMk1h0C-00o9vm; Thu, 04
 Jul 2024 20:05:18 +0200
Date: Thu, 04 Jul 2024 20:05:09 +0200
MIME-Version: 1.0
Message-Id: <20240704-ztext-v3-1-9195d06c8bd0@gmx.net>
X-B4-Tracking: v=1; b=H4sIAFTkhmYC/0WMyw6CMBBFf4V0bU07UB6u/A/jogxT6EIwbdOgh
 H+3EJXlubnnLMyTs+TZJVuYo2i9ncYE+SljOOixJ267xAwEFKKQFX8HmgNXGrHVbSlRaJa+T0f
 Gznvndk88WB8m99qzUW7rr9B8C1FyyXXdKQQ0aFR17R/zeaTANj/C4Sj4O8AFr6GplcjByLI5n
 HVdP6JxFC/MAAAA
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720116317; l=2797;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=2teK1weUekvf5alWzdGl7NYSR3Gdt9A+QiVIpG6uKAY=;
 b=xnE/3JTSYNeAl8Say5RnGH9+aNMs677nF63NrFnfXWOdSXZx5XiEMRfHj7wF0KalFGvcriSX+
 2chOTEUfg6ID6XrFjapKj73Ki5p6UfjkqYWRAAZ1oV9WaM8KQw7gHrG
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:imAQNowiW0ii1jZR80ovw6+iuimHNnHEZHFyvB0lpMX1T/IMBdE
 FLOzaLFnWRTrmTXg1Iml1vWRu10saEB4NW/z9q78APBhbmFuVW0c22tg4xleO3k/NjJAXzU
 tgQYO9Lo29AvX1+CWN1znt1fK6xJbK7ucvCiq/ZJCnbTLdC3JpHakyBYcv1Wu/zSUym/Rau
 7EBOHGgeNB8SwbxvkkPWw==
UI-OutboundReport: notjunk:1;M01:P0:1pnQMQw80vE=;WXKJkqdpizm04q56yjTEKrGxF0N
 7vBhjFaCxTAa1IXLvVaipNSN9/XoexgdGPjP3zCNuegr4ymWy1KM55tY5pmRr4CI7LfNg4ekn
 TFsldGsLAHjBY84pJZUkDzJdJX22zy0iU/rrfyMD1WburEz9FLHvuT6GUaOpaTsr7SfQx6fZl
 avWXX1Yn5aytHg7CW/nZcQ2RxKE0j0Kt2utr2BMCA4dg1S/ooTl/D2daScreKuuIncT5tU5SC
 5WF6+4pZDBsu7iCGTuMecF7WRJ9N1TaIAzObx/14xOLaQMwQMiGwikNV58JRvZO53g4RxHLVB
 D/d+pw0X8LEE34Iq9HuWfZguOWz/FtQX/MTG4Hk66qlv2yCo0jfYfhBAbiytwrwO4lKDpeZ+R
 TdWEbB17/Qv+EjC8wOaYX20QDapiELmbx/NFkqLz/aJcJRVwE1Ov4hNQf1GF80dFHChb7skwL
 AMIGNOpsT9k+SGmkKhbZVB4oCdn6bnKNPQ/f7QsLlX2IKCTHtxDmScmosb0kHO2AHEc3DjkPP
 d1ZfUHUkYbWPnfHbDZ+qtbrtIzpCM+DGPojyu7eyeXRaEVA2gcyH9bKNhGDChewaucOKPsEhV
 YKeeVDFKYWjlfv0ETgjnAn/vKBTN1z5GrlJ7ApxqYmlQftNNUmOBkeXSA27GBv1w9xkB4DHJp
 vdEwiC6FZGdx6GvQykM2q4V+PyeILwpKHl2auViRBBsBuNl244M7wS1X7max1BLjtB0kc4xcB
 +WE8k0pLG3oR6P96/kjVyMR7PNa626dNNzAyOiijLvuXdGYx5aVFLl2od1GU/e9zb3gFuUwxS
 dA6gxMRD4xc92rLYFqZSt5LLUCDGhbCGQUsWw6df2Bd5g=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720116318; x=1720721118; i=j.neuschaefer@gmx.net;
 bh=4iMNAUiBkGgcJ/m77FgXILUbn5fZrc2e+Zs9rVNWNNE=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Ih0mqGiKsxchuhK5Am/UNL/cOBF2sTD/NZQdTjrESU2yDsKDcgTgkRVwaRHATxi8
 dzTsSw08mAuyFuKv+EUD6WvSBy3OvJxoWT432XRwjwE8uiaciKkwYvON22qxVc42n
 Y5Oyu70y6RNkPV2SVJTNXQc+qTeWrx2H+Je1Jtbibsxa+/zSC0KNx9ftzAaRNRPY/
 uJJIavW4uIAYelcgMF89GqXBhn0JVy6qeylTjqRiAuOqnIOUmG0uyjHFYfGfuWOHd
 ggY86Go071pt874eKi2QsprTcQFNPUaHeQfWvv0t58OgFFoIv2iKMhRomsBnwhBAn
 m3tKHf6qvkDp0Rmo9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Ih0mqGiK
Subject: [Buildroot] [PATCH v3] Config.in: ban textrels on musl toolchains
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bXVzbC1saWJjIGRvZXNuJ3Qgc3VwcG9ydCBURVhUUkVMc1sxXSBhbmQgcHJvZ3JhbXMgd2l0aCBU
RVhUUkVMcyB3aWxsCmNyYXNoIG9uIHN0YXJ0LXVwIHVuZGVyIG11c2wuCgpUaGlzIHBhdGNoIGZv
cmJpZHMgdGhlIHVzZSBvZiBURVhUUkVMcyBvbiBtdXNsLCBidXQgYWRkcyBhbiBvcHRpb24gdG8K
ZWl0aGVyIGZvcmJpZCB0aGVtIG9uIG90aGVyIGxpYmNzIGFzIHdlbGwsIG9yIGFsbG93IHRoZW0g
b24gbXVzbC4KClsxXTogaHR0cHM6Ly93d3cub3BlbndhbGwuY29tL2xpc3RzL211c2wvMjAyMC8w
OS8yNS80CgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgu
bmV0PgotLS0KQ2hhbmdlcyBpbiB2MzoKLSBkcm9wIG1pY3JvcHl0aG9uIHBhdGNoIChhbHJlYWR5
IG1lcmdlZCkKLSByZXdyaXRlIHRvIHBvc2l0aXZlIGxvZ2ljLCBhcyBzdWdnZXN0ZWQgYnkgWWFu
biBFLiBNT1JJTgotIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA1
MjktenRleHQtdjItMC04Mjk4NTAzMmYxNjlAZ214Lm5ldAoKQ2hhbmdlcyBpbiB2MjoKLSBTbGln
aHRseSBkaWZmZXJlbnQgd29yZGluZwotIEVuYWJsZSB0aGUgb3B0aW9uIGJ5IGRlZmF1bHQgb24g
bXVzbCB0b29sY2hhaW5zCi0gQWRkIHBhdGNoIHRvIGZpeCBidWlsZCBvZiBtaWNyb3B5dGhvbgoK
TGluayB0byB2MToKLSBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNDE5LXp0ZXh0LXYx
LTEtYThkNWMyY2ZjZjU3QGdteC5uZXQKLS0tCgpJJ20gbm90IHN1cmUgYWJvdXQgdGhlIEtjb25m
aWcgaGVscCB0ZXh0IGZvciBCUjJfTElOS19BTExPV19URVhUUkVMLgpQZXJoYXBzIGl0IGNvdWxk
IGJlIHdyaXR0ZW4gYSBsaXR0bGUgbmljZXIuCgoKdjM6Ci0gcmV3cml0ZSB0byBwb3NpdGl2ZSBs
b2dpYywgYXMgc3VnZ2VzdGVkIGJ5IFlhbm4gRS4gTU9SSU4KLSBhZGp1c3QgdGhlIG5hbWUgYW5k
IGhlbHAgdGV4dCBhY2NvcmRpbmdseQoKdjI6Ci0gc2xpZ2h0bHkgZGlmZmVyZW50IHdvcmRpbmcK
LSBkZWZhdWx0IHRvIHllcyBvbiBtdXNsIHRvb2xjaGFpbnMKLSBmaXggY2hlY2stcGFja2FnZSB3
YXJuaW5ncwotIGRlcGVuZHMgb24gQlIyX1NIQVJFRF9MSUJTIC0+IGRlcGVuZHMgb24gIUJSMl9T
VEFUSUNfTElCUwotLS0KIENvbmZpZy5pbiAgICAgICAgICAgfCAxNCArKysrKysrKysrKysrKwog
cGFja2FnZS9NYWtlZmlsZS5pbiB8ICA0ICsrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL0NvbmZpZy5pbiBiL0NvbmZpZy5pbgppbmRleCBiZGY1ZmE4
NjQ3Li5jOGI1MmMwZDc0IDEwMDY0NAotLS0gYS9Db25maWcuaW4KKysrIGIvQ29uZmlnLmluCkBA
IC05MTAsNiArOTEwLDIwIEBAIGVuZGNob2ljZQogY29tbWVudCAiUkVMb2NhdGlvbiBSZWFkIE9u
bHkgKFJFTFJPKSBuZWVkcyBzaGFyZWQgbGlicmFyaWVzIgogCWRlcGVuZHMgb24gIUJSMl9TSEFS
RURfTElCUwoKK2NvbmZpZyBCUjJfTElOS19BTExPV19URVhUUkVMCisJYm9vbCAiQWxsb3cgdGV4
dCBzZWN0aW9uIHJlbG9jYXRpb25zIChURVhUUkVMcykiCisJZGVmYXVsdCB5ICAjIExlZ2FjeQor
CWRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fVVNFU19NVVNMCisJZGVwZW5kcyBvbiAhQlIyX1NU
QVRJQ19MSUJTCisJaGVscAorCSAgRW5hYmxlIHRoaXMgb3B0aW9uIHRvIGFsbG93IFRFWFRSRUxz
LiBPdGhlcndpc2UgIi16IHRleHQiIHdpbGwgYmUKKwkgIHBhc3NlZCB0byB0aGUgbGlua2VyIHRv
IGRldGVjdCB0aGVtIGFuZCB0aHJvdyBhbiBlcnJvciBpZiB0aGV5IG9jY3VyLgorCisJICBURVhU
UkVMcyBhcmUgbm90IHN1cHBvcnRlZCBvbiBtdXNsLWxpYmMncyBkeW5hbWljIGxvYWRlciBhbmQg
d2lsbAorCSAgcmVzdWx0IGluIGEgcnVuLXRpbWUgY3Jhc2g6CisKKwkgICAgaHR0cHM6Ly93d3cu
b3BlbndhbGwuY29tL2xpc3RzL211c2wvMjAyMC8wOS8yNS80CisKIGNvbmZpZyBCUjJfRk9SVElG
WV9TT1VSQ0VfQVJDSF9TVVBQT1JUUwogCWJvb2wKIAlkZWZhdWx0IHkKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvTWFrZWZpbGUuaW4gYi9wYWNrYWdlL01ha2VmaWxlLmluCmluZGV4IDU0NzYyMzRjN2Uu
LjNmMWExZDNhMzUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvTWFrZWZpbGUuaW4KKysrIGIvcGFja2Fn
ZS9NYWtlZmlsZS5pbgpAQCAtMTQ5LDYgKzE0OSwxMCBAQCBlbmRpZgoKIFRBUkdFVF9MREZMQUdT
ID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfTERGTEFHUykpCgoraWZlcSAoJChCUjJfTElO
S19BTExPV19URVhUUkVMKSwpCitUQVJHRVRfTERGTEFHUyArPSAteiB0ZXh0CitlbmRpZgorCiAj
IEJ5IGRlc2lnbiwgX0ZPUlRJRllfU09VUkNFIHJlcXVpcmVzIGdjYyBvcHRpbWl6YXRpb24gdG8g
YmUgZW5hYmxlZC4KICMgVGhlcmVmb3JlLCB3ZSBuZWVkIHRvIHBhc3MgX0ZPUlRJRllfU09VUkNF
IGFuZCB0aGUgb3B0aW1pemF0aW9uIGxldmVsCiAjIHRocm91Z2ggdGhlIHNhbWUgbWVjaGFuaXNt
LCBpLmUgY3VycmVudGx5IHRocm91Z2ggQ0ZMQUdTLiBQYXNzaW5nCgotLS0KYmFzZS1jb21taXQ6
IDNlYmM3YzY5ZDU2NDMwYzM0ZWJhNGM4NjlkMWQ0ZmU0ZDFlOGRlNTUKY2hhbmdlLWlkOiAyMDI0
MDQxNy16dGV4dC01YWNjYmFiNjFjMGEKCkJlc3QgcmVnYXJkcywKLS0KSi4gTmV1c2Now6RmZXIg
PGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
