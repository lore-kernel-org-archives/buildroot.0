Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70E2CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 13:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F1304215A;
	Fri, 29 May 2026 13:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fj576ZsUAWtK; Fri, 29 May 2026 13:34:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8242542157
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780061699;
	bh=HQhkwxFD8gXtnFfstgGhH0A+FNMHjy+FnJrlj238K+c=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NCmnGkzPtcA5wui0s3i5nvZXfUeayrvgDwdecWg9dQ6bxEIgDkU605E5XspbuRv6T
	 Qe05pQSsoGycUinuoojj0PpB2O9cx2Lnbsq3rrmJxvsOICDG3FHkS7p/8bjrbW17Iz
	 LbBqzV6JnIWc/eMuTatctxEbV59WN/OEdb3FpSf2HLY4ecctfyy60nUKrHg7ndy74A
	 P7n4XT7NxL24Gul3OulP9OhuX3M6x9Ob3tyvFqpJhr1NaDODjd8jHckWYMPnY4Znds
	 NkvUELLXhGuIzegLG3VIo3nbtC+BNt7v0QzRhq+SK/uZat0lpVAp7HR/I8ESFh+Fp3
	 xxJdSEqhMfRtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8242542157;
	Fri, 29 May 2026 13:34:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D6BD6288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C61B661405
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1uDUrN2n0hML for <buildroot@buildroot.org>;
 Fri, 29 May 2026 13:34:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE6EC613D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE6EC613D6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE6EC613D6
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:34:56 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-49042aeeb75so94053585e9.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 06:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780061694; x=1780666494;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g60+ZB9VYhMzXXHElc5pmRMIjXGl1lqcCYO4R6XMdxw=;
 b=DAeUpRRjIoMaZli52AVPdJdFQbY+z+y77J0k6Nej0dETbAq2BNaHFsCQyxHulYMD3M
 cWKsUq+Pq28FDT7UmVs4MQj0a8yLtA6uiKbZ/9rtS93ENpwTwXgMVpVsM3gkr1Hs99Gi
 w72YHjiVzltm4tUoEaNEdvYENVG4GT2gmWuzxlWeolYe+6CiL1XPB1IXXz47w5IAuwbj
 POEV1Q62lJ3y2AZC/TTw5GaiZevszE8k49xn4V9ZwlNJT027uvShzs1HFGzt+VyC6VFA
 9Z7eZIC1sKm04xtwCE9jllPJ1i3JX+2mBmYjO80f/c0zbW5oSjmK2SpjiynzPx63+qi4
 4c2A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+QlsHoC4Hz/CBCacYj27Hy5AKbMkLiCWqLRYnJAPCK6o7evyjozYjNHIE3RV6BY6pWSUZyMC6aai4=@buildroot.org
X-Gm-Message-State: AOJu0YxuKCAMQVyGDh6CeqFI1zNJiUHAH7l5WrJBGPqIS4i294zcI2My
 Uby8HXHt3wCePX/EJ6/R+FpFhETgWQ9LDVsualJg7gENvDgq2gJZrMh7GHUyPK8fxvDy+nlw6rC
 fQ3U4G3Q=
X-Gm-Gg: Acq92OFTal6+Qmm0taS/mIx+3ZJGqyLbHYtSmwB35HMkR0mkKl6wdJX3TU0lnMYQP/K
 qkHJHagQEu3lEl8enQ1wCNULAb4+qVQndPeKu7hH54FqJjPhilyEXtnY6SMQMx+wVNtAHL00H99
 1eu3WCwHlwWDdPBPkHQ+ronWNKHNOFdINVfBuBCsE2geUq7AsYonpPZ5wZFK7q0ZB9S6AIBsCWj
 CFBifCGnxOc1O9itHJL+6U/0SV5FehFp+czkzF0Zo9gsXensiQzc+39+2GkiHNGfgtlIk8qUBdh
 A4mZAUap5oCX3S0L+plAAHEgqW4AgCSvNzc6BAKrGHsaOma5RM0tuEIfCDBNG8GFG118Y49snhR
 rde0Ou2h4y39cMKv/T8nkZ3bt9Y5BCHEK4eLy2snwzKcX7pqCwMAHUDtPkzAFTEoXjL+4H6egGp
 Gwuavb0t1l3fPEtTvMPhOhacwGa8i8X4nJyXdh93fKkP2CbgUHqxhGd75hiZxCSapcJXyn5qy3/
 CysgSHghe3yWMD8KvY=
