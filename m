Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44D4C54E67
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 20:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A139681F00;
	Wed, 20 Mar 2024 20:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jjBKBcv4StXw; Wed, 20 Mar 2024 20:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B859B81F10
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B859B81F10;
	Wed, 20 Mar 2024 20:30:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 190541BF5AE
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 20:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 060FC60D95
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 20:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8yi31N0Sj3_J for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 20:30:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E66C960629
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E66C960629
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E66C960629
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 20:30:08 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-414701303f7so2160225e9.2
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 13:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710966606; x=1711571406;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wy0AtV+Czg5wysg1nqm0Dq3I9JGdDrKqXV6cb4NTS3Q=;
 b=quk0bHkHtCQGrtl1P87l4V+rWmIQjFT+AhfNPGEq3lVZ8EhrI0FjeC1s2LpSBa8Brc
 FfBC1puLdzCt4FgQoUC4tTRwRg/XoAWjcrneweeqpkZJwqAct+GWkQ1v5BU7FSuU8HDi
 b6xmOcIanOIrmL8XpvaXgOx9loABqgLUuXbW8Kvuv3gvJIjj+DRHSORFxW+UFlNljiyB
 guBE9XXb+SmKLDni8b/iYG4tRiJ/AiXD7TEAl0H1k22GLJayzJTI19/yJBhWeqcJCW1y
 sR+G1TQBZXGfBrMgeWX9rIAEI/vmCeyP4mbodexK0K0EJaieVrQuOh45ewMGsEsTUubU
 wN/w==
X-Gm-Message-State: AOJu0Yy56qdQQYnjC8p9Ci9H9frwsJXD7CKxguuJSLp+iQ8r78OAjzzt
 0hoxSpCfu2r8mEEDRZXZnYIjSpzvoEv7K0qRZ3ZqbZLRfm8Ky4I+s40Onomtu8c=
X-Google-Smtp-Source: AGHT+IGlh3xJ6zpDtnHhp2QIq0tPM7rrU6oONXBwxVLbR3anYxcVmoLQJDs6N2ko/fOf03HDBKcbmA==
X-Received: by 2002:a05:6000:1562:b0:33e:db44:9a5b with SMTP id
 2-20020a056000156200b0033edb449a5bmr157885wrz.14.1710966606234; 
 Wed, 20 Mar 2024 13:30:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b0041461a922c2sm3284776wmq.5.2024.03.20.13.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 13:30:05 -0700 (PDT)
Message-ID: <8390667b-c1a7-46b3-83e6-615e9713097d@mind.be>
Date: Wed, 20 Mar 2024 21:30:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Christian Stewart <christian@aperture.us>, stefan@agner.ch
References: <893660729815cb737418892a77d27ba089a6cbde.1677568448.git.stefan@agner.ch>
 <20240319215037.8766-1-christian@aperture.us>
 <CA+h8R2p6raJ3KpOU0mP-dTgj=nKxk62o8xutd3HPdf7K+Jpc=Q@mail.gmail.com>
 <de337dcc-6b8b-4082-80a0-85e36469e188@benettiengineering.com>
In-Reply-To: <de337dcc-6b8b-4082-80a0-85e36469e188@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710966606; x=1711571406; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wy0AtV+Czg5wysg1nqm0Dq3I9JGdDrKqXV6cb4NTS3Q=;
 b=gLHf7LQGN/ArHIdixLptWWryMCOWfZWc1c5WHmcS6dh2qXDENjPXJS/eCnHZFdovVH
 sRGVXQEhnzRLH0l3GgC/XsdEaH52Mleq7D6p1NK/haZsMkKhnbvqH9AmN5fC9HD0ipU8
 CmaTzt8P4Yh94VeslGzxdVKHRRmIcVK3Eg5G3DfnJSSVgETNqkU68tyjvD94g8ucIwKQ
 Me7LdDQ/JLOUBO0Jdw/4ALeuxLd/Je3yNVLixa0vI9iguYyABjGE8T3107v6DtXo6MuJ
 MF+AprSqQp0S8OgDQdM7/ytiBTVKETFw43TNz3R3JsZl6+YDZTFily9mcMmPss7PZeYX
 Dbyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gLHf7LQG
