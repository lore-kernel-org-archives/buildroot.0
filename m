Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BB0C64ED6
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 14:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BA768149E;
	Tue, 28 Feb 2023 14:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BA768149E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vPZjX3NnTEwM; Tue, 28 Feb 2023 14:38:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75F2481451;
	Tue, 28 Feb 2023 14:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75F2481451
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD9241BF279
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 14:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7CCA81451
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 14:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7CCA81451
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UcVQbYwBpfnL for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 14:38:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5E0F81076
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5E0F81076
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 14:38:34 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 m20-20020a17090ab79400b00239d8e182efso3088994pjr.5
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 06:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677595114;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/TlYiIVVDqQcOkL1FS8h9DJMAV6nwDZvfrFzN7tuTTs=;
 b=p8gLZMwBiSiysXHK3v8RiEAl19HvdK2vhMT+9v41AOpwoUBKHFYF1lT3foLtv4lqMr
 vdai2Xh5mVAO35CvFf6/LBibqEfraEKq1357wLw5KUea4wmb0NHreLlambIph+XV2rAR
 fbrNOmJqFiNBmm4MDfC1eHbg/9AFaseXFSeRdoZSYL1DwS2+FXD64GIk9Y29jxmh9TNL
 QD0O20fdtHn2yGcBSP4QUZi/8wMfgq21tU62IqReR5zbJ+u/3VV/E9GN+qB3CWvvBz6S
 bvl4bs6M+Q4fCq1bi+eTTGuZirVmjVWd/iX0gV1lQK0p1MkSafxnWVwJ1LYUlT6yWCba
 CLzg==
X-Gm-Message-State: AO0yUKUIOwoqNQ9zaUSsvYd7ObQgrkyQH5oVRFNrpPHGVinndWTz4Zg+
 w9fkCejuR2kM9hT8qxB/yUX50O9/jZ3SPNa0CUdpUQ==
X-Google-Smtp-Source: AK7set9UxiUgycfTAMgMEdRRrV+3sk1O+pqSsAZ1tanbKkzrTXwyWxY+j/1my6fvqabCT3XfSPJIeXBDpx/+qA0wHa0=
X-Received: by 2002:a17:903:31d6:b0:196:7567:ae2b with SMTP id
 v22-20020a17090331d600b001967567ae2bmr1063031ple.3.1677595113839; Tue, 28 Feb
 2023 06:38:33 -0800 (PST)
MIME-Version: 1.0
References: <20221224171920.11256-1-raphael.pavlidis@gmail.com>
 <20230222232157.380b6109@windsurf>
 <20230228130843.GC32199@carcass.dev.6wind.com>
In-Reply-To: <20230228130843.GC32199@carcass.dev.6wind.com>
From: stephane gonauer <stephane.gonauer@6wind.com>
Date: Tue, 28 Feb 2023 15:38:23 +0100
Message-ID: <CANqv2T3GWoqn6an34HQUW6njK2g=YZCqvoDMh-kfKooVacRMpA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=6wind.com; s=google; t=1677595114;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/TlYiIVVDqQcOkL1FS8h9DJMAV6nwDZvfrFzN7tuTTs=;
 b=BNTdU4j2ztSDAGF2+/CUIzpbHIe0xmyGHISPJqFYLmDmZA+QGnhLJPKTgs/yMuRclQ
 PHeVpw4GiCGfOndRpJgJRC2ekevdARPmHxX+hWVQdnNoRGduqlPSkHRjStmcXLWapTtJ
 PqC9ZkrNNcDLJjjGo7SJ0OdDVghZsEsvaf3UoA3rVzEaDOeCjrih3XQy9V8lwbr3Qyp0
 +CvUnnRqHrEtxSUM6jL3q4TreHxkJGi5GMpelCjG+0Ad0DlIAwuQbbGgqt9kDX3I290D
 US3mWcgQqlSNWqsxuJDmYebB5mEemcbsLCmyRE8wSWVV7Sn9o88yFuRieFr8W0QhGoAj
 Xc3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com
 header.a=rsa-sha256 header.s=google header.b=BNTdU4j2
