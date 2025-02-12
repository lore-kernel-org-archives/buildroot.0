Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768BDC02198
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 22:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11E2340613;
	Wed, 12 Feb 2025 22:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmDIekZCkTTm; Wed, 12 Feb 2025 22:58:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0841341A23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0841341A23;
	Wed, 12 Feb 2025 22:58:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70F0AC2
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D2424049E
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hpl_BsXR4JpE for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 22:58:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1903840108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1903840108
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1903840108
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:58:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38de17a5fc9so115314f8f.3
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 14:58:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739401107; x=1740005907;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dEXMWu/DdxdViehiKFesBqARxNzdqrRXnsUX3BKMODc=;
 b=MM4wb5Zs8kifm6CfYwjBP80KfIleQhRm7c2gde+zPF++1/T0WWp8dT9q2uwd1zmxwl
 jtTMD2NAcJVjoijthokOT/cJ6vsH1ljhfOLqs5nuZLoCVRFoOZZzwhHJQ5Qa2THNd2wC
 7HV0tbHsYKLJsU7vLOAwGDOdMxUrpD+ef6y6a+Exeswvln4b8W3jJqvB2OXBgNxzpo/c
 bWHwx/+PR4J+nyKhiQ/6jJ4e0EvyE1LuWTeB6gZSRvhBhGrEdDID/rY9CsCUjPJROI3g
 Y7FFQqtXqST/ESGoDAbsy14ozqOXulJKppPIoo4vnu9dh0iJy+b5L0zTvC5kKvJZprqc
 lSdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2X3hRVjP5FxpG0buQwxZLgIfi2N9PETwJSTg7mQZWDSLPbW8s8YX8/p1vYkw0kOZ++tJXUF73awQ=@buildroot.org
X-Gm-Message-State: AOJu0YyU1bVfGCb6+WXjOb7ahUT81wqPZ6P5WOk/t0YzXGS8LZsT+G1U
 6YCDuA7+fXnb+RgPsScTe/EEC0pNdMgVqcPfP0r/DkWvMHNNNPyFwNqnKoJDNelG/ys6L4CxCOZ
 4
X-Gm-Gg: ASbGnctOjqmOzFXiZ1rO0I1/UvZYUBxfdGZBoBn+T9VrGYOMfeRxF0Shhs0wXz7JezW
 RgYspcIl0mDFqzU6fU3bVp+BmU10kRbXvHaq7+NMOmHVDRwb/4LO7B7jmx+jlxN5hlb/5CzkVLN
 fbcZkj4IPe3xfWfJSBovd8KPiKHSOeyHMohKPIkNYt0yOnw9/otAFKJWq7fbBocg/C+KTIq7vFO
 ++awXG88wmRaQz72SYVgAz5YJPdxy7fudnU5dvfaA5dQlQ9eWApKKGZ3Md6qw5s3Hbgwmoa8ll5
 yYwnkZYKUwmA5/7fSLbTP3oeY4Up+DRV/YqwrKEjm2nm418kcNkvVHOw/Ymh7daIW12ElUFWmjh
 lOEU1iBroyMM7rtrfLEocjKQ54+0ObuheKQ1JoruPVovFPaFZu8k=
X-Google-Smtp-Source: AGHT+IFBMNdzkuOBiKKXfblkt9/oFoQ4RxyWHl2j9zSpsDFgG9+VmRIX4Al4XuDUSdwSjf90rdA6iA==
X-Received: by 2002:a5d:5885:0:b0:38d:d9b3:5916 with SMTP id
 ffacd0b85a97d-38f244d6270mr890264f8f.1.1739401107570; 
 Wed, 12 Feb 2025 14:58:27 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddba7sm189621f8f.38.2025.02.12.14.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 14:58:27 -0800 (PST)
