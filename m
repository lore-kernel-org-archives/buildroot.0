Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F1FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 06:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA63A40ADF;
	Wed, 11 May 2022 06:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j1Pg_sJEyI-t; Wed, 11 May 2022 06:42:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C54CF4060C;
	Wed, 11 May 2022 06:42:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4611BF23C
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 06:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07F9941718
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 06:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id anL4pLZ0oDVg for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 06:42:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82EC341716
 for <buildroot@buildroot.org>; Wed, 11 May 2022 06:42:42 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id y21so1357020edo.2
 for <buildroot@buildroot.org>; Tue, 10 May 2022 23:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UrXC+x11OQ1JFaN5oMegUxx8fJNiYsm7SFNNaiGfoqA=;
 b=V+LjN93sdHXUHqJErdC26G7pKeeh0EbiYn52WljX9iGt9efTqYFBDPr8OaSbRGvWMw
 6kSRXYOhIAuyaRs37U8dPHrdOTMH/Tlpje/e/NAsqcMKWHPqaMgi/Proq7hhiowRdURL
 SjHG0J9j/xEzG7fwn/1hGInORuFCSs8dzzZSZuI36of1Lolti2jBU2i3teUn/vRGqQjJ
 5NUnPmKl4Bpyd8f5/fPSLDL2mnimAOGr2ILIWHt13byV0fcThcDwStMMsDi0VHoGQDq1
 jRXxF/9EXoiOIo91hxhzXtz0XilZUXD0tKnwlkNMH7Gqefb1XbJPacU2P+dBnjxp+GyM
 O1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UrXC+x11OQ1JFaN5oMegUxx8fJNiYsm7SFNNaiGfoqA=;
 b=cYO5jT8NIEpkf5SBypiQNnucPFaFdQH7v38RqExiqRYuSlrNBa+V2zZkHVOBqQ0dio
 CwZn7JVqkOE8jaz4Fs33s/dtux1hniU/84sHmy9rNKyuDbL3ng8qFQBOzItNyX91ZHKb
 Xid8HAXcTinH35sRuUWL1GjkS5cFnR1n4OH70JveY7mSZQPIetvV9Zf3+XpSdhqP+Wcj
 8dAczLlyP0IWzMxsPt1wWFPe+t2y600RtEF2I/i3A6aP/hkEzaKLSSvj0m20Y8+ugZJ4
 EiIKhqzKXGvqOjwuyOJwZHVJzVxlej3/1Sxfaosd6tzoRkZwWWeItXVeQD/gHGwZdA4l
 m1FA==
X-Gm-Message-State: AOAM531Rpitu7iBoa0v9aXg0NhWFEPVYVJu6PIaWKSBkZ06S3SFAzlYA
 AVz6VqTvYBicvPjqtG3fzfwgFg==
X-Google-Smtp-Source: ABdhPJxRHz5UWkkgkfm82ALOVacHGHoihdrKGSyMwhatvq8CZglmm5lUvlzZY/i/9K04bSwrZ0yy0g==
X-Received: by 2002:a05:6402:4408:b0:427:ab6f:a383 with SMTP id
 y8-20020a056402440800b00427ab6fa383mr27174421eda.249.1652251360550; 
 Tue, 10 May 2022 23:42:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a1709061cc300b006f3ef214ddfsm575987ejh.69.2022.05.10.23.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 23:42:40 -0700 (PDT)
Message-ID: <891d79c1-531b-7a95-7739-a19e634a318d@mind.be>
Date: Wed, 11 May 2022 08:42:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Petr Vorel <petr.vorel@gmail.com>
References: <YnrH/mfbuJHRpYnw@pevik>
 <CAPi7W80OTx7DuKHba8Y3Zr4vUJ-SnLGTesHyYCf-Gjw2z2hnNg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAPi7W80OTx7DuKHba8Y3Zr4vUJ-SnLGTesHyYCf-Gjw2z2hnNg@mail.gmail.com>
