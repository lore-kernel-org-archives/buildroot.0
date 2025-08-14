Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA7ECA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6630560771;
	Thu, 14 Aug 2025 20:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gV4CCl9U9IsQ; Thu, 14 Aug 2025 20:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 997BE60767
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 997BE60767;
	Thu, 14 Aug 2025 20:31:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B617228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D64F40459
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AITNbzg4ThKd for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:31:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E63E6402F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E63E6402F5
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E63E6402F5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:25 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b9e41669d6so1128068f8f.2
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203484; x=1755808284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Un4lhdFYoT2JJIJJsEyP6O8if9s9pfkjSx0JIcNDu9A=;
 b=LjYbASQRsDXf07VQmKkoRpo3LYAnRThEVgGF5fuoNBE0Uct3L0Kx6EM2gnNFp9hLrr
 f7qPmYBRvKZG0kUTm7aAWDLREugx0/8TBLXq2Ior+SNhOJPWHKEbMPviqieWZ2AwYphc
 YX+WxFnuJ+dTFg/JNtl7Jjcw8ncIx9OY+a8oKyQFfstlqEvuWcQYhkCYmDenrhLexixc
 SjLQQuE/xgIjY4xNIdlZanP5ucp/RGgi20+dTZRAZXzJafrXxJnJdKq7kv5024K29BIv
 YUI8uWom2o+SmzYuJqdNUjrb/Yulfg4KGQidhDhdmmBov/GHeilqqgq3+TTcAmBnmiB+
 uhJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBH2KV6hMJtnJkbhRes8Qo1KJj1fzuhP+7SWeR84mCELPb5kjkqO2lm6cGl4Tg556URiK7Tpt9WPI=@buildroot.org
X-Gm-Message-State: AOJu0YzfvloN/BkaSBmMU4iYsfrq52Q2gfRqfMP1H/24Z4ATLJ8/iKFb
 rhvyL3jbDrvHLG4GMYVhSaoZ2uXu9zK23SyyB3RPDFB8Oz2jvmXGp0KRDyiTHACNPf4UjjnX51R
 vzLwSNp8=
X-Gm-Gg: ASbGnctVj6UtJ7/KDwFWylzA1OsEFNy2j+qsdx4T5JMmYfJHgKC2wmx6HwgpYjjxQ+K
 W9IECH2C41LAh/s3yDA7xcyx5e2pS1TPre8YAc+dNNuAro2ztrkDoWO7lDyDa7hI9JbTSIye0VW
 lUxR9hiANloUMVyjgnKSHkJTeUYI7TucPSm9Cb/6TQtDZ7Ge6up0cOma6vbZzPRrt4cUjX+m0Rc
 8lnHCV5pA6wdiDw69ZufpSz3dHuFM2uXyOr92W84Uw+3Gbxa68DW4hWqCdi2JnvqEy/N8zCYZcs
 O8IiQRqd0AGOEvp5ghHmwKnBAt6IRvRe/SQVKg9n9j0W0yIuWBXf7LFLZ4/OgiWd7F9yU/Kd9R4
 hL6UIA163R+GAVQ==
X-Google-Smtp-Source: AGHT+IEGFszYM8ZYCj3A66l5mBFJcR1rFlIwyEP8BJdwuIPyEGAhlIpnRjBp7IUQKQ54H4t0K7ys6Q==
X-Received: by 2002:a05:6000:250e:b0:3b7:886b:fb8d with SMTP id
 ffacd0b85a97d-3b9edfc7cf9mr3695009f8f.31.1755203483945; 
 Thu, 14 Aug 2025 13:31:23 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac51asm53032291f8f.1.2025.08.14.13.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:23 -0700 (PDT)
