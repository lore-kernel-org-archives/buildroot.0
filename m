Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9180C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:32:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69C6160E0B
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69C6160E0B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18F9783B0C;
	Sat, 28 Aug 2021 15:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V3Tu_tGT_DUa; Sat, 28 Aug 2021 15:32:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 753FB83B24;
	Sat, 28 Aug 2021 15:32:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6E201BF33B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D580D60604
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:32:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JsWsujpzPSjf for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 15:32:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 269D3605B0
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 15:32:35 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t15so9059586wrg.7
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 08:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o70ZngEiy79MWgyWEk3HJ+/1LPpbF3emqpszTmCGLK4=;
 b=CQuEfWH7MqRwKjKUqOf0kcfutuBF56O9HDfnynCvPF/LK6oLViQvfewAFUdF3P+Pt5
 qW61PDoMhSfXDYRtTD6YoMO3cdTVwO+3u6J6fbpWk3Xf/XFTUgvP1efPWF+K1yLHaOY+
 +ubvWNkoKpdLpMZgqDfMCC/ZAVNh1YoGv03Z9mJ6cxFYy2q5/+ZIagcmZmpCAwX8EkKH
 L0HSr785id0PX/I2WGKL84C9i77bpbH50cMJcADJlXhD7/uCkRuwfmDxSPC74VHQSnno
 +sTJEmL7M/mJ4qrBaYQP4veHdBbD5xlns9PxABXRbPhajutJHW1ImH6KMRHq6p8xdaaV
 oldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=o70ZngEiy79MWgyWEk3HJ+/1LPpbF3emqpszTmCGLK4=;
 b=R8qy0Mj5ThwEpmfn9nFaG38ZGMFBat1bDGjs2o5tfO7uLqpkRzf8LFOknsDoZPfwI6
 VWV2JzzYQnUlEtSkCHnw3NVw/8ZM0GmIoiExSwnT5MKRJGafC2ufzneGSkAuMLRDTPHk
 vBU3bYWXJDT3RVjkHOrnpIhkmpfeOjZ/JU+3QhLsmAmYOoCBZOysfkCKbCvGKgq2j/VF
 JaYg9+8Fu7E6yCLc9Zh0SakvtOipt2K1AbwC9pV40kEpsUJaXXtNpba0iwe+k9N5mAXc
 ryrDapybrabbJk7LJlhy/cPifxp+RvTXF0NiAwXI+CvjyHrtq7ACIbBayW6ACGPsEmf2
 +mkA==
X-Gm-Message-State: AOAM530QphgrZ41oL6m3RRBE27MBMZ+Y6Jhx/Kjcd+gBsoME0GLP0zws
 5v1G+3ah3iagiDT3cLCfvBcGByfk7VQ5/w==
X-Google-Smtp-Source: ABdhPJwbD8Gu/tKozDB/d2y8Jv9eLaNRg9fQpfOCFCu/sueisE2BW94Z381xcNs7GfVbkm8wMPzADA==
X-Received: by 2002:adf:c3cd:: with SMTP id d13mr3550814wrg.312.1630164754365; 
 Sat, 28 Aug 2021 08:32:34 -0700 (PDT)
Received: from [10.73.0.168] ([213.219.130.152])
 by smtp.gmail.com with ESMTPSA id w29sm10347386wra.88.2021.08.28.08.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Aug 2021 08:32:34 -0700 (PDT)
To: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
References: <20210822184121.526921-1-joerg.krause@embedded.rocks>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <ff00614f-e913-3e86-dab0-e5909a5e3337@mind.be>
Date: Sat, 28 Aug 2021 17:32:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210822184121.526921-1-joerg.krause@embedded.rocks>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/luv: bump to version 1.41.1-0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAyMi8wOC8yMDIxIDIwOjQxLCBKw7ZyZyBLcmF1c2Ugd3JvdGU6Cj4gU2lnbmVkLW9mZi1i
eTogSsO2cmcgS3JhdXNlIDxqb2VyZy5rcmF1c2VAZW1iZWRkZWQucm9ja3M+CgogQXBwbGllZCB0
byBuZXh0LCB0aGFua3MuCgogUmVnYXJkcywKIEFybm91dAoKPiAtLS0KPiAgcGFja2FnZS9sdXYv
bHV2Lmhhc2ggfCAyICstCj4gIHBhY2thZ2UvbHV2L2x1di5tayAgIHwgMiArLQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9sdXYvbHV2Lmhhc2ggYi9wYWNrYWdlL2x1di9sdXYuaGFzaAo+IGluZGV4IGE2
MTlkYjJjNzYuLjI3MTEzMjhmM2YgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9sdXYvbHV2Lmhhc2gK
PiArKysgYi9wYWNrYWdlL2x1di9sdXYuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAjIExvY2Fs
bHkgY2FsY3VsYXRlZAo+IC1zaGEyNTYgIDQwMThmMjkzZDcxYzJkNzU3NTdiNjRmY2RhY2Y5ODI3
MjljOWRjOGIwYmY4ZWRhNDAxNWE4ODE4YTVhMjkzMjEgIGx1di0xLjQxLjAtMC50YXIuZ3oKPiAr
c2hhMjU2ICBhYmMzYmQ5ZDc0MWFlYzM5MjIwM2RiZjYyOWRhNTg4MTdiZDU3MDVlODJiMmU5Zjc5
ZjQ0ODYxNzI2NzRhMGEzICBsdXYtMS40MS4xLTAudGFyLmd6Cj4gIHNoYTI1NiAgY2ZjNzc0OWI5
NmY2M2JkMzFjM2M0MmI1YzQ3MWJmNzU2ODE0MDUzZTg0N2MxMGYzZWIwMDM0MTdiYzUyM2QzMCAg
TElDRU5TRS50eHQKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdXYvbHV2Lm1rIGIvcGFja2FnZS9s
dXYvbHV2Lm1rCj4gaW5kZXggMWEyNGEzM2JiMi4uYjlmMGQ2YTA3MCAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL2x1di9sdXYubWsKPiArKysgYi9wYWNrYWdlL2x1di9sdXYubWsKPiBAQCAtNCw3ICs0
LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtTFVWX1ZFUlNJT04g
PSAxLjQxLjAtMAo+ICtMVVZfVkVSU0lPTiA9IDEuNDEuMS0wCj4gIExVVl9TSVRFID0gaHR0cHM6
Ly9naXRodWIuY29tL2x1dml0L2x1di9yZWxlYXNlcy9kb3dubG9hZC8kKExVVl9WRVJTSU9OKQo+
ICBMVVZfTElDRU5TRSA9IEFwYWNoZS0yLjAKPiAgTFVWX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNF
LnR4dAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMu
YnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
