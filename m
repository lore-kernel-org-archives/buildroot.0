Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9C0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 18:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6B0740923;
	Mon, 24 Jan 2022 18:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BH3JCrP4RxXm; Mon, 24 Jan 2022 18:12:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A88354061C;
	Mon, 24 Jan 2022 18:12:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FBF91BF27A
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 18:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4469760FA5
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 18:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UYt1R0Jg8mAT for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 18:12:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4403F60F58
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 18:12:15 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 r2-20020a1c2b02000000b0034f7b261169so451730wmr.2
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 10:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8Yalv/+uGV4jqTlnHl4fQjVQTKXTc0pNFmWzGc75WAM=;
 b=LbYoLR0ZbIjwXIGh/AI+4Dq0jKdp6qm4c0jCpPO9RM4NksADnNk6W5mfjQV9Ntm/W6
 GbLBQrKdRTsEJb88QlM0YhJ0yLRxVXCQkF1A7uMYZRCOxnqTr4wCvGGq0AK8YuazP/UL
 d6TIMFS+/JiWnWEVbU/DvGcToxP2ahQ1drt1MRXqfkmsnuSB1NlH0crJBASra4uLRIDD
 S7/salhITDaGx2Xped5VNguFqlU5kbncmgKkSVqSUYu2rWuq13XZK6RCq35uaS/7d0qD
 vmmNQdpBX8QxQQTIhExz7SMZSYa2kpX/Vx6wIhcsAyeJZedEnYASPwygZdipHVFN/Zzc
 aAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8Yalv/+uGV4jqTlnHl4fQjVQTKXTc0pNFmWzGc75WAM=;
 b=r7o/cPAhgao05pFfX3Ht6XVdXH7T3H2idYA7M1AzkNIF4WchzyFASY3mTmC8lqcwRn
 xTm5u+T54mdDzgk9GVW27iQYgliI///ECgMkmNf5Nn+6AXldW1nAjFcz/Z42G7ZvQ5hO
 /SpJUz43nsWMwgSseAr093k5wDygTIdMEUe20MXb0zSuQQbVmLY1C8tQI8V5m9ZoRPd0
 gBEkZnMIHS8F4D1q2Yqq+m5kJAQAls1YuLswzW7Jo70w3qeAjTpeYp7/sAYacKyCurrT
 Oga+D4kZHYWT2TLq2eVQv86qo1E7hlZJH5whDrQRD4Bzx3rn3Snljrq56IwUt88zX9Bf
 aEXA==
X-Gm-Message-State: AOAM532PZbJbQEsGenv1tMtP1oRrI9kSrhu8LSUm+UKFIQYYb4WGw9md
 H//l3KI6fuQnfTRRWYFYlSU/d1RQMVSQ6XPl
X-Google-Smtp-Source: ABdhPJzVy7w8p12rUcoz3U6MMJgleKJFhTr2iL+cdTzdMaQeXPzPZR7KvkmvFiBy6kA5IF3bDQ0qBg==
X-Received: by 2002:a7b:c181:: with SMTP id y1mr2818231wmi.137.1643047933422; 
 Mon, 24 Jan 2022 10:12:13 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id m187sm32594wme.25.2022.01.24.10.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 10:12:13 -0800 (PST)
Message-ID: <10b5c0bb-03ca-605f-b1c7-2aac2a5aabff@smile.fr>
Date: Mon, 24 Jan 2022 19:12:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Baruch Siach <baruch@tkos.co.il>, Jonathan Borne <jborne@kalray.eu>
References: <20220124173521.2236-1-jborne@kalray.eu> <87k0ep9gbx.fsf@tarshish>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <87k0ep9gbx.fsf@tarshish>
Subject: Re: [Buildroot] [RFC PATCH 0/1] Fix binutils/libiberty target
 install directory
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
Cc: ysionneaux@kalray.eu, jmaselbas@kalray.eu, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAyNC8wMS8yMDIyIMOgIDE4OjQ0LCBCYXJ1Y2ggU2lhY2ggdmlhIGJ1aWxkcm9v
dCBhIMOpY3JpdMKgOgo+IEhpIEpvbmF0aGFuLAo+IAo+IE9uIE1vbiwgSmFuIDI0IDIwMjIsIEpv
bmF0aGFuIEJvcm5lIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+IEhpLAo+PiBJIHN0dW1ibGVkIHVw
b24gYSBzdXNwaWNpb3VzIGxpbmUgaW4gYmludXRpbHMubWsuCj4+Cj4+IEluIEJJTlVUSUxTX0lO
U1RBTExfVEFSR0VUX0NNRFMsCj4+IGxpYm9wY29kZSBhbmQgbGliYmZkIERFU1RESVIgYXJlIGJv
dGggc2V0IHRvICQoVEFSR0VUX0RJUikKPj4gYW5kIGxpYmliZXJ0eSBpcyB0aGUgb25seSBvbmUg
c2V0IHRvICQoU1RBR0lOR19ESVIpLgo+Pgo+PiBJcyB0aGVyZSBhIHJlYXNvbiBiZWhpbmQgdGhp
cz8KPiAKPiBBcyBJIHVuZGVyc3RhbmQgdGhhdCdzIGJlY2F1c2UgbGliaWJlcnR5IGlzIHN0YXRp
YyBvbmx5LiBCdWlsZHJvb3QgZG9lcwo+IG5vdCBjb3B5IHN0YXRpYyBsaWJyYXJpZXMgdG8gJChU
QVJHRVRfRElSKSBiZWNhdXNlIHRoZXkgYXJlIG9ubHkgdXNlZCBhdAo+IGJ1aWxkIHRpbWUsIGJ1
dCBub3QgYXQgcnVuLXRpbWUuCgpNYXliZSB3ZSBjYW4ganVzdCByZW1vdmUgbGliaWJlcnR5IChz
dGF0aWMpIGZyb20gQklOVVRJTFNfSU5TVEFMTF9UQVJHRVRfQ01EUwpiZWNhdXNlIGl0J3MgYWxy
ZWFkeSBpbnN0YWxsZWQgaW4gc3RhZ2luZyBieSBCSU5VVElMU19JTlNUQUxMX1NUQUdJTkdfQ01E
UwoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IGJhcnVjaAo+IAo+PiBTb3JyeSBpZiB0aGlz
IGlzIGFuIG9idmlvdXMgcXVlc3Rpb24sIEkgYW0gcXVpdGUgbmV3IHRvIGJ1aWxkcm9vdC4KPj4g
SSBhc3N1bWUgSSBhbSBwcm9iYWJseSBtaXNzaW5nIHNvbWV0aGluZy4KPj4gSSB0aG91Z2ggaXQg
d2FzIHN0aWxsIGJldHRlciB0byBhc2suLi4KPj4KPj4gVGhhbmtzCj4+IEJlc3QgcmVnYXJkcy4K
Pj4gSm9uYXRoYW4uCj4+Cj4+Cj4+IEpvbmF0aGFuIEJvcm5lKDEpOgo+PiAgIEZpeCBiaW51dGls
cy9saWJpYmVydHkgdGFyZ2V0IGluc3RhbGwgZGlyZWN0b3J5Lgo+Pgo+PiAgcGFja2FnZS9iaW51
dGlscy9iaW51dGlscy5tayB8IDIgKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
