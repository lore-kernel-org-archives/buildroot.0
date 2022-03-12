Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D78EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0926B60E68;
	Sat, 12 Mar 2022 20:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yep25cRABxFn; Sat, 12 Mar 2022 20:16:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFFE160E63;
	Sat, 12 Mar 2022 20:16:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CA291BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A01A825C6
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id icfIezEAuhmf for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:16:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47150825BF
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:16:27 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id yy13so26064086ejb.2
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 12:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=/tfgIYB4UASc7pqKTCWgdVONKCHcDPQ0sldOeG6KqTs=;
 b=gFV2XVpld6ZBSnuSrDQWJxwNIkQ/9ao+i7W79Cl8c12/THqPRIo89bU4qKQ0QGkT/L
 alEJcaGU5UDv++W6TDTZHNw+ntjpnqk1/+U6vRRguiabur3nTCydNfEWqCfg1JTtLX7f
 KDyBw4eL3C3bMgwVG0A9zj93cgZgvCSPGGCfTniRsBMNnX912oVCSkr6FLu0Mp81ZeYz
 T7Vj6gZTB62hiYk8zVTeJbH1DIwFtiowUCJs6/KYhgyLrsiEiO87tBC7V/EswRJ2VotJ
 nuQHNEumpf63wtIn60oZ0w3e6HUXwUg0RmmsXV/lktghkEpfzLGUEU7KqnFpQ/P4bHxY
 GxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/tfgIYB4UASc7pqKTCWgdVONKCHcDPQ0sldOeG6KqTs=;
 b=yGdPU3lp95G4/DxtS/TCE0b71cDjzl9MEBVWgNS6/7Uv5/ZVuNtCwzUecpva93BFih
 Cbr+dFkoZQ9NWf/ACcVRJk3Dv1N7gqgr6bIym+2tz/a7R5rbEMdC3PJsfOSJDEiqc9Tu
 lXpU6OYx1/XYesdXwsyKjv0FV71lUgxYuuYDIMYXOtLsiOR6TIW2JAJtIySBBQrtdcXA
 2E/y5n5lpIQyDB4D7OiEfPirm6bigXT+a9UKhmygCVSjuYw9X8j8+JIl++y1ZZnyZ/ki
 cB4N095NrKlJGUndllPunrTk3eOhKFcw2w2uTNV/jQycJCROKe9EX1y4ATXHOUbl+Luj
 ir4A==
X-Gm-Message-State: AOAM53265yStWjMwAFKxq2kUHX+Tp0V1RwlM6OzhuCQN8k+bf4zbrMWn
 ooDHa1KEjk+RHRbk3jjsEbC+BRNQvUiyNA==
X-Google-Smtp-Source: ABdhPJwl1hqjKvZmC/lRHQMEW/ouUCbhbi3/Xw+66gpI9NkDZgrprpJXsDmg0gKlr8Erqr+17IWa6g==
X-Received: by 2002:a17:907:9706:b0:6db:566a:4408 with SMTP id
 jg6-20020a170907970600b006db566a4408mr13322005ejc.374.1647116185525; 
 Sat, 12 Mar 2022 12:16:25 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b24-20020a170906491800b006db31196e2bsm4692417ejq.218.2022.03.12.12.16.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 12:16:25 -0800 (PST)
