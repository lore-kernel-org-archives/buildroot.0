Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB451C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 10:00:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 803A361026
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 10:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 803A361026
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C4FE40608;
	Fri, 10 Sep 2021 10:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ttPlAOoRub8v; Fri, 10 Sep 2021 10:00:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44AA2405F4;
	Fri, 10 Sep 2021 10:00:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD34D1BF2F5
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 10:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C951283B42
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 10:00:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xmJ5HpXOmaug for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 10:00:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E17182881
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 10:00:02 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id eb14so1659933edb.8
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 03:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=BZPBVXjQsrNK7IAPwPfCBrvrBAlAOdyCbjr6Lod2HD0=;
 b=bC513q46xow917jKbdygTxZD6nLdPWuS/ZQeKQ9vXWMCeZp6OC4RTO3eJFf+fUkOV3
 KtUWA2ADApKkVCENOMs3bjlHh2q1o++EM/iEt0dFFhekNG28o0kZ+QL8YFwm5fhLEcwY
 gYDcaqm45AG02l5efY+/y7AYPfP0nElBuTaBvPN0FYaijQbO6OerDjXsALxITcJiqKJK
 VdkZ+gn5SyQrDv2/TLLOy7d6U0m7tlw1m+c0rWQW4zc2k3I+HNiH7k0lEWS8/mQCfDf/
 NdzjfDOBJZ1/8KpAOzTZhn2oGbLpmqOsZwK4TgGFj8Ku5xOWS12t2s9dkgh7jKXjH9TX
 PC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=BZPBVXjQsrNK7IAPwPfCBrvrBAlAOdyCbjr6Lod2HD0=;
 b=KPhYotBbvOcsuD7coyN8XkqsHEQzDlIuBHXljn7Xk+9RrwVphUPFqakuVFr0CjBmgA
 /MzlH59SWIZ/2DTV7jZO6XQfXFfFaeW454erFK5pScPkwny67GB390hzRhztNB5BwWm4
 X3AXbmj+s9UopzlaEemUCHLKRZaiDFlnVc9A0eGVBBdaJOACXE95gjPTgkVyg4YzAmLB
 vENK+DKcPjj9i2CwUy81Yr7WhchRV2jvIi1vfXKdhVxsBNoMlLlZqbM9hvrIro7uvrnN
 9ZSldZ0MHJA9wRK6ONDlmv19XIK6CtvPfjNGwtqT+rGJPW9PKR1IbG6csXi8h6rIc8Ou
 Fw9A==
X-Gm-Message-State: AOAM5309+kwPe1AwLIPQxdPfTR8pvwZ9p8u1FX/x/AWhnPkQ/x5mPLu+
 TcnKL9kAjope4j8hlhE66ij6fSrZwPM=
X-Google-Smtp-Source: ABdhPJx+kdXRBVT8W7w5RpaP3AeQBGA70wvBhE/k1vMIex9tx1ufi+c0GSwF5vwW5g6Z9ELLfvgykQ==
X-Received: by 2002:a05:6402:14c3:: with SMTP id
 f3mr8119586edx.312.1631268000780; 
 Fri, 10 Sep 2021 03:00:00 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 d16sm2160148ejk.39.2021.09.10.02.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 03:00:00 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOdKB-0005z3-DJ; Fri, 10 Sep 2021 11:59:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20210903065319.10107-1-peter@korsgaard.com>
 <87tuj1r92i.fsf@dell.be.48ers.dk>
Date: Fri, 10 Sep 2021 11:59:59 +0200
In-Reply-To: <87tuj1r92i.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 03 Sep 2021 17:08:05 +0200")
Message-ID: <878s04bvj4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python3: security bump to version
 3.9.7
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdy
aXRlczoKCj4+Pj4+ICJQZXRlciIgPT0gUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQu
Y29tPiB3cml0ZXM6CiA+PiBGaXhlcyB0aGUgZm9sbG93aW5nIHNlY3VyaXR5IGlzc3VlczoKID4+
IC0gYnBvLTQyMjc4OiBSZXBsYWNlZCB1c2FnZSBvZiB0ZW1wZmlsZS5ta3RlbXAoKSB3aXRoIFRl
bXBvcmFyeURpcmVjdG9yeSB0bwogPj4gYXZvaWQgYSBwb3RlbnRpYWwgcmFjZSBjb25kaXRpb24u
CgogPj4gLSBicG8tNDExODA6IEFkZCBhdWRpdGluZyBldmVudHMgdG8gdGhlIG1hcnNoYWwgbW9k
dWxlLCBhbmQgc3RvcCByYWlzaW5nCiA+PiBjb2RlLl9faW5pdF9fIGV2ZW50cyBmb3IgZXZlcnkg
dW5tYXJzaGFsbGVkIGNvZGUgb2JqZWN0LiAgRGlyZWN0bHkKID4+IGluc3RhbnRpYXRlZCBjb2Rl
IG9iamVjdHMgd2lsbCBjb250aW51ZSB0byByYWlzZSBhbiBldmVudCwgYW5kIGF1ZGl0IGV2ZW50
CiA+PiBoYW5kbGVycyBzaG91bGQgaW5zcGVjdCBvciBjb2xsZWN0IHRoZSByYXcgbWFyc2hhbCBk
YXRhLiAgVGhpcyByZWR1Y2VzIGEKID4+IHNpZ25pZmljYW50IHBlcmZvcm1hbmNlIG92ZXJoZWFk
IHdoZW4gbG9hZGluZyBmcm9tIC5weWMgZmlsZXMuCgogPj4gLSBicG8tNDQzOTQ6IFVwZGF0ZSB0
aGUgdmVuZG9yZWQgY29weSBvZiBsaWJleHBhdCB0byAyLjQuMSAoZnJvbSAyLjIuOCkgdG8KID4+
IGdldCB0aGUgZml4IGZvciB0aGUgQ1ZFLTIwMTMtMDM0MCDigJxCaWxsaW9uIExhdWdoc+KAnSB2
dWxuZXJhYmlsaXR5LiAgVGhpcwogPj4gY29weSBpcyBtb3N0IHVzZWQgb24gV2luZG93cyBhbmQg
bWFjT1MuCgogPj4gLSBicG8tNDMxMjQ6IE1hZGUgdGhlIGludGVybmFsIHB1dGNtZCBmdW5jdGlv
biBpbiBzbXRwbGliIHNhbml0aXplIGlucHV0IGZvcgogPj4gcHJlc2VuY2Ugb2YgXHIgYW5kIFxu
IGNoYXJhY3RlcnMgdG8gYXZvaWQgKHVubGlrZWx5KSBjb21tYW5kIGluamVjdGlvbi4KCiA+PiBo
dHRwczovL3d3dy5weXRob24ub3JnL2Rvd25sb2Fkcy9yZWxlYXNlL3B5dGhvbi0zOTcvCgogPj4g
U2lnbmVkLW9mZi1ieTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgoKQ29t
bWl0dGVkIHRvIDIwMjEuMDIueCBhbmQgMjAyMS4wNS54LCB0aGFua3MuCgotLSAKQnllLCBQZXRl
ciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
