Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3E9C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 15:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A024F60769;
	Sat, 13 Jul 2024 15:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A48xuUWdWxpf; Sat, 13 Jul 2024 15:52:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A16F06076A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A16F06076A;
	Sat, 13 Jul 2024 15:52:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 374B21BF406
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 15:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 239C6410CA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 15:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QVzccuibqb97 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 15:51:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 713D8410B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 713D8410B0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 713D8410B0
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 15:51:57 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52e9944764fso3499971e87.3
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 08:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720885916; x=1721490716;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HWhnQgCmKA4dx/1fFx+um13wAiPBo2QteOrwT0LLtNQ=;
 b=jIox/I1lg8PPjJVqZXAc39sYly21C0xLiVNc8Sfvm7Uatv6p+pmdSCPEHRX54pp7mh
 xnMVaBpIGVTvnynODPvPk+Ig+Sk4/tGM55mXXxSdwVVsMR2IcGeI+HYcEymOH45Qnx9l
 gfUwZFNdQ0nH/SzWpx8f0I69+z9rt4DwzxUmE66IukdoPVWbGu95Or5wfA/fCIkL/+/5
 tNuWCvA4MEuvH9VjxFO7csbGl8eXuAlgHjopwst2qc4j8jcgcynTC4j3hQvMoO9Cd4Ox
 pofkvUa7hkMS4CSHav+6hGTOuK8NkFdX8xO18aS57eHcqEvgjco3SdjIvq+zZE3hpxE2
 wq/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDh3f9I2WHkK1uVpRgK5wXjKcBM+OnLThfH+3KHC2dgpHpqgEHoiBLIPVWCuW4T530ikv0wxTeao1dVmBdzpcjtypdpqutWw==
X-Gm-Message-State: AOJu0YxH+lhll5Qhsoe5Hn/8Rwt7A0LVNoGy8GnIYPChip4YClVyZsej
 /NHH65ypEWRTS/xBZERjHTzcQBK42LK1lbTLIzUeYD3GFC1gDjfcEp46bQgBBqK9whQCa6u2dUl
 LLIk=
X-Google-Smtp-Source: AGHT+IFATYZJmW0o5KQGmTvK88GfngcwusASc3R7LoBWGTN2gnNFHsT/IyvXA/OBGXIHL9EP20D8TA==
X-Received: by 2002:a05:6512:3f14:b0:52e:9c63:5fe8 with SMTP id
 2adb3069b0e04-52eb99caf73mr10450915e87.54.1720885915673; 
 Sat, 13 Jul 2024 08:51:55 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-708c0d018b3sm294678a34.60.2024.07.13.08.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 08:51:55 -0700 (PDT)
Message-ID: <65e540f9-101b-45f6-9ba7-fc8b12df49a1@smile.fr>
Date: Sat, 13 Jul 2024 17:51:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20240711222021.1553363-1-thomas.petazzoni@bootlin.com>
 <20240711222021.1553363-2-thomas.petazzoni@bootlin.com>
Content-Language: fr
In-Reply-To: <20240711222021.1553363-2-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720885916; x=1721490716; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HWhnQgCmKA4dx/1fFx+um13wAiPBo2QteOrwT0LLtNQ=;
 b=Yx1j2kzqg7hdprIEaamfnKUA3FxtIeF/CPsSrvk9289NkjAvFzxOWxBvWKrMWlDV2s
 DxeX/Rn/dzxPsCn5g8LnTKTh3tYWEUMrocMfcAv8Bpxhol50mYZ3UEZu5/lqqMiBBc/R
 X7vIEarWaUXlJ9GvGe0c3Zc39c4q22sRYL/mA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Yx1j2kzq
