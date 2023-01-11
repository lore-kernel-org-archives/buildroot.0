Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E88C46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 15:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75D708209F;
	Wed, 11 Jan 2023 15:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75D708209F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CzWBBA6sJbwD; Wed, 11 Jan 2023 15:19:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CF4F81E12;
	Wed, 11 Jan 2023 15:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CF4F81E12
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7705B1BF3C0
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 15:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5289760B92
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 15:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5289760B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTCwuqBAbpDr for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 15:19:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62036607C9
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62036607C9
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 15:19:04 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id bk16so15356093wrb.11
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 07:19:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NLRiE3vz2HPM+VOIioN+pviWnuf/0E3osQgSa1Q2apk=;
 b=C3MfG8Pv616qRPwfAfoxbx+STGGC7dgJC/qKm6K81hvFRru+DRFH1ZMRpidv6J67rM
 a2Zt5AQnB7D2aAGMfyFTaoT7HSN09eF3k3oCDY0rRTEaO78RdVP5nMT14eNcJ30dYppP
 eBxR2tZiWqPBBbhZq40ENfUYVBoYmnFFIXS2Qs6Nr2nBZ/0/U+nBRcsihnE5XJ3wOqea
 mvvRrcoQZ4oIN1XJB16SEZeDXrR7oyDUxmiion4ibjtIeApUxikYyNuL4IJ37zqFmatO
 fk8MRfXIxFBT9Ajv2y+9PYpPc/Y+GUJ6PcgRxbjK/HBf3sokwbG8Qi1SFruqrVWDg/Jn
 kDXw==
X-Gm-Message-State: AFqh2kowEcA1sG1TWonNOTveClkyPSZ5A2idP1QUwuTMgkd1iuJJOmRV
 jWAqnFJ1Vzy+8ngEARx/5s3y7Q==
X-Google-Smtp-Source: AMrXdXu+r+WKpGmcViFEZa3t7d5mSgFBGJVDKKKKEx2rbN3BxoZ2705J1lDr2BzEtehX73i4BQUcyw==
X-Received: by 2002:a5d:640c:0:b0:29f:7c0c:5a46 with SMTP id
 z12-20020a5d640c000000b0029f7c0c5a46mr20672719wru.68.1673450342584; 
 Wed, 11 Jan 2023 07:19:02 -0800 (PST)
Received: from [10.5.3.94]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 w4-20020adfee44000000b0029100e8dedasm14041939wro.28.2023.01.11.07.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 07:19:02 -0800 (PST)
Message-ID: <c01c67cd-b4ce-a054-2b6b-47fbfcbf513a@smile.fr>
Date: Wed, 11 Jan 2023 16:19:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220728014402.142320-1-james.hilliard1@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220728014402.142320-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NLRiE3vz2HPM+VOIioN+pviWnuf/0E3osQgSa1Q2apk=;
 b=ahfWOOha5REdwd+WA5oBF2BYulpDAKZVQWd07gHjQ6wKE6eTIPGcgQ9K71hPef/lWb
 Foqy7OyqrHJ3U+gCsTp5dHniP7mAANOMhBjRsZt7SdC9smUjfQWAasw/vYKmWOL4CeSM
 r9QZCFYYZ+GyJ9SF50OIOBC7xTxarnpek9bGU21kAFregkjb4XaF95IZzhbJPJqDQgya
 gQOONs432LNKDQev2mm3/DhynMA7cIWT6m3qyfRPOrB1lVSHOvL6F4hTqR+DT0bPhDX8
 O+bBEUq903rP8Qpfg17E/Xll1LlMDSPC3081t/yu8mMLpMqhrsGa5XNlXJikdrFKD0KP
 S/QQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ahfWOOha
Subject: Re: [Buildroot] [PATCH 1/2] support/misc/toolchainfile.cmake.in:
 set PKG_CONFIG/CMAKE prefix paths
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsCgpMZSAyOC8wNy8yMDIyIMOgIDAzOjQ0LCBKYW1lcyBIaWxsaWFyZCBhIMOp
Y3JpdMKgOgo+IFRoZXNlIGFwcGVhciB0byBub3QgYmUgZ2V0dGluZyBzZXQgY29ycmVjdGx5IGFu
ZCBhcmUgbmVlZGVkIHdoZW4gdXNpbmcKPiBtZXNvbidzIHJlbG9jYXRhYmxlIHBrZ2NvbmZpZyBm
b3JtYXQuCgpIb3cgdGhpcyBjbWFrZSBmaWxlICh0b29sY2hhaW5maWxlLmNtYWtlLmluKSBpcyB1
c2VkIGJ5IGEgbWVzb24gcGFja2FnZSA/CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiAt
LS0KPiAgc3VwcG9ydC9taXNjL3Rvb2xjaGFpbmZpbGUuY21ha2UuaW4gfCA2ICsrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQv
bWlzYy90b29sY2hhaW5maWxlLmNtYWtlLmluIGIvc3VwcG9ydC9taXNjL3Rvb2xjaGFpbmZpbGUu
Y21ha2UuaW4KPiBpbmRleCA1ZDJiODY5NWI0Li4yYzZhZGZkMDJkIDEwMDY0NAo+IC0tLSBhL3N1
cHBvcnQvbWlzYy90b29sY2hhaW5maWxlLmNtYWtlLmluCj4gKysrIGIvc3VwcG9ydC9taXNjL3Rv
b2xjaGFpbmZpbGUuY21ha2UuaW4KPiBAQCAtOTEsNiArOTEsMTIgQEAgZW5kaWYoKQo+ICBpZihO
T1QgREVGSU5FRCBDTUFLRV9GSU5EX1JPT1RfUEFUSF9NT0RFX0lOQ0xVREUpCj4gICAgc2V0KENN
QUtFX0ZJTkRfUk9PVF9QQVRIX01PREVfSU5DTFVERSBPTkxZKQo+ICBlbmRpZigpCj4gK2lmKE5P
VCBERUZJTkVEIFBLR19DT05GSUdfVVNFX0NNQUtFX1BSRUZJWF9QQVRIKQo+ICsgIHNldChQS0df
Q09ORklHX1VTRV9DTUFLRV9QUkVGSVhfUEFUSCBPTikKPiArZW5kaWYoKQo+ICtpZihOT1QgREVG
SU5FRCBDTUFLRV9QUkVGSVhfUEFUSCkKPiArICBzZXQoQ01BS0VfUFJFRklYX1BBVEggIiR7UkVM
T0NBVEVEX0hPU1RfRElSfS9AQFNUQUdJTkdfU1VCRElSQEAvdXNyIikKPiArZW5kaWYoKQo+ICBz
ZXQoRU5We1BLR19DT05GSUdfU1lTUk9PVF9ESVJ9ICIke1JFTE9DQVRFRF9IT1NUX0RJUn0vQEBT
VEFHSU5HX1NVQkRJUkBAIikKPiAgCj4gICMgVGhpcyB0b29sY2hhaW4gZmlsZSBjYW4gYmUgdXNl
ZCBib3RoIGluc2lkZSBhbmQgb3V0c2lkZSBCdWlsZHJvb3QuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
