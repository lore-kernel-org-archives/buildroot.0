Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F24D149F2
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 21:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E532381E84;
	Fri, 25 Oct 2024 21:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVGqlzt2dsn7; Fri, 25 Oct 2024 21:19:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DED7281E7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DED7281E7B;
	Fri, 25 Oct 2024 21:19:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F8792318
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D10340FC3
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CUalGbq_l4v1 for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 21:19:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F27AE40FB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F27AE40FB6
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F27AE40FB6
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:19:34 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2e56750bb0dso1815935a91.0
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729891174; x=1730495974;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gTFUuUsx0w2vwQL2aaFAPImcd2dUVqOsgiRc4EhGnls=;
 b=g76FCPMpiE+lFPo75+731NjJJP99JLok/10GmwCyJ0FYUbVWURvXDEXi7KTtZ1q8pK
 Mr8WRZPGW8piuhK6nW6cO/0+6K0ge+enWQv/kOgeEJH5XCi9o8d+iMba5klIEVBGs5hI
 uSIRbXMnAv8kuH7TK7nJ3VU1q/iAKd0Ba3U8nWTpUlFZB5uAX9woByGlos6QJgYUCF/t
 ekUmkCua1IFaye5tG3s+IqtxOssdeUEqNN6S+dQSirWf4n4Yu41BtXeUn2Dpt6524YTI
 mPdYwjj2nw6vftG43Lv781mIGjQZ0nkMA1YeBXrb1C4rvD4PNQpfR7W74YaUwOHwONwm
 jZ9w==
X-Gm-Message-State: AOJu0Yz1mo/nbxro9GinUTmZTsNwjBHLgtTV0k75eWkQRBZqASHsdBAZ
 1dE2i1wXzC4lB0Tgfk6vT639dIAOBfpO944oW4e3IB0R2CL1G28S8HG+4dEQGJ4C+FnMydzvk3e
 PjvoAZRHxokFHeYTvUjjhD6ML8W6E3FggRne2jA==
X-Google-Smtp-Source: AGHT+IGLLhfb/WqX5Cw9dMU475zCW43cHk4gxuHBaMIUxEtpHh7X7lVzFA5PewPfqWHoXfgD25ZBILdCnwGI0P4prsE=
X-Received: by 2002:a17:90a:34cb:b0:2e2:e597:6cd3 with SMTP id
 98e67ed59e1d1-2e8f10731bbmr771596a91.17.1729891173616; Fri, 25 Oct 2024
 14:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <ZwuMDPcgFOLNVRqn@landeda>
In-Reply-To: <ZwuMDPcgFOLNVRqn@landeda>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 25 Oct 2024 23:19:21 +0200
Message-ID: <CAOf5uwksyaoj1ufaFdScZUk-TOmVOUpbsh5SVCcUQfiQ1qpF5w@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Buildroot ML <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1729891174; x=1730495974;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gTFUuUsx0w2vwQL2aaFAPImcd2dUVqOsgiRc4EhGnls=;
 b=ICH86SbN1AveIKdCciPojPWLqND2gWKLexrnl/utmmoMa0WziC7BLq5aT+40WrToKR
 CB6Tp5IsQNnLXiZTYuat9Ga4pSx9sPhkQEiw/I/ICGQrAwYhmHyJ868N8SJboOsHBlBM
 1BO8gk3BUJxjisI0FLt/dtms7AseW/w+NXx4M=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ICH86SbN
Subject: Re: [Buildroot] Resigning as a maintainer
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

