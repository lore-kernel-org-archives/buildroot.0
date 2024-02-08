Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7F6C48260
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 21:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6263A8432F;
	Thu,  8 Feb 2024 21:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mgA0EmCaWlvs; Thu,  8 Feb 2024 21:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 607A384336
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 607A384336;
	Thu,  8 Feb 2024 21:29:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B83EB1BF30D
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 21:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0FC340612
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 21:29:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id biZfsmQt4RRu for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 21:29:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4975A404D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4975A404D1
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4975A404D1
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 21:29:28 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4101565d20bso2580025e9.2
 for <buildroot@buildroot.org>; Thu, 08 Feb 2024 13:29:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707427767; x=1708032567;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gVlcmzlENl2dPIDat6uTxay4seev0OCgOLJzYq6zZTQ=;
 b=spoQvxdq0BXpDFQzd8PT3eZAPqsrmwgaxtBb+4kdvBlzW586O99ta3yc4/nmaP0Tm2
 rqyehY0EWm5CQRlWOPE85ngmQwD2kVMlVZCrtd8orfTVGGOXXJQCjy4uLdjEMX5/K0xJ
 miGthVIXeJ7X9sLzSo7eNJ2ADwqAYZ9y5g5dk2wSrXMPaEGTvvV/R8Kuz4FrrxPpDUDu
 jRKrMJPsuk/lx4rYYM2r0iKzDuyWB1l9w6m2M5lU2d2W5PMGOrOQnZYD7Y2DSsYHEiNs
 3l3TIcx4b5+TN7RYF9PJWBrBhg5g0utDzr3dDc0pDmDciy+G38BcwweZWQuI0lS8TBgN
 NlEg==
X-Gm-Message-State: AOJu0YzgA6HNK3xpr6LwT4y8ju2RU8ky5TxlHM0i3X/2J0PqMQMY0vJb
 7BSNraHvUZzCd4wLFHDIr11uk4m2qO7kOSkVos0SlY5gwXayiI/e32tVSJDgPzM=
X-Google-Smtp-Source: AGHT+IFqqUclqagKw32BXNM79ypznvzy63bd/cVQzlaTVm0yf/1S5STIdXT440UU1hyjrJASnnxAMQ==
X-Received: by 2002:a05:600c:4509:b0:410:1da3:2ccf with SMTP id
 t9-20020a05600c450900b004101da32ccfmr364007wmo.21.1707427767044; 
 Thu, 08 Feb 2024 13:29:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVrDVLShsOI/c6c//gzZaLlQL2gRouMvEkcV86bfPlcZ5yJT4TzfWJdRWIXaMlAV9yA+er27FvsFYt6mtO/c6qZ004mN9lpEUNqSv9fX4yTkO3azily3vrzvCO+vqXgNz0YmQ9sRe3iLs1AAHS8AByyY/lkdi2kqo12NOe0LEDwpX+iZVyzbnmbWKDol63EdRG6Lnf+VUZ0IhYHzPLH8Nr3Ig==
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a05600c4ecd00b0040fddaf9ff4sm501125wmq.40.2024.02.08.13.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 13:29:26 -0800 (PST)
Message-ID: <269f1999-249c-4ede-82a6-6240bc36dbdd@mind.be>
Date: Thu, 8 Feb 2024 22:29:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240110093850.2302133-1-james.hilliard1@gmail.com>
 <20240110093850.2302133-6-james.hilliard1@gmail.com>
 <454a12aa-fe40-4435-8c6e-5f020d960bb5@mind.be>
In-Reply-To: <454a12aa-fe40-4435-8c6e-5f020d960bb5@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707427767; x=1708032567; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gVlcmzlENl2dPIDat6uTxay4seev0OCgOLJzYq6zZTQ=;
 b=hKihOaPOpxgZ6NedV5GMWHrcgT0c7GrlF6+I8GQWpVHV9uH4NOH/YmUKrOgdTO5MTZ
 ZnwwKyDxRzY9T30EeF9BTZDwyc+WgI5JEX4hQ1lslV4DqGpj2fLGF6LdV209iFPVKVWN
 jmFCCKzK0k3NQ6268/bLttbjB1IFb75LutKp+hJZ3Wwiu/ZZ97AmlLu2HEtZrK739rf3
 LMHgtsjzG4eIQCDh6i37VsxyehITyWMS1jv6bTC+5WVLfObpEGCD1oRQBdCH1NsMxjX5
 0VARrXRVPdd/Eh8/Tkw5WAut0dVVqGVEV90zHsDgcwLOe1ZF/froPwReBlocxoy1K0w1
 BAEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hKihOaPO
