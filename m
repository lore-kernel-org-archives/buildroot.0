Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC60C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 19:15:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 447FA61075
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 19:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 447FA61075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 193D280D4B;
	Wed, 18 Aug 2021 19:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FJJ2muwhd9qw; Wed, 18 Aug 2021 19:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FB9780D50;
	Wed, 18 Aug 2021 19:15:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4AE751BF333
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 19:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 466C9401C4
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 19:15:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YqyDZXJPPbpi for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 19:15:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23C6040119
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 19:15:34 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so5111395wme.1
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 12:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ABWSOU92m5oU1g99fHBWgsvtADv3o+hDQRUaWuQT4zs=;
 b=rXVzufqC3J6ZoPZjHh77wpteA1zRM8WhnWLUWmB5nmDf1K3HE4zSUgwgUnFXPAxrVk
 xIUeLwZQ3CxueqwegblfDBp0F+9bFBLQupXY6i+PvMBFQiLfiP0CvMh+EqTVNbckvPL7
 cOtUfqVDdgTc+9CgVezWM0Ap03PNWeieBtQKzIBsFrInY8m9jKOMIk/eUDV5dBUg5rn9
 UHyTgcYVHb7RFQdN+itxcRxxANR8fmV1s2LIYum2i5Rn6xAKIytQ+Gi/cgtD/jreTOru
 nPbEeCjsctc0Q6xcBTCPyWHd8mhltKx3TDhBkWHiplkoQpbVHN8qW713OcWW744D7KW5
 dlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ABWSOU92m5oU1g99fHBWgsvtADv3o+hDQRUaWuQT4zs=;
 b=ZRaFDmg+u2UK/1BVFF51bKfKqygPiBQ6lr2rtnd5QcoBFu7ytvdeG5q9QVAE5O8Vfh
 fqghi6YDLd+K7CjSBp3OhAuyyQcME431qGuZ5iAT9frCuegHPAPWlQt/XpCdJkII67Th
 RYiSND+Wjul44XuqgNc/XWDFWGEOxHCw1y5TeO0hBohrUb1kAovfUmIjaFBJdVo1Uj+j
 4SM7erl/HDnxKfpJ0soGjM9v6z7novGK8Lz6o0vDWVt5H+5DjHfNE07sBiS9B6cZRcDX
 Y9WwDy2cnGfoPRdWtzmLWiDLTsPD28Ihmsr0cZgF+BOuH6ZDj8aUtRozzEoMp831tvfD
 aomw==
X-Gm-Message-State: AOAM5332OerjGW2oDQFCTt2eiIcezWM0YShe8bfbIwAXz7bEnVszkSxn
 olxB6NipVpDL9bpddCa8hqPh8TQWk5I=
X-Google-Smtp-Source: ABdhPJzg3ycWSeV4hAwEcszhj2hEegbhSM2mgNcC1t94Xsf+6/wIjmVWOVv2JQDx+0rYucGduVQxGg==
X-Received: by 2002:a7b:cf31:: with SMTP id m17mr9868797wmg.109.1629314132246; 
 Wed, 18 Aug 2021 12:15:32 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id l19sm642581wmi.4.2021.08.18.12.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 12:15:31 -0700 (PDT)
