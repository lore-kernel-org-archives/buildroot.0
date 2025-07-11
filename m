Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCB6C8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 11:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DD3760E4F;
	Fri, 11 Jul 2025 11:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECx4LGq3eIgr; Fri, 11 Jul 2025 11:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BD6B60B1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BD6B60B1D;
	Fri, 11 Jul 2025 11:30:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D40181E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 11:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5B71406D7
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 11:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2gOv0FPvFN5 for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 11:30:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A330840669
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A330840669
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A330840669
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 11:30:20 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so13056495e9.1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 04:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752233418; x=1752838218;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Rz3eabiBqdoDAMcTtisddbIaSQi680Qm5PlmcO1hSNE=;
 b=XzL+bhxGenUISDNMAj3PxwC0bJoTa2WW+2C9jtb1XuwWJVJZODx2deugSeZzFUGJSY
 iEtyHBeCZKQBWc/VquLx0e8uMwV2vgQaUnUhYh6JyTveen/ETwdFd4qzVy9hS8K0or2j
 c0bcMlWYlkezrN6O8lXaf478GfD07iTRTSCL8RdvYTy3yi70u+3VY6VgBcmkU7CJ5WQH
 Ow6nr1vdTEObu3g0XmDinFHXFdD+HfDOTyKlNlw+z6IBfQcT1pgO1cTS+SG/+iC22vN3
 EGkqr3pqA2kBWnjF1c3ukrtwsjlqZ31SFwARrhxmM8qiQ1xHhSLki7qH6RSoHwQn+djH
 Gb9Q==
X-Gm-Message-State: AOJu0YygHZHtp7SJhDgqzBHWs3GuWgV8iPq6osOKb3UdPv5YK6aoawnG
 LpqJrMuen/E2IF3Uo/HbQwTOp6aa6GV9/ZZIiHEPr45BuNqTYxRhgIsNQcXk0YpMIDr+8Y3yfrr
 v/M92CqU=
X-Gm-Gg: ASbGncu/FCmgrJNHlZcBzC5NsP2osyC8xBz0VepDHJhKc3PRcGkDhKYqY8ime68003P
 r7ymwD8chkKPXWRQy8p8dcdBpHVTY+pgBsq7qOQdyJf1fc5cBDYGA8YTxRRSZbV7ibOJFDf7Oyy
 oHA/9+aDziSLGB6jimbIsRfdVrq1lnMHZ/Pfla9IJNlqWY3/tLQYeMEftxrd1/rX6f+0/b+moeA
 BGDgpTmutbZvGCYNQsTV0gWCWLkOnE3EYjEiIbATwhu9BhVuLnQ/6iz8FrP0L/yw7oT6KV+Gh8H
 yn7tOEqzvXwtMDdusbcx+5gaMPZJaXKt53WkFxcSNG/BA33ebv92X6TC5bQQIOWQYKB+lUQZbid
 W+6R82OD2f8Ckim189VAPkZmTBXKJSnwzlw==
X-Google-Smtp-Source: AGHT+IHxd2mU7H7rCMliTqKglrGnt1yhnf0qXA3fJ8MBdoknzHd+d0siYk/2abzQQkr9TAlugAfdWg==
X-Received: by 2002:a05:600c:8b55:b0:43c:fa24:8721 with SMTP id
 5b1f17b1804b1-45565ed62ecmr25926745e9.17.1752233417834; 
 Fri, 11 Jul 2025 04:30:17 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e25e75sm4157203f8f.87.2025.07.11.04.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 04:30:16 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 03B115F81E;
 Fri, 11 Jul 2025 12:30:16 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org,  Thomas Huth <huth@tuxfamily.org>,  Cyril Bur
 <cyrilbur@gmail.com>
In-Reply-To: <62e082ee-feb3-40d0-a88e-32ee76db7a8e@smile.fr> (Romain Naour's
 message of "Sat, 5 Jul 2025 21:09:15 +0200")
References: <20250619144837.1298990-1-alex.bennee@linaro.org>
 <20250619144837.1298990-3-alex.bennee@linaro.org>
 <62e082ee-feb3-40d0-a88e-32ee76db7a8e@smile.fr>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Fri, 11 Jul 2025 12:30:15 +0100
Message-ID: <87ldovrmm0.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752233418; x=1752838218; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rz3eabiBqdoDAMcTtisddbIaSQi680Qm5PlmcO1hSNE=;
 b=pfnaCJXrcIf5pk1bNbWWQPPgMJ5XKOByKqxlm3VePOl0pA9tvnUKh0JD07OrbktuH1
 k2/6s5+Qn8tZ8d9xUmQH5B3OdxAJqfGStnRLffSY6OW49uB3jy/ji+oemOF3PhAu5Xg2
 q1gKxqyv+VS7pBOfVvdKiiM1icvM0eyfWv3esV7PO/SNNteR/CTeJjNPZ7HNWiPGKC5v
 NqFwyHV42rXTrb8un82uGJPpYdXDKURjMksqeqO1/E7c6Efs1OppjPA3XUCskC/mKXcV
 D7DWVc2VkpBN/GyZaozwIrQWkV5gtE07+Fj1RL7Star9gOIWuH+86pMFLBc4TBNGho7O
 6tHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pfnaCJXr
