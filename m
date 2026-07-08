Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3B7C43458
	for <buildroot@archiver.kernel.org>; Wed,  8 Jul 2026 21:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 274546076B;
	Wed,  8 Jul 2026 21:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id intOQKg0nnAU; Wed,  8 Jul 2026 21:48:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46C2460803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783547307;
	bh=LiytwAYV/r8yoGIAsI58GZY2Q79KNqSH4pXM1TpADps=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=URYp/WJFi2JMeDbaPVP/GxpgWK6D63L4n3xFYZRw2qPvjD3gbWiSjp8FNrakGrjH0
	 fuuq6QCrAeZZPwMP29Q/8ZOpcebxoJsIqFdKcelANRgciX9/iKZXE7SkX+XUsuG641
	 zaMgGlNzbJyWmiMfjkyACDk+UUCy5jLfW3Wryol5ONO0SYIbxzKAqAMCKyhKqP70bM
	 ns5ocKwok4hAjxgFi6ol0NndJBzP5GE1N+rh6x98laXoxg1YwgkCw0FMUWqf77WfpK
	 VAag7MrVA7Xzdal7zPNdjmeLj+LQ7rHVavnepNzR01T0OKy4mPsf3uUvYktomK1ugy
	 yeZusMLURWawA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46C2460803;
	Wed,  8 Jul 2026 21:48:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A7CE2E5
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 21:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7070860803
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 21:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYeEs-qozGmF for <buildroot@buildroot.org>;
 Wed,  8 Jul 2026 21:48:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 344416076B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 344416076B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 344416076B
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 21:48:24 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-493e4cccd8dso5276435e9.2
 for <buildroot@buildroot.org>; Wed, 08 Jul 2026 14:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783547303; x=1784152103;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SqBUkaAyoa1UndVbgxZy3ejm1TMiEIVG0p1B10VdZ5s=;
 b=oy4rwaPYj+Xq7RRUU4gSDTwz6d0mFqdmApmdWogcx7+YTado5hn2Czs4d1vv0gdjka
 1NMeh75FJ7TVsVIa4T551gPwlgTJmKwBjFqH+i7NpRdWigyYQcMJPE0WL8Jb/tjAVANA
 Ze8HCN/AsecrWKeCK4aj5ybpcAib/iK1RU+MQmala80r/3BSra0fjJZSOOHseDz693JU
 QouBtAT9Qir/m5kAga1bqhc2cYEGJ1orLTyzJa6UkPDB5zVPt2cGB+EypGcaWtsyilwY
 XJvhMuTabi8sqesU4ppNB1nRTMg8uQ5XmlOfiYucsu/d1GMKtP3BPWHx4Vhne/d9KrJE
 xl2g==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp97z5pqGc0VHHqc9ru91KonxaTVZUo3JrxP/2hE1+KP34xTCJYelFyGBlMErUQtd79+juPUe0TQTY=@buildroot.org
X-Gm-Message-State: AOJu0Yy8IO2NpD9vJyPl4E4KImiB5oBAtTl61HqiGOy27Vfeg1RMMXXW
 7jlmArVbX7P+X51K1ek/Sw0osNWJDxrx4P9qBg4zT2A3pZgI0opxvcaXPuI9J8NW458=
X-Gm-Gg: AfdE7cmmWJwVF71ifKgeWNmfwn4OOYF+FROLP4rO4B8c68XWexjJtIUisU9M/EgRQVK
 7PiXYK0ezKYpfwMoaKWmavRgwqIUHa0zoa6jUxTfgH+4SYlYQB9Y4eklk1ywduOtTiADVxhCvlP
 EkDHORIQy/N9VF7rzMPa/zqAyCBxJ0WttYGPIs6GZonb0AzyNHbtjHhwmkkQr0416OvvkWVtTcL
 +7fpTdnpHvhNx+egJTISuKESkQWorBC9zAHdEQ9zdz4X0Ysp5yGMZH6sp7XyGb27xZHLIGeM6dn
 /FDF2p4heOAhey5iknu3AlxWcs0QZ406H5u4Szitn5La3Y/FTd4Fg9vwlo5Rhv/cMPs7XbEBjNH
 bHR/Q6bu5LZ3Hyu13+v1OUl6GhK4YUvFCPErOYVml0IZ57Zel88uG2R5E8B/P8CzfpD1JqgpwYw
 Jo1/C7/yGfkQTQ8cXivjOViWpUwoM0R7zP5C8zKl2Irj/ZUmFK1/iSrRmDKNACA2kpYPkNURh+X
 pVUFTn6ONgJ6gVZ1VOPV/SrumU8ueXR6Ulu2DNFIMleuwL05jmihRs=
