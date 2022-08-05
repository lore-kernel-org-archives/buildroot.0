Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D50C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 07:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB06F6F939;
	Fri,  5 Aug 2022 07:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB06F6F939
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id db_MhKPZ4EUQ; Fri,  5 Aug 2022 07:15:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDD9D60E32;
	Fri,  5 Aug 2022 07:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDD9D60E32
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A47861BF869
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 07:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F212833C9
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 07:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F212833C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c0OfvUYRI-qs for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 07:15:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F3C382D07
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F3C382D07
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 07:15:36 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b96so2356342edf.0
 for <buildroot@buildroot.org>; Fri, 05 Aug 2022 00:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=4+raLGfQJacRa39cbLCxMCYdhLXlekgJscvUyjKxr9U=;
 b=gm7lA/R8Ajpp9zM9VI1N2Csuf7Cf9Ic9pAZKc0ca72VEOUalpekVXrKNTD+dLVX/rZ
 SiGpqTrpmEPoLjC10PySP0uqNtlHtu3WKE8B8Wc4aWspreDz0wRfI7U346a5GuExZdgS
 n/uD5pywpT73Edz/CtSQQ9W8ZMMMUJUAAL3FiZhQYCiGuA6zucBSt8ZS7hZ2BLk7A16R
 aacDo0fghP0eZYwNb69Qh/NO2nzuq40bhE7Vz3zhTXiu6dljdvvR50Qmfasp6Gb7FVQJ
 A1BNqw1o9U9/r6AioB06SQx7MOqxHRXOEfkki8klHUIoe+wkFPCyFbFLXmYAmSXmJBuu
 pJVw==
X-Gm-Message-State: ACgBeo0AZzw+2715yRgWXqTfh1nwayic9fL2t9RSDSYx4rJZkvvfBTQz
 QlPpHQ8ZXLiYnwuNUcS+lp2XL6l3HSXf/Juf
X-Google-Smtp-Source: AA6agR4ZxjwexOyFgLIKQmHFoU6mgbls9k+2mjvRjC2HC4UyI7Elr5iWmV8SSA8YeWbDmX1pqCh55w==
X-Received: by 2002:a50:fc85:0:b0:43d:2284:1ea5 with SMTP id
 f5-20020a50fc85000000b0043d22841ea5mr5393458edq.105.1659683734496; 
 Fri, 05 Aug 2022 00:15:34 -0700 (PDT)
Received: from [192.168.178.20] (213.211.136.215.static.edpnet.net.
 [213.211.136.215]) by smtp.gmail.com with ESMTPSA id
 fj19-20020a0564022b9300b0043bbbaa323dsm1633679edb.0.2022.08.05.00.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 00:15:34 -0700 (PDT)
Message-ID: <5d968eb7-33b1-d23d-6924-dfe7e434cbbe@mind.be>
Date: Fri, 5 Aug 2022 09:15:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220615171218.1032413-1-raphael.melotte@mind.be>
 <20220720235057.2aba2ffc@windsurf>
