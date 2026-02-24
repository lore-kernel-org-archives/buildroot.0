Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9E9E9B249
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 10:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44E0E60B6D;
	Tue, 24 Feb 2026 10:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2DBjP-8YnMnE; Tue, 24 Feb 2026 10:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 492EA60B93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771930031;
	bh=49VrzpC5DvnYTXr5xdie9StsynBlR+ftoaNIi+PfUMA=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dm8PryZjT6X843x7NZ3f912YZPervr04nVbCafeG2rdxRiMfVKrMtfQu7XfkyWvXo
	 cuvX/PIa6MTXzT4GhG0jzXcwp0wG11Uqj2Tje+iwewKyKQOCY/+HvVPnDcHz/bRB30
	 ADKF5mtY4d8HixXE6dri7WXVrnR2f3ATBEYHgSKATQBw90OTCCcjkuR8vZDmlq5EVJ
	 6WsROwLTy23oZp+GjKdiV+2fqeye6zdjBQIiebO90/UpXMfY2pGfz8QRQZGY+2Gc1o
	 f6X4mKomSM4onrswIh3GdiNWDDbHA7PpJdRfMZ2uG0RL9Wq17jEuL5mic+5S89rGSd
	 dmryVQZoVCYAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 492EA60B93;
	Tue, 24 Feb 2026 10:47:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D1C94249
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 10:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B792B40A8B
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 10:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDH6Fgjpet53 for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 10:47:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 74FE540A86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74FE540A86
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74FE540A86
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 10:47:08 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-385cfc572f1so42070491fa.3
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 02:47:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771930026; cv=none;
 d=google.com; s=arc-20240605;
 b=EZ2IxMph6rHeWELiF78VrvoEw3tYgHeO38VHUmwR9EMeQnXH0BHCIHdhqANUizrSAw
 Yni8Xyfox+WgxqpjmDDL2Vqbc3AkZRYIYZ/oKYcmvfaYgyCAYDTsAktCN0lQUJ1LxBcM
 +Zs6RJq9nRHQqavk/oFqtS0tNO3f/4i1PzyJAJHM7G/tlOHKC1mkgtqs3eCBAB7Way2f
 TMHjzGccVtObtc/wJnmPs+gP5f1Rt33d3Hj08BjRQxamdGfCUlry1iXuoD7kT1DWTTgq
 YyP6949UYeq/5eUGVLtM38ZikdRP1GjQCebq2WKC2O8/fTBE6jIGxeMHfdy4aYEFBQIB
 fjJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=V6B5BIUciXDGfIneuLUdqn0ksZB2qlAtZ5QoS4CNVRY=;
 fh=iz366Jwhg1KBtnoUSaB4CTVyEB6+LDXzhM0T2t1AVwA=;
 b=AyqoEp0H741kvmLycbf7g9OMsswYrF0UEsrCO++dFBastcX+6ov2ufqWSkjJAIP9XX
 aRfHJCKizr6kN0bbGHsj/1kwWRvWOBX+nWyQ/9yERbokJiMKd3KqMA+qtofYTHJEZRLY
 2cvW5yIIV7HhzKhU5qIg7Oq5sX8O991szNdpzLOaZk47DkMiIjUjginsl/SFDvbDqus+
 5Vr6UIHx6tw4Ry7GZMUqAb8eKYEMoh/KG8ITHzcY7LuGHiauk2oq9icKhFMxefQ23lN4
 FpngfuaYEsT+6IbtRELLLq6ojQQ/k8taQ+TdIvqK5GBlQRn78sAoEm8UJ6duQnI5GDgN
 BRLw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771930026; x=1772534826;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=V6B5BIUciXDGfIneuLUdqn0ksZB2qlAtZ5QoS4CNVRY=;
 b=dFgZYdktqY8jOwteqdaVxlp4aCQBrGb7qY7lG9pe6bOXIfwP67OefLeUuw7nWQ4Idx
 nNJ57AsIYCNvslw/9c5SEF08Y5x9UNYYBXIg1HW6fB3Eh2pC9jx6bUeiFmASnLAqQsJj
 CTEqkl+/Xsc9/Ks/Hd0VfqVhJT3EZ4T2Lu04HUdl9AoZRSLkLzpeCQhm7v9XCjjiQQiP
 1CkQpsMlqKsfjaGEcqcr1h/jOFSe79OHM4RXNCDTirj2LnhjoEk2G6V/TOzkcNs3noXW
 SClSryknZAYAp73bct7dvk/ljwiUpDtkoY8saF8ruA9w9eB4ou/oAF13UYUyUdtyxmxW
 k2BA==
