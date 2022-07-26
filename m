Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A77C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC64560670;
	Tue, 26 Jul 2022 21:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC64560670
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bt6hLIrR-OKb; Tue, 26 Jul 2022 21:10:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6CC1605D5;
	Tue, 26 Jul 2022 21:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6CC1605D5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 205BD1BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF0B640116
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF0B640116
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JGTCmIKxNnzH for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:10:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65EF340012
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65EF340012
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:10:25 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h9so21791665wrm.0
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 14:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7+cj/wS0Nh0tga7re51J/FydeHUL71XJ7rNob/lEUqk=;
 b=UMaO3APzUYjsNeAw8kvEdKBjedo8HTaJZzr8UWhBSy+3Z8UHp7/31p+jct7oypQfZr
 dkqAKFOOFr9tLwfOsTMHqZXH0fViO+DBBQWZnVs9AcuzQTi8yeCiqa5b1QeJ5fhqelLk
 hf03eZ0P41Nz9TrRLfYtD2v/Zj/+nO3XJ7UysVnLWEGJrEGzGcmm6Sl3CsPobtY0Z6Nf
 ZEY+2GQjJ6glziiStlbHVLIzXXMDQ9gDbtG1VsNNfELk3iZFHEgAv9BPUPUosH4ZM27/
 a+paod2TaGaERIaqtnFtyFal3wQh62cUj1IuYrmz33V9zm23IH6XENG6mldW8L/DYvk0
 72/w==
X-Gm-Message-State: AJIora+jIPaFPfAlyq5ZpFTJFjQBdCVy+3xxzEts/sTNpY9wXuEPudIe
 2q6V74MyDo5M/xRU7zQS8/bJPw==
X-Google-Smtp-Source: AGRyM1u/3MKUauhVCkG1bkisyK3EISQElunwn2HDhzQ5ZaCh4ELTc8bXNMGy+jj/tLw/jlIlSEgK9Q==
X-Received: by 2002:a5d:60cc:0:b0:21e:5844:578a with SMTP id
 x12-20020a5d60cc000000b0021e5844578amr11772650wrt.505.1658869823484; 
 Tue, 26 Jul 2022 14:10:23 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:86bb:8231:62d7:1874?
 ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a05600c4f8100b003a327b98c0asm100581wmq.22.2022.07.26.14.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 14:10:07 -0700 (PDT)
Message-ID: <6cd33ecf-1af6-d099-13b7-9f7bbd8bf267@smile.fr>
Date: Tue, 26 Jul 2022 23:09:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
References: <20220116175320.453041-1-gilles.talis@gmail.com>
 <20220116175320.453041-2-gilles.talis@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220116175320.453041-2-gilles.talis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=7+cj/wS0Nh0tga7re51J/FydeHUL71XJ7rNob/lEUqk=;
 b=4g3u/oT8mPrVqTLJfQqdQiRIo99nJc4GHpx0/WlmYtUGdW84bCs+oxiEosY+b0yX4b
 kLlWcooPflzaQ0hWoJhvkcBPLlHT/edXhXf25BXkmN4AwmAwPtMri+FeMlr1bAZ7zm6P
 d0l55zm6zyBd4ZKWB1LMYzELeWVg57fclaSZE8f7VzPGVl70KYSjjndevwyg5TmO84Cd
 a9J6FMUoB+R9R18pl7m57oP5ew2+Ul5MyNnWkMEP1we919Shffp3zzNuhqnaAvff5y0D
 vh+f/SyCuztEqEYhC9Ww6w8FQ/mlbvdB48w+vDH5L05sx+0vvwZk3GWtGuKS6cxVdAtO
 Oy2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=4g3u/oT8
