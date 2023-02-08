Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BF2C636D3
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 21:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBB0F40B9C;
	Wed,  8 Feb 2023 21:06:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBB0F40B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rx3DB49rLP8k; Wed,  8 Feb 2023 21:06:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03CBD4053E;
	Wed,  8 Feb 2023 21:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03CBD4053E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D20D41BF3DC
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 21:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB18661188
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 21:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB18661188
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lFkKTDkK7xhG for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 21:05:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70A4760F2F
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70A4760F2F
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 21:05:58 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id o36so83806wms.1
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 13:05:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1KMljo3A6uiZT1Gk5XeX7Kc+VhS2roeBxjOdhtlyotY=;
 b=x/oxv7EJjKq1MwfAQvCcFK+rTOWeZFYTX0QYOl2U1fRsqy1sbfmvDWLwewQ31WVZQ0
 4xLLWaaVoGm+KHLZdxVRnJ4UTvQHKugrGhhETEy6VN5GfesTDhLVk2Gpi1XzG/mj/ho6
 9uRJh8hHMzeiaMyNLTqpCAVN9+CrL2jTedFgQRZn5wZEswhzGH0X2rU//WdL/LKcJS5Q
 NwgTw2y+yC+NmXpaCubhWubdwnnJUNnuhncJbxtDtPi1cLrjm8Es3YlPHXHGqCjTkS3I
 LifrzEOYxsPyVhoh+hPVq7tQTXvjXxS57JUlR1DgcgYDnr8nB4ujrNEDpVzJ8LToN1zq
 G7dA==
X-Gm-Message-State: AO0yUKXkhSMl3Y2atHpHXC1VRrMs1XfzmF1jo7RSCaqS971U0hwc5e0h
 fKaY49LZ0NykpuxDTVIHWholKA==
X-Google-Smtp-Source: AK7set9/1S0jh2WspPQMF0CnugMMzofTHFu/XV3gHqhaAy0E1oi9wwDhrNlkkbZ0O1FzFobxYjIhZA==
X-Received: by 2002:a05:600c:a686:b0:3de:3381:24f2 with SMTP id
 ip6-20020a05600ca68600b003de338124f2mr7907274wmb.30.1675890356500; 
 Wed, 08 Feb 2023 13:05:56 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c2ca400b003dc51c48f0bsm3060789wmc.19.2023.02.08.13.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 13:05:56 -0800 (PST)
Message-ID: <b56d8266-105c-87d3-3e50-83fcfa3162d9@smile.fr>
Date: Wed, 8 Feb 2023 22:05:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20230208181933.3925279-1-peter@korsgaard.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230208181933.3925279-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1KMljo3A6uiZT1Gk5XeX7Kc+VhS2roeBxjOdhtlyotY=;
 b=oF8Ecxbo4uC+liS6Zu470oc+Va9w5GUb0LMxjlJ5/6VrHVrq50vmIWWUMP5CPycEQc
 ho3RmPLTZqr3w2A8BfmuoTaW4hAJBkQ4ERcb2Sdlt0Lq+NlALfQ4wrB4vF3QJNBkRXdN
 O5VYVNQBvXJQOpRUEF3q0Xsrbhx+ynHHlOMygQzxySzHdoqynDFQImnIDYfrK3I7iFdh
 zzLT7H5QbWl8QyjJK4NqpWzu1wADNXazsJlaUJXvewnEtDM1cVjgjiqP4RX1lsGSPGpe
 jStYTd1c4Re9CO88fOLcDFK7V7vMtNcXvHxHWJRV38d6wgbs2a/yILkxClF3ullAjFQ7
 mWig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=oF8Ecxbo
Subject: Re: [Buildroot] [PATCH 1/5] package/pkg-waf.mk: drop bundled
 waf/waflib when external waf is used
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpMZSAwOC8wMi8yMDIzIMOgIDE5OjE5LCBQZXRlciBLb3JzZ2FhcmQgYSDD
qWNyaXTCoDoKPiBXYWYgcmVxdWlyZXMgdGhhdCB0aGUgdmVyc2lvbiBvZiB0aGUgd2FmIHNjcmlw
dCBtYXRjaGVzIHRoZSB2ZXJzaW9uIG9mCj4gd2FmbGliLCBzbyBkcm9wIGFueSBidW5kbGVkIHdh
Zi93YWZsaWIgaWYgX05FRURTX0VYVEVSTkFMX1dBRiBpcyB1c2VkLCBhcwo+IG90aGVyd2lzZSB3
YWYgZXJyb3JzIG91dCB3aXRoIGVycm9ycyBsaWtlOgo+IAo+IFdhZiBzY3JpcHQgJzIuMC4yNCcg
YW5kIGxpYnJhcnkgJzEuOS4zJyBkbyBub3QgbWF0Y2gKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRl
ciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+CgpSZXZpZXdlZC1ieTogUm9tYWluIE5h
b3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAtLS0K
PiAgcGFja2FnZS9wa2ctd2FmLm1rIHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLXdhZi5tayBiL3BhY2th
Z2UvcGtnLXdhZi5tawo+IGluZGV4IGUwOTBhZmE5ZTYuLmEwNjdlNjljOWIgMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS9wa2ctd2FmLm1rCj4gKysrIGIvcGFja2FnZS9wa2ctd2FmLm1rCj4gQEAgLTM4
LDYgKzM4LDEzIEBAIFdBRl9PUFRTID0gJChpZiAkKFZFUkJPU0UpLC12KSAtaiAkKFBBUkFMTEVM
X0pPQlMpCj4gIAo+ICBkZWZpbmUgaW5uZXItd2FmLXBhY2thZ2UKPiAgCj4gKyMgVGhlIHZlcnNp
b24gb2Ygd2FmbGliIGhhcyB0byBtYXRjaCB3aXRoIHRoZSB2ZXJzaW9uIG9mIHdhZiwKPiArIyBv
dGhlcndpc2Ugd2FmIGVycm9ycyBvdXQgd2l0aDoKPiArIyBXYWYgc2NyaXB0ICdYJyBhbmQgbGli
cmFyeSAnWScgZG8gbm90IG1hdGNoCj4gK2RlZmluZSBXQUZfUEFDS0FHRV9SRU1PVkVfV0FGX0xJ
Qgo+ICsJJChSTSkgLWZyICQoQEQpL3dhZiAkKEBEKS93YWZsaWIKPiArZW5kZWYKPiArCj4gICMg
V2UgbmVlZCBob3N0LXB5dGhvbjMgdG8gcnVuIHdhZgo+ICAkKDIpX0RFUEVOREVOQ0lFUyArPSBo
b3N0LXB5dGhvbjMKPiAgCj4gQEAgLTQ3LDYgKzU0LDcgQEAgJCgyKV9ORUVEU19FWFRFUk5BTF9X
QUYgPz0gTk8KPiAgaWZlcSAoJCQoJCgyKV9ORUVEU19FWFRFUk5BTF9XQUYpLFlFUykKPiAgJCgy
KV9ERVBFTkRFTkNJRVMgKz0gaG9zdC13YWYKPiAgJCgyKV9XQUYgPSAkJChIT1NUX0RJUikvYmlu
L3dhZgo+ICskKDIpX1BSRV9DT05GSUdVUkVfSE9PS1MgKz0gV0FGX1BBQ0tBR0VfUkVNT1ZFX1dB
Rl9MSUIKPiAgZWxzZQo+ICAkKDIpX1dBRiA/PSAuL3dhZgo+ICBlbmRpZgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
