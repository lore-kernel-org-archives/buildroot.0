Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7B7C77B6E
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 19:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45D5E81EC7;
	Sun,  9 Apr 2023 19:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45D5E81EC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id omn-ay1QSKCQ; Sun,  9 Apr 2023 19:44:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82B3381EBC;
	Sun,  9 Apr 2023 19:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82B3381EBC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86D971BF291
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 19:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 644B440151
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 19:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 644B440151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aIJJHwV9s5qB for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 19:43:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A13040481
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A13040481
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 19:43:57 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id jg21so7912012ejc.2
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 12:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681069435;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6TXMkMjGxLfeTJ9mwUX31Fzz81pkiOaobDdTnF5uv0M=;
 b=58DpOdBPzVOuXyIVClnzg81pmnBIC+roggI6QPAviL5NsiVOg06UsSYxRyIji9+lzD
 Gybp/DOrqbCCVl94DmlFmkETGTHXPIvgmnokcE9/+jSe0hwPVdpIOfrDirkbhqaOeHMD
 Rg6YqkeZ+n9LENKiyLMh+l3R2lke2wL5A0K6AgMUV7oyH+Y57gzmsxE4TM2+jVKwpKiz
 4y67TkXQoh9iC3b9ra+JGKEwsWUJz2PMKL/jw1n2AeqOvpzPbHSlAkKSm3Ez+sWaJV5m
 vkVQOVczcMBHfJd2N8ZJSxp+MYXWnhn0HSYHQfLb2iMFPMz4PWztM46krWH70CaVZ6oB
 DuYQ==
X-Gm-Message-State: AAQBX9da8hNsm1jYdWtpvUwp6pYE5KoFjDQDBsYt9ForxNxAaUqZBczJ
 Ay7fmwICMUXQtul9y0KFtlECcg==
X-Google-Smtp-Source: AKy350aEoPY0vw+den3Sot5pjik3fctSakOfSMX0ambJp6nKJpDyBZUXucC1HSVmukqr1YAqC5aWRA==
X-Received: by 2002:a17:906:2a48:b0:92d:145a:6115 with SMTP id
 k8-20020a1709062a4800b0092d145a6115mr5409703eje.38.1681069435524; 
 Sun, 09 Apr 2023 12:43:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a50cc8d000000b004fbdfbb5acesm4195661edi.89.2023.04.09.12.43.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 12:43:54 -0700 (PDT)
Message-ID: <6eb9eac2-0e2c-a919-6ca1-ba1e3a51bdb2@mind.be>
Date: Sun, 9 Apr 2023 21:43:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220724020144.1012252-1-james.hilliard1@gmail.com>
 <ebe61366-15fc-6e69-b187-f884312206e2@mind.be>
In-Reply-To: <ebe61366-15fc-6e69-b187-f884312206e2@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681069435;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6TXMkMjGxLfeTJ9mwUX31Fzz81pkiOaobDdTnF5uv0M=;
 b=I7kbcexbxVh8yzdYW2P2QqAlSFKu3mhVteZpAD1bNhtcFpva/zQbd3GPq8gvA7EqS2
 Gb2gk1i3KjUyStX63WKhRySeiv7MPeHa+IwnYLr4vwluPrIVpwhE1ZMeDhXgkFmLxrYS
 9nf/TindNzCmgIoD1qsbkUAMXKWi/QqaJ21IaD2fEdnOLseYXP9NviTGtNiNDIwKNlkU
 Fw7K9kEO/VSUNfHHi8Np6NeWbNAJaMCM2usXx9kvrg+P2GJSEwBDmk8iTSalW6leBh9r
 9n/uGboU1ZcjC/rNaQ+CrmBXtMAci2V2EX/kQc3F1Z3FQnCzH/GreC9ehiRIJk0Ymkkv
 P56Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I7kbcexb
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cargo: ensure host/target
 rustflags are properly split
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

Ck9uIDI0LzA3LzIwMjIgMjI6NTgsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAyNC8wNy8yMDIyIDA0OjAxLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKW3NuaXBdCj4+IEBAIC01
MSw3ICs1Niw4IEBAIFBLR19DQVJHT19FTlYgPSBcCj4+IMKgICMgYW5kIHNob3VsZCBiZSByZW1v
dmVkIHdoZW4gZml4ZWQgdXBzdHJlYW0KPj4gwqAgIwo+PiDCoCBpZmVxICgkKE5PUk1BTElaRURf
QVJDSCksYXJtKQo+PiAtwqDCoMKgIFBLR19DQVJHT19FTlYgKz0gUlVTVEZMQUdTPSItQ2xpbmst
YXJnPS1XbCwtLWFsbG93LW11bHRpcGxlLWRlZmluaXRpb24iCj4+ICvCoMKgwqAgUEtHX0NBUkdP
X0VOViArPSBcCj4+ICvCoMKgwqDCoMKgwqDCoCBDQVJHT19UQVJHRVRfJChjYWxsIAo+PiBVUFBF
UkNBU0UsJChSVVNUQ19UQVJHRVRfTkFNRSkpX1JVU1RGTEFHUz0iLUNsaW5rLWFyZz0tV2wsLS1h
bGxvdy1tdWx0aXBsZS1kZWZpbml0aW9uIgo+Cj4gwqBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHRo
aXMgaXMgbmVlZGVkLiBXZSBkb24ndCBzZXQgUlVTVEZMQUdTIGFueXdoZXJlIGVsc2UsIAo+IHNv
IGl0IHNob3VsZCBiZSBmaW5lPyBPciBpcyBpdCBiZWNhdXNlIFJVU1RGTEFHUyBpcyBhbHNvIHVz
ZWQgZm9yIG5hdGl2ZSBidWlsZCAKPiBldmVuIGlmIENBUkdPX0hPU1RfUlVTVEZMQUdTIGlzIHNl
dD8KPgo+IMKgKEFueXdheSwgdGhpcyBodW5rIGNhbiBwcm9iYWJseSBiZSByZW1vdmVkLCB0aGUg
YnVnIHRoYXQgdHJpZ2dlcmVkIGl0IGlzIGZpeGVkLikKCiDCoFlvdSBuZXZlciByZXBsaWVkIHRv
IHRoaXMuIElmIGluZGVlZCB0aGlzIHBhcnQgc2V0dGluZyBSVVNURkxBR1MgY2FuIGJlIApyZW1v
dmVkLCB0aGVuIHdlIGRvbid0IHNldCBSVVNURkxBR1MgYW55d2hlcmUsIHNvIHRoaXMgcGF0Y2gg
c2hvdWxkbid0IGJlIApuZWVkZWQsIHJpZ2h0PwoKCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
