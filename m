Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3F9C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 14:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3ECD81398;
	Wed,  6 Apr 2022 14:24:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLD8KVLeLjbW; Wed,  6 Apr 2022 14:24:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21F9E81390;
	Wed,  6 Apr 2022 14:24:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3017A1BF300
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 14:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E6B440B60
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 14:24:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JpVoxSUVkH-2 for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 14:24:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CA0440424
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 14:24:21 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id i27so4596737ejd.9
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 07:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BuOplahP6BFSzGpontrg/0/18tMgt2aN+k119h4nufU=;
 b=DILTDrMNn9OzgwlTGGNjm8lDS+t8TRJl+DbvW2eGytLmXYtA67ejJeVdQshZeG0HzV
 5Qg8jbYA33GTU86iCPo/tZ3447sW1YSGDHlxEkufOP+bjAXUK5bpAhyUnfQlAI1HEtz7
 T5AL0hZ2kaZzwCaP8NRNE3OM9IbURBvFI3Y0juIYywbFz3DtBKJQ4Qy3fscPep3BhWE5
 fuSlTQvsSERjhlq5KDYZhQ+2m2u2BCZTQY5wLbC3s2rzscgcZfU3FSkS3a3lR/cASKiJ
 Bm4TA39pcStwNO8f97an99E2kmJp9qOJOZMhih/6ySVJUVF8WtSKlfLzy52QYTQ0f89P
 cp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BuOplahP6BFSzGpontrg/0/18tMgt2aN+k119h4nufU=;
 b=69Sp5oSJZ0q0QCIotkkPdxq+Xi7d+6O5fZQUrRs4+E7WQuqugJD9D50coeXdEuxxlS
 FP7a1T1zY1Xt0HYDGnuheAlkEbmLnSWWUHrWFSflBTAX+YGdh6DpMfyi3DAmtBe31Ige
 6I42Dt/RGkyYNUxZY0z2xW6Yq5piuUenWNXuJaJJS94aHSfkl7LVXk1SCM9utQN7ZrXI
 nWDGXM3AYpDeBXXE1Ks38OV39kisez+5pWN/WnoerrjTQEm1mCisABvFFqqAHr2U5eNi
 ZvkVq5kUVZcDR6KnDbz3qnbboISm1AZ8Smzn/UCf+nSEY79MoxtmkaUtPmULN+V4rgkE
 +azQ==
X-Gm-Message-State: AOAM530+bCpbzHPed4YTHrKCHDbkkVC6rgX6+3sHQPRWYKtlqgMFMf1L
 6/n1HM//C9p9h6ZP0jkkm9jqVjoolO6C+Q==
X-Google-Smtp-Source: ABdhPJxa+RanMXX1c4LAO2/VlU8P463ZL12ZoRJnzh1HTFrICqZa+k7BbFi9IeiFplBe19P4eDTGqQ==
X-Received: by 2002:a17:906:948:b0:6d6:e479:1fe4 with SMTP id
 j8-20020a170906094800b006d6e4791fe4mr8565617ejd.240.1649255060236; 
 Wed, 06 Apr 2022 07:24:20 -0700 (PDT)
Received: from [192.168.0.179] ([83.217.130.159])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170906724d00b006cedd6d7e24sm6680677ejk.119.2022.04.06.07.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 07:24:19 -0700 (PDT)
Message-ID: <08affbae-a2c5-7e17-a9ee-a1f7842c2259@mind.be>
Date: Wed, 6 Apr 2022 16:24:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: =?UTF-8?B?0KDQvtC80LDQvSDQlNC+0L3Rh9C10L3QutC+?= <dpb@corrigendum.ru>,
 buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
