Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC897C4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 13:26:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31BCF6113E
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 13:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31BCF6113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F22B260686;
	Sat, 21 Aug 2021 13:26:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1N6sJmv3vJDx; Sat, 21 Aug 2021 13:26:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74864606A0;
	Sat, 21 Aug 2021 13:26:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99EDC1BF35E
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 13:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 895D980DAB
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 13:26:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bppmjww8iPJL for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 13:26:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A54980DA7
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 13:26:05 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id n5so6015477wro.12
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 06:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UFaVhAA5nStFRVYai5rI9GgJl/Cj4Z2lJh80X1j7xo4=;
 b=D/KX1N9ZrkNJfWHL/A318ysuYaJuQMQgJgpqS0SE1+lnDly/t7F4MVJiURFn16qry/
 64qrkuRmeiCJh/LAMUr0+o8KYQHrD2qy+iXF3BmuOYlNcfZmh42Q2uxyvl5n1nzsIPFy
 bFBlzF3o1JolXGjzq8nmVHrBX+ArERIxbwjY7mzZoWIEbiLaTsXOduPryejSVa7UXSn8
 8eSlFhQwJNGRJD0YqdGceHDq50ccUOQ0lXpNw6JPf/BZtvqlv8ubKC9HiUtHiiKzAUTg
 if5KaErli3ICyQyw03jAmvyYHG7qhFlD9ITzuyuqPAnon8Qg5QUVMO0o+j/CrnqIGUeY
 KfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UFaVhAA5nStFRVYai5rI9GgJl/Cj4Z2lJh80X1j7xo4=;
 b=hZgJGL7gTDS+MVCcFYP0qwlPGSz3/oaBmKsX+/CUB+IYQXca8KyGQxJFX14ezbPI9D
 mQeu/B/GG3aJPoY/er8vA7YF9xI4fNqYcLW9pUotPvQ4qes2goOSBPwjK/atscQYhmrb
 VRmQa2+ya7aNFcdjhLbs4PP43lGD1Di5uraTr2m4nqgfzQhLboAvmqqvaVjiY/UWeBA0
 oQdQbxVm8eNjXLukkaNjFiNN2pvN81KlQQN0vTwq0V7JMQDQLNcSFBUoYcKMwZufQHqp
 thwyccOKKv6oknFu0L+VEAVnFhN8v3AKd/4O+dZQ+jXYoYK0pEdJuP0nlO5S8HZg+sjB
 bUjg==
X-Gm-Message-State: AOAM533/4dUfNC7nFqGkvIhf7YQ1YlTNND36XI3NEkc08Ccoa6BDHOnv
 SoSeECo25Dkqelf3bC4QH9o=
X-Google-Smtp-Source: ABdhPJxmcPTBTEcXsv/iDSd8MI2YU8WA4OirrV6ftyAdpY8YlzS1WiC9yUWNjO9JGLzVWQgZ3FxeQQ==
X-Received: by 2002:a5d:534e:: with SMTP id t14mr3973126wrv.109.1629552364295; 
 Sat, 21 Aug 2021 06:26:04 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id l2sm8829680wrx.2.2021.08.21.06.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Aug 2021 06:26:03 -0700 (PDT)
To: Petr Vorel <petr.vorel@gmail.com>
References: <20210804172259.9143-1-petr.vorel@gmail.com>
 <20210804213019.6cf2a25d@windsurf>
 <e85b8610-6f8c-c581-138a-a73d6131f521@gmail.com> <YR2Bc4t7UMIDUhgb@pevik>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <aaae8b0a-4e4f-28bb-f8c6-d74552b4f51c@gmail.com>
