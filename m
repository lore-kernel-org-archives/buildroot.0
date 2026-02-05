Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDE6E9129C
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 09:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D0D640D48;
	Thu,  5 Feb 2026 09:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVzT-WZ-IyDK; Thu,  5 Feb 2026 09:26:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A15740D4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770283560;
	bh=LbFXVNLaX/uMxD9Ioy1iiK+McQLOlH6AQuke8Bj+peU=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zs3KwEb7acwNjdpFYzRiJ6nAnRukRD5bnLytTMROJXCQrb5M3Q4FuMmzmSvSWR/vg
	 XDlSTd4oWsvYJAriILOaIZbqhIiATunzzJCf08xZEIwzI9kyrE9yV9aV9vaqdu9/R0
	 VzKmpPKSWNgln04UeiuM2SjXYLVb/CEU4PnbYEkUReM84E4VY1OeEtaf/JRp104VNV
	 Zpk/0L7LytgBrDrvtXQRf9FcvF2pzQ2Jx/R5aQ5xa5XufcWGyPJZ2wkauxr0/j20wY
	 8Qll4UsamSDiVEz4xCws26k0BkXhJOIQkr6MRwRwWSk7TOTN7SEInb0x3ACU1Cm02C
	 swi1t52x6qcWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A15740D4E;
	Thu,  5 Feb 2026 09:26:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68805F5
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 09:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4901E83BFD
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 09:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzGOyQ9sqq5M for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 09:25:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F34F83BFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F34F83BFB
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F34F83BFB
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 09:25:57 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 703C631E0C0A; Thu, 05 Feb 2026 10:25:55 +0100 (CET)
Date: Thu, 5 Feb 2026 10:25:55 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Cc: alexis.lothore@bootlin.com
Message-ID: <aYRiIxIb0-E_Pd6s@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1770283555; bh=gdjMnp7RNKn7MSwuWyqA1GTDddd8+RnmqAohfryjEBY=;
 h=Date:From:To:Cc:Subject:From;
 b=ZYoA6hcKvkhyY+xoYDO/Js7QyHThEXADZMV6zGA/8rbdxb0dTvbGH2EVC6gv48KEB
 W5s0Dti08rf/aRjG/KIyRCtMbyZzfyJE2yQicHQll2Zjnd4VW/iueUXmoXTJwxEFF0
 2GGkysF0awfr10YESbj4OZbGCKnSFqt/mgt6m8qZDZ8+FjBo0iwPmEKfk7HyzHrbs6
 zQDYZjfDzLYselotV9+YR0zWA35R0LydFyBXLkA+QRv8J8vurADAzpNDAtoWR9NTV+
 nDnsN7CYxEt6aLP1KxxWawHLBz+XAnmEG9h54XmY0eXnfHwtmVY+hxUAOkLcAK1ew1
 KpWijxwCp188w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH v4] package/libxmlsec1: new package
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