References: <20220405233412.4701-1-dpb@corrigendum.ru>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220405233412.4701-1-dpb@corrigendum.ru>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-python.mk: remove hardcoded
 paths for host Python
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDYvMDQvMjAyMiAwMTozNCwg0KDQvtC80LDQvSDQlNC+0L3Rh9C10L3QutC+IHdyb3RlOgo+
IFdoZW4gaW5zdGFsbGVyIGlzIHVzZWQgdG8gaW5zdGFsbCBwYWNrYWdlcyBmb3IgaG9zdCBQeXRo
b24sIGl0IGNhbiBmaWd1cmUKPiBvdXQgYnkgaXRzZWxmIHdoaWNoIHBhdGhzIHRvIHVzZS4gV2Ug
anVzdCBuZWVkIHRvIHVzZSB0aGUgaW5zdGFsbGVyIENMSQo+IGluc3RlYWQgb2Ygb3VyIHdyYXBw
ZXIgc2NyaXB0LgoKICBKYW1lcywgY291bGQgeW91IGhhdmUgYSBsb29rIGF0IHRoaXMgYW5kIGFk
ZCBpdCB0byB5b3VyIHNlcmllcyB0aGF0IHJld29ya3MgCnRoZSBwZXA1MTcgaW5mcmE/IEJlY2F1
c2UgSSB0aGluayBpdCdsbCBjcmVhdGUgY29uZmxpY3RzLgoKICBBbHNvLCBjYW4gdGhlIGluc3Rh
bGxlciBiZSB1c2VkIGZvciB0YXJnZXQgaW5zdGFsbCBhcyB3ZWxsPwoKICBSZWdhcmRzLAogIEFy
bm91dAoKPiAKPiBTaWduZWQtb2ZmLWJ5OiDQoNC+0LzQsNC9INCU0L7QvdGH0LXQvdC60L4gPGRw
YkBjb3JyaWdlbmR1bS5ydT4KPiAtLS0KPiAgIHBhY2thZ2UvcGtnLXB5dGhvbi5tayB8IDEwICst
LS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOSBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctcHl0aG9uLm1rIGIvcGFja2FnZS9wa2ct
cHl0aG9uLm1rCj4gaW5kZXggODY3MzQxZmM3Yi4uYWNkNTYyOGYzYiAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL3BrZy1weXRob24ubWsKPiArKysgYi9wYWNrYWdlL3BrZy1weXRob24ubWsKPiBAQCAt
MTQ2LDE0ICsxNDYsNiBAQCBIT1NUX1BLR19QWVRIT05fUEVQNTE3X0VOViA9IFwKPiAgIAlQWVRI
T05OT1VTRVJTSVRFPTEgXAo+ICAgCSQoSE9TVF9DT05GSUdVUkVfT1BUUykKPiAgIAo+IC1IT1NU
X1BLR19QWVRIT05fUEVQNTE3X0lOU1RBTExfT1BUUyA9IFwKPiAtCS0taW50ZXJwcmV0ZXI9L2Jp
bi9weXRob24gXAo+IC0JLS1zY3JpcHQta2luZD1wb3NpeCBcCj4gLQktLXB1cmVsaWI9JChIT1NU
X0RJUikvbGliL3B5dGhvbiQoUFlUSE9OM19WRVJTSU9OX01BSk9SKS9zaXRlLXBhY2thZ2VzIFwK
PiAtCS0taGVhZGVycz0kKEhPU1RfRElSKS9pbmNsdWRlL3B5dGhvbiQoUFlUSE9OM19WRVJTSU9O
X01BSk9SKSBcCj4gLQktLXNjcmlwdHM9JChIT1NUX0RJUikvYmluIFwKPiAtCS0tZGF0YT0kKEhP
U1RfRElSKQo+IC0KPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAjIGlubmVyLXB5dGhv
bi1wYWNrYWdlIC0tIGRlZmluZXMgaG93IHRoZSBjb25maWd1cmF0aW9uLCBjb21waWxhdGlvbgo+
ICAgIyBhbmQgaW5zdGFsbGF0aW9uIG9mIGEgUHl0aG9uIHBhY2thZ2Ugc2hvdWxkIGJlIGRvbmUs
IGltcGxlbWVudHMgYQo+IEBAIC0yMTIsNyArMjA0LDcgQEAgJCgyKV9CQVNFX0lOU1RBTExfU1RB
R0lOR19DTUQgPSAkKFRPUERJUikvc3VwcG9ydC9zY3JpcHRzL3B5aW5zdGFsbGVyLnB5IGRpc3Qv
Kgo+ICAgZWxzZQo+ICAgJCgyKV9CQVNFX0VOViA9ICQkKEhPU1RfUEtHX1BZVEhPTl9QRVA1MTdf
RU5WKQo+ICAgJCgyKV9CQVNFX0JVSUxEX0NNRCA9IC1tIGJ1aWxkIC1uIC13Cj4gLSQoMilfQkFT
RV9JTlNUQUxMX0NNRCA9ICQoVE9QRElSKS9zdXBwb3J0L3NjcmlwdHMvcHlpbnN0YWxsZXIucHkg
ZGlzdC8qICQkKEhPU1RfUEtHX1BZVEhPTl9QRVA1MTdfSU5TVEFMTF9PUFRTKQo+ICskKDIpX0JB
U0VfSU5TVEFMTF9DTUQgPSAtbSBpbnN0YWxsZXIgZGlzdC8qCj4gICBlbmRpZgo+ICAgZWxzZQo+
ICAgJCQoZXJyb3IgIkludmFsaWQgJCgyKV9TRVRVUF9UWVBFLiBWYWxpZCBvcHRpb25zIGFyZSAn
ZGlzdHV0aWxzJywgJ3NldHVwdG9vbHMnLCAncGVwNTE3JyBvciAnZmxpdCcuIikKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