Subject: Re: [Buildroot] [PATCH 2/3] package/kvm-unit-tests: add some
 missing deps
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

Um9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyaXRlczoKCj4gSGkgQWxleCwg
QWxsLAo+Cj4gTGUgMTkvMDYvMjAyNSDDoCAxNjo0OCwgQWxleCBCZW5uw6llIGEgw6ljcml0wqA6
Cj4+IFRvIHJ1biB0aGUgdGVzdHMgd2UgbmVlZCBhIHN5c3RlbSBRRU1VLCB0aW1lb3V0LCBnZXRj
b25mIGFuZCBubWFwLW5jYXQKPj4gc28gdXBkYXRlIHRoZSBkZXBlbmRzIGZvciB0aGVtLgo+Cjxz
bmlwPgo+Cj4+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9DT1JFVVRJTFMgIyBmb3IgdGltZW91
dAo+Cj4gQWN0dWFsbHksIGJ1c3lib3ggZG9lcyBzdXBwb3J0IHRpbWVvdXQgY29tbWFuZCBidXQg
dGhpcyBhcHBsZXQgaXMgbm90IGVuYWJsZWQgaW4KPiBvdXIgZGVmYXVsdCBidXN5Ym94IGRlZmNv
bmZpZy4KPgo+IENhbiB5b3UgdHJ5IHRvIGVuYWJsZSB0aGUgdGltZW91dCBhcHBsZXQgaWYga3Zt
LXVuaXQtdGVzdHMgcGFja2FnZSBpcwo+IGVuYWJsZWQ/CgpTYWRseSBpdCBuZWVkcyB0aGUgZnVs
bCBjb3JldXRpbHMgdmVyc2lvbjoKCiAgIyB3aGljaCB0aW1lb3V0CiAgL3Vzci9iaW4vdGltZW91
dAogICMgL3Vzci9zaGFyZS9rdm0tdW5pdC10ZXN0cy9bICAgMTEuNzY4OTc1XSBwbGF0Zm9ybSBn
cGlvLWtleXM6IGRlZmVycmVkIHByb2JlIHBlbmRpbmc6IGdwaW8ta2V5czogZmFpbGVkIHRvIGdl
dCBncGlvCiAgIyAvdXNyL3NoYXJlL2t2bS11bml0LXRlc3RzL3NlbGZ0ZXN0LXNldHVwIAogIEJV
SUxEX0hFQUQ9CiAgdGltZW91dCAtayAxcyAtLWZvcmVncm91bmQgOTBzIC91c3IvYmluL3FlbXUt
c3lzdGVtLWFhcmNoNjQgLW5vZGVmYXVsdHMgLW1hY2hpbmUgdmlydCxnaWMtdmVyc2lvbj1ob3N0
IC1hY2NlbCBrdm0gLWNwdSBob3N0IC1kZXZpY2UgdmlydGlvLXNlcmlhbC1kZXZpY2UgLWRldmlj
ZSB2aXJ0Y29uc29sZSxjaGFyZGV2PWN0ZCAtY2hhcmRldiB0ZXN0ZGV2LGlkPWN0ZCAtZGV2aWNl
IHBjaS10ZXN0ZGV2IC1kaXNwbGF5IG5vbmUgLXNlcmlhbCBzdGRpbyAta2VybmVsIF9OT19GSUxF
XzRVaGVyZV8gLXNtcCAyIC1tIDI1NiAtYXBwZW5kIHNldHVwIHNtcD0yIG1lbT0yNTYgIyAtaW5p
dHJkIC90bXAvdG1wLlNXRTlXNAogIHRpbWVvdXQ6IHVucmVjb2duaXplZCBvcHRpb24gJy0tZm9y
ZWdyb3VuZCcKICBCdXN5Qm94IHYxLjM3LjAgKDIwMjUtMDctMTAgMTk6NTU6MzUgQlNUKSBtdWx0
aS1jYWxsIGJpbmFyeS4KCiAgVXNhZ2U6IHRpbWVvdXQgWy1zIFNJR10gWy1rIEtJTExfU0VDU10g
U0VDUyBQUk9HIEFSR1MKCiAgUnVuIFBST0cuIFNlbmQgU0lHIHRvIGl0IGlmIGl0IGlzIG5vdCBn
b25lIGluIFNFQ1Mgc2Vjb25kcy4KICBEZWZhdWx0IFNJRzogVEVSTS5JZiBpdCBzdGlsbCBleGlz
dHMgaW4gS0lMTF9TRUNTIHNlY29uZHMsIHNlbmQgS0lMTC4KICBTS0lQIHNlbGZ0ZXN0LXNldHVw
IChEZWZhdWx0IFNJRzogVEVSTS5JZiBpdCBzdGlsbCBleGlzdHMgaW4gS0lMTF9TRUNTIHNlY29u
ZHMsIHNlbmQgS0lMTC4pCgo8c25pcD4KCkknbSBmaXhpbmcgdXAgdGhlIG90aGVyIGJpdHMgbm93
LgoKLS0gCkFsZXggQmVubsOpZQpWaXJ0dWFsaXNhdGlvbiBUZWNoIExlYWQgQCBMaW5hcm8KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
