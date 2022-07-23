Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B02C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 21:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2184F61B27;
	Sat, 23 Jul 2022 21:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2184F61B27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WF39Ga6K9q1I; Sat, 23 Jul 2022 21:23:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1178861B24;
	Sat, 23 Jul 2022 21:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1178861B24
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 072DD1BF419
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D50C661B24
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D50C661B24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sy4xMvLwHnyp for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 21:23:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C433661B1E
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C433661B1E
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 21:23:02 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d8so10864892wrp.6
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ObJEHFlTmYmK9+BgRFEGXwjRJ5SeyoKPjykQ9HhANcA=;
 b=l7+wLVNmhvxrKmbGJ4yEbD9NKvGIHzgMaOaihoXVJqsKodR0F2RPjQYlWgNyTSJNPL
 rE6phdNbALwWXUncp+WjFNTO2Hcgdv49a/X/bzaEyGg/E0QwsJRCsYdevnIaZ4Xab2oB
 wiAEcNx4R6dG9r79iNDz6cfSAZMFE1PUrZXMDZK2cxtgLoU1kjsqhZhd9t8s4M0gevXn
 yDw15YF9fx+rbeXyzf/eUw/RTaWXDHl7Pv/sGHR/Ja7EjBp2w+svaso/QDtujVYjQjlT
 ootzpk44vfOzRaKBjeQF7vjs2GkfaoyWusE6AUGVjWXY9pNnyC65UXyDBgopsgkHd8a2
 /TWA==
X-Gm-Message-State: AJIora84vm78uG0PJ1Y+zbwzojxtlXqrYZCpa43NhRFGV2Ifv4ILAhK/
 XIw6q6ClKJeZN0/sIM216aDyng==
X-Google-Smtp-Source: AGRyM1td22q/jOn1+0h5/vtNpiiL2hEYNHY1SMGkmJBYK5Cd6o16dMsnH60eGdPnijdGGLmd985aIg==
X-Received: by 2002:a05:6000:716:b0:21e:296c:353f with SMTP id
 bs22-20020a056000071600b0021e296c353fmr3648766wrb.702.1658611380519; 
 Sat, 23 Jul 2022 14:23:00 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 9-20020a05600c22c900b003a3270735besm9152328wmg.28.2022.07.23.14.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 14:23:00 -0700 (PDT)
Message-ID: <29ce6b2e-a0b7-a6dc-0bb2-7c5ddc10a543@smile.fr>
Date: Sat, 23 Jul 2022 23:22:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: James Knight <james.d.knight@live.com>
References: <BYAPR06MB4805F290E2B4224008BC23EAA08D9@BYAPR06MB4805.namprd06.prod.outlook.com>
 <b7b3bb6f-af5d-1987-0bf0-4da328e1bc77@smile.fr>
 <CALAjcgW56=jP5-h048PwsGezdYhFTPcDhH+uPLbUbp0vrhkn=g@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CALAjcgW56=jP5-h048PwsGezdYhFTPcDhH+uPLbUbp0vrhkn=g@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ObJEHFlTmYmK9+BgRFEGXwjRJ5SeyoKPjykQ9HhANcA=;
 b=YQK09xjA1sW6FtIEkVnJRaqybFmn/cEEQag9vRQPJdS/VUWi8QEQQahyIjn2djFv5i
 mY2Ns4KYtv/FQ+bsxFdQ9uqCZ8jANkGPA7tSlisaNW4BFP3Ie3cquiQe7gcueLBI8oeW
 nIu2FoMNY0ptCbV3G/hzycIWW6Od8zR03CPgAjv1+tF1Vb33iCbg4QGbTliHnGVcFmqN
 KEIhXsh8LtGUw8btYgriF83nrPsswpfl8X7rU1hjHjpCH/4DypfHOIiFxyO1bMZ8v1rZ
 U9gIBVR5yfcRRI46/Afze8KkCNem8WlZsNDZr9Ek6l7gunOgpENPePefrAtzxkVJvD8K
 pC9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=YQK09xjA