X-Received: by 2002:a05:600c:c48e:b0:488:d6eb:e63c with SMTP id
 5b1f17b1804b1-490a239680emr8996945e9.15.1780061694368; 
 Fri, 29 May 2026 06:34:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:1015:b940:d4d1:7b69:edd2:59ef?
 ([2a01:e0a:1015:b940:d4d1:7b69:edd2:59ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d7002e8sm53154135e9.15.2026.05.29.06.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 06:34:53 -0700 (PDT)
Message-ID: <400a3acc-c69e-4ca8-9e93-5a0f329836f0@mind.be>
Date: Fri, 29 May 2026 15:34:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20260528083551.770750-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260528083551.770750-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780061694; x=1780666494; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g60+ZB9VYhMzXXHElc5pmRMIjXGl1lqcCYO4R6XMdxw=;
 b=RgzvIs2AJSckzvSinLNmEP2TyOzpqo6ryM/nGwOQqfLza2YEZkR32TtA0a6abC46Y4
 HDZBNozeD/VQgMsejiUbckzZanakVCKLpIGtQemoAM5Y7ip2cpt41NYfJLawFOqAIyL1
 /gOGh8V3Ent2ADKzTbB+JwnpC5F83G+fGOyRmprZS7VWlZ1cHJG3DsD6iPt3tO/Gxtse
 KhL5Z998gP+EiZ3lPvdnEMQlIpe9tX9fXmCeVxFhRqkdjpOTfaGgieiSrvEirgjkh9GW
 S22zNZMFRUVxRWjls1M6MGODdCfHeMzjZx9DVFetVXjsvOLMBakinuZ24lo4oczOc0KS
 rS0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RgzvIs2A
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/samba4: security bump
 version to 4.22.10
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzIGFuZCBhbGwsCgpPbiAyOC8wNS8yNiAxMDozNSwgVGhvbWFzIFBlcmFsZSB2
aWEgYnVpbGRyb290IHdyb3RlOgoKWy0tIHNuaXAgLS1dCgpUaGVyZSBpcyBjdXJyZW50bHkgYSBi
dWlsZCBmYWlsdXJlIHdpdGggSGVpbWRhbGwgKHdoaWNoIGlzIGEgCnByZXJlcXVpc2l0ZSBmb3Ig
c2FtYmE0KS4gSW4gb3JkZXIgZm9yIHRoZSBidWlsZCB0byBzdWNjZWVkLCB5b3Ugd2lsbCAKYWxz
byBuZWVkIHRvIHBpY2sgY29tbWl0cyBvbiBMVFM6CgogwqAgwqAgZ2l0IGNoZXJyeS1waWNrIFwK
IMKgIMKgIMKgIMKgIGQyZDUwMTRhOGUxMGU4MmRlYmM1ZjkyMjJhYjkzMWEyMWVkYmYwYzggXAog
wqAgwqAgwqAgwqAgNTczZWNiZDQ0Y2QxNmIyY2E0Y2U3MWI0MDQ1OWJjZWNmOGM4ZTk4YwoKV2l0
aCB0aGUgYWJvdmU6Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBlcmFsZSA8dGhvbWFzLnBlcmFs
ZUBtaW5kLmJlPgpUZXN0ZWQtYnk6IFRpdG91YW7CoCBDaHJpc3RvcGhlIDx0aXRvdWFuLmNocmlz
dG9waGVAbWluZC5iZT4KPiAtLS0KCktpbmQgcmVnYXJkcywKVGl0b3VhbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