Date: Sat, 21 Aug 2021 15:26:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR2Bc4t7UMIDUhgb@pevik>
Content-Language: en-US
Subject: Re: [Buildroot] [RFC][PATCH 1/1] package/glibc: bump version to
 2.34-5-g9995d0588f4f9adc68419224d2b3698e2ca4f77e
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gUGV0ciwKCkxlIDE4LzA4LzIwMjEgw6AgMjM6NTMsIFBldHIgVm9yZWwgYSDDqWNyaXTC
oDoKPiBIaSBSb21haW4sCj4gCj4+IEhlbGxvLAo+IAo+PiBMZSAwNC8wOC8yMDIxIMOgIDIxOjMw
LCBUaG9tYXMgUGV0YXp6b25pIGEgw6ljcml0wqA6Cj4+PiBIZWxsbyBQZXRyLAo+IAo+Pj4gT24g
V2VkLCAgNCBBdWcgMjAyMSAxOToyMjo1OSArMDIwMAo+Pj4gUGV0ciBWb3JlbCA8cGV0ci52b3Jl
bEBnbWFpbC5jb20+IHdyb3RlOgo+IAo+Pj4+IEFsc28gdXBncmFkZSB0byBvbiBSSVNDLVYgKHRo
YXQgY291bGQgaGF2ZSBiZWVuIGRvbmUgaW4gZDVjZTNiNWRiNSkKPiAKPj4+PiBTaWduZWQtb2Zm
LWJ5OiBQZXRyIFZvcmVsIDxwZXRyLnZvcmVsQGdtYWlsLmNvbT4KPj4+PiAtLS0KPj4+PiBIaSwK
PiAKPj4+PiBJIHRlc3RlZCBpdCB3aXRoIGJ1aWxkaW5nIHBjX3g4Nl82NF9lZmlfZGVmY29uZmln
LCBhZGRpbmcgbmZzLXV0aWxzLAo+Pj4+IGx0cC10ZXN0c3VpdGUgYW5kIGZldyBvdGhlciB0b29s
cy4gTm90IHN1cmUgaWYgdGhpcyBpcyBlbm91Z2ggZm9yCj4+Pj4gdGVzdGluZy4KPiAKPj4+IEkg
dGhpbmsgdGhhdCB3aGF0IFJvbWFpbiBOYW91ciB0eXBpY2FsbHkgZG9lcyBpcyBydW4gYWxsIHFl
bXVfKgo+Pj4gZGVmY29uZmlncyAob2YgY291cnNlIHR3ZWFrZWQgdG8gdXNlIGdsaWJjIGluc3Rl
YWQgb2YgdWNsaWJjKSwgYW5kIHB1c2gKPj4+IHRoZW0gdG8gR2l0bGFiLCBzbyB0aGF0IHRoZXkg
Z2V0IGJ1aWxkIHRlc3RlZCAqYW5kKiBib290IHRlc3RlZCB1bmRlcgo+Pj4gUWVtdS4KPiAKPj4g
SW5kZWVkLCB0aGUgcnVudGltZSB0ZXN0IGlzIG9ubHkgYSBib290IHRlc3QuIEkndmUgbG9va2Vk
IGF0IHRoZSBnbGliYyB0ZXN0c3VpdGUKPj4gYnV0IGl0J3MgZGlmZmljdWx0IHRvIHNldHVwIHdp
dGggYSBjcm9zcy1jb21waWxlZCBzeXN0ZW0gcnVubmluZyB1bmRlciBRZW11IGluIGEKPj4gQ0kg
KGdsaXRsYWIpLgo+IEkgaG9wZWQgdGhlcmUgd291bGQgYmUgc29tZSBzZXR1cCByZWFkeSwgYnV0
IHVuZGVyc3RhbmQgdGhlcmUgaXMgbm90aGluZy4KPiAKPj4gRm9yIHRlc3RpbmcsIHVwc3RyZWFt
IHN1Z2dlc3QgdG8gdXNlIGEgTkZTIHRvIHNoYXJlIHRoZSBnbGliYyBzb3VyY2VzIGJldHdlZW4K
Pj4gdGhlIGhvc3QgYW5kIHRoZSB0YXJnZXQgKG5vdCB2ZXJ5IGhhbmR5KToKPj4gaHR0cHM6Ly9z
b3VyY2V3YXJlLm9yZy9nbGliYy93aWtpL1Rlc3RpbmcvVGVzdHN1aXRlCj4gSW5kZWVkIG5vdCB2
ZXJ5IGhhbmR5Lgo+IAo+PiBTb21lIHRlc3RzIHJlcXVpcmVzIGEgbWluaW1hbCBhbW91bnQgb2Yg
UkFNIHRoYXQgaXMgbm90IGFsd2F5cyBwcm92aWRlZCBieSBRZW11Cj4+IHRhcmdldC4KPiAKPj4g
VGhlcmUgaXMgYWxzbyBsaWJjLXRlc3QgcHJvamVjdCBmcm9tIG11c2wgcHJvamVjdDoKPj4gaHR0
cHM6Ly93aWtpLm11c2wtbGliYy5vcmcvbGliYy10ZXN0Lmh0bWwKPiBJbnRlcmVzdGluZywgYWx0
aG91Z2ggbm90IHN1cmUgaG93IHJlbGV2YW50IGlzIGZvciBnbGliYyAod291bGQgcmVxdWlyZSB0
bwo+IGNvbXBhcmUgd2l0aCBvbGQgcmVsZWFzZSkuCj4gCj4+IEluZGVlZCBydW5uaW5nIHNvbWUg
dGVzdHMgZnJvbSBsdHAtdGVzdHN1aXRlIHdvdWxkIGJlIGJldHRlciB0aGFuIG5vdGhpbmcuCj4+
IE9uIHRoZSBvdGhlciBoYW5kIHdlIGNhbiBkZXRlY3QgZW5vdWdoIGJvb3QgaXNzdWUgcmVsYXRl
ZCB0byB0b29sY2hhaW4gdXBncmFkZQo+PiB0byBrZWVwIHVzIGJ1c3kuCj4gCj4gVGhhbmtzIGZv
ciBhbGwgc3VnZ2VzdGlvbnMuIEknbSBub3Qgc3VyZSB3aGVuIEkgZ2V0IHRvIGl0LCBidXQgdGhl
IG1heCB3aGljaAo+IHRpbWUgYWxsb3dzIHdpbGwgcHJvYmFibHkgYmUganVzdCB0byBib290IHdp
dGggcWVtdSBhbmQgcnVuIExUUCBzeXNjYWxscy4KClBsZWFzZSB1cGdyYWRlIGxvY2FsZWRlZiBw
YWNrYWdlIHdpdGggdGhlIGdsaWJjIHZlcnNpb24gYnVtcC4KCkknbGwgbWFyayB5b3VyIHBhdGNo
ICJDaGFuZ2VzIHJlcXVlc3RlZCIuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gS2luZCBy
ZWdhcmRzLAo+IFBldHIKPiAKPj4gQmVzdCByZWdhcmRzLAo+PiBSb21haW4KPiAKPiAKPj4+IFRo
b21hcwo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xp
c3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
