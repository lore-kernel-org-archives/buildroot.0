Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9E3C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 18:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C87F40E46;
	Mon,  6 Feb 2023 18:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C87F40E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8zplI-x-0tTU; Mon,  6 Feb 2023 18:14:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A54241678;
	Mon,  6 Feb 2023 18:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A54241678
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FE7D1BF2CD
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 18:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2689F600D4
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 18:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2689F600D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5bF3SNooU0Uh for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 18:13:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52CE060B9B
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52CE060B9B
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 18:13:58 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id k13so3816854wrh.8
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 10:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IIDvCfZmpfAjbxW4QBHKNDJMxCz2JFq/OsVT+cWgILY=;
 b=TDv0S8hPe+oCSvZKWgnYqDNnozb/EE0nX5MTO3lC1C9HWcILOgx+rw7gQKzV4u7RIJ
 JhLaqRBCKvUJtTqW3okIF/+5ObBvtE5J/PUYFhyZtOuoQsc/DROGkMbkr8nVc1lT89Wk
 AAVjXUu6sjfP5uijsBL9oxSIg6d9l00LHcj58SVImgAJVjPHMquYAGTLBEMEFN6Fvryx
 V+2bTAlZrP8BHnP4BJtZERxAty+kHSggburWIcMQc1v3l/B0WPmYyoSxkDxk1+SB4HMs
 r8+uQh63W9zFiptOXxK8JTw0WEnaKF+p9vCbfg4B09DaWnJ1zP6kAxGD7uGofkZ4BxPL
 u6Ww==
X-Gm-Message-State: AO0yUKWypJWj3JnUQEq6dgRTpnnWitgtA4LaBtCpeO7K6d84g3xdSqnM
 ghWjLoKFPrAtEsGNoO1qwKDbbw==
X-Google-Smtp-Source: AK7set/40CtWmEpEyj3U4zPaBxzHG0JLExXWXcihMOgeoEMZuaqKBbyx2Xl2qeAxs+E+Hx2nXhf7gw==
X-Received: by 2002:a05:6000:799:b0:236:695b:82d4 with SMTP id
 bu25-20020a056000079900b00236695b82d4mr22618990wrb.30.1675707236229; 
 Mon, 06 Feb 2023 10:13:56 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 j6-20020adfb306000000b002c3d29d83d2sm8907121wrd.63.2023.02.06.10.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:13:55 -0800 (PST)
Message-ID: <1f8f6719-f816-b7a4-6837-840db623461a@smile.fr>
Date: Mon, 6 Feb 2023 19:13:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
References: <20230130002854.2300661-1-james.hilliard1@gmail.com>
 <301bf244-5eb8-3903-3371-80de9a6810aa@smile.fr>
 <282c5a46-37ed-6c07-9b72-86133a71750a@smile.fr>
 <CADvTj4o+c+9BvVXH2=6RsEgwjRbDBSHq+2+6_Whg3=esfUYVbA@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CADvTj4o+c+9BvVXH2=6RsEgwjRbDBSHq+2+6_Whg3=esfUYVbA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IIDvCfZmpfAjbxW4QBHKNDJMxCz2JFq/OsVT+cWgILY=;
 b=h2hx7QzzBHW2bb0QwuFCmawqLnaclQaRq5ApPeNbYwhXMPECu6+9O+h+r1/4THZwHg
 1UVUOkhtvtuuN6UPp5xV5YbD2knqqoU1+kPVOKOfktAjVzCRTYnCsDg6eOq3aWBewnOV
 W8WyqR4AU/k94Ziszt5uh12j5+4PCG0T5iSzmD2vxJLQFYLWgm5o9ZGybmJJRlwW8j7V
 90+8MLiIsFg5ImKW44sIQWkxYPX8TqshKJsuYsq9kZei/8p8NlKNSPg3rtPr8KqeyH83
 l0uT3go3SW6BtC9a0nKJPAwobd9/CurxcGOlIbm/diu/ZECjqNhX6cnHSp5AlPy1FR5D
 uQoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=h2hx7Qzz
