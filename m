Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB29C54E67
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 17:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EB66416F6;
	Fri, 15 Mar 2024 17:21:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cY5EMsmVSv7T; Fri, 15 Mar 2024 17:21:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2139D416FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2139D416FC;
	Fri, 15 Mar 2024 17:21:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D8791BF3B9
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 17:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A457822AF
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 17:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kj5SGCpYmSNY for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 17:21:30 +0000 (UTC)
X-Greylist: delayed 720 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 15 Mar 2024 17:21:29 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EB61F812D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB61F812D0
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=85.215.255.22; helo=mo4-p00-ob.smtp.rzone.de;
 envelope-from=nerv@dawncrow.de; receiver=<UNKNOWN> 
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB61F812D0
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 17:21:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1710522566; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=O6DJEhLVBf+nt0jvCaOZKxzI+bPRSt5HXr41eLR/eTqEAh02EQtW2KvsfRuDbsHZ1o
 6JzEeSadiE8GNMTFjSqbUZg04YbTUXchhQAiDLHyP/YgIrOmn/VimbnB6x+w1mnGk/i8
 pHgU23ZGymSFnxACbPP7bHWKqc4WtUy/bdpR28lC54a3JOvQI4m9pE8fuXABfHgG39Pj
 cMh/WMt3f3sGQruwvZA8AZBUkp4wbfkcMLxXCxeTHkvaQKnohmjiJ5sb+w8N+/e8wP3e
 FnN9tX4oFW2ax1Nyjl7zyAcg3Fou5WCIbNh8/qhQS/DI7baiCmVgbM0WwzkWSOfHrxIP
 VPkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1710522566;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
 Subject:Sender;
 bh=iuv02Mza5cx+wOaSlyOp3JbGaJzfVPhUeBijMQVq7jk=;
 b=cTWKMrPex2y4qcG4S1dxbL/pD7GR0oYVzg/DnVo34mAw3w9DrLbfizi7tEpsd+qYaM
 JqetiOGLL6CTnkxW0/rDJFqxWXamb64Qyd7zxBbC7uCBwq6zvifVw1vB6BQAsJeV+N4N
 2xywlVLNryKdDFU8QNzyMHOImWrIojrvICFwR6pzf9s633fUNPNLuXMCBsOTrf5qbbMN
 /tXNc+KyhFnMJWV+gXHdHRlA/j35qgyLEMW3zFASRyww70tDWXq6J/7W5eEEmYICCNqp
 HB4VAIuCLG3zkd4bUYZX4DMuYCV3OVuWDWJWozxxhwsfZOMvSOq/P9Op6XZTLF9CktZw
 UTXA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZ6bi4rK0b8tGDimOj4xRdCQCQ3Xwp6Xv9W1"
Received: from [192.168.178.46] by smtp.strato.de (RZmta 50.2.2 DYNA|AUTH)
 with ESMTPSA id j44b7302FH9Q3kT
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 15 Mar 2024 18:09:26 +0100 (CET)
Message-ID: <5f45377d-b15c-4448-96e2-2a66bf9505af@dawncrow.de>
Date: Fri, 15 Mar 2024 18:09:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-LU
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240314213252.346954-1-fontaine.fabrice@gmail.com>
From: =?UTF-8?Q?Andr=C3=A9_Zwing?= <nerv@dawncrow.de>
In-Reply-To: <20240314213252.346954-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1710522566; 
 s=strato-dkim-0002; d=dawncrow.de;
 h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
 Subject:Sender;
 bh=iuv02Mza5cx+wOaSlyOp3JbGaJzfVPhUeBijMQVq7jk=;
 b=sDXVtdbRxbWExVXZ+ofeq1FOVU0/GH7H9h5K3TvA01JFs/j2agUlxYoftl8A1Cda8U
 n99RVM0ZZa/lrbTPJckHoSwxZL8YM9m9sxAjOnPUxw19e3YSqv+O6MZ9ZgRaw/4Z16Me
 uOqa9NDwq47x1EcDPs0bcg6stojECuTl2lvSvQH/PhiVKw08pK0CaWhR/MviRMc7Uqwx
 +U5SHJdAFNZVHqI+sru1H9v+15BQaD0CHxDe+xKFP7szAkfam9/vuOe5hPL49LDozoif
 h7ZN6E26ILC5bVis3dKH3XSNFQ36ek7CyPFacHwMU5YTZEHQuAr/p+TEIbrTtCB9ZF0X
 wZsg==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1710522566; 
 s=strato-dkim-0003; d=dawncrow.de;
 h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
 Subject:Sender;
 bh=iuv02Mza5cx+wOaSlyOp3JbGaJzfVPhUeBijMQVq7jk=;
 b=BzasA+ABDyKK88oyUn1IAwTXwDBkh0ADj2EMDYyg7Lgs/a+HgP1taTATTCs+l2HsTT
 XD7ZAXSmCB47jI9eMWAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=dawncrow.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=dawncrow.de
 header.i=@dawncrow.de header.a=rsa-sha256 header.s=strato-dkim-0002
 header.b=sDXVtdbR; 
 dkim=pass header.d=dawncrow.de header.i=@dawncrow.de header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=BzasA+AB