Message-ID: <9f14637e-c0b5-2a6d-289c-cdc4a45f197b@mind.be>
Date: Sat, 12 Mar 2022 21:16:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220223221358.4097881-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220223221358.4097881-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/screen: bump to version
 4.9.0
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIzLzAyLzIwMjIgMjM6MTMsIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4gLSBEcm9wIGxh
dGVzdCBwYXRjaCAoYWxyZWFkeSBpbiB2ZXJzaW9uKQo+IC0gVXBkYXRlIGluZGVudGF0aW9uIGlu
IGhhc2ggZmlsZSAodHdvIHNwYWNlcykKPgo+IGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZl
L2h0bWwvc2NyZWVuLXVzZXJzLzIwMjItMDIvbXNnMDAwMDAuaHRtbAo+Cj4gU2lnbmVkLW9mZi1i
eTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CgogwqBBcHBs
aWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKIMKgUmVnYXJkcywKIMKgQXJub3V0Cgo+IC0tLQo+ICAg
cGFja2FnZS9zY3JlZW4vMDAwOC1DVkUtMjAyMS0yNjkzNy5wYXRjaCB8IDY4IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+ICAgcGFja2FnZS9zY3JlZW4vc2NyZWVuLmhhc2ggICAgICAgICAgICAg
ICB8ICA2ICstLQo+ICAgcGFja2FnZS9zY3JlZW4vc2NyZWVuLm1rICAgICAgICAgICAgICAgICB8
ICA1ICstCj4gICAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNzUgZGVsZXRpb25z
KC0pCj4gICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zY3JlZW4vMDAwOC1DVkUtMjAyMS0y
NjkzNy5wYXRjaAo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc2NyZWVuLzAwMDgtQ1ZFLTIwMjEt
MjY5MzcucGF0Y2ggYi9wYWNrYWdlL3NjcmVlbi8wMDA4LUNWRS0yMDIxLTI2OTM3LnBhdGNoCj4g
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggZGY3ZWZhMDI5NC4uMDAwMDAwMDAwMAo+
IC0tLSBhL3BhY2thZ2Uvc2NyZWVuLzAwMDgtQ1ZFLTIwMjEtMjY5MzcucGF0Y2gKPiArKysgL2Rl
di9udWxsCj4gQEAgLTEsNjggKzAsMCBAQAo+IC1EZXNjcmlwdGlvbjogW0NWRS0yMDIxLTI2OTM3
XSBGaXggb3V0IG9mIGJvdW5kcyBhcnJheSBhY2Nlc3MKPiAtQXV0aG9yOiBNaWNoYWVsIFNjaHLD
tmRlciA8bWxzQHN1c2UuZGU+Cj4gLUJ1Zy1EZWJpYW46IGh0dHBzOi8vYnVncy5kZWJpYW4ub3Jn
Lzk4MjQzNQo+IC1CdWc6IGh0dHBzOi8vc2F2YW5uYWguZ251Lm9yZy9idWdzLz82MDAzMAo+IC1C
dWc6IGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvc2NyZWVuLWRldmVsLzIwMjEt
MDIvbXNnMDAwMDAuaHRtbAo+IC1CdWctT1NTLVNlY3VyaXR5OiBodHRwczovL3d3dy5vcGVud2Fs
bC5jb20vbGlzdHMvb3NzLXNlY3VyaXR5LzIwMjEvMDIvMDkvMwo+IC1PcmlnaW46IGh0dHBzOi8v
bGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvc2NyZWVuLWRldmVsLzIwMjEtMDIvbXNnMDAwMTAu
aHRtbAo+IC0KPiAtRG93bmxvYWRlZCBmcm9tIERlYmlhbjoKPiAtaHR0cHM6Ly9zb3VyY2VzLmRl
Ymlhbi5vcmcvZGF0YS9tYWluL3Mvc2NyZWVuLzQuOC4wLTUvZGViaWFuL3BhdGNoZXMvOTlfQ1ZF
LTIwMjEtMjY5MzcucGF0Y2gKPiAtCj4gLVNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8
cGV0ZXJAa29yc2dhYXJkLmNvbT4KPiAtLS0tIGEvZW5jb2RpbmcuYwo+IC0rKysgYi9lbmNvZGlu
Zy5jCj4gLUBAIC00Myw3ICs0Myw3IEBACj4gLSAjIGlmZGVmIFVURjgKPiAtIHN0YXRpYyBpbnQg
ICByZWNvZGVfY2hhciBfX1AoKGludCwgaW50LCBpbnQpKTsKPiAtIHN0YXRpYyBpbnQgICByZWNv
ZGVfY2hhcl90b19lbmNvZGluZyBfX1AoKGludCwgaW50KSk7Cj4gLS1zdGF0aWMgdm9pZCAgY29t
Yl90b2Zyb250IF9fUCgoaW50LCBpbnQpKTsKPiAtK3N0YXRpYyB2b2lkICBjb21iX3RvZnJvbnQg
X19QKChpbnQpKTsKPiAtICMgIGlmZGVmIERXX0NIQVJTCj4gLSBzdGF0aWMgaW50ICAgcmVjb2Rl
X2NoYXJfZHcgX19QKChpbnQsIGludCAqLCBpbnQsIGludCkpOwo+IC0gc3RhdGljIGludCAgIHJl
Y29kZV9jaGFyX2R3X3RvX2VuY29kaW5nIF9fUCgoaW50LCBpbnQgKiwgaW50KSk7Cj4gLUBAIC0x
MjYzLDYgKzEyNjMsOCBAQAo+IC0gICAgIHsweDMwMDAwLCAweDNGRkZEfSwKPiAtICAgfTsKPiAt
Cj4gLSsgIGlmIChjID49IDB4ZGYwMCAmJiBjIDw9IDB4ZGZmZikKPiAtKyAgICByZXR1cm4gMTsg
ICAgICAgICAgLyogZHcgY29tYmluaW5nIHNlcXVlbmNlICovCj4gLSAgIHJldHVybiAoKGJpc2Vh
cmNoKGMsIHdpZGUsIHNpemVvZih3aWRlKSAvIHNpemVvZihzdHJ1Y3QgaW50ZXJ2YWwpIC0gMSkp
IHx8Cj4gLSAgICAgICAgICAgKGNqa3dpZHRoICYmCj4gLSAgICAgICAgICAgIGJpc2VhcmNoKGMs
IGFtYmlndW91cywKPiAtQEAgLTEzMzAsMTEgKzEzMzIsMTIgQEAKPiAtIH0KPiAtCj4gLSBzdGF0
aWMgdm9pZAo+IC0tY29tYl90b2Zyb250KHJvb3QsIGkpCj4gLS1pbnQgcm9vdCwgaTsKPiAtK2Nv
bWJfdG9mcm9udChpKQo+IC0raW50IGk7Cj4gLSB7Cj4gLSAgIGZvciAoOzspCj4gLSAgICAgewo+
IC0rICAgICAgaW50IHJvb3QgPSBpID49IDB4NzAwID8gMHg4MDEgOiAweDgwMDsKPiAtICAgICAg
IGRlYnVnMSgiYnJpbmcgdG8gZnJvbnQ6ICV4XG4iLCBpKTsKPiAtICAgICAgIGNvbWJjaGFyc1tj
b21iY2hhcnNbaV0tPnByZXZdLT5uZXh0ID0gY29tYmNoYXJzW2ldLT5uZXh0Owo+IC0gICAgICAg
Y29tYmNoYXJzW2NvbWJjaGFyc1tpXS0+bmV4dF0tPnByZXYgPSBjb21iY2hhcnNbaV0tPnByZXY7
Cj4gLUBAIC0xMzk2LDkgKzEzOTksOSBAQAo+IC0gICAgIHsKPiAtICAgICAgIC8qIGZ1bGwsIHJl
Y3ljbGUgb2xkIGVudHJ5ICovCj4gLSAgICAgICBpZiAoYzEgPj0gMHhkODAwICYmIGMxIDwgMHhl
MDAwKQo+IC0tICAgICAgICBjb21iX3RvZnJvbnQocm9vdCwgYzEgLSAweGQ4MDApOwo+IC0rICAg
ICAgICBjb21iX3RvZnJvbnQoYzEgLSAweGQ4MDApOwo+IC0gICAgICAgaSA9IGNvbWJjaGFyc1ty
b290XS0+cHJldjsKPiAtLSAgICAgIGlmIChjMSA9PSBpICsgMHhkODAwKQo+IC0rICAgICAgaWYg
KGkgPT0gMHg4MDAgfHwgaSA9PSAweDgwMSB8fCBjMSA9PSBpICsgMHhkODAwKQo+IC0gCXsKPiAt
IAkgIC8qIGNvbXBsZXRlbHkgZnVsbCwgY2FuJ3QgcmVjeWNsZSAqLwo+IC0gCSAgZGVidWcoInV0
ZjhfaGFuZGxlX2NvbXA6IGNvbXBsZXRlbHkgZnVsbCFcbiIpOwo+IC1AQCAtMTQyMiw3ICsxNDI1
LDcgQEAKPiAtICAgbWMtPmZvbnQgID0gKGkgPj4gOCkgKyAweGQ4Owo+IC0gICBtYy0+Zm9udHgg
PSAwOwo+IC0gICBkZWJ1ZzMoImNvbWJpbmlnIGNoYXIgJXggJXggLT4gJXhcbiIsIGMxLCBjLCBp
ICsgMHhkODAwKTsKPiAtLSAgY29tYl90b2Zyb250KHJvb3QsIGkpOwo+IC0rICBjb21iX3RvZnJv
bnQoaSk7Cj4gLSB9Cj4gLQo+IC0gI2Vsc2UgLyogIVVURjggKi8KPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9zY3JlZW4vc2NyZWVuLmhhc2ggYi9wYWNrYWdlL3NjcmVlbi9zY3JlZW4uaGFzaAo+IGlu
ZGV4IGNhNzRiYTg5MTMuLmEyNjFkMzEwMGQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9zY3JlZW4v
c2NyZWVuLmhhc2gKPiArKysgYi9wYWNrYWdlL3NjcmVlbi9zY3JlZW4uaGFzaAo+IEBAIC0xLDUg
KzEsNSBAQAo+ICAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQgYWZ0ZXIgY2hlY2tpbmcgcGdwIHNpZ25h
dHVyZQo+IC0jIGh0dHBzOi8vZnRwLmdudS5vcmcvZ251L3NjcmVlbi9zY3JlZW4tNC44LjAudGFy
Lmd6LnNpZwo+IC1zaGEyNTYgNmUxMWIxM2Q4NDg5OTI1ZmRlMjVkZmIwOTM1YmY2ZWQ3MWY5ZWI0
N2VmZjIzM2ExODFlMDc4ZmRlNTY1NWFhMSAgc2NyZWVuLTQuOC4wLnRhci5nego+ICsjIGh0dHBz
Oi8vZnRwLmdudS5vcmcvZ251L3NjcmVlbi9zY3JlZW4tNC45LjAudGFyLmd6LnNpZwo+ICtzaGEy
NTYgIGY5MzM1MjgxYmI0ZDE1MzhlZDA3OGRmNzhhMjBjMmYzOWQzYWY5YTRlOTFjNTdkMDg0Mjcx
ZTAyODljNzMwZjQgIHNjcmVlbi00LjkuMC50YXIuZ3oKPiAgICMgTG9jYWxseSBjYWxjdWxhdGVk
Cj4gLXNoYTI1NiA4Y2ViNGI5ZWU1YWRlZGRlNDdiMzFlOTc1YzFkOTBjNzNhZDI3YjZiMTY1YTFk
Y2Q4MGM3YzU0NWViNjViOTAzICBDT1BZSU5HCj4gK3NoYTI1NiAgOGNlYjRiOWVlNWFkZWRkZTQ3
YjMxZTk3NWMxZDkwYzczYWQyN2I2YjE2NWExZGNkODBjN2M1NDVlYjY1YjkwMyAgQ09QWUlORwo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3NjcmVlbi9zY3JlZW4ubWsgYi9wYWNrYWdlL3NjcmVlbi9z
Y3JlZW4ubWsKPiBpbmRleCA4NDNjNzFmYzJhLi4zMjM5YTFjMWYzIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2Uvc2NyZWVuL3NjcmVlbi5tawo+ICsrKyBiL3BhY2thZ2Uvc2NyZWVuL3NjcmVlbi5tawo+
IEBAIC00LDcgKzQsNyBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgIAo+
IC1TQ1JFRU5fVkVSU0lPTiA9IDQuOC4wCj4gK1NDUkVFTl9WRVJTSU9OID0gNC45LjAKPiAgIFND
UkVFTl9TSVRFID0gJChCUjJfR05VX01JUlJPUikvc2NyZWVuCj4gICBTQ1JFRU5fTElDRU5TRSA9
IEdQTC0zLjArCj4gICBTQ1JFRU5fTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiBAQCAtMTYsOSAr
MTYsNiBAQCBTQ1JFRU5fQ09ORl9FTlYgPSBDRkxBR1M9IiQoVEFSR0VUX0NGTEFHUykiCj4gICBT
Q1JFRU5fQ09ORl9PUFRTID0gLS1lbmFibGUtY29sb3JzMjU2Cj4gICBTQ1JFRU5fSU5TVEFMTF9U
QVJHRVRfT1BUUyA9IERFU1RESVI9JChUQVJHRVRfRElSKSBTQ1JFRU49c2NyZWVuIGluc3RhbGxf
YmluCj4gICAKPiAtIyAwMDA4X0NWRS0yMDIxLTI2OTM3LnBhdGNoCj4gLVNDUkVFTl9JR05PUkVf
Q1ZFUyArPSBDVkUtMjAyMS0yNjkzNwo+IC0KPiAgIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElOVVhf
UEFNKSx5KQo+ICAgU0NSRUVOX0RFUEVOREVOQ0lFUyArPSBsaW51eC1wYW0KPiAgIFNDUkVFTl9D
T05GX09QVFMgKz0gLS1lbmFibGUtcGFtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
