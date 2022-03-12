Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF9FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABE034048C;
	Sat, 12 Mar 2022 20:15:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9qMmaEY_LV5k; Sat, 12 Mar 2022 20:15:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35BC140486;
	Sat, 12 Mar 2022 20:15:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0AFEC1BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC1E760E63
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id geJP8Xi6Wlp4 for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:15:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E10460E56
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:15:50 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id bg10so26043844ejb.4
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 12:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=7x3VRVoBmrvRb2TRtmTz9Apwi0xQuV+xDKkgtd1AKuM=;
 b=UIKtadAzOP5BB0WWH61nKMeYaLR/NJ34ruaVAbOyvS2uUBEDErKSgQkYo/VST9SGiF
 CsjDzWAdCgh4xMX+k1845fMlAkx6IEEpQhRgP2ocn9ppZRKV66yIkyMeUhhFSMRzes7E
 gsgAav8aWXtdzg3KqV0NZJXgBCxlnX7DAppKdXaXgT6FcEaXbAnMRzua8UM98mCHAllG
 HNYqUM8wLhGcJI77JxNbl216CdMA21O6DsEfTpc0hdOMtOMgpBPpNJwQYxJx6YkLyeQO
 dqNTtwpwxMTq728AmONX8hohqnFpqo4tHTUFwTH+O+KAs4gvgLyPT++tsZdQB4EQq0Iz
 D0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7x3VRVoBmrvRb2TRtmTz9Apwi0xQuV+xDKkgtd1AKuM=;
 b=4XjG4pe2H11bjBpe+k7Cm7n+46X2uYnAmb/DpOwNMmeZdEvagIbBFuW+W6M0L3jmHe
 +FK4y+7JsHDz7U5VwHf+/e1TCyobw0pbgZyCCfdBq1115j2304dbBqD+bHpaxJNAPPN1
 ogqBUy/AHY+k9N1dTNBJoVNJwZsXEDv9QGqvlvqXWMo2r813nCIOUEH1AetvfsS/iCru
 H6dQo0ydvgoMkwusNPWBYrZRm3+4/HuqslL7eACRsPJjrMFxDZtEyUra34pzpNnJaB4w
 V1hANiy3uK3wCpKvlYutpF65qsYH5sYaGxl6a1NVJEGuPitkOjTTxMfLjO/zd2tKi7JZ
 k6kQ==
X-Gm-Message-State: AOAM531ZLO+AgvsquZiT2IPPq5iJVfxDcu9l3exbeYh6JhQJSLw3uqfQ
 J0tBr5Jp0hJNze+ftQ5yQvPRkp//WqBSKA==
X-Google-Smtp-Source: ABdhPJxIB0IF6uapv3ybpHr1LPSOoKzw6B4f8jeAmI0PeIJqPJbBnvCWkea8z8VZIdbvZdkX+rhRsQ==
X-Received: by 2002:a17:906:d964:b0:6ca:4019:3928 with SMTP id
 rp4-20020a170906d96400b006ca40193928mr13535353ejb.762.1647116148572; 
 Sat, 12 Mar 2022 12:15:48 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a17090649cc00b006d0bee77b9asm4742916ejv.72.2022.03.12.12.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 12:15:48 -0800 (PST)
Message-ID: <269e9b3e-35d0-a044-9d84-9e2073400852@mind.be>
Date: Sat, 12 Mar 2022 21:15:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220223211202.3412693-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220223211202.3412693-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/kismet: bump to version
 2022-02-R1
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