SGkgWWFubgoKT24gU3VuLCBPY3QgMTMsIDIwMjQgYXQgMTE6MDDigK9BTSBZYW5uIEUuIE1PUklO
IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4KPiBIZWxsbyBBbGwsCj4KPiBFdmVu
dHMgYW5kIGNoYW5nZXMsIG1vcmUgb3IgbGVzcyByZWNlbnQsIGJvdGggb3JnYW5pc2F0aW9uYWwg
YW5kCj4gdGVjaG5pY2FsLCBoYXZlIG1hZGUgbWUgcmVjb25zaWRlciB3aGV0aGVyIEkgc2hvdWxk
IGNvbnRpbnVlCj4gY29udHJpYnV0aW5nLCBpbnRlcmFjdGluZyB3aXRoIHRoZSBjb21tdW5pdHks
IGFuZCBiZWluZyBhIG1haW50YWluZXIuCj4KClllcyB5b3Ugc2hvdWxkIDspLiBJIG1lYW4gd2Ug
cmVhbGx5IGxvdmUgeW91ciB3b3JrIGFuZCB3ZSB0aGluayB0aGF0CnlvdSBoYXZlIGEgcmVhbCB2
YWx1ZQppbiB0aGUgY29tbXVuaXR5Cgo+IEkndmUgdGhvdWdodCBhYm91dCBpdCBxdWl0ZSBhIGJp
dCwgZm9yIHF1aXRlIHNvbWUgdGltZSBub3csIGFuZCBJCj4gc2VlIG5vdyB0aGF0IG1lcmVseSBh
c2tpbmcgdGhlIHF1ZXN0aW9uIGJlZ3Mgb25seSBvbmUgcG9zc2libGUKPiBhbnN3ZXI6IG5vLgo+
CgpXZWxsLCB0aGluZ3MgaW4gdGhlIHByb2plY3QgYXJlIGNoYW5naW5nIGFuZCB3b3VsZCBiZSBu
aWNlIHRvIGhhdmUgaXQgdW5kZXIKYSBmb3VuZGF0aW9uLiBUaGVyZSB3aWxsIGJlIGNoYWxsZW5n
ZSBpbiBzZWN1cml0eSBpbiBuZXh0IHllYXJzIGFuZCBJIHRoaW5rIHRoYXQKeW91IGNhbiBwbGF5
IHlvdXIgcm9sZSBoZXJlLgoKSSByZWFsbHkgbWlzcyB5b3VyIGNvbW1lbnQgaW4gbWFpbGluZyBs
aXN0LCBldmVuIEknbSBub3Qgc28gYWN0aXZlIEkgYWx3YXlzIHJlYWQKcmV2aWV3IGFuZCBob3cg
cGF0Y2ggYXJlIHByb2Nlc3NlZAoKTWljaGFlbAoKPiBBcyBhIGNvbnNlcXVlbmNlLCBJIGhhdmUg
cmVzaWduZWQgZnJvbSBteSBwb3NpdGlvbiBhcyBhIG1haW50YWluZXIuIFRoZQo+IG90aGVyIG1h
aW50YWluZXJzIGhhdmUgYmVlbiBpbmZvcm1lZCBvZiBteSBkZWNpc2lvbiBhIGZldyBkYXlzIGFn
byBub3cuCj4KPiBBcyBmb3IgY29udHJpYnV0aW5nLCBJIGRvbid0IHNlZSBob3cgdGhlIHRpbWUg
SSB3aWxsIHJlZ2FpbiBmcm9tIG5vCj4gbG9uZ2VyIGJlaW5nIGEgbWFpbnRhaW5lciwgY291bGQg
YmUgYXBwbGllZCB0byBicmluZyBpbiBldm9sdXRpb25zIHRvCj4gQnVpbGRyb290IGdpdmVuIHRo
ZSBjaXJjdW1zdGFuY2VzLgo+Cj4gRm9yIHRoZSB0aW1lIGJlaW5nLCBJIGhhdmUgbm8gaWRlYSB3
aGF0IHdpbGwgcmVwbGFjZSB0aGUgbWFueSBob3Vycwo+IGEgd2VlayBJIHdhcyBzcGVuZGluZyBv
biBCdWlsZHJvb3Qgb24gbXkgb3duIHRpbWU7IG1heWJlIGEgZnV0dXJlCj4gcGVyc29uYWwgcHJv
amVjdCB3aWxsIHJlcXVpcmUgdGhhdCBJIHVzZSBCdWlsZHJvb3QgYWdhaW4sIGJ1dCB1bnRpbAo+
IHRoZW4sIEkgd2lsbCBubyBsb25nZXIgYmUgYW4gYWN0aXZlIGNvbnRyaWJ1dG9yIGVpdGhlci4K
Pgo+IEkgd2lsbCBzdGlsbCBrZWVwIG15IGVudHJpZXMgaW4gdGhlIERFVkVMT1BFUlMgZmlsZSBm
b3IgYSB3aGlsZSwgc28gdGhhdAo+IEkgY2FuIGF0IGxlYXN0IHRyeSBhbmQgaGVscCBmaXggdGhl
IG1lc3MgSSBsZWF2ZSBiZWhpbmQgbWUuCj4KPiBJIGFtIGdyYXRlZnVsIHRvIGFsbCB0aGUgY29u
dHJpYnV0b3JzLCBwYXN0IGFuZCBwcmVzZW50LCBmb3IgdGhlIG1hbnkKPiB5ZWFycyB3ZSd2ZSBi
ZWVuIGFsbCB0b2dldGhlciB3b3JraW5nIHRvd2FyZCBtYWtpbmcgQnVpbGRyb290IGJldHRlciwK
PiBhbmQgYnVpbGRpbmcgYSBncmVhdCBjb21tdW5pdHk7IEkndmUgbGVhcm5lZCBhIGxvdCBhbG9u
ZyB0aGUgcmlkZS4KPiBJIHdpc2ggeW91IGFsbCB0aGUgYmVzdCB3aXRoIHlvdXIgY29udGludWVk
IHVzZSBvZiBCdWlsZHJvb3QgYW5kIHlvdXIKPiBmdXR1cmUgY29udHJpYnV0aW9ucyEKPgo+IFBl
dGVyLCBUaG9tYXMsIEFybm91dCwgUm9tYWluOiBJIHdpc2ggeW91IGFsbCB0aGUgYmVzdCBpbiB5
b3VyIGZ1dHVyZQo+IGVuZGVhdm91cnMgd2l0aCBCdWlsZHJvb3QgbWFpbnRlbmFuY2UuCj4KPiBT
byBsb25nLCBhbmQgdGhhbmtzIGZvciBhbGwgdGhlIGZpc2guCj4KPiBSZWdhcmRzLAo+IFlhbm4g
RS4gTU9SSU4uCj4KPiBQLlMuIFRvIGF2b2lkIGFueSBmdXR1cmUgY29uZnVzaW9uOiB0aGlzIGlz
IG15IG93biBwZXJzb25hbCBwb3NpdGlvbiBhbmQKPiBkZWNpc2lvbiwgYW5kIGhhcyBubyBjb25u
ZWN0aW9uIHRvIG15IHByb2Zlc3Npb25hbCBhY3Rpdml0aWVzIHRoYXQgbWF5Cj4gYmUgcmVsYXRl
ZCB0byBCdWlsZHJvb3QuCj4KPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFu
biBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJp
Y3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25l
ciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAw
OTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRo
ZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0t
LS0tLS0tJwo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgoKCi0t
IApNaWNoYWVsIE5henphcmVubyBUcmltYXJjaGkKQ28tRm91bmRlciAmIENoaWVmIEV4ZWN1dGl2
ZSBPZmZpY2VyCk0uICszOSAzNDcgOTEzIDIxNzAKbWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgpBbWFydWxhIFNvbHV0aW9ucyBC
VgpKb29wIEdlZXNpbmt3ZWcgMTI1LCAxMTE0IEFCLCBBbXN0ZXJkYW0sIE5MClQuICszMSAoMCk4
NSAxMTEgOTE3MgppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCnd3dy5hbWFydWxhc29sdXRpb25z
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
