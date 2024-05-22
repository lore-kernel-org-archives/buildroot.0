Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE858C25B7A
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 11:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB8BD4064E;
	Wed, 22 May 2024 11:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_QMFGPzf_FF; Wed, 22 May 2024 11:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AD2440502
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AD2440502;
	Wed, 22 May 2024 11:58:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFB511C5AF1
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 11:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABC73402DA
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 11:58:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmLnTgsiaR_Z for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 11:58:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08B53402D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08B53402D2
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08B53402D2
 for <buildroot@buildroot.org>; Wed, 22 May 2024 11:58:42 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2e34e85ebf4so55440971fa.2
 for <buildroot@buildroot.org>; Wed, 22 May 2024 04:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716379121; x=1716983921;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rK2OtBwDV5n4yB/TRPZ05ttMe8Y1HfSm7xocI8FAK/4=;
 b=KKdhoKcfUwOey+Otqm4VKYCoF5UgIBuitlj19lEkpStDSrT1c8G6Pbq/er70tHv1BC
 6jADwInboK+ECtxAPwF6a+FRxhL4NNmbAg1ZdKpYrr/IPikaLhbFGk9Wv2qOCAGHr7pC
 eHppOkoKJytX//Z/S3QnQKZQKdUghMfbamheKmiUeA0z8l5C9+Oz2JxzoKjJKofC+7LF
 FNXqpcDs8f+yjldZVJVx6H/QP7LcKiRbghlS53jd/XEMLFZO7s1f15WEAA09zZgrTBtR
 DUzH8tEQywiwREnS+7QgmkTHhE1LHNCaRDPGSnE7AshTuR0Vab9Y+afN5Que26FckbCL
 11ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz59lkaSQgdAZDxJmLbVfkkdg9YEaewjipTLB7tWgqOv3VR6eL/wZUi7PmpJm+mqPFS89fTU+FkHG5BHJs4fD/PHzgN5gfPw==
X-Gm-Message-State: AOJu0Yyw7XhIAQEwjSY0jwkO3Uvtv9CyprCSnbh5jSm/sg+jJoA366+k
 DHpQp0hmaigbb2Sg42C2ZP1MrOkV9aPx7pkIqTExymfCcbPhe2+kJIh+JxG/i5rKszkk7Jxupq4
 9
X-Google-Smtp-Source: AGHT+IEdQvlaNVQT5GzAF6ZtIoAGwDIU3a8IVnOy67mQ9Kw4ulyrm8yEzoYW/O0CyIPMXZNBHCL4tg==
X-Received: by 2002:a2e:8295:0:b0:2e5:62e4:33ec with SMTP id
 38308e7fff4ca-2e949665ab7mr10753751fa.33.1716379120730; 
 Wed, 22 May 2024 04:58:40 -0700 (PDT)
