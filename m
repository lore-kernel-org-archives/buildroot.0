Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBD5C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:25:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A9A760F39
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A9A760F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C5F040211;
	Tue, 17 Aug 2021 07:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HNv4InROmtLO; Tue, 17 Aug 2021 07:25:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8B7140311;
	Tue, 17 Aug 2021 07:25:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF1B01BF33E
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE66180C13
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g01dCic1r4yY for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 07:25:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AB2480B7A
 for <buildroot@busybox.net>; Tue, 17 Aug 2021 07:25:07 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id n12so30217862edx.8
 for <buildroot@busybox.net>; Tue, 17 Aug 2021 00:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=mLWg5YF0Mti0P4S1wW0Njk1opVXmcOBlOfVP/k5pqog=;
 b=SAzcPITWw0mxTFLlBTelWiHpDY8wEtDkE4gobZEh1Guq/Bvf2V6PTdw2S6Y8ZRK51j
 rXstwFt4jdh8KlR4dCaXiw4yWfnxf9+Ztay434MugGIsEvMv37flWRWZVsQsRhqOphNX
 lIw5GvXdjIhx7ril9gzyZCTJmvzT/ALpuy4vXp/Cf5oyaUoWRfR/Qu4CF70MIMk8gp1m
 kuEQzew2wIAmYKNxTJw7U1F6jHHUvx/C8Mp6COL1UsfEDXpnjostlYTIlOkd3IHmDcI2
 qOV1TfD9zsdGbp9sr2OX6TLVwHrUjB94QeHfAQzjtQlm3jphncNSjFuf3cDX/yuZ1zkr
 /oDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=mLWg5YF0Mti0P4S1wW0Njk1opVXmcOBlOfVP/k5pqog=;
 b=S5a4pIxAYu0kUllTt2UQLD2BKKdKbYGmZNeqpLDrP1v4a/yNdHL1CrV65NFJA/2Axs
 lzjTPSwkFS81FvXt9WqI3mY08fUQTyspeqUWn/Bb4kmmsqIrcmAhJxIpZxfN4FstAoeK
 NO8cL9Tvp9h45a4Dx1jI/TyPlv9JBd+W4KQYGHvMQ87iszWwnv8kWONE66YV3q5BfGIT
 W61pWtobf6wEdQ/n82WRmdLj8fC3Z121C9GxHctI/OFEYTTb+FuP0h+0A8pIZm8//RBZ
 HJLLr34Cc86LooGM18MB3/mnhZt1RH5ESgboct4syPzrXkQsutVDxIepBqD3ibHgSsJo
 k0HQ==
X-Gm-Message-State: AOAM531uBC3NCotSV/6iOIBb3Q92Ebuk2zmfVKbskQ/NxVnN51tCvJQb
 vrO1xATSppo2Af1DlaXuMN0=
X-Google-Smtp-Source: ABdhPJyqzFwGuOBK0/AVQGh+djsVmrn7HqrnKgaECbodinvD3oIShweoottYjmQmP5VfR1zKv6JdtA==
X-Received: by 2002:a05:6402:1908:: with SMTP id
 e8mr2561119edz.283.1629185105643; 
 Tue, 17 Aug 2021 00:25:05 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 i16sm372570ejx.78.2021.08.17.00.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 00:25:05 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mFtT6-0002vD-FC; Tue, 17 Aug 2021 09:25:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <c6b5f83bd938d39574e7a6968941de7a6db6ad0a.1629084611.git.baruch@tkos.co.il>
Date: Tue, 17 Aug 2021 09:25:04 +0200
In-Reply-To: <c6b5f83bd938d39574e7a6968941de7a6db6ad0a.1629084611.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 16 Aug 2021 06:30:11 +0300")
Message-ID: <87r1es5y9b.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: don't force
 ENABLE_STACK_PROTECTOR
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
Cc: buildroot@busybox.net, Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Pj4+Pj4gIkJhcnVjaCIgPT0gQmFydWNoIFNpYWNoIDxiYXJ1Y2hAdGtvcy5jby5pbD4gd3JpdGVz
OgoKID4gQ29tbWl0IDVmNDMyZGY3ZTJkMiAoImJvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmU6IGNo
YW5nZQogPiBFTkFCTEVfU1RBQ0tfUFJPVEVDVE9SIHZhbHVlIHdoZW4gZGlzYWJsZWQiKSBzZXQK
ID4gRU5BQkxFX1NUQUNLX1BST1RFQ1RPUj0wIHdoZW4gZGlzYWJsZWQuIEJ1dCBzaW5jZSB3ZSBw
YXNzIHRoaXMgdmFsdWUgYXMKID4gTUFLRV9PUFQsIHRoZSBpbnRlcm5hbCBBVEYgbG9naWMgdGhh
dCBzZXRzIEVOQUJMRV9TVEFDS19QUk9URUNUT1IgYWdhaW4KID4gYmFzZWQgb24gaXRzIGluaXRp
YWwgdmFsdWUgYnJlYWtzLiBUaGlzIGxlYWRzIHRvIGJ1aWxkIGZhaWx1cmU6CgogPiBtYWtlWzFd
OiAqKiogWy9idWlsZHMvYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2FybS10
cnVzdGVkLWZpcm13YXJlLXYyLjQvYnVpbGQvYTgweDBfbWNiaW4vcmVsZWFzZS9saWJjL2Fzc2Vy
dC5vXSBFcnJvciAxCiA+IGFhcmNoNjQtYnVpbGRyb290LWxpbnV4LXVjbGliYy1nY2MuYnJfcmVh
bDogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kLWxpbmUgb3B0aW9uIOKAmC1mc3RhY2stcHJv
dGVjdG9yLTDigJk7IGRpZCB5b3UgbWVhbiDigJgtZnN0YWNrLXByb3RlY3RvcuKAmT8KCiA+IE1v
dmUgRU5BQkxFX1NUQUNLX1BST1RFQ1RPUiB0byBtYWtlIGVudmlyb25tZW50IGluc3RlYWQgdG8g
YWxsb3cgbWFrZSB0bwogPiBjaGFuZ2UgaXRzIHZhbHVlLgoKID4gRml4ZXM6CiA+IGh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTQ5NzY2MzI5NAoKID4g
Q2M6IERpY2sgT2xzc29uIDxoaUBzZW56aWxsYS5pbz4KID4gQ2M6IFNlcmdleSBNYXR5dWtldmlj
aCA8Z2VvbWF0c2lAZ21haWwuY29tPgogPiBDYzogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBl
dGF6em9uaUBib290bGluLmNvbQogPiBTaWduZWQtb2ZmLWJ5OiBCYXJ1Y2ggU2lhY2ggPGJhcnVj
aEB0a29zLmNvLmlsPgoKQ29tbWl0dGVkLCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2Fh
cmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3li
b3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
