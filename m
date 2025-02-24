Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5427DC021A4
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 14:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC10D40582;
	Mon, 24 Feb 2025 14:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1MhJAngZFUm5; Mon, 24 Feb 2025 14:25:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A93DC4091D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A93DC4091D;
	Mon, 24 Feb 2025 14:25:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48122920
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 14:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4267380D14
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 14:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDqcK2e1I_gi for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 14:25:13 +0000 (UTC)
X-Greylist: delayed 3898 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 24 Feb 2025 14:25:12 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 379A180D0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 379A180D0D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:7:10::190b;
 helo=smtp-190b.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
Received: from smtp-190b.mail.infomaniak.ch (smtp-190b.mail.infomaniak.ch
 [IPv6:2001:1600:7:10::190b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 379A180D0D
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 14:25:12 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch
 [10.7.10.108])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Z1h1P3Q05zLH1;
 Mon, 24 Feb 2025 14:10:33 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4Z1h1N7058zBrg; Mon, 24 Feb 2025 14:10:32 +0100 (CET)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Mon, 24 Feb 2025 14:10:18 +0100
MIME-Version: 1.0
Message-Id: <20250224-libwebsockets-zlib-opt-v1-1-16419ae3e82b@cherry.de>
X-B4-Tracking: v=1; b=H4sIALlvvGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMT3ZzMpPLUpOL85OzUkmLdKiBXN7+gRNfU2MjUxCTNwsAw1UAJqLm
 gKDUtswJscLRSkJuzUmxtLQBIE4TWbQAAAA==
X-Change-ID: 20250224-libwebsockets-zlib-opt-532544f801e0
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH RFC] package/libwebsockets: make zlib dependency
 optional
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
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Gregory Dymarek <gregd72002@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogUXVlbnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT4KCnpsaWIgaXMg
YSBkZXBlbmRlbmN5IG9mIGV4dGVuc2lvbnMgYW5kIEhUVFAgc3RyZWFtIGNvbXByZXNzaW9uIGZl
YXR1cmVzLgpUaGUgbGF0dGVyIGlzIGRpc2FibGVkIGJ5IGRlZmF1bHQgaW4gQ01ha2UgaW4gdGhl
IHByb2plY3QuIFRoZSBzYW1lIGNhbgpiZSBzYWlkIG9mIHRoZSBmb3JtZXIgYnV0IEJ1aWxkcm9v
dCBjdXJyZW50bHkgZW5hYmxlcyBpdAp1bmNvbmRpdGlvbmFsbHksIG1ha2luZyB0aGUgemxpYiBk
ZXBlbmRlbmN5IGEgcmVxdWlyZW1lbnQuCgpJbnN0ZWFkLCBsZXQncyBtYWtlIGV4dGVuc2lvbnMg
ZGVwZW5kZW50IG9uIHRoZSBwcmVzZW5jZSBvZiB6bGliLAphbGxvd2luZyB6bGliIChhbmQgdGh1
cyBleHRlbnNpb25zKSB0byBub3QgYmUgaW5zdGFsbGVkLgoKVGhpcyBkb2VzIGRpc2FibGUgZXh0
ZW5zaW9ucyBieSBkZWZhdWx0IG5vdywgZHVlIHRvIHRoZSByZW1vdmFsIG9mIHRoZQpzZWxlY3Qg
QlIyX1BBQ0tBR0VfWkxJQiBmb3IgQlIyX1BBQ0tBR0VfTElCV0VCU09DS0VUUy4gVGhlIHBhY2th
Z2VzCmN1cnJlbnRseSBhbmQgZGlyZWN0bHkgZGVwZW5kaW5nIG9uIGxpYndlYnNvY2tldHMgYXJl
IHR0eWQsIHN3dXBkYXRlLAptb3NxdWl0dG8sIGtpc21ldCwgamFudXMtZ2F0ZXdheSwgZ3RraW9z
dHJlYW0uIEFjY29yZGluZyB0byBteSByZWFkaW5nCm9mIGxpYndlYnNvY2tldHMgZG9jdW1lbnRh
dGlvblsxXSwgZXh0ZW5zaW9ucyBhcmUgdXNlZCBvbmx5IHdoZW4gb25lIG9mCmx3c19zZXRfZXh0
ZW5zaW9uX29wdGlvbiwgbHdzX2V4dF9wYXJzZV9vcHRpb25zIG9yCmx3c19leHRlbnNpb25fY2Fs
bGJhY2tfcG1fZGVmbGF0ZSBhcmUgdXNlZC4KQW1vbmcgdGhlIHBhY2thZ2VzIGRlcGVuZGluZyBv
biBsaWJ3ZXNvY2tldHMsIG9ubHkgdHR5ZCBhbmQKamFudXMtZ2F0ZXdheSBzZWVtIHRvIGJlIHVz
aW5nIHRoZSBleHRlbnNpb25zLiB0dHlkIGxpc3RzIHpsaWIgYXMgYQpkaXJlY3QgZGVwZW5kZW5j
eSBzbyBpdCdsbCBlbmFibGUgbGlid2Vic29ja2V0cyBleHRlbnNpb25zIHN1cHBvcnQgYnkKZXh0
ZW5zaW9uLiBqYW51cy1nYXRld2F5IGRvZXMgbm90LCB0aGVyZWZvcmUgdGhlIGRlcGVuZGVuY3kg
aXMgYWRkZWQKdG8gaXRzIENvbmZpZy5pbi4KClsxXSBodHRwczovL2xpYndlYnNvY2tldHMub3Jn
L2x3cy1hcGktZG9jLW1haW4vaHRtbC9ncm91cF9fZXh0ZW5zaW9ucy5odG1sCgpTaWduZWQtb2Zm
LWJ5OiBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpAY2hlcnJ5LmRlPgotLS0KTWFya2Vk
IGFzIFJGQyBiZWNhdXNlIEknbSBub3QgZm9uZCBvZiBhZGRpbmcgdGhlIFpMSUIgZGVwZW5kZW5j
eSB0bwpqYW51cy1nYXRld2F5IHRvIGVuYWJsZSBsaWJ3ZWJzb2NrZXRzIGV4dGVuc2lvbnMgc3Vw
cG9ydC4KCkFub3RoZXIgc29sdXRpb24gaXMgdG8gYWRkIGEgbmV3IG9wdGlvbiDDoC1sYQpCUjJf
UEFDS0FHRV9MSUJXRUJTT0NLRVRTX0FTWU5DX0ROUyBmb3IgZXh0ZW5zaW9ucyBzdXBwb3J0LiBJ
dCdzIGp1c3QKdGhhdCB1c3VhbGx5IG9wdGlvbnMgdGhhdCBkZXBlbmQgb24gYSBzaW5nbGUgcGFj
a2FnZSBwcmVzZW5jZSBhcmUKaGFuZGxlZCBsaWtlIGluIHRoaXMgcGF0Y2ggaWYgSSB1bmRlcnN0
b29kIGNvcnJlY3RseT8KClRoaXMgd2FzIG9ubHkgYnVpbGQgdGVzdGVkLgotLS0KIHBhY2thZ2Uv
amFudXMtZ2F0ZXdheS9Db25maWcuaW4gICAgICAgIHwgIDEgKwogcGFja2FnZS9saWJ3ZWJzb2Nr
ZXRzL0NvbmZpZy5pbiAgICAgICAgfCAgMSAtCiBwYWNrYWdlL2xpYndlYnNvY2tldHMvbGlid2Vi
c29ja2V0cy5tayB8IDExICsrKysrKysrLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2phbnVzLWdhdGV3YXkv
Q29uZmlnLmluIGIvcGFja2FnZS9qYW51cy1nYXRld2F5L0NvbmZpZy5pbgppbmRleCBjY2YwNjVk
MjExZTZiYWZjNjFhMTIzZTYyODY4YzFjY2QxMjRlYjIwLi5iOGFjOTQ2MzljNTRhZTE1NzBlOGNm
NTkzZjlkZTg3MTExZDcyNDFlIDEwMDY0NAotLS0gYS9wYWNrYWdlL2phbnVzLWdhdGV3YXkvQ29u
ZmlnLmluCisrKyBiL3BhY2thZ2UvamFudXMtZ2F0ZXdheS9Db25maWcuaW4KQEAgLTk5LDYgKzk5
LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0pBTlVTX0dBVEVXQVlfVU5JWF9TT0NLRVRTCiBjb25m
aWcgQlIyX1BBQ0tBR0VfSkFOVVNfR0FURVdBWV9XRUJTT0NLRVRTCiAJYm9vbCAiV2ViU29ja2V0
cyIKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCV0VCU09DS0VUUworCXNlbGVjdCBCUjJfUEFDS0FH
RV9aTElCICMgbGlid2Vic29ja2V0cyB3aXRoIGV4dGVuc2lvbnMKIAogZW5kaWYKIApkaWZmIC0t
Z2l0IGEvcGFja2FnZS9saWJ3ZWJzb2NrZXRzL0NvbmZpZy5pbiBiL3BhY2thZ2UvbGlid2Vic29j
a2V0cy9Db25maWcuaW4KaW5kZXggNjExNmNmZWNiNThiNzFjZDczNzk4ZTcxNTNmZmYzZTE3NDdi
ZjQ2NS4uNjMxZjBkOGU2NTBkNjliNDUyMjc0OWY1Njk0YzBjYmU5YThiZDZjYSAxMDA2NDQKLS0t
IGEvcGFja2FnZS9saWJ3ZWJzb2NrZXRzL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2xpYndlYnNv
Y2tldHMvQ29uZmlnLmluCkBAIC0xLDcgKzEsNiBAQAogY29uZmlnIEJSMl9QQUNLQUdFX0xJQldF
QlNPQ0tFVFMKIAlib29sICJsaWJ3ZWJzb2NrZXRzIgogCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNf
TElCUwotCXNlbGVjdCBCUjJfUEFDS0FHRV9aTElCCiAJaGVscAogCSAgTGlid2Vic29ja2V0cyBp
cyBhIGxpZ2h0d2VpZ2h0IHB1cmUgQyBsaWJyYXJ5IGJ1aWx0IHRvIHVzZQogCSAgbWluaW1hbCBD
UFUgYW5kIG1lbW9yeSByZXNvdXJjZXMsIGFuZCBwcm92aWRlIGZhc3QgdGhyb3VnaHB1dApkaWZm
IC0tZ2l0IGEvcGFja2FnZS9saWJ3ZWJzb2NrZXRzL2xpYndlYnNvY2tldHMubWsgYi9wYWNrYWdl
L2xpYndlYnNvY2tldHMvbGlid2Vic29ja2V0cy5tawppbmRleCBlNTNmZWJmY2U0NTUxYjVjNjJk
NTM0ZjljNWIyOTdmNTU4NmQ4NzI0Li5lMTI5YjBiZDZjYmI0NWE4ZGZmZTAzZDYxYWNlOTkwNjBj
OWI3Y2M4IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYndlYnNvY2tldHMvbGlid2Vic29ja2V0cy5t
aworKysgYi9wYWNrYWdlL2xpYndlYnNvY2tldHMvbGlid2Vic29ja2V0cy5tawpAQCAtOCwxNCAr
OCwxMiBAQCBMSUJXRUJTT0NLRVRTX1ZFUlNJT04gPSA0LjMuMwogTElCV0VCU09DS0VUU19TSVRF
ID0gJChjYWxsIGdpdGh1Yix3YXJtY2F0LGxpYndlYnNvY2tldHMsdiQoTElCV0VCU09DS0VUU19W
RVJTSU9OKSkKIExJQldFQlNPQ0tFVFNfTElDRU5TRSA9IE1JVCB3aXRoIGV4Y2VwdGlvbnMKIExJ
QldFQlNPQ0tFVFNfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKLUxJQldFQlNPQ0tFVFNfREVQRU5E
RU5DSUVTID0gemxpYgogTElCV0VCU09DS0VUU19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKIExJQldF
QlNPQ0tFVFNfQ09ORl9PUFRTID0gXAogCS1ERElTQUJMRV9XRVJST1I9T04gXAogCS1ETFdTX1dJ
VEhPVVRfVEVTVEFQUFM9T04gXAogCS1ETFdTX0lQVjY9T04gXAotCS1ETFdTX1VOSVhfU09DSz1P
TiBcCi0JLURMV1NfV0lUSE9VVF9FWFRFTlNJT05TPU9GRgorCS1ETFdTX1VOSVhfU09DSz1PTgog
CiAjIElmIExXU19NQVhfU01QPTEsIHRoZW4gdGhlcmUgaXMgbm8gY29kZSByZWxhdGVkIHRvIHB0
aHJlYWRzIGNvbXBpbGVkCiAjIGluIHRoZSBsaWJyYXJ5LiBJZiB1bnNldCwgTFdTX01BWF9TTVAg
ZGVmYXVsdHMgdG8gMzIgYW5kIGEgc21hbGwKQEAgLTEwMiw0ICsxMDAsMTEgQEAgaWZlcSAoJChC
UjJfUEFDS0FHRV9MSUJXRUJTT0NLRVRTX0FTWU5DX0ROUykseSkKIExJQldFQlNPQ0tFVFNfQ09O
Rl9PUFRTICs9IC1ETFdTX1dJVEhfU1lTX0FTWU5DX0ROUz1PTgogZW5kaWYKIAoraWZlcSAoJChC
UjJfUEFDS0FHRV9aTElCKSx5KQorTElCV0VCU09DS0VUU19ERVBFTkRFTkNJRVMgKz0gemxpYgor
TElCV0VCU09DS0VUU19DT05GX09QVFMgKz0gLURMV1NfV0lUSE9VVF9FWFRFTlNJT05TPU9GRgor
ZWxzZQorTElCV0VCU09DS0VUU19DT05GX09QVFMgKz0gLURMV1NfV0lUSE9VVF9FWFRFTlNJT05T
PU9OCitlbmRpZgorCiAkKGV2YWwgJChjbWFrZS1wYWNrYWdlKSkKCi0tLQpiYXNlLWNvbW1pdDog
NTQ0MjQ5ZmY3NzYxZGIyZGY2MTc4M2M4NzMxZTgzNDU3NGRmOTU3YQpjaGFuZ2UtaWQ6IDIwMjUw
MjI0LWxpYndlYnNvY2tldHMtemxpYi1vcHQtNTMyNTQ0ZjgwMWUwCgpCZXN0IHJlZ2FyZHMsCi0t
IApRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpAY2hlcnJ5LmRlPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