Subject: Re: [Buildroot] [PATCH 2/4] package/gdb: switch to gdb 14.x as the
 default
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMTIvMDcvMjAyNCDDoCAwMDoyMCwgVGhvbWFzIFBldGF6em9uaSB2
aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gTm93IHRoYXQgd2UgaGF2ZSBpbnRyb2R1Y2VkIHN1
cHBvcnQgZm9yIGdkYiAxNS54LCBzd2l0Y2ggdG8gZ2RiIDE0LngKPiBhcyB0aGUgZGVmYXVsdCB2
ZXJzaW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRh
enpvbmlAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvZ2RiL0NvbmZpZy5pbi5ob3N0IHwg
NiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nZGIvQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdl
L2dkYi9Db25maWcuaW4uaG9zdAo+IGluZGV4IGNmMmExZTRmMWYuLjU4NjAwMWNkM2IgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9nZGIvQ29uZmlnLmluLmhvc3QKPiArKysgYi9wYWNrYWdlL2dkYi9D
b25maWcuaW4uaG9zdAo+IEBAIC00MSw3ICs0MSw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9IT1NU
X0dEQl9TSU0KPiAgCj4gIGNob2ljZQo+ICAJcHJvbXB0ICJHREIgZGVidWdnZXIgVmVyc2lvbiIK
PiAtCWRlZmF1bHQgQlIyX0dEQl9WRVJTSU9OXzEzCj4gKwlkZWZhdWx0IEJSMl9HREJfVkVSU0lP
Tl8xNAo+ICAJZGVwZW5kcyBvbiAhQlIyX2FyYwo+ICAJaGVscAo+ICAJICBTZWxlY3QgdGhlIHZl
cnNpb24gb2YgZ2RiIHlvdSB3aXNoIHRvIHVzZS4KPiBAQCAtNzIsOSArNzIsOSBAQCBjb25maWcg
QlIyX0dEQl9WRVJTSU9OCj4gIAlzdHJpbmcKPiAgCWRlZmF1bHQgImFyYy0yMDIzLjA5LXJlbGVh
c2UiIGlmIEJSMl9hcmMKPiAgCWRlZmF1bHQgIjEyLjEiICAgICBpZiBCUjJfR0RCX1ZFUlNJT05f
MTIKPiAtCWRlZmF1bHQgIjEzLjIiICAgICBpZiBCUjJfR0RCX1ZFUlNJT05fMTMgfHwgIUJSMl9Q
QUNLQUdFX0hPU1RfR0RCCj4gKwlkZWZhdWx0ICIxMy4yIiAgICAgaWYgQlIyX0dEQl9WRVJTSU9O
XzEzCj4gIAkjIFdoZW4gbWFraW5nIDE0LnggdGhlIGRlZmF1bHQsIG9yIDE0LnggYmVjb21lcyB0
aGUgb2xkZXN0IHZlcnNpb24sCj4gIAkjIGJlIHN1cmUgdG8gdXBkYXRlIHRoZSB0YXJnZXQgdmFy
aWFudCB0byBwcm9wZXJseSBzZWxlY3QgbXBmci4KCkFwcGxpZWQgdG8gbWFzdGVyIGFmdGVyIGZp
eGluZyBtcGZyIGRlcGVuZGVuY3kgZm9yIHRoZSB0YXJnZXQgdmFyaWFudCwgdGhhbmtzLgoKQmVz
dCByZWdhcmRzLApSb21haW4KCgo+IC0JZGVmYXVsdCAiMTQuMiIgICAgIGlmIEJSMl9HREJfVkVS
U0lPTl8xNAo+ICsJZGVmYXVsdCAiMTQuMiIgICAgIGlmIEJSMl9HREJfVkVSU0lPTl8xNCB8fCAh
QlIyX1BBQ0tBR0VfSE9TVF9HREIKPiAgCWRlZmF1bHQgIjE1LjEiCSAgIGlmIEJSMl9HREJfVkVS
U0lPTl8xNQo+ICAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9HREIgfHwgQlIyX1BBQ0tBR0VfSE9T
VF9HREIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
