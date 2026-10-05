Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955A8CA5FCE
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 12:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DC2D4055E;
	Mon,  5 Oct 2026 12:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xB5NkF5h9UJ; Mon,  5 Oct 2026 12:47:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4EBF840582
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791204465;
	b=KNB0VS4Se7qAFBPQfeF0el7ZlPImQurgB9xj0UFE4NcobGyNOpGLt+lIFKlopYvu1qUY
	 M7q0kdLt9FToR/sB8XlnDYVCz8uRLF9Km1EcjDmsvB2dQMuChhZpUR3VfLkBBcDZIG+1p
	 EX6ux9lwt8YNaNf2xViVMcHaRwGs8q4HPwvpEluOUrIL57Dmp5xeZDJ8Z5AVjrU2iIBov
	 AePp1V90JGEfdoijxj57dd0CbzspnHmulBDxzBcs+8LWgInBM34jfXjjeAZojx+HbpCmU
	 9xZ/+lEDwI4WFETpqnwZFFz8IlHlafzFvoVkD5tOBzOciM3dO2COqm2d+1grvMhrsng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791204465;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=+0X2deqQlAAsD8QzzxoNjSgqwE3aLzM+MGe5SdjSNmA=;
	b=iVtCp6RUvVkSiEhFDgTy79NxA/1SlhlFOk9eRYLMFrPYyhA95C8v6lbIKFKBTkFZsTlV
	 BZrrlFKKZ1hWVfjJTnFVjiBN1AoN8KF18L2lRH89r/efqFC1jxrrdeIU+Y+PuLL1GsDsp
	 3PJ4jncgg7XDSf/gHoN5znD/UAr7//Bvo54LmhuyFH9meD5nlaXAeJl6F7814OMnWATK4
	 0Vw9A/hW6RRAoQRQTFNgGofhONKDiKvmiWbTLhhepiBHdRIBGB/GnrvtPM7F1dMuhOzOA
	 dDD4iFpdNuj1OXrZTFhqn/JtTUCi8n9zV4Kh4spAn03c6PNgj1dHkX7WCEe2/LP1LaA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791204465;
	bh=+0X2deqQlAAsD8QzzxoNjSgqwE3aLzM+MGe5SdjSNmA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ftPH/2z0PmjScGupLr1C7AWmQxVYvLvBuKpjVNAPkd3rWTiHT12rY8qeUWbgkmWkK
	 Wsbn0L6jkvboJ9hvb4xv+BwEPLJxUrgslrYJ6551cDb5LwjdSSf342YcNC4ovj9d98
	 9wCYmGccRUkNHq4itW7ELtg+qqX99+27N3euEJQ28Gn9H2i4IkpEb3s63duBp9OIz/
	 scfjdYRF/0h7BiMAb/TtAGB90WfF4YpncJNMAEtnwHV7Ngn+OfRT9hI/5g2Ktlxxpl
	 RgsCT7YFUgmFm2MNqqc0Se7o5VuMjjnJm0ZqJqf6fZ3Oj5e6RkFvuG0XB3ZTYkz7Cy
	 xc2XQ9kg7tNww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EBF840582;
	Mon,  5 Oct 2026 12:47:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F03532F
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 12:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 451F28073B
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 12:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZzBfmnAu1d1J for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 12:47:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 531B4806D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791204461;
 b=AFkasrJhjq4uMtxVljvYpWRts0+u+GYq2r3I/vrnSTuM5AwnJ7ztpIx2XWQ0ceXHUjHY
 Z2vBr7Ij9KeKKimaQmLsvbWB9w9SG44xRFSHYy/H8VtvF0Rn+2D0CsjSWmc8CM6XITVgq
 q37CBw7JpHLJFDt8zC2ie7BkSXVbrkkJ/4d9zREdBYEhe8qJU4pHx0KmGCPico3suOcgJ
 CosKAu0qyiWmmn5ag2IOK9AVXMZHUz8dwwjaQB0BQlsjOqtWFDoxZkN18wU9a5MI1Lrxm
 +/OuoMLO6PDhZn3rJV+mP2y+nB7ujLajY1meDLCM2nWcaXUjOlK827XTqS0h+wPipmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791204461;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=izlNjShR7i1pc9Aq8atqdeq4XhI1qAq/eT+TPMjNI4A=;
 b=FLzlIeZOSaCRNt9I/uibi8b2SctATjNM9o2c0BnZ78JmuJ7aiMCIOXAo9qR/RE0wYtye
 Cciq6eWPbCVJ8AJcnkYjJf7U3NG4JVVg4vVB7KW0UlpPW/R7grvr83n6n+HYeuKKEe23z
 3ZuVuBVLdzPApruelqb66144fB7G3N3sKv+CbNHnsL8Pos27AeRaUcqLU8qvkjphVPQZ6
 0jGceUPYo9SwN/l03CSt/di7bmt3JHonutpYak5bUbdiQV3yWIK/8y6T/ZiGOkim1AfDa
 jpLxrb89rd96Wn0MN+RB2Z22sD28g5vt3IhAPDoNNAXRistCuiPRaT9FhkQYbCAyFdg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="UQM/cVo/"; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 531B4806D3
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 12:47:40 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-4a1706a2b24so7552325e9.1
 for <buildroot@buildroot.org>; Mon, 05 Oct 2026 05:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791204458; x=1791809258;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=izlNjShR7i1pc9Aq8atqdeq4XhI1qAq/eT+TPMjNI4A=;
 b=2tqRrSzBfq2dp/Q5P96VUSrcIUKxsdGRG46qwc6SXhiv2BPgcXp0QLsbmGOy/G+8Ux
 aXaBuIHEfL/wQ9K9l4Ay206uLS+kAcR7btNcCak0Ek8cxwk2VknQ7JgVil3KpmkMsgE9
 moIKbogdNtlxB47/G6lzGqNMfSgOmRk+MsW8yIxWUjiRRi2qzFyh43Nx0D5DLb1Xzr+f
 xrGP0g1N/3v+1WVN+DyOlXWAP3Cx1lXg8NR+Z5/t/zGQksDFITbnYjd4mBubqws8kDnf
 78VCCN4WvmZCtLiX72gHWkK3I4zhRvTURQh9yeUGmJEpVYWlobJR75kQF73TfjVu+fId
 qUdA==
