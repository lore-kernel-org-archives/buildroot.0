Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9462C4338F
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 11:12:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D20D610E5
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 11:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D20D610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25BF0819D1;
	Wed, 25 Aug 2021 11:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hZ-onz1FVxHP; Wed, 25 Aug 2021 11:12:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1168981A16;
	Wed, 25 Aug 2021 11:12:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D7F461BF873
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 11:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5026605DB
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 11:12:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fYPRosFK2ZBk for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 11:12:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C38666064D
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 11:12:28 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h13so35876913wrp.1
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 04:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CunyTBI4DXQwZgTxTYVY7KKBSuypWC9JmaSmUse3Zw0=;
 b=byVGtryp9P4qkIyzfuiA76gFDEyUr3zfHZaKxzfGsh+bAKhxt8jpDaJF6eTYbl9pnD
 950GN4iCAj2D6UUf5d/2TQ/RYDtsCaQGbeVsFm/i9uvPRn/j3rHbk4wIe0DL/7QPzPTs
 GXHz/phlVPjlfdJls062//68LkqNz+ZCEgn557dwdgxlO/b8VEMlc48ZaFWmTFIA23sj
 XieAgL4qLY6H63M7EbjZHY6GT2sDZZ+ibgzQhpB/9UJPbMh9cgM8kl0Ko0aKx0bRNFZv
 x0wlzTJ9yLHuwb0XTs4MogZ72XJBp2cvfMRWFyvkn1q86btY0wlpzStmbp36AhFN725m
 VB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CunyTBI4DXQwZgTxTYVY7KKBSuypWC9JmaSmUse3Zw0=;
 b=IeCTw6Mrm9tTj/0NDCegACyLZDgPiDL0DgyQt+03sTRgZnbSS/+ZMK7VjObEccfxop
 1BfbbZ3/bqGYrfXv2dfrjGtnPhizDn3u98BJrzYIXSw2LR2GbSNlEiZDOnuTFSCsogpY
 RX9Mil4nBnqJP+Dl2sFrtPnBnDJqn1cFPtuQvwSERe/dSs7azU7elWw+lvhigPnNU4Sq
 5r0VgDVxTOjibtmLa/S7uPkj9cm72b8hZdMmYYLR2O4TzzRFNQly+lDRw+MEdzz+fHb9
 9Q2CmIKQ3IXhrw0F7jRB2KiSwcUNFfHbO+QNINxQ/zdtGqK/EayqqrqHkUaM2gR706Tq
 qEyQ==
X-Gm-Message-State: AOAM530a2u376ixLVA1KJgaJUCQYe9Fi7Ru1WdKy/ZskclzIu1Xuy9QS
 wdgjiGEcuiqLbo+g7gl5X+92bxv/d+8=
X-Google-Smtp-Source: ABdhPJwejbMT3i9Cfzi0rnAmN87cfQcQBSz9LX6y7dahJ+/TWX5D3ii8pzoCN4hlQpaEnQ200JJwCw==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr6001066wrr.376.1629889946967; 
 Wed, 25 Aug 2021 04:12:26 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id c13sm16976116wru.73.2021.08.25.04.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 04:12:26 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210822194644.3260223-1-romain.naour@gmail.com>
 <20210825000242.0bbf2fa9@windsurf>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <994b4a7a-3f70-0e0f-2e53-8cf8de58b007@gmail.com>
Date: Wed, 25 Aug 2021 13:12:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825000242.0bbf2fa9@windsurf>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH] support/testing: test_atf: bump the custom
 version to v2.5
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gVGhvbWFzLAoKTGUgMjUvMDgvMjAyMSDDoCAwMDowMiwgVGhvbWFzIFBldGF6em9uaSBh
IMOpY3JpdMKgOgo+IE9uIFN1biwgMjIgQXVnIDIwMjEgMjE6NDY6NDQgKzAyMDAKPiBSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+IHdyb3RlOgo+IAo+PiBUaGlzIHZlcnNpb24g
YnVtcCBpcyBuZWVkZWQgdG8gcGFzcyB0aGUgQVRGIHRlc3Qgd2l0aAo+PiBoYXJkZW5pbmcgb3B0
aW9uIGVuYWJsZWQgKC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZykKPj4KPj4gV2l0aCB0aGUgdmVy
c2lvbiB2Mi4yLCBBVEYgZmFpbCBkdWUgdG8gdW5kZWZpbmVkIHJlZmVyZW5jZXM6Cj4+Cj4+IC4v
YnVpbGQvanVuby9yZWxlYXNlL2JsMnUvYXJtX3R6YzQwMC5vOiBJbiBmdW5jdGlvbiBgYXJtX3R6
YzQwMF9zZXR1cCc6Cj4+IGFybV90emM0MDAuYzooLnRleHQuYXJtX3R6YzQwMF9zZXR1cCsweDEw
KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19zdGFja19jaGtfZ3VhcmQnCj4+IGFybV90emM0
MDAuYzooLnRleHQuYXJtX3R6YzQwMF9zZXR1cCsweDE4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0
byBgX19zdGFja19jaGtfZ3VhcmQnCj4+IGFybV90emM0MDAuYzooLnRleHQuYXJtX3R6YzQwMF9z
ZXR1cCsweGI4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19zdGFja19jaGtfZ3VhcmQnCj4+
IGFybV90emM0MDAuYzooLnRleHQuYXJtX3R6YzQwMF9zZXR1cCsweGNjKTogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byBgX19zdGFja19jaGtfZmFpbCcKPj4KPj4gU2lnbmVkLW9mZi1ieTogUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+IAo+IElzbid0IHRoaXMgZml4ZWQgc2lu
Y2UgY2NhYzlhNWJiYmQ3Mzc0MTg3YTBmMDAxNzEwMWVjZTBjMjAyODUxZCBwZXJoYXBzID8KCk5v
LCBpdCB3YXMgcmVwcm9kdWNlZCB3aXRoIHRoaXMgcGlwZWxpbmUgYWZ0ZXIgdGhpcyBjb21taXQ6
Cmh0dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1OTMvYnVpbGRyb290Ly0vcGlwZWxpbmVzLzM1NzA3OTk2
MC8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBUaG9tYXMKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