Ck9uIDIzLzAyLzIwMjIgMjI6MTIsIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4gTGlua2luZyB3
aXRoIC1sYXRvbWljIGlzIGhhbmRsZWQgYnkgY29uZmlndXJlLmFjIHNpbmNlIHZlcnNpb24KPiAy
MDIyLTAxLVIzIGFuZAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9raXNtZXR3aXJlbGVzcy9raXNtZXQv
Y29tbWl0L2JiZGZkMjFlMmI0MWJmNjk1MTNkZWQ1YWU1YWI1YTg5ZjIyYTk5MTIKPgo+IGh0dHBz
Oi8vd3d3Lmtpc21ldHdpcmVsZXNzLm5ldC9yZWxlYXNlL2tpc21ldC0yMDIyLTAyLVIxCj4gaHR0
cHM6Ly93d3cua2lzbWV0d2lyZWxlc3MubmV0L3JlbGVhc2Uva2lzbWV0LTIwMjItMDEtUjMKPiBo
dHRwczovL3d3dy5raXNtZXR3aXJlbGVzcy5uZXQvcmVsZWFzZS9raXNtZXQtMjAyMi0wMS1SMgo+
IGh0dHBzOi8vd3d3Lmtpc21ldHdpcmVsZXNzLm5ldC9yZWxlYXNlL2tpc21ldC0yMDIyLTAxLVIx
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdt
YWlsLmNvbT4KCiDCoEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogwqBSZWdhcmRzLAogwqBB
cm5vdXQKCj4gLS0tCj4gICBwYWNrYWdlL2tpc21ldC9raXNtZXQuaGFzaCB8IDIgKy0KPiAgIHBh
Y2thZ2Uva2lzbWV0L2tpc21ldC5tayAgIHwgNiArLS0tLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
a2lzbWV0L2tpc21ldC5oYXNoIGIvcGFja2FnZS9raXNtZXQva2lzbWV0Lmhhc2gKPiBpbmRleCA5
YTlkMjI2MGI5Li5mYzVmODU0YjdlIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uva2lzbWV0L2tpc21l
dC5oYXNoCj4gKysrIGIvcGFja2FnZS9raXNtZXQva2lzbWV0Lmhhc2gKPiBAQCAtMSwzICsxLDMg
QEAKPiAgICMgTG9jYWxseSBjb21wdXRlZAo+IC1zaGEyNTYgIDFjOGUzMWIxYmFiZGIwZmM5M2Fj
MzhmZDA3NzJhMjRkNGI0MGY4NjVmYmMyOTJmYThlYzdmNGExOGNlZDAxMzUgIGtpc21ldC0yMDIx
LTA4LVIxLnRhci54ego+ICtzaGEyNTYgIGFhYWU0NzQ3ZjE0NzM0YTczZjYwMWFmMDEzYzBlZWUy
NmUxMzY4MGY1ZTM2NzVkZmNlMDliN2RlMmU2OGI4YTggIGtpc21ldC0yMDIyLTAyLVIxLnRhci54
ego+ICAgc2hhMjU2ICA5M2M3ZjBkN2UzNTZiMGFiZmI2ZjQ5NGZmM2VhMzdmOTZhYmM4NGU5YTU2
MTliMjVkNGU0M2Y3NTUzYTU1NzM5ICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uva2lz
bWV0L2tpc21ldC5tayBiL3BhY2thZ2Uva2lzbWV0L2tpc21ldC5tawo+IGluZGV4IDgxOWVkNTEw
ZDcuLjM5OTJhMzkyZjggMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9raXNtZXQva2lzbWV0Lm1rCj4g
KysrIGIvcGFja2FnZS9raXNtZXQva2lzbWV0Lm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICAjCj4g
ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAgCj4gLUtJU01FVF9WRVJTSU9OID0gMjAyMS0w
OC1SMQo+ICtLSVNNRVRfVkVSU0lPTiA9IDIwMjItMDItUjEKPiAgIEtJU01FVF9TT1VSQ0UgPSBr
aXNtZXQtJChLSVNNRVRfVkVSU0lPTikudGFyLnh6Cj4gICBLSVNNRVRfU0lURSA9IGh0dHA6Ly93
d3cua2lzbWV0d2lyZWxlc3MubmV0L2NvZGUKPiAgIEtJU01FVF9ERVBFTkRFTkNJRVMgPSBcCj4g
QEAgLTI5LDEwICsyOSw2IEBAIGVuZGlmCj4gICAKPiAgIEtJU01FVF9DT05GX0VOViArPSBDWFhG
TEFHUz0iJChLSVNNRVRfQ1hYRkxBR1MpIgo+ICAgCj4gLWlmZXEgKCQoQlIyX1RPT0xDSEFJTl9I
QVNfTElCQVRPTUlDKSx5KQo+IC1LSVNNRVRfQ09ORl9FTlYgKz0gTElCUz0tbGF0b21pYwo+IC1l
bmRpZgo+IC0KPiAgIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCQ0FQKSx5KQo+ICAgS0lTTUVUX0RF
UEVOREVOQ0lFUyArPSBsaWJjYXAKPiAgIEtJU01FVF9DT05GX09QVFMgKz0gLS1lbmFibGUtbGli
Y2FwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
