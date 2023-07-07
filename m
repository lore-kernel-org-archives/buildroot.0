Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F56EB64D9
	for <buildroot@archiver.kernel.org>; Fri,  7 Jul 2023 07:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28295405A8;
	Fri,  7 Jul 2023 07:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28295405A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxWm1qUXnTMg; Fri,  7 Jul 2023 07:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6149040374;
	Fri,  7 Jul 2023 07:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6149040374
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A5371BF255
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 07:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 537D681F70
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 07:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 537D681F70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SUNpvHZErI_X for <buildroot@lists.busybox.net>;
 Fri,  7 Jul 2023 07:10:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01EBE81F46
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01EBE81F46
 for <buildroot@buildroot.org>; Fri,  7 Jul 2023 07:10:20 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-51e429e1eabso165109a12.2
 for <buildroot@buildroot.org>; Fri, 07 Jul 2023 00:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688713819; x=1691305819;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zQ1nOfv7lD6Gm5nOiJB6AIZ6aNkTkhTKmNvo9A+h/wI=;
 b=AsJpxCAU5R/WFJyu/JVlYsrwnMM7CxWhdLVF4SHwLmo2V5vYD0aV0i7mZeF0uWWZfz
 ratrSmxYyxeGtPECPPiwt9asD/IgnWR0INoV/3RcTaCWiWvYWun4a9u24e/6jVAzN9+B
 q+rrusGTIHn77ietSXe3RKnvr3tljFe7nbyag6BLBiKOXM6/IFReSgBo31zVLQxX2R48
 tcPjY7s5eZyGT9miavbqhL0ZNkl9LksswEW5rxV745FS+KGlEfToWLKCORMHyWvqcEgt
 pYfumXz7fzEJEU47xahS9320MDPWvjhbUgcOqd7f/XyPeKVaJlGItKqWhK+oMqiKJK+5
 v9IQ==
X-Gm-Message-State: ABy/qLZiLOikensrtZOrxxE4CrF6jlB3pM9SNkdy2nI+jOed9I5T45Va
 70nZqqXYYvI540iMwi16224hrByFTp2jne2hJwY=
X-Google-Smtp-Source: APBJJlF3+gqGwQFz8ebxtO4BPmtCkUQofscz8RsmEIKYwxA4hfFUg8dXdThKXXnxaxvwDdHzSRdrIw==
X-Received: by 2002:aa7:ca57:0:b0:51d:e30c:b01d with SMTP id
 j23-20020aa7ca57000000b0051de30cb01dmr2151134edt.24.1688713819033; 
 Fri, 07 Jul 2023 00:10:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 w23-20020aa7da57000000b0051debcb1fa2sm1655123eds.69.2023.07.07.00.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 00:10:18 -0700 (PDT)
Message-ID: <53bb1b26-b204-c2f8-952f-6cb39425104b@mind.be>
Date: Fri, 7 Jul 2023 09:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
References: <CAOf5uwmYNk+28CEYS-_tcGWVsw7-pWYCY2YCJXQzuijep5A5eg@mail.gmail.com>
 <eb58a86c-4792-fc4c-cdfa-42487c3347c4@mind.be>
 <CAOf5uw=wGxZAF6JA8wRdvv7Bhgi_HVEOnXrk2TRbmgkBzCPWUg@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAOf5uw=wGxZAF6JA8wRdvv7Bhgi_HVEOnXrk2TRbmgkBzCPWUg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1688713819; x=1691305819;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zQ1nOfv7lD6Gm5nOiJB6AIZ6aNkTkhTKmNvo9A+h/wI=;
 b=Ub8F2eHQA0wWinatO/63C/VGER+OFS++yQzQFqMaM+qxUbOdsKziokWA0/2bNBympj
 94cNz0jBKKU8xWHG/xTqA/ltLtF5gDctW0GceVelk/gXTS+X7dQ3oW+SWTFy1XOBfPnL
 8DtIGBUKNGn1byULwilS1VY8TES+VuVKRDqoDA6gRJ3PFvcnbsY0+JwJG08QTduFQlSC
 xqYI0b5v21CMjBCv0lJhESv2EOR2IV+SdpBYTdgN3DACXnGSANm5I1luQK0kjZeLJSVq
 mNt0xi+WLWEEyyAhR9EjC/eTniXcsg+Q0frrdRo8X7CmyrKzn1NPsmkijzs1KPl1D9YV
 iUgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ub8F2eHQ