To: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:22 +0200
Message-ID: <20250814203123.2814714-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729-cmake4-v2-2-24fd7677de1c@bootlin.com>
References: <20250729-cmake4-v2-2-24fd7677de1c@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203484; x=1755808284; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Un4lhdFYoT2JJIJJsEyP6O8if9s9pfkjSx0JIcNDu9A=;
 b=A2TQ6tEPbqlCq5Hl+Ajn813ahWXdPWWkihiS75fLf8Kxsg3fap9EyHrDyG9Y0thvz4
 h09OzbDQOpnDEqPGNBr/JK31RDDdb8y16fiTobpZKkD221ScVYc6SBnCt97H3zWcIvDN
 8WhS7vxctUT2I4Gng9DT/YksB5hRjfEWYikFCgoHjSYGxqmu3c8SO0J7MARvm+VrD3S0
 oaLQ5E7LIZ3VO7M5UmyjYLI8Z+3gar2kL62nT597IAWGTLdwynCXOdb4SVgGs5H5eGXv
 5s4P02Qhfpzho0bjwDvNuwLZ7RXTfG2Vh70cbr0SG98Eg+m6a1eItQg63/VkQvIMiz7t
 /m7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=A2TQ6tEP
Subject: Re: [Buildroot] [PATCH v2 2/2] package/flatcc: fix cmake 4
 compatibility
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gQWRkIGEgcGF0Y2ggZml4aW5nIGNtYWtlIDQgY29tcGF0aWJpbGl0eSwg
Zm91bmQgaW4gdXBzdHJlYW0gcHVsbAo+IHJlcXVlc3QgIzM0OS4gVGhlIHBhdGNoIGhhcyBiZWVu
IG1vZGlmaWVkIHRvIGFwcGx5IG9uIHZlcnNpb24gMC42LjEKPiBpbnN0ZWFkIG9mIHRoZSBjdXJy
ZW50IHVwc3RyZWFtIEhFQUQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmVub8OudCBNb25pbiA8YmVu
b2l0Lm1vbmluQGJvb3RsaW4uY29tPgoKQXBwbGllZCB0byAyMDI1LjA1LnguIFRoYW5rcwoKPiAt
LS0KPiAgLi4ubmltdW1fcmVxdWlyZWRfdmVyc2lvbl90b18zLjVfZm9yX2NtYWtlXzQucGF0Y2gg
fCA1MSArKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNlcnRp
b25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZmxhdGNjLzAwMDEtY21ha2Vfc2V0X21p
bmltdW1fcmVxdWlyZWRfdmVyc2lvbl90b18zLjVfZm9yX2NtYWtlXzQucGF0Y2ggYi9wYWNrYWdl
L2ZsYXRjYy8wMDAxLWNtYWtlX3NldF9taW5pbXVtX3JlcXVpcmVkX3ZlcnNpb25fdG9fMy41X2Zv
cl9jbWFrZV80LnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi45YmZhZTU0YWUyYWM2NDNjMzQ1OTkyNjll
MTdiM2M5OWY1MWNlMDgyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvZmxhdGNjLzAw
MDEtY21ha2Vfc2V0X21pbmltdW1fcmVxdWlyZWRfdmVyc2lvbl90b18zLjVfZm9yX2NtYWtlXzQu
cGF0Y2gKPiBAQCAtMCwwICsxLDUxIEBACj4gK0Zyb20gOTE1ZjYyZGNkOWYwYTM3Mjk0NGY3NDlj
ZjRhY2Q3MDdkYjEwYzVmZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogQWxwZXIg
QWsgPGFscGVyeWFzaW5hazFAZ21haWwuY29tPgo+ICtEYXRlOiBXZWQsIDkgSnVsIDIwMjUgMTI6
NTk6MTcgKzAzMDAKPiArU3ViamVjdDogW1BBVENIXSBjbWFrZTogU2V0IG1pbmltdW0gcmVxdWly
ZWQgdmVyc2lvbiB0byAzLjUgZm9yIENNYWtlIDQrCj4gKyBjb21wYXRpYmlsaXR5Cj4gKwo+ICtG
aXg6Cj4gKwo+ICt8IENNYWtlIEVycm9yIGF0IENNYWtlTGlzdHMudHh0OjIgKGNtYWtlX21pbmlt
dW1fcmVxdWlyZWQpOgo+ICt8ICAgQ29tcGF0aWJpbGl0eSB3aXRoIENNYWtlIDwgMy41IGhhcyBi
ZWVuIHJlbW92ZWQgZnJvbSBDTWFrZS4KPiArfAo+ICt8ICAgVXBkYXRlIHRoZSBWRVJTSU9OIGFy
Z3VtZW50IDxtaW4+IHZhbHVlLiAgT3IsIHVzZSB0aGUgPG1pbj4uLi48bWF4PiBzeW50YXgKPiAr
fCAgIHRvIHRlbGwgQ01ha2UgdGhhdCB0aGUgcHJvamVjdCByZXF1aXJlcyBhdCBsZWFzdCA8bWlu
PiBidXQgaGFzIGJlZW4gdXBkYXRlZAo+ICt8ICAgdG8gd29yayB3aXRoIHBvbGljaWVzIGludHJv
ZHVjZWQgYnkgPG1heD4gb3IgZWFybGllci4KPiArfAo+ICt8ICAgT3IsIGFkZCAtRENNQUtFX1BP
TElDWV9WRVJTSU9OX01JTklNVU09My41IHRvIHRyeSBjb25maWd1cmluZyBhbnl3YXkuCj4gK3wK
PiArfAo+ICt8IC0tIENvbmZpZ3VyaW5nIGluY29tcGxldGUsIGVycm9ycyBvY2N1cnJlZCEKPiAr
Cj4gK1NpZ25lZC1vZmYtYnk6IEFscGVyIEFrIDxhbHBlcnlhc2luYWsxQGdtYWlsLmNvbT4KPiAr
U2lnbmVkLW9mZi1ieTogQmVub8OudCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPgo+
ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2R2aWRlbGFicy9mbGF0Y2MvcHVsbC8zNDkK
PiArLS0tCj4gKyBDTWFrZUxpc3RzLnR4dCAgICAgICAgICAgICAgIHwgMiArLQo+ICsgZXh0ZXJu
YWwvaGFzaC9DTWFrZUxpc3RzLnR4dCB8IDIgKy0KPiArIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMu
dHh0IGIvQ01ha2VMaXN0cy50eHQKPiAraW5kZXggZDQxMjdmNTk4Li5iNTFlNWM1YmQgMTAwNjQ0
Cj4gKy0tLSBhL0NNYWtlTGlzdHMudHh0Cj4gKysrKyBiL0NNYWtlTGlzdHMudHh0Cj4gK0BAIC0y
LDcgKzIsNyBAQAo+ICsgI2NtYWtlX21pbmltdW1fcmVxdWlyZWQgKFZFUlNJT04gMi44LjEyLjIp
Cj4gKyAjIENlbnRvcyA3Cj4gKyAjY21ha2VfbWluaW11bV9yZXF1aXJlZCAoVkVSU0lPTiAyLjgu
MTEpCj4gKy1jbWFrZV9taW5pbXVtX3JlcXVpcmVkIChWRVJTSU9OIDIuOCkKPiArK2NtYWtlX21p
bmltdW1fcmVxdWlyZWQgKFZFUlNJT04gMy41KQo+ICsgCj4gKyAjIERpc2FibGUgYnVpbGQgb2Yg
dGVzdHMgYW5kIHNhbXBsZXMuIER1ZSB0byBjdXN0b20gYnVpbGQgc3RlcAo+ICsgIyBkZXBlbmRl
bmN5IG9uIGZsYXRjYyB0b29sLCBzb21lIGN1c3RvbSBidWlsZCBjb25maWd1cmF0aW9ucyBtYXkK
PiArZGlmZiAtLWdpdCBhL2V4dGVybmFsL2hhc2gvQ01ha2VMaXN0cy50eHQgYi9leHRlcm5hbC9o
YXNoL0NNYWtlTGlzdHMudHh0Cj4gK2luZGV4IDdiN2Q5OTBkZC4uMTJlYjNkYWE0IDEwMDY0NAo+
ICstLS0gYS9leHRlcm5hbC9oYXNoL0NNYWtlTGlzdHMudHh0Cj4gKysrKyBiL2V4dGVybmFsL2hh
c2gvQ01ha2VMaXN0cy50eHQKPiArQEAgLTEsNCArMSw0IEBACj4gKy1jbWFrZV9taW5pbXVtX3Jl
cXVpcmVkIChWRVJTSU9OIDMuMC4yKQo+ICsrY21ha2VfbWluaW11bV9yZXF1aXJlZCAoVkVSU0lP
TiAzLjUpCj4gKyAKPiArIHByb2plY3QgKEhhc2hUZXN0KQo+ICsgCj4gCj4gLS0gCj4gMi41MC4x
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
