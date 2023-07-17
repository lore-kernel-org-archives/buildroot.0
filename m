Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B0FC001DF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 15:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E571F81E36;
	Mon, 17 Jul 2023 15:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E571F81E36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJhk_eJuggWl; Mon, 17 Jul 2023 15:19:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F352581BA8;
	Mon, 17 Jul 2023 15:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F352581BA8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09DF01BF341
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 15:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D765F40A67
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 15:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D765F40A67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EXTtp08hRIaO for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 15:19:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8695740A66
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8695740A66
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 15:19:27 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-991c786369cso610204566b.1
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 08:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689607165; x=1692199165;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7yRMqIWYpJLjH9R7CiJ5BmmgPh62nMRhomfzWPuga+s=;
 b=Jg2HRdyT3BDq3sy0/Z2pxEqQOoB6qrz/UNXD9rwRhpaWNMK1lQ6eK9X+0AYKnEmmAI
 eqV3MKubSu9KwdzlPD3Pvc13H1SRnd2b30RIDkD9qr/fSxhra5TfI9z/36gADPkmZWJY
 2nnY+ktiwAPmALBEg87Ul3SiAcotYVRKTAILBW+Rui5rvWdzIdtv83nCubl3TM5eWd6J
 yuxQkEIzyaJdBIA7bcScrCTxY2LHbTPNUoUToLSVjq/xzBkpdLlBf0DZqc5+E6yNh92c
 Wh0eRGf7kvXV1kJfYgkKOpWe11w8Sdi1FL7niSQLI9ISOeKoutJeVkzIGWMbtKlFsFYZ
 uc/A==
X-Gm-Message-State: ABy/qLaTdROA/faZpNaWXY3tK+AgOgKiFRDDMBKOWYBukydASrb34lBz
 AlxhEESTkxiSjdpE3xkT4oKXPA==
X-Google-Smtp-Source: APBJJlF7GGFlhJetEpInu0Mlb4cWlmWoVhykk+PX32malcxOmwi/aMdgCBISoziK3TMv3vco0HjeNQ==
X-Received: by 2002:a17:906:51d2:b0:992:b928:adb3 with SMTP id
 v18-20020a17090651d200b00992b928adb3mr11245469ejk.54.1689607165337; 
 Mon, 17 Jul 2023 08:19:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 i22-20020a1709063c5600b009875a6d28b0sm9394613ejg.51.2023.07.17.08.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 08:19:24 -0700 (PDT)
Message-ID: <43b3c8f2-17f0-fe13-5421-49abb44f2481@mind.be>
Date: Mon, 17 Jul 2023 17:19:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Andreas <andreasembbuild@gmail.com>, buildroot@buildroot.org
References: <CAOLWrZ-zYdgpvg-UUrHb8-Y+dfSauONGxf+Uynjj0d7XQ2HFYQ@mail.gmail.com>
In-Reply-To: <CAOLWrZ-zYdgpvg-UUrHb8-Y+dfSauONGxf+Uynjj0d7XQ2HFYQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1689607165; x=1692199165;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7yRMqIWYpJLjH9R7CiJ5BmmgPh62nMRhomfzWPuga+s=;
 b=JQwyJ87I/PvagJL8Zaw4tkZP7xS/xeQdq/RMeBXa48Qa9KLv6xFTJ+JYhbPot7v1lm
 9iiKjsKFCytGfw0nB6uBSI0uZih5pov+xNfnx6Ls5etGUoDtCI8HqwSSYkJ2rt0kjeYz
 KLEr+Jcqzqxyx3UjCzCPEosFgj/NbwWmAXprFL5mOLeejX3VaHl3fMKidG+kfGb1BseJ
 Ed6JL/iuVjMSdUGADwah9BMH6Fxt6+IsdWflJlHu53RmvWK0IjzuuB8t8N5ZF8twJkN0
 9vuDZ6WV2tTOLFteaOwDGiTiEQIWl4bz9/4pGTxWFuvupXWqV73RSrykVdklHGnwXmDj
 a0hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JQwyJ87I