X-Received: by 2002:a05:600c:b90:b0:493:e97c:10e0 with SMTP id
 5b1f17b1804b1-493e97c10f4mr13773675e9.35.1783547302833; 
 Wed, 08 Jul 2026 14:48:22 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ff432sm7815455e9.4.2026.07.08.14.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2026 14:48:22 -0700 (PDT)
Message-ID: <c4368489-8d6e-447f-9568-c8f87b0d19e6@smile.fr>
Date: Wed, 8 Jul 2026 23:48:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
References: <cb306363cbe59e1e5cdf9d50921e06a23590cd48.1780473097.git.yann.morin@orange.com>
 <akyWylX0rDN1XX6N@yd-6wlzhs3> <77b8d847-cf94-4919-bbef-bb934e1fbc9d@smile.fr>
Content-Language: fr
In-Reply-To: <77b8d847-cf94-4919-bbef-bb934e1fbc9d@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1783547303; x=1784152103; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SqBUkaAyoa1UndVbgxZy3ejm1TMiEIVG0p1B10VdZ5s=;
 b=kQNFv4wqJp9d6uSGfIOdIJgwWG/qMmpCldTRS0/42mu8BTXaiG+6b8tEckAsI7Xl9/
 ZaotGbL7z76t2wpdWGD6vcYeBRDFkSiT+BFdarPOXvkmh2T7oUgHXEH+Iupp7patMv56
 193AJ6BKShBQYk4lcDKuRrIx4EgrKYOFb4eTw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=kQNFv4wq
Subject: Re: [Buildroot] [PATCH] support/docker: make the image reproducible
 again
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Dowan Gullient <dowan.gullient@smile.fr>,
 Arnout Vandecappelle <arnout@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwgQWxsLAoKTGUgMDgvMDcvMjAyNiDDoCAyMzoyOSwgUm9tYWluIE5hb3VyIGEg
