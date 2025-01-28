Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF15C0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 10:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FFC360872;
	Tue, 28 Jan 2025 10:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5pIB8QQRwBp; Tue, 28 Jan 2025 10:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AF6B60E37
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AF6B60E37;
	Tue, 28 Jan 2025 10:01:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 601CEAF7
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 10:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E14780F58
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 10:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18AJkq6220dX for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 10:01:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7221280F66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7221280F66
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7221280F66
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 10:01:57 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43616c12d72so8554805e9.2
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 02:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738058515; x=1738663315;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sL6zcuaC0MsDb9DnYzxyZyOTl0wR8/CS9ICVP4rOnPI=;
 b=Qwe0bO1oJqFOK8ngmQehhuRqGnA8pz/IEMyfm+99T4gim0g4q4/CEbHA1NxqbBLiLC
 Ksw1Nmjmm67Mf0fjTCoRdVz3BTm68DLHmoZWF7POBJ4c7QwiP9ZMDuMFw88zsCT8qgLm
 +g0yR0VS+ZEwdLPivj6K4aOZnn97+7nhxvbRuFKZrRQVccwd/nve+UeXt2f1UvoNaojM
 pRYssDAwluLtE5Q2zGx5MbPCt3y8upssJp/PtXJxQuUvZgiZVBJK8Hw/4fkejHAqbUHI
 gMKNQwd35u2UBwUpp+rM8CrzaIJKuMxZeUd+k55wSLem2z6DDwKaB2Tvp+DAp99F4omk
 IswA==
X-Gm-Message-State: AOJu0Yy6evkg9gyUe5sZMfT//ZF64aPAih5mqh71rDIuUql3gr2VSEGM
 IpHeR93IoAIrQKzgUQzgZkfvOIALRkLMYUPykWka95t9Pa+4uh8a/hvGNczs
X-Gm-Gg: ASbGnctMvr/5RtseESvcMi1HiMMOH/x9OCqglaHpS9zOgViLa3S5dy2nfsMYtBncRhD
 qcUsTQqZqVAKewIn57bxNn2p5Ly8CTn5ipe1Z1F8PjpnAjigStvHpCP9FJWh7y8MzcFYLpB6Lzx
 XBXkXS2sWQUc8+LdXc7XjcGZ6R2sGzKZPSpEWDayij5Fi0bUHlROQVnkQ+08wEpy2gMIeZLlOhC
 g1f3v7Q2aHuodQFwwy3EL0UeuV7GXGlQunBNwKDFd3ve8RK6md3weieaMnoxxd/HqmaBFufWXXL
 V/kSMUxYkF+cFxPi+wJzihGLnw==
X-Google-Smtp-Source: AGHT+IHkwQyFgs0qETjzkyW9oosvB85iwMEOFjnX9V5hbegs+07lww8HgCUN3eQsSuUtjpL2ogJKiQ==
X-Received: by 2002:a05:600c:4fd6:b0:434:f586:7535 with SMTP id
 5b1f17b1804b1-438912d2c8cmr155256165e9.0.1738058514873; 
 Tue, 28 Jan 2025 02:01:54 -0800 (PST)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4b9984sm163115405e9.28.2025.01.28.02.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 02:01:54 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
Date: Tue, 28 Jan 2025 11:01:51 +0100
Message-ID: <20250128100151.2132875-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738058515; x=1738663315; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=sL6zcuaC0MsDb9DnYzxyZyOTl0wR8/CS9ICVP4rOnPI=;
 b=CGJXwquJki5hn68KN8R/lobIb/3NfXcz6pqMynch5Z1C/39qXG3MEkXGeIr2B8WpWs
 jam2F+BDjPHEf0iGa1BNerK3JHJtP8qf1psFGGd0Z2XHyxo+OKbxWs3vqccrVyJyegUa
 +GTPY1FbxhTQ5fXbiyij1aiFRwR8QTDYxQTiO0f8M3md1KUyLonCcl2hZ9UMYVisKRdA
 NrWVer5mF7UG7N9qJLfimUAyjz5rpur8BqNEpxgOX61bgLfJWetCjsviobMA0NFIJ86b
 z094K+eK/h73s5eWxGf4WNYynX64J7jMOiD6DP/Q8Vv7IWKQNcwGIlMwkJNnE9IyUHE5
 vKIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CGJXwquJ
Subject: [Buildroot] [PATCH 1/1] support/scripts/genimage.sh: add shell
 option -e
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

