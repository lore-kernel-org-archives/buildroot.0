Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016BDC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 16:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97E6A40C29;
	Wed,  8 Feb 2023 16:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97E6A40C29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dilMSxlRsMZW; Wed,  8 Feb 2023 16:10:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99D8C4014B;
	Wed,  8 Feb 2023 16:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99D8C4014B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC3601BF286
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A25C681F05
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A25C681F05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fJXcpnkc2VpL for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 16:10:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48AAF81985
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48AAF81985
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 16:10:54 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id bk16so17268540wrb.11
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 08:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BxntNBr1vAoudauwnkVQ8tSpS1GiEJw1JmVEk0PQY90=;
 b=wLlA6+J4gw/QptV2yeU6Y4z2I3wypE5AP8dn9w171zys3zHkLBtEcDimNZIeg7Oeca
 IvtSwRbHf0pIlpGWgZ+m3E5NITb/efdmxYJ+OEhAKT3f650S8eIVhvDk+DuOCk235O5R
 tUmPK68TvuNeQFza6BwSThGBv0bP3wLtHksCHAOJ592cClGtqsKAz1vIcgjIKGg4V1al
 wZzkg+ux7RPDYDrM9DIr9MqZf0diqGg60a4PZ5sATSbbP5zlwkyOzlYikr95pDVhh66U
 xn7iFLPbxmEHjudw4gxsN8k5aWLD9zrsNvCn7dIIcnSmaH/PUu5N14G+XIrIl0TIRQjU
 l+SQ==
X-Gm-Message-State: AO0yUKWUo2bPc+sN5O8PeP5cN6rbbeeduSYO2XeR+cHrghP1Da1LhqWF
 IOLGF39xvqyHP7xaFT7vLlt9yQ==
X-Google-Smtp-Source: AK7set/p2XhjtSQZr0WieNnQ5/g9TIFlsITMP+yAJs3jqeE5xUO/3PQAmNXEVz0a51yAtKCxtXhzPg==
X-Received: by 2002:a5d:67c4:0:b0:2c3:efda:7194 with SMTP id
 n4-20020a5d67c4000000b002c3efda7194mr1770085wrw.20.1675872652494; 
 Wed, 08 Feb 2023 08:10:52 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 d13-20020adffbcd000000b002c3f6cd1f0fsm3820005wrs.83.2023.02.08.08.10.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 08:10:52 -0800 (PST)
Message-ID: <5d87a68a-3489-2848-a841-8690bd59c5b6@smile.fr>
Date: Wed, 8 Feb 2023 17:10:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <3f3d266c-2f21-197c-29b7-fff3e230e97a@smile.fr>
 <20230208165330.43c145f3@windsurf>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230208165330.43c145f3@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BxntNBr1vAoudauwnkVQ8tSpS1GiEJw1JmVEk0PQY90=;
 b=j5r0tFhbgA/+dXiTZdVWoleRagZfu8mPDmSzHVIbhKed53ASqWyinhct492xI7LHGM
 F5ZXutskgl04TrQbHI+NbVa0goexg+iQbw2SFy4Ps7Yi2AQFM8FLRT7BzJY8oHWRNRLL
 pR8j9xs6AqgPyw2Us350hgSRgEYtuVnUNbwKMflvSv6ilVerlp83ZVVEwpUrDu4kHg1a
 dvqx3zLKwasy3omvhcxDS/QU4c3F4t4YLRjX445DxQVfuBdTOCjDfjib3LjfYmTLtOc6
 7O19naNgkf1kF7nE0Kb2xGiMkuDVtYV0g+lMgvFWzOzhDbne7pweOmA1azhNZOMHuYnL
 t5Lw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=j5r0tFhb
