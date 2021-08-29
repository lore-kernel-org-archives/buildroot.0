Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A131C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 15:01:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5736B6054F
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 15:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5736B6054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08AC840491;
	Sun, 29 Aug 2021 15:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bmnKZ_xtVa7r; Sun, 29 Aug 2021 15:01:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01EA440499;
	Sun, 29 Aug 2021 15:01:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D927E1BF417
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 15:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C74C760649
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 15:01:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K97bt5J50VsP for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 15:01:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E3776060F
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 15:01:39 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id mf2so25318732ejb.9
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 08:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TAG2N++2YTDPW63e/Bi7kJDG07Phx4WgBaAWWZM4IRw=;
 b=e0LaR3k3aBO0pcUAu9s3Z74/tr6Dn0PUdRkcRd7a7z2ZFFpsbwqO2JA7DH9A8SN++Y
 M8vE3UJ+h6xPCLWhX11GcnRum6jwfXFhFRXtiISryN6Z9BOLGpnw8452vJMHWMRmdxQU
 +GUvWmQuK8vQ/J+gGVwn11qwMz4LDWf0N8wHEanoJutsBzJn0DvlNfpKg3zHZIFgZzr4
 0lLQye7cxlEw1+Sercf6P5L90JV4ITG6lc3+x/oiratpjNpL5eDFFM7uPb4JYOWX5q3T
 /G+xwjS/7iA+iMgQveHp35nv7QRYr5c0mzocVxcnZ87EUY0KOY6pevjAP1DsKYCutdai
 gxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=TAG2N++2YTDPW63e/Bi7kJDG07Phx4WgBaAWWZM4IRw=;
 b=mFtysInnSzxMC6gnJaHNHisCjxV5Ah6daeAYToZ7HE1Z1FOuVdvVoKqDRrU3GlGMQt
 TtkhD6fe4ME9N2JxXKvkDU26dSHzbzmUGS0wE/cCNmrJIs12PCKg8233mfZMlzVxXe7N
 +egzezwHnM3hhB+FFwfLpv4tQ1Pudnd8UQ3c/V7xh8/FOqgMB5aUji/ojiQ1wHguYMja
 +dsQn5l289swiEd5WT5ZVSJAIfovBMaN9xbterOAkTl9WUQtPbhwE6RAOTAYLnqKirME
 YifjaGh8P3benWJgnm5fmUVBVdsyGctCtu8A7H7zCPYumRE2fHUV7xWjZSwO6kj3MA0Z
 rVlw==
X-Gm-Message-State: AOAM531vBtrILPPC42Vn3HTGRAr8lm01+gMxLvi9SG9LhINFtW2x5FyM
 ceMr0BHrK0BMj9CWes2PCrnlDQ==
X-Google-Smtp-Source: ABdhPJwwIF9q2J9764rwK8SQpRi0FbMdFB6f4kMAJRoukhcoSG4v5qUjfrcruDb3bmnHuRfhJ7Dlzw==
X-Received: by 2002:a17:906:584b:: with SMTP id
 h11mr20858502ejs.209.1630249297652; 
 Sun, 29 Aug 2021 08:01:37 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id og4sm5539563ejc.120.2021.08.29.08.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Aug 2021 08:01:37 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
 <20210817083930.3718711-8-herve.codina@bootlin.com>
 <20210828224740.GS2661@scaer> <20210829133955.74d921e9@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <8b85fc92-b792-dccc-6258-bc6a07a03848@mind.be>
Date: Sun, 29 Aug 2021 17:01:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210829133955.74d921e9@windsurf>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v3 07/16] package/pkg-generic.mk: detect
 files overwritten in TARGET_DIR and HOST_DIR
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Herve Codina <herve.codina@bootlin.com>,
 Naumann Andreas <ANaumann@ultratronik.de>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAyOS8wOC8yMDIxIDEzOjM5LCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgo+IEhlbGxvIFlh