X-Gm-Message-State: AFuF++nNQypl+BS0fddq//h7pKB+jUPN9j7oziw4g2bE/Bn5R1EiXYyX
 2I0Isnm8HLtXs/Jxe6hiROZkOq0/s3gdlkZORubgHR7mu1IoRhAcAZm8LOaS5RUqSUo=
X-Gm-Gg: AYBFou2sBL6icta5RIw+IUOeF91fVlKgZ9spsty5S5MNWguiVMkGBma9Jnbww7WXSD4
 TzwZTiJPeNQBdkQKS45hIkff4myzRXthLxBhqTQjGARKi6jo5dOLxpmKPRbvHV9XVQCV1kD9Ur8
 50cnCu9k3E3NVJhZ+ccB8zEaW1xY9+AVWRYEtkhPinUYeesvcI+YpM4xtdVNQutZtqAasj1K5FL
 HX8GoGGQW9sCf3GRNexVcNOv1pfYsdQlceUJ/j1bfTHs/06wpXwuRSedc+2EXZ6Ssv4jW1Wjmya
 uzhmRoBJapz7buyONXJNPp5laYjeQxKwJz59ee6pYXgf7OBQqV84bXU1Db14dtPsHLoX9MDJQSK
 AsfUJEQI6GdY0XdW92J67pM6WXbM2Rh4/87NFs3qnQwIJFegbXOpiPek6pwikMh2bRkNJlPo8ZS
 g44++AAVbq2PU6H6Qxm+RS8l4uR+mjiLKSNg659N09MeYkZa7EJW9E8V3ni2TNBylQ4WulNCTcI
 A==
X-Received: by 2002:a05:600c:3144:b0:4a0:1c0e:b2a8 with SMTP id
 5b1f17b1804b1-4a0275780d3mr169065745e9.28.1791204458644; 
 Mon, 05 Oct 2026 05:47:38 -0700 (PDT)
Received: from [10.140.0.3] ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0280c8bb0sm376252095e9.11.2026.10.05.05.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 05:47:38 -0700 (PDT)
Message-ID: <bf405ebf-ba9f-4033-8150-a5069ad151bb@mind.be>
Date: Mon, 5 Oct 2026 14:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
References: <20260930120101.474560-1-raphael.melotte@mind.be>
 <20260930120101.474560-2-raphael.melotte@mind.be> <asJzHhtAaiN13HMS@windsurf>
