Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C059C83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 11:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1A6C80BB0;
	Fri,  4 Jul 2025 11:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvXbJJwSfkFj; Fri,  4 Jul 2025 11:37:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC70880B82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC70880B82;
	Fri,  4 Jul 2025 11:37:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 045CA7AD
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 11:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE9E540DFA
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 11:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIvqHpNYn6Bx for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 11:37:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 102CE40B42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 102CE40B42
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 102CE40B42
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 11:37:38 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ae0a0cd709bso411846366b.0
 for <buildroot@buildroot.org>; Fri, 04 Jul 2025 04:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751629056; x=1752233856;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CCePmhxklruad8ZuaIVoSHA3BiUK6Cwmo+mp5mW+kNE=;
 b=klA2P0dKs0k1FFaeCjDqu09Dhg0HVMjVqnpCJcQCzUJHrc26fL9BXEkMfPVSA7OyJA
 Jn3YSRyafIEGGjEoLr9+//cHTLAPD2/iyP5xzwEfS6o+yNeVtrq0Ncs6doivdFFDRPZ1
 Jg/2ex1Zck5t+orW03USblM6wfTp17WTBSSd+Dh9RgzoG5LU1TJR9EuGXBccp4H51zz6
 vil0zi8BXzUSJ0CjCY9SThOSKp/pVIihHknrimfarhArl05etR4hhlSljMU3glepwJXQ
 uqApC/RjyM4H0x8CQDtsUX1T/HpoiFnRZ/gHlACrUY/Mw/qr6G8kZjutP+IARgTgP5jH
 Cz/g==
X-Gm-Message-State: AOJu0YzgwFtrZwKLW/iS7mIUyo3fu3QDOqpCMlb4EygXhk4W9cGmtV8U
 Stu2wdxMiX81IJ8AiigHMTWCqzmvpEeEIT2o2jdSbHwkw2540dCYWNwDorISl9c6I3kQvFh9eH/
 gA0exHbQ=
X-Gm-Gg: ASbGnctHvII1t8S/eUN3/q+S7ketNBeL4FamAVW+umpVq3zkT1Ryves4lwvaBDoJhSX
 32w5tKl+/rOnfkWfYaugTDA2CBNrwdjwOc7aiBK9O+QjL10jDr2gWw22Xl2vc+H4o/zFWtyzugt
 9tUwHsCOKNE5H3E+ivIem6SkBtCw9AzwrkezAI3CgLSXAJuSFpKyt8ZmkDU4UIMip4e2PMz5i8F
 8Ec3PGnjrN+YBbmkHcZ7IgRIZjGe2onSO/P21tRg/JFdSzQ+gTauZozeg47CaVjiudata7UrA+5
 ZAIoMjQxR25GqMwRWFFkVTg1RAc3SmCTjMNZPK3SfaiY44p+Bwk2qX2rY2/nWqI=
X-Google-Smtp-Source: AGHT+IFL+p76zmaCa23vFCz0mQNddlv0iErQJfG+C7h3ztqY3UQA0lV/1/Qi5tH3OmqZYZ2UrAFECw==
X-Received: by 2002:a17:907:d59f:b0:ad8:91e4:a92b with SMTP id
 a640c23a62f3a-ae3f9d40d35mr241324666b.30.1751629056482; 
 Fri, 04 Jul 2025 04:37:36 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f692bcf4sm157641566b.44.2025.07.04.04.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 04:37:35 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D59005F8AE;
 Fri, 04 Jul 2025 12:37:34 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org,  Joseph Kogut <joseph.kogut@gmail.com>,  Romain
 Naour <romain.naour@gmail.com>,  Daniel Lang <dalang@gmx.at>,  Valentin
 Korenblit <valentinkorenblit@gmail.com>
In-Reply-To: <204c6146-2b48-43d0-94d4-78f030da1f28@smile.fr> (Romain Naour's
 message of "Thu, 3 Jul 2025 13:16:18 +0200")