From: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
In-Reply-To: <20220720235057.2aba2ffc@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=4+raLGfQJacRa39cbLCxMCYdhLXlekgJscvUyjKxr9U=;
 b=VIrK9za/dAWNnqPX58/GSwDK8yFkVyRenFYyAx8wnAKRIM9EmDyH5WNIa5E3oyUdAV
 blKKd2cvU7TQcL7km74eXx7gLM4gViDmF/TqIU06DZ7rQfT7UgEychZvl5rqFv+gOaRL
 ikaYunhxBXqxlY+9N8VhTM+aR26tNrSMErK2NOxLwkZRWpNdSFgZAotst7o61wmM0uvV
 1T9EWCkQrECxUtolJQRORFhNfhZNDGmIB25P7c4hR2SGR35wZOc+4eYqxx8i3EllBBl7
 SDgkaFKlmo3CU4hg3vj+CVFZ75u6pOnha+hNs5eLgnqPxCipz8uB/3GKeH8x+Qwn6/oO
 mY2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VIrK9za/
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: use aarch64 for
 TestPythonPy3Botocore
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gNy8yMC8yMiAyMzo1MCwgVGhvbWFzIFBldGF6em9uaSB3cm90ZToK
PiAKPiBUaGFua3MgYSBsb3QgZm9yIHRoZSBwcm9wb3NhbC4KClRoYW5rcyBmb3IgbG9va2luZyBh
dCBpdCEKCj4gSSB1bmRlcnN0YW5kIHRoZSBuZWVkIGZvciBtb3JlIG1lbW9yeSwKPiBidXQgSSdt
IHdvbmRlcmluZyBpZiBidWlsZGluZyBhIGZ1bGwgYWFyY2g2NCBrZXJuZWwganVzdCBmb3IgdGhp
cyBpcwo+IHJlYWxseSB0aGUgcmlnaHQgc29sdXRpb24uCj4gCj4gV2hhdCBhYm91dCBpbnN0ZWFk
IHRyeWluZyB0byBwYXNzIGEgY3VzdG9tIG9wdGlvbiB0byBRZW11Pwo+IAo+IHN1cHBvcnQvdGVz
dGluZy9pbmZyYS9lbXVsYXRvci5weSBnb2VzIGxpa2UgdGhpczoKPiAKPiAgICAgIGRlZiBib290
KHNlbGYsIGFyY2gsIGtlcm5lbD1Ob25lLCBrZXJuZWxfY21kbGluZT1Ob25lLCBvcHRpb25zPU5v
bmUpOgo+ICAgICAgICAgIGlmIGFyY2ggaW4gWyJhcm12NyIsICJhcm12NSJdOgo+ICAgICAgICAg
ICAgICBxZW11X2FyY2ggPSAiYXJtIgo+ICAgICAgICAgIGVsc2U6Cj4gICAgICAgICAgICAgIHFl
bXVfYXJjaCA9IGFyY2gKPiAKPiAgICAgICAgICBxZW11X2NtZCA9IFsicWVtdS1zeXN0ZW0te30i
LmZvcm1hdChxZW11X2FyY2gpLAo+ICAgICAgICAgICAgICAgICAgICAgICItc2VyaWFsIiwgInN0
ZGlvIiwKPiAgICAgICAgICAgICAgICAgICAgICAiLWRpc3BsYXkiLCAibm9uZSIsCj4gICAgICAg
ICAgICAgICAgICAgICAgIi1tIiwgIjI1NiJdCj4gCj4gICAgICAgICAgaWYgb3B0aW9uczoKPiAg
ICAgICAgICAgICAgcWVtdV9jbWQgKz0gb3B0aW9ucwo+IAo+IFNvIGlmIHdlIHBhc3NlIG9wdGlv
bnM9WyItbSIsICI1MTIiXSwgdGhpcyBzaG91bGQgb3ZlcnJpZGUgdGhlIGRlZmF1bHQKPiAtbSAy
NTYuCgpUaGF0J3Mgd2hhdCBJIHRyaWVkIGF0IGZpcnN0LCBidXQgdGhlIHByb2JsZW0gaXMgdGhh
dCBxZW11IHJlZnVzZXMgdG8gdXNlIG1vcmUgdGhhbiAyNTZNaUIgZm9yIHRoZSB2ZXJzYXRpbGVw
YiBtYWNoaW5lIChJIHNob3VsZCBoYXZlIG1hZGUgdGhhdCBjbGVhcmVyIGluIHRoZSBjb21taXQg
bWVzc2FnZSwgc29ycnkpLgoKVGhpcyBpcyB0aGUgcGxhY2UgaW4gcWVtdSB0aGF0IGNoZWNrcyB0
aGF0IG5vIG1vcmUgdGhhbiAyNTZNaUIgaXMgdXNlZDoKPT09CiAgICAgaWYgKG1hY2hpbmUtPnJh
bV9zaXplID4gMHgxMDAwMDAwMCkgewogICAgICAgICAvKiBEZXZpY2Ugc3RhcnRpbmcgYXQgYWRk
cmVzcyAweDEwMDAwMDAwLAogICAgICAgICAgKiBhbmQgbWVtb3J5IGNhbm5vdCBvdmVybGFwIHdp
dGggZGV2aWNlcy4KICAgICAgICAgICogUmVmdXNlIHRvIHJ1biByYXRoZXIgdGhhbiBiZWhhdmlu
ZyB2ZXJ5IGNvbmZ1c2luZ2x5LgogICAgICAgICAgKi8KICAgICAgICAgZXJyb3JfcmVwb3J0KCJ2
ZXJzYXRpbGVwYjogbWVtb3J5IHNpemUgbXVzdCBub3QgZXhjZWVkIDI1Nk1CIik7CiAgICAgICAg
IGV4aXQoMSk7CiAgICAgfQo9PT09CgpTbyBJIGhhZCBubyBhbm90aGVyIGNob2ljZSB0aGFuIHRv
IHVzZSBhIGRpZmZlcmVudCBvbmUuCkkgY291bGQgdXNlIGEgZGlmZmVyZW50IGJvYXJkIHRoYW4g
ImFhcmNoNjQtdmlydCIgaWYgbmVlZGVkLCBJIG9ubHkgY2hvc2UgaXQgYmVjYXVzZSBpdCB3YXMg
YWxyZWFkeSB1c2VkIGVsc2V3aGVyZS4KCldoYXQgZG8geW91IHRoaW5rPwoKS2luZCByZWdhcmRz
LAoKUmFwaGHDq2wKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
