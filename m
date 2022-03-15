Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E765DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 20:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D53660B83;
	Tue, 15 Mar 2022 20:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uqObJjwXfPGI; Tue, 15 Mar 2022 20:01:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F90660B08;
	Tue, 15 Mar 2022 20:01:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3CB71BF301
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 929FD4032D
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sx6nCHRzYpYo for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 20:00:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 038E2402B1
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 20:00:57 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id r13so43890450ejd.5
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 13:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nCiSYlhTIsebFGn0fVazTRUq9eI2wdc5onv2OtSC0X0=;
 b=GLKPSO7vsFGqmkfYgjgXyccxLe4pnCy4lNb3KdETcx16DrhsYbJ1kb4lCprKmutkyD
 CDBCf+PE5nqHOU6O9OrKpZP1Trt1YdPyurUDAHNPckP6XgVCheNshZO+L5pj7rfy8UYI
 ZBGA+SdtuLL00WSW41+gGiXvMySC716cM/uCErKuRjWNwQf8JJaitmz9YJrkTYFXio8Y
 rQMSlRtMpDxIJuakUTHH9uyyxvt1uUgygt7wMgoZdcl3c9GDD4l7JirT89m1iRZPXKwf
 xjnyibVW1Akm56ewVDSEzGcprC5Ns+RDndPuHW+Y9DJuHtEx6YRrqRdB2j7jb2Y5llMj
 1nIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nCiSYlhTIsebFGn0fVazTRUq9eI2wdc5onv2OtSC0X0=;
 b=xfx5/HMsoQ7zieVz9wr7in1oyNX8YaXLdCk0TvjZFU5/1rHUx1jHjbIRecHHMehuhf
 zRO+wPycCCst3o42/ZSZ1ei62HUSBBX/BoAXzh+RjZmblgNugnbaSdp8Q3Cp+BzOD6S7
 kwpaovu2j6A7pWdpReaZx1BF6dW+586W6fSZFEepiWmXbLJK3v8KpCTAt8kCoG9STdCV
 E/NQocjwpTGdtIuNnKfQsXWODqbGb8dh0cp+vjZo97VP0GQSvMX/oIDImjZdNwQKGMxO
 TL/QmgWH9A+mHx+hjdlcDrf8h1tpkUclTMA185oW082h2mBcTU+r77cjfM9/ypWFFDOQ
 IZ6g==
X-Gm-Message-State: AOAM533smALx7bvXPQ0OYgK18VeIF+OkK8Y2xBM9NJKkEw3B+xrWo78m
 nbtMy8N/44mDPZAfr0B8lmOOJg==
X-Google-Smtp-Source: ABdhPJwqCApnVgpDn+dgWQYPlTzLW2709VLXhbccHSNY5nqaN9YnCxO+tmdaZ9KXpxvFi6TS9d7tqA==
X-Received: by 2002:a17:907:6096:b0:6da:68d2:327f with SMTP id
 ht22-20020a170907609600b006da68d2327fmr24213256ejc.761.1647374455811; 
 Tue, 15 Mar 2022 13:00:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a170906540700b006d5eca5c9cfsm8597713ejo.191.2022.03.15.13.00.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 13:00:55 -0700 (PDT)
Message-ID: <dc6491aa-fac9-75cb-2a3e-e4b847c496ae@mind.be>
Date: Tue, 15 Mar 2022 21:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Sourabh Hegde <hrsourabh011@gmail.com>, Jan Havran <havran.jan@email.cz>
References: <CADYjeSsCzsQbWw25kghn49m6vZ9XBMi5NQfBHhTh5X6E3z=JFg@mail.gmail.com>
 <CADYjeStJRry=ed46Km6nsaFk+wtbaxs0bLDfiPmtJ7xwZs2UwA@mail.gmail.com>
 <Yio9dHRYViMb7+iG@arch-zen.localdomain>
 <CADYjeSvNBqiYOuQrxdpQF_9t0w+4pf6B4d-Ufs5xAkkgCZGfFA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADYjeSvNBqiYOuQrxdpQF_9t0w+4pf6B4d-Ufs5xAkkgCZGfFA@mail.gmail.com>