Subject: Re: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: bump to
 version 2024-03-16 on branch v5.6.4.2
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOS8wMy8yMDI0IDIzOjMxLCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBIaSBDaHJpc3Rp
YW4sCj4gCj4gT24gMTkvMDMvMjQgMjI6NTIsIENocmlzdGlhbiBTdGV3YXJ0IHZpYSBidWlsZHJv
b3Qgd3JvdGU6Cj4+IEFsbCwKPj4KPj4gT24gVHVlLCBNYXIgMTksIDIwMjQgYXQgMjo1MOKAr1BN
IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+Pj4KPj4+
PiBUaGlzIHZlcnNpb24gYWRkcyBzdXBwb3J0IHVwIHRvIExpbnV4IHZlcnNpb24gNi44Lgo+Pj4+
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0
dGllbmdpbmVlcmluZy5jb20+Cj4+Pj4gLS0tCj4+Pj4gcGFja2FnZS9ydGw4ODEyYXUtYWlyY3Jh
Y2stbmcvcnRsODgxMmF1LWFpcmNyYWNrLW5nLmhhc2ggfCAyICstCj4+Pj4gcGFja2FnZS9ydGw4
ODEyYXUtYWlyY3JhY2stbmcvcnRsODgxMmF1LWFpcmNyYWNrLW5nLm1rwqDCoCB8IDIgKy0KPj4+
PiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Pgo+
Pj4+IFtzbmlwXQo+Pj4+Cj4+Pj4gLXNoYTI1NsKgIDk2OWZhOTZjOTBlMTZmY2FmOGY2YjMwZDQ1
NzZhODQ0NmM3MDQxOTMyYmVhMzRiYmZlYTdlOWM5MTAzOGJmZTUgIAo+Pj4+IHJ0bDg4MTJhdS1h
aXJjcmFjay1uZy00YTk4M2U0N2RhZmMwNDgwMTk0MTIzNTBkMzYyNzA4NjRmNmI1ZjJkLnRhci5n
ego+Pj4+ICtzaGEyNTbCoCA3NTJkOWFlNjcxNDA5NjZlZGRjNDYzMjM4ZmRlMWY2Yjg2NDU3ZGIy
MmE0NWY2MWMxMzg4NmMzMjQ0ZWFmZmUxICAKPj4+PiBydGw4ODEyYXUtYWlyY3JhY2stbmctZjIz
OTc5ZjBkMjBhYWZiNTYzYWM3MWI1NmZjYmM3NDI2OGM3OThjMi50YXIuZ3oKPj4+Pgo+Pj4+IFtz
bmlwXQo+Pj4+Cj4+Pj4gLVJUTDg4MTJBVV9BSVJDUkFDS19OR19WRVJTSU9OID0gNGE5ODNlNDdk
YWZjMDQ4MDE5NDEyMzUwZDM2MjcwODY0ZjZiNWYyZAo+Pj4+ICtSVEw4ODEyQVVfQUlSQ1JBQ0tf
TkdfVkVSU0lPTiA9IGYyMzk3OWYwZDIwYWFmYjU2M2FjNzFiNTZmY2JjNzQyNjhjNzk4YzIKPj4+
Cj4+PiBUaGFua3MsIGZpeGVzIGJ1aWxkIG9uIDYuOC54Lgo+Pj4KPj4+IFJldmlld2VkLWJ5OiBD
aHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPgo+Pgo+Pgo+PiBJIHdhcyB0
cnlpbmcgdG8gcmVwbHkgdG8gYW4gYWxyZWFkeSBzZW50IHBhdGNoOgo+Pgo+PiBodHRwczovL3Bh
dGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwMzE4MjAzNTM3
LjM0MTUyMy0xLWdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20vCj4+Cj4+IE5v
dCBzdXJlIGlmIHRoZSByZXBseSB3ZW50IHRvIHRoZSBjb3JyZWN0IG1lc3NhZ2UgdGhyZWFkLgo+
IAo+IEl0IGRpZCA6LSkKCiAgUGF0Y2h3b3JrIGRpZG4ndCBwaWNrIGl0IHVwIHRob3VnaCwgc28g
SSBhZGRlZCBpdCBtYW51YWxseS4KCiAgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiAgUmVn
YXJkcywKICBBcm5vdXQKCgo+IAo+Pgo+PiBUcnlpbmcgdG8gaW1wb3J0IGFuZCBzZW5kIHJlcGxp
ZXMgdG8gbWJveCB3aXRoIGdtYWlsIGlzIG5vdCBzbyBlYXN5IQo+IAo+IEkgYWdyZWUhCj4gCj4g
VGhhbmsgeW91IGFuZAo+IEJlc3QgcmVnYXJkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
