Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E46C87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 15:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0631B822F2;
	Sun, 10 Aug 2025 15:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qwG-CCl4Tt7N; Sun, 10 Aug 2025 15:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41D5F8230F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41D5F8230F;
	Sun, 10 Aug 2025 15:25:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C26FE154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF75960F1F
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jglAI3hWmx89 for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 15:25:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C63786073A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C63786073A
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C63786073A
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 15:25:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-459d40d16bdso23862335e9.0
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 08:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754839545; x=1755444345;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HoN7NKPyrRt3vWjJmyKHCsIX0giH2X7Pdz2Fqtff/WY=;
 b=cIH3qCmei5zs+/V+LvI2J/38SsvM119ZMLWMElbJ2S4E6UiYkpzX89JtAmG/aQphBW
 zs9ZyE5G8GEGpxoIgfAn5Hm9AQNXYo6gBoCaJk9GLK+aLu+nlXk9/Ze8IqmWdkUWw5xe
 G/GOq+Lo5w3KfTYsqs56NokaVgrW3x5cIRKQf+qcLGKHjC5Y8HCDGcoTw8J9hLEwItPj
 o/CJpRzrtArmeN3lyNAG+FM+PdgpzsDHYn2BHYkJ2WgStOf4svkPEjEMLxCu9U4tsh6R
 tdBCMl6Z5DbK8t2o++dwgRrGre9cDY73UL1ZRKjpAvVL4/RoO/c3ZJQC+nMfgIwKtbiA
 Kt/A==
X-Gm-Message-State: AOJu0YwZTEaJxr4S+aQTlT66R3UjLamG/7J/d3m0FjKETDOO8qi1loQF
 FtO/GrKWFd0zm4WfEBv5YhLL3wbFcj9UkYV1VYSF20AxJHvkVX3HcvydkERkiRjOIcY=
X-Gm-Gg: ASbGncsf1dIy8BrMzQVB6gbEpAsRvipg8EvIwW5K0+VcMyDfrkW+uwisWT78H195fjG
 rZS6zAjuN8rpNqlcw7HYu5AOWXkTiQVog/lljbXFupu70FrtAxRwKN7AdiOh3bJoFH58rKGikYS
 2yaTPMiokOa0iAaH6LS3gXFTzTaiKbKSlxC4orxSNPAzxWl0a3TCvD7wVOfk5qAeBcZMAL2i8rM
 BycnvWYRbF6AJxzV2zYNYmKUNi/HFYH23xbRNfncvuUMx1dJ3mW6AHcmCEKHQSJIH5Anf+K74+/
 Kbftk3xLcjuKyWKPZFk0L0cLaHSktqwkMLmzU93TWPvRMARTFlDFHKlKK98aJ5RJqKKpm3NL7Cs
 D+OD3t+qW4yB0fCv3Podfay0PWiRyH4VF837tYwyB3yVEZeo4xKntwef9S6r3GZlObfK5LYZ775
 Bsb5P7vYsL9QgqOWtc2MdBzi+Hlmj+654ix6A12TtAx1RBynqNPEkANRVyGzWy
X-Google-Smtp-Source: AGHT+IH7rEb3b8oNezNAaS4mzrc6TPl91oAMw2F+3d+wXSBvSVorOkVwYYq6ayvfZxpBoR4e2a/Ewg==
X-Received: by 2002:a05:600c:524a:b0:456:1204:e7e6 with SMTP id
 5b1f17b1804b1-459f4f517dbmr76537445e9.11.1754839544598; 
 Sun, 10 Aug 2025 08:25:44 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e585586esm229637635e9.13.2025.08.10.08.25.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 08:25:44 -0700 (PDT)
Message-ID: <ac658ccc-52fc-49b3-b9b6-fb017c38a3a1@smile.fr>
Date: Sun, 10 Aug 2025 17:25:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <petr.vorel@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20250731172810.2935094-1-bernd@kuhls.net>
 <20250731191941.GA780832@pevik>
Content-Language: fr
In-Reply-To: <20250731191941.GA780832@pevik>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754839545; x=1755444345; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HoN7NKPyrRt3vWjJmyKHCsIX0giH2X7Pdz2Fqtff/WY=;
 b=0LY+e8rpSryqKgFRFg+yUAvq9VWh1qAQevvexbRlYLe7RtRlOW7hpquTnG3w3hN4vN
 vowv6RlaZ/wk2pjH6SFWkRLo2qDWbR2fEz0p3i2CbIJRXQ4qPfBruvOZzfPcIbwz2NZu
 rKuQAq1qERdC6PteA538dzwfymgT5d+Pkyxsw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=0LY+e8rp
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: Fix build with
 glibc-2.42
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQmVybmQsIFBldHIsIEFsbCwKCkxlIDMxLzA3LzIwMjUgw6AgMjE6MTksIFBldHIgVm9y
ZWwgYSDDqWNyaXTCoDoKPiBIaSBCZXJuZCwKPiAKPj4gQWRkIHVwc3RyZWFtIHBhdGNoIHRvIGZp
eCBidWlsZCB3aXRoIGdsaWJjLTIuNDIuCj4gCj4gVGhhbmsgeW91IGZvciBiYWNrcG9ydGluZyB0
aGlzIGZpeCEKPiAKPiBSZXZpZXdlZC1ieTogUGV0ciBWb3JlbCA8cGV0ci52b3JlbEBnbWFpbC5j
b20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKTm90ZTogZ2xpYmMgMi40MiBpcyBub3Qg
eWV0IHN1cHBvcnRlZCBpbiBCdWlsZHJvb3QgYnV0IHNpbmNlIG5mcy11dGlscyBwcm92aWRlIGEK
aG9zdCB2YXJpYW50LCB3ZSBuZWVkIHRoaXMgZml4IGZvciBob3N0cyB1c2luZyBsYXRlc3QgZ2xp
YmMuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gS2luZCByZWdhcmRzLAo+IFBldHIKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
