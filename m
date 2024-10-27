Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E92D0C604
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 02:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 981C54038C;
	Sun, 27 Oct 2024 02:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzLdOzatsMYd; Sun, 27 Oct 2024 02:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 648354038E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 648354038E;
	Sun, 27 Oct 2024 02:24:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BCCB75C24
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 02:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E39F812B9
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 02:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6rwp7lnpAL8 for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 02:24:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B411A812BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B411A812BF
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B411A812BF
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 02:24:18 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-2884910c846so1673178fac.0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729995857; x=1730600657;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jAb3AT+VIZC1+zEVOhc1u1mE2PsTTjJJrUL6zQqr0nk=;
 b=GHqggGQX0h8YNr9vsEINuL9O8KzCNfeWB3DtrtUJgwvQ8ogeuz0wOI+PqyXOFg3R9D
 FqV6XJiuDOmr7hsec9e4kgo1Y1eTkKu/KC2sLLrhNLgLD+q0+9iy+LaOrJMn5sbIyxkX
 oGtQ4eHaM+eKmFAhb/n/T9eidMCQw1D7pTI3Ge71+k0/swWh90vg6Upl4TKRS6/n4VgB
 a1XJ5QPTT/MCwk7VyP3t9+PBYPimi7R25iYEppdS8z3lzuDov+HlQezYmBzQByIffqmj
 iwpDLMfcUHlBPl+APp8EtCRF4AkXUI1fgxbr9xDtH5FYNSeTD6ALIybNf8xqPbmojjRW
 rtmw==
X-Gm-Message-State: AOJu0YwwphZ/trYP0ECVL4Z4pjTmmBPKFlwqpbjoVR1DC6qBHyKWIhz+
 c4Qi0GWB4cX9AllfGCK+8Q9fv4OKuNhvZWVuUiBxyjA0Jmshvpo63UCeRfXdfBM0zMzR9Av1Jc6
 oTJY=
X-Google-Smtp-Source: AGHT+IHsw+NUjFdn/NubslnK0dZsytEyReB06eD2Nhsdw4Ie3xtaneOlSh6eAu1Y5iG8XLUZBH2PQA==
X-Received: by 2002:a05:6870:80d1:b0:288:783d:a0d3 with SMTP id
 586e51a60fabf-29051ad76femr2801993fac.3.1729995857268; 
 Sat, 26 Oct 2024 19:24:17 -0700 (PDT)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com.
 [209.85.160.41]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29035d1ad77sm1244684fac.4.2024.10.26.19.24.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Oct 2024 19:24:16 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-2884910c846so1673174fac.0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:24:16 -0700 (PDT)
X-Received: by 2002:a05:6870:2105:b0:27c:a414:c00e with SMTP id
 586e51a60fabf-29051adf244mr2398541fac.9.1729995856294; Sat, 26 Oct 2024
 19:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241023173631.3304943-1-james.hilliard1@gmail.com>
 <20241023173631.3304943-2-james.hilliard1@gmail.com>
In-Reply-To: <20241023173631.3304943-2-james.hilliard1@gmail.com>
Date: Sat, 26 Oct 2024 19:24:05 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pHitVKJ5AXw+_3bpzRJ3bSgDdvkPG5PWj4GtdxyHgFbw@mail.gmail.com>
Message-ID: <CA+h8R2pHitVKJ5AXw+_3bpzRJ3bSgDdvkPG5PWj4GtdxyHgFbw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Anisse Astier <anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1729995857; x=1730600657; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jAb3AT+VIZC1+zEVOhc1u1mE2PsTTjJJrUL6zQqr0nk=;
 b=AuFYUlKTWC/N9CE3GscoQG9xHe9OQtF1HoCiNSj2Kh44bAabexJvum20Q8ShdlhU0S
 vJe8QkYJu46ay4hrjkhm6b1nNoBwMPSEI/d5L3SY7SMhDxrNtr6buNArmICsbPH1Gs88
 Sl6ax4I9Pyq12zpLSN0DS+aYbR69+TOu1CIyR+zLlvoRYAlDWHJ+1VgJHskTjZc65eTB
 vMElouK7jh2qvL2AwFAj0OmGWfW+F86acAkzD8/zhbdn88SsjSz4jNiAoIJmbM3mh/Ga
 Ql+sNhugvpwm8Ay0LlwnAd11zl0sEGF1r5bN5HSSheLnYEMX7XuKlQGAQkHLJB0RNfVc
 2hoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=AuFYUlKT
Subject: Re: [Buildroot] [PATCH 2/2] package/netbird: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgpPbiBXZWQsIE9jdCAyMywgMjAyNCBhdCAxMDozNuKAr0FNIEphbWVzIEhpbGxp
YXJkCjxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPiArTkVUQklSRF9WRVJTSU9O
ID0gMC4yOS4xCj4gK05FVEJJUkRfU0lURSA9ICQoY2FsbCBnaXRodWIsbmV0YmlyZGlvLG5ldGJp
cmQsdiQoTkVUQklSRF9WRVJTSU9OKSkKCldlIG1lcmdlZCB0aGUgUFIgdG8gdXBkYXRlIHRvIGdv
MS4yMy54IHNvIHlvdSBzaG91bGQgYmUgYWJsZSB0byB1cGRhdGUKdGhpcyB0byB0aGUgbGF0ZXN0
IHZlcnNpb24gbm93LgoKVGhlcmUgaXMgYWxzbyBhIFBSIG9wZW4gdG8gZml4IHRoZSBndmlzb3Ig
ZGVwZW5kZW5jeToKaHR0cHM6Ly9naXRodWIuY29tL25ldGJpcmRpby9uZXRiaXJkL3B1bGwvMjc4
OQoKQmVzdCByZWdhcmRzLApDaHJpc3RpYW4gU3Rld2FydApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
