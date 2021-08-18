Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07489C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 19:46:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B914A610E7
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 19:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B914A610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78BDA407A4;
	Wed, 18 Aug 2021 19:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tBMN42vD7DrE; Wed, 18 Aug 2021 19:46:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCF80407A5;
	Wed, 18 Aug 2021 19:46:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C385B1BF333
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 19:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1B6940399
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 19:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d9UQyedy66sE for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 19:46:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1099E401C4
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 19:46:32 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q10so5287996wro.2
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 12:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9F2KM7Xy5tEme4hDcyTQUmNpod0SJnEPW1xy4B8AG7U=;
 b=YjpFfHPI8bqiaoqezcrvMfzsrruGzqlEkTl7v4hoMUJzUBtYsGQsmuiJUOU5v/gRTI
 flYCVdVYPztJheIqbpHWscgp5Ak8KLL+DlKgcTtltL/MBzMctU+glSXCw/VB/kMSmAjO
 G4dpfxRSwldu6IGmj9Eh3dplzgs2PIxUSfMZgHKHze+JjdLad41iIwSGHQhogV0akrT2
 Z6hvHZ7nyRaS7V3NSo0+GhL2q7+/UfEqmS/Q80RvMduK/PJxW/wto9c4WXOd3gBtV9vs
 zKnWJZN9VYUPeBGCVcP1VD0+QcdC2tlsHLeQuE+ONKNRUh3WEXyfOu3s4SH/jZeB0FVC
 mstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9F2KM7Xy5tEme4hDcyTQUmNpod0SJnEPW1xy4B8AG7U=;
 b=PiENiRrJA69C/rIIiQVKbkftC7frmOwwPKFfFtmvqxIXG1KOb8QUuIIq/KTKG3+1bt
 yEQObnh7KUbRPBW059vKt966LAGh8u7NanuZzf0JH/EYIhvjerXdhNnqR1iNSRL3VuCR
 0CbR8J3hjVAnGexDdeN3m1qdDtai2ZQnblB6QrmIyxMwR47s2WZjC0vjuFiFASZ7FGt2
 zsF8zDxVkiZHb9aRqCoOq7hIykPdbnxA5x0E8NBbM8QxRo2MmkMh8S9uNwby9+Ib/VB8
 ySEqH4FLuBrAe6WEI1W2USv9W2rkHmN72pkzUtlsIj2lrMWMLSFGmHFdan7GjS6SVKq5
 +SsQ==
X-Gm-Message-State: AOAM532xGgRdtat6XyynYtQeQCSSUzokjB3ChfXKkh9YlF9wKYrKMXH9
 LlrbxSdBvsOlu8nA2U08ybk=
X-Google-Smtp-Source: ABdhPJyIYFV8X6WZ1Pjq/czgvEO4gUbtQHtmxAGJ56cpvRhH5vVs6yFgJL53PDHAwuIncD0m8bMs+w==
X-Received: by 2002:a05:6000:1186:: with SMTP id
 g6mr12540327wrx.147.1629315990239; 
 Wed, 18 Aug 2021 12:46:30 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id d18sm811513wrb.16.2021.08.18.12.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 12:46:29 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Petr Vorel <petr.vorel@gmail.com>
References: <20210804172259.9143-1-petr.vorel@gmail.com>
 <20210804213019.6cf2a25d@windsurf>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <e85b8610-6f8c-c581-138a-a73d6131f521@gmail.com>
