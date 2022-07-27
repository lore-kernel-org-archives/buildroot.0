Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B77C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 08:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 356A040996;
	Wed, 27 Jul 2022 08:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 356A040996
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIvAf8czKEbP; Wed, 27 Jul 2022 08:31:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4DD04098E;
	Wed, 27 Jul 2022 08:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4DD04098E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AC901BF59A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55E7781AC4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55E7781AC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bxXRoZtU5rqX for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 08:31:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E264181AC1
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E264181AC1
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 08:31:08 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id n185so10080952wmn.4
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 01:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r1QX7fjH0JIw4UWpiUOxh1jyje18aC8LDJsMixJ5SzM=;
 b=kpoCcnRxZDncZ3qoSMjyX7vMW0hrOZAl+IiIFVdTqNZIOvEyNyDilNY/G4ZxX/fJSv
 0DrZs1iMbtvEkcice2Jtolfm+n0arc7nqyAsb1GBMLqGQyLxeIjA/fyBUmZMgBaGpezD
 gMhxVx27YSKOtpNl+KLpoOBwgEQaJRQoNVVhTgdOrtWnHrFWqIjo170xdHZKVvJvWLp0
 RUCXqOVAgnn7iRmK2jiyjOXUTPBtvDjkGGdtTeaVIUP23/AJm5VK5+b0y6wqkMv75E+s
 sKf1neYoWZbkvIr4OWEGeK0s0ep4zv3Gs8vysJoq11Zz0boVRYCEV10OBL7xG2zGQBwP
 /45w==
X-Gm-Message-State: AJIora/1ZAZOiKBACHda0YWSPjPIkTEK1nLptrgOtOxJxCIBiR4lcbun
 7OqD6Qzy/R+J6mhZG8RASmij1g==
X-Google-Smtp-Source: AGRyM1vSikeFfxdNZov7RP8eIFa4y0MuhPe2LZdgYKM21kP0DWFoOnUYZbxWvD7Fe7RuRgMRr81C5w==
X-Received: by 2002:a1c:e90c:0:b0:3a1:7527:cd3c with SMTP id
 q12-20020a1ce90c000000b003a17527cd3cmr2115819wmc.91.1658910666679; 
 Wed, 27 Jul 2022 01:31:06 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:86bb:8231:62d7:1874?
 ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a5d65cd000000b0021e47386eb8sm16655642wrw.2.2022.07.27.01.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 01:31:06 -0700 (PDT)
Message-ID: <9c04ed8a-6059-c3c3-d82e-207b7646ce63@smile.fr>
Date: Wed, 27 Jul 2022 10:31:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20220601210939.2350383-1-aperez@igalia.com>
 <20220601210939.2350383-2-aperez@igalia.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220601210939.2350383-2-aperez@igalia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=r1QX7fjH0JIw4UWpiUOxh1jyje18aC8LDJsMixJ5SzM=;
 b=VtSOcmUtQM6dVla/NEuNIakM/SWepbsKlPvEamDzGYYEpPnTM2wVgc4fHic9KjpZKP
 8HBFlAgAUFUs+WzNtdgbndzRdxE1OTWJ3SStc0wFns6rDiFTHd05JUCVOTw3hfFSy1KA
 5cG23lti3ukL011R+09nqOe7v/H08lFUJEZzu4Jm7Tq3K7k0d+jBp1wK5Wa9sDyvXOQi
 aMw8vbq9v8np/47N5Tvpdm1TArDnaaIV/HXJraADkuBI/2DR84usDqZ509+g1r3JKJ0D
 aRugohdRwfB4otw+C+q7I5wxm5NW60lr+ZtxpISXowCC44esEy44LGpv6VLLqgvpfqP5
 XJnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=VtSOcmUt
Subject: Re: [Buildroot] [PATCH 2/2] package/webkitgtk: support game
 controllers via libmanette
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWRyaWFuLAoKTGUgMDEvMDYvMjAyMiDDoCAyMzowOSwgQWRyaWFuIFBlcmV6IGRlIENh
c3RybyBhIMOpY3JpdMKgOgo+IEFkZCBzdXBwb3J0IGZvciB0aGUgR2FtZXBhZCBBUEkgaW4gd2Vi
a2l0Z3RrLCBkZXBlbmRpbmcgb24KPiBsaWJtYW5ldHRlLCB3aGljaCBpcyB1c2VkIGZvciBpbXBs
ZW1lbnRpbmcgYWNjZXNzIHRvIGdhbWUKPiBjb250cm9sbGVycy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KClJldmlld2VkLWJ5
OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KCkJlc3QgcmVnYXJkcywKUm9t
YWluCgo+IC0tLQo+ICBwYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsgfCA4ICsrKysrKyst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rIGIvcGFja2FnZS93ZWJr
aXRndGsvd2Via2l0Z3RrLm1rCj4gaW5kZXggMzliMTZhOTBlNy4uMDdmYzk4YzVmNiAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsKPiArKysgYi9wYWNrYWdlL3dl
YmtpdGd0ay93ZWJraXRndGsubWsKPiBAQCAtMTgsNyArMTgsNiBAQCBXRUJLSVRHVEtfREVQRU5E
RU5DSUVTID0gaG9zdC1ydWJ5IGhvc3QtcHl0aG9uMyBob3N0LWdwZXJmIFwKPiAgCWxpYnRhc24x
IGxpYnhtbDIgbGlieHNsdCBvcGVuanBlZyBzcWxpdGUgd2VicCB3b2ZmMgo+ICBXRUJLSVRHVEtf
Q09ORl9PUFRTID0gXAo+ICAJLURFTkFCTEVfQVBJX1RFU1RTPU9GRiBcCj4gLQktREVOQUJMRV9H
QU1FUEFEPU9GRiBcCj4gIAktREVOQUJMRV9HRU9MT0NBVElPTj1PRkYgXAo+ICAJLURFTkFCTEVf
R1RLRE9DPU9GRiBcCj4gIAktREVOQUJMRV9NSU5JQlJPV1NFUj1PTiBcCj4gQEAgLTcxLDYgKzcw
LDEzIEBAIGVsc2UKPiAgV0VCS0lUR1RLX0NPTkZfT1BUUyArPSAtREVOQUJMRV9JTlRST1NQRUNU
SU9OPU9GRgo+ICBlbmRpZgo+ICAKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9MSUJNQU5FVFRFKSx5
KQo+ICtXRUJLSVRHVEtfQ09ORl9PUFRTICs9IC1ERU5BQkxFX0dBTUVQQUQ9T04KPiArV0VCS0lU
R1RLX0RFUEVOREVOQ0lFUyArPSBsaWJtYW5ldHRlCj4gK2Vsc2UKPiArV0VCS0lUR1RLX0NPTkZf
T1BUUyArPSAtREVOQUJMRV9HQU1FUEFEPU9GRgo+ICtlbmRpZgo+ICsKPiAgIyBPbmx5IG9uZSB0
YXJnZXQgcGxhdGZvcm0gY2FuIGJlIGJ1aWx0LCBhc3N1bWUgWDExID4gV2F5bGFuZAo+ICAKPiAg
IyBHVEszLVgxMSB0YXJnZXQgZ2l2ZXMgT3BlbkdMIGZyb20gbmV3ZXIgbGliZ3RrMyB2ZXJzaW9u
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
