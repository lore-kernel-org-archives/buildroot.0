Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4493EC31D97
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 08:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F089E40806;
	Wed,  3 Jul 2024 08:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nya941LF6PhY; Wed,  3 Jul 2024 08:29:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C37E640877
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C37E640877;
	Wed,  3 Jul 2024 08:29:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD03B1BF2EC
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 08:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B64D64020B
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 08:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2hCLYEezen7 for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 08:29:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 92E2F4035D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92E2F4035D
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92E2F4035D
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 08:29:07 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57cb9a370ddso3318495a12.1
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 01:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719995345; x=1720600145;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PTDKZpKyzV2SbgN4EVrUu5hbd8V7M1Qv5OG1OIERG3U=;
 b=iudXXJjf3UUFgfSg8SWKOFLrvchJerVp8v8S6QOmryL3+tuXXiMOrIAQVZ6v3fGerR
 QlP1QysIaiO3vKdcWPgrUB25EzDpEz2LntZB+5wqgvjQ9lXXVVg71nBpx/zL+xFbawf1
 3ErvD9v+Cj0NVfudFkBgV5tPeQaiVM+VkPQJfSt1n/ScAbxnYrG7vPMHuy3mdkt5GsqC
 io0txr6JDfEYoFb105Qidj5fROs7b3wJIFjcCL7+higslpAGgD54yWLUtztI4yCNZmpH
 29hMP2vvm7glsclxXv5/r+kQ8zA4k5D4V0s8cwXtPBt9ceIGC9crpt8Yyp0yeicSQlOC
 CjJA==
X-Gm-Message-State: AOJu0Yz4dp1jsbfQRl3tJ8lf566xkbf5LzOMKg1dRye36C9Na23c9fEn
 8CP6gwMHl36kQ7wQ0pDrN1c7ObQwDy9Ef/3FvhhinJ8U/utWMj+j1mzH+iLCTblRhm5XMxdJWI1
 3
X-Google-Smtp-Source: AGHT+IGy8Y4GzHO0q4TJjSHUBiMu4ot7mYHkj/F7A0KP1g+xRlHJBfQr5Z2pz1ND9C2LXacNnl0dGQ==
X-Received: by 2002:a05:6402:5112:b0:57d:5286:b513 with SMTP id
 4fb4d7f45d1cf-5879ecea053mr7393056a12.9.1719995345087; 
 Wed, 03 Jul 2024 01:29:05 -0700 (PDT)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324f0a3sm6725115a12.35.2024.07.03.01.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 01:29:04 -0700 (PDT)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 10:28:46 +0200
Message-Id: <20240703082850.750420-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1719995345; x=1720600145; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PTDKZpKyzV2SbgN4EVrUu5hbd8V7M1Qv5OG1OIERG3U=;
 b=FKWpExQoS83rXke0z3eSQ1fe12EYl78M63ctaPsvblBiKQvbZlyOOG5M3W2jzo+dza
 tt76OKW3VXdxceWVWwzew/GRbOPpgr/GAS76yvjJ1VvaRE+r4sSaozGEu0OGYVXW1Rqg
 yXWWHs7n4+hot4aLI7hPMXE8ceBCT65kVQi10cf5HAb14xOruFvHA6MwQhBRQYMr8F33
 cnKsqx8DFebPJbKCNJj4h6wRnFkoiUesDeVLIcIEGPF5RK5JNagN/Fq2RDZJGdbC1X4u
 pN1T7lV+rjL8pQDck5wZkhlMuDLQkQeMsFwnCHJddQAlvQO7wOVIbdogFtU7O0BcUsKX
 lx4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=FKWpExQo
Subject: [Buildroot] [PATCH 0/4] Improve configurability of EROFS filesystem
 images
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
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Gao Xiang <hsiangkao@aol.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGN1cnJlbnQgQnVpbGRyb290IHN1cHBvcnQgb2YgRVJPRlMgaXMgYSBiaXQgbGFja2luZyBp
biB0ZXJtcyBvZgpvcHRpb25zIHRoYXQgY2FuIGJlIGNvbmZpZ3VyZWQsIGVzcGVjaWFsbHkgaXQn
cyBub3QgcG9zc2libGUgdG8gZ2V0CmNvbXByZXNzaW9uIGxldmVsIHRoYXQgaXMgb24gcGFyIHdp
dGggc3F1YXNoZnMuIFRoaXMgcGF0Y2ggc2VyaWVzCnVwZGF0ZXMgZXJvZnMtdXRpbHMgdG8gdGhl
IGxhdGVzdCB2ZXJzaW9uIGFuZCBhZGRzIG9wdGlvbnMgdGhhdCBlbmFibGUKYmV0dGVyIGNvbXBy
ZXNzaW9uIGxldmVscyBhbmQgZGVkdXBsaWNhdGlvbiBmZWF0dXJlcyB0aGF0IGhhdmUgYmVlbgph
ZGRlZCByZWNlbnRseS4KCkl0IHNob3VsZCBiZSBub3RlZCB0aGF0IGEgcmVjZW50IGtlcm5lbCBp
cyBuZWVkZWQgdG8gdXNlIGFsbCB0aGUKZmVhdHVyZXMsIGJ1dCBhbGwgdGhlIGZlYXR1cmVzIGlu
dHJvZHVjZWQgaGVyZSB3b3JrIGF0IGxlYXN0IHdpdGggTGludXgKNi4xIG9yIG5ld2VyICh3aXRo
IG1vcmUgZGV0YWlscyBpbiBoZWxwIHRleHRzIG9mIHRoZSBpbmRpdmlkdWFsIGNvbmZpZwpvcHRp
b25zKS4KCkphbiDEjGVybcOhayAoNCk6CiAgcGFja2FnZS9lcm9mcy11dGlsczogYnVtcCB0byAx
LjcuMQogIHBhY2thZ2UvZXJvZnMtdXRpbHM6IGFkZCBjb25maWcgb3B0aW9uIGZvciBMWk1BIGNv
bXByZXNzaW9uCiAgZnMvZXJvZnM6IGFkZCBMWk1BIGNvbXByZXNzaW9uLCBhbGxvdyBjb25maWd1
cmFibGUgY29tcHJlc3Npb24gbGV2ZWwKICBmcy9lcm9mczogYWRkIGNvbmZpZyBvcHRpb25zIGZv
ciBkZWR1cGUsIGZyYWdtZW50cyBhbmQgenRhaWxwYWNraW5nCgogZnMvZXJvZnMvQ29uZmlnLmlu
ICAgICAgICAgICAgICAgICAgIHwgNzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogZnMv
ZXJvZnMvZXJvZnMubWsgICAgICAgICAgICAgICAgICAgIHwgMjQgKysrKysrKysrLQogcGFja2Fn
ZS9lcm9mcy11dGlscy9Db25maWcuaW4gICAgICAgIHwgIDYgKysrCiBwYWNrYWdlL2Vyb2ZzLXV0
aWxzL2Vyb2ZzLXV0aWxzLmhhc2ggfCAgMiArLQogcGFja2FnZS9lcm9mcy11dGlscy9lcm9mcy11
dGlscy5tayAgIHwgMTMgKysrLS0KIDUgZmlsZXMgY2hhbmdlZCwgMTA4IGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