Subject: Re: [Buildroot] external toolchain license collection
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNi8wNy8yMDIzIDIzOjA4LCBNaWNoYWVsIE5henphcmVubyBUcmltYXJjaGkgd3JvdGU6
Cj4gSGkKPiAKPiBJbCBnaW8gNiBsdWcgMjAyMywgMjE6MTggQXJub3V0IFZhbmRlY2FwcGVsbGUg
PGFybm91dEBtaW5kLmJlIAo+IDxtYWlsdG86YXJub3V0QG1pbmQuYmU+PiBoYSBzY3JpdHRvOgo+
IAo+IAo+IAo+ICAgICBPbiAwNS8wNy8yMDIzIDEyOjA4LCBNaWNoYWVsIE5henphcmVubyBUcmlt
YXJjaGkgd3JvdGU6Cj4gICAgICA+IEhpIGFsbAo+ICAgICAgPgo+ICAgICAgPiBJcyB0aGVyZSBh
IHdheSB0byBjb2xsZWN0IHRoZSBsaWNlbnNlIG9mIGFuIGV4dGVybmFsIHRvb2xjaGFpbiBhbmQg
cHV0Cj4gICAgICA+IGl0IGluIHRoZSBidWlsZHJvb3QgYnVuZGxlPwo+ICAgICAgPiBGb3IgaW5z
dGFuY2Ugd2UgaGF2ZSBzb21lIHBhY2thZ2VzIGxpa2UgbGlidWNsaWMgYW5kIG90aGVyIGxpYnJh
cmllcwo+ICAgICAgPiB0aGF0IGFyZSBwdXQgaW4gdGhlIHRhcmdldCBidXQgZXZlbiB0aG9zZSBs
aWNlbnNlcyBzaG91bGQgYXBwZWFyLiBJcwo+ICAgICAgPiBzb21ldGhpbmcgSSBtaXNzPwo+IAo+
ICAgICAgwqAgRm9yIHRoZSBleGlzdGluZyBwcmVkZWZpbmVkIGV4dGVybmFsIHRvb2xjaGFpbnMg
d2UgaW5kZWVkIGRvbid0IGhhdmUgYW55Cj4gICAgIGxpY2Vuc2UgaW5mb3JtYXRpb24uIEZvciBh
IGN1c3RvbSBleHRlcm5hbCB0b29sY2hhaW4gdGhhdCB5b3Ugc3BlY2lmeSB0aHJvdWdoCj4gICAg
IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQ1VTVE9NXyogdGhlcmUncyBubyB3YXkgdG8gc3BlY2lm
eSBpdCBlaXRoZXIuCj4gICAgIEhvd2V2ZXIsIGlmCj4gICAgIHlvdSBjcmVhdGUgeW91ciBvd24g
cHJlZGVmaW5lZCB0b29sY2hhaW4gaW4gYSBCUjJfRVhURVJOQUwsIHlvdSBjYW4gc2V0IGl0cwo+
ICAgICBfTElDRU5TRSBhbmQgX0xJQ0VOU0VfRklMRVMgYW5kIHRoYXQgc2hvdWxkIHdvcmsuIE1h
a2Ugc3VyZSB5b3UgYWxzbyBzZXQKPiAgICAgX0FDVFVBTF9TT1VSQ0VfVEFSQkFMTC4gTm90ZSB0
aGF0IHRoZSBsaWNlbnNlIGZpbGVzIGFyZSBmZXRjaGVkIGZyb20gdGhlCj4gICAgIF9TT1VSQ0Us
IG5vdCB0aGUgX0FDVFVBTF9TT1VSQ0VfVEFSQkFMTC4KPiAKPiAgICAgIMKgIEl0IHdvdWxkIGJl
IGdvb2QgaWYgd2Ugd291bGQgYWRkIF9MSUNFTlNFIGFuZCBfTElDRU5TRV9GSUxFUyBmb3IgdGhl
Cj4gICAgIHByZWRlZmluZWQgdG9vbGNoYWlucy4KPiAKPiAKPiBSZWFkIGl0IGFuZCBzaG91bGQg
d29yaywgdGhlIG9ubHkgcHJvYmxlbSBJIGNhbiBzZWUgdG8gYmUgZnVsbHkgY29tcGxpYW50IGlz
IHRvIAo+IGRlbGl2ZXJ5IGJ1aWxkIGFuZCBpbnN0YWxsYXRpb24gc2NyaXB0LiBJIHRoaW5rIHRo
aXMgY2FuIGJlIGRvbmUgb25seSBidWlsZGluZyAKPiB0b29sY2hhaW4gZnJvbSBidWlsZHJvb3Qu
IEkgZG9uJ3QgcmVhbGx5IGhvdyB0aGlzIGlzIGhhbmRsZSBsZWdhbGx5IHdoZW4gcGVvcGxlIAo+
IHVzZSB0b29sY2hhaW4gYnVpbHQgYnkgb3RoZXJzCgogIFllYWgsIHRoYXQncyB3aHkgd2UgdGhp
bmsgdGhhdCBpZiB5b3UgYnVpbGQgc29tZXRoaW5nIHdpdGggQnVpbGRyb290IGFuZCAKdGhlcmUn
cyBzb21ldGhpbmcgR1BMIGluIGl0LCB0aGF0IEJ1aWxkcm9vdCBpdHNlbGYgYmVjb21lcyBwYXJ0
IG9mIHRoZSAiYnVpbGQgCmFuZCBpbnN0YWxsYXRpb24gc2NyaXB0cyIgYW5kIHRoZXJlZm9yZSBz
aG91bGQgYmUgbWFkZSBhdmFpbGFibGUgYXMgd2VsbC4gQW5kIAppdCdzIGEgYml0IHVuZm9ydHVu
YXRlIHRoYXQgd2UgZG9uJ3QgY3JlYXRlIHRoYXQgYnVpbGRyb290IHRhcmJhbGwgYXMgcGFydCBv
ZiAKJ21ha2UgbGVnYWwtaW5mbycuLi4KCiAgSSBkbyBiZWxpZXZlLCBob3dldmVyLCB0aGF0IG1v
c3QgZXh0ZXJuYWwgdG9vbGNoYWlucyAobm90IGJ1aWx0IHdpdGggCkJ1aWxkcm9vdCkgdGhhdCBw
cm92aWRlIGEgc291cmNlIHRhcmJhbGwgYWxzbyBpbmNsdWRlIGEgbWFzdGVyIHNjcmlwdCB0aGF0
IGp1c3QgCmV4ZWN1dGVzIGNvbmZpZ3VyZSBhbmQgbWFrZS4KCiAgUmVnYXJkcywKICBBcm5vdXQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