Subject: Re: [Buildroot] Missing dependencies
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNy8wNy8yMDIzIDE2OjEwLCBBbmRyZWFzIHdyb3RlOgo+IEhpLAo+IAo+IEkgYW0gbmV3
IHRvIGJ1aWxkcm9vdCBhbmQgSSBhbSB0cnlpbmcgdG8gYnVpbGQgdGhlIHBhY2thZ2UgCj4gcHl0
aG9uLWhhdGNobGluZy0xLjE4LjAuIEhvd2V2ZXIgaXQgZmFpbHMgd2l0aCB0aGUgZm9sbG93aW5n
IG1lc3NhZ2U6Cj4gCj4gKiBHZXR0aW5nIGRlcGVuZGVuY2llcyBmb3Igd2hlZWwuLi4KPiAKPiBF
UlJPUiBNaXNzaW5nIGRlcGVuZGVuY2llczoKPiB0b21saT49MS4yLjI7IHB5dGhvbl92ZXJzaW9u
IDwgJzMuMTEnCgogIFRoYXQncyByZWFsbHkgd2VpcmQuLi4gVGhpcyBsaW5lIG1lYW5zIHRoYXQg
aXQgZGVwZW5kcyBvbiB0b21saSwgYnV0IG9ubHkgZm9yIApQeXRob24tMy4xMCBvciBsb3dlci4g
U2luY2Ugd2UncmUgdXNpbmcgUHl0aG9uIDMuMTEuNCwgdGhpcyBkZXBlbmRlbmN5IHNob3VsZG4n
dCAKdHJpZ2dlciBhdCBhbGwuLi4gWW91J3JlIG5vdCB1c2luZyBhbiBvbGQgQnVpbGRyb290IHZl
cnNpb24gdGhhdCBzdGlsbCB1c2VzIAozLjEwLCBhcmUgeW91PwoKCj4gbWFrZTogKioqIFtwYWNr
YWdlL3BrZy1nZW5lcmljLm1rOjI5MyA8aHR0cDovL3BrZy1nZW5lcmljLm1rOjI5Mz46IAo+IC9i
dWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3B5dGhvbi1oYXRjaGxpbmctMS4xOC4wLy5zdGFtcF9idWls
dF0gRXJyb3IgMQo+IAo+IFRoZSBweXRob24taGF0Y2hsaW5nLm1rIDxodHRwOi8vcHl0aG9uLWhh
dGNobGluZy5taz4gZmlsZSBsb29rcyBhcyBmb2xsb3dzOgo+ICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCj4gIwo+ICMgcHl0aG9uLWhhdGNobGluZwo+ICMKPiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iwo+IAo+IFBZVEhPTl9IQVRDSExJTkdfVkVSU0lPTiA9IDEuMTguMAoKICBFcm0sIHB5dGhvbi1o
YXRjaGxpbmcgd2FzIGFkZGVkIHRvIEJ1aWxkcm9vdCBpbiBjb21taXQgCjYyNmM1YmVkYWE3ZTE0
NjFkZDM3NDc1NjJiOWMwNGRkNDA3MTNjODMsIGluIDIwMjIuMTEuIEhhdmUgeW91IHRyaWVkIGp1
c3QgCnVwZGF0aW5nIHRoZSBleGlzdGluZyBwYWNrYWdlIChhbmQgc2VuZGluZyB0aGUgcGF0Y2gg
dXBzdHJlYW0gdG8gdXMsIG9mIGNvdXJzZSk/CgogIFdlIG9ubHkgaGF2ZSBhIGhvc3QgcGFja2Fn
ZSBmb3IgaXQsIGJlY2F1c2UgaXQncyBhIHBlcDUxNyBzbyBub3JtYWxseSBub3QgCnVzZWZ1bCBv
biB0aGUgdGFyZ2V0LiBXaHkgZG8geW91IG5lZWQgdGhlIHRhcmdldCBwYWNrYWdlPwoKPiBQWVRI
T05fSEFUQ0hMSU5HX1NPVVJDRSA9IGhhdGNobGluZy0kKFBZVEhPTl9IQVRDSExJTkdfVkVSU0lP
TikudGFyLmd6Cj4gUFlUSE9OX0hBVENITElOR19TSVRFID0gCj4gaHR0cHM6Ly9maWxlcy5weXRo
b25ob3N0ZWQub3JnL3BhY2thZ2VzL2UzLzU3Lzg3ZGEyYzVhZGMxNzM5NTBlYmU5ZjFhY2NlNGQ1
ZjJjZDBhOTYwNzgzOTkyZmQ0ODc5YTg5OWEwYjYzNwo+IFBZVEhPTl9IQVRDSExJTkdfU0VUVVBf
VFlQRSA9IHBlcDUxNwo+IFBZVEhPTl9IQVRDSExJTkdfTElDRU5TRSA9IE1JVAo+IFBZVEhPTl9I
QVRDSExJTkdfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UudHh0Cj4gCj4gUFlUSE9OX0hBVENITElO
R19ERVBFTkRFTkNJRVMgPSBcCj4gcHl0aG9uLXRvbWxpIFwKCiAgSSB0aGluayB0aGUgcHJvYmxl
bSBpcyB0aGF0IHBlcDUxNyBjaGVja3MgZm9yIHRoZSBwcmVzZW5jZSBvZiB0b21saSBpbiB0aGUg
Cl9ob3N0XyBkaXJlY3RvcnkuIFNvIHlvdSdkIG5lZWQgdG8gYWRkIGEgZGVwZW5kZW5jeSBvbiBo
b3N0LXB5dGhvbi10b21saSBoZXJlLiAKSmFtZXMgaXMgbW9yZSBhd2FyZSBvZiB0aGVzZSB0aGlu
Z3Mgc28gSSBwdXQgaGltIGluIENjLgoKPiBweXRob24tZWRpdGFibGVzIFwKPiBweXRob24tcGFj
a2FnaW5nIFwKPiBweXRob24tcGF0aHNwZWMgXAo+IHB5dGhvbi1wbHVnZ3kgXAo+IHB5dGhvbi10
cm92ZS1jbGFzc2lmaWVycwo+IEhPU1RfUFlUSE9OX0hBVENITElOR19ERVBFTkRFTkNJRVMgPSBc
Cj4gaG9zdC1weXRob24tdG9tbGkgXAo+IGhvc3QtcHl0aG9uLWVkaXRhYmxlcyBcCj4gaG9zdC1w
eXRob24tcGFja2FnaW5nIFwKPiBob3N0LXB5dGhvbi1wYXRoc3BlYyBcCj4gaG9zdC1weXRob24t
cGx1Z2d5IFwKPiBob3N0LXB5dGhvbi10cm92ZS1jbGFzc2lmaWVycwo+IAo+ICQoZXZhbCAkKHB5
dGhvbi1wYWNrYWdlKSkKPiAkKGV2YWwgJChob3N0LXB5dGhvbi1wYWNrYWdlKSkKPiAKPiBJIGRv
IGhhdmUgYSBweXRob24tdG9tbGkubWsgPGh0dHA6Ly9weXRob24tdG9tbGkubWs+IGZpbGUgdGhl
cmVmb3JlIEkgYW0gCj4gY29uZnVzZWQgd2h5IEkgYW0gc2VlaW5nIHRoaXMgZXJyb3IuIElmIEkg
cmVtb3ZlIHRoZSB0b21saSBkZXBlbmRlbmN5IGZyb20gdGhlIAo+IHB5cHJvamVjdC50b21sIGZp
bGUgaW4gaGF0Y2hsaW5nIChpbiBvdXRwdXQvYnVpbGQvcHl0aG9uLWhhdGNobGluZy0xLjE4LjAp
IAo+IG1hbnVhbGx5IGl0IGNvbnRpbm91ZXPCoHRoZSBidWlsZC4KPiAKPiBkZXBlbmRlbmNpZXMg
PSBbCj4gIMKgICJlZGl0YWJsZXM+PTAuMyIsCj4gIMKgICJwYWNrYWdpbmc+PTIxLjMiLAo+ICDC
oCAicGF0aHNwZWM+PTAuMTAuMSIsCj4gIMKgICJwbHVnZ3k+PTEuMC4wIiwKPiAgwqAgInRvbWxp
Pj0xLjIuMjsgcHl0aG9uX3ZlcnNpb24gPCAnMy4xMSciLAo+ICDCoCAidHJvdmUtY2xhc3NpZmll
cnMiLAo+IF0KPiAKPiBNeSBpbXByZXNzaW9uIGlzIHRoYXQgbXkgY3VycmVudCBidWlsZHJvb3Qg
c2V0dXAgaGFzIGEgcHJvYmxlbSB0byBwcm9wZXJseSAKPiBpbnRlcnByZXQgdGhlIGxpbmUgYCAi
dG9tbGk+PTEuMi4yOyBweXRob25fdmVyc2lvbiA8ICczLjExJyJgIG1heWJlIGJlY2F1c2Ugb2Yg
Cj4gYW4gb3V0ZGF0ZWQgcGFja2FnZSB0aGF0IEkgYW0gbm90IGF3YXJlIG9mLgoKICBJIHRoaW5r
IHRoaXMgd2F5IG9mIGV4cHJlc3NpbmcgdmVyc2lvbi1kZXBlbmRlbnQgZGVwZW5kZW5jaWVzIGlz
IGFscmVhZHkgCnByZXR0eSBvbGQsIGFuZCBjZXJ0YWlubHkgcHJlZGF0ZXMgdGhlIHBlcDUxNyBp
bmZyYXN0cnVjdHVyZSBpbiBCdWlsZHJvb3QsIHNvIApJJ2QgYmUgc3VycHJpc2VkIGlmIHRoaXMg
d2VyZSB0aGUgY2FzZS4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gQW55IGlkZWEgaG93IHRvIGFk
ZHJlc3PCoHRoaXMgaXNzdWUgCj4gYW5kwqBob3cgdG8gZGVidWcgc3VjaCBhbiBlcnJvciBpbsKg
YnVpbGRyb290IGluIGZ1dHVyZT8gSSBhbHJlYWR5IGNoZWNrZWQgdGhlIAo+IG1hbnVhbCwgZXNw
ZWNpYWxseSB0aGUgc2VjdGlvbiBmb3IgcHl0aG9uIHBhY2thZ2VzLgo+IAo+IFJlZ2FyZHMsCj4g
QW5kcmVhcwo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
