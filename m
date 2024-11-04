Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E97FD1BDC3
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 16:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45F0E40555;
	Mon,  4 Nov 2024 16:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Z-vKEq0sMID; Mon,  4 Nov 2024 16:54:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 247BB40565
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 247BB40565;
	Mon,  4 Nov 2024 16:54:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA74BB8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 16:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8E5280E52
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 16:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53oxbsOQnXZ0 for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 16:54:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.219.170;
 helo=mail-yb1-f170.google.com; envelope-from=bryce.d.johnson@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB82080E9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB82080E9F
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB82080E9F
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 16:54:12 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e30eca40dedso3552336276.3
 for <buildroot@buildroot.org>; Mon, 04 Nov 2024 08:54:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730739251; x=1731344051;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aT7MOJ4Ated+7QfFOFpPuaMfn+iDobvoL8baJL3LVsw=;
 b=t3hn/kQvrkRA/ffRBzdbw535trmVgx6vOI2iVvwoH+HsJjdrIiynadz8TEXwlCSYXm
 8zOGeCMq9rd6C1iuleHm017jy1hJCQFhSbkXIRCrcmyMSPPrXCbSgrdoyX6yh2LxA4XM
 BHzOPSsF1KEhHnEKbsli6lthmUcUuOHaYjQ1AcapVzkyw4qzPAxEt8yWDH1cvJnmKG9P
 rBBXaK4VFNxfZtKzisuAlEaRQMQfix9518qKExE1Eyu5YpttQ6bh6ZQnme5M8f0R5qLI
 weSvd2aZGYbn8gvHUz7w68yZOWSX0ooZ8C+fRTHVsJKXtoBH/2rYoaXIWdqokE7bo3RC
 krhw==
X-Gm-Message-State: AOJu0Yy/4rO57qBdHW7wWuVI+HN2Iws5NawP+9NHHd/YXE26+vyc207h
 GHozrPVLInfwGQbotI+NVL8nG8y9QPaB4Cj4NuzW4nAdHakIW3ImlXPq4g==
X-Google-Smtp-Source: AGHT+IEZGdoSit52Rv9JAStnFh8PGCMD/kq1n+5qVmwZwqr7Cti1SG/NeU/4ZG6zsRKTIk6TCHbzGw==
X-Received: by 2002:a05:690c:6c8c:b0:6e3:3019:6aad with SMTP id
 00721157ae682-6ea64b2f0f5mr120173477b3.20.1730739251584; 
 Mon, 04 Nov 2024 08:54:11 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6ea55c48a47sm18610307b3.81.2024.11.04.08.54.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 08:54:11 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6ea5003deccso45245797b3.0
 for <buildroot@buildroot.org>; Mon, 04 Nov 2024 08:54:11 -0800 (PST)
X-Received: by 2002:a05:690c:380a:b0:6e2:ac0a:8926 with SMTP id
 00721157ae682-6ea64aa6f72mr131089807b3.9.1730739251027; Mon, 04 Nov 2024
 08:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20241022225457.568323-1-bryce@redpinelabs.com>
 <20241022225457.568323-3-bryce@redpinelabs.com>
 <20241030220902.yo475pa5avafzo4c@bryanbrattlof.com>
 <CADXxVSKZPX68AMzYhu7zyV7sKmfUdVkvX8+d=vprh5GOMEW6eQ@mail.gmail.com>
In-Reply-To: <CADXxVSKZPX68AMzYhu7zyV7sKmfUdVkvX8+d=vprh5GOMEW6eQ@mail.gmail.com>
From: Bryce Johnson <bryce@redpinelabs.com>
Date: Mon, 4 Nov 2024 09:54:00 -0700
X-Gmail-Original-Message-ID: <CADXxVSLLzk=Ct_ca93b337bqDuUNORnF602T+snxV+5-_L97nQ@mail.gmail.com>
Message-ID: <CADXxVSLLzk=Ct_ca93b337bqDuUNORnF602T+snxV+5-_L97nQ@mail.gmail.com>
To: Bryan Brattlof <bb@ti.com>
Cc: buildroot@buildroot.org, Xuanhao Shi <X15000177@gmail.com>, 
 Anand Gadiyar <gadiyar@ti.com>
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=redpinelabs.com
Subject: Re: [Buildroot] [PATCH 3/3] boot/ti-k3-r5-loader: use
 HOST_ARM_GNU_TOOLCHAIN_SUPPORTS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBOb3YgNCwgMjAyNCBhdCA5OjUy4oCvQU0gQnJ5Y2UgSm9obnNvbiA8YnJ5Y2VAcmVk
cGluZWxhYnMuY29tPiB3cm90ZToKPgo+IEhleSBCcnlhbiwKPiBOb3Qgc3VyZSBvbiB0aGF0IG9u
ZS4gIEkgdGhpbmsgdGhlIEJSMl9hYXJjaDY0IGlzIHRoZXJlIHNpbmNlIHRoZSBhbTYqCj4gdGhh
dCB1c2UgdGhlIHRpLWszLXI1LWxvYWRlciBhcmUgYWxsIGFhcmNoNjQgYXBwbGljYXRpb24gcHJv
Y2Vzc29ycwo+IGV2ZW4gdGhvdWdoIHRoZSBSNSBpcyAzMmJpdD8gIE15IGd1ZXNzIGlzIGl0IHBy
b2JhYmx5IGlzbid0IG5lZWRlZC4KPiBBbnkgcmVhc29uIHNvbWVvbmUgd291bGQgd2FudCB0byBi
dWlsZCB0aGUgYW02MiogYXMgMzItYml0LCB0aGVuIHRoZXJlCj4gbWlnaHQgYmUgYW4gaXNzdWUg
d2l0aCBoYXZpbmcgdGhhdCB0aGVyZS4KPgo+IEJyeWNlCj4KCgpPb3BzLCB0b3AgcG9zdGVkIGJ5
IGFjY2lkZW50IQoKQnJ5Y2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