Message-ID: <5e3c436d-70b2-4a21-bd7f-f3129e877f2f@smile.fr>
Date: Wed, 12 Feb 2025 23:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Marleen Vos <marleen.vos@mind.be>, linux-amarula@amarulasolutions.com
References: <20250207232035.3953972-1-dario.binacchi@amarulasolutions.com>
Content-Language: fr
In-Reply-To: <20250207232035.3953972-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739401107; x=1740005907; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dEXMWu/DdxdViehiKFesBqARxNzdqrRXnsUX3BKMODc=;
 b=H4jU2sa85/vOQQDbzCtGLhIFmmKhaH2HvYd0F4Y+9OpZZizibyVo3zyB0xk+w46bTz
 MEudMR5UYoPhhEtjSvEXYehmKHH5vdPXbDDS1vBwk5cTBnyymyo/HJSw9kvV/uW3cYk9
 v8BBOWPCLdzenuPtGVxNsX5eaInUT+3s894Mo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=H4jU2sa8
Subject: Re: [Buildroot] [PATCH 1/1]
 board/stmicroelectronics/common/stm32mp157: restore linux hash
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAwOC8wMi8yMDI1IMOgIDAwOjIwLCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFRoZSBjb21taXQgOTgwMmZhMGI1YmFhICgiY29uZmlncy9zdG0zMm1wMTM1Zi1k
azogbmV3IGRlZmNvbmZpZyIpIHJlbW92ZWQKPiB0aGUgaGFzaCBmb3IgdGhlIHN0bTMybXAxNTdh
X2RrMSBhbmQgc3RtMzJtcDE1N2NfZGsyIGNvbmZpZ3VyYXRpb25zLAo+IGJyZWFraW5nIHRoZSBi
dWlsZC4gVGhlIHBhdGNoIHJlc3RvcmVzIHRoaXMgdmFsdWUuCj4gCj4gRml4ZXM6IDk4MDJmYTBi
NWJhYSAoImNvbmZpZ3Mvc3RtMzJtcDEzNWYtZGs6IG5ldyBkZWZjb25maWciKQoKSSBhZGRlZCB0
d28gZ2l0bGFiLWNpIGxpbmtzLgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVn
YXJkcywKUm9tYWluCgoKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmlu
YWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gLS0tCj4gIC4uLi9jb21tb24vc3RtMzJtcDF4
eC9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2ggICAgICAgICAgICAgICAgICAgfCAxICsKPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2JvYXJkL3N0bWlj
cm9lbGVjdHJvbmljcy9jb21tb24vc3RtMzJtcDF4eC9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gg
Yi9ib2FyZC9zdG1pY3JvZWxlY3Ryb25pY3MvY29tbW9uL3N0bTMybXAxeHgvcGF0Y2hlcy9saW51
eC9saW51eC5oYXNoCj4gaW5kZXggNDJkMDJjOWY3ODM2Li5mNmE1ZjVlMWM5MGMgMTAwNjQ0Cj4g
LS0tIGEvYm9hcmQvc3RtaWNyb2VsZWN0cm9uaWNzL2NvbW1vbi9zdG0zMm1wMXh4L3BhdGNoZXMv
bGludXgvbGludXguaGFzaAo+ICsrKyBiL2JvYXJkL3N0bWljcm9lbGVjdHJvbmljcy9jb21tb24v
c3RtMzJtcDF4eC9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gKPiBAQCAtMSwyICsxLDMgQEAKPiAg
IyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiArc2hhMjU2ICBmMDQ4MjY3YjdiODgzMTZjOWNhNzA4YzY4
ZDE1YTlhZTgwMmRjZmM5NDNjMzE4OGMxMjczZWI5NThjNDMzMjgxICBsaW51eC02LjkuOC50YXIu
eHoKPiAgc2hhMjU2ICBjOTU0ZjYwMTk3MDA4ZjFlMWYzMmExZTc3MjkzOTAzY2YzODAxZDI1NDNl
YzRiZjUyMWY1NjUxZWI3ZjEzM2NlICBsaW51eC02LjExLjYudGFyLnh6CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