Subject: Re: [Buildroot] [PATCH v4 1/1] package/shadow: new package
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
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpMZSBtYXIuIDI4IGbDqXZyLiAyMDIzIMOgIDE0OjA5LCBTdMOpcGhhbmUgR09OQVVFUgo8
c3RlcGhhbmUuZ29uYXVlckA2d2luZC5jb20+IGEgw6ljcml0IDoKPgoKPiA+IFdpdGggdGhvc2Ug
Y2hhbmdlcywgYXBwbGllZCB0byBvdXIgbmV4dCBicmFuY2guIFRoYW5rcyEKPiA+Cj4gPiBUaG9t
YXMKPgo+Cj4gSSBhbSB0ZXN0aW5nIHNoYWRvdyBwYWNrYWdlIGFuZCBJIHRoaW5rIHRoZXJlIG1h
eSBiZSBhIGNvbXBhdGliaWxpdHkgaXNzdWUuCj4gSSByZWJ1aWx0IHFlbXVfeDg2XzY0X2RlZmNv
bmZpZyB3aGVyZSBJIGFkZGVkIHRoZSBmb2xsb3dpbmcgcGFja2FnZXMgOgo+Cj4gQlIyX1BBQ0tB
R0VfTElOVVhfUEFNPXkKPiBCUjJfSU5JVF9TWVNURU1EPXkKPiBCUjJfUEFDS0FHRV9TSEFET1c9
eQo+Cj4KPiAjIEJSMl9UQVJHRVRfVUJPT1RfTkVUV09SSyBpcyBub3Qgc2V0CgoKVGhlIGlzc3Vl
IGNhbiBiZSByZXByb2R1Y2Ugd2l0aCBhIHNpbXBsZXIgY29uZmlndXJhdGlvbi4gRW5hYmxpbmcg
Ym90aApCUjJfUEFDS0FHRV9MSU5VWF9QQU0gYW5kIEJSMl9QQUNLQUdFX1NIQURPVyBicmVha3Mg
dGhlIGxvZ2luLgpIZXJlIGZvbGxvdyBhIGRlZmNvbmZpZyB0aGF0IHJlcHJvZHVjZXMgdGhlIGlz
c3VlIDoKCi9ldGMvcGFtLmQgcmVmZXJlbmNlIGEgc3lzdGVtLWF1dGggdGhhdCBpcyBub3QgcHJl
c2VudCBhbnl3aGVyZSBpbiB0aGUKYnVpbGQgZGlyZWN0b3J5LiBUaGlzIG1pZ2h0IGJlIHRoZSBy
b290IGNhdXNlIGJ1dCBJJ20gbm90IHN1cmUgaG93IHRvCnByb3Blcmx5IHRlc3QuCgotLS0tLS0t
LS0tLS0tLS0KdWlsZHJvb3QvY29uZmlncyQgY2F0IHFlbXVfeDg2XzY0X2RlZmNvbmZpZwpCUjJf
eDg2XzY0PXkKQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzE1PXkKQlIy
X1BFUl9QQUNLQUdFX0RJUkVDVE9SSUVTPXkKQlIyX1NZU1RFTV9ESENQPSJldGgwIgpCUjJfUk9P
VEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2FyZC9xZW11L3g4Nl82NC9wb3N0LWJ1aWxkLnNoIgpC
UjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC9xZW11L3Bvc3QtaW1hZ2Uuc2giCkJS
Ml9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iJChCUjJfREVGQ09ORklHKSIKQlIyX0xJTlVYX0tF
Uk5FTD15CkJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQpCUjJfTElOVVhfS0VSTkVM
X0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE1LjE4IgpCUjJfTElOVVhfS0VSTkVMX1VTRV9DVVNU
T01fQ09ORklHPXkKQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fQ09ORklHX0ZJTEU9ImJvYXJkL3Fl
bXUveDg2XzY0L2xpbnV4LmNvbmZpZyIKQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX0xJQkVM
Rj15CkJSMl9QQUNLQUdFX0xJTlVYX1BBTT15CkJSMl9QQUNLQUdFX1NIQURPVz15CkJSMl9UQVJH
RVRfUk9PVEZTX0VYVDI9eQojIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0CkJSMl9Q
QUNLQUdFX0hPU1RfUUVNVT15CkJSMl9QQUNLQUdFX0hPU1RfUUVNVV9TWVNURU1fTU9ERT15Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
