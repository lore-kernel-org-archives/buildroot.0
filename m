Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AEAC3DA60
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 22:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84EAB40163;
	Wed, 17 Jul 2024 22:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5lDK7MpN_1zn; Wed, 17 Jul 2024 22:06:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 531A240194
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 531A240194;
	Wed, 17 Jul 2024 22:06:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B829B1BF354
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 22:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5DD3819ED
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 22:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1UdwIyelk-S3 for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 22:06:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 854B4819D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 854B4819D1
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 854B4819D1
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 22:06:53 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-44930ea05b8so929281cf.1
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 15:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721254012; x=1721858812;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Das8bqrPG1Fs2WRCXvcJ+pzCD4L4a2r9j315ezp/5E8=;
 b=kIpRgSTKAn7VDuuqFPOcZxFJzwE8qq4s3b/XmZT9Cy4vSPKpq3hkBeqUB4driGAxK9
 zBgQRKNq3vl9yyEklKwoOhJOpKilyVQTAIhmQOhZDRcHwChBLnB4IhZHzDlktBZZq5SM
 bDR9R7QLuAkdH2MbZkHQ/+DQLXQ7oLfMaua3XVKQKHiA8IhDCMsMTMGbJUc7a4/l3wm8
 YVqwBkfeLbFacck9aU6VofIy++XHo3JZZRFfjjnQckt4PbRX2vSTKm1udp8i+T4yPwHx
 Xab+0X7imaaKSrG42qPsLMPzgfrht23YiqeY+Cik+ReFlDUSJK0r+odkAwMVC+GkDWSR
 Z2JA==
X-Gm-Message-State: AOJu0YyLuGCsL2gj9AkzB32pZ6MZHCQRcuX22UYLd1P8u2au5tWb98g3
 bon/o3inrgNYN+x9a1Q1NfAKUl1aXUV/1Im8xxbC/Ke2UdsXCVzR
X-Google-Smtp-Source: AGHT+IH4mRHI9MuMEfMI3I5X9gJd+NQlZ8dB4x/CbDE5HcbJ+67WyCL0ITR+lF6V44rrRKNUejalPA==
X-Received: by 2002:a05:622a:58f:b0:44c:2c6b:9a73 with SMTP id
 d75a77b69052e-44f86e61998mr43762941cf.57.1721254012216; 
 Wed, 17 Jul 2024 15:06:52 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 d75a77b69052e-44f5b7bb9absm52719331cf.7.2024.07.17.15.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 15:06:51 -0700 (PDT)
Message-ID: <57bbc792-5d28-4f2d-b33f-f0735c31fbae@gmail.com>
Date: Wed, 17 Jul 2024 15:06:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <DM4PR02MB9216BC15AD2F3FEE125A71118AA32@DM4PR02MB9216.namprd02.prod.outlook.com>
 <20240717221000.5ced2d0d@windsurf>
 <b03840bf-6a53-4db7-ac58-ce1cc2587b8c@gmail.com>
 <20240717235322.5f90b271@windsurf>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240717235322.5f90b271@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721254012; x=1721858812; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Das8bqrPG1Fs2WRCXvcJ+pzCD4L4a2r9j315ezp/5E8=;
 b=MB9uDJ5dh+bz5NMurW4n7RuZZLm7vccIgfOSXvqHLJpcYA107jbDO1kL0tehHh0vgx
 43TSigZaAZPBXKPxr5OKerTjSc+OjaKkiyV50QhBd3DuMttjkWnp69Xlrl1EHPjAjT8D
 lfy2N7W+xEmt9XQDlseU9pm72lp+LLZKZjBJholSFxPfLTEsAPemqaq2Rauxffz9TFrp
 isCHEbYFYHG7tjBMDZXLVyVRczu/HSWMxiFm73/FMLklirP+NrYPZb0BH68ckaip252T
 4bkq+OkM3LG02durIvIME/OpIw+xiR8Hxv1wISd0SHUgQXgCyEqkYJTh/kdCUXKlCkl0
 5K9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MB9uDJ5d
Subject: Re: [Buildroot] Year 2038 time util issue - Build failure in
 2024.02.x
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
Cc: "Karicheri, Murali" <Murali.Karicheri@sandc.com>, "Karicheri,
 Murali via buildroot" <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNy8xNy8yNCAxNDo1MywgVGhvbWFzIFBldGF6em9uaSB3cm90ZToKPiBIZWxsbyBGbG9yaWFu