Subject: Re: [Buildroot] [PATCH v5 01/10] package/cpuinfo: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDYvMDIvMjAyMyDDoCAxNzozMywgSmFtZXMgSGlsbGlhcmQgYSDDqWNyaXTCoDoKPiBPbiBN
b24sIEZlYiA2LCAyMDIzIGF0IDk6MjQgQU0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21p
bGUuZnI+IHdyb3RlOgo+Pgo+PiBIZWxsbyBKYW1lcywKPj4KPj4gTGUgMDYvMDIvMjAyMyDDoCAx
Njo1MywgUm9tYWluIE5hb3VyIGEgw6ljcml0IDoKPj4+IEhlbGxvIEphbWVzLAo+Pj4KPj4+IExl
IDMwLzAxLzIwMjMgw6AgMDE6MjgsIEphbWVzIEhpbGxpYXJkIGEgw6ljcml0IDoKPj4+PiBGcm9t
OiBTdGVmYW4gSGFnZXIgPHN0ZWZhbi5oYWdlckBnaW56aW5nZXIuY29tPgo+Pj4+Cj4+Pj4gVGhp
cyBwYWNrYWdlIGlzIHJlcXVpcmVkIGJ5IHRlbnNvcmZsb3ctbGl0ZS4KPj4+Pgo+Pj4+IEFkZCBh
IHBhdGNoIHJlbW92aW5nIGNwcCByZXF1aXJlbWVudCB3aGVuIG5vdCBidWlsZGluZyB0ZXN0cy4K
Pj4+Pgo+Pj4+IFRlc3RlZC1ieTogU3RlZmFuIEhhZ2VyIDxzdGVmYW4uaGFnZXJAZ2luemluZ2Vy
LmNvbT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFnZXIgPHN0ZWZhbi5oYWdlckBnaW56
aW5nZXIuY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPgo+Pj4+IC0tLQo+Pj4+IENoYW5nZXMgdjQgLT4gdjU6Cj4+Pj4gICAt
IGRvbid0IHJlcXVpcmUgY3BwCj4+Pj4gQ2hhbmdlcyB2MiAtPiB2MzoKPj4+PiAgIC0gbW92ZSB0
byBsaWJyYXJpZXMtPmhhcmR3YXJlIGhhbmRsaW5nCj4+Pj4gLS0tCj4+Cj4+IFsuLi5dCj4+Cj4+
Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvY3B1aW5mby9Db25maWcuaW4gYi9wYWNrYWdlL2NwdWlu
Zm8vQ29uZmlnLmluCj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+PiBpbmRleCAwMDAwMDAw
MDAwLi5kM2MzYjA4NDAwCj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+ICsrKyBiL3BhY2thZ2UvY3B1
aW5mby9Db25maWcuaW4KPj4+PiBAQCAtMCwwICsxLDggQEAKPj4+PiArY29uZmlnIEJSMl9QQUNL
QUdFX0NQVUlORk8KPj4+PiArICAgIGJvb2wgImNwdWluZm8iCj4+Pgo+Pj4gSGF2ZSB5b3UgY2hl
Y2tlZCBjcHVpbmZvIGRlcGVuZGVuY2llcyA/Cj4+Pgo+Pj4gSXQgc2VlbXMgWE5OUGFjayB1c2Vk
IGJ5IGNwdWluZm8gaXMgNjRiaXRzIGFyY2hpdGVjdHVyZXMgb25seToKPj4+Cj4+PiBDTWFrZSBX
YXJuaW5nIGF0IENNYWtlTGlzdHMudHh0OjY5IChNRVNTQUdFKToKPj4+IFRhcmdldCBwcm9jZXNz
b3IgYXJjaGl0ZWN0dXJlICJsIiBpcyBub3Qgc3VwcG9ydGVkIGluIGNwdWluZm8uICBjcHVpbmZv
Cj4+PiB3aWxsIGNvbXBpbGUsIGJ1dCBjcHVpbmZvX2luaXRpYWxpemUoKSB3aWxsIGFsd2F5cyBm
YWlsLgo+Pj4KPj4+IGhpbnQ6Cj4+PiBodHRwczovL2dpdGh1Yi5jb20vTm9idW9Uc3VrYW1vdG8v
bWV0YS10ZW5zb3JmbG93LWxpdGUvYmxvYi9tYWluL3JlY2lwZXMtdG9vbHMvdGVuc29yZmxvdy1s
aXRlL3RlbnNvcmZsb3ctbGl0ZS1iZW5jaG1hcmtfMi4xMS4wLmJiI0wzMwo+Pj4KPj4+IEFuZCB0
cmlnZ2VyIGEgYnVpbGQgaXNzdWUgb24gdUNsaWJjLW5nIGR1ZSB0byBtaXNzaW5nIGhlYWRlcjoK
Pj4+Cj4+PiBjcHVpbmZvLWRlMmZhNzhlYmI0MzFkYjk4NDg5ZTc4NjAzZTRmNzdjMWY2YzVjNTcv
c3JjL2FybS9saW51eC9od2NhcC5jOjE5OjExOgo+Pj4gZmF0YWwgZXJyb3I6IHN5cy9hdXh2Lmg6
IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPj4+ICAgIDE5IHwgICNpbmNsdWRlIDxzeXMvYXV4
di5oPgo+Pj4KPj4+IEFsc28gc3RhdGljIGJ1aWxkIGlzIG5vdCBsaWtlbHkgc3VwcG9ydGVkOgo+
Pj4KPj4+IGNwdWluZm8tZGUyZmE3OGViYjQzMWRiOTg0ODllNzg2MDNlNGY3N2MxZjZjNWM1Ny9z
cmMvYXJtL2xpbnV4L2h3Y2FwLmM6ODoxMDoKPj4+IGZhdGFsIGVycm9yOiBkbGZjbi5oOiBObyBz
dWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4+PiAgICAgOCB8ICNpbmNsdWRlIDxkbGZjbi5oPgo+Pgo+
PiBBY3R1YWxseSB0aGVyZSBpcyBhbiBhcmNoaXRlY3R1cmUgZGVwZW5kZW5jeTogeDg2LCB4ODZf
NjQsIGFybSwgYWFyY2g2NC4KPj4gQWxzbyBpdCByZXF1aXJlcyB0aHJlYWRzIHN1cHBvcnQ6Cj4+
Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9weXRvcmNoL2NwdWluZm8vYmxvYi9tYWluL3NyYy9pbml0
LmMjTDI0Cj4gCj4gV2VsbC4uLnRob3NlIGFyY2hpdGVjdHVyZSBkZXBlbmRlbmNpZXMga2luZGEg
bG9vayBsaWtlIHJ1bnRpbWUgZGVwcwo+IHRvIG1lLi4uYSBjb25zdW1pbmcgYXBwbGljYXRpb24g
Y291bGQgY2FsbCBjcHVpbmZvX2luaXRpYWxpemUoKSB3aXRoCj4gZXJyb3IgaGFuZGxpbmcgYW5k
IGZhbGxiYWNrIHRvIHNvbWUgb3RoZXIgY29kZXBhdGggYXV0b21hdGljYWxseSBvbgo+IGZhaWx1
cmUuCj4gCj4gU28gcHJvYmFibHkgd2UgZG9uJ3Qgd2FudCB0byBhcHBseSBhbiBhcmNoaXRlY3R1
cmUgcmVzdHJpY3Rpb24gdW5sZXNzCj4gdGhlcmUncyBhbiBhY3R1YWwgYnVpbGQgZmFpbHVyZS4K
CldpdGggdGhlIHNvdXJjZXJ5LWFybS1hcm12NHQgY3B1aW5mbyBidWlsZCB3aWxsIGZhaWw6CgpD
TWFrZSBXYXJuaW5nIGF0IENNYWtlTGlzdHMudHh0OjY5IChNRVNTQUdFKToKICBUYXJnZXQgcHJv
Y2Vzc29yIGFyY2hpdGVjdHVyZSAiYXJtdjRsIiBpcyBub3Qgc3VwcG9ydGVkIGluIGNwdWluZm8u
CiAgY3B1aW5mbyB3aWxsIGNvbXBpbGUsIGJ1dCBjcHVpbmZvX2luaXRpYWxpemUoKSB3aWxsIGFs
d2F5cyBmYWlsLgoKbGliY3B1aW5mby5zbzogaGlkZGVuIHN5bWJvbCBgY3B1aW5mb19hcm1fbGlu
dXhfaW5pdCcgaXNuJ3QgZGVmaW5lZAoKVGhlIGFyY2hpdGVjdHVyZSBzdXBwb3J0IG90aGVyIHRo
YW4gYW5ub3VuY2VkIChhcm0sYWFyY2g2NCwgeDg2IGFuZCB4ODZfNjQpCnNlZW1zIHVuY2VydGFp
bi4gSW4gZG91YnQsIGl0IHNlZW1zIHRvIGJlIGxlZ2l0IHRvIGFkZCBhcmNoaXRlY3R1cmUgZGVw
ZW5kZW5jaWVzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+Pgo+PiBCZXN0IHJlZ2FyZHMs
Cj4+IFJvbWFpbgo+Pgo+Pj4KPj4+IEJlc3QgcmVnYXJkcywKPj4+IFJvbWFpbgo+Pj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
