Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB20C25B0C
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 19:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FC4C405E5;
	Wed, 10 Aug 2022 19:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FC4C405E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 931n0beEmSNH; Wed, 10 Aug 2022 19:49:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 924D04044D;
	Wed, 10 Aug 2022 19:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 924D04044D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F23B41BF471
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 19:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA2064044D
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 19:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA2064044D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LBDeGGrAoz5s for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 19:49:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A481140012
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A481140012
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 19:49:05 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id i13so4120555qkm.8
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 12:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=MrgENZWJCLTNOQy+yL43ZyzuK7Q7aoe8aEFXj0TzOvA=;
 b=tpgIKhPsDRdx4CXCfj20yucrfpyPfKCfweOw1EDvdeTUMyHx+GiY7j92KsWsevfS+x
 xsDqe2Cx3tm5Q6wXCedKAJDe2F2JL7n+XvNuwo8cZ9YxEzYRQV0iOqAEw0h0uAKJaLnr
 CMy0hIobQ4J0hn8TrtmI30g+r+ALIMpd4VS5Rv06rE28yzgFGYntSDvfgHcEjIVjNwet
 /BYJXoYDMTNEmjQSBhAnVqOZKulCef/Wplo/g9zZn20repJY1RL+LgHi9jS51GQnPEdZ
 ymn/qgJSXjvC+S9IKBUmA1b2VyTbJiG4Egb0/SdNt08t/uKzvdRvjCot13sQMZZkfFb2
 W8gQ==
X-Gm-Message-State: ACgBeo3YP6dURHAMEO9/0F6MIZKolan/r9FhOQYTPXtehnvAva0K4UvR
 HN3CE5dK6vskC1bxCCDrSco=
X-Google-Smtp-Source: AA6agR5LitsMfakN23k1fXRWeL7RrFwbjA/dXF+2R9NpBLMXfpQggVWKjkmM03tMN4QOU3RLn5MGvA==
X-Received: by 2002:a37:5c6:0:b0:6b9:7127:9e76 with SMTP id
 189-20020a3705c6000000b006b971279e76mr9047481qkf.220.1660160944349; 
 Wed, 10 Aug 2022 12:49:04 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 c15-20020a379a0f000000b006b5cb0c512asm450559qke.101.2022.08.10.12.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 12:49:03 -0700 (PDT)
Message-ID: <f4d078b9-7eb9-31d8-884d-948938cd9406@gmail.com>
Date: Wed, 10 Aug 2022 12:49:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220810190652.2185416-1-f.fainelli@gmail.com>
 <CAPi7W80J=R6vaU2BQ297K9-_93O9hUYB3tyCcJeLw+9jVVrV5Q@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CAPi7W80J=R6vaU2BQ297K9-_93O9hUYB3tyCcJeLw+9jVVrV5Q@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=MrgENZWJCLTNOQy+yL43ZyzuK7Q7aoe8aEFXj0TzOvA=;
 b=IDMqFlreaT5g4ebDXAJ78rlJpCOYIzaMapSSIIgZ/UCRaDr2iv/2IPFC/IIE3++TYe
 9wGJKzydKPJKKogTQRfuZ1T6AGfuzSJCDvUEcqoy8M+QaqoQxW9oV7C1GOSq8Sp4G5uq
 MbeZHXd4VtlQRnYRDyCfqVmyiiV9icuWep11AZCq+LB0Qz/MxnJCFzXYHeki8+m/fNt5
 h4noxgSa7/rD4hF7MAF1+j/8saawpM9ELODwJ31gMO7jDTttjaXisQAsIgCWj6ogbD/w
 3mIE+cRbzjCUkK9BX+y1hNXA7dbCwEbUsMDPcAWAY/hlHEO1y+WQWe9f8VrFsrr+2GL/
 La6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IDMqFlre
Subject: Re: [Buildroot] [PATCH] package/linux-tools: Allow installation of
 perf scripts
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
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com, mmayer@broadcom.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, yann.morin.1998@free.fr
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gOC8xMC8yMiAxMjo0NCwgRmFicmljZSBGb250YWluZSB3cm90ZToKW3NuaXBdCj4gRm9yIGNv
bnNpc3RlbmN5IHdpdGggb3RoZXIgcGFja2FnZXMsIEkgd291bGQgcmVwbGFjZSB0aGUgYWJvdmUg
bGluZXMgYnkgCj4gc29tZXRoaW5nIGxpa2U6Cj4gCj4gKwo+ICtpZmVxICgoQlIyX1BBQ0tBR0Vf
TElOVVhfVE9PTFNfUEVSRl9TQ1JJUFRTKSwpCj4gK2RlZmluZSBCUjJfUEFDS0FHRV9MSU5VWF9U
T09MU19QRVJGX1JFTU9WRV9QRVJGX1NDUklQVFMKPiArwqAgwqAgwqAgwqAgwqAgwqAgwqDCoCAk
KFJNKSAtcmYgJChUQVJHRVRfRElSKS91c3IvbGliZXhlYy9wZXJmLWNvcmUvc2NyaXB0cy8KPiAr
wqAgwqAgwqAgwqAgwqAgwqAgwqDCoCAkKFJNKSAtcmYgJChUQVJHRVRfRElSKS91c3IvbGliZXhl
Yy9wZXJmLWNvcmUvdGVzdHMvCj4gK2VuZGVmCj4gK2VuZGlmCj4gCj4gLcKgIMKgIMKgIMKgJChS
TSkgLXJmICQoVEFSR0VUX0RJUikvdXNyL2xpYmV4ZWMvcGVyZi1jb3JlL3NjcmlwdHMvCj4gLcKg
IMKgIMKgIMKgJChSTSkgLXJmICQoVEFSR0VUX0RJUikvdXNyL2xpYmV4ZWMvcGVyZi1jb3JlL3Rl
c3RzLwo+ICvCoMKgwqDCoMKgICQoQlIyX1BBQ0tBR0VfTElOVVhfVE9PTFNfUEVSRl9SRU1PVkVf
UEVSRl9TQ1JJUFRTKQo+IGVuZGVmCgpMb29rcyBtdWNoIGJldHRlciwgSSB3aWxsIHNwaW4gYSB2
MiBpZiB0aGVyZSBhcmUgbm8gb3RoZXIgY29tbWVudHMuCi0tIApGbG9yaWFuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
