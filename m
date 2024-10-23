Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FC7CDDE7D
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 15:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 241CD400E1;
	Wed, 23 Oct 2024 15:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOgB1aNi9z6a; Wed, 23 Oct 2024 15:21:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0180740101
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0180740101;
	Wed, 23 Oct 2024 15:21:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F12B72072
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 15:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC9B760612
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 15:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hW6Mg9QzeySp for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 15:21:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22b; helo=mail-oi1-x22b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 17DAC60623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17DAC60623
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17DAC60623
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 15:21:32 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3e6005781c0so3166981b6e.3
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 08:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729696892; x=1730301692;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mOGj/q7nuVSYo12rLkXpyxDTq9m/63ZF1ObfQD78YJ4=;
 b=jCzv1ewAxDmuGu5tjadDWhTZVuZKvlvHjw/BbFLpi5n1iwHr2oWtndFglCPcss80rl
 /cxL/5RLU6h31a9ioyCIMU6MCaYJarAjOboIsBJVPCc9N+zE9aZ5wgecSJsb48aViym2
 TFlcI85oM7GBuT9CoBjL34zRqL8h/2+E4A9Mb9hAwCrJKkMqV4R5PTZfkObwi6pVOmCm
 RCsbzuaXgeCP3a8EVWomQslVJv9piKEeLX9BXhv6iAciOlGco6wO5g1IdtkUld3YLaNZ
 8cjqF9I103MBBiLoOCsW7olBPoHUPYLZKfuhbxC3RAmdjTNDt0/UEMwK3XIdgtTApwek
 E8+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8yI59tj5DbvofIu52xPS81BTf8y5UqyfS7QUGZMQuP71r3tI53qwZhoj4PQXy7XDU6W/y2Iir3oE=@buildroot.org
X-Gm-Message-State: AOJu0Yx3UVcZfiEofXk9ekElNkwMV7MwTgiUUNb+86ck/1O7B6Gtggom
 K2NEJ6rUr8Q7PLADjuBf8qgPJTG1aG3ityB07vcPsTy7dmHskzV1cjI4KKAD12O2mNfpFZNZu+m
 lrs1wC4qjZ1lGHOpcAPYIpS3lQsY=
X-Google-Smtp-Source: AGHT+IFVrIEUYVB76V4wc1DJsNysSYWuM3tEmwdI7BMVHAeezsV+hssVSzGZ0fxOq//ii3xuukKVirUpE8gRoI9FeDw=
X-Received: by 2002:a05:6808:2dc9:b0:3e6:44c:70ee with SMTP id
 5614622812f47-3e6244eeb27mr3148084b6e.7.1729696891993; Wed, 23 Oct 2024
 08:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
 <20240806165050.234235b4@windsurf>
 <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
 <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
 <20240806185731.372f8f3e@windsurf>
 <CA+h8R2rnNhM0nKyZm4_y6ZFrNyn7YzFa7BHeH57cLif38FSrxA@mail.gmail.com>
In-Reply-To: <CA+h8R2rnNhM0nKyZm4_y6ZFrNyn7YzFa7BHeH57cLif38FSrxA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 23 Oct 2024 09:21:20 -0600
Message-ID: <CADvTj4p2heLayPzF7uTK0TLzbbo4C_305vTg9=3W3aCQbAoQGw@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Christian Stewart via buildroot <buildroot@buildroot.org>,
 Anisse Astier <anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729696892; x=1730301692; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mOGj/q7nuVSYo12rLkXpyxDTq9m/63ZF1ObfQD78YJ4=;
 b=Z2JfZGsCPZYMRpAPQubBzZLTM0HI8I4yptgLj9qsTiqFvd4BXbaRPxRERubsVQN4ap
 Wkjq8qy+OTx43/v4FJSWkw6R0ZRtaXeIPd7Ln1ZJCmvS5RIHg85WNWdknsEIa+magkYc
 lDM6EKMN5MZo45Bk/dxAtu5k/5AVxNcnzKMSgzNuhuygWo6ii2AldWT9pMz8sJJjDMXN
 NbJ87i9TW7LLWEv2/q5Dl7huUhR/4mpB0CFaN0h66aAusxw4xclTIoLbAmVEGNYYmVO+
 54NzRGTjPDcg0Nwu2Vl7cU95hSP9aASDdeqM9mK/xHid2s+AkXaBlKBRmIt+NV/Nup9A
 GLgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z2JfZGsC
