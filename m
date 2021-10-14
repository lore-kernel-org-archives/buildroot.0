Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55BCC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:17:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0969E61151
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0969E61151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F10B60656;
	Thu, 14 Oct 2021 20:17:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oTkBgCcSKr_w; Thu, 14 Oct 2021 20:17:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9797606FF;
	Thu, 14 Oct 2021 20:17:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 412341BF599
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26EEC4028E
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:17:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2BtpOEqP-D-m for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 20:17:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECB4D40125
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 20:17:40 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z20so29138169edc.13
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 13:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vLA0yXFAs5pXRfX7WKZZLmk5WKFKh4y5QWMD2NH7v0o=;
 b=QvIMKigfiPPGIY5ZnUu/ECA0wD0zVBq5Fy7PRfTegJdgzoPdwJVwP1Uk7jUeBOuA+s
 HbNK11hTu8YGCXMDysyIJkGloiypqj0etWOBX+qApTXZ5RBb2hIfMSafWCZ7k0cppWEQ
 FIj2+nYZt9vVUWLaWbKvg4/yPa9TODXv4MIPvH/kR331Je2jbHylCXGlJbaCbU+o6O+l
 dK6i4EN3tqHzqNw8Svpf4TziKAGoWQ/+1ToD0Ve9HriTy8JNeA1jQrcZDshfoisTP7uC
 QMvrjVKGse7gFOj0ZCkfC9l+bCw78rR+lhNXIb0gMNs0jyqgj12+E+dDoQ9Z0FS+OyAn
 eDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vLA0yXFAs5pXRfX7WKZZLmk5WKFKh4y5QWMD2NH7v0o=;
 b=hmTuywcN4c6ZJUCSEduZUy0Qe7aK9mq84coYzLzfNKlH7IztkuuP/RPTDDTPYrp6qA
 lE30poJIZ9Jmt1vyed280pV+fT4njLbWdfHxLJfPYC/YIU6FU9fXjTXzvHEu40XAOoTj
 sP29pY39PWIgx3jLvrjPFFRZs5hfCLmMT7ednPHV/JLd8Vc5e/ND3rjPNYyVyfj7w/e+
 aKDiX4jMjA6gTXxEkEX8jIMukLLUKjC8MDagdeSC0tmtfyD+ssEVlD/08x7RZ1XJPLeV
 BAp33ph/HpThrYYPWviNg5aM+M43013T9BGxUiX1Bj4W+0QY06EJWZBjwwJuq1n8DBzm
 e/0Q==
X-Gm-Message-State: AOAM533ocJHYfJdQHi8Rl7gfMlgYafnh3XWaxFeEIEoqx0dDFy3hXZZx
 zst4M92n+WKYjOHuksl5zFPbfA==
X-Google-Smtp-Source: ABdhPJz5sx6xjNIl8n/hyXSz8r5UVFwjjjpJwGUTcKKzuYn4XoEySIgiydfruYSOWX2SAmOhvXDT5Q==
X-Received: by 2002:a17:906:c302:: with SMTP id
 s2mr1294411ejz.499.1634242659097; 
 Thu, 14 Oct 2021 13:17:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bt24sm2723907ejb.77.2021.10.14.13.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 13:17:38 -0700 (PDT)
