Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21687C433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 18:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8123982531;
	Tue, 18 Jan 2022 18:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id avlbflZVJH6g; Tue, 18 Jan 2022 18:10:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3D35824EF;
	Tue, 18 Jan 2022 18:10:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A45591BF4E6
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 18:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CDF360E13
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 18:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yvUFDm6l7FaZ for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 18:10:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3EB660C2B
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 18:10:17 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id o15so74050883lfo.11
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=AclPCOurDDrkyirdvcyNmT0KX5Jwt253UehcNQMurbk=;
 b=RCDAg3KOPjzR98miLXWck+UBSAFSJRqvNah3tuCyHbOJm2BvB6jBoG0w2WLuO9NB8c
 vE4aEWKEccJ6kLy85mo1RUVmWK/uHO0zZzs9qKaRuuZpJNcG0yzJQ8UrMIdJNt56taHU
 WebObSTAX3QZ0s+SHXibGq8vsGtXqpk8ZXlYSJqwgJ99oFXA77w4tslSykoS6+xRyFVg
 +2a7tAw+stbgKnUIsXkJyGluSdbCi6XIaDSaHybn68StLQE1zimfc74ipDopTBAKrReH
 HsnQD0bNboSbQ/XL+jHbo56Gogn/2gYmoQ1oYBJ21ZtgXKNgKdkiD2V/oLoStf50niJ1
 sYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AclPCOurDDrkyirdvcyNmT0KX5Jwt253UehcNQMurbk=;
 b=JriPzRO6OQzMLONE5Pj+6dZsPfn5CqyLc/jzgz4jaoBJF1PR3Y31nPEK+Sp+oAlAkE
 r1TqPeffV06MecbIKkM6SsAEtuYtwrgh+xFjhXhbP4ezWLAq4aiWhNDsb7FFx1vftC7V
 kTWRxcVOTCkCyO8ekwUy/hrog2iwppvXehP1JPi9uhG9LpXEI5JZLLk+/zTf0U4pNHfy
 kldDaEw/m8eiHi57Yrk4Xa49fxejKdEUJ2ULIW+VVTi7l1f8X6VaCRIg0pQJTQwS1ZH+
 pBExy3+koN9H0brs7x9dsl4GhGPxabnUxtg0ENT6pC74nFXzEv/XAhQYB+idVZN9TkV9
 ICVA==
X-Gm-Message-State: AOAM532Gki5XkG283QfNwHPFrnZ+eNdTxsMkNYRUfwDQ1nsaLfz3p+Zv
 2aPwBLgLeWzann7y0qMqS9PCW42Irxg=
X-Google-Smtp-Source: ABdhPJxhNDD0ERiklfwVvxW5cn4sh4WgAZHhgbnAT3IgpUJbCgteW0fOEIgja0ReYGdGgnjyQ4yMmg==
X-Received: by 2002:ac2:5581:: with SMTP id v1mr24005554lfg.514.1642529415803; 
 Tue, 18 Jan 2022 10:10:15 -0800 (PST)
Received: from [192.168.10.7] ([178.155.5.204])
 by smtp.gmail.com with ESMTPSA id q11sm1764120lfe.9.2022.01.18.10.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 10:10:15 -0800 (PST)
Message-ID: <48d2b6c8-356d-419a-c284-e2184509d1c5@gmail.com>
Date: Tue, 18 Jan 2022 21:10:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: ru-RU
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <70BDD76B-E7F2-44C0-A90B-0FABCFD8755D@benettiengineering.com>
 <20220118063531.2039729-1-giulio.benetti@benettiengineering.com>
 <834ad33f-d02f-4663-8e99-4bc939cbb9f6@gmail.com>
 <d938c62f-58f6-4b53-3d47-a4dd4617b533@benettiengineering.com>
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
In-Reply-To: <d938c62f-58f6-4b53-3d47-a4dd4617b533@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH v2] package/xr819-xradio: add patch to build
 with Linux >= 5.13
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

VGVzdGVkLWJ5OiBTZXJnZXkgS3V6bWlub3YgPGt1em1pbm92LnNlcmdleTgxQGdtYWlsLmNvbT4K
CjE4LjAxLjIwMjIgMjA6NTMsIEdpdWxpbyBCZW5ldHRpINC/0LjRiNC10YI6Cj4gSGkgU2VyZ2V5
LAo+Cj4gT24gMTgvMDEvMjIgMTg6NDUsIFNlcmdleSBLdXptaW5vdiB3cm90ZToKPj4gSGkgQWxs
LCBHaXVsaW8uCj4+IEkgY2hlY2tlZCB0aGUgcGF0Y2gsIGV2ZXJ5dGhpbmcgd29ya3MuCj4KPiBD
YW4geW91IHBsZWFzZSBwbGFjZSB5b3VyOgo+IFRlc3RlZC1ieTogTmFtZSBTdXJuYW1lIDxlLW1h
aWw+Cj4gPwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