Subject: Re: [Buildroot] [RFC] iputils (meson build system) has git version
 from buildroot instead of iputils
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Dagg Stompler <daggs@gmx.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMC8wNS8yMDIyIDIzOjQ3LCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IEhpIFBldHIs
Cj4gCj4gTGUgbWFyLiAxMCBtYWkgMjAyMiDDoCAyMjoxNiwgUGV0ciBWb3JlbCA8cGV0ci52b3Jl
bEBnbWFpbC5jb20+IGEgw6ljcml0IDoKPj4KPj4gSGkgYWxsLAo+Pgo+PiBtZXNvbi5idWlsZCBb
MV0gdXNlcyBnaXQtdmVyc2lvbi5oLm1lc29uIFsyXSB0byBwcm9kdWNlIEJVSUxEX0RJUkVDVE9S
WS9naXQtdmVyc2lvbi5oLgo+Pgo+PiBCdWlsZGluZyBmcm9tIHNvdXJjZXMgKG5vdCBpbiBCdWls
ZHJvb3QpIGl0IHdvcmtzOgo+PiAkIGhlYWQgLTEgYnVpbGRkaXIvZ2l0LXZlcnNpb24uaAo+PiAj
ZGVmaW5lIFBBQ0tBR0VfVkVSU0lPTiAiMjAyMTEyMTUtMTUtZzMwOWYyODUiCj4+Cj4+IEJ1dCBi
dWlsZGluZyBpbiBCdWlsZHJvb3QgaXQgZ2V0cyBnaXQgdmVyc2lvbiBmcm9tIEJ1aWxkcm9vdDoK
Pj4gJCBoZWFkIC0xIG91dHB1dC9idWlsZC9pcHV0aWxzLTIwMjExMjE1L2J1aWxkL2dpdC12ZXJz
aW9uLmgKPj4gI2RlZmluZSBQQUNLQUdFX1ZFUlNJT04gIjIwMjIuMDItODc2LWczZWYwOTY3ODZh
Igo+Pgo+PiBJcyBpdCBhIGJ1ZyBpbiBpcHV0aWxzIG9yIGluIEJ1aWxkcm9vdCBtZXNvbj8KPiAK
PiBUaGlzIGlzc3VlIGlzIHJhaXNlZCBiZWNhdXNlLCBpbiB0aGUgY29udGV4dCBvZiBidWlsZHJv
b3QsIGlwdXRpbHMgaXMKPiByZXRyaWV2ZWQgYXMgYSB0YXJiYWxsLCBub3QgYSBnaXQgY2xvbmUu
CgogIFRoaXMgd291bGQgYmUgdGhlIGNhc2UgZXZlbiBpZiB3ZSB0YWtlIGl0IGZyb20gYSBpdCBj
bG9uZSwgYmVjYXVzZSB3ZSBmaXJzdCAKYXJjaGl2ZSB0aGUgdHJlZSBpbiBhIHRhcmJhbGwgYW5k
IHRoZW4gZXh0cmFjdCB0aGUgdGFyYmFsbCBpbiB0aGUgYnVpbGQgCmRpcmVjdG9yeSAoaS5lLiB3
aXRob3V0IHRoZSAuZ2l0IGRpcmVjdG9yeSkuCgogIE5vdGUgYWxzbyB0aGF0IHRoaXMgb25seSBo
YXBwZW5zIGlmIHlvdXIgb3V0cHV0IGRpcmVjdG9yeSBpcyBiZWxvdyB0aGUgCkJ1aWxkcm9vdCB0
cmVlLiBPbiB0aGUgb3RoZXIgaGFuZCwgaWYgeW91IHB1dCB5b3VyIG91dHB1dCBkaXJlY3Rvcnks
IGZvciAKZXhhbXBsZSwgdW5kZXIgYSBCUjJfRVhURVJOQUwgcmVwb3NpdG9yeSAod2hpY2ggaXMg
d2hhdCBJIHVzdWFsbHkgZG8pLCB0aGVuIGl0IAp3aWxsIHRha2UgdGhlIHZlcnNpb24gZnJvbSB0
aGF0IHJlcG8uCgo+IFNvIG1lc29uJ3MgdmNzX3RhZyB3aWxsIHJldHJpZXZlIHRoZSBnaXQgaW5m
b3JtYXRpb24gZnJvbSBidWlsZHJvb3QKPiBhbmQgd2lsbCBub3QgdXNlIGl0cyBmYWxsYmFjayAo
aS5lLiBtZXNvbi5wcm9qZWN0X3ZlcnNpb24oKSkuCj4gCj4gVG8gZml4IGl0LCB0aGVyZSBpcyB0
aHJlZSAic2ltcGxlIiBvcHRpb25zOgo+ICAgLSBhbGxvdyBidWlsZHJvb3QgdG8gY29uZmlndXJl
IHRoZSB2ZXJzaW9uIChhcyBhbHJlYWR5IGRvbmUgaW4KPiBvcGVuNjI1NDEgcGFja2FnZSkKPiAg
IC0gZG9uJ3QgdXNlIHZjc190YWcgYW5kIGFsd2F5cyBzZXQgcGFja2FnZV92ZXJzaW9uIHRvCj4g
bWVzb24ucHJvamVjdF92ZXJzaW9uKCkgb3V0c2lkZSBvZiBhICJkZXZlbCIgbW9kZSBhcyBkb25l
IGZvciBleGFtcGxlCj4gaW4gZ25vbWUgY29uc29sZSBbMV0KPiAgIC0gb3ZlcnJpZGUgdGhlIGRl
ZmF1bHQgdmNzIGNvbW1hbmQgaW4gdmNzX3RhZyBjYWxsIChlLmcuIGNvbW1hbmQ6Cj4gJ2dpdCAt
LWdpdC1kaXI9LmdpdCBkZXNjcmliZSAtLWRpcnR5PSsnKQoKICBUaGlzIGlzIGEgcHJvYmxlbSBm
b3IgYWxsIHBhY2thZ2VzLCBub3QganVzdCBpcHV0aWxzLgoKICBJIHRoaW5rIGEgc29sdXRpb24g
Y291bGQgYmUgdG8KCmV4cG9ydCBHSVRfQ0VJTElOR19ESVJFQ1RPUklFUyA9ICQoT1VUUFVUX0RJ
UikKClRoYXQgd2F5LCBnaXQgd29uJ3QgdHJhdmVsIHVwIHRvIHRoZSBidWlsZHJvb3QgZGlyZWN0
b3J5LiBTaG91bGQgYmUgdGVzdGVkIHdpdGggCnB1dHRpbmcgdGhlIG91dHB1dCBkaXJlY3Rvcnkg
aW4gdmFyaW91cyBwbGFjZXMsIGFuZCBhbHNvIHdpdGggcHV0dGluZyBETF9ESVIgCmJlbG93IE9V
VFBVVF9ESVIgb3IgZXF1YWwgdG8gT1VUUFVUX0RJUiBhbmQgZG93bmxvYWRpbmcgZ2l0IHBhY2th
Z2VzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiBBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0
byBwYXRjaCBtZXNvbiBzbyB2Y3NfdGFnIGlzIGFsd2F5cyBydW4gd2l0aAo+ICItLWdpdC1kaXI9
LmdpdCIuCj4gVGhpcyBpcyBwcm9iYWJseSB0aGUgbW9yZSBjb3JyZWN0IG9wdGlvbiBhcyB0aGlz
IGlzc3VlIGlzIHByb2JhYmx5Cj4gYWZmZWN0aW5nIG90aGVyIHBhY2thZ2VzIHRoYW4gaXB1dGls
cy4KPiBIb3dldmVyLCBmcm9tIG15IGV4cGVyaWVuY2UgaW4gbWVzb24sIGdldHRpbmcgc29tZXRo
aW5nIG1lcmdlZAo+IHVwc3RyZWFtIGNhbiB0YWtlIGEgdmVyeSB2ZXJ5IGxvbmcgdGltZSAoZS5n
LiBtb3JlIHRoYW4gdHdvIHllYXJzIGZvcgo+IGEgcHJlZmVyX3N0YXRpYyBvcHRpb24gWzJdKQo+
IEkgZG9uJ3Qga25vdyBpZiB0aGlzIGlzIGNvbXBsZXRlbHkgcmVsYXRlZCBidXQgdGhpcyBpc3N1
ZSBvbiB2Y3NfdGFnCj4gaXMgb3BlbmVkIGZvciBtb3JlIHRoYW4gb25lIHllYXIgWzNdIC4uLgo+
IAo+PiBBbnkgaWRlYSBob3cgdG8gZml4IGl0Pwo+Pgo+PiBLaW5kIHJlZ2FyZHMsCj4+IFBldHIK
Pj4KPj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9pcHV0aWxzL2lwdXRpbHMvYmxvYi9tYXN0ZXIv
bWVzb24uYnVpbGQjTDE0Cj4+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vaXB1dGlscy9pcHV0aWxz
L2Jsb2IvbWFzdGVyL2dpdC12ZXJzaW9uLmgubWVzb24KPiAKPiBCZXN0IFJlZ2FyZHMsCj4gCj4g
RmFicmljZQo+IAo+IFsxXSBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvY29uc29sZS8t
L2Jsb2IvbWFpbi9tZXNvbi5idWlsZCNMMzUKPiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL21lc29u
YnVpbGQvbWVzb24vcHVsbC82NjI5Cj4gWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9tZXNvbmJ1aWxk
L21lc29uL2lzc3Vlcy84NTY3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
