Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEC0C77B73
	for <buildroot@archiver.kernel.org>; Fri, 26 May 2023 23:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FBBB4047B;
	Fri, 26 May 2023 23:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FBBB4047B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nPbUIn2TUNqq; Fri, 26 May 2023 23:29:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA0564044C;
	Fri, 26 May 2023 23:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA0564044C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC2071BF33A
 for <buildroot@lists.busybox.net>; Fri, 26 May 2023 23:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF27C84D75
 for <buildroot@lists.busybox.net>; Fri, 26 May 2023 23:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF27C84D75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SBLA-NryomYe for <buildroot@lists.busybox.net>;
 Fri, 26 May 2023 23:29:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E74C284D70
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E74C284D70
 for <buildroot@buildroot.org>; Fri, 26 May 2023 23:29:28 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-64d44b198baso1051890b3a.0
 for <buildroot@buildroot.org>; Fri, 26 May 2023 16:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685143768; x=1687735768;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:reply-to:subject:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4JvKHAPGsTZErWKRbkKfIEnabQGBZfzoCqwZ9nlMyTo=;
 b=H1yWEmtC59lYCwqYKlWgIUOd55oRsSsjYGdA2wEUv+1RKBCOJ9Mb9IpMIKpoSf+Vm1
 kuJaUEjllV5ChEBq7v9OYPc3cXi3l37av7bz6agANdoD0giaX722Q8JxpSA1L4sTtv4/
 cCnhUYNP6AIe37jSFMCmIgRym61VSVP6/0cS+nm7X48Fc1127hnalSoRKBZxuYUKotaz
 B8CgM3Hcp1mZQiraI6LSDzWl97oo2h9MfUo1sPOtC1Gb5LifG6KI0gIyQNvDV1UfSASm
 FLGWc/Y0GojhefAAAo+n4oyz/rySkyDUxCsXoZNGmQrR+RJ873FxXHEkwYNtjav+Xuzp
 ZoTQ==
X-Gm-Message-State: AC+VfDxOfBSIMgTxuFBV2gV/n6WpdYXIYw2VaMFw/V4XVvc0pmJvoy79
 3R4s18FSBg2IA6DW7fP2Kh5U5bY4bXlbF6bWR5gdokii
X-Google-Smtp-Source: ACHHUZ7rG0z9tRlBBVpYSya3QBmVI5KzPuCxKXr4J7SRXCeA5kddQ12p4LrDkvUbWI7quaPOsekw3w==
X-Received: by 2002:a05:6a00:2e27:b0:64d:411b:3a0c with SMTP id
 fc39-20020a056a002e2700b0064d411b3a0cmr693472pfb.14.1685143767764; 
 Fri, 26 May 2023 16:29:27 -0700 (PDT)
Received: from [10.10.10.151] ([75.164.37.163])
 by smtp.gmail.com with ESMTPSA id
 d4-20020aa78684000000b0062de9ef6915sm3143887pfo.216.2023.05.26.16.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 16:29:26 -0700 (PDT)
