Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C096C5AD49
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 06:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D88F81E74;
	Tue,  3 Jun 2025 06:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gnrL4LU3cSL3; Tue,  3 Jun 2025 06:39:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E0CF81FEB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E0CF81FEB;
	Tue,  3 Jun 2025 06:39:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C568DA
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0231581FEB
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSbqpg5aiZf9 for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 06:39:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33D8581E74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33D8581E74
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33D8581E74
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:39:11 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-442e9c00bf4so33525765e9.3
 for <buildroot@buildroot.org>; Mon, 02 Jun 2025 23:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748932750; x=1749537550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wu9j0ht+iofTLfE5dAwzU6xC4bInppnf88TUizm6t1M=;
 b=GocOQtTqE8nJllyShCn3k1Spga0ZlL2AsHeSxH8CF9PD5E9Y+r5EV/v+sPey6HeUa0
 bdp3NfgK3KCOga3xKS6MNG/YTbjahqTsdhPr1AtZjC6OKo8VhZH5PAhUnVcquEWLQA9N
 7v+ONhSApqAombQPuMkZ8eAgIJv2LGQvQXayg9RSDtS65Njwqz8w0y/SPjsP+M7Zsvxf
 TqCjDhrOPbe5SWcSc1+Rc6KnX9pbUVHL96sSqFnfAP6JQBnrr67rAMUnbWm+nKTXIhIL
 LvGIaoLlLeiQuCxRJDljEcAaHi4JVNjqYuzEWZ/Yc9B64g6+tbS6yGCf35XwKEcS+gIf
 OnAA==
X-Gm-Message-State: AOJu0YzFB0MG8HzshWjg9j3Z1G1P0Sw2L8+LzJgtw/67JKahgQchLeaj
 HaBjAoc2FJ2K4WNLW/eMi/+oVeR/NJ2RP0gmXbnvGZ6tkCvTg7UGmtKF42rpbtTkhALSlnbNpbG
 gxjLW4zg=
X-Gm-Gg: ASbGnctaN/kWEAXZppQlFUIbvBsUppjmN+uKnuIQPyJpLzLG81jmcrLsg1Vq3fryKqT
 HH/pvcVBuYHEeIuguZBPa0DDrjajwKXENavxmaxXt9AatJ8kxK5rgByk3YZQX4x+45Wd4c4DouY
 RsQHk6zKwBXvvWSor9tJpti0Q1mqKFx5w8omA9/cqsnqxJCb3vU2hSd3aq0WnG0VP6xLnJMC2t9
 b1fiVcr8qNWx+G9uhPAmHAewK01FBNWiMQ2jpSiHQN/NNgiqVeRndpMbPc677wrJxZhFvaKisp0
 v2jqVFxPDS2Efu2e1zSrKHG1udFIbnj4GMPEVIflFLzvhDyKhixZfMNj7McqI00N7lJsJdg=
X-Google-Smtp-Source: AGHT+IG4mb8nwhjQcqRm00hCdAHccyRT8vMAcIoIBPMtukP6Bn9Jy+/aei/06aIHwrPna+5yHFe4eg==
X-Received: by 2002:a05:600c:468e:b0:450:d00d:588b with SMTP id
 5b1f17b1804b1-450d8819daamr153869385e9.9.1748932749825; 
 Mon, 02 Jun 2025 23:39:09 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f0097539sm17574539f8f.63.2025.06.02.23.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 23:39:09 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Tue,  3 Jun 2025 08:38:42 +0200
Message-ID: <20250603063844.194753-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1748932750; x=1749537550; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wu9j0ht+iofTLfE5dAwzU6xC4bInppnf88TUizm6t1M=;
 b=SKvzZpH2sWRj+umEvniy2AS076Zq0hs3f033B3gyOfCejzSnOiAGtvE4VdgLztTp69
 FV8w/UAQ6NGoAm3ZJYKtg6NXNTIeV60I4BT3B4logE1243jCpzWhS5f56f9akWefSOXk
 CJOAwMVWs2f/I3rUVZT84TD+Ebpu6fzS28EJnM6qqNA+cDWvDd6IOqe0m3ma5DfcqU6W
 2jGb2HdNUAgzs0dxMbyV5yd/ZANzyqhltBx53z2Ds5fsqsd9IGHG952/WIMhtX4yvWGJ
 izlCHdgh86GvWn9qcxDkcOwMguvxwA+fWi1j++uIyQh0PXlXbZGgZwK0Eh0B3uZdA465
 j71w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SKvzZpH2
