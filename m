Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C91C19F2A
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 15:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0029D40C63;
	Thu,  4 Aug 2022 15:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0029D40C63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHfPcd6QL_Cr; Thu,  4 Aug 2022 15:06:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B9AF40C4A;
	Thu,  4 Aug 2022 15:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B9AF40C4A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D7C81BF317
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 15:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4671182C98
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 15:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4671182C98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZPcu1-41JhA for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 15:06:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0793082CB7
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0793082CB7
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 15:06:37 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id s11so14316802edd.13
 for <buildroot@buildroot.org>; Thu, 04 Aug 2022 08:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iDucwbyoJ+3U4XKb2wfL1zvzQn8Vm66ag7kayvlBD38=;
 b=AGfGmfZ5W5kmUrtbV+J443muMYwIVxy1uPs/WvGamfBqVBmqcI2sQeLAFF8FD8++JH
 Rd2N2vTie+E+gzbFc6ndqCNBpxjbwI2gFuFXO5Mv65IpiAdaqgPq1hjZdZ2Io7LxXlo2
 zFchryWiJ+aI/H9oQuy5VB6rg1I575aJXr0Md4y2WJa8Ta4ISuX0n9xF0sUNykP16AOb
 f3j6+m4+b5jeCoVF3IRFz3w0Mz92+I3ixajbyyW+vBtWkYH3rwZAYFLAK1hKHgqGp1wf
 rMI1l+Zua7DmGrecMTNHO9z3Wfav3exTLz4NhGUAM53kC4GwNpSu/qFVsrVK6ejrrcFW
 +toA==
X-Gm-Message-State: ACgBeo267YeeXwfGW7LLgrIZWt2hrjP1ox8/JT9H0Bn8Z9P5wGOO6Bxj
 fH/p3S/MbDEszsr1lP+7nA32Pw==
X-Google-Smtp-Source: AA6agR4wJ6ZA96JkbkRm0l2+l2qVEvr/S9SiYpYttFOjr4EuyXfVPRGsQvgnJzxiyoYzXcqwZHuqyQ==
X-Received: by 2002:a05:6402:3492:b0:43e:9666:ece2 with SMTP id
 v18-20020a056402349200b0043e9666ece2mr1883723edc.65.1659625596291; 
 Thu, 04 Aug 2022 08:06:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a056402424a00b0043a61f6c389sm822789edb.4.2022.08.04.08.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 08:06:35 -0700 (PDT)
Message-ID: <ee0d1410-d1eb-c81d-726a-ad9a735b7db8@mind.be>
Date: Thu, 4 Aug 2022 17:06:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Jameson Collins <jameson.collins@gmail.com>, buildroot@buildroot.org
References: <CACoTCHeTKbTU4QSBs4qtyUXKDNOH+5u4Y-rGhy4QeuvK=kAENw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CACoTCHeTKbTU4QSBs4qtyUXKDNOH+5u4Y-rGhy4QeuvK=kAENw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=iDucwbyoJ+3U4XKb2wfL1zvzQn8Vm66ag7kayvlBD38=;
 b=Jy4V6mLtZoGjeTciHuak8J2X4G5RxPTEzs3oCm2omLZpAxDiGkS0fGP/A3qhHEC/jl
 lOHeJRvlvooibuqruIpaJekTHGd2eNzAk+TayCHVvlpAVR8wc8Cc3j0TCPybWOMzrwCF
 gT0OH6sfWFa5jCtzk9GcYmxGsmlhWMqOn7A54GRU8HSsyzWA2pV9GsA9W2G8VSeWKCEY
 XXzgD3NLgbzaPo0deMHjRWn9oVlZfSmayMbCCEB6XQ/hS1oTKC02vvdavl8lQdvjI1wd
 pSA/kKPV4IVIxaSqvAcdXfx8nYNGGeQLUokybUL2W8Cx4DKP9QhKkjjYH2gHpw5AtYyO
 HGwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Jy4V6mLt
Subject: Re: [Buildroot] Defining a package with no dependencies
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

CgpPbiAwNC8wOC8yMDIyIDAxOjMwLCBKYW1lc29uIENvbGxpbnMgd3JvdGU6Cj4gSWYgSSBoYXZl
IGEgcGFja2FnZSB0aGF0IGRvZXNuJ3QgYnVpbGQgYW55dGhpbmcsIGRvZXNuJ3QgZGVwZW5kIG9u
IGFueXRoaW5nLCBhbmQgCj4gZG9lc24ndCBoYXZlIGFueXRoaW5nIGRlcGVuZGluZ8Kgb24gaXQs
IGlzIGl0IHBvc3NpYmxlIHRvIHRlbGwgYnVpbGRyb290IHRvIGJ1aWxkIAo+IHRoaXMgcGFja2Fn
ZSB3aXRob3V0IGZpcnN0IGJ1aWxkaW5nIHRoZSB0b29sY2hhaW4/CgogIElmIGl0J3Mgbm90IGJ1
aWxkaW5nIGFueXRoaW5nIGZvciB0aGUgdGFyZ2V0LCB5b3UgY291bGQgY2xhaW0gdGhhdCBpdCdz
IGEgaG9zdCAKcGFja2FnZS4gU28gdXNlIGhvc3QtZ2VuZXJpYy1wYWNrYWdlLgoKICBSZWdhcmRz
LAogIEFybm91dAoKPiAKPiBBbiBleGFtcGxlIG9mIGEgcGFja2FnZSBsaWtlIHRoaXMgbWlnaHQg
YmUgdGhlIGBmbGFzaC1teS1ib2FyZGAgcmVjaXBlIHRoYXQgaXMgCj4gc2hvd24gaW4gdGhlIG1h
bnVhbC7CoCBZZXMsIGluIHRoaXMgY2FzZSB0aGUgcGFja2FnZSBkb2Vzbid0IG1ha2UgYW55IHNl
bnNlIAo+IHVubGVzcyBib290LmJpbiBleGlzdGVkLCBidXQgeW91IGNhbiBzZWUgaG93IGl0IG1p
Z2h0IGJlIHVzZWZ1bCB0byBoYXZlIGEgCj4gcGFja2FnZSB0aGF0IHBlcmZvcm1zIGEgdGFzayBh
bmQgbm90IG5lY2Vzc2FyaWx5IGdlbmVyYXRlIGEgYnVpbGQgcHJvZHVjdC4KPiAKPiBUaGFua3Ms
Cj4gSmF5Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