Subject: Re: [Buildroot] [PATCH v2 2/2] package/clpeak: new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2lsbGVzLAoKTGUgMTYvMDEvMjAyMiDDoCAxODo1MywgR2lsbGVzIFRhbGlzIGEgw6lj
cml0wqA6Cj4gY2xwZWFrIGlzIGEgdG9vbCB0aGF0IHByb2ZpbGVzIE9wZW5DTCBkZXZpY2VzIHRv
IGZpbmQKPiB0aGVpciBwZWFrIGNhcGFjaXRpZXMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBHaWxsZXMg
VGFsaXMgPGdpbGxlcy50YWxpc0BnbWFpbC5jb20+Cj4gLS0tCj4gdjI6Cj4gIC0gQWRkZWQgb3Bl
bmNsLWNsaHBwIGRlcGVuZGVuY3kKCkl0IHNlZW1zIHlvdSBtaXNzZWQgdGhlIHNlY29uZCBwYXJ0
IG9mIHRoZSByZXZpZXcgZnJvbSBUaG9tYXMgYWJvdXQgdGhlIGlzc3VlCndpdGggTlhQIE9wZW5D
TCBwcm92aWRlcjoKCmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290
LzIwMjEtRGVjZW1iZXIvNjMxOTQyLmh0bWwKCkJ1dCBhZnRlciB0ZXN0aW5nIGFnYWluIGxvY2Fs
bHkgdGhlIGlzc3VlIGlzIGdvbmUgc2luY2UgdGhlIEJvb3RsaW4gdG9vbGNoYWluCmhhcyBiZWVu
IHVwZGF0ZWQgdG8gMjAyMS4xMS0xIGFuZCBub3cgdXNlIGEgbmV3ZXIgZ2xpYmMgdmVyc2lvbiA+
IDIuMzMuCgpUZXN0aW5nIGFnYWluIHdpdGggdGhlIHByZXZpb3VzIHRvb2xjaGFpbiBbMV0gdGhl
IGJ1aWxkIGZhaWwgYWdhaW4uCgpJIGRvbid0IHRoaW5rIHRoZSBpc3N1ZSBpcyByZWFsbHkgcmVs
YXRlZCB0byBjbHBlYWsgYnV0IHRoZSBpbXgtZ3B1LXZpdiBwYWNrYWdlCml0c2VsZi4gQnV0IHdl
IGRvbid0IGhhdmUgYSB3YXkgaW4gdGhlIGN1cnJlbnQgZXh0ZXJuYWwgdG9vbGNoYWluIGluZnJh
c3RydWN0dXJlCnRvIGFkZCBhIGRlcGVuZGVuY3kgb24gdGhlIGdsaWJjIHZlcnNpb24gcHJvdmlk
ZWQgYnkgdGhlIGV4dGVybmFsIHRvb2xjaGFpbi4KCk90aGVyd2lzZToKUmV2aWV3ZWQtYnk6IFJv
bWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKWzFdCmh0dHBzOi8vdG9vbGNoYWlu
cy5ib290bGluLmNvbS9kb3dubG9hZHMvcmVsZWFzZXMvdG9vbGNoYWlucy9hYXJjaDY0L3RhcmJh
bGxzL2FhcmNoNjQtLWdsaWJjLS1zdGFibGUtMjAyMC4wOC0xLnRhci5iejIKCkJlc3QgcmVnYXJk
cywKUm9tYWluCgoKPiAKPiAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgfCAgMSArCj4gIHBh
Y2thZ2UvQ29uZmlnLmluICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL2NscGVhay9Db25maWcu
aW4gICB8IDE1ICsrKysrKysrKysrKysrKwo+ICBwYWNrYWdlL2NscGVhay9jbHBlYWsuaGFzaCB8
ICAzICsrKwo+ICBwYWNrYWdlL2NscGVhay9jbHBlYWsubWsgICB8IDEzICsrKysrKysrKysrKysK
PiAgNSBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL2NscGVhay9Db25maWcuaW4KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
Y2xwZWFrL2NscGVhay5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2NscGVhay9j
bHBlYWsubWsKPiAKPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiBpbmRl
eCA0ODNhZmE0OTMyLi4wNGIzZjhmYmE5IDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMKPiArKysg
Yi9ERVZFTE9QRVJTCj4gQEAgLTEwNzUsNiArMTA3NSw3IEBAIE46CUdpbGxlcyBUYWxpcyA8Z2ls
bGVzLnRhbGlzQGdtYWlsLmNvbT4KPiAgRjoJYm9hcmQvZnJlZXNjYWxlL2lteDhtbWV2ay8KPiAg
RjoJY29uZmlncy9mcmVlc2NhbGVfaW14OG1tZXZrX2RlZmNvbmZpZwo+ICBGOglwYWNrYWdlL2Nj
dHovCj4gK0Y6CXBhY2thZ2UvY2xwZWFrLwo+ICBGOglwYWNrYWdlL2ZhYWQyLwo+ICBGOglwYWNr
YWdlL2Zkay1hYWMvCj4gIEY6CXBhY2thZ2UvaHR0cGluZy8KPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IDA4ZWIzYWQ4MDkuLmIzOGQw
NWIzYjMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0Nv
bmZpZy5pbgo+IEBAIC04Nyw2ICs4Nyw3IEBAIG1lbnUgIkRlYnVnZ2luZywgcHJvZmlsaW5nIGFu
ZCBiZW5jaG1hcmsiCj4gIAlzb3VyY2UgInBhY2thZ2UvYm9ubmllL0NvbmZpZy5pbiIKPiAgCXNv
dXJjZSAicGFja2FnZS9jYWNoZS1jYWxpYnJhdG9yL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFj
a2FnZS9jbGluZm8vQ29uZmlnLmluIgo+ICsJc291cmNlICJwYWNrYWdlL2NscGVhay9Db25maWcu
aW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvY29yZW1hcmsvQ29uZmlnLmluIgo+ICAJc291cmNlICJw
YWNrYWdlL2NvcmVtYXJrLXByby9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvZGFjYXBv
L0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jbHBlYWsvQ29uZmlnLmluIGIvcGFj
a2FnZS9jbHBlYWsvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAw
MDAwMDAwLi5jODMyOTc1NDljCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvY2xwZWFr
L0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMTUgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX0NMUEVB
Swo+ICsJYm9vbCAiY2xwZWFrIgo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IQVNfTElCT1BF
TkNMCj4gKwlkZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNURENQUAo+ICsJZGVwZW5kcyBvbiBC
UjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzggIyBDKysxMQo+ICsJc2VsZWN0IEJSMl9QQUNL
QUdFX09QRU5DTF9DTEhQUAo+ICsJaGVscAo+ICsJICBjbHBlYWsgaXMgYSB0b29sIHRoYXQgcHJv
ZmlsZXMgT3BlbkNMIGRldmljZXMKPiArCSAgdG8gZmluZCB0aGVpciBwZWFrIGNhcGFjaXRpZXMK
PiArCj4gKwkgIGh0dHBzOi8vZ2l0aHViLmNvbS9rcnJpc2huYXJyYWovY2xwZWFrCj4gKwo+ICtj
b21tZW50ICJjbHBlYWsgbmVlZHMgYW4gT3BlbkNMIHByb3ZpZGVyLCBhIHRvb2xjaGFpbiB3LyBD
KyssIGdjYyA+PSA0LjgiCj4gKwlkZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9IQVNfTElCT1BFTkNM
IFwKPiArCQl8fCAhQlIyX0lOU1RBTExfTElCU1REQ1BQIHx8ICFCUjJfVE9PTENIQUlOX0dDQ19B
VF9MRUFTVF80XzgKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jbHBlYWsvY2xwZWFrLmhhc2ggYi9w
YWNrYWdlL2NscGVhay9jbHBlYWsuaGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXgg
MDAwMDAwMDAwMC4uZTBkMmMxZTkyYgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2Ns
cGVhay9jbHBlYWsuaGFzaAo+IEBAIC0wLDAgKzEsMyBAQAo+ICsjIExvY2FsbHkgY29tcHV0ZWQK
PiArc2hhMjU2ICAxZTljM2Y5NTk0OTgyNTNkNmJiOTU2ZGM3ODZkZTdiM2U0MDE5MjY0MjE2YTE3
ODFjMDZhZTQ5YTFkNjYwMGU1ICBjbHBlYWstMDc3NzIwNWJlMWQ1NjgxZDVhNzZkNDZlYzk0NTg4
NTQ0ZTg0NjJhNS50YXIuZ3oKPiArc2hhMjU2ICA4OGQ5YjRlYjYwNTc5YzE5MWVjMzkxY2EwNGMx
NjEzMDU3MmQ3ZWVkYzRhODZkYWE1OGJmMjhjNmUxNGM5YmNkICBMSUNFTlNFCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvY2xwZWFrL2NscGVhay5tayBiL3BhY2thZ2UvY2xwZWFrL2NscGVhay5tawo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNWZhOTkwZmIzNAo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2NscGVhay9jbHBlYWsubWsKPiBAQCAtMCwwICsx
LDEzIEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBjbHBlYWsKPiArIwo+
ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArQ0xQRUFLX1ZFUlNJT04gPSAwNzc3MjA1
YmUxZDU2ODFkNWE3NmQ0NmVjOTQ1ODg1NDRlODQ2MmE1Cj4gK0NMUEVBS19TSVRFID0gJChjYWxs
IGdpdGh1YixrcnJpc2huYXJyYWosY2xwZWFrLCQoQ0xQRUFLX1ZFUlNJT04pKQo+ICtDTFBFQUtf
TElDRU5TRSA9IFVubGljZW5zZQo+ICtDTFBFQUtfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiAr
Q0xQRUFLX0RFUEVOREVOQ0lFUyA9IGxpYm9wZW5jbCBvcGVuY2wtY2xocHAKPiArCj4gKyQoZXZh
bCAkKGNtYWtlLXBhY2thZ2UpKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