Subject: [Buildroot] [PATCH 1/1] utils/get-developers: add option to list
 packages matching developers
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gc29tZSBjYXNlcyBpdCBjYW4gYmUgdXNlZnVsIHRvIGJlIGFibGUgdG8gcmV0cmlldmUgdGhl
IGxpc3Qgb2YKcGFja2FnZXMgcmVnaXN0ZXJlZCBpbiB0aGUgZGV2ZWxvcGVycyBmaWxlIGZvciBj
ZXJ0YWluIHVzZXJzLgpGb3IgZXhhbXBsZSwgb25lIG1pZ2h0IHdhbnQgdG8gcmV0cmlldmUgYWxs
IHRoZSBwYWNrYWdlcyByZWxhdGVkIHRvIGEKc3BlY2lmaWMgZG9tYWluIG5hbWUgKGUuZy4gYSBj
b21wYW55KSB0byB1c2UgaXQgZWxzZXdoZXJlIChlLmcuIGZlZWQKaXQgaW50byBwa2ctc3RhdHMp
LgoKQXMgJy1kJyBpcyBhbHJlYWR5IHRha2VuLCB0aGUgbmV3IG9wdGlvbiB1c2VzICctcicgKGZv
ciByZWdleCkgZm9yCmxhY2sgb2Ygc29tZXRoaW5nIGJldHRlci4KClNpZ25lZC1vZmYtYnk6IFJh
cGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KLS0tCiB1dGlscy9nZXQt
ZGV2ZWxvcGVycyB8IDE0ICsrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL3V0aWxzL2dldC1kZXZlbG9wZXJzIGIvdXRpbHMvZ2V0LWRl
dmVsb3BlcnMKaW5kZXggODNjNTczYmYyMy4uZWM5MDFlNGMwYyAxMDA3NTUKLS0tIGEvdXRpbHMv
Z2V0LWRldmVsb3BlcnMKKysrIGIvdXRpbHMvZ2V0LWRldmVsb3BlcnMKQEAgLTIsNiArMiw3IEBA
CiAKIGltcG9ydCBhcmdwYXJzZQogaW1wb3J0IGdldGRldmVsb3BlcmxpYgoraW1wb3J0IHJlCiBp
bXBvcnQgc3lzCiAKIApAQCAtMTMsNiArMTQsOCBAQCBkZWYgX19tYWluX18oKToKICAgICAgICAg
ICAgICAgICAgICAgICAgIGhlbHA9J2ZpbmQgZGV2ZWxvcGVycyBpbiBjaGFyZ2Ugb2YgdGhpcyBh
cmNoaXRlY3R1cmUnKQogICAgIHBhcnNlci5hZGRfYXJndW1lbnQoJy1wJywgZGVzdD0ncGFja2Fn
ZScsIGFjdGlvbj0nc3RvcmUnLAogICAgICAgICAgICAgICAgICAgICAgICAgaGVscD0nZmluZCBk
ZXZlbG9wZXJzIGluIGNoYXJnZSBvZiB0aGlzIHBhY2thZ2UnKQorICAgIHBhcnNlci5hZGRfYXJn
dW1lbnQoJy1yJywgZGVzdD0nZGV2ZWxvcGVycycsIGFjdGlvbj0nc3RvcmUnLAorICAgICAgICAg
ICAgICAgICAgICAgICAgaGVscD0nZmluZCBwYWNrYWdlcyBoYW5kbGVkIGJ5IGRldmVsb3BlcnMg
bWF0Y2hpbmcgYSByZWdleCcpCiAgICAgcGFyc2VyLmFkZF9hcmd1bWVudCgnLWYnLCBkZXN0PSdm
aWxlcycsIG5hcmdzPScqJywKICAgICAgICAgICAgICAgICAgICAgICAgIGhlbHA9J2ZpbmQgZGV2
ZWxvcGVycyBpbiBjaGFyZ2Ugb2YgdGhlc2UgZmlsZXMnKQogICAgIHBhcnNlci5hZGRfYXJndW1l
bnQoJy1jJywgZGVzdD0nY2hlY2snLCBhY3Rpb249J3N0b3JlX2NvbnN0JywKQEAgLTM5LDYgKzQy
LDggQEAgZGVmIF9fbWFpbl9fKCk6CiAgICAgICAgIGFjdGlvbiArPSAxCiAgICAgaWYgYXJncy52
YWxpZGF0ZToKICAgICAgICAgYWN0aW9uICs9IDEKKyAgICBpZiBhcmdzLmRldmVsb3BlcnM6Cisg
ICAgICAgIGFjdGlvbiArPSAxCiAgICAgaWYgbGVuKGFyZ3MucGF0Y2hlcykgIT0gMDoKICAgICAg
ICAgYWN0aW9uICs9IDEKICAgICBpZiBhY3Rpb24gPiAxOgpAQCAtODYsNiArOTEsMTUgQEAgZGVm
IF9fbWFpbl9fKCk6CiAgICAgICAgICAgICAgICAgICAgIHByaW50KGRldi5uYW1lKQogICAgICAg
ICAgICAgICAgICAgICBicmVhawogCisgICAgIyBIYW5kbGUgdGhlIGRldmVsb3BlcnMgYWN0aW9u
CisgICAgaWYgYXJncy5kZXZlbG9wZXJzIGlzIG5vdCBOb25lOgorICAgICAgICBkZXZlbG9wZXJz
X3JlID0gcmUuY29tcGlsZShhcmdzLmRldmVsb3BlcnMpCisgICAgICAgIGZvciBkZXYgaW4gZGV2
czoKKyAgICAgICAgICAgIGlmIGRldmVsb3BlcnNfcmUubWF0Y2goZGV2Lm5hbWUpOgorICAgICAg
ICAgICAgICAgIGZvciBwYWNrYWdlIGluIGRldi5wYWNrYWdlczoKKyAgICAgICAgICAgICAgICAg
ICAgcHJpbnQocGFja2FnZSkKKyAgICAgICAgcmV0dXJuCisKICAgICAjIEhhbmRsZSB0aGUgcGF0
Y2hlcyBhY3Rpb24KICAgICBpZiBsZW4oYXJncy5wYXRjaGVzKSAhPSAwOgogICAgICAgICAoZmls
ZXMsIGluZnJhcykgPSBnZXRkZXZlbG9wZXJsaWIuYW5hbHl6ZV9wYXRjaGVzKGFyZ3MucGF0Y2hl
cykKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
