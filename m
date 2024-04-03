Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89F3CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 09:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 978D28204E;
	Wed,  3 Apr 2024 09:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IW3NAfNjOMyy; Wed,  3 Apr 2024 09:38:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93A1482071
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93A1482071;
	Wed,  3 Apr 2024 09:38:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC6D21BF271
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 09:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8F5C82071
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 09:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y9WOC2J_SJxS for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 09:38:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0F9B781FF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F9B781FF8
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F9B781FF8
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 09:38:01 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d8129797fcso42683801fa.1
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 02:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712137080; x=1712741880;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AmmslHza0fuqRYIA7gBAuz3XT6ofV4kntZ8TngQ9jjo=;
 b=BIyXf8yuNTttsM0/+L0iQiz+HveUADt5EwrLqdpaoaap5nJ82ixZN9ppJV3zTOXj5r
 BsWNG2MeLPycp12d/77HDwUnnz4Hr+j2NCmA9ET5/tEInl/S1ZxIpjTlxGJU0zUBZKCN
 jXsLNV3NkksifNBPLQ49aafYvr6CwNinqUrMR7Lv0c1dw3XgcjddwuTzzzNoXCg9HU7h
 RmANljadv8TIDe9zWFCMeal6EMU9/XVDPht/ieBQzJphYZhKx1EnGDHE3bHQgVlVHuNu
 IEtGd91Hc11RqqKyvAf33fEE9Zxjdrh+qenGBiD31nCvm+MyySvfqTmicjmIu5w2V3iB
 x1yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0s27EvF7VyjUAVAEjahCI8fdqkJEobIVTRx6ICaGOv7pZDOyCCrO+jZYnWbntJ7/LJXQ/DwTvj/pllNT+SKTnPKKLYvlNFA==
X-Gm-Message-State: AOJu0YzP0XoQ8gm9zcDSxjFNK+uG5/mmJlyJHvEN1HBpzUoGpqrEawHT
 6PA6LHmhclbtr3QISslcUKLbxyMULyZuHvvGFGhCTvUG3CE3YT5o+5tSaawobaI=
X-Google-Smtp-Source: AGHT+IGGDnng6iuQuSdX83A0dcjaEYix5Yxx8AhQQnWE+LjQwuLuH+epkGIwANe26RFfbTVn0R6FWw==
X-Received: by 2002:a05:651c:201d:b0:2d6:ecb1:ffb3 with SMTP id
 s29-20020a05651c201d00b002d6ecb1ffb3mr9058426ljo.25.1712137079742; 
 Wed, 03 Apr 2024 02:37:59 -0700 (PDT)
Received: from ?IPV6:2a04:cec0:1034:c083:97c8:fbff:84a2:888b?
 ([2a04:cec0:1034:c083:97c8:fbff:84a2:888b])
 by smtp.gmail.com with ESMTPSA id
 u22-20020a05600c139600b004148d7b889asm24194212wmf.8.2024.04.03.02.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 02:37:59 -0700 (PDT)
Message-ID: <a4e32712-b57e-4d2e-a1af-29aee0969064@smile.fr>
Date: Wed, 3 Apr 2024 11:37:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
 <20240304153253.732708-12-dario.binacchi@amarulasolutions.com>
 <20240319151642.iqpbgwlcqxcumi52@bryanbrattlof.com>
 <fb91444b-65b9-4c8a-877c-00bcfe754729@smile.fr>
 <CAOf5uwny_iJrx4MeN-qg+Z0wn-JoZY1Ei1QfRvx5buNXX8M7Hw@mail.gmail.com>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CAOf5uwny_iJrx4MeN-qg+Z0wn-JoZY1Ei1QfRvx5buNXX8M7Hw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712137080; x=1712741880;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AmmslHza0fuqRYIA7gBAuz3XT6ofV4kntZ8TngQ9jjo=;
 b=VyvNXvOPScQLg6zoEvJd+QD0k0tD81XG7fbQ6/+fiNbbnpjRATPZuJI950zZJuNjVA
 zVPYYWLfTZNCHGfWeNSC1qcdwEqkP6gs9/M8IJYwbJYlEI7G9r6IhFCKSQLeaUQEG4ZF
 PAAFSOSWO4LsBmFVZQH/LI74isMSirzuXIMhQFp/0p9ffFOCtUNtL/Sv+RHE+9fI50cF
 KN2zNdgk5Xre11Qug1uECWM8WU1FGitITvZsHrXUISu7mrAIMn0yzczuWeAu5y7Io5Iu
 1LyCf41p3eiS4GGwDmE61QDOAmksjqhVfx54jICOdot2IvKuxJ+vjApgLoLghDlX9keV
 PBOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=VyvNXvOP
