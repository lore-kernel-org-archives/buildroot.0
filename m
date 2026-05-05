Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92FACD3430
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 09:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98FC6812E8;
	Tue,  5 May 2026 09:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1X-LPB7wJan3; Tue,  5 May 2026 09:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBD9E8109A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777974347;
	bh=dJr5KUB/6Z+txwqaCAGKBU7vNWS8vfobX5zSls6AIWM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b9Om+iSJ3Gx9bCO4yexerJsBS67KB7CgrZECboOzdT13vqRpHyl9UExUA5t/xLFq1
	 Xby0DAU7l2uOW8hq7Jne28kq2/bNiYGvUPjeLPwE5yI6FJK6o5LxBgcKG9ANPYlp7m
	 oWBsl5SGTGA91PD/ovSaQYy2Wc/Vvemlsgb3RJN7vTS6nEQAI9QVvivRuyeLePl8m/
	 v+tgw33BR2uCiIp8fQcfNs4vmLrX3y7nQw+5KyoG1ndkpEc2ssQUaf5eIHdtnigVr0
	 IFYLfbvrPh9lUf6CGNT2mFuorArJ2EcS4lC8wsj7gkQrDFqEq4k7Tb26ti6dQDpTj8
	 pp8YJ1C36cw6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBD9E8109A;
	Tue,  5 May 2026 09:45:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87FE32A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 09:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85477812D2
 for <buildroot@buildroot.org>; Tue,  5 May 2026 09:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zme8mhKZrvd for <buildroot@buildroot.org>;
 Tue,  5 May 2026 09:45:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BEA4881099
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEA4881099
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEA4881099
 for <buildroot@buildroot.org>; Tue,  5 May 2026 09:45:45 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 592752C88D23;
 Tue, 05 May 2026 11:45:43 +0200 (CEST)
Message-ID: <b6b17884-9dcc-474b-acf5-8ff0df31300b@bubu1.eu>
Date: Tue, 5 May 2026 11:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Julien Olivain <ju.o@free.fr>
References: <20260425085657.474422-1-fiona.klute@gmx.de>
 <20260425085657.474422-5-fiona.klute@gmx.de>
 <f17073a5-410e-467a-8b29-befc23b3dc0e@bubu1.eu>
 <cab73423-6879-4382-8d7c-64d8db5940f6@gmx.de>
 <aa4a5ba1-eb8c-46e1-8aba-572b1cf23835@bubu1.eu> <afRWU1jyiPy6AMtO@landeda>
 <16a4b9ba-9ef1-446c-8a8c-7b6f7edd6012@gmx.de>
Content-Language: en-US
In-Reply-To: <16a4b9ba-9ef1-446c-8a8c-7b6f7edd6012@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777974343; bh=WIXfYJEJqdwhBnSfn54xKgyb0ImPi/aTC7t34GmLTqM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=cn07U4LHOjgMIiYmHNjIFFg7Vvpp8bN85YAj5mhEjrxW4b8DcXQX1xhbQbSM+kwFX
 bi7owCLN2SAmHWVqvBv+JS4NYU8tJr9dK5swjo+6Q4ta9CH1QCbTuJToIvUSGMAf1u
 z7GuRT0pdeS2IsZHpRuLqCz+oSVYFDOWCEBlWRrLfLsf4k1gbC8jpolGQTU0alhy+B
 /NK8TeMVU48Td6LQHQ97uva/BofaYk6u5AvNppamn6GQ9Oyrn37vxo6mTU89V8XbZX
 cglv8is8U7mbX6pfb60tauDZLy8dZgB72XODxydCzETwk7aWWtVNV5XAW14zStiVIQ
 UcuuUurbqEipA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=cn07U4LH