Subject: Re: [Buildroot] [PATCH 6/6] package/python-pymupdf: bump to version
 1.23.9rc2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBSYXBoYWXMiGwsCgpPbiAwOC8wMi8yMDI0IDEyOjI4LCBSYXBoYcOrbCBNw6lsb3R0ZSB2
aWEgYnVpbGRyb290IHdyb3RlOgo+IEhpIEphbWVzLCBhbGwsCj4gCj4gVGhhbmtzIGZvciB0aGUg
cGF0Y2hlcyEKPiBJIGFkZGVkIGEgZmV3IGNvbW1lbnRzL3F1ZXN0aW9ucyBiZWxvdy4KCiAgWW91
ciBjb21tZW50cyBhY3R1YWxseSBzb3VuZCBwcmV0dHkgZXNzZW50aWFsLCBhbmQgSSB0aGluayB0
aGV5IGFmZmVjdCB0aGUgCmVhcmxpZXIgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzIGFzIHdlbGwuIFNo
b3VsZCBJIG1hcmsgdGhlIGVudGlyZSBzZXJpZXMgYXMgCkNoYW5nZXMgUmVxdWVzdGVkPwoKICBB
bHNvLCB3aWxsIHlvdSB3b3JrIG9uIGZpeGluZyB0aGUgaXNzdWVzIG9yIHNob3VsZCBKYW1lcyB0
YWtlIGl0IG9uPwoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiBPbiAxLzEwLzI0IDEwOjM4LCBK
YW1lcyBIaWxsaWFyZCB3cm90ZToKPj4gTWlncmF0ZSB0byBpbiB0cmVlIHBlcDUxNyBiYXNlZCBi
dWlsZCBiYWNrZW5kLgo+Pgo+IAo+IERvZXMgdGhpcyBuZXcgdmVyc2lvbiBjcm9zcy1jb21waWxl
IGZvciB5b3U/Cj4gSSBnZXQgdGhlIGZvbGxvd2luZyBlcnJvciBiZWNhdXNlIHRoZSB3cm9uZyBw
eXRob24tY29uZmlnIGlzIHVzZWQgKEkgb25seSAKPiBicmllZmx5IHRyaWVkIGFybXY1IHNvIGZh
cik6Cj4gCj4gZXJyb3I6ICNlcnJvciAiTE9OR19CSVQgZGVmaW5pdGlvbiBhcHBlYXJzIHdyb25n
IGZvciBwbGF0Zm9ybSAoYmFkIGdjYy9nbGliYyAKPiBjb25maWc/KS4iCj4gCj4+IE5vdGUgdGhh
dCB2ZXJzaW9uIDEuMjMuOCBpcyBub3QgY29tcGF0aWJsZSB3aXRoIG11cGRmIDEuMjMuOCBkdWUg
dG8KPj4gaGVhZGVyIGNvbmZsaWN0IGJ1Z3MgdGhhdCB3ZXJlIGZpeGVkIGFmdGVyIHRoZSAxLjIz
LjggcmVsZWFzZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+Cj4+IC0tLQo+PiDCoCBwYWNrYWdlL3B5dGhvbi1weW11cGRmL3B5
dGhvbi1weW11cGRmLmhhc2ggfMKgIDQgKy0tCj4+IMKgIHBhY2thZ2UvcHl0aG9uLXB5bXVwZGYv
cHl0aG9uLXB5bXVwZGYubWvCoMKgIHwgMzMgKysrKysrKysrKysrLS0tLS0tLS0tLQo+PiDCoCAy
IGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcHltdXBkZi9weXRob24tcHltdXBkZi5oYXNoIAo+
PiBiL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvcHl0aG9uLXB5bXVwZGYuaGFzaAo+PiBpbmRleCA5
ZmQ4MTUwMDg4Li5lNTc2NTJhYjY5IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1weW11
cGRmL3B5dGhvbi1weW11cGRmLmhhc2gKPj4gKysrIGIvcGFja2FnZS9weXRob24tcHltdXBkZi9w
eXRob24tcHltdXBkZi5oYXNoCj4+IEBAIC0xLDUgKzEsNSBAQAo+PiDCoCAjIG1kNSwgc2hhMjU2
IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL3B5bXVwZGYvanNvbgo+PiAtbWQ1wqAgNDY4ZmU1
NjM3NWExZmNhOTllODNmZTBhYTBiOWY4YmTCoCBQeU11UERGLTEuMjIuMC50YXIuZ3oKPj4gLXNo
YTI1NsKgIDZlMTY5NGU1YzBjZDhiOTJkNTAzYTUwNmVlOGU0YmExYmVkNzY4NTI4ZGU1ODY4ODlk
M2VjOTBlOWRjNGE3ZDMgIAo+PiBQeU11UERGLTEuMjIuMC50YXIuZ3oKPj4gK21kNcKgIGViMGI2
NWVhYTA2M2MyNDE3ZDg5YzU0NTNlN2M4MmFkwqAgUHlNdVBERi0xLjIzLjlyYzIudGFyLmd6Cj4+
ICtzaGEyNTbCoCBiYTZmZGQ5MDc4MTRhY2I5NjhjZTY2OWY0OWIwYzE0ZWY5ZWY4YjFlMmQxNjE4
MjliN2EzMTQ2MWFhYjA0NDI5ICAKPj4gUHlNdVBERi0xLjIzLjlyYzIudGFyLmd6Cj4+IMKgICMg
TG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4+IMKgIHNoYTI1NsKgIDU3YzhmZjMz
YzljMGNmYzNlZjAwZTY1MGExY2M5MTBkN2VlNDc5YThiYzUwOWY2YzkyMDlhN2MyYTExMzk5ZDYg
IAo+PiBDT1BZSU5HCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1weW11cGRmL3B5dGhv
bi1weW11cGRmLm1rIAo+PiBiL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvcHl0aG9uLXB5bXVwZGYu
bWsKPj4gaW5kZXggNjM5Y2UwZTAwZS4uYWM3NmFmYTNmNiAxMDA2NDQKPj4gLS0tIGEvcGFja2Fn
ZS9weXRob24tcHltdXBkZi9weXRob24tcHltdXBkZi5tawo+PiArKysgYi9wYWNrYWdlL3B5dGhv
bi1weW11cGRmL3B5dGhvbi1weW11cGRmLm1rCj4+IEBAIC01LDI1ICs1LDI4IEBACj4+ICAgCj4+
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+IMKgICMgcHl0aG9uLXB5bXVwZGYncyB2ZXJzaW9u
IG11c3QgbWF0Y2ggbXVwZGYncyB2ZXJzaW9uCj4+IC1QWVRIT05fUFlNVVBERl9WRVJTSU9OID0g
MS4yMi4wCj4+ICtQWVRIT05fUFlNVVBERl9WRVJTSU9OID0gMS4yMy45cmMyCj4+IMKgIFBZVEhP
Tl9QWU1VUERGX1NPVVJDRSA9IFB5TXVQREYtJChQWVRIT05fUFlNVVBERl9WRVJTSU9OKS50YXIu
Z3oKPj4gLVBZVEhPTl9QWU1VUERGX1NJVEUgPSAKPj4gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0
ZWQub3JnL3BhY2thZ2VzLzI4L2JhL2Q2YmI2ZmQ2NzhlODM5NmQ3Yjk0NDg3MDI4NmZiMjVmZDZm
NDk5YjhjYjU5OWI1NDM2YzhmNzI1YWRiZgo+PiAtUFlUSE9OX1BZTVVQREZfU0VUVVBfVFlQRSA9
IHNldHVwdG9vbHMKPj4gK1BZVEhPTl9QWU1VUERGX1NJVEUgPSAKPj4gaHR0cHM6Ly9maWxlcy5w
eXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2I0L2ZmL2RiNDQzMDNkNjBiOGNjMzEwYTcxODdkNTAw
Yzc3NjViM2I0OGFhMTEzYzg2NDI4ZDVkMWMzOTBiOGZiNQo+PiArUFlUSE9OX1BZTVVQREZfU0VU
VVBfVFlQRSA9IHBlcDUxNwo+PiDCoCBQWVRIT05fUFlNVVBERl9MSUNFTlNFID0gQUdQTC0zLjAr
Cj4+IMKgIFBZVEhPTl9QWU1VUERGX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4+IMKgICMgTm8g
bGljZW5zZSBmaWxlIGluY2x1ZGVkIGluIHBpcCwgYnV0IGl0J3MgcHJlc2VudCBvbiBnaXRodWIK
Pj4gLVBZVEhPTl9QWU1VUERGX0RFUEVOREVOQ0lFUyA9IGZyZWV0eXBlIGhvc3Qtc3dpZyBtdXBk
ZiB6bGliCj4+ICtQWVRIT05fUFlNVVBERl9ERVBFTkRFTkNJRVMgPSBcCj4+ICvCoMKgwqAgaG9z
dC1weXRob24tbGliY2xhbmcgXAo+IAo+IElzbid0IGxpYmNsYW5nIG9ubHkgcmVxdWlyZWQgYnkg
dGhlIFB5TXVQREYgcGx1bWJpbmcgd2hlbiBpdCBidWlsZHMgdGhlIGJ1bmRsZWQgCj4gTXVQREY/
Cj4gSW4gb3VyIGNhc2Ugc2luY2Ugd2UncmUgYnVpbGRpbmcgTXVQREYgYXMgYSBzZXBhcmF0ZSBw
YWNrYWdlLCB3ZSBob3BlZnVsbHkgZG9uJ3QgCj4gbmVlZCBpdC4uLgo+IAo+PiArwqDCoMKgIGhv
c3QtcHl0aG9uLXBzdXRpbCBcCj4gCj4gIEZyb20gYSBxdWljayBsb29rIGF0IHRoZSBQeU11UERG
IGNvZGUsIHRoaXMgc2VlbXMgdG8gYmUgbmVlZGVkIG9ubHkgZm9yIGEgCj4gc2luZ2xlIHRlc3Qg
KHdoaWNoIHdlIGRvbid0IHJ1biwgc28gd2UgZG9uJ3QgbmVlZCBpdCkuCj4gCj4+ICvCoMKgwqAg
aG9zdC1weXRob24tc2V0dXB0b29scyBcCj4+ICvCoMKgwqAgaG9zdC1weXRob24tc3dpZyBcCj4g
Cj4gVGhlIHdheSBJIHVuZGVyc3RhbmQgaXQsIFB5TXVQREYgYWRkZWQgdGhpcyBob3N0LXB5dGhv
bi1zd2lnIGRlcGVuZGVuY3kgYXMgYSB3YXkgCj4gdG8gbWFrZSBzdXJlIHN3aWcgaXMgYXZhaWxh
YmxlIHdoZW4gYnVpbGRpbmcuCj4gU2luY2Ugd2UgYWxyZWFkeSBoYXZlIGhvc3Qtc3dpZyBhcyBh
IGRlcGVuZGVuY3ksIHdlIGNhbiBwcm9iYWJseSB1c2UgdGhhdCBvbmUgdG8gCj4gYnVpbGQgYXMg
WWFubiBzdWdnZXN0ZWQ/Cj4gCj4+ICvCoMKgwqAgaG9zdC1zd2lnIFwKPj4gK8KgwqDCoCBmcmVl
dHlwZSBcCj4+ICvCoMKgwqAgbXVwZGYgXAo+PiArwqDCoMKgIHpsaWIKPj4gLVBZVEhPTl9QWU1V
UERGX0VOViA9IENGTEFHUz0iLUkkKFNUQUdJTkdfRElSKS91c3IvaW5jbHVkZS9tdXBkZiAKPj4g
LUkkKFNUQUdJTkdfRElSKS91c3IvaW5jbHVkZS9mcmVldHlwZTIiCj4+IC0KPj4gLSMgV2UgbmVl
ZCB0byByZW1vdmUgdGhlIG9yaWdpbmFsIHBhdGhzIGFzIHdlIHByb3ZpZGUgdGhlbSBpbiB0aGUg
Q0ZMQUdTOgo+PiAtZGVmaW5lIFBZVEhPTl9QWU1VUERGX1JFTU9WRV9QQVRIUwo+PiAtwqDCoMKg
IHNlZCAtaSAiL1wvdXNyXC9pbmNsdWRlXC9tdXBkZi9kIiAkKEBEKS9zZXR1cC5weQo+PiAtwqDC
oMKgIHNlZCAtaSAiL1wvdXNyXC9pbmNsdWRlXC9mcmVldHlwZTIvZCIgJChARCkvc2V0dXAucHkK
Pj4gLcKgwqDCoCBzZWQgLWkgIi9cL3VzclwvbG9jYWxcL2luY2x1ZGVcL211cGRmL2QiICQoQEQp
L3NldHVwLnB5Cj4+IC3CoMKgwqAgc2VkIC1pICIvbXVwZGZcL3RoaXJkcGFydHlcL2ZyZWV0eXBl
XC9pbmNsdWRlL2QiICQoQEQpL3NldHVwLnB5Cj4+IC1lbmRlZgo+PiAtCj4+IC1QWVRIT05fUFlN
VVBERl9QT1NUX1BBVENIX0hPT0tTID0gUFlUSE9OX1BZTVVQREZfUkVNT1ZFX1BBVEhTCj4+ICtQ
WVRIT05fUFlNVVBERl9FTlYgPSBcCj4+ICsgICAgCj4+IFBZTVVQREZfSU5DTFVERVM9IiQoU1RB
R0lOR19ESVIpL3Vzci9pbmNsdWRlL2ZyZWV0eXBlMjokKFNUQUdJTkdfRElSKS91c3IvaW5jbHVk
ZSIgXAo+PiArwqDCoMKgIFBZTVVQREZfTVVQREZfTElCPSIkKFNUQUdJTkdfRElSKS91c3IvbGli
IiBcCj4+ICvCoMKgwqAgUFlNVVBERl9TRVRVUF9GTEFWT1VSPXAgXD4gK8KgwqDCoCBQWU1VUERG
X1NFVFVQX0lNUExFTUVOVEFUSU9OUz1hIFwKPiAKPiBJdCdzIHdvcnRoIG5vdGluZyB0aGF0IFB5
TXVQREYgaXMgZ3JhZHVhbGx5IHN3aXRjaGluZyB0byBhIG5ldyBpbXBsZW1lbnRhdGlvbiAKPiB3
aGljaCB3aWxsIHJlcXVpcmUgTXVQREYgdG8gYmUgYnVpbHQgd2l0aCBweXRob24gYmluZGluZ3Mg
aW4gdGhlIGZ1dHVyZSAoYnV0IGZvciAKPiBub3csIGJvdGggaW1wbGVtZW50YXRpb25zIGFyZSBz
dGlsbCBhdmFpbGFibGUgQUZBSUNUKS4KPiAKPj4gK8KgwqDCoCBQWU1VUERGX1NFVFVQX01VUERG
X0JVSUxEPQo+PiDCoCAkKGV2YWwgJChweXRob24tcGFja2FnZSkpCj4gCj4gVGhlcmUgc2VlbSB0
byBiZSBtb3JlIHdvcmsgbmVlZGVkIHRvIGdldCB0aGlzIG5ldyB2ZXJzaW9uIHRvIHdvcmssIEkn
bGwgdHJ5IHRvIAo+IGhhdmUgYSBjbG9zZXIgbG9vayBhdCBpdCBpbiB0aGUgbmV4dCBmZXcgZGF5
cy4KPiAKPiAKPiBLaW5kIHJlZ2FyZHMsCj4gCj4gUmFwaGHDq2wKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