Content-Language: en-US
In-Reply-To: <asJzHhtAaiN13HMS@windsurf>
Subject: Re: [Buildroot] [PATCH 2/2] package/mupdf,
 python-pymupdf: bump to versions 1.28.5 and 1.28.2
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gMTAvNC8yNiA1OjQxIFBNLCBUaG9tYXMgUGV0YXp6b25pIHdyb3Rl
Ogo+IEhlbGxvIFJhcGhhw6tsLAo+IAo+IFdvdywgbG90cyBvZiB3b3JrIGhlcmUuIG11cGRmIHNl
ZW1zIHByZXR0eSBjcmF6eSB0byBidWlsZCwgYW5kIHRoZWlyCj4gdXNhZ2Ugb2YgY2xhbmcgZG9l
c24ndCBzZWVtIHRvIGJlIG1ha2luZyB0aGluZ3Mgc2ltcGxlLiBEbyB5b3UgZXhwZWN0Cj4gc29t
ZS9hbGwgb2YgeW91ciBwYXRjaGVzIHRvIGJlIG1lcmdlZD8KPiAKCkkgc3RpbGwgaG9wZSB0aGV5
IHdpbGwgYmUgZXZlbnR1YWxseSAoYXQgbGVhc3QgdGhlIG9uZXMgdGhhdCBmaXggYnVpbGQgaXNz
dWVzKSwgYnV0IGdpdmVuIHRoYXQgc29tZSBvZiB0aGVtIGFyZSBtb3JlIHRoYW4gYSB5ZWFyIG9s
ZCBJJ20gYWxzbyBub3QgdGhhdCBjb25maWRlbnQgdGhleSB3aWxsIGJlIHVuZm9ydHVuYXRlbHku
Cgo+IE1vcmUgY29tbWVudHMgYmVsb3cgKG5vdCBtYW55KS4KPiAKPiBPbiBXZWQsIFNlcCAzMCwg
MjAyNiBhdCAwMjowMDo1OFBNICswMjAwLCBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290
IHdyb3RlOgo+PiBSZWxlYXNlIG5vdGVzOgo+PiBodHRwczovL211cGRmLmNvbS9yZWxlYXNlcwo+
PiBodHRwczovL3B5bXVwZGYucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2NoYW5nZXMuaHRtbAo+
Pgo+PiBOb3RlIHRoYXQgdGhpcyBidW1wIGZpeGVzIG11bHRpcGxlIHNlY3VyaXR5IHZ1bG5lcmFi
aWxpdGllcywgYW5kIGF0Cj4+IGxlYXN0IHRoZSBmb2xsb3dpbmcgb25lczoKPj4gLSBDVkUtMjAy
NS00NjIwNgo+PiAtIENWRS0yMDI1LTcxMzgyCj4+IC0gQ1ZFLTIwMjYtNzIzMwo+PiAtIENWRS0y
MDI2LTQwNTA1Cj4gCj4gU28gc2hvdWxkIHRoaXMgY29tbWl0IGJlIHRpdGxlICJzZWN1cml0eSBi
dW1wIHRvIC4uLiIgPwo+IAoKSSBkaWQgbm90IHVzZSBpdCBiZWNhdXNlIG91ciBkb2N1bWVudGF0
aW9uIHNheXMgdG8gdXNlIGl0ICJJZiB0aGUgbmV3IHZlcnNpb24gb25seSBjb250YWlucyBzZWN1
cml0eSB1cGRhdGVzIGNvbXBhcmVkIHRvIHRoZSBleGlzdGluZyBvbmUiLgpJbiB0aGlzIGNhc2Ug
aXQncyBhIGJ1bXAgYWNyb3NzIHNldmVyYWwgbWFqb3IgcmVsZWFzZXMsIHNvIGl0IGRlZmluaXRl
bHkgY29udGFpbnMgbW9yZSB0aGFuIHNlY3VyaXR5IHVwZGF0ZXMuCgpUaGF0IHNhaWQgSSBkb24n
dCBtaW5kIHVwZGF0aW5nIHRoZSBjb21taXQgdGl0bGUgdG8gdXNlIGl0IGlmIGl0J3MgcHJlZmVy
YWJsZS4KCj4+ICAgCXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1NXSUcKPj4gICAJc2VsZWN0IEJS
Ml9QQUNLQUdFX0ZSRUVUWVBFCj4+ICAgCXNlbGVjdCBCUjJfUEFDS0FHRV9NVVBERgo+PiArCXNl
bGVjdCBCUjJfUEFDS0FHRV9NVVBERl9QWVRIT05fQklORElOR1MKPj4gKwlzZWxlY3QgQlIyX1BB
Q0tBR0VfUFlUSE9OX1BJUENMCj4gCj4gQXMgSSByZXBvcnRlZCBpbiBteSByZXZpZXcgb2YgdGhl
IHByZXZpb3VzIHBhdGNoLCB0aGlzIG9wdGlvbiBleGlzdHMKPiBidXQgZG9lc24ndCBkbyBhbnl0
aGluZyBhcyBweXRob24tcGlwY2wgZG9lc24ndCBleGlzdCBhcyBhIHRhcmdldAo+IHBhY2thZ2Uu
IEkgYXNzdW1lIHRoaXMgY2FuIGJlIGRyb3BwZWQ/Cj4gCgpZZXMgaW5kZWVkLCBJJ2xsIGRvIHRo
YXQgaW4gYSB2Mi4KCj4gVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrIQo+IAo+IFRob21hcwoKClRo
YW5rcywKClJhcGhhw6tsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