Subject: Re: [Buildroot] [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBBdWcgNiwgMjAyNCBhdCAxMjo1M+KAr1BNIENocmlzdGlhbiBTdGV3YXJ0IDxjaHJp
c3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+Cj4gVGhvbWFzLAo+Cj4gT24gVHVlLCBBdWcgNiwg
MjAyNCwgOTo1N+KAr0FNIFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxp
bi5jb20+IHdyb3RlOgo+Pgo+PiA+IEZvciBub3cgd2UgY2FuIGp1c3QgaW5jbHVkZSB0aGUgbGF0
ZXN0IGNvbW1pdCBoYXNoIG9mIHRhaWxzY2FsZSB1bnRpbCB0aGV5Cj4+ID4gbWFrZSBhIG5ldyBy
ZWxlYXNlIGFuZCBub3RoaW5nIGVsc2UgbmVlZHMgdG8gYmUgY2hhbmdlZC4KPj4KPj4gRG9uJ3Qg
dW5kZXJzdGFuZCB0aGlzIGxhc3QgcGFydC4gV2hhdCBpcyB5b3VyIHByb3Bvc2FsIHRvIGZpeCB0
aGUKPj4gdGFpbHNjYWxlIHNpdHVhdGlvbj8KPgo+Cj4gVGhleSBmaXhlZCB0aGUgaXNzdWUgdXBz
dHJlYW0gYW5kIG5vdyB0aGUgbWFpbiBicmFuY2ggb2YgdGFpbHNjYWxlIHdvcmtzIGZpbmUgd2l0
aCBHT1BST1hZPWRpcmVjdC4gU2VlOgoKSSB0aGluayB0cnlpbmcgdG8gZ2V0IHBhY2thZ2VzIHRv
IG1ha2UgR09QUk9YWT1kaXJlY3Qgd29yayBpcyBnZXR0aW5nCnJhdGhlciBhbm5veWluZywgd2hp
bGUgdHJ5aW5nIHRvIGFkZCBhbm90aGVyIHBhY2thZ2UobmV0YmlyZCkgSSBvbmNlIGFnYWluCnJh
biBpbnRvIHRoaXMgZXhhY3Qgc2FtZSBpc3N1ZS4KCj4KPiBodHRwczovL2dpdGh1Yi5jb20vdGFp
bHNjYWxlL3RhaWxzY2FsZS9pc3N1ZXMvMTI4NTkjaXNzdWVjb21tZW50LTIyMzkxNTc1NjMKPgo+
IEl0IGlzIGZpbmUgdG8gdXNlIHRoZSBtYWluIGJyYW5jaCBvZiB0YWlsc2NhbGUgaGVyZSBldmVu
IGlmIGl0J3MgYW4gZXh0ZXJuYWwgc2VydmljZSBhcyB0YWlsc2NhbGUga2VlcHMgY29tcGF0aWJp
bGl0eSBiZXR3ZWVuIHJlbGVhc2VzIC0gSSBldmVuIGhhdmUgbWFueSBtYWNoaW5lcyBydW5uaW5n
IHF1aXRlIG91dCBvZiBkYXRlIHRhaWxzY2FsZSBjbGllbnRzIHdoaWNoIHN0aWxsIGNvbm5lY3Qg
YW5kIHJ1biBwZXJmZWN0bHkuIFRoZSBzYW1lIGNhbiBiZSBzYWlkIGZvciBmb3J3YXJkcyBjb21w
YXRpYmlsaXR5Lgo+Cj4gQWxsIHRoYXQgSSBhc2sgd2l0aCByZWdhcmRzIHRvIEdPUFJPWFkgaXMg
dGhhdDoKPgo+IC0gd2UgZG8gbm90IG92ZXJyaWRlIGl0IHBlciBwYWNrYWdlLAoKSSdtIGEgYml0
IGNvbmZ1c2VkIHdoeSB3ZSB3b3VsZCBub3Qgd2FudCB0byBvdmVycmlkZSBpdCBwZXIgcGFja2Fn
ZSBpZgp0aGUgYnJlYWthZ2UgaXMgcGVyIHBhY2thZ2UuCgo+IC0gaWYgd2UgZG8gZGVjaWRlIHRv
IGNoYW5nZSB0aGUgZGVmYXVsdCB0byB1c2UgR29vZ2xlLCBwbGVhc2UgbWFrZSBpdCBhIGNvbmZp
Z3VyYWJsZSBvcHRpb24gKGxpa2UgQlIyX01JUlJPUikgc28gdGhhdCBJIChhbmQgb3RoZXIgdXNl
cnMpIGNhbiBvdmVycmlkZSBpdCBiYWNrIHRvIGJlIGRpcmVjdC4KCklmIGEgcGFja2FnZSBpcyBr
bm93biB0byBub3QgYnVpbGQgd2l0aCBHT1BST1hZPWRpcmVjdCB0aGVuIHdoeSB3b3VsZApvbmUg
d2FudCB0byBvdmVycmlkZSB0aGUgZGVmYXVsdCBHT1BST1hZIHJhdGhlciB0aGFuIGEgcGFja2Fn
ZSBzcGVjaWZpYwpHT1BST1hZPwoKPgo+IEJlc3QgcmVnYXJkcywKPiBDaHJpc3RpYW4gU3Rld2Fy
dApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
