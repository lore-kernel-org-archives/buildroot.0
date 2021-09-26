Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AF0C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 18:04:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F64260FED
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 18:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F64260FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44E586062D;
	Sun, 26 Sep 2021 18:04:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IODmDnFTMWCm; Sun, 26 Sep 2021 18:04:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F472606BD;
	Sun, 26 Sep 2021 18:04:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F28A61BF2C6
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 18:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF9AD402DC
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 18:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1DLici6_sAx0 for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 18:04:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91A0A402D4
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 18:04:43 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id ee50so59264340edb.13
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 11:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vphxRxWTT9dkraCb8Z3cDbsshtER102TsyoSwxH/h8M=;
 b=OtjJaf0jNs9VFeDt2uHu+Jt3ZBU1cVH+L5S13Er72Rg3hW2+Y2qYTcGvmTBcI4sOea
 gR1lxaLDoXKDRiLdgUsbFwZeCrxjMp7OI85Q3M1eGMx6aiAknukQ+rlcDBpu3uUDCYU1
 9Aet7hp44FbDdxhC6qGxip9TAhd6DvjbhJPGxoAzCGu8H45ucX23EVspVzagGSBrJvVs
 nHuo1bx9DyAMc+qBwEn0spsOfXqS1B9/06Qy/DqfhL1y3K76g2r/EnWG3oMBiNCgstDC
 Uqjk8zdaRvXpDw1/BvxG7pbQ9wCmu+XWNZA/ZyZZ6EPZnWzB2iA0auCtfDP9gUjKD77h
 UHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vphxRxWTT9dkraCb8Z3cDbsshtER102TsyoSwxH/h8M=;
 b=K+ybCJfXIKsMDnI4iOBALKSD2Sd8Qfl9PjxPxYAX10GXHH5MY8zjoSEN8KRNxEVyFF
 HziV3NX2Z1JO8tm6MBuTsD30CkmlD65OF7UBiCAM9Gqwtwm4Kl8jJTLU4kVg99Jn3XYl
 osNfWK5V7Hqg2NmozDm8FURfiktcFRtsxhfVs39WGi2s58ea75L5BPdW1OrJbANTJwSX
 7trUp5tCp/HKPybpT3nI3eq2odavWyTW+MkUClRzYRtPNiJjHPWo31xq3a8YhBUqL+DH
 /WkGutX2HOcVOgrHDYRkK9TbdbLqq9DryThQWgRkk6aQYBXBZWZlOKg//oOe/fApRE55
 1gFw==
X-Gm-Message-State: AOAM530PwHCZymHU4m2PlKne7e/JUvR3R/o2/4PHKOG6hr0J3PwNZY9F
 Vu3u90l5nqwQZarpGxUrXuy4yJ5kg33utmHA
X-Google-Smtp-Source: ABdhPJxRuHYYCN3qJGLeEoPgG5XYF2E9ulKZwKoBM9S+DiJoePoW/3k8Y0iyG7ZnzOfwfop2o7E+SQ==
X-Received: by 2002:aa7:c945:: with SMTP id h5mr18629482edt.350.1632679481413; 
 Sun, 26 Sep 2021 11:04:41 -0700 (PDT)
Received: from [192.168.43.5] ([109.143.67.179])
 by smtp.gmail.com with ESMTPSA id d7sm9286402eds.42.2021.09.26.11.04.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 11:04:40 -0700 (PDT)
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20210907120933.31647-1-raphael.melotte@mind.be>
 <765c2509-4af3-fb71-d9d7-8612e8f62b7e@mind.be>
From: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <0c4a550f-8e48-f0a5-64da-a9ea8ebb7d0a@mind.be>
Date: Sun, 26 Sep 2021 20:04:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <765c2509-4af3-fb71-d9d7-8612e8f62b7e@mind.be>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 2/2] package/mupdf: fix building with some
 toolchains
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiA5LzE5LzIxIDI6MzIgUE0sIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+
IAo+ICDCoFdoYXQncyB0aGUgdXBzdHJlYW0gc3RhdHVzIG9mIHRoaXMgcGF0Y2g/IFdlIHdhbnQg
dG8gaGF2ZSBhIGxpbmsgdG8gdGhlIAo+IHVwc3RyZWFtIE1SIG9yIHBhdGNod29yayBvciBtYWls
aW5nIGxpc3QgYXJjaGl2ZSBvciB3aGF0ZXZlciBpbiB0aGUgcGF0Y2guIE9yLCAKPiBpZiB0aGF0
J3Mgbm90IHBvc3NpYmxlIChlLmcuIHVwc3RyZWFtIGlzIGRlYWQpLCBzb21ldGhpbmcgbGlrZToK
PiAKPiBVcHN0cmVhbS1TdGF0dXM6IGRlYWQgKG5vIGFjdGl2aXR5IHNpbmNlIDIwMDMpCgoKV2hv
b3BzLi4uCgpJIG9ubHkgc2VudCBpdCB1cHN0cmVhbSBub3c6IGh0dHBzOi8vYnVncy5naG9zdHNj
cmlwdC5jb20vc2hvd19idWcuY2dpP2lkPTcwNDQ0MgoKSSdsbCBzZW5kIGEgVjIgc2hvcnRseSwg
dGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKS2luZCByZWdhcmRzLAoKUmFwaGHDq2wKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
