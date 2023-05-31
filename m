Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D3BC77B7A
	for <buildroot@archiver.kernel.org>; Wed, 31 May 2023 16:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2ED182EB5;
	Wed, 31 May 2023 16:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2ED182EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FVVyRSVZvvce; Wed, 31 May 2023 16:21:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2E5482B3E;
	Wed, 31 May 2023 16:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2E5482B3E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A9761BF37C
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 16:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3157D82B3E
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 16:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3157D82B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SgPpMP9Uay2S for <buildroot@lists.busybox.net>;
 Wed, 31 May 2023 16:21:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B84782136
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B84782136
 for <buildroot@buildroot.org>; Wed, 31 May 2023 16:21:31 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f68fc6b479so61631015e9.2
 for <buildroot@buildroot.org>; Wed, 31 May 2023 09:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685550089; x=1688142089;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LVtmEaekJb/oqe1o6ti7Pt/gJYiCy12BzfcpAwcyQRc=;
 b=N2ANujpx6T1fXWw4AeZtyRPLoO+bAUwluEe2vZ5wLq7pjiKg9EoQAUY8Ygdl1GtL9M
 RAsb8EJo5Azy1Aa6eeM0QJudxm2u+m6aMw8YtRT9JwmUPKSZdnpoAf6K2M3MWif11rmH
 H81b1ChDgFN2UDj/A/P4mnvGX/gUF1Zg9cDHKxkHQT9NJvg/NNHPZGtJASLhXkmrPGZA
 iFm/XYgS7/W41OvRlMT94f7RSFparK3elXbYn74se7owEWFsriqmcMax19DCy8kzAzxf
 YdU3cvhCEkiSV9zSYrMmz/RdzpfmzADqSRhMDvBsakrp0rbPRvr0x3svgaWSGkh4dWo6
 8d0Q==
X-Gm-Message-State: AC+VfDyisd46muTSJ5wKefYdacbzg6YkaXfogjs2oN3J5ZEj55W9M2VR
 UhqG0e7IGQvaLD80n8SM+nfosw==
X-Google-Smtp-Source: ACHHUZ45rabh8C3ef3deqZE873puD6KmBkSau9A8vLRq+TRKfXovhUkI0WRmkxuM47qPsXgwf8PTdQ==
X-Received: by 2002:a5d:6809:0:b0:309:4999:7549 with SMTP id
 w9-20020a5d6809000000b0030949997549mr4267930wru.46.1685550089317; 
 Wed, 31 May 2023 09:21:29 -0700 (PDT)
Received: from [10.5.3.217]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a5d564c000000b0030af31c8c63sm6592897wrw.47.2023.05.31.09.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 09:21:29 -0700 (PDT)
Message-ID: <9ef183c1-d6cf-5bbf-af7a-da7911195aa7@smile.fr>
Date: Wed, 31 May 2023 18:21:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20230527211144.2136991-1-romain.naour@gmail.com>
 <87v8gctidk.fsf@dell.be.48ers.dk>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <87v8gctidk.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1685550089; x=1688142089;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LVtmEaekJb/oqe1o6ti7Pt/gJYiCy12BzfcpAwcyQRc=;
 b=yo+NwlH3Psmz84q6jtCucUVXYIdHhRoMQ7RxAWlFvGsEfAeByNWDy5yGDrBSgk929/
 CQUYyYXmzPNLwzZAe64ONu6OxvHu4G4NEHKnB4DoO7ZtYjlFUlnlPvcED7d7dcBitRRE
 NgvtDPZlvjrv8XnQ0xIq8k8Qf9BtMsAtl8+0Hxk4WKDGMXXYl7bkA9yA51UVYb2WmcCL
 OhdjPy1uFceJblygSt3L2raGUBA9gLNFtZePuj9atZJskx4VaUHEMVDyQtrBu73ObNbY
 1u69x4O9OFiDM5wgYHpiL+CcVSmAxye0uWuB3sJjfCiUQtEmLJhKr2eJyAkZiIFG2qwn
 cH5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=yo+NwlH3
