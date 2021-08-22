Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D873FC4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 20:06:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EF4261267
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 20:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EF4261267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 473A44027E;
	Sun, 22 Aug 2021 20:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXiBtq6hm2xh; Sun, 22 Aug 2021 20:06:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73E3340335;
	Sun, 22 Aug 2021 20:06:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FE281BF44C
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 20:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A4204017E
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 20:06:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sIOHwawiuVLf for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 20:06:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6F494000B
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 20:06:32 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id l6so3020277wmq.5
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 13:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CdiPeIIby37tW+yWqBwCTbo51vQJOp/1Z9j10Ncgos0=;
 b=NKcgjPG6aEJdEYorO2azP2o6xq3R/3Q2IIAiMgqxLOUwuy0O8+NzwgFDSoIpg9Hlul
 IIVxQnsuc87ahXKUOeSLBD+P3hB0ycre76yPB32+sBxlVQffdF2cY6y3iD0vHI33i+t1
 4cIka8J1uPTcJNKBbZn/8a9Bpg3h9lvaAL1H38N/xlmfNLvSuexLoCTOkbSNcnzFxp/e
 cw1KlrFQkFOt1i8U6FjzHkMgn1jM5JGDqQ6ZQTPnigFArZaR0EsJ0Ga4kEivn26+KjLS
 aE6GhZa0/HDSh1OhvBGhkblCUqSSQpfqTQ3uurJ1424uTDmQ929BYQLaPACjhXdpiRLt
 s5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CdiPeIIby37tW+yWqBwCTbo51vQJOp/1Z9j10Ncgos0=;
 b=HJ0lCSlyd2TKKAg0nJ6hkjWes+TRSweYJBsgGeQ9w9Z0y7xBwCmCD//ryZjXYkPyje
 Jp4Q3m3W0srspkC04znLWFMSXjP49lR6TCe0xdTCyfGOpRnmpQv2D+iRQBx6rRkDqsUe
 pSIHTXTgXj86xamv3/rJtWWsP5CAkjO3YAY00p18x4iZWxOr1yng8iFoRNAtqpeARW30
 hzMYyahGBuSGQGKrA0sOVH2yYJ7JwiCF8KwCR+Ca0e8ML+5cMGk2sD38XCj/2MgioYjb
 W8Cj7cqz7PxQfczMN7RoF9gTvnwOWRm331eJOogeA/xUgudPsAQqa83iGfEyIBnazjWM
 OC9Q==
X-Gm-Message-State: AOAM530JsRrMJOs1I+iVbBYY3EC0qdA65F3dnnXjtiPER99CcSdOATq1
 82f85utJLecplQA2i+PitX76L1lVjzwyPA==
X-Google-Smtp-Source: ABdhPJzcms0rnSL3GjoU64pIMmdzcr1cA24DWI1C5AZ3iLR4ZgcNo8Ga6638myd41Sagdk2GUtPHXg==
X-Received: by 2002:a1c:1f8e:: with SMTP id f136mr6798786wmf.132.1629662791026; 
 Sun, 22 Aug 2021 13:06:31 -0700 (PDT)
Received: from localhost ([78.30.58.165])
 by smtp.gmail.com with ESMTPSA id z2sm10922930wma.45.2021.08.22.13.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Aug 2021 13:06:29 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Philippe Serbruyns <Philippe.Serbruyns@ugent.be>
Date: Sun, 22 Aug 2021 22:05:19 +0200
Message-Id: <20210822200519.1757151-1-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/zfs: Fix cross-platform-compilations
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

VGhpcyBwYXRjaCBmaXhlcyB0aGUgYG1ha2VgIGV4ZWN1dGVkIGZyb20gdGhlIGBrZXJuZWwubTRg
IGluCmNyb3NzLXBsYXRmb3JtLWNvbXBpbGF0aW9ucyBlbnZpcm9ubWVudHM6Cmh0dHBzOi8vZ2l0
aHViLmNvbS9vcGVuemZzL3pmcy9ibG9iL3pmcy0yLjAuNS9jb25maWcva2VybmVsLm00I0w1ODgK
ClNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1
aXNAZ21haWwuY29tPgotLS0KSGVsbG8gYWxsLgoKQFJvbWFpbiBOYW91ciwgdGhpcyBwYXRjaCB3
aWxsIGZpeCB0aGUgYnVpbGRyb290IGdpdGxhYiBDSS4KCkBQaGlsaXBwZSBTZXJicnV5bnMswqB0
aGlzIHBhdGNoIHdpbGwgZml4IHlvdXIgaXNzdWUgd2l0aCB5b3VyIHJwaTQuCgogcGFja2FnZS96
ZnMvemZzLm1rIHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3pmcy96ZnMubWsgYi9wYWNrYWdlL3pmcy96ZnMu
bWsKaW5kZXggM2IxYWZiNDE5YS4uMjQwNjRjYmE4MiAxMDA2NDQKLS0tIGEvcGFja2FnZS96ZnMv
emZzLm1rCisrKyBiL3BhY2thZ2UvemZzL3pmcy5tawpAQCAtMTMsNiArMTMsMTkgQEAgWkZTX0NQ
RV9JRF9QUk9EVUNUID0gb3BlbnpmcwogCiBaRlNfQVVUT1JFQ09ORiA9IFlFUwogCisjIGNyb3Nz
IGNvbXBpbGUgZW52aXJvbm1lbnQgZm9yIGxpbnV4IGtlcm5lbCBtb2R1bGUKK1pGU19NQUtFX0VO
ViA9IFwKKwlIT1NUQ0M9IiQoSE9TVENDKSAkKEhPU1RfQ0ZMQUdTKSAkKEhPU1RfTERGTEFHUyki
IFwKKwlBUkNIPSQoS0VSTkVMX0FSQ0gpIFwKKwlDUk9TU19DT01QSUxFPSIkKFRBUkdFVF9DUk9T
UykiIFwKKwlERVBNT0Q9JChIT1NUX0RJUikvc2Jpbi9kZXBtb2QKKyMgYC4vY29uZmlndXJlYCB3
aWxsIGV4ZWN1dGUgYSBgbWFrZSBtb2R1bGVzYCB0ZXN0IGNhc2UKK1pGU19DT05GX0VOViA9IFwK
KwlIT1NUQ0M9IiQoSE9TVENDKSAkKEhPU1RfQ0ZMQUdTKSAkKEhPU1RfTERGTEFHUykiIFwKKwlB
UkNIPSQoS0VSTkVMX0FSQ0gpIFwKKwlDUk9TU19DT01QSUxFPSIkKFRBUkdFVF9DUk9TUykiIFwK
KwlERVBNT0Q9JChIT1NUX0RJUikvc2Jpbi9kZXBtb2QKKwogWkZTX0RFUEVOREVOQ0lFUyA9IGxp
YmFpbyBvcGVuc3NsIHVkZXYgdXRpbC1saW51eCB6bGliCiAKICMgc3lzdmluaXQgaW5zdGFsbHMg
b25seSBhIGNvbW1lbnRlZC1vdXQgbW9kdWxlcy1sb2FkLmQvIGNvbmZpZyBmaWxlCi0tIAoyLjMz
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5
Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
