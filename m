Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1586FC4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 20:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF453816F5;
	Sun, 27 Nov 2022 20:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF453816F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07gSRgDBmdZc; Sun, 27 Nov 2022 20:23:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D20C081355;
	Sun, 27 Nov 2022 20:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D20C081355
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 678391BF39F
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 20:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C450408A2
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 20:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C450408A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0yXM3e0JaZY for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 20:23:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5750D4035A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5750D4035A
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 20:23:54 +0000 (UTC)
Feedback-ID: 3578:1022:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1540900418; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 27 Nov 2022 20:23:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 15:23:19 -0500
Message-Id: <20221127202319.11124-1-wdouglass@carnegierobotics.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=V3DHcv54b8J4gBl+Ye5EGkd9scxJ6FwGrSh4NV8EnAxFulCN4F2kHjtXhRORi+gfduGV4Ya+Tusi6uoRaSuZEWnnypAhMt7OfOhXRAKB64RNX/E+mKiKJxgGrNwXzx/5W0fH5RmgMaNC9Fnum52UtIikHoHO3HYFJYD7BkOODzjmDzlFt57Tf6M1RKP5WmIS//yXbML4odk7LGU0P+dhaeGfFFYQ2Mx6yKyntaxzWkuvo+esgyklS+cB1wYO2dJwg+MlZzIzzdF5gfenpeMruwFB2zfEedqHaDcKeQFRf5Y+vkNTIkMzPhxhm1ENfPMqIYac8s0RR88fRBl3tdwWFA==;
 s=purelymail2; d=douglass.dev; v=1;
 bh=L8/jmXNKbJBEsZ3uE/j5D4syvtK8BQdDMJmGO3ShhOU=; h=Received:From:To:Subject; 
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=R9bTV1uCj4PKG1lzJ+Mj92bHmYOaRTGqYJJwGIHeIbsp7W82hPRw8rNa+dHQHQbB811dbhRxOIw8UdG8zqe9O1/t0wVLSnq/hEtz7pLNWOI9js81vnYrGbrMLrQOvRml1NBO+62baoWPQZexsCp2x392S8KfYh0T01egr1g6E2+Z1m2fvqSyCmpHIpg6MmaC1qtq0ZvGA5k370XWqEff4XR4ou8dzEtQ923s8FNKtqqe9Pg3mmwzkXZFHnOcya4ZEwy5u2p4VmKW9DhsX+UVFO6iYSHF2UyxMiAHYNxLaqsuREHcO38agftH3N8mEoLj6/CUJzGTmKsnk8ePKZhrNA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=L8/jmXNKbJBEsZ3uE/j5D4syvtK8BQdDMJmGO3ShhOU=;
 h=Feedback-ID:Received:From:To:Subject; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=douglass.dev
 header.i=@douglass.dev header.a=rsa-sha256 header.s=purelymail2
 header.b=V3DHcv54; 
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=R9bTV1uC
Subject: [Buildroot] [PATCH 1/1] package/libchicken: the chicken scheme
 programming environment
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
From: Woodrow Douglass via buildroot <buildroot@buildroot.org>
Reply-To: Woodrow Douglass <wdouglass@carnegierobotics.com>
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYWNrYWdlIGluY2x1ZGVzIHRoZSBydW50aW1lIGxpYnJhcnkgYW5kIGludGVycHJldGVy
LiBJbiB0aGUKZnV0dXJlIEkgcGxhbiBvbiBwYWNrYWdpbmcgYSBjcm9zcy1jb21waWxlciBmb3Ig
dGhlIGhvc3QgYXMgd2VsbAoKU2lnbmVkLW9mZi1ieTogV29vZHJvdyBEb3VnbGFzcyA8d2RvdWds
YXNzQGNhcm5lZ2llcm9ib3RpY3MuY29tPgotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDMgKysKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgIHwgIDEgKwog
cGFja2FnZS9saWJjaGlja2VuL0NvbmZpZy5pbiAgICAgfCAxMiArKysrKysKIHBhY2thZ2UvbGli
Y2hpY2tlbi9saWJjaGlja2VuLm1rIHwgNzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKIDQgZmlsZXMgY2hhbmdlZCwgODcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvbGliY2hpY2tlbi9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L2xpYmNoaWNrZW4vbGliY2hpY2tlbi5tawoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZF
TE9QRVJTCmluZGV4IDU2OWQ1ODQwN2EuLmZjZTg0ZDg0MzEgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BF
UlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMjk5OSw2ICsyOTk5LDkgQEAgRjoJcGFja2FnZS9weXRo
b24tcHl1c2IvCiBOOglXb2pjaWVjaCBOaXppxYRza2kgPG5pemlha0BzcG94Lm9yZz4KIEY6CXBh
Y2thZ2UvZnd1cC8KIAorTjoJV29vZHJvdyBEb3VnbGFzcyA8d2RvdWdsYXNzQGNhcm5lZ2llcm9i
b3RpY3MuY29tPgorRjoJcGFja2FnZS9saWJjaGlja2VuCisKIE46CVlhaXIgQmVuIEF2cmFoYW0g
PHlhaXJiYUBwcm90b25tYWlsLmNvbT4KIEY6CXBhY2thZ2UvY2FzeW5jLwogRjoJcGFja2FnZS9n
bG9veC8KZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4K
aW5kZXggYWVmODBmOWFiMC4uODA1NTExNjIxOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcu
aW4KKysrIGIvcGFja2FnZS9Db25maWcuaW4KQEAgLTYzNiw2ICs2MzYsNyBAQCBtZW51ICJJbnRl
cnByZXRlciBsYW5ndWFnZXMgYW5kIHNjcmlwdGluZyIKIAlzb3VyY2UgInBhY2thZ2UvNHRoL0Nv
bmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvZW5zY3JpcHQvQ29uZmlnLmluIgogCXNvdXJjZSAi
cGFja2FnZS9lcmxhbmcvQ29uZmlnLmluIgorCXNvdXJjZSAicGFja2FnZS9saWJjaGlja2VuL0Nv
bmZpZy5pbiIKIGlmIEJSMl9QQUNLQUdFX0VSTEFORwogbWVudSAiRXJsYW5nIGxpYnJhcmllcy9t
b2R1bGVzIgogCXNvdXJjZSAicGFja2FnZS9lcmxhbmctYmFzZTY0dXJsL0NvbmZpZy5pbiIKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbGliY2hpY2tlbi9Db25maWcuaW4gYi9wYWNrYWdlL2xpYmNoaWNr
ZW4vQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjE3MzIx
NWNiZWYKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2xpYmNoaWNrZW4vQ29uZmlnLmluCkBA
IC0wLDAgKzEsMTIgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9MSUJDSElDS0VOCisJYm9vbCAiY2hp
Y2tlbi1zY2hlbWUtcnVudGltZSIKKwlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VCisJaGVscAorCSAg
bGliY2hpY2tlbiBpcyB0aGUgcnVudGltZSBsaWJyYXJ5IGZvciBjaGlja2VuCisJICBzY2hlbWUu
IGh0dHBzOi8vY2FsbC1jYy5vcmcKKworY29uZmlnIEJSMl9MSUJDSElDS0VOX0lOU1RBTExfSU5U
RVJQUkVURVIKKyAgICAgICBib29sICJjaGlja2VuLXNjaGVtZS1pbnRlcnByZXRlciIKKyAgICAg
ICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xJQkNISUNLRU4KKyAgICAgICBoZWxwCisgICAgICAg
ICBjc2kgaXMgYW4gaW50ZXJwcmV0ZXIgZm9yIHRoZSBDaGlja2VuIFNjaGVtZSBkaWFsZWN0CmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2xpYmNoaWNrZW4vbGliY2hpY2tlbi5tayBiL3BhY2thZ2UvbGli
Y2hpY2tlbi9saWJjaGlja2VuLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAuLmE0MDI3MDZjNzMKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2xpYmNoaWNrZW4vbGli
Y2hpY2tlbi5tawpAQCAtMCwwICsxLDcxIEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIwor
IyBsaWJjaGlja2VuCisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitMSUJDSElDS0VOX1ZF
UlNJT04gPSA1LjMuMAorTElCQ0hJQ0tFTl9TSVRFID0gaHR0cHM6Ly9jb2RlLmNhbGwtY2Mub3Jn
L3JlbGVhc2VzLyQoTElCQ0hJQ0tFTl9WRVJTSU9OKQorTElCQ0hJQ0tFTl9TT1VSQ0UgPSBjaGlj
a2VuLSQoTElCQ0hJQ0tFTl9WRVJTSU9OKS50YXIuZ3oKK0xJQkNISUNLRU5fTElDRU5TRSA9IEJT
RAorTElCQ0hJQ0tFTl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQorTElCQ0hJQ0tFTl9JTlNUQUxM
X1NUQUdJTkcgPSBZRVMKK0xJQkNISUNLRU5fSU5TVEFMTF9UQVJHRVQgPSBZRVMKKworTElCQ0hJ
Q0tFTl9NQUtFX0FSR1VNRU5UUz1BUkNIPSBcCisJUFJFRklYPS91c3IgXAorCVBMQVRGT1JNPWxp
bnV4IFwKKwlDX0NPTVBJTEVSPSR7VEFSR0VUX0NDfSBcCisJQ1hYX0NPTVBJTEVSPSR7VEFSR0VU
X0NYWH0gXAorCUxJQlJBUklBTj0ke1RBUkdFVF9BUn0gXAorCURFU1RESVI9JChTVEFHSU5HX0RJ
UikKKworIyBNQUtFMSBpcyB1c2VkIGhlcmUgYmVjYXVzZSB0aGUgaW5zdGFsbCBzdGVwIHdpbGwg
ZmFpbCB3aXRob3V0IGl0LiBQZXJoYXBzIHRoaXMnbGwgYmUgZml4ZWQgdXBzdHJlYW0gc29tZWRh
eS4uLgorTElCQ0hJQ0tFTl9NQUtFID0gJChNQUtFMSkKKworaWZuZXEgKCQoQlIyX0FSQ0gpLHg4
NikKKwlMSUJDSElDS0VOX01BS0VfQVJHVU1FTlRTICs9IFRBUkdFVF9GRUFUVVJFUz0iLW5vLWZl
YXR1cmUgeDg2IC1mZWF0dXJlICR7QlIyX0FSQ0h9IgorZW5kaWYKKworaWZlcSAoJChCUjJfU1RB
VElDX0xJQlMpLHkpCisJTElCQ0hJQ0tFTl9NQUtFX0FSR1VNRU5UUyArPSBTVEFUSUNCVUlMRD0x
CitlbmRpZgorCisKK2RlZmluZSBMSUJDSElDS0VOX0JVSUxEX0NNRFMKKwkkKFRBUkdFVF9NQUtF
X0VOVikgJChMSUJDSElDS0VOX01BS0UpIC1DICQoQEQpICR7TElCQ0hJQ0tFTl9NQUtFX0FSR1VN
RU5UU30gYWxsCitlbmRlZgorCitkZWZpbmUgTElCQ0hJQ0tFTl9JTlNUQUxMX1NUQUdJTkdfQ01E
UworCSQoVEFSR0VUX01BS0VfRU5WKSAkKExJQkNISUNLRU5fTUFLRSkgLUMgJChARCkgJHtMSUJD
SElDS0VOX01BS0VfQVJHVU1FTlRTfSBpbnN0YWxsCitlbmRlZgorCitkZWZpbmUgTElCQ0hJQ0tF
Tl9JTlNUQUxMX1RBUkdFVF9MSUJTX0NNRFMKKwkkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChARCkv
bGliY2hpY2tlbi5zby4xMSAkKFRBUkdFVF9ESVIpL3Vzci9saWIKKwlsbiAtc3JUICQoVEFSR0VU
X0RJUikvdXNyL2xpYi9saWJjaGlja2VuLnNvLjExICQoVEFSR0VUX0RJUikvdXNyL2xpYi9saWJj
aGlja2VuLnNvCitlbmRlZgorCitkZWZpbmUgTElCQ0hJQ0tFTl9JTlNUQUxMX1RBUkdFVF9JTlRF
UlBSRVRFUl9DTURTCisJJChJTlNUQUxMKSAtRCAtbSAwNzU1ICQoQEQpL2NzaSAkKFRBUkdFVF9E
SVIpL3Vzci9iaW4KK2VuZGVmCisKK2lmZXEgKCQoQlIyX0xJQkNISUNLRU5fSU5TVEFMTF9JTlRF
UlBSRVRFUikseSkKK2lmbmVxICgkKEJSMl9TVEFUSUNfTElCUykseSkKK2RlZmluZSBMSUJDSElD
S0VOX0lOU1RBTExfVEFSR0VUX0NNRFMKKwkkKExJQkNISUNLRU5fSU5TVEFMTF9UQVJHRVRfTElC
U19DTURTKQorCSQoTElCQ0hJQ0tFTl9JTlNUQUxMX1RBUkdFVF9JTlRFUlBSRVRFUl9DTURTKQor
ZW5kZWYKK2Vsc2UKK2RlZmluZSBMSUJDSElDS0VOX0lOU1RBTExfVEFSR0VUX0NNRFMKKwkkKExJ
QkNISUNLRU5fSU5TVEFMTF9UQVJHRVRfSU5URVJQUkVURVJfQ01EUykKK2VuZGVmCitlbmRpZgor
ZWxzZQoraWZuZXEgKCQoQlIyX1NUQVRJQ19MSUJTKSx5KQorZGVmaW5lIExJQkNISUNLRU5fSU5T
VEFMTF9UQVJHRVRfQ01EUworCSQoTElCQ0hJQ0tFTl9JTlNUQUxMX1RBUkdFVF9MSUJTX0NNRFMp
CitlbmRlZgorZW5kaWYKK2VuZGlmCisKKyQoZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkpCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