bm4sCj4gCj4gRmlyc3Qgb2YgYWxsLCB0aGFua3MgYSBsb3QgZm9yIHJldmlld2luZyBhbmQgbWVy
Z2luZyBiaXRzIG9mIHRoaXMgcGF0Y2gKPiBzZXJpZXMsIEknbSBnbGFkIHRvIHNlZSB3ZSdyZSBt
YWtpbmcgcHJvZ3Jlc3Mgd2l0aCB0aGUgVExQIHN0dWZmLgo+IAo+IE9uIFN1biwgMjkgQXVnIDIw
MjEgMDA6NDc6NDAgKzAyMDAKPiAiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVl
LmZyPiB3cm90ZToKPiAKPj4gSG93ZXZlciwgd2hhdCBwcm9tcHRlZCBtZSBmcm9tIGFwcGx5aW5n
IGZvciBub3csIGlzIHRoYXQgdGhpcyBuZXcKPj4gZGV0ZWN0aW9uIGlzIGEgaGFyZCBlcnJvci4K
Pj4KPj4gUHJldmlvdXNseSwgY2hlY2stdW5pcS1maWxlcyB3YXMganVzdCBlbWl0dGluZyB3YXJu
aW5ncywgYnV0IHdvdWxkIG5vdAo+PiBwcmV2ZW50IHRoZSBidWlsZCBmcm9tIGZhaWxpbmcuIE5v
dywgd2l0aCB0aGlzIHBhdGNoLCBldmVuIGFuIGlubm9jdW91cwo+PiBvdmVyd3JpdGUgKGUuZy4g
YmVjYXVzZSBhIHBvc3QtYnVpbGQgc2NyaXB0IGRlbGV0ZXMgdGhlIGZpbGUsIG9yIHRoZQo+PiBj
b250ZW50IG9mIHRoZSBmaWxlIHJlYWxseSBkb2VzIG5vdCBtYXR0ZXIgYXQgcnVudGltZSksIHRo
ZSBidWlsZCB3aWxsCj4+IGZhaWwuCj4+Cj4+IEkuZS4gY29uZmlndXJhdGlvbnMgdGhhdCBhcmUg
Y3VycmVudGx5IHdvcmtpbmcgd2l0aCBQUEQsIGRlc3BpdGUgdGhlCj4+IG92ZXJ3cml0ZSwgd2ls
bCBzdWRkZW5seSBubyBsb25nZXIgYnVpbGQuCj4+Cj4+IE9UT0gsIGlmIHdlIGRvIG5vdCBtYWtl
IHRoYXQgYSBoYXJkLWVycm9yLCB3ZSB3aWxsIG5ldmVyIGRldGVjdCBtb3N0Cj4+IGlzc3Vlcywg
YmVjYXVzZSB1c2VycyB3aWxsIG5ldmVyIHNwb3QgdGhvc2Ugd2FybmluZ3MgYW5kIHdpbCBlbnZl
cgo+PiByZXBvcnQgaXNzdWVzLCBhbmQgdGhlIGF1dG9idWlsZGVycyB3aWxsIG5vdCBmYWlsIGFu
ZCB3ZSB3aWxsIG5vdAo+PiBub3RpY2UgZWl0aGVyLi4uCj4+Cj4+IE9uZSBzb2x1dGlvbiBpcyB0
byBhZGQgYSBjb25maWd1cmF0aW9uIGtub2IgdG8gbWFrZSB0aGF0IGEgaGFyZC1lcnJvciwKPj4g
bGlrZSB3ZSBoYXZlIHRoZSBwYXJhbm9pZCBsaWJzL2hlYWRlcnMgY2hlY2s6Cj4+Cj4+ICAgICBj
b25maWcgQlIyX1BQRF9PVkVSV1JJVEVfU1RSSUNUCj4+ICAgICAgICAgYm9vbCAiU3RyaWN0IGZp
bGUgb3ZlcndyaXRlIGRldGVjdGlvbiIKPj4gICAgICAgICBkZXBlbmRzIG9uIEJSMl9QRVJfUEFD
S0FHRV9ESVJFQ1RPUklFUwo+PiAgICAgICAgIGhlbHAKPj4gICAgICAgICAgIFNheSAneScgaGVy
ZSB0byB0dXJuIHRoZSBmaWxlIG92ZXJ3cml0ZSBkZXRlY3Rpb24KPj4gICAgICAgICAgIHRvIGEg
aGFyZCBlcnJvci4gQnkgZGVmYXVsdCwgb25seSB3YXJuaW5ncyB3aWxsIGJlCj4+ICAgICAgICAg
ICBwcmludGVkLgo+IAo+IFdlIGhhZCBzb21lIGRpc2N1c3Npb24gd2l0aCBIZXJ2w6kgYmFjayB3
aGVuIGhlIHdvcmtlZCBvbiB0aGlzLCBhbmQgSQo+IGRpc2FncmVlZCB3aXRoIGFkZGluZyBhbiBv
cHRpb24uIFdoZW4gQlIyX1BFUl9QQUNLQUdFX0RJUkVDVE9SSUVTPXksIGEKPiBmaWxlIG92ZXJ3
cml0ZSBtdXN0IGJlIGEgaGFyZCBlcnJvciwgYXMgdGhlIHJlc3VsdCBvZiB0aGUgYnVpbGQgaXMK
PiBpbmNvcnJlY3QgaWYgdGhlcmUgaXMgYW4gb3ZlcndyaXRlLiBJdCdzIG5vdCB0aGUgImxhdGVz
dCIgcGFja2FnZSB0aGF0Cj4gd2lucyBpbiBhbiBvdmVyd3JpdGUgc2l0dWF0aW9uLCBsaWtlIGl0
IGRvZXMgaW4gYSBub24tUFBEIGNhc2UuCj4gCj4gU28gSSByZWFsbHkgdGhpbmsgdGhpcyBtdXN0
IGJlIGEgaGFyZCBlcnJvciBmb3IgUFBEIGJ1aWxkcywgYW5kIGp1c3QgYQo+IHdhcm5pbmcgZm9y
IG5vbi1QUEQgYnVpbGRzLgo+IAo+IFllcywgZm9yIFBQRCBidWlsZHMsIGl0IG1lYW5zIHVzZXJz
IHdpbGwgZ2V0IGZhaWx1cmVzLCBidXQgdGhvc2UKPiBmYWlsdXJlcyBhcmUgcG9pbnRpbmcgdG8g
cmVhbCBwcm9ibGVtcy4KPiAKPiBTbywgbXkgcHJlZmVyZW5jZSB3b3VsZCBiZSB0byBtZXJnZSBh
cyBhbiB1bmNvbmRpdGlvbmFsIGNoZWNrLCBhbmQgc2VlCj4gaG93IGl0IGdvZXMuIFBlcmhhcHMg
dGhlIHNpdHVhdGlvbiB3aWxsIGJlIHNvIGJhZCB0aGF0IHdlIHdpbGwgaGF2ZSB0bwo+IG1ha2Ug
aXQgY29uZGl0aW9uYWwsIGJ1dCBJIHdvdWxkIHByZWZlciB0byBoYXZlIGl0IHVuY29uZGl0aW9u
YWwgZmlyc3QKPiBhbmQgc2VlIHRoZSBpbXBhY3QuCgogSSB3YXMgb3JpZ2luYWxseSB3aXRoIFlh
bm4sIGJ1dCB0aGVzZSBhcmd1bWVudHMgY29udmluY2VkIHRoYXQgaXQgaXMgaW5kZWVkCmJldHRl
ciB0byBub3QgaGF2ZSB0aGUgb3B0aW9uIChmb3Igbm93KS4KCiBSZWdhcmRzLAogQXJub3V0Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5u
ZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
