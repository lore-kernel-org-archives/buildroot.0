Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6966AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 14:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC718408A5;
	Sat, 15 Jan 2022 14:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6IaIfwoOEiFL; Sat, 15 Jan 2022 14:55:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 160E14089F;
	Sat, 15 Jan 2022 14:55:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CAE91BF293
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 14:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 579AF400A6
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 14:55:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tsiyp6eZria0 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 14:55:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0305D40004
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 14:55:43 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 s6-20020a7bc386000000b0034a89445406so9298092wmj.2
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 06:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2rRFpUSsmO+Ep5+k4CmsqQw8gSlgT5RORfdc49lvXyU=;
 b=PpG0KXFKghTr6xJysam54UffU40BhZxhL8aV61ttQ2aaYhjwZ7HtNvxuxNpKIIrLCk
 rHu0MBry3Z1s1QA4XIwKv8oOyEz3gEkFfmarNoLHpnWWOTG1tnS4eS5wDnurroqyR9xT
 q8nOR0Ozn62dx5f2uehn4Mi9BnQAixiclZybNA6sbtkv81psELjH3odOf+i3Ti9JFFqL
 6qWQANei8OxhOQTtORq87bkIV4GqaEinkbaIQzCoKTay/I/RNGs8KPrW68Zljuk8nfLl
 jf4dd8cdCbsv4Z0Wh0O/rSToD16FVV8TR/W8MCjopKWv5UWlveXMOs/ODvPAAiF4H348
 qW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2rRFpUSsmO+Ep5+k4CmsqQw8gSlgT5RORfdc49lvXyU=;
 b=ejhOMCx5GffYlZBE9yifVWjiqOoHJuo+++fjPuwGJA8DEZxSHLByDOpXZ24olsrIDj
 qtkGawHQB30yvqlCo1/iO1PS+EgL+l9fG+BFLCQNydiE2+F//sApL4ILY+TkCLQ8BNZp
 2coW2LphktoUplJfKtvB1Ic7XbQ0KE8/D/Pyyk/hkkfAd1iaGJS3sW1MRJgM14uKbzEV
 j5Pb9gIetYX5SVEnOqWDoWIyXCg9Ix28tvak3//p5DhTuqOrXkNG+N67rA/PX6G3XTf7
 QRabsMMvAxnxvsuPZqkGSQFL57h23Szx+kPEJR6h5ROzSaQJblbsoyb5jivKIwKbSNYu
 KMuw==
X-Gm-Message-State: AOAM533n/Py695s7xHlAuFQItyQD8f6R1UlzbMfGX9YMZBBs58KhChOb
 LI2tMywnHHx5BId5t45zmP8=
X-Google-Smtp-Source: ABdhPJxSzt54JEz4d3ATrh3GNCDsFcogilPO9xgU1OlS3gxeAQdfTNRJN/tMuaACXEwfOyxzak4Kvg==
X-Received: by 2002:a1c:1dd0:: with SMTP id
 d199mr12711994wmd.121.1642258542249; 
 Sat, 15 Jan 2022 06:55:42 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id y13sm814691wry.111.2022.01.15.06.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Jan 2022 06:55:41 -0800 (PST)
Message-ID: <439edf17-a918-09da-bad6-3253ad6bb5a5@gmail.com>
Date: Sat, 15 Jan 2022 15:55:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>
References: <20210518113652.29609-1-patrickdepinguin@gmail.com>
 <20210518113652.29609-3-patrickdepinguin@gmail.com>
 <cd4152f3-72a1-fff8-828e-330c22a353d5@gmail.com>
 <CAAXf6LX7Lr_ZPA9eCwUbjxWWRFt89A2N7Eq=KcKqKSLDw8Kviw@mail.gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <CAAXf6LX7Lr_ZPA9eCwUbjxWWRFt89A2N7Eq=KcKqKSLDw8Kviw@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 2/4] core: introduce NORMALIZED_ARCH as
 non-kernel replacement for KERNEL_ARCH
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>,
 Clayton Shotwell <clayton.shotwell@collins.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKTGUgMTQvMDEvMjAyMiDDoCAxMzoyNywgVGhvbWFzIERlIFNjaGFtcGhlbGVp
