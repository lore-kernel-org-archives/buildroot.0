Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8839BC4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 16:54:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B4DE61357
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 16:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B4DE61357
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EEAC80C76;
	Tue, 24 Aug 2021 16:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efUhjVu2DqCs; Tue, 24 Aug 2021 16:54:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43F0480C83;
	Tue, 24 Aug 2021 16:54:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C2501BF2F6
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 16:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29B7E4018D
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 16:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2SsdFNCsdL-T for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 16:54:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71DC640163
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 16:54:38 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h13so32359011wrp.1
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 09:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=jlT9eLl5LHX/ljN+lKo1Vkh0J+5KbQ1ublZmSbveHXw=;
 b=PlsyrmkR/re2th+TT/MLNqmUtJNEPlGua6eTe4/wadHyajg1HEPQlwXZjMYnLKJCov
 ZswahE4XioiK/c8J+Defui+B2zTLf6lVnCOMf9qF9ZKwFj6WiZc6d0IiVgB6J6K50MPx
 Oa+3uJNss2o5Jshna+iqPHyrPjNBn/piOqcYQ9RPv/h+SOJ2+Y/i7w1xgvVMFkTfEgB2
 o2jYl+sa8wHAPqdVIQrP9lOBaeXJHuQk87uuOTn9TD+ouDmLGLlmNiPRmxVKcg7rUpc8
 IAJUwChIS8Ao/Vz34VZBY4+Pg2wrrDzY35kpnfFIrD8RWgBJGhaKqCCVEg4T7fXBmjbD
 PYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jlT9eLl5LHX/ljN+lKo1Vkh0J+5KbQ1ublZmSbveHXw=;
 b=CNFFcTksmveII4XsF5x4C37yhKkW3FT8bjYGO/eyit5WMv+AEqYsiVUa9oxpDE6diT
 bE88djsDf714vAlx55UnolTsBpuHoEbpMoPR3B+/4VQ8yu6esIwgmxJYyaNZ2QDzzWMC
 UcXMGQUBZi+9PumvfII32B+gzqplx/3bz7K6AKp8TRDdbF37btloVV8mn7Hr8PQ//1DX
 fqlCmBhNU7HVD4xzs5xkIMdT4ESzqMHm8dIFit+MJ5Q7StnR99IK3H3TOvFwXIp0icfA
 Imzjtlh1R2Fmtcoh8imNLrKAHhg2uXgWb3uFx22ZyHXdiiv2o/ygs1G96p0qWW+ffVHD
 WWdw==
X-Gm-Message-State: AOAM531YxqCkQYRjUyMoEo5W+1Ke+eQ0CWW67X5HtW1GNQM8tvFgVWTn
 c3tDxWCAsZhxbXwATJC5mNccWnQFjgg=
X-Google-Smtp-Source: ABdhPJyfiSSqYK+2AeJMns20kU1o8HaNc2fbuxULrDAyqd/m1CSESGJePaAjy6z08zPu662cCrsuWw==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr2138858wrr.376.1629824076739; 
 Tue, 24 Aug 2021 09:54:36 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id z126sm3138693wmc.11.2021.08.24.09.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 09:54:36 -0700 (PDT)
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20210821131256.1138002-1-romain.naour@gmail.com>
 <e6b8d916-6dcb-7892-1cea-66ae8191ae6b@mind.be>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <1c19168b-7f6b-39b0-2185-a2bed86d6bca@gmail.com>
Date: Tue, 24 Aug 2021 18:54:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e6b8d916-6dcb-7892-1cea-66ae8191ae6b@mind.be>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH] package/localedef: bump to version
 2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f
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

SGVsbG8gQXJub3V0LAoKTGUgMjMvMDgvMjAyMSDDoCAyMTo1NywgQXJub3V0IFZhbmRlY2FwcGVs
bGUgYSDDqWNyaXTCoDoKPiAKPiAKPiBPbiAyMS8wOC8yMDIxIDE1OjEyLCBSb21haW4gTmFvdXIg
d3JvdGU6Cj4+IHJlc3luYyB0aGUgdmVyc2lvbiB3aXRoIGdsaWJjIHBhY2thZ2UuCj4+Cj4+IFJl
bW92ZSB1cHN0cmVhbSBwYXRjaGVzLgo+Pgo+PiBSZWJhc2UgcmVtYWluaW5nIHBhdGNoZXMgZm9y
IGdsaWJjIDIuMzMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5h
b3VyQGdtYWlsLmNvbT4KPiAKPiAgSSBndWVzcyB0aGlzIGlzIGZvciBtYXN0ZXIsIHRvIGtlZXAg
bG9jYWxlZGVmIGluIHN5bmMgd2l0aCBnbGliYz8KClllcyBpdCdzIGZvciBtYXN0ZXIuCgpCZXN0
IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gIFJlZ2FyZHMsCj4gIEFybm91dAo+IAo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