Date: Wed, 18 Aug 2021 21:46:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804213019.6cf2a25d@windsurf>
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8sCgpMZSAwNC8wOC8yMDIxIMOgIDIxOjMwLCBUaG9tYXMgUGV0YXp6b25pIGEgw6ljcml0
wqA6Cj4gSGVsbG8gUGV0ciwKPiAKPiBPbiBXZWQsICA0IEF1ZyAyMDIxIDE5OjIyOjU5ICswMjAw
Cj4gUGV0ciBWb3JlbCA8cGV0ci52b3JlbEBnbWFpbC5jb20+IHdyb3RlOgo+IAo+PiBBbHNvIHVw
Z3JhZGUgdG8gb24gUklTQy1WICh0aGF0IGNvdWxkIGhhdmUgYmVlbiBkb25lIGluIGQ1Y2UzYjVk
YjUpCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHBldHIudm9yZWxAZ21haWwuY29t
Pgo+PiAtLS0KPj4gSGksCj4+Cj4+IEkgdGVzdGVkIGl0IHdpdGggYnVpbGRpbmcgcGNfeDg2XzY0
X2VmaV9kZWZjb25maWcsIGFkZGluZyBuZnMtdXRpbHMsCj4+IGx0cC10ZXN0c3VpdGUgYW5kIGZl
dyBvdGhlciB0b29scy4gTm90IHN1cmUgaWYgdGhpcyBpcyBlbm91Z2ggZm9yCj4+IHRlc3Rpbmcu
Cj4gCj4gSSB0aGluayB0aGF0IHdoYXQgUm9tYWluIE5hb3VyIHR5cGljYWxseSBkb2VzIGlzIHJ1
biBhbGwgcWVtdV8qCj4gZGVmY29uZmlncyAob2YgY291cnNlIHR3ZWFrZWQgdG8gdXNlIGdsaWJj
IGluc3RlYWQgb2YgdWNsaWJjKSwgYW5kIHB1c2gKPiB0aGVtIHRvIEdpdGxhYiwgc28gdGhhdCB0
aGV5IGdldCBidWlsZCB0ZXN0ZWQgKmFuZCogYm9vdCB0ZXN0ZWQgdW5kZXIKPiBRZW11LgoKSW5k
ZWVkLCB0aGUgcnVudGltZSB0ZXN0IGlzIG9ubHkgYSBib290IHRlc3QuIEkndmUgbG9va2VkIGF0
IHRoZSBnbGliYyB0ZXN0c3VpdGUKYnV0IGl0J3MgZGlmZmljdWx0IHRvIHNldHVwIHdpdGggYSBj
cm9zcy1jb21waWxlZCBzeXN0ZW0gcnVubmluZyB1bmRlciBRZW11IGluIGEKQ0kgKGdsaXRsYWIp
LgoKRm9yIHRlc3RpbmcsIHVwc3RyZWFtIHN1Z2dlc3QgdG8gdXNlIGEgTkZTIHRvIHNoYXJlIHRo
ZSBnbGliYyBzb3VyY2VzIGJldHdlZW4KdGhlIGhvc3QgYW5kIHRoZSB0YXJnZXQgKG5vdCB2ZXJ5
IGhhbmR5KToKaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9nbGliYy93aWtpL1Rlc3RpbmcvVGVzdHN1
aXRlCgpTb21lIHRlc3RzIHJlcXVpcmVzIGEgbWluaW1hbCBhbW91bnQgb2YgUkFNIHRoYXQgaXMg
bm90IGFsd2F5cyBwcm92aWRlZCBieSBRZW11CnRhcmdldC4KClRoZXJlIGlzIGFsc28gbGliYy10
ZXN0IHByb2plY3QgZnJvbSBtdXNsIHByb2plY3Q6Cmh0dHBzOi8vd2lraS5tdXNsLWxpYmMub3Jn
L2xpYmMtdGVzdC5odG1sCgpJbmRlZWQgcnVubmluZyBzb21lIHRlc3RzIGZyb20gbHRwLXRlc3Rz
dWl0ZSB3b3VsZCBiZSBiZXR0ZXIgdGhhbiBub3RoaW5nLgpPbiB0aGUgb3RoZXIgaGFuZCB3ZSBj
YW4gZGV0ZWN0IGVub3VnaCBib290IGlzc3VlIHJlbGF0ZWQgdG8gdG9vbGNoYWluIHVwZ3JhZGUK
dG8ga2VlcCB1cyBidXN5LgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gVGhvbWFzCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5u
ZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