X-Gm-Message-State: AOJu0YyjitCC479R8qDFdCS3YwDk0iXLGleYvj9UNANMkUocDJkPgexd
 gjgXUfyxL+bnYQtsZhETh1Poc6zGHsCy95cglvfK0wT5CaZmMqOebzRABUmPjNe9voDyvSz0I1S
 HHijMFIgFLU4R2VheqM9CsnCfn9qARmhS7fgROvBAeI11uN2UmZ184F0=
X-Gm-Gg: ATEYQzy9kNGHpv01RyuLm6wNdChHYZwOwX3bdTRMUM/B2G5ial5R7P2v4H/JUAHjayv
 X4C5aMJxeLhjYg3QlkbYA1HhNUDknDTNOj6wCSh/sfiyQMglKoQUTPH7j2XAAXkqtv9xKZZGTkf
 1mncgMdh2lylf6szzRQKSR+VmdurZom9pCZFtfyGkVqYqIWvCcTl3MOJ4sJizEsgmNWyQStsXjv
 cgnnySQ/c81yrxrQ4/znprfc/w5tsMpxz5O5KXFgWA+7PxuqquLKtPdojzMMDv5Z8Zrsc+2skud
 Qg+sI9j8mg==
X-Received: by 2002:a05:651c:31cf:b0:388:3e99:ddbd with SMTP id
 38308e7fff4ca-389a5e45670mr41973921fa.31.1771930025518; Tue, 24 Feb 2026
 02:47:05 -0800 (PST)
MIME-Version: 1.0
References: <20260223165523.1392281-1-fabien.lehoussel@smile.fr>
 <20260224072250.12521-1-thomas.perale@mind.be>
