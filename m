Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0AFD44166
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 10:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1EC08227E;
	Fri, 12 Dec 2025 10:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_Vh2dXFcNSX; Fri, 12 Dec 2025 10:43:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5DD58227F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765536187;
	bh=tb9MBd3VCGV43mtCWEI4YaPWEPSHlWkpw5mXdH/643g=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=nirGAzDkXFixCdgydfx4V1PJUhzr6ct3rucOR9aHhTX99qrG9Mo5wgEPzRBsm+Tzu
	 mzdlO9GCMGszf47E0RPBZ2xBjGizBhoUAb1dC44LL+hNYZV11ek/fCO+XbpniczX7T
	 ZwPwga9WJOV8Jvx+wDUMyHBD8J6RaqYEI3cwg8nBqdoT8c6MsA9QXxjYThk5lytJiY
	 WecrBMTCH0+1t4fXyx9IQSj0lbZ7vVgt5GEFNJ4loFPE1qJL7Q/poXU+m+QLESawW4
	 kcSHYwDLH5n/hBiNiG3YD8XosDklLQc5cYDZ5jldHw1J4DBCsH5r/HZTl0g/i3ECeP
	 TkECp4H2Cup/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5DD58227F;
	Fri, 12 Dec 2025 10:43:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33A332C6
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A0064020B
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ceMsPbZDyVG for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 10:43:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 39704401C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39704401C9
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39704401C9
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:43:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4688AC1935E;
 Fri, 12 Dec 2025 10:42:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3CE7A606DF;
 Fri, 12 Dec 2025 10:43:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 06C9C103C8DF5; Fri, 12 Dec 2025 11:42:59 +0100 (CET)
Date: Fri, 12 Dec 2025 11:42:58 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20251212114258.612d8673@kmaincent-XPS-13-7390>
In-Reply-To: <20251212112408.3e3b5b14@windsurf>
References: <20251212101533.820554-1-kory.maincent@bootlin.com>
 <20251212101533.820554-2-kory.maincent@bootlin.com>
 <20251212112408.3e3b5b14@windsurf>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765536181; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lL/YrdCgUtXgq39Gg5eezygFGzLtxD6hLa+js9D6tE0=;
 b=w60ZEDoqgc5mkGXkpIqx5LkHiuWT9m3r0DdqeMfIdxUZhDNjSNmsV95x9fo9OG3mMwHauP
 SYotzAY+BnoTSTmIB1WcqEZ3LbQAICiGRQL69pF5Tfde/Cx1A3W1Xt9+f33rqi10QfWjyA
 wFD5Wyfs/3XQb3a1o3fMEWuXCxoxPv9d421mucdkcxxJVVLGCkX148OclYddS2jyxjgx69
 MjIr6Jk8Um2XyrRQyJLqpxYMAqBjVhH335+4IVbPqKAqRDAU5P+v8/CaR9+90WIWWbBwqt
 qZYZLd65JZN4p96xiai8otNoJEMMuJ6BM5XICvvtS4jqcQeiEzDzQqFcUm2Cog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=w60ZEDoq
Subject: Re: [Buildroot] [PATCH 1/3] configs/beaglebone: Bump to Linux
 mainline
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Bajjuri Praneeth <praneeth@ti.com>, Bryan Brattlof <bb@ti.com>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAxMiBEZWMgMjAyNSAxMToyNDowOCArMDEwMApUaG9tYXMgUGV0YXp6b25pIDx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGVsbG8sCj4gCj4gT24gRnJpLCAx
MiBEZWMgMjAyNSAxMDoxNToyOCArMDAwMAo+IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRA
Ym9vdGxpbi5jb20+IHdyb3RlOgo+IAo+ID4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYmVhZ2xlYm9u
ZV9kZWZjb25maWcgYi9jb25maWdzL2JlYWdsZWJvbmVfZGVmY29uZmlnCj4gPiBpbmRleCA4NmJm
NmJjZTlhLi5iMjdiOTc5MTZlIDEwMDY0NAo+ID4gLS0tIGEvY29uZmlncy9iZWFnbGVib25lX2Rl
ZmNvbmZpZwo+ID4gKysrIGIvY29uZmlncy9iZWFnbGVib25lX2RlZmNvbmZpZwo+ID4gQEAgLTEs
NyArMSw2IEBACj4gPiAgQlIyX2FybT15Cj4gPiAgQlIyX2NvcnRleF9hOD15Cj4gPiAgQlIyX0FS
TV9GUFVfVkZQVjM9eQo+ID4gLUJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01f
Nl8xMj15ICAKPiAKPiBUaGlzIG5lZWRzIHRvIGJlIGtlcHQsIGJ1dCBhZGp1c3RlZCB0byB0aGUg
a2VybmVsIHZlcnNpb24gdXNlZC4KPiAKPiA+ICBCUjJfR0xPQkFMX1BBVENIX0RJUj0iYm9hcmQv
YmVhZ2xlYm9hcmQvYmVhZ2xlYm9uZS9wYXRjaGVzIgo+ID4gIEJSMl9ET1dOTE9BRF9GT1JDRV9D
SEVDS19IQVNIRVM9eQo+ID4gIEJSMl9ST09URlNfREVWSUNFX0NSRUFUSU9OX0RZTkFNSUNfTURF
Vj15Cj4gPiBAQCAtOSw5ICs4LDggQEAKPiA+IEJSMl9ST09URlNfUE9TVF9CVUlMRF9TQ1JJUFQ9
ImJvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZWJvbmUvcG9zdC1idWlsZC5zaCIKPiA+IEJSMl9ST09U
RlNfUE9TVF9JTUFHRV9TQ1JJUFQ9InN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCIKPiA+IEJS
Ml9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMgYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xlYm9u
ZS9nZW5pbWFnZS5jZmciCj4gPiBCUjJfTElOVVhfS0VSTkVMPXkgLUJSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX1RBUkJBTEw9eQo+ID4gLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1RBUkJBTExfTE9D
QVRJT049IiQoY2FsbAo+ID4gZ2l0aHViLGJlYWdsZWJvYXJkLGxpbnV4LDYuMTIuMzQtdGktYXJt
MzItcjEyKS9saW51eC02LjEyLjM0LXRpLWFybTMyLXIxMi50YXIuZ3oiCj4gPiAtQlIyX0xJTlVY
X0tFUk5FTF9ERUZDT05GSUc9ImJiLm9yZyIgK0JSMl9MSU5VWF9LRVJORUxfVVNFX0NVU1RPTV9D
T05GSUc9eQo+ID4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJib2FyZC90
aS9jb21tb24vYW0zMzV4L2xpbnV4LmNvbmZpZyIgIAo+IAo+IFlvdSBjYW4ndCBkbyB0aGlzOiB5
b3UgbmVlZCB0byBzcGVjaWZ5IGEgc3BlY2lmaWMga2VybmVsIHZlcnNpb24uCgpPaCBvay4gRGlk
bid0IGtub3cgdGhpcyBCUiBwb2xpY3kuCgpSZWdhcmRzLAotLSAKS8O2cnkgTWFpbmNlbnQsIEJv
b3RsaW4KRW1iZWRkZWQgTGludXggYW5kIGtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3Rs
aW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