To: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
References: <2c8538b1-e378-7491-ea07-ebb0dbb8956f@inbox.ru>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <1130f671-8112-8e65-41a7-662efc4bfa96@gmail.com>
Date: Wed, 18 Aug 2021 21:15:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2c8538b1-e378-7491-ea07-ebb0dbb8956f@inbox.ru>
Content-Language: en-US
Subject: Re: [Buildroot] Segfault on init (gcc-11, glibc-2.32-37, linux-5.13)
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: bigunclemax@gmail.com, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gTWF4aW0sCgpMZSAwOC8wNy8yMDIxIMOgIDEwOjQ4LCBNYXhpbSBLb2NoZXRrb3YgYSDD
qWNyaXTCoDoKPiBIaSwgYWxsIQo+IAo+IEkgZm91bmQgc3VjaCBhIHByb2JsZW0gb24geDg2IChn
Y2MtMTEsIGdsaWJjLTIuMzItMzcsIGxpbnV4LTUuMTMpOgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiDCoMKgwqDC
oMKgwqDCoCAwLjA3MzExMTEgU3BlY3RyZcKgIDI6IFNwZWN0cmUgbWl0aWdhdGlvbjoga2VybmVs
IG5vdCBjb21waWxlZCB3aXRoIHJldHBvbGkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYXVhaWxhYmxldAo+IMKgwqDCoMKgwqDCoMKgIDAuMjg3ODZnIGF0aW8yMcKgwqDCoCBzZWdm
YXVsdCBhdCAxMCBpcCAwMDAwN2Y1ZjlhOGQ2ZTEwIHNwCj4gMDAwMDdmZmZhNzUxZjVjOCBlcnJv
ciA5IGluIElkLTIuMzIuc29mN2Y1ZjlhOGNkMDAwLjIwMDAwMQo+IMKgwqDCoMKgwqDCoMKgIDAu
Mjg4MjAwMSBDb2RlOiA5NyAwMSAwMCBlOCAxMiA2MCAwMCAwMCA5OCA4NiA5YyAyOSAwMCBlOSBl
OCBmYiBmZiBmZiBPZgo+IGxmIDg5IDAwIDAwIDAwIDAwIDAwIDkxIDU3IDkxIDU2IDkxIDU1IDkx
IDU0IDk5IDg5Cj4gZmMgNTUgOTggODkgZDUgNTMgPDY5PiA5OCBydGIgMDkgMjUgMTAgMDAgMDAg
MDAgOTggODEgZWMgYTAgMDAgMDAgMDAgOTggODkgNzkgMjkKPiAxMCA5OAo+IMKgwqDCoMKgwqDC
oMKgIDAuMjg4NzkyMSBFZXJuZWwgcGFHYW1lOmljIC0gbm90IHN5bmNpbmc6IEF0dGVtcHRlZCB0
byBraWxsIGluaXQuLAo+IGV4aXRjb2RlPTB4MDAwMDAwMDYKPiDCoMKgwqDCoMKgwqDCoCAwLjI4
OTAyNjEgQ1BVOiA5wqDCoMKgwqDCoMKgIEkgQ29tbTogaW5pdCBNb3QgdGFpbnRlZCA1LjEzLjAu
MyBFbAo+IMKgwqDCoMKgwqDCoMKgIDAgMjg5MjA5MSBIYXJkd2FyZcKgwqDCoMKgwqAgU3VwZXJt
aWNybyBTdXBlciBTZXJ1ZXJBbGxTU0gtSUlJOUYsIEJJT1MgMi41Cj4gMTEsMjYsMDIwCj4gwqDC
oMKgwqDCoMKgwqAgMCAyODk5OTMxIENhbGwgVHJhY2U6Cj4gwqDCoMKgwqDCoMKgwqAgMCAyODk1
MjExIGR1bXBfc3RhY2t0MHg2LDB4ODgKPiDCoMKgwqDCoMKgwqDCoCAwIDI4OTYyMzEgcGFuaWN0
T3hmZHQweDI4Nwo+IMKgwqDCoMKgwqDCoMKgIDAgMjg5NzE2MSBkb2V4aXQuY29sZHQweDIxLDB4
NjAKPiDCoMKgwqDCoMKgwqDCoCAwIDI4OTgyNTEgZG9fZ3JvdXBleGl0dE94MzYsMHhhMAo+IMKg
wqDCoMKgwqDCoMKgIDAgMjg5OTM3MSBnZXQgc2lnbmFsdE94ZTN0MHg2ZjAKPiDCoMKgwqDCoMKg
wqDCoCAwIDI5MDA5NTEgYXJjaF9kb19zaWdvYWwgb3IgcmVzdGFydHRPcmQ2dDB4NmMwCj4gwqDC
oMKgwqDCoMKgwqAgMjkwMTkyMSA3IF9yb3Vfc3Bpbl91bmxvY2tfaXJncmVzdG9yZXRPcmxhck94
MjAKPiDCoMKgwqDCoMKgwqDCoCAwIDI5MDM5ODEgNyBmb3JjZSBzaWdfIGluZm8gdG8gdGFza3RP
cmNPdE94ZjAKPiDCoMKgwqDCoMKgwqDCoCAwIDI5MDk4OTEgZXhpdCB0byB1c2VyIG1vZGUgcHJl
cGFyZXRyZCxPeDE4Cj4gwqDCoMKgwqDCoMKgwqAgMCAyOTA2MzcxIGlyZ2VudHJ5ZXhpdCB0byB1
c2VyIG1vZGV0TzB4OXQweDMwMAo+IMKgwqDCoMKgwqDCoMKgIDAgMjkwNzgxMSBpcmdlbnRyeWV4
aXR0MHgzMywweDkwCj4gwqDCoMKgwqDCoMKgwqAgMCAyOTA4OTkxIGV4Y19wYWdlX2ZhdWx0dDB4
MmMwQXg2MzAKPiDCoMKgwqDCoMKgwqDCoCAwIDI5MTAxNjEgNyBleGl0X3RvIHVzZXIgbW9kZSBw
cmVwYXJldDB4MywweDE4MAo+IMKgwqDCoMKgwqDCoMKgIDAgMjkxMTY5MSA3IGFzbWV4Y19wYWdl
IGZhdWx0dE94OHQweDMwCj4gwqDCoMKgwqDCoMKgwqAgMCAyOTEyOTgxIGFzbWV4Y19wYWdlX2Zh
dWx0dE94bGV0MHgzMAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCSVA6IDAwMzM6
MHg3ZjVmOWE4ZDZlMTAKPiDCoMKgwqDCoMKgwqDCoCAwLjI5MTUzNTEgQ29kZTogOTcgMDEgMDAg
ZTggMTIgNjAgMDAgMDAgOTggODYgOWMgMjkgMDAgZTkgZTggZmIgZmYgZmYgT2YKPiBsZiA4OSAw
MCAwMCAwMCAwMCAwMCA5MSA1NyA5MSA1NiA5MSA1NSA5MSA1NCA5OSA4OQo+IGZjIDU1IDk4IDg5
IGQ1IDUzIDw2OT4gOTggcnRiIDA5IDI1IDEwIDAwIDAwIDAwIDk4IDgxIGVjIGEwIDAwIDAwIDAw
IDk4IDg5IDc5IDI5Cj4gMTAgOTgKPiDCoMKgwqDCoMKgwqDCoCAwLjI5MjEyMTHigKIKPiDCoMKg
wqDCoMKgwqDCoCAwLjI5MjI4NTEgQkFYOiAwMDAwN2ZmZmE3NTFmNjkwIEJCWDogMDAwMDdmZmZh
NzUxZjZiMCBCQ1g6IDAwMDA3ZjVmOWE4ZjhhZTgKPiDCoMKgwqDCoMKgwqDCoCAwIDI5MjUwOTEg
Qk9YOiAwMDAwN2ZmZmE3NTFmNjg4IEJTSTogMDAwMDdmNWY5YThmODc1MCBFREk6IDAwMDA3ZjVm
OWE4ZWUxOTEKPiDCoMKgwqDCoMKgwqDCoCAwIDI5MjczMTEgQkJQOiAwMDAwN2ZmZmE3NTFmNjg4
IEIwODogMDAwMDdmZmZhNzUxZjZiMCBCMDk6IDAwMDAwMDAwMDAwMDAwMDAKPiDCoMKgwqDCoMKg
wqDCoCAwIDI5Mjk1NTEgQjEwOiAwMDAwMDAwMDcwMDAwMDIyIEVsbDogMDAwMDAwMDAwMDAwMDAz
MiBCMTI6IDAwMDA3ZjVmOWE4ZWUxOTEKPiDCoMKgwqDCoMKgwqDCoCAwIDI5MzE3NzEgQjEzOiAw
MDAwN2Y1ZjlhOGY4NzUwIEIxOTogMDAwMDdmZmZhNzUxZjY4OCBCMTU6IDAwMDAwMDAwNmZmZmZm
OTEKPiDCoMKgwqDCoMKgwqDCoCAwIDI5MzkwOTEgRWVybmVsIE9mZnNldDogT3hsNmMwMDAwMCBm
cm9tIE94ZmZmZmZmZmY4MTAwMDAwMCAocmVsb2NhdGlvbgo+IHJhbmdlOiBPeGZmZmZmZmZmODAw
MDAwMDAtT3hmZmZmZmZmZmJmZmZmZmZmNwo+IMKgwqDCoMKgwqDCoMKgIDAgMjkzNzkwMSAtSSBl
bmQgRWVyb2VsIHBhbmljIC0gbm90IHN5bmNpbmc6IEF0dGVtcHRlZCB0byBraWxsIGluaXQsCj4g
ZXhpdGNvZGU9MHgwMDAwMDAwNiAxLS0tCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEkgZGlkIHNvbWUgYWRk
aXRpb25hbCB0ZXN0IHdpdGggZGlmZmVyZW50IGdjYy9saWJjIHZhcmlhbnRzOgo+IMKgwqDCoMKg
IGdjYyB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaWJjIHzCoMKgwqDCoMKg
wqDCoMKgIHJlc3VsdCB8Cj4gLS0tLS0tLS0tfC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tfC0tLS0t
LS0tLS0tLS0tLS18Cj4gwqAgMTEuMS4wIHzCoMKgIDIuMzItMzctZzc2MGUxZDI4NzggfMKgwqDC
oMKgwqDCoCBTRUdGQVVMVCB8Cj4gwqAgMTAuMy4wIHzCoMKgIDIuMzItMzctZzc2MGUxZDI4Nzgg
fMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBPSyB8Cj4gwqAgMTAuMy4wIHzCoMKgwqDCoMKgIHVD
bGliYy1uZy0xLjAuMzggfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBPSyB8Cj4gwqAgMTEuMS4w
IHzCoMKgwqDCoMKgIHVDbGliYy1uZy0xLjAuMzggfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBP
SyB8Cj4gwqAgMTEuMS4wIHzCoMKgwqDCoMKgIHVDbGliYy1uZy0xLjAuMzggfMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBPSyB8Cj4gwqAgMTEuMS4wIHzCoMKgIDIuMzItNDktZzI3ZTg5MmY2NjAg
fMKgwqDCoMKgwqDCoCBTRUdGQVVMVCB8Cj4gwqAgMTEuMS4wIHzCoMKgIDIuMzMtNDYtZ2VkZmQx
MTE5N2UgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBPSyB8Cj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gSXQgc2VlbXMgbGlrZSB3
ZSBuZWVkIHRvIGJ1bXAgZ2xpYmMgdmVyc2lvbiB0byAyLjMzLTQ2LWdlZGZkMTExOTdlIGZvciBn
Y2MgMTEgb24KPiB4ODYuCgpUaGFua3MgZm9yIHRoZSByZXBvcnQsIHRoZSBpbnZlc3RpZ2F0aW9u
IGFuZCB0aGUgdmVyc2lvbiBidW1wIQoKSW5kZWVkLCBCdWlsZHJvb3QgaW50ZXJuYWwgdG9vbGNo
YWlucyBhcmUgb25seSB0ZXN0ZWQgd2l0aCB1Y2xpYmMtbmcgdGhhbmtzIHRvCnRoZSBRZW11IGRl
ZmNvbmZpZ3MgcnVudGltZSB0ZXN0aW5nIGluIEdpdGxhYi4KClRoZSB0b29sY2hhaW4tYnVpbGRl
ciBwcm9qZWN0IGNhbiBjb21wbGV0ZSB0aGlzIHRlc3Rpbmcgb24gbXVzbCBhbmQgZ2xpYmMgYnV0
IGl0CnRha2UgbG9uZ2VyIHRpbWUgdG8gcnVuLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