w6ljcml0wqA6Cj4gSGVsbG8gWWFubiwgQWxsLAo+IAo+IExlIDA3LzA3LzIwMjYgw6AgMDg6MDMs
IHlhbm4ubW9yaW5Ab3JhbmdlLmNvbSBhIMOpY3JpdMKgOgo+PiBIZWxsbyBBbGwhCj4+Cj4+IE9u
IDIwMjYtMDYtMDMgMDk6NTEgKzAyMDAsIHlhbm4ubW9yaW5Ab3JhbmdlLmNvbSBzcGFrZSB0aHVz
bHk6Cj4+PiBGcm9tOiAiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW5Ab3JhbmdlLmNvbT4KPj4+
Cj4+PiBUaGUgRGViaWFuIDEyIEJvb2t3b3JtIHNuYXBzaG90IHdlIHVzZSwgMjAyNTAyMDMsIHVz
ZXMgdGhlIG5ldyBkZWI4MjIKPj4+IGZvcm1hdCBbMF0gZm9yIHNvdXJjZSBsaXN0IGZpbGVzOyBp
dCBjYXJyaWVzIGEgc291cmNlIGxpc3QgZmlsZSB0aGF0Cj4+PiBwb2ludHMgdG8gdGhlIGN1cnJl
bnQgcmVwb3NpdG9yeSwgbm90IHRvIHRoZSBzbmFwc2hvdC4KPj4+Cj4+PiBFdmVuIHRob3VnaCB3
ZSBkbyBpbmplY3QgYW4gb2xkLXN0eWxlIHNvdXJjZSBsaXN0IHRoYXQgcG9pbnRzIHRvIHRoZQo+
Pj4gc25hcGhvdCByZXBvc2l0b3J5LCB0aGUgcGFja2FnZXMgaW4gdGhlIGN1cnJlbnQgcmVwb3Np
dG9yeSBhcmUgbW9yZQo+Pgo+PiAqc25hcHNob3QKPj4KPj4gT3RoZXJ3aXNlLCBhbnkgZmVlZGJh
Y2sgb24gdGhpcyBvbmU/Cj4gCj4gSSBzdGFydGVkIGEgbG9jYWwgYnVpbGQgaGVyZS4KCkJ1aWx0
IGxvY2FsbHkgd2l0aCBzdWNlc3MsIG5vdCB5ZXQgcHVzaGVkIHRvIHRoZSBDb250YWluZXIgcmVn
aXN0cnkuCgpBcHBsaWVkIHRvIG1hc3Rlci4gVGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4K
Cj4gCj4gV2Ugd2FudCB0byB1cGRhdGUgdGhlIERvY2tlciBpbWFnZSB0byBEZWJpYW4gMTMgKGN1
cnJlbnQgc3RhYmxlKSBzb29uLCBkbyB5b3UKPiB0aGluayBpdCB3b3J0aCB0byByZWJ1aWx0IGl0
IG5vdz8KPiAKPiBJIHdvdWxkIGxpa2UgdG8gdXNlIHRoaXMgb3Bwb3J0aW5pdHkgdG8gYWRkIGEg
bmV3IEdpdGxhYi1DSSBqb2IgdG8gYnVpbGQgdGhpcwo+IGRvY2tlciBpbWFnZSBhbmQgcHVzaCBp
dCBkaXJlY3RseSBpbnRvIHRoZSBHaXRsYWIgY29udGFpbmVyIHJlZ2lzdHJ5LiBBcm5vdXQKPiBz
dWdnZXN0ZWQgdGhpcyBhIHdoaWxlIGFnbyA7LSkKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWlu
Cj4gCj4+Cj4+IFJlZ2FyZHMsCj4+IFlhbm4gRS4gTU9SSU4uCj4+Cj4+PiByZWNlbnQgdGhhbiB0
aGUgb25lIGluIHRoZSBzbmFwc2hvdCwgc28gd2hlbiB3ZSBpbnN0YWxsIG91ciBwYWNrYWdlcywK
Pj4+IHRoZXkgZ2V0IHJldHJpZXZlZCBtb3N0bHkgZnJvbSB0aGUgY3VycmVudCByZXBvc2l0b3J5
IHJhdGhlciB0aGFuIGZyb20KPj4+IHRoZSBzbmFwc2hvdC4gVGhlIGltYWdlIGlzIG5vdCByZXBy
b2R1Y2libGUuCj4+Pgo+Pj4gU3dpdGNoIHRvIHVzaW5nIHRoZSBuZXcgZGViODIyLXN0eWxlIHNv
dXJjZSBsaXN0IGZpbGUuCj4+Pgo+Pj4gTm90ZTogd2UgZG8gbm90IG5lZWQgdG8gY2FycnkgdGhl
ICJMYXRlc3QganVzdCBiZWZvcmUiIHRyaWNrOiB0aGUKPj4+IHNuYXBzaG90IHJlcG9zaXRvcnkg
d2lsbCB1c2UgdGhlIG1vc3QgcmVjZW50IGFjdHVhbCBzbmFwc2hvdCBiZWZvcmUgdGhlCj4+PiBy
ZXF1ZXN0ZWQgZGF0ZWQsIHNvIHdlIGNhbiBqdXN0IHVzZSB0aGUgZGF0ZSBvZiB0aGUgaW1hZ2Ug
d2UgdXNlIChzdHVjawo+Pj4gYXQgbWlkbmlnaHQgYmVjYXVzZSB3ZSBkb24ndCBoYXZlIGJldHRl
cikuCj4+Pgo+Pj4gU2luY2UgdGhlIHNuYXBzaG90IHJlcG9zaXRvcnkgY2FuIGJlIHJlYWxseSBz
bG93LCB3aGlsZSBhdCB0aGUgc2FtZSB0aW1lCj4+PiB0aGUgcmVtb3RlIGh0dHAgc2VydmVyIG5v
dCBkcm9wcGluZyBjb25uZWN0aW9ucywgaXQgY2FuIHRha2UgYSB2ZXJ5IGxvbmcKPj4+IHdoaWxl
IHRvIGJ1aWxkIHRoZSBpbWFnZTsgYWRkIGEgdGltZW91dCBzbyB0aGF0IHN0YWxlIGNvbm5lY3Rp
b25zIGFyZQo+Pj4gZGV0ZWN0ZWQgYW5kIHJlLWF0dGVtcGVkIGVhcmx5LWlzaCAodGhlIHRpbWVv
dXQgYXBwbGllcyB0byBib3RoIHRoZQo+Pj4gY29ubmVjdCBhbmQgdGhlIGFjdHVhbCBkb3dubG9h
ZCwgc28gaXQgc2hvdWxkIGJlIGxhcmdlIGVub3VnaCB0bwo+Pj4gYWNjb21vZGF0ZSBzbG93aXNo
IG5ldHdvcmsgY29ubmVjdGlvbnMpLgo+Pj4KPj4+IEZpeGVzOiBjOTVkNWI4ZTFlYjkgKHN1cHBv
cnQvZG9ja2VyOiBtb3ZlIHRvIGN1cnJlbnQgYm9va3dvcm0gKERlYmlhbgo+Pj4gMTIpIHNuYXBz
aG90KQo+Pj4KPj4+IFswXSBodHRwczovL21hbnBhZ2VzLmRlYmlhbi5vcmcvdHJpeGllL2FwdC9z
b3VyY2VzLmxpc3QuNS5lbi5odG1sI0RFQjgyMi1TVFlMRV9GT1JNQVQKPj4+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+Cj4+PiBDYzogUGV0
ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgo+Pj4gQ2M6IFJvbWFpbiBOYW91ciA8
cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+Pj4gLS0tCj4+PiAgc3VwcG9ydC9kb2NrZXIvRG9ja2Vy
ZmlsZSAgICAgICB8IDExICsrKysrKystLS0tCj4+PiAgc3VwcG9ydC9kb2NrZXIvYXB0LXNvdXJj
ZXMubGlzdCB8ICA0IC0tLS0KPj4+ICBzdXBwb3J0L2RvY2tlci9kZWJpYW4uc291cmNlcyAgIHwg
MTMgKysrKysrKysrKysrKwo+Pj4gIDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkKPj4+ICBkZWxldGUgbW9kZSAxMDA2NDQgc3VwcG9ydC9kb2NrZXIvYXB0
LXNvdXJjZXMubGlzdAo+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L2RvY2tlci9kZWJp
YW4uc291cmNlcwo+Pj4KPj4+IGRpZmYgLS1naXQgYS9zdXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxl
IGIvc3VwcG9ydC9kb2NrZXIvRG9ja2VyZmlsZQo+Pj4gaW5kZXggZTc2NzdhYzZhOS4uNjg3ZWVl
ODExMCAxMDA2NDQKPj4+IC0tLSBhL3N1cHBvcnQvZG9ja2VyL0RvY2tlcmZpbGUKPj4+ICsrKyBi
L3N1cHBvcnQvZG9ja2VyL0RvY2tlcmZpbGUKPj4+IEBAIC0yNCw3ICsyNCw3IEBAIEFSRyBUQVJf
VkVSU0lPTj0iMS4zNSIKPj4+ICBFTlYgREVCSUFOX0ZST05URU5EPW5vbmludGVyYWN0aXZlCj4+
PiAgCj4+PiAgIyBUaGlzIHJlcG9zaXRvcnkgY2FuIGJlIGEgYml0IHNsb3cgYXQgdGltZXMuIERv
bid0IHBhbmljLi4uCj4+PiAtQ09QWSBhcHQtc291cmNlcy5saXN0IC9ldGMvYXB0L3NvdXJjZXMu
bGlzdAo+Pj4gK0NPUFkgZGViaWFuLnNvdXJjZXMgL2V0Yy9hcHQvc291cmNlcy5saXN0LmQvZGVi
aWFuLnNvdXJjZXMKPj4+ICAKPj4+ICAjIEluc3RhbGwgMzJiaXQgdmFyaWFudCBvbiB4ODZfNjQg
aW1hZ2UuCj4+PiAgUlVOIGlmIFsgIiRUQVJHRVRQTEFURk9STSIgPSAibGludXgvYW1kNjQiIF07
IHRoZW4gXAo+Pj4gQEAgLTMyLDE1ICszMiwxOCBAQCBSVU4gaWYgWyAiJFRBUkdFVFBMQVRGT1JN
IiA9ICJsaW51eC9hbWQ2NCIgXTsgdGhlbiBcCj4+PiAgZmkKPj4+ICAKPj4+ICAjIFRoZSBjb250
YWluZXIgaGFzIG5vIHBhY2thZ2UgbGlzdHMsIHNvIG5lZWQgdG8gdXBkYXRlIGZpcnN0Cj4+PiAt
UlVOIGFwdC1nZXQgLW8gQVBUOjpSZXRyaWVzPTMgdXBkYXRlIC15Cj4+PiArUlVOIGFwdC1nZXQg
LW8gQVBUOjpSZXRyaWVzPTMgLW8gQVBUOjpBY3F1aXJlOjpodHRwOjpUaW1lb3V0PTYwIFwKPj4+
ICsgICAgICAgIHVwZGF0ZSAteQo+Pj4gIAo+Pj4gIFJVTiBpZiBbICIkVEFSR0VUUExBVEZPUk0i
ID0gImxpbnV4L2FtZDY0IiBdOyB0aGVuIFwKPj4+IC0gICAgYXB0LWdldCAtbyBBUFQ6OlJldHJp
ZXM9MyBpbnN0YWxsIC15IC0tbm8taW5zdGFsbC1yZWNvbW1lbmRzIFwKPj4+ICsgICAgYXB0LWdl
dCAtbyBBUFQ6OlJldHJpZXM9MyAtbyBBUFQ6OkFjcXVpcmU6Omh0dHA6OlRpbWVvdXQ9NjAgXAo+
Pj4gKyAgICAgICAgaW5zdGFsbCAteSAtLW5vLWluc3RhbGwtcmVjb21tZW5kcyBcCj4+PiAgICAg
ICAgICBnKystbXVsdGlsaWIgXAo+Pj4gICAgICAgICAgbGliYzY6aTM4NjsgXAo+Pj4gIGZpCj4+
PiAgCj4+PiAtUlVOIGFwdC1nZXQgLW8gQVBUOjpSZXRyaWVzPTMgaW5zdGFsbCAteSAtLW5vLWlu
c3RhbGwtcmVjb21tZW5kcyBcCj4+PiArUlVOIGFwdC1nZXQgLW8gQVBUOjpSZXRyaWVzPTMgLW8g
QVBUOjpBY3F1aXJlOjpodHRwOjpUaW1lb3V0PTYwIFwKPj4+ICsgICAgICAgIGluc3RhbGwgLXkg
LS1uby1pbnN0YWxsLXJlY29tbWVuZHMgXAo+Pj4gICAgICAgICAgYmMgXAo+Pj4gICAgICAgICAg
YnVpbGQtZXNzZW50aWFsIFwKPj4+ICAgICAgICAgIGJ6ciBcCj4+PiBkaWZmIC0tZ2l0IGEvc3Vw
cG9ydC9kb2NrZXIvYXB0LXNvdXJjZXMubGlzdCBiL3N1cHBvcnQvZG9ja2VyL2FwdC1zb3VyY2Vz
Lmxpc3QKPj4+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXggZDZmYmY4NTI3MC4u
MDAwMDAwMDAwMAo+Pj4gLS0tIGEvc3VwcG9ydC9kb2NrZXIvYXB0LXNvdXJjZXMubGlzdAo+Pj4g
KysrIC9kZXYvbnVsbAo+Pj4gQEAgLTEsNCArMCwwIEBACj4+PiAtIyBMYXRlc3QganVzdCBiZWZv
cmUgMjAyNTAyMTgyMTEwMDBaOgo+Pj4gLWRlYiBbY2hlY2stdmFsaWQtdW50aWw9bm9dIGh0dHA6
Ly9zbmFwc2hvdC5kZWJpYW4ub3JnL2FyY2hpdmUvZGViaWFuLzIwMjUwMjE4VDE0NDkzOFovIGJv
b2t3b3JtIG1haW4KPj4+IC1kZWIgW2NoZWNrLXZhbGlkLXVudGlsPW5vXSBodHRwOi8vc25hcHNo
b3QuZGViaWFuLm9yZy9hcmNoaXZlL2RlYmlhbi1zZWN1cml0eS8yMDI1MDIxOFQxNDQ5MzhaLyBi
b29rd29ybS1zZWN1cml0eSBtYWluCj4+PiAtZGViIFtjaGVjay12YWxpZC11bnRpbD1ub10gaHR0
cDovL3NuYXBzaG90LmRlYmlhbi5vcmcvYXJjaGl2ZS9kZWJpYW4vMjAyNTAyMThUMTQ0OTM4Wi8g
Ym9va3dvcm0tdXBkYXRlcyBtYWluCj4+PiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9kb2NrZXIvZGVi
aWFuLnNvdXJjZXMgYi9zdXBwb3J0L2RvY2tlci9kZWJpYW4uc291cmNlcwo+Pj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAwMDAuLjM2ZTFlZWIzZTcKPj4+IC0tLSAvZGV2
L251bGwKPj4+ICsrKyBiL3N1cHBvcnQvZG9ja2VyL2RlYmlhbi5zb3VyY2VzCj4+PiBAQCAtMCww
ICsxLDEzIEBACj4+PiArVHlwZXM6IGRlYgo+Pj4gK1VSSXM6IGh0dHA6Ly9zbmFwc2hvdC5kZWJp
YW4ub3JnL2FyY2hpdmUvZGViaWFuLzIwMjUwMjAzVDAwMDAwMFoKPj4+ICtTdWl0ZXM6IGJvb2t3
b3JtIGJvb2t3b3JtLXVwZGF0ZXMKPj4+ICtDb21wb25lbnRzOiBtYWluCj4+PiArU2lnbmVkLUJ5
OiAvdXNyL3NoYXJlL2tleXJpbmdzL2RlYmlhbi1hcmNoaXZlLWtleXJpbmcuZ3BnCj4+PiArQ2hl
Y2stVmFsaWQtVW50aWw6IG5vCj4+PiArCj4+PiArVHlwZXM6IGRlYgo+Pj4gK1VSSXM6IGh0dHA6
Ly9zbmFwc2hvdC5kZWJpYW4ub3JnL2FyY2hpdmUvZGViaWFuLXNlY3VyaXR5LzIwMjUwMjAzVDAw
MDAwMFoKPj4+ICtTdWl0ZXM6IGJvb2t3b3JtLXNlY3VyaXR5Cj4+PiArQ29tcG9uZW50czogbWFp
bgo+Pj4gK1NpZ25lZC1CeTogL3Vzci9zaGFyZS9rZXlyaW5ncy9kZWJpYW4tYXJjaGl2ZS1rZXly
aW5nLmdwZwo+Pj4gK0NoZWNrLVZhbGlkLVVudGlsOiBubwo+Pj4gLS0gCj4+PiAyLjM0LjEKPj4+
Cj4+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
