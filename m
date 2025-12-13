Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438E2D5B15D
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 18:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0847F6083F;
	Sat, 13 Dec 2025 18:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvWwrQintFLv; Sat, 13 Dec 2025 18:05:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1291F607D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765649104;
	bh=UAVff8eYUvYoNWyk8kUhC2cn4kuIPAzmQeKJeORDflE=;
	h=From:Date:References:Cc:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PBU+/4LI1QXd8uLdQ7FuH8EJ4ltIoMfelErv84UXEbyAewrvrTnMofW5QCOo6IqWS
	 ZGS3gW2kGWUQiFP5vuFYvu9Df6rMpW7mxE/kBW5o/i7N5/+EsOSHxwunV6LAYvwMbh
	 GvrbjO4UN8v4/IuURoDY4ASJ8PBdZfbpWF3le5Mj8fvF++qJmbgIxsdmQe82Zg97Rw
	 o82IN/1P/Eu3fEX2+qi638EwOT/QPg0VlMxV8ZB/AYXyj1kmbtgfVi+cgq9G8IN+UB
	 qHPpYfDUUp1Wdsw8Oyoi7QL0Fecm7qoYe7StG6IyE/xKyoKWe0OPc69GHsiPSvNujZ
	 9sz1a+1WJhsVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1291F607D6;
	Sat, 13 Dec 2025 18:05:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9B1F117
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A75CD409CA
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JR4PQUyc4Iaj for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 18:05:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.165;
 helo=smtpdh20-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77966409C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77966409C4
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77966409C4
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:04:58 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id UTzEvgTKtiuHAUTzEvofPi; Sat, 13 Dec 2025 19:04:56 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 13 Dec 2025 19:04:55 +0100
Message-Id: <3B44FA1C-00EA-40D7-AD9F-4980B9556673@benettiengineering.com>
References: <20251213185555.22ab2051@windsurf>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <20251213185555.22ab2051@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (23C55)
X-CMAE-Envelope: MS4xfOnG5M+uIAYv8mil8weowJJ/S6XfOnWDlSxMy8HTv6snpexaZ1GXE5FBNNTpxDw8Dg6Dm0qW7URIGrMM3ReZkSBWUw4lChEosWzQWIWSO0BdaITJvRaP
 2fRr71H7rT+/dVMOLgHZ0nlp7LvdjAnn9fLOrg6wHwt2WmbLsMqcfWlrYgF9HyIT/SqMNepvTa13s3xAZCnejX0n0HJgLOryQ5unX7kK8V7xTWoMzh5naMET
 NelUvPNmbzx1RY38ZV5ci2K2yo5IBh4BkVZ67tP3IodZf8RpEq53kbqVkT/KBCsH
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765649096; bh=GHgRg+Los+ZEYGA9eYy0VwyxjlxuaJW88iwOrExwXwk=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=e6UZrcl7+NY5B8TVZAHSMwmiMkwysv1oRQHgsgdv+c5cJX6YWqwemHTJfK+DDmlNv
 XGrc6J4Jm1LvhrEPJXb0vGZRyO4UcYCgdfH5u0d92m+RjzXw8iJziAPQY6TBeagQLc
 bIRs8csOYjUXVFOae/2vcIKXzyQ7//eRK0eXELesT9iEiHUfHsHjYl4d142ddE4B9d
 YQ9K+Vw/uELKj17gr7msYUZhYLrDYoZptKiEIct82qX94tUZc3/tp7Ds2HnB7MiSYK
 eGCxUbf6QWdUnOJTjFFZ8V1rNSfyoa1nzlCeNDwJ7RxEzvUr/aJMxQuTR2WQIafECW
 2CU4z8wJ1KI4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=e6UZrcl7
Subject: Re: [Buildroot] [PATCH v2 2/2] pacakge/nfs-utils: fix build failure
 due to missing BR2_PACKAGE_LIBTIRPC_DB
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

SGkgVGhvbWFzLAoKdGhhbmtzIGZvciBsb29raW5nIGludG8gdGhlc2UgcGF0Y2hlcywKCj4gSWwg
Z2lvcm5vIDEzIGRpYyAyMDI1LCBhbGxlIG9yZSAxODo1NiwgVGhvbWFzIFBldGF6em9uaSA8dGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbT4gaGEgc2NyaXR0bzoKPiAKPiDvu79IZWxsbywKPiAK
Pj4gT24gU2F0LCAxMyBEZWMgMjAyNSAxNjoxNzozMCArMDEwMAo+PiBHaXVsaW8gQmVuZXR0aSA8
Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4+IAo+PiBQYWNh
a2dlIG5mcy11dGlscyByZXF1aXJlcyBsaWJ0aXJwYyBycGNkYiBvcHRpb24sIHNvIGxldCdzIHNl
bGVjdCBpdCBieQo+PiBkZWZhdWx0Lgo+PiAKPj4gRml4ZXM6Cj4+IGh0dHBzOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8yOWFkZjJkMDRjZjRjNDZlNDkyYWY5NWVkYWE5Njk4Mzk4
NWQ2YjU3Lwo+PiAKPj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5l
dHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4gCj4gSXQgc2VlbXMgbGlrZSBycGNiaW5kIHdp
bGwgbmVlZCB0aGUgc2FtZSB0aGluZz8KPiAKPiAgICBodHRwczovL2F1dG9idWlsZC5idWlsZHJv
b3Qub3JnL3Jlc3VsdHMvZjQ2MTIxMjYwNWQ5ZDVmMWMzOGExZmZlMDBhODM5MTI1MjJiZjQ4Mi9i
dWlsZC1lbmQubG9nCj4gCj4gTGV0IG1lIGtub3cgaWYgeW91IHdhbnQgdG8gYWRkcmVzcyBpdCBh
cyB3ZWxsLCBvciBpZiB5b3Ugd291bGQgbGlrZSBtZQo+IHRvIHNlbmQgYSBzZXBhcmF0ZSBwYXRj
aC4KCknigJltIGdsYWQgdG8gc2VuZCBhIHBhdGNoIGZvciBycGNiaW5kIGluIHNvbWUgZGF5LiBT
byBJIGNhbiBjbGVhbiB1cCB0aGVzZSBwYXRjaGVzIHRvby4KCkJlc3QgcmVnYXJkcy4KR2l1bGlv
Cgo+IAo+IFRoYW5rcyBhIGxvdCEKPiAKPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmks
IGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