cmUgYSDDqWNyaXTCoDoKPiBIaSBSb21haW4sCj4gCj4gRWwganVlLCAxMyBlbmUgMjAyMiBhIGxh
cyAyMjozMCwgUm9tYWluIE5hb3VyCj4gKDxyb21haW4ubmFvdXJAZ21haWwuY29tPikgZXNjcmli
acOzOgo+Pgo+PiBMZSAxOC8wNS8yMDIxIMOgIDEzOjM2LCBUaG9tYXMgRGUgU2NoYW1waGVsZWly
ZSBhIMOpY3JpdCA6Cj4+PiBGcm9tOiBUaG9tYXMgRGUgU2NoYW1waGVsZWlyZSA8dGhvbWFzLmRl
X3NjaGFtcGhlbGVpcmVAbm9raWEuY29tPgo+Pj4KPj4+IFRoZSB2YXJpYWJsZSAnS0VSTkVMX0FS
Q0gnIGlzIGFjdHVhbGx5IGEgbm9ybWFsaXplZCB2ZXJzaW9uIG9mCj4+PiAnQVJDSCcvJ0JSMl9B
UkNIJy4gRm9yIGV4YW1wbGUsICdhcmNsZScgYW5kICdhcmNlYicgYm90aCBiZWNvbWUgJ2FyYycs
IGp1c3QKPj4+IGFzIGFsbCBwb3dlcnBjIHZhcmlhbnRzIGJlY29tZSAncG93ZXJwYycuCj4+Pgo+
Pj4gSXQgaXMgcHJlc3VtYWJseSBjYWxsZWQgJ0tFUk5FTF9BUkNIJyBiZWNhdXNlIHRoZSBMaW51
eCBrZXJuZWwgaXMgdHlwaWNhbGx5Cj4+PiB0aGUgZmlyc3QgcGxhY2Ugd2hlcmUgc3VwcG9ydCBm
b3IgYSBuZXcgYXJjaGl0ZWN0dXJlIGlzIGFkZGVkLCBhbmQgdGh1cyBpcwo+Pj4gdGhlIGVudGl0
eSB0aGF0IGRlZmluZXMgdGhlIG5vcm1hbGl6ZWQgbmFtZS4KPj4+Cj4+PiBIb3dldmVyLCB0aGUg
dGVybSAnS0VSTkVMX0FSQ0gnIGNhbiBhbHNvIGJlIGludGVycHJldGVkIGFzICd0aGUgYXJjaGl0
ZWN0dXJlCj4+PiB1c2VkIGJ5IHRoZSBrZXJuZWwnLCB3aGljaCBuZWVkIG5vdCBiZSBleGFjdGx5
IHRoZSBzYW1lIGFzICd0aGUgbm9ybWFsaXplZAo+Pj4gbmFtZSBmb3IgYSBjZXJ0YWluIGFyY2gn
LiBJbiBwYXJ0aWN1bGFyLCBmb3IgY2FzZXMgd2hlcmUgYSA2NC1iaXQKPj4+IGFyY2hpdGVjdHVy
ZSBpcyBydW5uaW5nIGEgNjQtYml0IGtlcm5lbCBidXQgMzItYml0IHVzZXJzcGFjZS4gRXhhbXBs
ZXMKPj4+IGluY2x1ZGU6Cj4+PiAgICAgKiBhYXJjaDY0IGFyY2hpdGVjdHVyZSwgd2l0aCBhYXJj
aDY0IGtlcm5lbCBhbmQgMzItYml0IChBUk0pIHVzZXJzcGFjZQo+Pj4gICAgICogeDg2XzY0IGFy
Y2hpdGVjdHVyZSwgd2l0aCB4ODZfNjQga2VybmVsIGFuZCAzMi1iaXQgKGkzODYpIHVzZXJzcGFj
ZQo+Pj4KPj4+IEluIHN1Y2ggY2FzZXMsIHRoZSAnYXJjaGl0ZWN0dXJlIHVzZWQgYnkgdGhlIGtl
cm5lbCcgbmVlZHMgdG8gcmVmZXIgdG8gdGhlCj4+PiA2NC1iaXQgbmFtZSAoYWFyY2g2NCwgeDg2
XzY0KSwgd2hlcmVhcyBhbGwgdXNlcnNwYWNlIGFwcGxpY2F0aW9ucyBuZWVkIHRvCj4+PiByZWZl
ciB0aGUsIHBvdGVudGlhbGx5IG5vcm1hbGl6ZWQsIDMyLWJpdCBuYW1lLgo+Pj4KPj4+IFRoaXMg
bWVhbnMgdGhhdCB0aGVyZSBuZWVkIHRvIGJlIHR3byBkaWZmZXJlbnQgdmFyaWFibGVzOgo+Pj4K
Pj4+IEtFUk5FTF9BUkNIOiAgICAgdGhlIGFyY2hpdGVjdHVyZSB1c2VkIGJ5IHRoZSBrZXJuZWwK
Pj4+IE5PUk1BTElaRURfQVJDSDogdGhlIG5vcm1hbGl6ZWQgbmFtZSBmb3IgdGhlIGN1cnJlbnQg
dXNlcnNwYWNlIGFyY2hpdGVjdHVyZQo+Pj4KPj4+IEF0IHRoaXMgbW9tZW50LCBib3RoIHdpbGwg
YWN0dWFsbHkgaGF2ZSB0aGUgc2FtZSBjb250ZW50LiBCdXQgYSBzdWJzZXF1ZW50Cj4+PiBwYXRj
aCB3aWxsIGFkZCBiYXNpYyBzdXBwb3J0IGZvciBzaXR1YXRpb25zIGRlc2NyaWJlZCBhYm92ZSwg
aW4gd2hpY2gKPj4+IEtFUk5FTF9BUkNIIG1heSBiZWNvbWUgb3ZlcndyaXR0ZW4gdG8gdGhlIDY0
LWJpdCBhcmNoaXRlY3R1cmUsIHdoaWxlCj4+PiBOT1JNQUxJWkVEX0FSQ0ggbmVlZHMgdG8gcmVt
YWluIHRoZSBzYW1lICgzMi1iaXQpIGNhc2UuCj4+Pgo+Pj4gVGhpcyBjb21taXQgcmVwbGFjZXMg
dXNlIG9mIEtFUk5FTF9BUkNIIHdoZXJlIGFjdHVhbGx5IHRoZSB1c2Vyc3BhY2UgYXJjaCBpcwo+
Pj4gbmVlZGVkLiAgUGxhY2VzIHRoYXQgdXNlIEtFUk5FTF9BUkNIIGluIGNvbWJpbmF0aW9uIHdp
dGggYnVpbGRpbmcgb2Yga2VybmVsCj4+PiBtb2R1bGVzIGFyZSBub3QgdG91Y2hlZC4KPj4+IFRo
ZXJlIG1heSBiZSBjYXNlcyB3aGVyZSBhIHBhY2thZ2UgYnVpbGRzIGJvdGggYSBrZXJuZWwgbW9k
dWxlIGFzIHVzZXJzcGFjZSwKPj4+IGluIHdoaWNoIGNhc2UgaXQgbWF5IG5lZWQgdG8ga25vdyBh
Ym91dCBib3RoIEtFUk5FTF9BUkNIIGFuZAo+Pj4gTk9STUFMSVpFRF9BUkNILCBmb3IgdGhlIGNh
c2Ugd2hlcmUgdGhleSBkaWZmZXIuIEJ1dCB0aGlzIGlzIHRvIGJlIGZpeGVkIG9uCj4+PiBhIHBl
ci1uZWVkIGJhc2lzLgo+Pgo+PiBXaGlsZSByZXZpZXdpbmcgdGhpcyBwYXRjaCwgSSBub3RpY2Vk
IHRoYXQgTElOVVhfQVJDSF9QQVRIIFsxXSBpcyB3cm9uZyBmb3Igc3BhcmM2NAo+Pgo+PiBMSU5V
WF9BUkNIX1BBVEggPSAkKExJTlVYX0RJUikvYXJjaC8kKEtFUk5FTF9BUkNIKQo+Pgo+PiBJbmRl
ZWQ6Cj4+Cj4+ICQgbWFrZSBPPXRlc3QvcWVtdV9zcGFyYzY0X3N1bjR1X2RlZmNvbmZpZyBwcmlu
dHZhcnMgVkFSUz1MSU5VWF9BUkNIX1BBVEgKPj4gTElOVVhfQVJDSF9QQVRIPS9ob21lL2t1YnUv
YnVpbGRyb290L3Rlc3QvcWVtdV9zcGFyYzY0X3N1bjR1X2RlZmNvbmZpZy9idWlsZC9saW51eC01
LjE1L2FyY2gvc3BhcmM2NAo+Pgo+PiBCdXQgc2luY2UgTElOVVhfQVJDSF9QQVRIIGlzIG5vdCB1
c2VkIGZvciB0aGlzIGFyY2hpdGVjdHVyZSwgaXQgd2FzIG5vdCBub3RpY2VkLgo+Pgo+PiBbMV0g
aHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvdHJlZS9saW51eC9saW51eC5taz9o
PTIwMjEuMTEjbjIyNgo+Pgo+IAo+IEFyZSB5b3Ugc3VyZSB0aGF0IHRoaXMgaXMgYSBwcm9ibGVt
Pwo+IEluIHRoZSBrZXJuZWwgTWFrZWZpbGUsIHNvbWUgJ0FSQ0gnIHN0cmluZ3MgYXJlIHRyZWF0
ZWQgc3BlY2lhbGx5Ogo+IAo+ICMgQWRkaXRpb25hbCBBUkNIIHNldHRpbmdzIGZvciB4ODYKPiBp
ZmVxICgkKEFSQ0gpLGkzODYpCj4gICAgICAgICBTUkNBUkNIIDo9IHg4Ngo+IGVuZGlmCj4gaWZl
cSAoJChBUkNIKSx4ODZfNjQpCj4gICAgICAgICBTUkNBUkNIIDo9IHg4Ngo+IGVuZGlmCj4gCj4g
IyBBZGRpdGlvbmFsIEFSQ0ggc2V0dGluZ3MgZm9yIHNwYXJjCj4gaWZlcSAoJChBUkNIKSxzcGFy
YzMyKQo+ICAgICAgICBTUkNBUkNIIDo9IHNwYXJjCj4gZW5kaWYKPiBpZmVxICgkKEFSQ0gpLHNw
YXJjNjQpCj4gICAgICAgIFNSQ0FSQ0ggOj0gc3BhcmMKPiBlbmRpZgo+IAo+ICMgQWRkaXRpb25h
bCBBUkNIIHNldHRpbmdzIGZvciBwYXJpc2MKPiBpZmVxICgkKEFSQ0gpLHBhcmlzYzY0KQo+ICAg
ICAgICBTUkNBUkNIIDo9IHBhcmlzYwo+IGVuZGlmCj4gCj4gCj4gU28gY29tcGlsaW5nIHRoZSBr
ZXJuZWwgd2l0aCBBUkNIPXNwYXJjNjQgaXMgYWNjZXB0ZWQsIGFuZCB0aGUgYXJjaAo+IGRpcmVj
dG9yeSB3aWxsIGJlIGFyY2gvc3BhcmMgLiBTaW1pbGFyIHRvIGhvdyBjb21waWxpbmcgd2l0aAo+
IEFSQ0g9eDg2XzY0IHdvcmtzIGV2ZW4gdGhvdWdoIGFyY2gveDg2XzY0IGRvZXMgbm90IChubyBs
b25nZXIpIGV4aXN0Lgo+IAo+IFdoaWxlIEknbSBub3QgZmFtaWxpYXIgd2l0aCBzcGFyYzY0LCB0
aGVyZSBkb2VzIG5vdCBzZWVtIHRvIGJlIGEgYnVnIHRvIG1lLgoKSSBtZWFuIExJTlVYX0FSQ0hf
UEFUSCBpcyBhIEJ1aWxkcm9vdCB2YXJpYWJsZSBmcm9tIGxpbnV4Lm1rIHVzZWQgdG8gY29weSBz
b21lCmZpbGVzIGZyb20gdGhlIGtlcm5lbCBidWlsZCBkaXJlY3RvcnkuIEZvciBub3cgTElOVVhf
QVJDSF9QQVRIIGlzIG5vdCB1c2VkIGZvcgpzcGFyYzY0IHRhcmdldCBidXQgaWYgaXQgaGFwcGVu
cyBpdCB3aWxsIGJyZWFrLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFRoYW5rcywKPiBU
aG9tYXMKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