Subject: Re: [Buildroot] outdated libiberty and prelink-cross support
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <aduskett@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAwOC8wMi8yMDIzIMOgIDE2OjUzLCBUaG9tYXMgUGV0YXp6b25pIGEgw6ljcml0
wqA6Cj4gSGVsbG8sCj4gCj4gK1lhbm4gYW5kIEFkYW0sIHdpdGggcXVlc3Rpb25zL2hlbHAgbmVl
ZGVkIGJlbG93IDopCj4gCj4gT24gV2VkLCAyIE5vdiAyMDIyIDE0OjA1OjI2ICswMTAwCj4gUm9t
YWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+IAo+PiBJIHdhcyBsb29r
aW5nIGF0IGhvc3QtYmludXRpbHMtMi4zOCBpc3N1ZSBpbiB0aGUgYXV0b2J1aWxkZXIgWzFdLgo+
PiBUaGUgaXNzdWUgYXBwZWFyIG9ubHkgd2hlbiBob3N0LWxpYmliZXJ0eSBpcyBidWlsdCBiZWZv
cmUgaG9zdC1iaW51dGlscwo+PiAoQmludXRpbHMgMi4zOCBvbmx5KS4KPj4KPj4gSXQgc2VlbXMg
dGhhdCBsaWJpYmVydHkgcGFja2FnZSBpcyBzdGlsbCBiYXNlZCBvbiBiaW51dGlscyAyLjMyIHJl
bGVhc2UgYW5kCj4+IHNlZW1zIHRvIGJlIHVwZGF0ZWQuCj4+Cj4+IGhvc3QtbGliaWJlcnR5IGlz
IGN1cnJlbnRseSB1c2VkIGJ5IGhvc3QtZ2RiIGFuZCBob3N0LXByZWxpbmstY3Jvc3MgcGFja2Fn
ZXMuCj4+Cj4+IEFib3V0IHRoZSBwcmVsaW5rLWNyb3NzIHBhY2thZ2UsIGl0IGNvbWUgZnJvbSB0
aGUgWW9jdG8gcHJvamVjdCBbMl0gYnV0IHRoZQo+PiBzdXBwb3J0IHNlZW1zIGhhbHRlZC4gQWxz
byB0aGUgR2xpYmMgcHJvamVjdCB3aWxsIHJlbW92ZSBwcmVsaW5rIHN1cHBvcnQgZm9yIHRoZQo+
PiB1cGNvbWluZyAyLjM3IHJlbGVhc2UgWzNdLgo+Pgo+PiBUaGUgYW5ub3lpbmcgcGFydCBpcyAi
UHJlbGluay1jcm9zcyBlbXVsYXRlcyBhIHJ1bnRpbWUgbGlua2VyIGZvciBhIGdpdmVuCj4+IHN5
c3Jvb3QuIFRoaXMgaXMgbmVjZXNzYXJ5IHRvIGFsbG93IGdvYmplY3QtaW50cm9zcGVjdGlvbiB0
byBidWlsZCBpdHMgdHlwZWxpYgo+PiBmaWxlcyBkdXJpbmcgY3Jvc3MtY29tcGlsaW5nLiIgWzRd
Cj4+Cj4+IGhvc3QtcHJlbGluay1jcm9zcyBpcyBjdXJyZW50bHkgdXNlZCBieSBkcmFjdXQgYW5k
IGdvYmplY3QtaW50cm9zcGVjdGlvbiBwYWNrYWdlcy4KPiAKPiBJIGhhZCBhIGxvb2ssIGFuZCB0
aGVyZSBhcmUgdGhpbmdzIGF0IHR3byBkaWZmZXJlbnQgbGV2ZWxzIHRoYXQgY2FuIGJlCj4gZG9u
ZS4KClRoYW5rcyEKCj4gCj4gRmlyc3QsIHdlIG5lZWQgdG8gcmVtb3ZlIHRoZSBwYWNrYWdlL2xp
YmliZXJ0eS8gcGFja2FnZS4gbGliaWJlcnR5IGlzCj4gY3VycmVudGx5IHVzZWQgYnkgaG9zdC1n
ZGIgYW5kIGhvc3QtcHJlbGluay1jcm9zczoKPiAKPiAqIEZvciBob3N0LWdkYiwgdGhlIGNvbW1p
dCBsb2cgc2F5cyB0aGF0IHRoZSBob3N0IGxpYmliZXJ0eSBtaWdodCBiZQo+ICAgcGlja2VkIHVw
IHNvIHdlIG5lZWQgdG8gYnVpbGQgb3VyIG93bi4gVGhpcyBpcyB3ZWlyZCBiZWNhdXNlCj4gICBs
aWJpYmVydHkgaXMgc2hpcHBlZCBpbiB0aGUgZ2RiIHRhcmJhbGwuIFlhbm4sIHdoZW4geW91IGFw
cGxpZWQKPiAgIGYwYTU4M2RkYzRjMmNhYjEyMTMzMDI4NGUzMTZmNTQyMjlkZWU0OTIsIGRvIHlv
dSByZW1lbWJlciBpZiB5b3UKPiAgIGxvb2tlZCBhdCB3aHkgR0RCIHdhc24ndCBwaWNraW5nIHVw
IGl0cyBvd24gbGliaWJlcnR5PyBBbHNvLCB0aGVyZSBpcwo+ICAgbm8gYXV0b2J1aWxkZXIgZmFp
bHVyZSwgc28gd2UgZG9uJ3QgcmVhbGx5IGtub3cgdW5kZXIgd2hhdCBjb25kaXRpb25zCj4gICB0
aGUgcHJvYmxlbSBjYW4gYmUgcmVwcm9kdWNlZC4KCkkgaGFkIGEgbG9vayBiZWZvcmUgd3JpdGlu
ZyB0aGlzIGVtYWlsIGFuZCBJIHdhcyBub3Qgc3VyZSBhYm91dCBsaWJpYmVydHkKZGVwZW5kZW5j
eS4gRm9yIG1lIGdkYiBidWlsZCBpdHMgb3duIHZlcnNpb24uIEkgd2Fzbid0IGFibGUgdG8gcHJv
dmUgdGhhdCBpdCBjYW4KdXNlIGxpYmliZXJ0eSBmcm9tIHRoZSBob3N0IGlmIGF2YWlsYWJsZS4K
Cj4gCj4gKiBGb3IgaG9zdC1wcmVsaW5rLWNyb3NzLCBpdCBpbiBmYWN0IGRvZXNuJ3QgbmVlZCBo
b3N0LWxpYmliZXJ0eS4gSXQKPiAgIGxpbmtzIGFnYWluc3QgaXQsIGJ1dCBhcHBhcmVudGx5LCB0
aGUgb25seSBmdW5jdGlvbnMgaXQgdXNlcyBmcm9tCj4gICBsaWJpYmVydHkgYXJlIGh0YWJfZmlu
ZF9zbG90KCkgYW5kIGh0YWJfdHJ5X2NyZWF0ZSgpLCBhbmQgYm90aCBhcmUKPiAgIHByb3ZpZGVk
IGJ5IHNyYy9oYXNodGFiLmMgaW4gcHJlbGluay1jcm9zcywgd2hpY2ggd2FzIGNvcHkvcGFzdGVk
Cj4gICBmcm9tIGxpYmliZXJ0eSwgbW9zdCBsaWtlbHkgdG8gYXZvaWQgdGhlIGRlcGVuZGVuY3ku
IFNvIHdpdGggYSBiaXQgb2YKPiAgIGVmZm9ydCBpbiBob3N0LXByZWxpbmstY3Jvc3MsIHRoZSBk
ZXBlbmRlbmN5IG9uIGhvc3QtbGliaWJlcnR5IGNvdWxkCj4gICBiZSByZW1vdmVkLgo+IAo+IFRo
ZW4sIHRoZSBzZWNvbmQgbGV2ZWwgaXMgYWJvdXQgaG9zdC1wcmVsaW5rLWNyb3NzIGl0c2VsZi4g
SXQgaXMgdXNlZAo+IGJ5IG9ubHkgdHdvIHBhY2thZ2VzLCBzbyBsZXQncyBoYXZlIGEgbG9vazoK
PiAKPiAqIEZvciBnb2JqZWN0LWluc3Ryb3NwZWN0aW9uLCBpdCBpcyBubyBsb25nZXIgbmVlZGVk
OiBvcGVuZW1iZWRkZWQtY29yZQo+ICAgc3RvcHBlZCB1c2luZyBpdCBpbgo+ICAgaHR0cHM6Ly9n
aXRodWIuY29tL29wZW5lbWJlZGRlZC9vcGVuZW1iZWRkZWQtY29yZS9jb21taXQvNzY3ZTA4ODBk
NGQ3MjllNjU5ZTg1OWRkOTljMWNkYjA4NGI4YmE1MS4KPiAgIEl0IHNpbXBseSB1c2VzICJvYmpk
dW1wIC1wIiBpbnN0ZWFkLiBJdCBhbHNvIGFsbG93cyB0byByZW1vdmUgYSBwYXRjaAo+ICAgZnJv
bSBnb2JqZWN0LWludHJvc3BlY3Rpb24sIHNvIG92ZXJhbGwgaXQgc2VlbXMgbGlrZSBhIGdvb2Qg
dGhpbmcuCj4gCj4gKiBGb3IgZHJhY3V0LCB0aGUgdXNhZ2UgaXMgcHJldHR5IG11Y2ggdGhlIHNh
bWUsIGFuZCBhIHNtYWxsIHdyYXBwZXIKPiAgIGFyb3VuZCBvYmpkdW1wIC1wIHdvdWxkIG1vc3Qg
bGlrZWx5IGJlIGFibGUgdG8gZW11bGF0ZSB0aGUgYmVoYXZpb3IKPiAgIGxmIHByZWxpbmstcnRs
ZCB0byBsaXN0IHRoZSBsaWJyYXJpZXMgdGhhdCBhIGJpbmFyeSBkZXBlbmRzIG9uLgo+IAo+IFNv
IHRoZXJlJ3MgYSBiaXQgb2Ygd29yayBmb3Igc3VyZSwgYnV0IHRoaXMgd29yayB3b3VsZCBhbGxv
dyB0byByZW1vdmUKPiBib3RoIGhvc3QtbGliaWJlcnR5IGFuZCBob3N0LXByZWxpbmstY3Jvc3Ms
IHdoaWNoIGFyZSBib3RoIHdlaXJkCj4gcGFja2FnZXMgdGhhdCB3aWxsIGluZXZpdGFibHkgY2F1
c2UgcHJvYmxlbXMuCj4gCj4gTXkgbWFpbiBjb25jZXJucyBhcmU6Cj4gCj4gKDEpIEhvdyB0byBy
ZXByb2R1Y2UgdGhlIGhvc3QtZ2RiIGlzc3VlIHRoYXQgY2F1c2VkIHRoZSBhZGRpdGlvbiBvZiB0
aGUKPiAgICAgaG9zdC1saWJlcnR5IGRlcGVuZGVuY3kKCkxvb2tpbmcgYXQgZGlzdHJpYnV0aW9u
IHBhY2thZ2luZywgdGhlIGdkYiBwYWNrYWdlIHVzZSBhIGJ1bmRsZWQgbGliaWJlcnR5IGxpYnJh
cnk6CgpodHRwczovL3NyYy5mZWRvcmFwcm9qZWN0Lm9yZy9ycG1zL2dkYi9ibG9iL3Jhd2hpZGUv
Zi9nZGIuc3BlYyNfMTIyCgo+IAo+ICgyKSBIb3cgdG8gdGVzdCBnb2JqZWN0LWludHJvc3BlY3Rp
b24gaW4gYSBzaW1wbGUgd2F5LiBUaGVyZSBpcyBubwo+ICAgICBydW50aW1lIHRlc3QgZm9yIGl0
LCBJIGhhdmUgbm8gaWRlYSB3aGF0IGlzIHRoZSBzaW1wbGVzdCB0ZXN0IHRoYXQgb25lCj4gICAg
IGNhbiBkbyB0byB2ZXJpZnkgdGhlIHByb3BlciBmdW5jdGlvbmFsaXR5IG9mIGdvYmplY3QtaW50
cm9zcGVjdGlvbgo+ICAgICBhZnRlciB3ZSBkbyB0aGUgYWJvdmUgY2hhbmdlcy4KClNvcnJ5IEkg
ZG9uJ3Qga25vdy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4g
Cj4gVGhvbWFzIFBldGF6em9uaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
