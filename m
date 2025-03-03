Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905B8C282CD
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 14:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AFA5608F3;
	Mon,  3 Mar 2025 14:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYJxVKBVIjKD; Mon,  3 Mar 2025 14:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26A1F608F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26A1F608F6;
	Mon,  3 Mar 2025 14:09:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53A65D2
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 14:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3360E81EA3
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 14:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpU4iLPZ4hwj for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 14:09:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 28FCF81CA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28FCF81CA3
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28FCF81CA3
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 14:09:08 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-7272dae0604so2766873a34.1
 for <buildroot@buildroot.org>; Mon, 03 Mar 2025 06:09:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741010947; x=1741615747;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4BXWjOKSIahwFFqqkEzAoVjbgVeVG46BGY2ySxxVbHE=;
 b=BB1dqcjx1AHotzCY1gBxZ6D2D+8vjzRzbNnAij88v8lRYF8YExj/OKZPxZmnB2RD12
 613pY+/C7ZOWm8VRLKyc9s/o270NjhS1re99q6swz7ZpytsE3/n6MaYAYI+z8CM8HiJc
 MWQFl64bXzYzuWFWmw2E6fWJcSbTSK7MddM79XROsUDRUl9LkDRAb4ndFFwfK9eOA2/K
 lTt48xykG1kc9VJGcd6W3KVNWUetpedY7eLtn1YCc/l7dpPZLrJYCYtCw3EuH+gER4Fi
 KlZ/N4L5ZvmfOLPcaAt/7/3/b1A4zly/asyJWAMrsfSACGUOqv52cBJBKNjfwCrWfAYf
 othQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv80GIavhrYdoeCrxdTh0v5D4F96tXNOdeoPqDZhlhUfjtilMWyYNN3Hp4xD8kl376iY98c8zPwfs=@buildroot.org
X-Gm-Message-State: AOJu0Yy2EAAv9AnbhpZWUTco+Iuhyr1qt7356EnfKxtWKEOGWZIGczFV
 0U3RnfG+9nqusXQEePgoCwKR0MwRarcQuu32MCYQtGnHneDL2tk2
X-Gm-Gg: ASbGncsme2Tmw6b8gXfWOTIBbp8JxTAmjymY5b9Ztjc50izXUpPLYD+iv/C9sJKPwQY
 43mKqyCoD99rEV9q3U0j6W6yD+A0d5Xe0gA6/9/7hgs65cic3eGGU9sUIwgO+RJmieNIWHTGN/T
 jxoVFAzGgaim/lqFbQCrfFTopwnjKL8GZdkCiTrZjFtdqUofKg7XMV3DqEL+fuhZho+eqJEe132
 RHNThmB16eu+GHCo7BcqbKd+0Qg6n+pzTwUvna1nKIMcy1krUC7LayzCn9IVFyz/+hgNw6JpfTm
 +cd6Lpf68CdoByrNiONhiV5B8iVltRG5cc01BNSs1SY8nHR+SM3IcjcCTtu+Px4doketY0ZSzan
 t1TEKUtQ=
X-Google-Smtp-Source: AGHT+IGnSEaHOpQzfw1olv6RB8Na2JeVTz3pmXqfGZZGJ+fR/WnHmZ4Em5fGd/7I6fkgrOOOOfApRg==
X-Received: by 2002:a05:6830:6588:b0:72a:ec6:7fc1 with SMTP id
 46e09a7af769-72a0ec68412mr1136671a34.14.1741010946932; 
 Mon, 03 Mar 2025 06:09:06 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2c15c3cf6d9sm1900005fac.39.2025.03.03.06.09.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 06:09:05 -0800 (PST)
Message-ID: <498f8c56-fe1e-42ee-8511-d5ea8f30f423@gmail.com>
Date: Mon, 3 Mar 2025 06:09:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 buildroot@buildroot.org, Markus Mayer <mmayer@broadcom.com>
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Alexander Egorenkov <egorenar-dev@posteo.net>, Bernd Kuhls
 <bernd@kuhls.net>, Laurent Vivier <laurent@vivier.eu>,
 "Wojciech M. Zabolotny" <wzab01@gmail.com>,
 Francis Laniel <flaniel@linux.microsoft.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Qais Yousef <qais.yousef@arm.com>
References: <20250217140332.310347-1-alex.bennee@linaro.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 WlfRzlpjIPmdjgoicA==
In-Reply-To: <20250217140332.310347-1-alex.bennee@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741010947; x=1741615747; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=4BXWjOKSIahwFFqqkEzAoVjbgVeVG46BGY2ySxxVbHE=;
 b=fsh9PESddT6Kn0akK8u3ZWu7UiqDk/8tGSC6S8HwbOtXKhhJ24O+qAbgUUebpZG/zi
 +DBNdz/bgfTyJ+VGjbRGdgQaUvmX/3QrO6pklDNOVeQuA/X4ZoPtR4c/tyYS35Y1qoSU
 ypzPlD5V6Dk4xY07cJWAIPpfmfUwyNTFv8Dovj0kBQMRoVb9zscjkKZ7P3XsEwmLIozS
 SxIPCnTIMC3Zg/U/p1YCTdcCarlLRE85HXL/s5Wdllksq1YendIdzo48KEpE73IjJsmg
 nHSm6ipTU2JZ3Og6Z5f9hLcYQKW76d9KvtnHEG530f/RMWS0bqGccfz/hnaW0DEXsdN1
 0jfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fsh9PESd
