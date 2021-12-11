Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBF8C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 11:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2C2D80E06;
	Sat, 11 Dec 2021 11:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mda4Ly5LUisM; Sat, 11 Dec 2021 11:53:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59B3680DFD;
	Sat, 11 Dec 2021 11:53:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 385941BF2BD
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 11:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2644C61CCA
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 11:53:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ezj29BN3dlW for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 11:53:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC81661CC4
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 11:53:42 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id w0wdmIgpmhA9yw0wdmrJ5J; Sat, 11 Dec 2021 12:53:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639223620; bh=4ikzwyKF2sM9ljHL0M8dCcqg0+eNEndYnsbeYnHiPKw=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=gsxtXDDGw7JECHWz/TD46xVSVt9B0036mrWT93foqoWK9/OnwleBvfmPMLX71P1on
 5HDF01ERYV9t1dnt5JpP+YBgZ638mMY/ZjeToOLJOk6ODKKxbiJ3nWxKGx86xDhhan
 o1ImmQEcJOzsYbQnLnXDk0MkKKIMMBsuDNK9pXvNrhyKTBb56dFbwhPnlVgWEsDKTv
 ajs8HvftCqpK1kbpm41atLd/YjwBWdMJ29RPeUmT9maD1pPzK7QCAmkv+d17ffOkLo
 Sa7tuTflehoaZb927EhTjmv59KiM5p5ijSDlY9FgPyIfFHqFnmkpLZnHeyA6G9fI79
 6IZ3Z/5lNvEog==
To: Arnout Vandecappelle <arnout@mind.be>
References: <c2931bcc-68eb-e00e-5fc1-a67357c853b1@mind.be>
 <DFCC6A00-0724-4619-90D8-8D76A172442C@benettiengineering.com>
 <fc9dab66-647f-f64c-a277-b2686858c46f@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <c2867aec-0ac0-f6fc-8629-eeec6681c405@benettiengineering.com>
Date: Sat, 11 Dec 2021 12:53:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <fc9dab66-647f-f64c-a277-b2686858c46f@mind.be>
Content-Language: en-US
X-CMAE-Envelope: MS4wfKHhx3hFgs0kH/YDjUL9NUCoa57XEr3pTcLY/uKqTZwGoXCGH1rVGTQEVQpYTa3/ZVC8+m3Tic3TIJyksJyUKGse9pL679loXn1FvgTVMNfEXwRTYVx/
 Sr3xNjvmWLYqPj/SQqMWn2cHb8rgrP4DXeNklPetwdr6YmPkyByUlr/V+nN8xbYp4Ge6S1Zs3OTC/it45obhuchndEjsYgArh8CFHXPdOGzUPmg9pyx94uyO
 Hh7F1dAeKT3w9hb2riLP/j+THM1uKqL7YR4e9+gbQDLCAmSYpEcpolAcMBetvpFTvR1zAhEjK4RaSCPP9/Vs8A==