Message-ID: <dc5055a8-235e-aeee-523e-328fdd43d102@mind.be>
Date: Thu, 14 Oct 2021 22:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB049315D372F7D5E516E916319FA89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <3f981830-2ca9-50ea-6b7c-9c99b6f65517@mind.be>
 <VI1P190MB0493EE28868A40D1736DCD7E9FB89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <VI1P190MB0493EE28868A40D1736DCD7E9FB89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Subject: Re: [Buildroot] Question about adding dbus-cxx and updating libsigc
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
Cc: "james.knight@collins.com" <james.knight@collins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNC8xMC8yMDIxIDEyOjQzLCBMYW5nIERhbmllbCB3cm90ZToKPiBIaSBBcm5vdXQsCj4g
SGVsbG8gZXZlcnlib2R5LAo+IAo+PiBPbiAwNS8xMC8yMDIxIDA5OjQ2LCBBcm5vdXQgVmFuZGVj
YXBwZWxsZSB3cm90ZToKPj4KPj4gIMKgIEhpIERhbmllbCwKPj4KPj4gT24gMjgvMDkvMjAyMSAx
MTo1MSwgTGFuZyBEYW5pZWwgd3JvdGU6CltzbmlwXQo+Pj4gZGJ1cy1jeHggZGVwZW5kcyBvbiBs
aWJzaWdjIHZlcnNpb24gMy4wLgo+Pj4gVmVyc2lvbiAyLjEwLjYgaXMgY3VycmVudGx5IGluY2x1
ZGVkIGluIGJ1aWxkcm9vdC4KPj4+IFVwZGF0aW5nIGxpYnNpZ2Mgd291bGQgbWVhbiB1cGRhdGlu
ZyBjYWlyb21tLCBhdGttbSwgZ2xpYm1tIGFuZCBndGttbS4KPj4+IFRob3NlIHVwZGF0ZXMgYnJp
bmcgR1RLNCBpbnRvIHRoZSBtaXgsIHdoaWNoIGlzbid0IGEgcGFydCBvZiBidWlsZHJvb3QuCj4+
PiBBdCBsZWFzdCBJIGNvdWxkbid0IGZpbmQgaXQuCj4+Cj4+ICDCoCBVZ2guLi4KPj4KPj4gIMKg
IFVwZGF0aW5nIGNhcmlvbW0gYW5kIGZyaWVuZHMgd2lsbCBoYXZlIHRvIGJlIGRvbmUgYXQgc29t
ZSBwb2ludC4gQnV0IEkgYmVsaWV2ZQo+PiBHVEs0IGlzIGFnYWluIGEgbWFqb3IgQVBJIGNoYW5n
ZSBsaWtlIEdUSzMgd2FzLCBpLmUuIHRoZXJlJ3Mgbm8gaG9wZSB0aGF0Cj4+IHBhY2thZ2VzIHRo
YXQgY3VycmVudGx5IHVzZSBsaWJndGszIGFyZSBnb2luZyB0byBidWlsZCBzdWNjZXNzZnVsbHkg
YWdhaW5zdAo+PiBHVEs0LCByaWdodD8gSW4gdGhhdCBjYXNlLCB0aGVyZSdzIG5vIHNvbHV0aW9u
IG90aGVyIHRoYW4gYWRkaW5nIGxpYmd0azQgc2lkZSBieQo+PiBzaWRlIHdpdGggbGliZ3RrMy4u
Lgo+Pgo+IAo+IFllcywgR1RLNCBicmVha3MgYm90aCBBUEkgYW5kIEFCSSBjb21wYXJlZCB0byBH
VEszLgoKICBTbyB0aGF0IG1lYW5zIHdlJ2xsIG5lZWQgdG8gaGF2ZSBhIGxpYmd0azQgc2lkZS1i
eS1zaWRlIHdpdGggbGliZ3RrMy4KCj4gVGhlIHByb2JsZW0gaGVyZSBpcywgdGhhdCBhbGwgdGhl
IC1tbSBwYWNrYWdlcyBoYXZlIGJyZWFraW5nIEFQSSBjaGFuZ2VzLgo+IElmIGNvbXBhdGliaWxp
dHkgd2l0aCBHVEszIGFuZCB0aGUgY3VycmVudCBBUEkgaXMgdG8gYmUgcmV0YWluZWQgd2hpbGUg
YWRkaW5nIEdUSzQKPiB3aXRoIEMrKyBiaW5kaW5ncywgdGhlIGZvbGxvd2luZyBwYWNrYWdlcyB3
b3VsZCBuZWVkIHRvIGJlIGR1cGxpY2F0ZWQ6Cj4gLSBsaWJndGsgKDMuMjQuMzAgdnMgNC40LjAp
Cj4gLSBndGttbSAoMy4yNC41IHZzIDQuNC4wKQo+IC0gY2Fpcm9tbSAoMS4xMi4xIHZzIDEuMTYu
MSkKPiAtIHBhbmdvbW0gKDIuNDAuMSB2cyAyLjQ4LjEpCj4gLSBhdGttbSAoMi4yNC4zIHZzIDIu
MzYuMSkKPiAtIGdsaWJtbSAoMi42Ni4yIHZzIDIuNzAuMCkKPiAtIGxpYnNpZ2MgKDIuMTAuNyB2
cyAzLjAuNykKPiAKPiBNYXliZSBJIGhhdmUgbWlzc2VkIHNvbWUsIGJ1dCB0aG9zZSBzaG91bGQg
YmUgdGhlIG1ham9yICJwcm9ibGVtcyIuCgogIGdzdHJlYW1lcjEtbW0gZGVwZW5kcyBvbiBnbGli
bW0sIHNvIHRoYXQncyBpbmRpcmVjdGx5IGFmZmVjdGVkIGFzIHdlbGwuIEJ1dCBJIApleHBlY3Qg
aXQgd2lsbCBzdGlsbCB3b3JrIHdpdGggMi43MC4wLgoKCj4+PiBJIGNhbiB0cnkgdG8gcHJvdmlk
ZSBwYXRjaGVzIHRvIHVwZGF0ZSBldmVyeXRoaW5nIGFuZCBpbnRlZ3JhdGUKPj4+IG9yIGNyZWF0
ZSBhIHNlcGFyYXRlIHBhY2thZ2UgZm9yIGxpYnNpZ2MzLCBzaW5jZSBib3RoIHZlcnNpb25zIGNh
biBiZQo+Pj4gaW5zdGFsbGVkIGF0IHRoZSBzYW1lIHRpbWUuIFdoaWNoIG9wdGlvbiBpcyBwcmVm
ZXJyZWQ/Cj4+Cj4+ICDCoCBUaGUgInVwZGF0ZSBldmVyeXRoaW5nIiBpcyB0aGUgcHJlZmVycmVk
IG9wdGlvbiBJIHRoaW5rLiBCdXQgc2luY2UgdGhhdCBjb3VsZAo+PiBnZXQgYSBsaXR0bGUgaGFp
cnksIHdlIHdvdWxkIGFsc28gYWNjZXB0IHNpbXBseSBhZGRpbmcgbGlic2lnYzMuCj4+Cj4gCj4g
SSBndWVzcyB0aGVyZSBhcmUgZm91ciBvcHRpb25zOgo+IAo+IDEuIEhhdmUgYm90aCwgR1RLMyBh
bmQgR1RLNCB3aXRoIHRoZWlyIHJlc3BlY3RpbmcgQysrIGJpbmRpbmdzICgtbW0gcGFja2FnZXMp
Lgo+IFdoaWNoIHdvdWxkIG1lYW4gZHVwbGljYXRpbmcgdGhlIGFmb3JlLW1lbnRpb25lZCBwYWNr
YWdlcy4KCiAgVGhhdCdzIHF1aXRlIGEgbG90IG9mIHdvcmsuIEFsdGhvdWdoLCBpbiB0aGUgZW5k
LCBpdCdzIGp1c3QgNiBwYWNrYWdlcywgc28gbm90IAppbXBvc3NpYmxlLiBJdCBkb2VzIHVnbGlm
eSB0aGluZ3MgYSBiaXQgdGhvdWdoLgoKCj4gMi4gRHVwbGljYXRlIGxpYnNpZ2MgYW5kIGFkZCBk
YnVzLWN4eC4gTm8gR1RLNCBDKysgYmluZGluZ3MuCgogIFRoYXQgaXMgZGVmaW5pdGVseSBzb21l
dGhpbmcgdGhhdCBjYW4gYmUgZG9uZSBvbiB0aGUgc2hvcnQgdGVybSwganVzdCB0byBtYWtlIApw
cm9ncmVzcy4gV2UgY2FuIGV2ZW50dWFsbHkgZGVwcmVjYXRlIGxpYnNpZ2MgaXRzZWxmIGFuZCBv
bmx5IGtlZXAgbGlic2lnYzMuIApXZSd2ZSBkb25lIHRoYXQgYmVmb3JlLgoKPiAzLiBMZWF2ZSBl
dmVyeXRoaW5nIGFzIGl0IGlzIGFuZCBkb24ndCBhZGQgZGJ1cy1jeHguCj4gCj4gNC4gRHJvcCBD
KysgYmluZGluZ3MgZm9yIEdUSzMgYW5kIG9ubHkgc3VwcG9ydCBHVEs0Lgo+IFRoaXMgd2lsbCBi
cmVhayBzb21lIHBhY2thZ2VzIGFuZCBldmVyeSBsaWtlbHkgYmVjb21lIGEgcHJvYmxlbSBmb3Ig
cGVvcGxlIHVzaW5nIEdUSzMgd2l0aCBDKysuCgogIFRoYXQgaXMgbm90IGEgcHJpb3JpIGltcG9z
c2libGUuIFRoZXJlIGFyZSBubyBpbnRlcm5hbCBjb25zdW1lcnMuIEphbWVzIApvcmlnaW5hbGx5
IGNvbnRyaWJ1dGVkIHRoZSBwYWNrYWdlLCBhbmQgbm9ib2R5IGVsc2UgbWFkZSBtYWpvciBjb250
cmlidXRpb25zLiAKVGhlcmUgd2VyZSBzb21lIHZlcnNpb24gYnVtcHMgZnJvbSBGYWJyaWNlIGFu
ZCBBZGFtIGJ1dCBJIHN1c3BlY3QgdGhhdCB0aG9zZSAKd2VyZSBqdXN0IHJlbGF0ZWQgdG8gZ2xp
YiBidW1wcy4gU28gaWYgSmFtZXMgaXMgT0sgd2l0aCBhbiB1cGRhdGUgdG8gR1RLNCBmb3IgCmFs
bCB0aGUgLW1tIHBhY2thZ2VzLCBJIHRoaW5rIHdlJ3JlIGdvb2QuCgoKICBBbm90aGVyIG9wdGlv
biB0aGF0IHdvdWxkIGFsbG93IHByb2dyZXNzIGZvciBsaWJzaWdjLCBnbGlibW0gYW5kIGRidXMt
Y3h4IGF0IApsZWFzdCBpcyB0byBwYXRjaCB0aGUgb3RoZXIgcGFja2FnZXMgdG8gY29tcGx5IHdp
dGggdGhlIGxpYnNpZ2MzIEFQSS4gQW55IGlkZWEgCmhvdyBtdWNoIHdvcmsgdGhhdCB3b3VsZCBi
ZT8gVGhlcmUgYXJlIHByb2JhYmx5IHVwc3RyZWFtIGNvbW1pdHMgdGhhdCBjYW4gYmUgCmJhY2tw
b3J0ZWQgZXZlbi4KCgo+IEkgdGhpbmssIEdUSzQgKHdpdGhvdXQgQysrIGJpbmRpbmdzKSBjb3Vs
ZCBiZSBhZGRlZCByZWdhcmRsZXNzIHdpdGhvdXQgZHVwbGljYXRpbmcgcGFja2FnZXMuCj4gV291
bGQgbWVhbiwgdGhhdCBidWlsZHJvb3Qgc3VwcG9ydHMgdGhyZWUgR1RLIHZlcnNpb25zICgyLjI0
LngsIDMuMjQueCwgNC54KS4KCiAgWWVzLCBhZGRpbmcgR1RLNCB3aXRob3V0IHRoZSBtbSBzdHVm
ZiBjYW4gYmUgZG9uZSBpbiBwYXJhbGxlbC4gQnV0IHRoYXQgCmRvZXNuJ3Qgc29sdmUgdGhlIHBy
b2JsZW0gZm9yIGxpYnNpZ2MuCgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPj4gIMKgIEkndmUg
YWRkZWQgdGhlIG90aGVyIG1haW50YWluZXJzIGluIENjIGZvciBjb25maXJtYXRpb24uCj4gCj4g
VGhhbmtzCj4gCj4gSSd2ZSBhZGRlZCBKYW1lcyBLbmlnaHQsIHNpbmNlIGhlIGlzIHRoZSBsaXN0
ZWQgaW4gdGhlIERFVkVMT1BFUlMgZmlsZSBmb3IgdGhlIGFmZmVjdGVkIHBhY2thZ2VzLgo+IAo+
IFJlZ2FyZHMsCj4gRGFuaWVsCj4gCj4+Cj4+ICDCoCBSZWdhcmRzLAo+PiAgwqAgQXJub3V0Cj4+
Cj4+Cj4+Cj4+Pgo+Pj4gUmVnYXJkcywKPj4+IERhbmllbCBMYW5nCj4+Pgo+Pj4gU29mdHdhcmUg
RW5naW5lZXIKPj4+IGFiYXRlYyBHbWJICj4+PiBPYmVycmVnYXVlciBTdHJhw59lIDQ4Cj4+PiA0
ODQ0IFJlZ2F1LCBBdXN0cmlhCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+Pj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
