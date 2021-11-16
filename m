Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC06C433EF
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:01:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B43C361A89
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B43C361A89
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4664C4044D;
	Tue, 16 Nov 2021 20:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MWh3mslvRBbt; Tue, 16 Nov 2021 20:01:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84E4F402CB;
	Tue, 16 Nov 2021 20:01:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 78BF61BF298
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 762D780F16
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:01:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wy_Yk32jNNLD for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 20:01:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70BE380CF8
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 20:01:26 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z5so158184edd.3
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 12:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=GVK6oFKtlcgA6ePcgzVSTFuNFZrzCKgv7BTyOcm4y9I=;
 b=cDZhJbxUiOVavDu055XnBbxO8Oe69QnE1/vfmkLvhryCCMH8/Hc7H8hPKhNr4oxaQJ
 Q4P20S+gbKyAWN3cfgMe/v+wJxIOsFZ2aXb/FDMqy8/mKj+O3U47UqboRTXlq+080aSx
 5UiEpIHobl9/UGRGvqI+wJ41eRB6KH4cAe8N4zSFieTNkS/28KILXcAjnxIWfR1E8IXb
 6FNLFm5tkGK+2XkXrUO8+w4B6y1HxY8ue+LbupqvR4JMrBDy2ZN7MK8s3PXUorFJ5YTq
 DlbD/MNkUMLKAWJHkOkAuSVaKB2YA4RYwb29kliI9trfRH7WmodnzwVMMIHLjAHyh/dV
 6Low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GVK6oFKtlcgA6ePcgzVSTFuNFZrzCKgv7BTyOcm4y9I=;
 b=ISRKWDZ1gm21skyk/CduJN6YhHjICMvEgodFmrj1FKZEuK+UmD781vtedvYzvZQmo1
 2QzoNtq0m8AVhdrE95vKPag294NIW2f4Vg3rrf3TGriRcYca1oJqnz1/ERruxaROOytX
 WAGk7nuHmSzZHvBrnQSbAISpFUKpcQkxiooiaj8ctWdfS2D45XM5sCHiU4gpiRs/qQuK
 TtWGzf++AFokntxwG471wEDaXjKHT0GGShyvsP505ybhjRHiKH/ebR8MbGb/AV8tkL+I
 QfC/IG0Kz9TPwBxXCLikhvrTWBcNRYfttNF60AIc6I6hr7IOYLwEqqi11XSUA1NUbO2N
 adjQ==
X-Gm-Message-State: AOAM530gadvggLSHgIQZx1PSfh9wqRSUW5EN6D6+yvJc3rbtaNpwp27U
 ESB6lN0aLtfnf1aVxvIrxq350DIBKuoyaw==
X-Google-Smtp-Source: ABdhPJwaBXAwZDt41iUSqnqizeeKyZraxvRG70y/uhh0kKIszSEi/jf/OmafZKRCIuEeQ+bKPXOEEw==
X-Received: by 2002:a05:6402:514d:: with SMTP id
 n13mr14007342edd.380.1637092884632; 
 Tue, 16 Nov 2021 12:01:24 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x15sm5993254edq.65.2021.11.16.12.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 12:01:24 -0800 (PST)
Message-ID: <ebfeb0af-e0c3-b999-123a-8d1d5888bd5a@mind.be>
Date: Tue, 16 Nov 2021 21:01:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20211109175631.26267-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211109175631.26267-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v2 1/2] package/gdb: fix gdb-11.1 compile
 for uclibc < v1.0.35 (getrandom related)
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

