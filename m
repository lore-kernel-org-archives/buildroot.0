Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80990C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 11:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EFBE848F0;
	Fri, 14 Feb 2025 11:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBS9p6_jJe-v; Fri, 14 Feb 2025 11:21:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43856848F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43856848F3;
	Fri, 14 Feb 2025 11:21:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 143CAC2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 018AF41610
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGrrtT7ggdNC for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 11:21:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9922C415EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9922C415EF
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9922C415EF
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:21:50 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5de6e26d4e4so3650492a12.1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 03:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739532108; x=1740136908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jhLngQjFLI4HxfbrvEeP0AQkcyYLdCJkYFJf5bejkY0=;
 b=M09w+gyR0oLpE88He8yOSmyUCBipH+7w7sRGyZVtdu/rdn5yeePEcRrPUWzeGEjB++
 QWZG06GlanagMJhIJjPk5d1eK7QAzOXvAnxzRHaJvDYlsS6BxPYr0X7AWpXIYctE2HSI
 bPKEkM22fh57N5YR+bSCcT6o4HnhSblXQRPWDCdwaP9Ll78kdDdY96Z8jm55JoJnVCCA
 /JOV8CCNLR49tgGiT/yMIEUD9Vc1861jk5wwe58SGqpj+Zsoum9vH0fpL8EVsd7Rkuj1
 Vli+uvWCoqQzZ+l+sLNQzsjQjteET1+rxNbDwXLsL0yj0nwWSFRBWuBjlqYCEuAccrCI
 CmmQ==
X-Gm-Message-State: AOJu0YyIaEQIGO/02EgzjkIkXWHrPpdcZXyqnmf6iTyJ6wsMNmlTJHkK
 3iTLV253INgbLapL0s8oSAWLDk+WEpUodzQQYG0RC//rE9uJMuLs4B4mQCWGbUzfDpou8+vDsjg
 W
X-Gm-Gg: ASbGncvHdWg8KTZW4ao7Ju77GUosgAS3XK/gB4uDupJHamNvyM8zcgFwEq+9fWM1KvC
 s4zlSc0tqrH2igDn7VmNnRRiTaLfVLwVT2UlWda8vpa9mKadB+z6UKQuqX9OokNbKd7JnQ/axEw
 kVlS3lIG1hMzf4NaeCMAMg2HmrnUbNuvZJdNLMhKWDtPBf1amybuMFoelcFMdTMZIrZFXca2BXi
 +/dpUnWowMcV9Smf5jLWvD5cizDzgrKmLlr0UWwozM0o4NIo+nxexwoU36J1M1y3+m1eLvUJOPc
 sIzV0L0O7FmlDfQb8liN+70jJHVgtPeBsZyQe1OkUEk=
X-Google-Smtp-Source: AGHT+IFIlUH8epxJ/zJwC7EgIvC3JamWpcWhcGdLoCttMPDnVN+qus89v+g0kxvWy0bgQGr9DdjKNA==
X-Received: by 2002:a17:906:dc93:b0:ab7:63fa:e4ab with SMTP id
 a640c23a62f3a-ab7f31949e7mr1123895266b.0.1739532108290; 
 Fri, 14 Feb 2025 03:21:48 -0800 (PST)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece270b17sm2725181a12.62.2025.02.14.03.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:21:47 -0800 (PST)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Fri, 14 Feb 2025 12:21:36 +0100
Message-ID: <20250214112140.1862254-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1739532108; x=1740136908; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jhLngQjFLI4HxfbrvEeP0AQkcyYLdCJkYFJf5bejkY0=;
 b=U1gu173J7jV+6Nh65njx9WqMKBXuibPEu3eAav5idymJTqKLyM8JLt9AeOkl0bmDfE
 05YTWLWhNHAKM2GPJxKyTmuPW/MxkLfZqvVC4I0sD1YKb1Mz3rQkEdwWWjzx3EtAiCEl
 7oPdyrVOMMdI9cKmFqe8sFHs9k33thMWonKnyicRHALS6l+sH9fbZ3LH4WdFYkEP261E
 IHfcyOnMyJ2Y+lhVUQYKwy458E3Wstgs/kPKCgeXamPXZimGSVLZEVXfY0jfdWfDK56G
 WIvxilt3iJ/s332zvxAXvmkjzaczNTBZaQMy8XeFZwAS2TmgklymaknNu26Q6L4wk3Pm
 rdGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=U1gu173J
Subject: [Buildroot] [v2 0/3] Improve configurability of EROFS filesystem
 images
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
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
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
b25zKS4KCkNoYW5nZXMgc2luY2UgdjEgWzFdOgogLSBSZW1vdmVkIGFscmVhZHkgbWVyZ2VkIGNo
YW5nZXMgb2YgcGFja2FnZS9lcm9mcy11dGlscy4KIC0gSW1wcm92ZWQgaGVscCB0ZXh0cyBwZXIg
cmV2aWV3IGNvbW1lbnRzLgogLSBSZW1vdmVkIHVubmVjZXNzYXJ5IHN0cmlwIG9mIGFkZGVkIGlu
dCBvcHRpb25zLgogLSBBZGRlZCAiY3VzdG9tIiBvcHRpb24gZm9yIGFkdmFuY2VkIGNvbXByZXNz
aW9uIGNvbmZpZy4KIC0gUmVtb3ZlZCBMWjQgb3B0aW9uIChpZiBuZWVkZWQsIGNhbiBiZSBzcGVj
aWZpZWQgdmlhIGN1c3RvbSBhbGdvcml0aG1zKS4KCkhvbmVzdGx5LCBJIGtpbmQgb2YgZm9yZ290
IGFib3V0IHRoaXMgc2VyaWVzLCBub3cgSSB3YW50ZWQgYWxzbyB0byBhZGQgdGhlIG5ldwpjb21w
cmVzc2lvbiBvcHRpb24gdG8gdXBzdHJlYW0gYW5kIHJlYWxpemVkIHRoZXJlIHdhcyBubyBmb2xs
b3cgdXAgb24gbXkgc2lkZQpmb3IgdGhlIEFybm91dCdzIHJldmlldy4gU29ycnkgZm9yIHRoYXQu
CgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjQwNzAzMDgyODUwLjc1
MDQyMC0xLXNhaXJvbkBzYWlyb24uY3ovCgpKYW4gxIxlcm3DoWsgKDMpOgogIGZzL2Vyb2ZzOiBh
ZGQgTFpNQSBjb21wcmVzc2lvbiwgYWxsb3cgY29uZmlndXJhYmxlIGNvbXByZXNzaW9uIGxldmVs
CiAgZnMvZXJvZnM6IGFkZCBjb25maWcgb3B0aW9ucyBmb3IgZGVkdXBlLCBmcmFnbWVudHMgYW5k
IHp0YWlscGFja2luZwogIGZzL2Vyb2ZzOiBhZGQgY3VzdG9tIGNvbXByZXNzaW9uIG9wdGlvbiB3
aXRoIG9wdGlvbmFsIGNvbXByZXNzLWhpbnRzCiAgICBmaWxlCgogZnMvZXJvZnMvQ29uZmlnLmlu
IHwgMTE1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogZnMv
ZXJvZnMvZXJvZnMubWsgIHwgIDI1ICsrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTM3IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