LAo+IAo+IE9uIFdlZCwgMTcgSnVsIDIwMjQgMTQ6MzM6MDMgLTA3MDAKPiBGbG9yaWFuIEZhaW5l
bGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4+IFRoaXMgbG9va3Mgc2ltaWxh
ciB0byB3aGF0IEkgZW5jb3VudGVyZWQgYSBmZXcgZGF5cyBhZ28sIHRoZSBhY3R1YWwKPj4gaXNz
dWUgd2FzIHRoYXQgbGlic2FuaXRpemVyIHdhcyByZWZlcmVuY2luZyBzY3NpL3Njc2kuaCAoc29y
cnkgYWJvdXQgdGhlCj4+IG1lc3NhZ2UgYmVpbmcgaW4gRnJlbmNoLCBoZSBoZSk6Cj4gCj4gSSB0
aGluayBJIHNob3VsZCBiZSBhYmxlIHRvIHJlYWQgRnJlbmNoIDopCj4gCj4+IC4uLy4uLy4uLy4u
L2xpYnNhbml0aXplci9zYW5pdGl6ZXJfY29tbW9uL3Nhbml0aXplcl9wbGF0Zm9ybV9saW1pdHNf
cG9zaXguY3BwOjEyODoxMDoKPj4gZXJyZXVyIGZhdGFsZTogc2NzaS9zY3NpLmjCoDogTm8gc3Vj
aCBmaWxlIG9yIGRpcmVjdG9yeQo+PiAgICAgMTI4IHwgI2luY2x1ZGUgPHNjc2kvc2NzaS5oPgo+
PiAgICAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fgo+PiBjb21waWxhdGlvbiB0ZXJtaW7D
qWUuCj4gCj4gSSBhbSBub3Qgc3VyZSB0aGlzIGlzIHRoZSBzYW1lIGlzc3VlLiBJbmRlZWQsIEkg
ZG9uJ3Qgc2VlIHdoeSB0aGlzCj4gbWlzc2luZyA8c2NzaS9zY3NpLmg+IHdvdWxkIGJlIGNhdXNl
ZCBieSBCUjJfVElNRV9CSVRTXzY0PXkuCj4gCj4gSG93ZXZlciwgSSBzZWUgc29tZSBob3N0LWdj
Yy1maW5hbCBmYWlsdXJlcyBpbiBvdXIgYXV0b2J1aWxkZXJzIHRoYXQKPiBzZWVtIHJlbGF0ZWQg
dG8gQlIyX1RJTUVfQklUU182NCwgc3VjaAo+IGFzIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm5ldC9yZXN1bHRzL2ZmMi9mZjJkYmZkYWJmMGJiNmEwZDgyZWE4YTgwMTIyYWI5N2ZkNzViZDNm
L2J1aWxkLWVuZC5sb2c6Cj4gCj4gL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS0w
L291dHB1dC0xL2hvc3QvaTY4Ni1idWlsZHJvb3QtbGludXgtZ251L3N5c3Jvb3QvdXNyL2luY2x1
ZGUvZmVhdHVyZXMtdGltZTY0Lmg6MjY6NTogZXJyb3I6ICNlcnJvciAiX1RJTUVfQklUUz02NCBp
cyBhbGxvd2VkIG9ubHkgd2l0aCBfRklMRV9PRkZTRVRfQklUUz02NCIKPiAKPiBJIGRvbid0IGZp
bmQgeW91ciA8c2NzaS9zY3NpLmg+IGlzc3VlIGluIG91ciBhdXRvYnVpbGRlcnMgdGhvdWdoLiBE
bwo+IHlvdSBoYXZlIGEgZGVmY29uZmlnIHRoYXQgcmVwcm9kdWNlcyB0aGUgaXNzdWU/IDxzY3Np
L3Njc2kuaD4gaXMKPiBzdXBwb3NlZCB0byBiZSBpbnN0YWxsZWQgYnkgZ2xpYmMuCgpUaGlzIGlz
IG5vdCBoYXBwZW5pbmcgd2l0aCBhIGRlZmNvbmZpZywgaG93ZXZlciBpdCBpcyBjdXJyZW50bHkg
CmhhcHBlbmluZyBhZnRlciByZWZyZXNoaW5nIG15IGV4aXN0aW5nIC5jb25maWcgZmlsZToKCmh0
dHBzOi8vZ2lzdC5naXRodWIuY29tL2ZmYWluZWxsaS84ZmU3OTg4Yzg2ZWU4YTMwMTZiODkzMjY4
YjlhMmY0OQoKVGhhbmtzIQotLQpGbG9yaWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