CgpPbiAwOS8xMS8yMDIxIDE4OjU2LCBQZXRlciBTZWlkZXJlciB3cm90ZToKPiAtIGZpeCBnZXRy
YW5kb20gY29tcGlsZSBmb3IgdWNsaWJjIDwgdjEuMC4zNSwgYWRkIG1pc3Npbmcgc3RkZGVmLmgK
PiAgICBpbmNsdWRlIChmaXhlZCBpbiB1Y2xpYmMgc2luY2UgdjEuMC4zNSwgc2VlIFsxXSkKPiAK
PiBGaXhlczoKPiAKPiAgICAuLi4vaG9zdC94ODZfNjQtYnVpbGRyb290LWxpbnV4LXVjbGliYy9z
eXNyb290L3Vzci9pbmNsdWRlL3N5cy9yYW5kb20uaDoyNzozNTogZXJyb3I6IHVua25vd24gdHlw
ZSBuYW1lIOKAmHNpemVfdOKAmQo+ICAgICAgIDI3IHwgZXh0ZXJuIGludCBnZXRyYW5kb20odm9p
ZCAqX19idWYsIHNpemVfdCBjb3VudCwgdW5zaWduZWQgaW50IGZsYWdzKQo+ICAgICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KCiAgQm90aCBhcHBsaWVkIHRv
IG1hc3RlciwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiAgIC4uLmdldHJh
bmRvbS1jb21waWxlLWZvci11Y2xpYmMtdjEuMC4zNS5wYXRjaCB8IDM5ICsrKysrKysrKysrKysr
KysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9nZGIvMTEuMS8wMDA3LUZpeC1nZXRyYW5kb20tY29tcGlsZS1mb3It
dWNsaWJjLXYxLjAuMzUucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nZGIvMTEuMS8w
MDA3LUZpeC1nZXRyYW5kb20tY29tcGlsZS1mb3ItdWNsaWJjLXYxLjAuMzUucGF0Y2ggYi9wYWNr
YWdlL2dkYi8xMS4xLzAwMDctRml4LWdldHJhbmRvbS1jb21waWxlLWZvci11Y2xpYmMtdjEuMC4z
NS5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYjAyZDYz
ZmMwYwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2dkYi8xMS4xLzAwMDctRml4LWdl
dHJhbmRvbS1jb21waWxlLWZvci11Y2xpYmMtdjEuMC4zNS5wYXRjaAo+IEBAIC0wLDAgKzEsMzkg
QEAKPiArRnJvbSA4NzkwMDhlZjlhNDhhYTEzNjM2NzFmNWMxNzM2YjQ5ZjMwYzVhMzc5IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdt
eC5uZXQ+Cj4gK0RhdGU6IFNhdCwgNiBOb3YgMjAyMSAxMDowNjoyNSArMDEwMAo+ICtTdWJqZWN0
OiBbUEFUQ0hdIEZpeCBnZXRyYW5kb20gY29tcGlsZSBmb3IgdWNsaWJjIDwgdjEuMC4zNQo+ICtN
SU1FLVZlcnNpb246IDEuMAo+ICtDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRG
LTgKPiArQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+ICsKPiArLSBmaXggZ2V0cmFu
ZG9tIGNvbXBpbGUgZm9yIHVjbGliYyA8IHYxLjAuMzUsIGFkZCBtaXNzaW5nIHN0ZGRlZi5oCj4g
KyAgaW5jbHVkZSAoZml4ZWQgaW4gdWNsaWJjIHNpbmNlIHYxLjAuMzUsIHNlZSBbMV0pCj4gKwo+
ICtGaXhlczoKPiArCj4gKyAgLi4uL2hvc3QveDg2XzY0LWJ1aWxkcm9vdC1saW51eC11Y2xpYmMv
c3lzcm9vdC91c3IvaW5jbHVkZS9zeXMvcmFuZG9tLmg6Mjc6MzU6IGVycm9yOiB1bmtub3duIHR5
cGUgbmFtZSDigJhzaXplX3TigJkKPiArICAgICAyNyB8IGV4dGVybiBpbnQgZ2V0cmFuZG9tKHZv
aWQgKl9fYnVmLCBzaXplX3QgY291bnQsIHVuc2lnbmVkIGludCBmbGFncykKPiArICAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4KPiArCj4gK1sxXSBodHRw
czovL2NnaXQudWNsaWJjLW5nLm9yZy9jZ2kvY2dpdC91Y2xpYmMtbmcuZ2l0L2NvbW1pdC8/aWQ9
MDA5NzJjMDJjMmI2ZTBhOTVkNWRlZjRhNzFiZGZiMTg4ZTA5MTc4MnQKPiArCj4gK1NpZ25lZC1v
ZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KPiArLS0tCj4gKyBnbnVs
aWIvaW1wb3J0L2dldHJhbmRvbS5jIHwgMSArCj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPiArCj4gK2RpZmYgLS1naXQgYS9nbnVsaWIvaW1wb3J0L2dldHJhbmRvbS5jIGIvZ251
bGliL2ltcG9ydC9nZXRyYW5kb20uYwo+ICtpbmRleCA0MTIxMmZiLi4wYWQzZjk2IDEwMDY0NAo+
ICstLS0gYS9nbnVsaWIvaW1wb3J0L2dldHJhbmRvbS5jCj4gKysrKyBiL2dudWxpYi9pbXBvcnQv
Z2V0cmFuZG9tLmMKPiArQEAgLTE5LDYgKzE5LDcgQEAKPiArCj4gKyAjaW5jbHVkZSA8Y29uZmln
Lmg+Cj4gKwo+ICsrI2luY2x1ZGUgPHN0ZGRlZi5oPgo+ICsgI2luY2x1ZGUgPHN5cy9yYW5kb20u
aD4KPiArCj4gKyAjaW5jbHVkZSA8ZXJybm8uaD4KPiArLS0KPiArMi4zMy4xCj4gKwo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