Subject: Re: [Buildroot] [PATCH v2] package/elfutils: ensure we have 5.0
 kernel headers for aarch64
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleCwKCk9uIDIvMTcvMjAyNSA2OjAzIEFNLCBBbGV4IEJlbm7DqWUgd3JvdGU6Cj4gU2lu
Y2UgQnVpbGRyb290IGNvbW1pdCBbMV0gInBhY2thZ2UvZWxmdXRpbHM6IGJ1bXAgdG8gdmVyc2lv
biAwLjE5MiIKPiBlbGZ1dGlscyBmYWlscyB0byBidWlsZCBvbiBBYXJjaDY0IHdpdGggdG9vbGNo
YWluIGluY2x1ZGluZyBLZXJuZWwgb2xkZXIKPiB0aGFuIHZlcnNpb24gNS4wLiBFcnJvciBzaG93
czoKPiAKPiAgICAgIGFhcmNoNjRfaW5pdHJlZy5jOiBJbiBmdW5jdGlvbiAnYWFyY2g2NF9zZXRf
aW5pdGlhbF9yZWdpc3RlcnNfdGlkJzoKPiAgICAgIGFhcmNoNjRfaW5pdHJlZy5jOjYxOjI0OiBl
cnJvcjogc3RvcmFnZSBzaXplIG9mICdwYWNfbWFzaycgaXNuJ3QKPiAgICAgIGtub3duCj4gICAg
ICAgICA2MSB8ICAgc3RydWN0IHVzZXJfcGFjX21hc2sgcGFjX21hc2s7Cj4gICAgICAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn4KPiAKPiBlbGZ1dGlscyAwLjE5MiBpbnRy
b2R1Y2VkIGEgQWFyY2g2NCBwb2ludGVyIGF1dGhlbnRpY2F0aW9uIHN1cHBvcnQgaW4KPiB1cHN0
cmVhbSBjb21taXQgWzJdLgo+IAo+IEZvciByZWZlcmVuY2UsIHRoZSB1c2VyX3BhY19tYXNrIHN0
cnVjdHVyZSB3YXMgaW50cm9kdWNlZCBpbiBLZXJuZWwKPiB1cHN0cmVhbSBjb21taXQgWzNdLCBp
bmNsdWRlZCBpbiBLZXJuZWwgdjUuMC4KPiAKPiBGaXhlczoKPiAtIGUuZyBodHRwczovL2F1dG9i
dWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNTE1NjkwMWE3M2JlNTJjZThmZmJmMTA3MjllNjg1
MjQ5OWEzMDBiZS8KPiAtIDQvNiBvZiB0aGUgZmFpbHVyZXMgaGVyZTogaHR0cHM6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm9yZy8/cmVhc29uPWVsZnV0aWxzLTAuMTkyJmFyY2g9YWFyY2g2NAo+IAo+
IFsxXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQv
NWViNzM0NzY2YjI0ZGU1ZmNlNmU1ODY4OTdjZDQ4MjdmODg1NTQ0Mgo+IFsyXSBodHRwczovL3Nv
dXJjZXdhcmUub3JnL2dpdC8/cD1lbGZ1dGlscy5naXQ7YT1jb21taXRkaWZmO2g9NjRlM2I0NTFh
ZDJjZWM4ZDQ1NjYxYjE4MTZlM2QyZGM0NDMxZjNjYQo+IFszXSBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC8/aWQ9
ZWM2ZTgyMmQxYTIyZDBlZWYxZDFmYTI2MGRmZjc1MWRiYTlhNDI1OAoKTWFya3VzIHN1Ym1pdHRl
ZCBhIHBhdGNoIGZvciB0aGlzIHZlcnkgaXNzdWUgd2hpY2ggaGFzIGJlZW4gYWNjZXB0ZWQgCmlu
dG8gZWxmdXRpbHM6CgpodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL2VsZnV0aWxzLWRldmVs
QHNvdXJjZXdhcmUub3JnL21zZzA3ODUwLmh0bWwKCmh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0
Lz9wPWVsZnV0aWxzLmdpdDthPWNvbW1pdDtoPTUyYTc0N2EzMTYwNDJlNzBhMjJhY2I0ODlkZjll
NTFiZmM2YmYyZDUKCkkgd291bGQgcmF0aGVyIHdlIHVzZSB0aGlzIGJhY2sgcG9ydCBhcyBpdCBk
b2VzIG5vdCBwcmVjbHVkZSB1cyBmcm9tIAp1c2luZyBlbGZ1dGlscyB3aXRoIG9sZGVyIGtlcm5l
bCBoZWFkZXJzIGFueW1vcmUuCgpUaGFua3MhCi0tIApGbG9yaWFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