References: <20250626111642.228223-1-alex.bennee@linaro.org>
 <20250626111642.228223-4-alex.bennee@linaro.org>
 <7ee26828-4b3d-4942-8c30-8293455c59fc@smile.fr>
 <87qzyxdb8v.fsf@draig.linaro.org>
 <6d55950e-280c-46dc-9e4c-c24cf2387eb3@smile.fr>
 <204c6146-2b48-43d0-94d4-78f030da1f28@smile.fr>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Fri, 04 Jul 2025 12:37:34 +0100
Message-ID: <87v7o89og1.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751629056; x=1752233856; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCePmhxklruad8ZuaIVoSHA3BiUK6Cwmo+mp5mW+kNE=;
 b=gUYUgBo4u9t9ssKxxfty2EShggdq34Ya35r0M0nkBcFL8ArEgp5weAy0SQG3O/eIj8
 2Qb8+rxlWW+UFUc2Ls8iSzKKkZU1HWbKtcFz5/1fwVQPYSfhMBlj1Y5IH3eT9vd8/hHW
 7yue+qgBttBK/aX+ZBFu072OqKkYfj7PQMgz7JAtfDzkdetYp5mbYebLZDqP3KvlhAfJ
 PuELS3cZ/WCpjvODQujK+shDip8c+3zo4UESE5CcjKzxOLk0bGe9ufPjLh/Tzn7X7dxn
 2aU74gF0eKJWgWQx9NpsjBx8nhphR2zkvGsev2TcT0ilQiU8tLdcJi/xUwFAU2o6zFXy
 RbKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gUYUgBo4