VGhlIGNvbW1pdCA2ODg5MDU2ZjFlIChzdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2gpIGFkZHMg
c3VwcG9ydCBmb3IKY3JlYXRpbmcgYm1hcCBpbWFnZXMuCgpTaW5jZSB0aGVuLCB0aGUgc2NyaXB0
IGdlbmltYWdlLnNoIGxvb3NlcyB0aGUgZXJyb3IgcmV0dXJuZWQgYnkgdGhlCmdlbmltYWdlIGNv
bW1hbmQuCgpBcyBhIGNvbnNlcXVlbmNlLCB0aGUgdGFyZ2V0LWZpbmFsaXplIHRhcmdldCBsb29z
ZXMgdGhlIGVycm9yIGFzIHdlbGwsCmFuZCBzbyBvbiB1cCB0byBtYWtlLgoKVGhpcyBhZGRzIHRo
ZSBzaGVsbCBvcHRpb24gLWUgdG8gZXhpdCBpbW1lZGlhdGVseSBpZiBhIGNvbW1hbmQgZW5kcyB3
aXRoCmFuIGVycm9yLCBzbyB0aGUgZXJyb3IgaXMgbm90IGlnbm9yZWQuCgpGaXhlczoKCglncG9y
dGF5QGFyY2hsaW51eCB+L3NyYy9ydG9uZS1icjItZXh0ZXJuYWwgJCBtYWtlCgkoLi4uKQoJPj4+
ICAgRXhlY3V0aW5nIHBvc3QtaW1hZ2Ugc2NyaXB0IHN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5z
aAoJSU5GTzogY21kOiAibWtkaXIgLXAgIi9ob21lL2dwb3J0YXkvc3JjL3J0b25lLWJyMi1leHRl
cm5hbC9vdXRwdXQvYnVpbGQvZ2VuaW1hZ2UudG1wIiIgKHN0ZGVycik6CglJTkZPOiBjbWQ6ICJy
bSAtcmYgIi9ob21lL2dwb3J0YXkvc3JjL3J0b25lLWJyMi1leHRlcm5hbC9vdXRwdXQvYnVpbGQv
Z2VuaW1hZ2UudG1wIi8qIiAoc3RkZXJyKToKCUlORk86IGNtZDogIm1rZGlyIC1wICIvaG9tZS9n
cG9ydGF5L3NyYy9ydG9uZS1icjItZXh0ZXJuYWwvb3V0cHV0L2J1aWxkL2dlbmltYWdlLnRtcCIi
IChzdGRlcnIpOgoJSU5GTzogY21kOiAiY3AgLWEgIi90bXAvdG1wLkVjbEtHd3RBNFIiICIvaG9t
ZS9ncG9ydGF5L3NyYy9ydG9uZS1icjItZXh0ZXJuYWwvb3V0cHV0L2J1aWxkL2dlbmltYWdlLnRt
cC9yb290IiIgKHN0ZGVycik6CglJTkZPOiBjbWQ6ICJta2RpciAtcCAiL2hvbWUvZ3BvcnRheS9z
cmMvcnRvbmUtYnIyLWV4dGVybmFsL291dHB1dC9pbWFnZXMiIiAoc3RkZXJyKToKCUlORk86IHZm
YXQoZWZpLXBhcnQudmZhdCk6IGNtZDogIm1rZG9zZnMgICAnL2hvbWUvZ3BvcnRheS9zcmMvcnRv
bmUtYnIyLWV4dGVybmFsL291dHB1dC9pbWFnZXMvZWZpLXBhcnQudmZhdCciIChzdGRlcnIpOgoJ
SU5GTzogdmZhdChlZmktcGFydC52ZmF0KTogYWRkaW5nIGZpbGUgJ2VmaS1wYXJ0L0VGSScgYXMg
J0VGSScgLi4uCglJTkZPOiB2ZmF0KGVmaS1wYXJ0LnZmYXQpOiBjbWQ6ICJNVE9PTFNfU0tJUF9D
SEVDSz0xIG1jb3B5IC1zcCAtaSAnL2hvbWUvZ3BvcnRheS9zcmMvcnRvbmUtYnIyLWV4dGVybmFs
L291dHB1dC9pbWFnZXMvZWZpLXBhcnQudmZhdCcgJy9ob21lL2dwb3J0YXkvc3JjL3J0b25lLWJy
Mi1leHRlcm5hbC9vdXRwdXQvaW1hZ2VzL2VmaS1wYXJ0L0VGSScgJzo6RUZJJyIgKHN0ZGVycik6
CglEaXNrIGZ1bGwKCUlORk86IHZmYXQoZWZpLXBhcnQudmZhdCk6IGNtZDogInJtIC1mICIvaG9t
ZS9ncG9ydGF5L3NyYy9ydG9uZS1icjItZXh0ZXJuYWwvb3V0cHV0L2ltYWdlcy9lZmktcGFydC52
ZmF0IiIgKHN0ZGVycik6CglFUlJPUjogdmZhdChlZmktcGFydC52ZmF0KTogZmFpbGVkIHRvIGdl
bmVyYXRlIGVmaS1wYXJ0LnZmYXQKCUlORk86IGNtZDogInJtIC1yZiAiL2hvbWUvZ3BvcnRheS9z
cmMvcnRvbmUtYnIyLWV4dGVybmFsL291dHB1dC9idWlsZC9nZW5pbWFnZS50bXAvIiIgKHN0ZGVy
cik6CgltYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUvZ3BvcnRheS9zcmMvcnRvbmUt
YnIyLWV4dGVybmFsL2J1aWxkcm9vdCcKCWdwb3J0YXlAYXJjaGxpbnV4IH4vc3JjL3J0b25lLWJy
Mi1leHRlcm5hbCAkIGVjaG8gJD8KCTAKClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2Fl
bC5wb3J0YXkrcnRvbmVAZ21haWwuY29tPgotLS0KIHN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5z
aCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9z
dXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2ggYi9zdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2gK
aW5kZXggZGYyMjQyNDFhYi4uODY1Nzk0MGJlNSAxMDA3NTUKLS0tIGEvc3VwcG9ydC9zY3JpcHRz
L2dlbmltYWdlLnNoCisrKyBiL3N1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaApAQCAtMSw1ICsx
LDcgQEAKICMhL3Vzci9iaW4vZW52IGJhc2gKIAorc2V0IC1lCisKIGRpZSgpIHsKICAgY2F0IDw8
RU9GID4mMgogRXJyb3I6ICRACi0tIAoyLjQ4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