Subject: Re: [Buildroot] [PATCH 2/7] package/minijail: new package
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
Cc: buildroot@buildroot.org,
 =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 yann.morin.1998@free.fr
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gMTEvMTIvMjEgMDk6MzAsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3Rl
Ogo+IAo+IAo+IE9uIDEwLzEyLzIwMjEgMjE6MjYsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+PiBI
aSBBcm5vdXQsIFlhbm4sIEFsbCwKPj4KPj4+IElsIGdpb3JubyAxMCBkaWMgMjAyMSwgYWxsZSBv
cmUgMTk6MTUsIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4KPj4+IGhhIHNj
cml0dG86Cj4+Pgo+Pj4g77u/Cj4+Pgo+Pj4gT24gMTAvMTIvMjAyMSAxNTo0OCwgR2l1bGlvIEJl
bmV0dGkgd3JvdGU6Cj4+Pj4gSGkgSm9zw6ksCj4+Pj4gT24gMTAvMTIvMjEgMTU6MTIsIEpvc8Op
IFBla2thcmluZW4gd3JvdGU6Cj4+Pj4+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBwYWNrYWdlIGZv
ciBtaW5pamFpbC4KPj4+PiBSZXdvcmQgIlRoaXMgcGF0Y2ggYWRkIHBhY2thZ2UgbWluaWphaWwi
Cj4+Pgo+Pj4gQWN0dWFsbHksIG5vLiBGb3Igc29tZXRoaW5nIHRoaXMgc2ltcGxlLCBpdCdzIGJl
dHRlciB0byBsZWF2ZSB0aGUgYm9keSBlbXB0eQo+Pj4gKGkuZS4ganVzdCB0aGUgU29CKSwgYmVj
YXVzZSB0aGUgc3ViamVjdCBzYXlzIGl0IGFsbCBhbHJlYWR5Lgo+Pgo+PiBJIGFncmVlIHdpdGgg
eW91LiBCdXQgSSBkb27igJl0IGtub3cgd2h5IEnigJl2ZSBiZWVuIGFza2VkIHRvIHJlcGVhdCB0
aGUgc3VtbWFyeQo+PiBpbnRvIHRoZSBib2R5IG9mIGNvbW1pdCBsb2csIGxpa2UgaW4gdGhpcyBj
b21taXQ6Cj4+IGh0dHBzOi8vc291cmNlLmRlbnguZGUvdS1ib290L3UtYm9vdC8tL2NvbW1pdC80
Y2EyOGU5OGFjZTVkMTI1M2VkOGNiOTYyM2RmYWM5Mjk2ZDcwOTcxCj4+IDxodHRwczovL3NvdXJj
ZS5kZW54LmRlL3UtYm9vdC91LWJvb3QvLS9jb21taXQvNGNhMjhlOThhY2U1ZDEyNTNlZDhjYjk2
MjNkZmFjOTI5NmQ3MDk3MT4KPj4KPj4gVGhpcyBpcyBhIExpbnV4IHBhdGNoIHRoYXQgaGFzIGJl
ZW4gY29tbWl0dGVkIHRvIHBpbmN0cmwgbmV4dDoKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGttbC8yMDIxMTEyNTIxMTQ0My4xMTUwMTM1LTUtTXIuQm9zc21hbjA3NUBnbWFpbC5jb20vCj4+
IDxodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjExMTI1MjExNDQzLjExNTAxMzUtNS1N
ci5Cb3NzbWFuMDc1QGdtYWlsLmNvbS8+Cj4gCj4gICAgV2VsbCwgSSBoYXZlIG5vIGlkZWEgYWJv
dXQgdGhlIHByaW5jaXBsZXMgdGhhdCBsaWUgYmVoaW5kIHRoZSBjb21tZW50cyBnaXZlbgo+IGlu
IHRob3NlIG90aGVyIHByb2plY3RzLiBTbyBJIHRyaWVkIHRvIGZpbmQgdGhlIG1haWwgdGhhdCBh
c2tlZCBmb3IgaXQsIGJ1dCBJCj4gY291bGRuJ3QgZmluZCBpdCBlaXRoZXIgb24gdS1ib290IHBh
dGNod29yayBbMV0gb3Igb24gbG9yZS5rZXJuZWwub3JnLi4uCgpIZXJlIGlzIHRoZSB1LWJvb3Qg
TUwgZGlzY3Vzc2lvbiB0YWxraW5nIGFib3V0IGl0OgpodHRwczovL3d3dy5tYWlsLWFyY2hpdmUu
Y29tL3UtYm9vdEBsaXN0cy5kZW54LmRlL21zZzQwNTU2My5odG1sCgphbmQgc29tZSBjb21taXQg
aGF2ZSBzdW1tYXJ5IGFuZCBib2R5IGVxdWFsIG9yIHZlcnkgc2ltaWxhciwgbGlrZToKaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXgu
Z2l0L2NvbW1pdC8/aWQ9MTZiMzQzZThlMGVmN2RlNWNlNDUxNDI3ZmFmYzllMmVhNDJmNTQ4ZgoK
QnV0IGxvb2tpbmcgYXJvdW5kIEkgc2VlIHRoYXQgdXN1YWxseSBzdW1tYXJ5IGFuZCBib2R5IGFy
ZSBub3QgdGhlIHNhbWUsIAphbHNvIGEgY29tbWl0IGxvZyBhbG1vc3QgYWx3YXlzIGRlc2VydmVz
IGFuIGV4cGxhbmF0aW9uLiBTbyBiZXR0ZXIgCmFsbW9zdCBhbHdheXMgaGF2aW5nIGEgcGF0Y2gg
dGhhdCBleHBsYWlucyBpbiB0aGUgYm9keSB3aGF0IGlzIGdvaW5nIG9uIAphcyBZYW5uIHBvaW50
ZWQ6Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjEt
RGVjZW1iZXIvNjMwMjY4Lmh0bWwKClRoaXMgd2FzIG9ubHkgZm9yIGNvbXBsZXRlbmVzcyA6LSkK
CktpbmQgcmVnYXJkcwotLSAKR2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