Subject: Re: [Buildroot] [PATCH] support/dependencies: requires cmake >= 3.19
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpMZSAyOC8wNS8yMDIzIMOgIDIwOjM0LCBQZXRlciBLb3JzZ2FhcmQgYSDD
qWNyaXTCoDoKPj4+Pj4+ICJSb21haW4iID09IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdt
YWlsLmNvbT4gd3JpdGVzOgo+IAo+ICA+IGxpYmp4bCByZXF1aXJlcyBjbWFrZSAzLjE5IHNpbmNl
IHZlcnNpb24gdjAuNyBkdWUgdG8gdGhlCj4gID4gbmV3IGJlaGF2aW9yIG9mIGNtYWtlIFsxXS4K
PiAKPiAgPiAtLSBDb25maWd1cmluZyBkb25lCj4gID4gQ01ha2UgRXJyb3IgYXQgY21ha2UvRmlu
ZExDTVMyLmNtYWtlOjQwIChhZGRfbGlicmFyeSk6Cj4gID4gICBJTlRFUkZBQ0VfTElCUkFSWSB0
YXJnZXRzIG1heSBvbmx5IGhhdmUgd2hpdGVsaXN0ZWQgcHJvcGVydGllcy4gIFRoZQo+ICA+ICAg
cHJvcGVydHkgIklOQ0xVREVfRElSRUNUT1JJRVMiIGlzIG5vdCBhbGxvd2VkLgo+ICA+IENhbGwg
U3RhY2sgKG1vc3QgcmVjZW50IGNhbGwgZmlyc3QpOgo+ICA+ICAgdGhpcmRfcGFydHkvQ01ha2VM
aXN0cy50eHQ6MTE0IChmaW5kX3BhY2thZ2UpCj4gCj4gID4gVGhlIHBvcnRhYmlsaXR5IGlzc3Vl
IGhhcyBhbHJlYWR5IGJlZW4gcmVwb3J0ZWQgdXBzdHJlYW0gWzJdLgo+IAo+ICA+IEZpeGVzOgo+
ICA+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNDMy
MjgxOTA5NQo+IAo+ICA+IFsxXSBodHRwczovL2dpdGxhYi5raXR3YXJlLmNvbS9jbWFrZS9jbWFr
ZS8tL2NvbW1pdC9hZmI5OTg3MDRlNjdkM2QzY2U1YjI0YzExMmNiMDZlNzcwZmNhNzhkCj4gID4g
WzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9saWJqeGwvbGlianhsL2lzc3Vlcy8xNDI1Cj4gCj4gID4g
U2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+ICA+
IENjOiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+ICA+IC0tLQo+ICA+IFRoaXMgd2ls
bCBpbmNyZWFzZSB0aGUgYnVpbGQgdGltZSBpbiBnaXRsYWItY2kgc2luY2UKPiAgPiBvdXIgZG9j
a2VyIGltYWdlIHByb3ZpZGUgY21ha2UgMy4xOC4KPiAKPiBOb3Qgb25seSB0aGF0LCBhbHNvIHVz
ZXJzIG9uIEUuRy4gRGViaWFuIHN0YWJsZS4gTGlianhsIHdhcyBhZGRlZCBiYWNrCj4gaW4gTm92
ZW1iZXIsIHNvIHdlIHdpbGwgYWxzbyBuZWVkIHRvIGJhY2twb3J0IHRoaXMgdG8gMjAyMy4wMi54
IDovCj4gCj4gRG8gd2UgaGF2ZSBhbnkgYWx0ZXJuYXRpdmVzPwo+IAoKTWF5YmUgd2UgaGF2ZSB0
byBjaGFuZ2UgdGhlIHJ1bGUgdG8gdXBkYXRlIHRoZSBjbWFrZSBtaW5pbXVtIHZlcnNpb24uCgpX
ZSB1cGRhdGVkIHRoZSBjbWFrZSBtaW5pbXVtIHdoZW4gYXQgbGVhc3Qgb25lIHBhY2thZ2UgcmVx
dWlyZWQgYSBuZXcgY21ha2UgdmVyc2lvbjoKCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9lZTg2MGNlM2RjM2RhZGE0ZWU0YWY0MWRkMGQwZWVlN2Mw
NDg5YTI4CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21t
aXQvM2FiOGFlZmE4N2Y5ZTZiYzQ1MWU5OGI4OWQ2M2QwMThmYWM2MDNkZgoKSW4gc3VwcG9ydC9k
ZXBlbmRlbmNpZXMvY2hlY2staG9zdC1jbWFrZS5tayB3ZSBjYW4gZG8gc29tZXRoaW5nIGxpa2UK
KHNpbXBsZSBidXQgbm90IGdyZWF0Li4uKToKCmlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCSlhMKSx5
KQpCUjJfQ01BS0VfVkVSU0lPTl9NSU4gPSAzLjE5CmVsc2UKQlIyX0NNQUtFX1ZFUlNJT05fTUlO
ID0gMy4xOAplbmRpZgoKb3IgYWRkIGEgbmV3IEtjb25maWcgQlIyX0hPU1RfQ01BS0VfQVRfTEVB
U1RfMy4xOSBhbmQgbWFrZSBCUjJfQ01BS0VfVkVSU0lPTl9NSU4KY29uZmlndXJhYmxlIChub3Qg
Z3JlYXQgZWl0aGVyKS4KCkJlc3QgcmVnYXJkcywKUm9tYWluCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