Subject: Re: [Buildroot] [PATCH 1/1] board/qemu/post-image.sh: flexible qemu
 launch options
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgpMZSAyMy8wNy8yMDIyIMOgIDIyOjQ4LCBKYW1lcyBLbmlnaHQgYSDDqWNyaXTC
oDoKPiBSb21haW4sCj4gCj4gT24gU2F0LCBKdWwgMjMsIDIwMjIgYXQgMTI6MzMgUE0gUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+Pgo+PiBUaGUgc3RhcnQtcWVt
dS5zaCBzY3JpcHQgaXMgYWN0dWFsbHkgdXNlZCBieSB0aGUgQnVpbGRyb290IGdpdGxhYi1jaSB0
byB0ZXN0IGRvCj4+IGEgcnVudGltZSB0ZXN0IChib290IHRlc3QpIGZvciBhbGwgUWVtdSBkZWZj
b25maWdzLgo+IAo+IE15IHJlYXNvbnMgZm9yIHByZXNlbnRpbmcgY2hhbmdlcyB0byB0aGlzIHNj
cmlwdCB3YXMgdW5kZXIgdGhlCj4gYXNzdW1wdGlvbiB0aGF0IHRoaXMgd2FzIGEgZ2VuZXJpYyBo
ZWxwZXIgZm9yIFFFTVUtc3VwcG9ydGVkIGltYWdlcy4KCkl0J3MgYSBzaWRlIGVmZmVjdCBvZiB0
aGlzIHNjcmlwdCA6KQoKPiBUcnlpbmcgdG8gcGxheSBhcm91bmQgd2l0aCBCdWlsZHJvb3QgYWdh
aW4gKGl0IGhhcyBiZWVuIGF3aGlsZSksIEkKPiBqdXN0IHNlbGVjdGVkIHRoZSBgcWVtdV94ODZf
ZGVmY29uZmlnYCBjb25maWd1cmF0aW9uIGFzIGFuIGVhc3kgd2F5IHRvCj4gZ2V0IHRoaW5ncyBz
dGFydGVkLiBJIG5vdGljZWQgdGhlIGBzdGFydC1xZW11LnNoYCBzY3JpcHQgaW4gdGhlCj4gYG91
dHB1dC9pbWFnZXMvYCBmb2xkZXIgYW5kIHRob3VnaHQgIlRoaXMgaXMgYSBuaWNlIHNjcmlwdCB0
byBoZWxwIG1lCj4gdGVzdCBteSBpbWFnZXMgd2l0aCIuCj4gCj4gSWYgdGhlIGludGVudCBpcyB0
byBvbmx5IHVzZSB0aGlzIHNjcmlwdCBmb3IgQ0ktcmVsYXRlZCB3b3JrLCB0aGF0J3MKPiBmaW5l
IGJ5IG1lIC0tIGFuZCB3ZSBjYW4gZHJvcCB0aGUgcGF0Y2ggaWYgZGVzaXJlZC4KCllvdXIgcGF0
Y2ggaXMgaW50ZXJyZXN0aW5nIGJ1dCBJIGd1ZXNzIHdlIG5lZWQgc29tZSBmZWVkYmFjayBmcm9t
IG1haW50YWluZXJzLgoKPiAKPj4gU28gb25seSB0aGlzIHFlbXUgY29tbWFuZCBsaW5lIGNvbW1h
bmQgbGluZSBpcyBzdXBwb3NlZCB0byB3b3JrIG91dCBvZiB0aGUgYm94Lgo+PiBJZiB5b3UgbGV0
IHRoZSB1c2VkIGN1c3RvbWl6ZSB0aGUgcWVtdSBjb21tYW5kIGxpbmUsIGl0IGNhbiByYWlzZSBz
b21lIGlzc3VlLgo+IAo+IEkgY2FuIGFncmVlLCBpbmplY3Rpb24gY3VzdG9tIG9wdGlvbnMgd2ls
bCB2b2lkIHRoZSB3YXJyYW50eS4gVGhlIG1haW4KPiByZWFzb24gZm9yIGludHJvZHVjaW5nIHRo
ZXNlIGNoYW5nZXMgd2FzIHRvIHRlc3QgYSBRRU1VIHR3ZWFrZWQKPiBjb25maWd1cmF0aW9uIHdo
aWNoIHV0aWxpemVkIHNvbWUgZGlzcGxheS1yZWxhdGVkIGNoYW5nZXMgd2hpY2gKPiBzb21ldGlt
ZXMgcmVxdWlyZWQgYWRkaXRpb25hbCBtb2RpZmljYXRpb25zLiBGb3IgZXhhbXBsZSwgcHJvdmlk
aW5nIGFuCj4gZW52aXJvbm1lbnQgd2l0aCBtb3JlIG1lbW9yeSAoZS5nLiBgLW0gMUdgKSBvciBj
dXN0b21pemluZyB0aGUKPiBncmFwaGljcyBkcml2ZXIgKGUuZy4gYC12Z2EgdmlydGlvYCkuIEkg
d291bGQgYXBwbHkgbW9kaWZpY2F0aW9ucywKPiB0ZXN0IHRoaW5ncyB3aGljaCBtYXkgcmVxdWly
ZSBhIHJlYnVpbGQgb24gYSBrZXJuZWwvY29tcG9uZW50LCB3aGljaAo+IHdvdWxkIHJlcGxhY2Ug
dGhlIHNjcmlwdCBhbmQgSSB3b3VsZCBoYXZlIHRvIG1vZGlmeSBpdCBhZ2Fpbi4KCkFncmVlLCB0
aGlzIGlzIG5vdCBhIHJlYWxseSBuaWNlIGJlaGF2aW91ciBmb3IgdXNlcnMuCgo+IAo+PiBJIHdv
dWxkIHRocm93IGEgd2FybmluZyBpZiAkQCBpcyBub3QgZW1wdHksIGp1c3QgdG8gd2FybiB0aGUg
dXNlci4KPiAKPiBUaGlzIHdvdWxkIGJlIGZpbmUgZm9yIG1lICh0byBoZWxwIHByb21vdGUgdGhl
IGlkZWEgdGhhdCBleHRyYQo+IGFyZ3VtZW50cyBhcmUgbm90IG9mZmljaWFsbHkgc3VwcG9ydGVk
KS4KCkl0IHdvdWxkIGJlIGdyZWF0LgoKPiAKPj4gTmFtaW5nIHN0dWZmIGlzIGhhcmQsIGhlcmUg
d2Ugd2FudCBhbiBvcHRpb24gdG8gdXNlIFFlbXUgaW5zdGFsbGVkIG9uIHRoZSBob3N0IHN5c3Rl
bSwgbm90IGZyb20gaG9zdC1xZW11ICgtLWhvc3QgbWF5IGJlIG1pc2xlYWRpbmcpLgo+PiAuLi4K
Pj4gVXNpbmcgUWVtdSBpbnN0YWxsZWQgb24gdGhlIGhvc3QgbWF5IGJlIHJlYWxseSBvbGQgYW5k
IG5vdCBhYmxlIHRvIGJvb3QgdGhlIHN5c3RlbS4KPiAKPiBJIGNhbiBhZ3JlZSB0aGF0IHRoaXMg
bWF5IGJlIHRoZSBjYXNlIGZvciBzb21lIGRpc3RyaWJ1dGlvbnMsIGJ1dCBJCj4gZmluZCBzb21l
IGRpc3RyaWJ1dGlvbnMgKGxpa2UgQXJjaCkgcHJvdmlkZSBhIGZhc3QgdHVybmFyb3VuZCB0aW1l
IGZvcgo+IG5ld2VyIHZlcnNpb25zLiBUaGUgb25seSBpbnRlbnRpb24gb2YgcHJvdmlkaW5nIGEg
d2F5IHRvIHVzZSBhCj4gc3lzdGVtJ3MgdmVyc2lvbiAoaWYgYXZhaWxhYmxlKSB3YXMgdG8gbWF5
YmUgdXRpbGl6ZSBzb21lIG9wdGlvbnMgdGhhdAo+IG1heSBoYXZlIG5vdCBiZWVuIGVuYWJsZWQg
b24gdGhlIGhvc3QtcWVtdSBwYWNrYWdlLiBGb3IgZXhhbXBsZSwgSSB3YXMKPiB0cnlpbmcgdG8g
dXRpbGl6ZSB0aGUgYC1kaXNwbGF5IGd0a2Agb3B0aW9uIHRoYXQgd2FzIGF2YWlsYWJsZSBvbiB0
aGUKPiBob3N0LCBidXQgbm90IHN1cHBvcnRlZCB3aXRoIHRoZSBidWlsdCBob3N0LXFlbXUgcGFj
a2FnZS4gSGF2aW5nIHRoZQo+IG9wdGlvbiBtYXkgYWxzbyBwcm92aWRlIGZsZXhpYmlsaXR5IGlm
IHRoZSBzeXN0ZW0ncyBRRU1VIGlzIGEgbmV3ZXIKPiB2ZXJzaW9uIHRoZW4gdGhhdCBvZiBCdWls
ZHJvb3RzIChpLmUuIHdoZW4gZGVhbGluZyB3aXRoIG9sZGVyIHRhZ3MvTFRTCj4gYnVpbGRzKS4K
CkluZGVlZCwgdGhlIGhvc3QtcWVtdSBpcyBub3QgYWJsZSB0byBwcm92aWRlIGEgZnVsbCB2ZXJz
aW9uIG9mIFFlbXUgZHVlIHRvCm1pc3NpbmcgaG9zdCBkZXBlbmRlbmNpZXMuCgo+IAo+IFdlIGNv
dWxkIHR3ZWFrIHRoZSBhcmd1bWVudCB0byBzb21ldGhpbmcgbGlrZSBgLS11c2Utc3lzdGVtLXFl
bXVgLCB0bwo+IGJlIGEgYml0IG1vcmUgZXhwbGljaXQuIEFuZCBhbHNvLCBnZW5lcmF0aW5nIHRo
ZSBzYW1lIHR5cGUgb2Ygd2FybmluZ3MKPiB0aGF0IHVzaW5nIHN1Y2ggb3B0aW9ucyBpcyBvZmZp
Y2lhbGx5IHVuc3VwcG9ydGVkIGFuZCBmb3IgYWR2YW5jZWQKPiB0ZXN0aW5nLgoKYC0tdXNlLXN5
c3RlbS1xZW11YCBpcyBvayBmb3IgbWUuCgpUaGFua3MhCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