Subject: Re: [Buildroot] [RFC PATCH 3/3] package/llvm-project: reduce the
 build size of llvm
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyaXRlczoKCj4gTGUgMDMvMDcv
MjAyNSDDoCAxMzowOSwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4+IExlIDAzLzA3LzIwMjUg
w6AgMDg6NDQsIEFsZXggQmVubsOpZSBhIMOpY3JpdMKgOgo+Pj4gUm9tYWluIE5hb3VyIDxyb21h
aW4ubmFvdXJAc21pbGUuZnI+IHdyaXRlczoKPj4+Cj4+Pj4gSGVsbG8gQWxleCwgQWxsLAo+Pj4+
Cj4+Pj4gTGUgMjYvMDYvMjAyNSDDoCAxMzoxNiwgQWxleCBCZW5uw6llIGEgw6ljcml0wqA6Cj4+
Pj4+IEFsdGhvdWdoIHdlIHJlcXVlc3QgYSBSZWxlYXNlIGJ1aWxkIHRoZSBkZWZhdWx0IENNQUtF
IGZsYWdzIGluCj4+Pj4+IHRvb2xjaGFpbi5jbWFrZSBpbmNsdWRlIC1PZyAtZzMgd2hpY2ggZW5h
YmxlcyBkZWJ1ZyBzeW1ib2xzIGZvciB0aGUKPj4+Pj4gYnVpbGQgaW5mbGF0aW5nIHRoZSBvdmVy
YWxsIHNpemUgb2YgdGhpbmdzLgo+Pj4+Cj4+Pj4gQnkgZGVmYXVsdCwgLU8yIC1nMCBpcyB1c2Vk
IGJ5IEJ1aWxkcm9vdC4gSWYgeW91IGhhdmUgLU9nIC1nMyBpbiB0b29sY2hhaW4uY21ha2UKPj4+
PiBnZW5lcmF0ZWQgYnkgQnVpbGRyb290LCBpdCBtZWFucyB0aGF0IEJSMl9FTkFCTEVfREVCVUcs
IEJSMl9ERUJVR18zIGFuZAo+Pj4+IEJSMl9PUFRJTUlaRV9HIGhhdmUgYmVlbiBzZWxlY3RlZCBp
biB0aGUgQnVpbGRyb290IGNvbmZpZ3VyYXRpb24gKGJ5Cj4+Pj4gdGhlIHVzZXIpLgo+Pj4KPj4+
IFdoZXJlIGlzIHRoZSBsb2dpYyB0aGF0IHNldHMgdGhpcz8gQmVjYXVzZToKPj4+Cj4+PiAgIOKe
nCAgYWcgREVCVUcgLmNvbmZpZwo+Pj4gICAxNzk6QlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEU19E
RUJVRz15Cj4+PiAgIDMwNjojIEJSMl9FTkFCTEVfREVCVUcgaXMgbm90IHNldAo+Pj4gICAzMDc6
IyBCUjJfRU5BQkxFX1JVTlRJTUVfREVCVUcgaXMgbm90IHNldAo+Pj4gICA0MTQ2OiMgQlIyX1BB
Q0tBR0VfT1BFTlBPV0VSTElOS19ERUJVR19MRVZFTCBpcyBub3Qgc2V0Cj4+Pgo+Pj4gQnV0Ogo+
Pj4KPj4+ICAg4p6cICBhZyAiQnVpbGRyb290IENGTEFHUyIgLi9ob3N0L3NoYXJlL2J1aWxkcm9v
dC90b29sY2hhaW5maWxlLmNtYWtlCj4+PiAgIDU3OiAgc2V0KENNQUtFX0NfRkxBR1MgIi1EX0xB
UkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9
NjQgLU9nIC1nMyAtRF9GT1JUSUZZX1NPVVJDRT0xIiBDQUNIRSBTVFJJTkcgIkJ1aWxkcm9vdCBD
RkxBR1MiKQo+PiAKPj4gSXQncyB3ZWlyZCBpbmRlZWQuIEkgaGFkIHRvIHVzZSBCUjJfRU5BQkxF
X0RFQlVHLCBCUjJfREVCVUdfMyBhbmQgQlIyX09QVElNSVpFX0cKPj4gdG8gZ2V0IHRoZSBzYW1l
IG9wdGltaXphdGlvbiBsZXZlbCB0aGFuIHlvdS4gT3RoZXJ3aXNlIC1PMiAtZzAgaXMgdXNlZC4K
Pj4gCj4+IENhbiB5b3Ugc2hhcmUgYSBCdWlsZHJvb3QgZGVmY29uZmlnIGFibGUgdG8gcmVwcm9k
dWNlIHRoaXMgaXNzdWU/Cj4KPiBOb3RlOgo+IC4vaG9zdC9zaGFyZS9idWlsZHJvb3QvdG9vbGNo
YWluZmlsZS5jbWFrZSBpcyBnZW5lcmF0ZWQgYnkgdGhlIHRvb2xjaGFpbiBwYWNrYWdlCj4gYXMg
cG9zdCBpbnN0YWxsIHN0YWdpbmcgaG9vazoKPgo+IHNlZToKPiBUT09MQ0hBSU5fUE9TVF9JTlNU
QUxMX1NUQUdJTkdfSE9PS1MgKz0gVE9PTENIQUlOX0NNQUtFX0lOU1RBTExfRklMRVMKPgo+IElm
IHRoZSB0b29sY2hhaW5maWxlLmNtYWtlIGZpbGUgd2FzIGdlbmVyYXRlZCB3aXRoIEJSMl9FTkFC
TEVfREVCVUcsIEJSMl9ERUJVR18zCj4gYW5kIEJSMl9PUFRJTUlaRV9HIHNldCBidXQgdGhpcyBz
ZXR0aW5nIHdhcyB1cGRhdGVkIGFmdGVyLCBpdCBtZWFucyB5b3UgaGF2ZSB0bwo+IGRvIGEgbmV3
IGJ1aWxkLiBCdWlsZHJvb3QgZG9lc24ndCBkZXRlY3Qgc3VjaCBjaGFuZ2UgYW5kIGEgbmV3IGJ1
aWxkIGZyb20KPiBzY3JhdGNoIGlzIG5lZWRlZC4KCkFoaCB0aGF0IHdhcyBpbmRlZWQgaXQuIEkg
Y2FuIGRyb3AgdGhlc2UgcGF0Y2hlcy4gU29ycnkgZm9yIHRoZSBub2lzZS4KCi0tIApBbGV4IEJl
bm7DqWUKVmlydHVhbGlzYXRpb24gVGVjaCBMZWFkIEAgTGluYXJvCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