Received: from [10.5.0.27] (202-122-190-109.dsl.ovh.fr. [109.190.122.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccee92bcsm496757725e9.36.2024.05.22.04.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 04:58:40 -0700 (PDT)
Message-ID: <584e2a5b-eec4-4097-a562-112e7fd79fac@smile.fr>
Date: Wed, 22 May 2024 13:58:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240521213814.763832-1-ju.o@free.fr>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240521213814.763832-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1716379121; x=1716983921;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rK2OtBwDV5n4yB/TRPZ05ttMe8Y1HfSm7xocI8FAK/4=;
 b=m9Fzc1yJ09BncUMPstjiwCQ3qMjiQ+uYCpTkQZ7YfNSr2EevEguPSmQqS29YFSl4yt
 kPyNkGK0n4datlCWV7te+fphRpb56tDtsWvrTb7dEpcYqDFR3irxOdgHPlzzZXc23J8+
 GgoGOKd0W7sYG1qNQAlym38si8HXZJQIZ0WQLLSuXkLoGnh+AFdQYWZ0NKsqpVaTaRTh
 9reT7jIO0SOARyhZG12Jdsah1oKtN+QzEl5/wyFM/OoxzGVu/JGb1b6kiR2+DT2vDUIy
 eL0X0Hjvt1lF10Uip0uoXQ0CzfO2byr40pga5HisLvuO6RQj+n2HBrEzbdTO7kipw7S6
 lEfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=m9Fzc1yJ
Subject: Re: [Buildroot] [PATCH 1/1] support/config-fragments: fix
 bootlin-x86-i686-musl
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLAoKTGUgMjEvMDUvMjAyNCDDoCAyMzozOCwgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBDb21taXQgYThiZTRhMDRhZCAic3VwcG9ydC9jb25maWctZnJhZ21lbnRzOiBy
ZXBsYWNlCj4gYnItaTM4Ni1wZW50aXVtLW1teC1tdXNsIiByZXBsYWNlZCB0aGlzIG9sZCB0b29s
Y2hhaW4gYnkKPiBib290bGluLXg4Ni1pNjg2LW11c2wuCj4gCj4gV2hlbiB1c2luZyB0ZXN0LXBr
ZyB3aXRoIGFsbCB0b29sY2hhaW5zLCBib290bGluLXg4Ni1pNjg2LW11c2wgaXMgYWx3YXlzCj4g
ZmFpbGluZy4gVGhlIGlzc3VlIGNhbiBiZSByZXByb2R1Y2VkIHdpdGggZm9yIGV4YW1wbGU6Cj4g
Cj4gICAgIHV0aWxzL3Rlc3QtcGtnIC1hIC1wIGJ1c3lib3gKPiAKPiBUaGUgaXNzdWUgY2FuIGFs
c28gYmUgcmVwcm9kdWNlZCB3aXRoIGEgc2ltcGxlIGNvbmZpZyBsaWtlOgo+IAo+ICAgICBjYXQg
PiAuY29uZmlnIDw8RU9GCj4gICAgIEJSMl9pMzg2PXkKPiAgICAgQlIyX1RPT0xDSEFJTl9FWFRF
Uk5BTD15Cj4gICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTj15Cj4gICAgIEJSMl9U
T09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9YODZfSTY4Nl9NVVNMX1NUQUJMRT15Cj4gICAgIEJS
Ml9QQUNLQUdFX0JVU1lCT1g9eQo+ICAgICBFT0YKPiAgICAgbWFrZSBvbGRkZWZjb25maWcKPiAg
ICAgbWFrZQo+IAo+IENvbXBpbGF0aW9uIGZhaWwgd2l0aCBvdXRwdXQ6Cj4gCj4gICAgIENhbm5v
dCBleGVjdXRlIGNyb3NzLWNvbXBpbGVyICcvaTU4Ni1saW51eC1nY2MnCj4gCj4gVGhpcyBpc3N1
ZSBoYXBwZW4gaXMgYmVjYXVzZSB0aGUgdG9vbGNoYWluIGNhbiBuZXZlciBiZSBzZWxlY3RlZC4K
PiAKPiBUaGUgY29uZmlnIGZyYWdtZW50IFsxXSBzZWxlY3RzIEJSMl9pMzg2IGFsb25lLgo+IAo+
IFRoZSB0YXJnZXQgYXJjaGl0ZWN0dXJlIHZhcmlhbnQgZGVmYXVsdCB0byBpNTg2IGlmIHRhcmdl
dAo+IGFyY2hpdGVjdHVyZSBpcyBpMzg2LiBTZWUgWzJdLgo+IAo+IEZpbmFsbHksIHRoZSBnZW5l
cmF0ZWQgdG9vbGNoYWluIG9wdGlvbnMgaW5jbHVkZXMgYSBkZXBlbmRzIG9uCj4gQlIyX2kzODYg
YW5kICFCUjJfeDg2X2k1ODYsIG1ha2luZyB0aGUgdG9vbGNoYWluIGFsd2F5cyBpZ25vcmVkLgo+
IFNlZSBbM10uCj4gCj4gVGhpcyBjb21taXQgZml4ZXMgdGhlIGlzc3VlIGJ5IGFkZGluZyBCUjJf
eDg2X2k2ODY9eSB0byB0aGUgY29uZmlnCj4gZnJhZ21lbnQuCgpZb3UgY2FuIGFsc28gZG91Ymxl
IGNoZWNrIGJ5IGxvb2tpbmcgdG8gdGhlIGZyYWdtZW50IGZpbGUgZ2VuZXJhdGVkIGJ5IHRvb2xj
aGFpbgpidWlsZGVyOgoKaHR0cHM6Ly90b29sY2hhaW5zLmJvb3RsaW4uY29tL2Rvd25sb2Fkcy9y
ZWxlYXNlcy90b29sY2hhaW5zL3g4Ni1pNjg2L2ZyYWdtZW50cy94ODYtaTY4Ni0tbXVzbC0tc3Rh
YmxlLTIwMjQuMDItMS5mcmFnCgpXaGVyZSBCUjJfeDg2X2k2ODY9eSBpcyBpbmRlZWQgc2VsZWN0
ZWQuCgpJIGFkZGVkIHRoaXMgYWRkaXRpb25hbCBsaW5rIHRvIHRoZSBjb21taXQgbG9nLgoKQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBbMV0g
aHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi9hOGJlNGEw
NGFkZThlNjk1YzVjNGQ0YTgyNTI1M2Q2OWU4MDY5M2Y5L3N1cHBvcnQvY29uZmlnLWZyYWdtZW50
cy9hdXRvYnVpbGQvYm9vdGxpbi14ODYtaTY4Ni1tdXNsLmNvbmZpZwo+IFsyXSBodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iLzIwMjQuMDIuMi9hcmNoL0Nv
bmZpZy5pbi54ODY/cmVmX3R5cGU9dGFncyNMMzgKPiBbM10gaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi8zNDVjY2I1MjNlL3Rvb2xjaGFpbi90b29sY2hh
aW4tZXh0ZXJuYWwvdG9vbGNoYWluLWV4dGVybmFsLWJvb3RsaW4vQ29uZmlnLmluLm9wdGlvbnMj
TDU3NjgtNTc3MAo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUu
ZnI+Cj4gLS0tCj4gIHN1cHBvcnQvY29uZmlnLWZyYWdtZW50cy9hdXRvYnVpbGQvYm9vdGxpbi14
ODYtaTY4Ni1tdXNsLmNvbmZpZyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKPiAKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9jb25maWctZnJhZ21lbnRzL2F1dG9idWlsZC9i
b290bGluLXg4Ni1pNjg2LW11c2wuY29uZmlnIGIvc3VwcG9ydC9jb25maWctZnJhZ21lbnRzL2F1
dG9idWlsZC9ib290bGluLXg4Ni1pNjg2LW11c2wuY29uZmlnCj4gaW5kZXggMmFmZTA5NmYzMmQu
LjY5N2U5YzYyNWVjIDEwMDY0NAo+IC0tLSBhL3N1cHBvcnQvY29uZmlnLWZyYWdtZW50cy9hdXRv
YnVpbGQvYm9vdGxpbi14ODYtaTY4Ni1tdXNsLmNvbmZpZwo+ICsrKyBiL3N1cHBvcnQvY29uZmln
LWZyYWdtZW50cy9hdXRvYnVpbGQvYm9vdGxpbi14ODYtaTY4Ni1tdXNsLmNvbmZpZwo+IEBAIC0x
LDQgKzEsNSBAQAo+ICBCUjJfaTM4Nj15Cj4gK0JSMl94ODZfaTY4Nj15Cj4gIEJSMl9UT09MQ0hB
SU5fRVhURVJOQUw9eQo+ICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU49eQo+ICBCUjJf
VE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fWDg2X0k2ODZfTVVTTF9TVEFCTEU9eQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