SW50cm9kdWNlIHRoZSBsaWJ4bWxzZWMxIGxpYnJhcnkgcGFja2FnZS4gbGlieG1sc2VjIGltcGxl
bWVudHMgWE1MCnNlY3VyaXR5IHN0YW5kYXJkcy4KClRoZSBsaWJyYXJ5IGhhcyBvbmx5IGEgZmV3
IG1hbmRhdG9yeSBkZXBlbmRlbmNpZXMgKGxpYnhtbDIgYW5kIGEgY3J5cHRvCmxpYnJhcnkpLiBJ
dCBuZWVkcyBvbmUgb2YgdGhlIGZvbGxvd2luZyBjcnlwdG9ncmFwaGljIGxpYnJhcmllczoKT3Bl
blNTTCwgTlNTLCBvciBHY3J5cHQvR05VVExTLiBEZWZhdWx0IHRvIG9wZW5zc2wgZm9yIG5vdyB0
byBrZWVwIHRoZQpwYWNrYWdlIHNpbXBsZS4KClNpZ25lZC1vZmYtYnk6IFdhbGRlbWFyIEJyb2Rr
b3JiIDx3YnhAb3BlbmFkay5vcmc+Ci0tLQpUaGlzIGlzIGJhc2VkIG9uIHRoZSBwYXRjaCBwcm92
aWRlZCBieSBBbGV4aXMgTG90aG9yw6kgbGFzdCB5ZWFyLgpJIHVwZGF0ZWQgaXQgdG8gbGF0ZXN0
IGF2YWlsYWJsZSByZWxlYXNlIGFuZCBmaXhlZCBzb21lIGlzc3VlcyBmb3VuZAp2aWEgdGVzdC1w
a2cuCgouL3V0aWxzL3Rlc3QtcGtnIC1wIGxpYnhtbHNlYzEKICAgICAgICAgICAgICAgICAgICBi
b290bGluLWFybXY1LXVjbGliYyBbMS82XTogT0sKICAgICAgICAgICAgICAgICAgICAgYm9vdGxp
bi1hcm12Ny1nbGliYyBbMi82XTogT0sKICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjdt
LXVjbGliYyBbMy82XTogT0sKICAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi14ODYtNjQtbXVz
bCBbNC82XTogT0sKICAgICAgICAgICAgICAgICAgICAgIGJyLWFybS1mdWxsLXN0YXRpYyBbNS82
XTogT0sKICAgICAgICAgICAgICAgYm9vdGxpbi1hYXJjaDY0LWdsaWJjLW9sZCBbNi82XTogT0sK
NiBidWlsZHMsIDAgc2tpcHBlZCwgMCBidWlsZCBmYWlsZWQsIDAgbGVnYWwtaW5mbyBmYWlsZWQs
IDAgc2hvdy1pbmZvIGZhaWxlZAoKLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDEgKwogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICB8ICAxICsKIHBh
Y2thZ2UvbGlieG1sc2VjMS9Db25maWcuaW4gICAgICAgfCAxMSArKysrKysrKysrKwogcGFja2Fn
ZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEuaGFzaCB8ICA0ICsrKysKIHBhY2thZ2UvbGlieG1sc2Vj
MS9saWJ4bWxzZWMxLm1rICAgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDUg
ZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvbGlieG1sc2VjMS9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYnht
bHNlYzEvbGlieG1sc2VjMS5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJ4bWxz
ZWMxL2xpYnhtbHNlYzEubWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwpp
bmRleCAyMjVkMWFjOTE3Li41MjY4NjI1ZTk3IDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBi
L0RFVkVMT1BFUlMKQEAgLTM0MzAsNiArMzQzMCw3IEBAIEY6CXBhY2thZ2UvYXN0ZXJpc2svCiBG
OglwYWNrYWdlL2V2aWx3bS8KIEY6CXBhY2thZ2UvZmJ2LwogRjoJcGFja2FnZS9saWJwYW0tcGtj
czExLworRjoJcGFja2FnZS9saWJ4bWxzZWMxLwogRjoJcGFja2FnZS9ta3NoLwogRjoJcGFja2Fn
ZS9ydWJ5LwogRjoJcGFja2FnZS91Y2xpYmMvCmRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5p
biBiL3BhY2thZ2UvQ29uZmlnLmluCmluZGV4IDYyODRiZWE3ZjQuLmU2OWRkNmU5ZmIgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvQ29uZmlnLmluCkBAIC0xNjQx
LDYgKzE2NDEsNyBAQCBtZW51ICJDcnlwdG8iCiAJc291cmNlICJwYWNrYWdlL2xpYnRvbWNyeXB0
L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvbGlidWVjYy9Db25maWcuaW4iCiAJc291cmNl
ICJwYWNrYWdlL2xpYnhjcnlwdC9Db25maWcuaW4iCisJc291cmNlICJwYWNrYWdlL2xpYnhtbHNl
YzEvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9tYmVkdGxzL0NvbmZpZy5pbiIKIAlzb3Vy
Y2UgInBhY2thZ2UvbmV0dGxlL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uvb2F0aC10b29s
a2l0L0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlieG1sc2VjMS9Db25maWcuaW4g
Yi9wYWNrYWdlL2xpYnhtbHNlYzEvQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAuLmNlMzM4NGU3YjcKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2xpYnht
bHNlYzEvQ29uZmlnLmluCkBAIC0wLDAgKzEsMTEgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9MSUJY
TUxTRUMxCisJYm9vbCAibGlieG1sc2VjMSIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCWE1MMgor
CXNlbGVjdCBCUjJfUEFDS0FHRV9PUEVOU1NMCisJaGVscAorCSAgWE1MU2VjIGxpYnJhcnkgcHJv
dmlkZXMgQyBiYXNlZCBpbXBsZW1lbnRhdGlvbiBmb3IgbWFqb3IgWE1MCisJICBTZWN1cml0eSBz
dGFuZGFyZHM6CisJICAtIFhNTCBTaWduYXR1cmUgU3ludGF4IGFuZCBQcm9jZXNzaW5nCisJICAt
IFhNTCBFbmNyeXB0aW9uIFN5bnRheCBhbmQgUHJvY2Vzc2luZworCisJICBodHRwczovL3d3dy5h
bGVrc2V5LmNvbS94bWxzZWMvCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnhtbHNlYzEvbGlieG1s
c2VjMS5oYXNoIGIvcGFja2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEuaGFzaApuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5iZTdjYTUyOWNiCi0tLSAvZGV2L251bGwKKysr
IGIvcGFja2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEuaGFzaApAQCAtMCwwICsxLDQgQEAKKyMg
TG9jYWxseSBjYWxjdWxhdGVkCitzaGEyNTYgIGE2MzFjOGNkN2E2Yjg2ZTZhZGI5ZjViOTM1ZDQ1
YTljZjk3NjhiM2NiMDkwZDQ2MWU4ZWI5ZDA0M2NmOWI2MmYgIHhtbHNlYzEtMS4zLjkudGFyLmd6
CisjIExvY2FsbHkgY2FsY3VsYXRlZAorc2hhMjU2ICBkNWU5Mzg4NTM0MjU2MzYwYzZhMDA5ZDRm
MTlhYjJiOGQ2ZWMwYWE3ZmYzMmE1MWUyMmQ4OTllZDdiZWI1YzQ4ICBDb3B5cmlnaHQKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLm1rIGIvcGFja2FnZS9saWJ4bWxz
ZWMxL2xpYnhtbHNlYzEubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4u
YTJkNjA3YzIyOAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxz
ZWMxLm1rCkBAIC0wLDAgKzEsMzAgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIGxp
YnhtbHNlYzEKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK0xJQlhNTFNFQzFfVkVSU0lP
TiA9IDEuMy45CitMSUJYTUxTRUMxX1NPVVJDRSA9IHhtbHNlYzEtJChMSUJYTUxTRUMxX1ZFUlNJ
T04pLnRhci5negorTElCWE1MU0VDMV9TSVRFID0gaHR0cDovL3d3dy5hbGVrc2V5LmNvbS94bWxz
ZWMvZG93bmxvYWQKK0xJQlhNTFNFQzFfTElDRU5TRSA9IE1JVAorTElCWE1MU0VDMV9MSUNFTlNF
X0ZJTEVTID0gQ29weXJpZ2h0CisKK0xJQlhNTFNFQzFfSU5TVEFMTF9TVEFHSU5HID0gWUVTCisK
K2lmZXEgKCQoQlIyX1RPT0xDSEFJTl9IQVNfTElCQVRPTUlDKSx5KQorTElCWE1MU0VDMV9DT05G
X0VOViArPSBMSUJTPS1sYXRvbWljCitlbmRpZgorCitMSUJYTUxTRUMxX0NPTkZfT1BUUyArPSBc
CisJLS1lbmFibGUtY3J5cHRvLWRsPW5vIFwKKwktLWRpc2FibGUtcGVkYW50aWMgXAorCS0td2l0
aC1vcGVuc3NsPSQoU1RBR0lOR19ESVIpL3VzciBcCisJLS13aXRob3V0LWdudXRscyBcCisJLS13
aXRob3V0LW5zcyBcCisJLS13aXRob3V0LWdjcnlwdCBcCisJLS13aXRob3V0LWxpYnhzbHQKKwor
TElCWE1MU0VDMV9ERVBFTkRFTkNJRVMgPSBsaWJ4bWwyIG9wZW5zc2wKKworJChldmFsICQoYXV0
b3Rvb2xzLXBhY2thZ2UpKQotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