Subject: Re: [Buildroot] [PATCH v9 11/22] boot/ti-k3-r5-loader: set binman
 environment
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
Cc: Bryan Brattlof <bb@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWljaGFlbCwKCkxlIDAzLzA0LzIwMjQgw6AgMTA6MzQsIE1pY2hhZWwgTmF6emFyZW5vIFRy
aW1hcmNoaSBhIMOpY3JpdMKgOgo+IEhpIFJvbWFpbgo+IAo+IE9uIFdlZCwgQXByIDMsIDIwMjQg
YXQgMTA6MjjigK9BTSBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6
Cj4+Cj4+IEhlbGxvIEJyeWFuLCBBbGwsCj4+Cj4+IExlIDE5LzAzLzIwMjQgw6AgMTY6MTYsIEJy
eWFuIEJyYXR0bG9mIGEgw6ljcml0IDoKPj4+IEhpIERhcmlvLAo+Pj4KPj4+IE9uIE1hcmNoICA0
LCAyMDI0IHRodXMgc2F5ZXRoIERhcmlvIEJpbmFjY2hpOgo+Pj4+IFJlY2VudCB2ZXJzaW9uIG9m
IFUtQm9vdCB1c2UgYmlubWFuIHRvIHByb3ZpZGUgYSBtZWNoYW5pc20gZm9yIGJ1aWxkaW5nCj4+
Pj4gaW1hZ2VzLCBmcm9tIHNpbXBsZSBTUEwgKyBVLUJvb3QgY29tYmluYXRpb25zLCB0byBtb3Jl
IGNvbXBsZXgKPj4+PiBhcnJhbmdlbWVudHMgd2l0aCBtYW55IHBhcnRzLgo+Pj4+Cj4+Pj4gVGhl
IHBhdGNoIHNldCB0aGUgQklOTUFOX0lORElSUyBlbnZpcm9ubWVudCB2YXJpYWJsZSB0byBwcm92
aWRlIHRoZQo+Pj4+IGRpcmVjdG9yeSB0byBzZWFyY2ggZm9yIGJpbmFyeSBibG9icyBhbmQgc2Vs
ZWN0IHRoZSBwYWNrYWdlcyByZXF1aXJlZCBieQo+Pj4+IGJpbm1hbi4KPj4+Pgo+Pj4+IFRoZSBk
ZXBlbmRlbmN5IG9mIGJpbm1hbiBpcyBub3QgcmVhbGx5IGVhc3kgdG8gZm9sbG93LiBGaXJzdCB3
ZSBoYXZlIHRoZQo+Pj4+IHBhY2thZ2VzIGxpc3QgZnJvbSBiaW5tYW4ucnN0IFsxXSB0aGVuIHdl
IGhhdmUgdG8gaW5zdGFsbCBhZGRpdGlvbmFsIHB5dGhvbgo+Pj4+IG1vZHVsZXMgWzJdLiBNYXli
ZSBpbiB0aGUgZnV0dXJlIGl0IHdpbGwgYmUgbmVjZXNzYXJ5IHRvIGFkZCBob3N0LWx6bWEgYW5k
Cj4+Pj4gaG9zdC1sejQgaW4gdGhlIGRlcGVuZGVuY2llcyBsaXN0Lgo+Pj4+Cj4+Pj4gWzFdIGh0
dHBzOi8vc291cmNlLmRlbnguZGUvdS1ib290L3UtYm9vdC8tL2Jsb2IvdjIwMjQuMDEvdG9vbHMv
YmlubWFuL2Jpbm1hbi5yc3Q/cGxhaW49MSNMMzc3Cj4+Pj4gWzJdIGh0dHBzOi8vc291cmNlLmRl
bnguZGUvdS1ib290L3UtYm9vdC8tL2Jsb2IvdjIwMjQuMDEvdG9vbHMvYnVpbGRtYW4vcmVxdWly
ZW1lbnRzLnR4dAo+Pj4+IENvLWRldmVsb3BlZC1ieTogTWljaGFlbCBUcmltYXJjaGkgPG1pY2hh
ZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBUcmlt
YXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5
OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+
Pj4KPj4+PiAtLS0KPj4+Pgo+Pj4KPj4+IC4uLgo+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYm9vdC90
aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4+Pj4gYi9ib290L3RpLWszLXI1LWxv
YWRlci90aS1rMy1yNS1sb2FkZXIubWsKPj4+PiBpbmRleCAwZmZjYjgyMzVmMmUuLmZkYjA1OGYz
YjcyYSAxMDA2NDQKPj4+PiAtLS0gYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2Fk
ZXIubWsKPj4+PiArKysgYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsK
Pj4+PiBAQCAtMzksNyArMzksMTIgQEAgVElfSzNfUjVfTE9BREVSX0RFUEVOREVOQ0lFUyA9IFwK
Pj4+PiAgICAgIGhvc3QtcGtnY29uZiBcCj4+Pj4gICAgICAkKEJSMl9NQUtFX0hPU1RfREVQRU5E
RU5DWSkgXAo+Pj4+ICAgICAgaG9zdC1hcm0tZ251LXRvb2xjaGFpbiBcCj4+Pj4gLSAgICBob3N0
LW9wZW5zc2wKPj4+PiArICAgIGhvc3Qtb3BlbnNzbCBcCj4+Pj4gKyAgICBob3N0LXB5dGhvbi1q
c29uc2NoZW1hIFwKPj4+PiArICAgIGhvc3QtcHl0aG9uLXB5eWFtbCBcCj4+Pj4gKyAgICBob3N0
LXB5dGhvbjMgXAo+Pj4+ICsgICAgaG9zdC1weXRob24tc2V0dXB0b29scyBcCj4+Pj4gKyAgICBo
b3N0LXB5dGhvbi1weWxpYmZkdAo+Pj4KPj4+IEp1c3QgYSBxdWVzdGlvbiBvbiBob3cgYm9vdCBk
ZXBlbmRlbmNpZXMgYXJlIHJlc29sdmVkLiBEbyB3ZSBuZWVkIHRvIGFkZAo+Pj4gdGktazMtYm9v
dC1maXJtd2FyZSB0byB0aGlzIGxpc3Q/IEhvdyBkb2VzIHRpLWszLXI1LWxvYWRlciBrbm93IHRv
Cj4+PiAnYnVpbGQnIHRoZSBmaXJtd2FyZSBiZWZvcmUgd2UgYnVpbGQgdGlib290My5iaW4/Cj4+
Cj4+IEluZGVlZCwgd2l0aG91dCB0aS1rMy1ib290LWZpcm13YXJlIHBhY2thZ2UgaW5zdGFsbGVk
LCBiaW5tYW4gd2FybiBhYm91dAo+PiAiTWlzc2luZyBibG9iIgo+Pgo+PiBtYWtlIHRpX2FtNjJ4
X3NrX2RlZmNvbmZpZwo+PiBtYWtlIHRpLWszLXI1LWxvYWRlcgo+Pgo+PiAgIEJJTk1BTiAgLmJp
bm1hbl9zdGFtcAo+PiBJbWFnZSAndGlib290My1hbTYyeC1ocy1ldm0uYmluJyBpcyBtaXNzaW5n
IG9wdGlvbmFsIGV4dGVybmFsIGJsb2JzIGJ1dCBpcyBzdGlsbAo+PiBmdW5jdGlvbmFsOiB0aS1m
cy1lbmMuYmluIHN5c2Z3LWlubmVyLWNlcnQKPj4KPj4gL2Jpbm1hbi90aWJvb3QzLWFtNjJ4LWhz
LWV2bS5iaW4vdGktZnMtZW5jLmJpbgo+PiAodGktc3lzZncvdGktZnMtZmlybXdhcmUtYW02Mngt
aHMtZW5jLmJpbik6Cj4+ICAgIE1pc3NpbmcgYmxvYgo+Pgo+PiAvYmlubWFuL3RpYm9vdDMtYW02
MngtaHMtZXZtLmJpbi9zeXNmdy1pbm5lci1jZXJ0Cj4+ICh0aS1zeXNmdy90aS1mcy1maXJtd2Fy
ZS1hbTYyeC1ocy1jZXJ0LmJpbik6Cj4+ICAgIE1pc3NpbmcgYmxvYgo+Pgo+PiBJbWFnZSAndGli
b290My1hbTYyeC1ocy1mcy1ldm0uYmluJyBpcyBtaXNzaW5nIG9wdGlvbmFsIGV4dGVybmFsIGJs
b2JzIGJ1dCBpcwo+PiBzdGlsbCBmdW5jdGlvbmFsOiB0aS1mcy1lbmMuYmluIHN5c2Z3LWlubmVy
LWNlcnQKPj4KPj4gL2Jpbm1hbi90aWJvb3QzLWFtNjJ4LWhzLWZzLWV2bS5iaW4vdGktZnMtZW5j
LmJpbgo+PiAodGktc3lzZncvdGktZnMtZmlybXdhcmUtYW02MngtaHMtZnMtZW5jLmJpbik6Cj4+
ICAgIE1pc3NpbmcgYmxvYgo+Pgo+PiAvYmlubWFuL3RpYm9vdDMtYW02MngtaHMtZnMtZXZtLmJp
bi9zeXNmdy1pbm5lci1jZXJ0Cj4+ICh0aS1zeXNmdy90aS1mcy1maXJtd2FyZS1hbTYyeC1ocy1m
cy1jZXJ0LmJpbik6Cj4+ICAgIE1pc3NpbmcgYmxvYgo+Pgo+PiBJbWFnZSAndGlib290My1hbTYy
eC1ncC1ldm0uYmluJyBpcyBtaXNzaW5nIG9wdGlvbmFsIGV4dGVybmFsIGJsb2JzIGJ1dCBpcyBz
dGlsbAo+PiBmdW5jdGlvbmFsOiB0aS1mcy1ncC5iaW4KPj4KPj4gL2Jpbm1hbi90aWJvb3QzLWFt
NjJ4LWdwLWV2bS5iaW4vdGktZnMtZ3AuYmluCj4+ICh0aS1zeXNmdy90aS1mcy1maXJtd2FyZS1h
bTYyeC1ncC5iaW4pOgo+PiAgICBNaXNzaW5nIGJsb2IKPj4KPj4gICBPRkNISyAgIC5jb25maWcK
Pj4KPj4gU28sIHdlIHNob3VsZCBhZGQgdGktazMtYm9vdC1maXJtd2FyZSBpbiBkZXBlbmRlbmNp
ZXMgdG8gYXZvaWQgYnVpbGRpbmcKPj4gdGktazMtcjUtbG9hZGVyIGJlZm9yZSB0aS1rMy1ib290
LWZpcm13YXJlLgo+Pgo+PiBXaGVuIGJ1aWxkaW5nIHRoZSBBTTYgZGVmY29uZmlnLCB0aGUgYnVp
bGQgb3JkZXIgaXMgb3JkZXJlZCBhbHBoYWJldGljYWxseSBieQo+PiBkZWZhdWx0IGFuZCB0aS1r
My1ib290LWZpcm13YXJlIGlzIGluc3RhbGxlZCBiZWZvcmUgdGktazMtcjUtbG9hZGVyLgo+Pgo+
IAo+IE9LLCB0aGlzIGlzIGEgdmFsaWQgcG9pbnQuIEFueXdheSB3aGF0IHlvdSBzdWdnZXN0IGZv
cmNlIHNlbGVjdCBvciBhCj4gZGVwZW5kLiBJZiB5b3UgaGF2ZSBtb3JlIHBvaW50cywgaXMgYmV0
dGVyIHRvIHdyaXRlIGRvd24gYWxsIG9mCj4gdGhlbSBpbiBvbmUgcmV2aWV3LCBhbmQgbm90IHNw
bGl0IGFzIG5vdyBldmVyeSBuZXcgcGF0Y2hlc2V0LiBXaGF0IGRvIHlvdSB0aGluaz8KPiAKCkkg
cmV2aWV3ZWQgdGhlIHNlcmllcyBhbHJlYWR5IGFuZCBtYWtlIHNvbWUgc3VnZ2VzdGlvbnMgdGhh
dCB3ZXJlIG5vdCBpbmNsdWRlZC4KU2FtZSBhYm91dCB0aGUgcmV2aWV3IGZyb20gQnJ5YW4gKHRo
aXMgb25lKSBhbmQgQW5kcmVhcyAobWFrZSBIUy1GUyB0aGUgZGVmYXVsdApmb3IgQU02MiBhbmQg
QU02NCkuCgpJJ20gd29ya2luZyBvbiBhIFYxMSBpbmNsdWRpbmcgc29tZSBCdWlsZHJvb3QgcmV3
b3JrLCB0aGUgQlNQIGl0c2VsZiBpcyBvay4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiBNaWNo
YWVsCj4gCj4+IEJlc3QgcmVnYXJkcywKPj4gUm9tYWluCj4+Cj4+Cj4+Pgo+Pj4gfkJyeWFuCj4+
Cj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