Subject: Re: [Buildroot] How to connect to Wifi on start-up using Buildroot?
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNS8wMy8yMDIyIDE0OjA1LCBTb3VyYWJoIEhlZ2RlIHdyb3RlOgo+IEhlbGxsbyBKYW4s
Cj4gCj4gVGhhbmtzIGZvciB0aGUgYW5zd2VyLgo+IAo+ICBGcm9tIEJ1aWxkcm9vdCAyMDIxIHJl
bGVhc2UgImN0cmxfaW50ZXJmYWNlIiBpcyBkaXNhYmxlZCBhbmQgc28gSSBoYXZlIAoKICBJdCdz
IGRpc2FibGVkIHVubGVzcyBCUjJfUEFDS0FHRV9XUEFfU1VQUExJQ0FOVF9DVFJMX0lGQUNFPXkK
Cj4gY29tbWVudGVkIG91dCBiZWxvdyBsaW5lIGluIGV0Yy93cGFfc3VwcGxpY2FudC5jb25mIGZp
bGUKPiAKPiAjIHxjdHJsX2ludGVyZmFjZT0vdmFyL3J1bi93cGFfc3VwcGxpY2FudHwKCiAgVGhp
cyBzaG91bGRuJ3QgYmUgbmVlZGVkLiBBRkFJSyB3cGFfc3VwcGxpY2FudCBpZ25vcmVzIHRoZSBv
cHRpb24gaWYgCkNUUkxfSUZBQ0UgaXMgbm90IGVuYWJsZWQuCgo+IHwKPiB8Cj4gfEFuZCBhbHNv
IGluIG15IHJvb3RmcywgdGhlcmUgaXMgbm8gInwvdmFyL3J1bi93cGFfc3VwcGxpY2FudHwiIGZp
bGUuCgogIFRoZSBmaWxlIChhY3R1YWxseSwgbmFtZWQgcGlwZSkgaXMgY3JlYXRlZCB3aGVuIHdw
YV9zdXBwbGljYW50cyBzdGFydHMgdXAuIAovdmFyL3J1biBpcyBhIHRtcGZzIHNvIGl0IGNhbiBv
bmx5IGJlIGNyZWF0ZWQgYXQgcnVudGltZS4KCj4gfAo+IHwKPiB8Cj4gfEkgaGF2ZSBzZXQgYmVs
b3cgb3B0aW9ucyBpbiBtZW51Y29uZmlnfAo+IHwKPiB8Cj4gbWVudWNvbmZpZy5QTkcKPiAKPiBU
aGVuIGRvaW5nIG1ha2UgY2xlYW4gJiBtYWtlIHJlc3VsdHMgaW4gYmVsb3cgZXJyb3JzOgo+IAo+
ICA+Pj4gd3BhX3N1cHBsaWNhbnQgMi4xMCBJbnN0YWxsaW5nIHRvIHN0YWdpbmcgZGlyZWN0b3J5
Cj4gL3Vzci9iaW4vaW5zdGFsbCAtbSAwNjQ0IC1EIAo+IC9yb290L3Jhc3BjbTQvc291cmNlcy9v
dXRwdXQvYnVpbGQvd3BhX3N1cHBsaWNhbnQtMi4xMC93cGFfc3VwcGxpY2FudC9saWJ3cGFfY2xp
ZW50LnNvIAo+IC9yb290L3Jhc3BjbTQvc291cmNlcy9vdXRwdXQvaG9zdC9hYXJjaDY0LWJ1aWxk
cm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvbGliL2xpYndwYV9jbGllbnQuc28KPiAvdXNyL2Jp
bi9pbnN0YWxsOiBjYW5ub3Qgc3RhdCAKPiAnL3Jvb3QvcmFzcGNtNC9zb3VyY2VzL291dHB1dC9i
dWlsZC93cGFfc3VwcGxpY2FudC0yLjEwL3dwYV9zdXBwbGljYW50L2xpYndwYV9jbGllbnQuc28n
OiAKPiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gbWFrZVsxXTogKioqIFtwYWNrYWdlL3Br
Zy1nZW5lcmljLm1rOjMzMSA8aHR0cDovL3BrZy1nZW5lcmljLm1rOjMzMT46IAo+IC9yb290L3Jh
c3BjbTQvc291cmNlcy9vdXRwdXQvYnVpbGQvd3BhX3N1cHBsaWNhbnQtMi4xMC8uc3RhbXBfc3Rh
Z2luZ19pbnN0YWxsZWRdIAo+IEVycm9yIDEKPiBtYWtlOiAqKiogW01ha2VmaWxlOjIzOiBfYWxs
XSBFcnJvciAyCj4gCj4gQ2FuIHlvdSBwbGVhc2UgbGV0IG1lIGtub3cgd2hhdCBjb3VsZCBiZSB0
aGUgaXNzdWUgYW5kIGhvdyB0byByZXNvbHZlIGl0PwoKICBJJ3ZlIHRyaWVkIHRvIGJ1aWxkIHRo
ZSBzYW1lIGNvbmZpZ3VyYXRpb24gKHdpdGggY3VycmVudCBnaXQgbWFzdGVyKSBhbmQgaXQgCmJ1
aWxkcyB3aXRob3V0IHByb2JsZW1zLgoKICBQbGVhc2Ugc3VwcGx5IHRoZSBkZWZjb25maWcgYW5k
IGFsc28gdGhlIGZ1bGwgYnVpbGQgbG9nIChieSB1cGxvYWRpbmcgdG8gYSAKcGFzdGViaW4pLgoK
ICBSZWdhcmRzLAogIEFybm91dAoKCj4gCj4gVGhhbmtzIGluIGFkdmFuY2UKPiB8fAo+IAo+IE9u
IFRodSwgMTAgTWFyIDIwMjIgYXQgMTk6MDMsIEphbiBIYXZyYW4gPGhhdnJhbi5qYW5AZW1haWwu
Y3ogCj4gPG1haWx0bzpoYXZyYW4uamFuQGVtYWlsLmN6Pj4gd3JvdGU6Cj4gCj4gICAgIEhpIFNv
dXJhYmgsCj4gCj4gICAgIGFmdGVyIGVuYWJsaW5nIFJQaSBmaXJtd2FyZSB5b3UgbXVzdCBsb2Fk
IHRoZSBXaWZpIGRyaXZlciAtIHNpbmNlIHlvdSBhcmUgdXNpbmcKPiAgICAgc3lzdGVtZCwgaXQg
c2hvdWxkIGJ5IGhhbmRsZWQgYnkgdWRldiBvbiBzdGFydCBJIHRoaW5rLgo+IAo+ICAgICBTbyB5
b3UgcHJvYmFibHkganVzdCBuZWVkIHRvIGNvbmZpZ3VyZSAvZXRjL25ldHdvcmsvaW50ZXJmYWNl
cyB0byBzdGFydAo+ICAgICB3cGFfc3VwcGxpY2FudAo+ICAgICBvbiB3bGFuMCB3aXRoIC9ldGMv
d3BhX3N1cHBsaWNhbnQuY29uZiBmaWxlLCB3aGVyZSB5b3UgY2FuIHB1dCB5b3VyIGNyZWRlbnRp
YWxzLgo+ICAgICBPciBhdCBsZWFzdCB0aGF0IGlzIHdoYXQgSSBoYXZlIGRvbmUsIGJ1dCBJIGFt
IG5vdCB1c2luZyBzeXN0ZW1kLgo+IAo+ICAgICBJIGRpZCBzb21ldGhpbmcgc2ltaWxhciBzb21l
IHRpbWUgYWdvLCB5b3UgY2FuIGNoZWNrIGl0IGhlcmU6Cj4gICAgIGh0dHBzOi8vZ2l0bGFiLmNv
bS9zb25pY3BwL2duc3MtcGkvLS9jb21taXQvY2FmMDMxN2MwMjRlNTFmYzdlMzIyZGVhY2QwOWVj
OTM0NmQ0N2UyNgo+ICAgICA8aHR0cHM6Ly9naXRsYWIuY29tL3NvbmljcHAvZ25zcy1waS8tL2Nv
bW1pdC9jYWYwMzE3YzAyNGU1MWZjN2UzMjJkZWFjZDA5ZWM5MzQ2ZDQ3ZTI2Pgo+IAo+ICAgICAo
bm90ZSB0aGF0IHRvIG1ha2UgIm15IiBjcmVkZW50aWFscyBwdWJsaWMgaW4gdGhhdCBjb21taXQg
d2FzIGFuIGludGVudGlvbikuCj4gCj4gICAgIFAuUy46IGlmIHlvdSB3YW50IHRvIGhhdmUgYW55
IG1vZGlmaWNhdGlvbnMgdG8gYmUgcGFydCBvZiB5b3VyIGltYWdlIHdpdGgKPiAgICAgZmlsZXN5
c3RlbSwKPiAgICAgeW91IGNhbiBkbyBpdCBieSB1c2luZyByb290ZnMgb3ZlcmxheXMgZm9yIGV4
YW1wbGU6Cj4gICAgIGh0dHBzOi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFudWFsL21hbnVh
bC5odG1sI3Jvb3Rmcy1jdXN0b20KPiAgICAgPGh0dHBzOi8vYnVpbGRyb290Lm9yZy9kb3dubG9h
ZHMvbWFudWFsL21hbnVhbC5odG1sI3Jvb3Rmcy1jdXN0b20+Cj4gCj4gICAgIFJlZ2FyZHMsCj4g
Cj4gICAgIEphbiBIYXZyYW4KPiAKPiAgICAgVsKgVGh1LCBNYXIgMTAsIDIwMjIgYXQgMDU6NDM6
MjdQTSArMDEwMCzCoFNvdXJhYmggSGVnZGUgbmFwc2FsKGEpOgo+ICAgICAgPiBIZWxsbyBBbGws
Cj4gICAgICA+Cj4gICAgICA+IEkgYW0gdHJ5aW5nIHRvIGNvbm5lY3QgbXkgUmFzcGJlcnJ5IFBp
IENNNCB0byBXaWZpIGF1dG9tYXRpY2FsbHkgYWZ0ZXIKPiAgICAgID4gc3RhcnQtdXAuIEkgYW0g
dXNpbmcgQnVpbGRyb290IGJhc2VkIExpbnV4IGRpc3RyaWJ1dGlvbi4gSSBoYXZlIHdvcmtlZCB3
aXRoCj4gICAgICA+IFlvY3RvIGJlZm9yZSBhbmQgaXQgcHJvdmlkZXMgc3lzdGVtZC1uZXR3b3Jr
ZCBhbmQgd3BhX3N1cHBsaWNhbnQgZmVhdHVyZSB0bwo+ICAgICAgPiBjb25uZWN0IHRvIHdpZmkg
b24gYm9vdC4gSSBhbSBsbG9raW5nIHNvbWV0aGluZyBzaW1pbGFyIGluIEJ1aWxkcm9vdCBidXQK
PiAgICAgID4gY291bGRuJ3QgZmluZCBhbnkgbm90ZXMgb25saW5lLgo+ICAgICAgPgo+ICAgICAg
PiBTbyBmYXIsIEkgdGhpbmsgSSBoYXZlIGVuYWJsZWQgdGhlIG5lY2Vzc2FyeSBjb25maWcvZHJp
dmVyIHVzaW5nICJtYWtlCj4gICAgICA+IG1lbnVjb25maWciIDoKPiAgICAgID4gW2ltYWdlOiB3
cGFfc3VwcGxpY2FudC5wbmddCj4gICAgICA+IFtpbWFnZTogZmlybXdhcmUucG5nXQo+ICAgICAg
Pgo+ICAgICAgPiBCdXQgbm93LCBob3cgY2FuIEkgc2V0LXVwIHdwYV9zdXBwbGljYW50LmNvbmY/
IEFueSBsaW5rIHRvIG5vdGVzIG9yCj4gICAgICA+IHN1Z2dlc3Rpb24gd291bGQgYmUgaGVscGZ1
bC4KPiAgICAgID4KPiAgICAgID4gQ2FuIGFueW9uZSBwbGVhc2UgbGV0IG1lIGtub3cgaG93IHRv
IHByb2NlZWQgZnVydGhlciB3aXRoIGl0Pwo+ICAgICAgPgo+ICAgICAgPiBZb3VyIGhlbHAgd2ls
bCBiZSBtdWNoIGFwcHJlY2lhdGVkLgo+ICAgICAgPgo+ICAgICAgPiBUaGFua3MgaW4gYWR2YW5j
ZS4KPiAgICAgID4KPiAgICAgID4gUC5TOiBJIGFtIHVzaW5nIEJ1aWxkcm9vdCAyMDIyLjAyIHJl
bGVhc2UgYW5kIGFsc28gdXNpbmcgc3lzdGVtZCBmZWF0dXJlCj4gICAgICA+IGFuZCBsZXQgbWUg
a25vdyBpZiBhbnkgaW5mbyBpcyBtaXNzaW5nIGhlcmUuCj4gICAgICA+Cj4gICAgICA+IFJlZ2Fy
ZHMsCj4gICAgICA+Cj4gICAgICA+IFNvdXJhYmgKPiAKPiAKPiAKPiAKPiAgICAgID4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiAgICAgID4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+ICAgICAgPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZyA8bWFpbHRv
OmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPgo+ICAgICAgPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAgICAgPGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdD4KPiAKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