In-Reply-To: <20260224072250.12521-1-thomas.perale@mind.be>
Date: Tue, 24 Feb 2026 11:46:54 +0100
X-Gm-Features: AaiRm509F_kSc-ds934kf4MNmNkADwDzDXxcQ1aevDAUeE0bvyf1YG-kQMDHWhk
Message-ID: <CAKWtHty=wEZADA9+-8DyZNnfcpfqqpAXUhqyLviGKtkP8KvK+Q@mail.gmail.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1771930026; x=1772534826; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V6B5BIUciXDGfIneuLUdqn0ksZB2qlAtZ5QoS4CNVRY=;
 b=ORatxbSvKsOXYhLAjpZ+lg5yfnfz30GJBaUbhZqdm3RE5bqFdV+jJ+ZbkLXrkiQa0z
 fSbLtsOoElhg0/+5TY9UujTRbrLgTt15m6H5Q+hvIIVqJnAWIJIN8ix7+wNqMd3oEv29
 T1mVEm/5Bfj03tRcjLr1f083r1RYNvFVgEJHA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ORatxbSv
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/generate-cyclonedx: add
 source attribute to each CVE
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
From: Fabien LEHOUSSEL via buildroot <buildroot@buildroot.org>
Reply-To: Fabien LEHOUSSEL <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzCgpMZSBtYXIuIDI0IGbDqXZyLiAyMDI2IMOgIDA4OjIyLCBUaG9tYXMgUGVyYWxl
IDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+IGEgw6ljcml0IDoKPgo+IEhpIEZhYmllbiwKPgo+IFll
cyBpbmRlZWQsIHRoaXMgc2hvdWxkIGJlIGFkZGVkIGZvciBEZXBUcmFjayB1c2Vycy4gVGhhbmtz
IGZvciB0aGUgc3VibWlzc2lvbi4KPgo+IEluIHJlcGx5IG9mOgo+ID4gVGhlIEN5Y2xvbmVEWCAx
LjYgc3BlY2lmaWNhdGlvbiByZXF1aXJlcyB0aGF0IGVhY2ggQ1ZFIGluY2x1ZGUgYSAnc291cmNl
Jwo+Cj4gSSdtIG5vdCBzdXJlIGlmIHRoaXMgaXMgQ3ljbG9uZURYIHNwZWMgdGhhdCByZXF1aXJl
cyBpdCBvciBqdXN0IERlcFRyYWNrLgoKWW91IGFyZSBjb3JyZWN0IC0gYWZ0ZXIgY2hlY2tpbmcg
d2l0aCBzYm9tLXV0aWxpdHksIHRoZSAnc291cmNlJwphdHRyaWJ1dGUgaXMgbm90IG1hbmRhdG9y
eSBwZXIgdGhlIEN5Y2xvbmVEWCAxLjYgc2NoZW1hLgpUaGUgcmVxdWlyZW1lbnQgY29tZXMgZnJv
bSBEZXBlbmRlbmN5LVRyYWNrJ3MgVkVYIGltcG9ydGVyLgoKSSB3aWxsIHVwZGF0ZSBteSBjb21t
aXQgbWVzc2FnZQoKc2JvbS11dGlsaXR5IHZhbGlkYXRlIC1pIHNib21fd2l0aG91dF9zb3VyY2Uu
anNvbgpXZWxjb21lIHRvIHRoZSBzYm9tLXV0aWxpdHkhIFZlcnNpb24gJ3YwLjE4LjEnIChzYm9t
LXV0aWxpdHkpIChsaW51eC9hbWQ2NCkKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CltJTkZPXSBMb2FkaW5n
IChlbWJlZGRlZCkgZGVmYXVsdCBzY2hlbWEgY29uZmlnIGZpbGU6ICdjb25maWcuanNvbicuLi4K
W0lORk9dIExvYWRpbmcgKGVtYmVkZGVkKSBkZWZhdWx0IGxpY2Vuc2UgcG9saWN5IGZpbGU6ICds
aWNlbnNlLmpzb24nLi4uCltJTkZPXSBBdHRlbXB0aW5nIHRvIGxvYWQgYW5kIHVubWFyc2hhbCBk
YXRhIGZyb206ICdzYm9tX3dpdGhvdXRfc291cmNlLmpzb24nLi4uCltJTkZPXSBTdWNjZXNzZnVs
bHkgdW5tYXJzaGFsbGVkIGRhdGEgZnJvbTogJ3Nib21fd2l0aG91dF9zb3VyY2UuanNvbicKW0lO
Rk9dIERldGVybWluaW5nIGZpbGUncyBCT00gZm9ybWF0IGFuZCB2ZXJzaW9uLi4uCltJTkZPXSBE
ZXRlcm1pbmVkIEJPTSBmb3JtYXQsIHZlcnNpb24gKHZhcmlhbnQpOiAnQ3ljbG9uZURYJywgJzEu
NicgKGxhdGVzdCkKW0lORk9dIE1hdGNoaW5nIEJPTSBzY2hlbWEgKGZvciB2YWxpZGF0aW9uKToK
c2NoZW1hL2N5Y2xvbmVkeC8xLjYvYm9tLTEuNi5zY2hlbWEuanNvbgpbSU5GT10gTG9hZGluZyBz
Y2hlbWEgJ3NjaGVtYS9jeWNsb25lZHgvMS42L2JvbS0xLjYuc2NoZW1hLmpzb24nLi4uCltJTkZP
XSBGb3VuZCBzY2hlbWEgZGVwZW5kZW5jaWVzOiBbanNmLTAuODIuc2NoZW1hLmpzb24gc3BkeC5z
Y2hlbWEuanNvbl0KW0lORk9dIEFkZGVkIHNjaGVtYSAnc2NoZW1hL2N5Y2xvbmVkeC9jb21tb24v
anNmLTAuODIuc2NoZW1hLmpzb24nIHRvIGxvYWRlcjouLi4KW0lORk9dIEFkZGVkIHNjaGVtYSAn
c2NoZW1hL2N5Y2xvbmVkeC9jb21tb24vc3BkeC5zY2hlbWEuanNvbicgdG8gbG9hZGVyOi4uLgpb
SU5GT10gQ29tcGlsaW5nIHNjaGVtYTogJ3NjaGVtYS9jeWNsb25lZHgvMS42L2JvbS0xLjYuc2No
ZW1hLmpzb24nLi4uCltJTkZPXSBTY2hlbWEgJ3NjaGVtYS9jeWNsb25lZHgvMS42L2JvbS0xLjYu
c2NoZW1hLmpzb24nIGxvYWRlZApbSU5GT10gVmFsaWRhdGluZyAnc2JvbV93aXRob3V0X3NvdXJj
ZS5qc29uJy4uLgpbSU5GT10gQk9NIHZhbGlkIGFnYWluc3QgSlNPTiBzY2hlbWE6ICd0cnVlJwoK
PiA+IGF0dHJpYnV0ZSB0byBpZGVudGlmeSB0aGUgb3JpZ2luIG9mIHRoZSB2dWxuZXJhYmlsaXR5
IGluZm9ybWF0aW9uLgo+ID4gV2l0aG91dCB0aGlzIG1hbmRhdG9yeSBzb3VyY2UgYXR0cmlidXRl
LCBTQk9NIGZpbGVzIGNhbm5vdAo+ID4gYmUgcHJvcGVybHkgaW1wb3J0ZWQgYXMgVkVYIGludG8g
dnVsbmVyYWJpbGl0eSBtYW5hZ2VtZW50IHRvb2xzIGxpa2UKPiA+IERlcGVuZGVuY3ktVHJhY2su
Cj4gPgo+ID4gVGVzdCBFbnZpcm9ubWVudDoKPiA+IC0gQnVpbGRyb290OiAyMDI1LjAyLjEgKG9y
IG1hc3RlcikKPiA+IC0gRGVwZW5kZW5jeS1UcmFjazogdjQuMTMuNgo+ID4KPiA+IFRlc3QgUmVz
dWx0cyAtIEJFRk9SRSAod2l0aG91dCBzb3VyY2UgYXR0cmlidXRlKToKPiA+IGFwaXNlcnZlcl8x
ICB8IDIwMjYtMDItMjMgMTY6MDU6NDAsODkwIElORk8gW1ZleFVwbG9hZFByb2Nlc3NpbmdUYXNr
XSBQcm9jZXNzaW5nIEN5Y2xvbmVEWCBWRVggdXBsb2FkZWQgdG8gcHJvamVjdDogZTQzZmUxODUt
YzBhMy00ZTNhLWE5MDgtNjY3MzQ0YTY2YTljCj4gPiBhcGlzZXJ2ZXJfMSAgfCAyMDI2LTAyLTIz
IDE2OjA1OjQwLDk0MSBXQVJOIFtDeWNsb25lRFhWZXhJbXBvcnRlcl0gVkVYIHZ1bG5lcmFiaWxp
dHkgYXQgcG9zaXRpb24gIzAgZG9lcyBub3QgaGF2ZSBhbiBJRCBhbmQgLyBvciBzb3VyY2U7IFNr
aXBwaW5nIGl0Cj4gPiBhcGlzZXJ2ZXJfMSAgfCAyMDI2LTAyLTIzIDE2OjA1OjQwLDk0MSBXQVJO
IFtDeWNsb25lRFhWZXhJbXBvcnRlcl0gVkVYIHZ1bG5lcmFiaWxpdHkgYXQgcG9zaXRpb24gIzEg
ZG9lcyBub3QgaGF2ZSBhbiBJRCBhbmQgLyBvciBzb3VyY2U7IFNraXBwaW5nIGl0Cj4gPiAuLi4K
PiA+IGFwaXNlcnZlcl8xICB8IDIwMjYtMDItMjMgMTY6MDU6NDAsOTQxIFdBUk4gW0N5Y2xvbmVE
WFZleEltcG9ydGVyXSBWRVggdnVsbmVyYWJpbGl0eSBhdCBwb3NpdGlvbiAjMTkgZG9lcyBub3Qg
aGF2ZSBhbiBJRCBhbmQgLyBvciBzb3VyY2U7IFNraXBwaW5nIGl0Cj4gPiBhcGlzZXJ2ZXJfMSAg
fCAyMDI2LTAyLTIzIDE2OjA1OjQwLDk0MSBJTkZPIFtDeWNsb25lRFhWZXhJbXBvcnRlcl0gVGhl
IHVwbG9hZGVkIFZFWCBkb2VzIG5vdCBjb250YWluIGFueSBhcHBsaWNhYmxlIHZ1bG5lcmFiaWxp
dGllczsgU2tpcHBpbmcgVkVYIGltcG9ydAo+ID4KPiA+IFRlc3QgUmVzdWx0cyAtIEFGVEVSICh3
aXRoIHNvdXJjZSk6Cj4gPiBhcGlzZXJ2ZXJfMSAgfCAyMDI2LTAyLTIzIDE2OjE3OjEzLDQ5MiBJ
TkZPIFtWZXhVcGxvYWRQcm9jZXNzaW5nVGFza10gUHJvY2Vzc2luZyBDeWNsb25lRFggVkVYIHVw
bG9hZGVkIHRvIHByb2plY3Q6IGU0M2ZlMTg1LWMwYTMtNGUzYS1hOTA4LTY2NzM0NGE2NmE5Ywo+
ID4gYXBpc2VydmVyXzEgIHwgMjAyNi0wMi0yMyAxNjoxNzoxNCwwNTQgSU5GTyBbVmV4VXBsb2Fk
UHJvY2Vzc2luZ1Rhc2tdIENvbXBsZXRlZCBwcm9jZXNzaW5nIG9mIEN5Y2xvbmVEWCBWRVggZm9y
IHByb2plY3Q6IGU0M2ZlMTg1LWMwYTMtNGUzYS1hOTA4LTY2NzM0NGE2NmE5Ywo+ID4KPiA+IENW
RXMgYXJlIGNvcnJlY3RseSBmaWx0ZXJlZCBhbmQgaW1wb3J0ZWQgaW4gRGVwZW5kZW5jeS1UcmFj
awo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYmllbiBMZWhvdXNzZWwgPGZhYmllbi5sZWhvdXNz
ZWxAc21pbGUuZnI+Cj4KPiA+IC0tLQo+ID4gIHV0aWxzL2dlbmVyYXRlLWN5Y2xvbmVkeCB8IDQg
KysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvdXRpbHMvZ2VuZXJhdGUtY3ljbG9uZWR4IGIvdXRpbHMvZ2VuZXJhdGUtY3ljbG9uZWR4
Cj4gPiBpbmRleCAyYjZjNmQ2M2QzLi42MDA3YTZhNDAyIDEwMDc1NQo+ID4gLS0tIGEvdXRpbHMv
Z2VuZXJhdGUtY3ljbG9uZWR4Cj4gPiArKysgYi91dGlscy9nZW5lcmF0ZS1jeWNsb25lZHgKPiA+
IEBAIC0zMjcsNiArMzI3LDEwIEBAIGRlZiBjeWNsb25lZHhfdnVsbmVyYWJpbGl0aWVzKHNob3df
aW5mb19kaWN0KToKPiA+Cj4gPiAgICAgIHJldHVybiBbewo+ID4gICAgICAgICAgImlkIjogY3Zl
LAo+ID4gKyAgICAgICAgInNvdXJjZSI6IHsKPiA+ICsgICAgICAgICAgICAibmFtZSI6ICJOVkQi
LAo+ID4gKyAgICAgICAgICAgICJ1cmwiOiAiaHR0cHM6Ly9udmQubmlzdC5nb3YvIgo+Cj4gQW55
IHJlYXNvbiB0byBub3QgdXNlIHRoZSBmdWxsIFVSTCBsaWtlIHRoZSBleGFtcGxlIHByb3ZpZGVk
IG9uIHRoZSBzcGVjOgo+IGh0dHBzOi8vY3ljbG9uZWR4Lm9yZy9kb2NzLzEuNi9qc29uLyN2dWxu
ZXJhYmlsaXRpZXNfaXRlbXNfc291cmNlX3VybCA/Cj4gRG9lcyBEZXBUcmFjayBjb21wbGFpbnMg
aWYgdGhlIElEIGlzIHByb3ZpZGVkIGR1cmluZyB0aGUgaW1wb3J0ID8KCllvdSBhcmUgcmlnaHQs
IEkgd2FzIHVzaW5nIGFuIGluY29tcGxldGUgVVJMLgpJIHdpbGwgdXBkYXRlIHRoZSBwYXRjaCB0
byB1c2UgdGhlIGZ1bGwgVVJMIGZvcm1hdCBhcyBzcGVjaWZpZWQgaW4gdGhlCkN5Y2xvbmVEWCBk
b2N1bWVudGF0aW9uCgpJJ3ZlIHZlcmlmaWVkIHRoYXQgRGVwZW5kZW5jeS1UcmFjayBoYXMgbm8g
aXNzdWVzIGltcG9ydGluZyB3aXRoIHRoZQpjb21wbGV0ZSBVUkwuCgpJIHdpbGwgc2VuZCBhIHYy
IHdpdGggdGhvc2UgdHdvIG1vZGlmaWNhdGlvbnMgYXNhcC4KClRoYW5rcyBmb3IgdGhlIHJldmll
dy4KCkZhYmllbgoKCj4gPiArICAgICAgICB9LAo+ID4gICAgICAgICAgImFuYWx5c2lzIjogewo+
ID4gICAgICAgICAgICAgICJzdGF0ZSI6ICJyZXNvbHZlZF93aXRoX3BlZGlncmVlIiBpZiBjdmUg
aW4gVlVMTl9XSVRIX1BFRElHUkVFIGVsc2UgImluX3RyaWFnZSIsCj4gPiAgICAgICAgICAgICAg
ImRldGFpbCI6IGYiVGhlIENWRSAne2N2ZX0nIGhhcyBiZWVuIG1hcmtlZCBhcyBpZ25vcmVkIGJ5
IEJ1aWxkcm9vdCIKPiA+IC0tCj4gPiAyLjQzLjAKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