X-Google-Original-From: Kris Bahnsen <kris@embeddedTS.com>
Message-ID: <bae326459a62944709e8a46f12cc410bd3f80db1.camel@embeddedTS.com>
To: buildroot@buildroot.org
Date: Fri, 26 May 2023 16:29:25 -0700
In-Reply-To: <20230511173451.2293054-1-kris@embeddedTS.com>
References: <20230511173451.2293054-1-kris@embeddedTS.com>
Organization: embeddedTS
User-Agent: Evolution 3.38.3-1+deb11u2 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embeddedts.com; s=google; t=1685143768; x=1687735768;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:reply-to:subject:message-id:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4JvKHAPGsTZErWKRbkKfIEnabQGBZfzoCqwZ9nlMyTo=;
 b=DlxNEtVAC0pTRlguNYf4UWDZAwT6/WD1hV90EaO+HGbXVBDymjM77tM4kuAjJzkQIy
 wS9Q0xxohbxXR8vUzVtPHE+KJjaEVrjjxqKTD7dj3w6jIV+V+LXE+/8B/kAT7AcTY9mR
 IbZ5it/Havg8iYDjtwETQwWpEonFfj23iaJr4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=embeddedts.com header.i=@embeddedts.com
 header.a=rsa-sha256 header.s=google header.b=DlxNEtVA
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: add QCA9377 BT
 firmware
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: kris@embeddedTS.com
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Mark Featherston <mark@embeddedts.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAyMDIzLTA1LTExIGF0IDEwOjM0IC0wNzAwLCBLcmlzIEJhaG5zZW4gdmlhIGJ1aWxk
cm9vdCB3cm90ZToKRGVwbG95IGZpcm13YXJlIGZpbGVzIGFzIHdlbGwuCgpTaWduZWQtb2ZmLWJ5
OiBLcmlzIEJhaG5zZW4gPGtyaXNAZW1iZWRkZWRUUy5jb20+CgpGb2xsb3dpbmcgdXAgd2l0aCB0
aGlzIHBhdGNoIHRvIHNlZSBpZiBpZiB0aGVyZSBhcmUgYW55IG91dHN0YW5kaW5nIHF1ZXN0aW9u
cwpvciBjb25jZXJucyBhbmQgaWYgdGhlcmUgaXMgYSB0aW1lbGluZSBvbiBnZXR0aW5nIHRoaXMg
bWVyZ2VkIGluLiBUaGFua3MuCgotS3JpcwoKPiAtLS0KPiDCoHBhY2thZ2UvbGludXgtZmlybXdh
cmUvQ29uZmlnLmluwqDCoMKgwqDCoMKgwqDCoCB8IDUgKysrKysKPiDCoHBhY2thZ2UvbGludXgt
ZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsgfCA2ICsrKysrKwo+IMKgMiBmaWxlcyBjaGFuZ2Vk
LCAxMSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGludXgtZmlybXdh
cmUvQ29uZmlnLmluIGIvcGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcuaW4KPiBpbmRleCA0
YjQxNWE3ZGEyLi40Y2FiNmU3OTM5IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGludXgtZmlybXdh
cmUvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcuaW4KPiBA
QCAtNjksNiArNjksMTEgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX1FVQUxD
T01NXzYxNzRBX0JUCj4gwqDCoMKgwqDCoMKgwqDCoGhlbHAKPiDCoMKgwqDCoMKgwqDCoMKgwqAg
RmlybXdhcmUgZmlsZXMgZm9yIFFDQSBSb21lIDYxNzRBIGJsdWV0b290aCBzdXBwb3J0Lgo+IMKg
Cj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9RVUFMQ09NTV85Mzc3X0JUCj4g
K8KgwqDCoMKgwqDCoMKgYm9vbCAiUXVhbGNvbW0gQXRoZXJvcyBRQ0E5Mzc3IEJsdWV0b290aCIK
PiArwqDCoMKgwqDCoMKgwqBoZWxwCj4gK8KgwqDCoMKgwqDCoMKgwqAgRmlybXdhcmUgZmlsZXMg
Zm9yIFFDQTkzNzcgYmx1ZXRvb3RoIHN1cHBvcnQuCj4gKwo+IMKgY29uZmlnIEJSMl9QQUNLQUdF
X0xJTlVYX0ZJUk1XQVJFX0FSMzAxMQo+IMKgwqDCoMKgwqDCoMKgwqBib29sICJRdWFsY29tbSBB
dGhlcm9zIDMwMTEiCj4gwqDCoMKgwqDCoMKgwqDCoGhlbHAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tayBiL3BhY2thZ2UvbGludXgtZmlybXdh
cmUvbGludXgtZmlybXdhcmUubWsKPiBpbmRleCA5ZDlkMTJiZDVmLi45NjcyYzdhMDdmIDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsKPiArKysg
Yi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rCj4gQEAgLTY1LDYgKzY1
LDEyIEBAIExJTlVYX0ZJUk1XQVJFX0ZJTEVTICs9IHFjYS9yYW1wYXRjaF91c2JfMDAwMDAzMDIu
YmluIHFjYS9udm1fdXNiXzAwMDAwMzAyLmJpbgo+IMKgTElOVVhfRklSTVdBUkVfQUxMX0xJQ0VO
U0VfRklMRVMgKz0gTElDRU5TRS5xY29tCj4gwqBlbmRpZgo+IMKgCj4gKyMgUXVhbGNvbW0gQXRo
ZXJvcyBRQ0E5Mzc3IEJsdWV0b290aAo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1X
QVJFX1FVQUxDT01NXzkzNzdfQlQpLHkpCj4gK0xJTlVYX0ZJUk1XQVJFX0ZJTEVTICs9IHFjYS9y
YW1wYXRjaF8wMDIzMDMwMi5iaW4gcWNhL252bV8wMDIzMDMwMi5iaW4KPiArTElOVVhfRklSTVdB
UkVfQUxMX0xJQ0VOU0VfRklMRVMgKz0gTElDRU5TRS5xY29tCj4gK2VuZGlmCj4gKwo+IMKgIyBS
ZWFsdGVrIDg3eHggQmx1ZXRvb3RoCj4gwqBpZmVxICgkKEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1X
QVJFX1JUTF84N1hYX0JUKSx5KQo+IMKgTElOVVhfRklSTVdBUkVfRklMRVMgKz0gXAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