Subject: Re: [Buildroot] [PATCH 1/1] package/libkrb5: force arm mode instead
 of Thumb mode
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

QW0gMTQuMDMuMjQgdW0gMjI6MzIgc2NocmllYiBGYWJyaWNlIEZvbnRhaW5lOgo+IEZpeCB0aGUg
Zm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgaW4gVGh1bWIgbW9kZToKPiAKPiAvdG1wL2NjZHpiQTJF
LnM6ODQ1OiBFcnJvcjogc2VsZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYG1jciBw
MTUsMCxyMixjNyxjMTAsNScgaW4gVGh1bWIgbW9kZQo+IAo+IEZpeGVzOgo+ICAgLSBodHRwOi8v
YXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8wOGJlMWZhMGZlZTBmMDU4MThjZDc4ZDQ3
MThjYWEzNDc2YzU3MGFlCj4gCj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9u
dGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gLS0tCj4gICBwYWNrYWdlL2xpYmtyYjUvbGlia3Ji
NS5tayB8IDcgKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmtyYjUvbGlia3JiNS5tayBiL3BhY2thZ2UvbGlia3Ji
NS9saWJrcmI1Lm1rCj4gaW5kZXggNjJhMzRiMjM3OS4uYzU4NzYzZWRkZCAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2xpYmtyYjUvbGlia3JiNS5tawo+ICsrKyBiL3BhY2thZ2UvbGlia3JiNS9saWJr
cmI1Lm1rCj4gQEAgLTMzLDYgKzMzLDEzIEBAIExJQktSQjVfQ09ORl9PUFRTID0gXAo+ICAgCS0t
d2l0aG91dC10Y2wgXAo+ICAgCS0tZGlzYWJsZS1ycGF0aAo+ICAgCj4gKyMgbGlia3JiNSBoYXMg
c29tZSBhc3NlbWJseSBmdW5jdGlvbiB0aGF0IGlzIG5vdCBwcmVzZW50IGluIFRodW1iIG1vZGU6
Cj4gKyMgRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3NvciBkb2VzIG5vdCBzdXBwb3J0IGBtY3IgcDE1
LDAscjIsYzcsYzEwLDUnIGluIFRodW1iIG1vZGUKPiArIyBzbywgd2UgZGVzYWN0aXZhdGUgVGh1
bWIgbW9kZQo+ICtpZmVxICgkKEJSMl9BUk1fSU5TVFJVQ1RJT05TX1RIVU1CKSx5KQo+ICtMSUJL
UkI1X0NPTkZfRU5WICs9IENGTEFHUz0iJChUQVJHRVRfQ0ZMQUdTKSAtbWFybSIKPiArZW5kaWYK
PiArCj4gICAjIEVuYWJsaW5nIHN0YXRpYyBhbmQgc2hhcmVkIGF0IHRoZSBzYW1lIHRpbWUgaXMg
bm90IHN1cHBvcnRlZAo+ICAgaWZlcSAoJChCUjJfU0hBUkVEX1NUQVRJQ19MSUJTKSx5KQo+ICAg
TElCS1JCNV9DT05GX09QVFMgKz0gLS1kaXNhYmxlLXN0YXRpYwoKCgpSZXZpZXdlZC1ieTogQW5k
csOpIFp3aW5nIDxuZXJ2QGRhd25jcm93LmRlPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