Subject: Re: [Buildroot] [PATCH 4/5] package/kmod: switch to Meson build
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmlvbmEsIFlhbm4sCgpPbiA1LzEvMjYgMTM6MTUsIEZpb25hIEtsdXRlIHdyb3RlOgo+IEhp
IFlhbm4sIE1hcmN1cywgZXZlcnlvbmUhCj4gCj4gWy4uLl0KPj4KPj4gVGhlIHJlYXNvbiB3aHkg
d2UgY2FyZSBhYm91dCBhbGwgdGhpcyBtZXNzLCBpcyB0aGF0IGJ1c3lib3ggZG9lcwo+PiBpbnN0
YWxsIGl0cyB0b29scyAobHNtb2QsIGluc21vZCBldCBhbC4pIGlmIHRoZXkgZG8gbm90IGFscmVh
ZHkgZXhpc3QKPj4gKHRoZSAnaW5zdGFsbC1ub2Nsb2JiZXInIGluc3RhbGwgcnVsZSBpbiBidXN5
Ym94KSwgc28gd2UgaGF2ZSB0byBoYXZlCj4+IHRob3NlIGV4aXN0IGluIHRoZSBwbGFjZSBidXN5
Ym94IHdvdWxkIG90aGVyd2lzZSBpbnN0YWxsIGl0cyBvd25zLgo+Pgo+PiBPdGhlcndpc2UsIHdl
J2QgZW5kIHVwIHdpdGgsIGUuZy46Cj4+Cj4+IMKgwqDCoMKgIC9iaW4vYnVzeWJveAo+PiDCoMKg
wqDCoCAvdXNyL2Jpbi9rbW9kwqDCoMKgwqDCoMKgIDwtIHRoZSByZWFsIHN0dWZmCj4+IMKgwqDC
oMKgIC91c3IvYmluL2xzbW9kwqDCoMKgwqDCoCA8LSBzeW1saW5rIHRvIGJ1c3lib3gKPj4gwqDC
oMKgwqAgL3Vzci9zYmluL2xzbW9kwqDCoMKgwqAgPC0gc3ltbGluayB0byBrbW9kCj4+Cj4+IEFu
ZCB0aGVuLCBkZXBlbmRpbmcgb24gUEFUSCwgb25lIG1heSBub3QgZ2V0IHRoZSBsc21vZCBvbmUg
ZXhwZWN0cy4KPj4gSGVuY2UgYWxsIHRoaXMgZGFuY2Ugd2l0aCB0aGUgc3ltbGlua3MuLi4KPj4K
Pj4gVGlzIHdhcyBpbnRyb2R1Y2VkIGluIDc4ZjVhYzI5MDhiMyAoa21vZDogYWRkIG9wdGlvbiB0
byBpbnN0YWxsIG1vZHVsZQo+PiB1dGlsaXRpZXMpLCBhdCBhIHRpbWUgd2hlbiBpbmRpdmlkdWFs
IHBhY2thZ2VzIHdvdWxkIGRlcGVuZCBvbiBidXN5Ym94Cj4+IHRvIGVuc3VyZSB0aGV5IHdvdWxk
ICJ3aW4gb3ZlciBidXN5Ym94IiwgYnV0IHRoZSBjb21tZW50IGFib3V0IHRoZSBhYm92ZQo+PiB3
YXMgcmVtb3ZlZCBpbiAyNzNmMjNhNDUyNTIgKHBhY2thZ2UvYnVzeWJveDogaW52ZXJ0IGRlcGVu
ZGVuY3kgd2l0aAo+PiBrbW9kKSB3aGVuIHdlIHN3aXRjaGVkIHRoZSBkZXBlbmRlbmN5IG92ZXIs
IHRvIGF2b2lkIGhhdmluZyBwYWNrYWdlcwo+PiByZXBsYWNlIGZpbGVzIGZyb20gYSBwcmV2aW91
c2x5IHBhY2thZ2UgKGluIHRoZSBob3BlIHRvIGhhdmUgYSBjbGVhbgo+PiBQUEQgYnVpbGQpLgo+
Pgo+PiBJIGFncmVlIHRoYXQgdGhlIGhhbmRsbmcgaXMgbm90IG9wdGltYWwsIGJ1dCBtb3N0bHkg
d2UncmUgY29tbWVudAo+PiBleHBsYWluaW5nIHRoZSByZWFzb24gZm9yIHRoaXMgZGFuY2UgaXMg
bWlzc2luZy4KPiAKPiBUaGFuayB5b3UsIHRoYXQgaGVscHMhIFdpdGggdGhhdCByZWFzb24gd2Ug
c2hvdWxkIGJlIGFibGUgdG8gc2ltcGxpZnkgCj4gdGhlIGRhbmNlIHRvOgo+IAo+IGlmZXEgKCQo
QlIyX1JPT1RGU19NRVJHRURfVVNSKSwpCj4gS01PRF9DT05GX09QVFMgKz0gLURzYmluZGlyPS9z
YmluCj4gZW5kaWYKPiAKPiBCdXN5Ym94IHBsYWNlcyBpdHMgc3ltbGlua3MgaW4gL3NiaW4sIHNv
IGluIHRoZSBub24tbWVyZ2VkIGNhc2Ugd2UgbmVlZCAKPiB0byBkbyB0aGUgc2FtZSBpbiBrbW9k
LiBJbiB0aGUgbWVyZ2VkLXVzciBjYXNlIEJ1c3lib3ggd2lsbCBmb2xsb3cgdGhlIC8gCj4gc2Jp
biAtPiAvdXNyL3NiaW4gc3ltbGluaywgd2hpY2ggbWF0Y2hlcyB0aGUga21vZCBkZWZhdWx0LiBB
bmQgaW4gdGhlIAo+IG1lcmdlZC1iaW4gY2FzZSBib3RoIHdpbGwgZm9sbG93IHRoZSAvdXNyL3Ni
aW4gLT4gL3Vzci9iaW4gc3ltbGluay4gOi0pCgoKSSBhZGRlZCBhIGJpdCBtb3JlIGRldGFpbCBh
Ym91dCB0aGlzIGluIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgYXBwbGllZCAKeW91ciB2MiBzZXJp
ZXMsIHRoYW5rcyEgKEFuZCB0aGFua3MgWWFubiBmb3IgdGhlIGV4cGxhbmF0aW9uISkKCj4gCj4g
SSB3aXNoIGFsbCBwYWNrYWdlcyB3ZXJlIHRoYXQgd2VsbCBiZWhhdmVkLCBJIGhhZCBhIHZlcnkg
YW5ub3lpbmcgCj4gZGlzY292ZXJ5IGluIGV1ZGV2IHdoaWxlIHRlc3RpbmcgdGhlIG1lcmdlZC1i
aW4gY2FzZSwgd2hlcmUgaXQgd2FzIAo+IGNsb2JiZXJpbmcgaXRzIG93biB1ZGV2YWRtIGJpbmFy
eSBbMV0uCj4gCgpCZXN0LApNYXJjdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
