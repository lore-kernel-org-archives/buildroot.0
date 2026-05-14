Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09530CD37AC
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 20:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8359820AD;
	Thu, 14 May 2026 19:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-4iZRoFNeWA; Thu, 14 May 2026 19:58:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AE3F82152
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778788685;
	bh=iUT8NVi2EsfQhtxXeYaWrwk6WQ6mSE741O4jNCZYAP4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LHNLkktNlOKi35+Gk7OqskM9PoqxQ7SyV86yoHwoTKJbFPxgSWM0clFErpq2UHKyS
	 cMegyB+5u+0N0eH1ewOUTbA+O/bzjrOsUjakEcffua3aCwbgWVNoSssI/xEIyqLOhj
	 cYE01YZt9nUhhRzEE1DWI7Dm6rkrYvvOJYVy7dwKxRGyXzAyCakQkT90/9p1NCd6lZ
	 rGv10AbGHn9ScJ+PEPavCVODkx9BfLt3nl91AxneABXmWZNmW2M/Pg11JDdQBgInWT
	 lQ92QkpTdvsbkcE9gKhwXdTGrfNXK6w0xFTWPswj6JClm4ZO6jDQvIYvvZtywR1QpH
	 r/PrnT6n9VkCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AE3F82152;
	Thu, 14 May 2026 19:58:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5BD337D
 for <buildroot@buildroot.org>; Thu, 14 May 2026 19:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B7AC4083C
 for <buildroot@buildroot.org>; Thu, 14 May 2026 19:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8rDyB-3Q-Rn for <buildroot@buildroot.org>;
 Thu, 14 May 2026 19:57:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0863540836
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0863540836
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0863540836
 for <buildroot@buildroot.org>; Thu, 14 May 2026 19:57:54 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-7de7c57b52cso6712518a34.3
 for <buildroot@buildroot.org>; Thu, 14 May 2026 12:57:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778788673; cv=none;
 d=google.com; s=arc-20240605;
 b=Tiw/vKK5/rgHZ0SxcaycEJc4kRukE4ivYNSXXiVp4C30IL8OUjQMxMwiHomtMpZAhd
 VkQMNyK//yQhuJhLcppe8pFdEwECJ+w8bjONFhtgod4P5uStAil1Urg7wDU1c4/nwO15
 IGbaA+ERVzg1kCpGmsGoloaX/mYqLzwFi1umqutIWMrkq6LNjmLIhXx0GO3RWiFM2SrC
 atSKaE5r5S/VXOWXIX4kcyZkwcHpu8mcfyIqwoQN4dJ3fN+Ictji9uCpVzzDJouYJvM4
 4JLcArGhwHtm9F29zO3uak79KTpMS9zHauJ8iV8KQvPQJf8s245oW0jYsHt1IwnUxgJn
 HQfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=AWmRa3FLhXb/JNDaXXr3Yvqd6UbQKPf1vKgyLPeN5ho=;
 fh=d3rvabJrYsxp2FS37qtyD+GwAr0x7axek5hGL2aM6rM=;
 b=Hbfmk7QpdiBbFchFwHiJaB/mDZ186KE7eAblqUNw9CF6HU3EqkGzk3s5inzDh0RmUj
 FQWgNOXEaYXJHS1Hxo/KY7QM+DTLSuf662y0cP03goq0Ox2sIiJkNQTmPD2q+Kq5+Tp+
 0Ze7ufm4wpbg3BdUVsGBRbBT5MC5oOxspdHKRw2jCcusu9N9qphVN+a3r5KbDOKxUZoE
 sK/J0ohvPiC37xojExccetaNQpwOtyvmim1yacd3G2OPNWotOAUdIZMm2leOKjNZyVMb
 tD1i85JXSxX/8W/TNPgL9dhaZ6uutN9i16FKckpn8O7me6nu62XBZYiidV05Fuvipeso
 udoA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778788673; x=1779393473;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AWmRa3FLhXb/JNDaXXr3Yvqd6UbQKPf1vKgyLPeN5ho=;
 b=BQNZjp+GkbubnKB7KKTRJTWWCvIzQrE0zZC98n7PfLr6BqfGvUxyowZdmWxLECz2un
 cPhsO3hjywSvk1uAeGJ0f0ojSNsF0RZgJ2BR5xZyB/eInV+N3HfPStB7RRh7Bv7NUIyX
 z2MO5eEk+rXIWpAo2mOOs0F+MEUu9UpnvPYcPDICf6IVpXppGVNzCvqzjrs0NZWGdGSe
 5+Mpp2pbfbGfPbPBpeNMe6WDjX82ZLbG8qccSOF1WIgQsX5tAl6GD9xC+YaZ1/EU+HjB
 HIjGthcuEBdTZhKzVtkBktx+kIUKG9puTmEybw1L4SR1BVH9CeZ8HUSmlMRmTmJ91FtV
 5ALw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9HMf5fCmUH1L5y07vquvDjXsaTfdT45kUX3vpIW9gZjA6b7jePxfGCQu99PX1ruRvgbh3AvlNl75o=@buildroot.org
X-Gm-Message-State: AOJu0Yx/68skxvTH1vhDKj+tKEBTdGvvGFmH349k9YvUUH0xpra8OFR2
 /PJj3u8sJRdGR7xlcP9dXCweR7/O1SZMwbgQEq9tUX/Vu6q3qBGE/lGJ6dnm+VL6OUBu8WThjLc
 KLO7Ku+UPM6D4qOd7lbGZe8+jEd3W3gA=
X-Gm-Gg: Acq92OGHIxOPbNhNMJwaLW8nl8nZs47WAe3byNFqVF2M6wpuyLe7IIzOklybI3Eq+ZM
 KzX8cEzNbU9jQ8vQKT9KbPImSbl07p7EP3SWyuuK0FUf58h6aldzkakDf8Q+Rzm/yeavjQX7am/
 cd3fVSurr4cV4mWdsHEISj7cRrK+QMsE9vprR/Uqx6tAQQ9+I1JltjX6452GG6Iyxwuj6JgZ5dw
 ywl90QUAV4ur9XiF0549P+8dyrhG1++Sl1E8lWfR2JOa7GKG9VQauusCc/Ww0CsgPT2rgIhvE94
 ycOh
X-Received: by 2002:a05:6820:8c2:b0:694:9071:b622 with SMTP id
 006d021491bc7-69c9bfc7cacmr575175eaf.52.1778788672678; Thu, 14 May 2026
 12:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-radeonsi-aco-compiler-v1-1-6557627f3d55@anodize.com>
 <ce2f40c6-1c9b-4aaa-be5d-9699ada1da3e@smile.fr>
 <CAMWSM7h4zNQ2z1roRwHHQzDDv-+COL5pLe-GKGmZvkzrZut5qQ@mail.gmail.com>
 <9847f417-14cf-4eb6-96ca-bcaf483ed0f5@smile.fr>
In-Reply-To: <9847f417-14cf-4eb6-96ca-bcaf483ed0f5@smile.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 14 May 2026 12:57:15 -0700
X-Gm-Features: AVHnY4IFm0yxMIP4nW1tjNJ7NtIQoCK1-G6b2eWPY6JHaWze5aGv0RAI2wgK1WA
Message-ID: <CAMWSM7hA4eFJYjZ2cz45sVp90CmuZ=HHtN7FsGEXi9fk2mdY7w@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: Joseph Kogut <joseph@anodize.com>, buildroot@buildroot.org, 
 Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778788673; x=1779393473; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AWmRa3FLhXb/JNDaXXr3Yvqd6UbQKPf1vKgyLPeN5ho=;
 b=iDmvQOcziiEmyhQIsX98Qgu/txfvvCQ54CVJ+bsN6z9e3cvVmu1YvG22g3USgig1sZ
 g4IU+ftEy/yTEf7oThVbLQOPkpFb4RVu88pFjG2xH9nZljYG0mdrP0XfMvoz6kTqNvWN
 SMK+skQ0XSH0ywyFHX2BEFRGawsKzEHcJln01j6oNKvINU/pbLSq0yTuHfKo8ZXmossh
 YbDwWWGTed3celJRuWP6wp7f/WHzLrWQ3h24noHasbHul7k9h04jlG7FiWob5NawYsgH
 bZZauuXcawpwV7zq6Uh2PWNdUQvvXAdUpMH124jgKmXtfdzNVQDQVB/rwzV85L4NlttX
 A7GA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=iDmvQOcz
Subject: Re: [Buildroot] [PATCH RESEND] package/mesa3d: make LLVM optional
 for radeonsi
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUm9tYWluLAoKT24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgMTE6MjHigK9BTSBSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4KPiBMZSAxNC8wNS8yMDI2IMOg
IDE4OjM3LCBKb3NlcGggS29ndXQgYSDDqWNyaXQgOgo+ID4KPiA+IFNob3VsZCB3ZSBhZGQgYSBu
b3RlIHRvIHRoZSBjb21taXQgb3IgS2NvbmZpZyBoZWxwIG1lc3NhZ2UgZXhwbGFpbmluZwo+ID4g
dGhhdCB0aGUgTExWTSBjb21waWxlciByZXF1aXJlcyBhbiBlbnZpcm9ubWVudCBvdmVycmlkZSB0
byB1c2U/Cj4KPiBJJ20gd29uZGVyaW5nIGlmIHdlIGNhbiByZW1vdmUgdGhpcyBsaW5lIGVudGly
ZWx5IHNpbmNlIHRoZSBsbHZtIGNvbXBpbGVyIGlzIG5vCj4gbG9uZ2VyIHVzZWQgYnkgZGVmYXVs
dC4gQnV0IGlmIEJSMl9QQUNLQUdFX01FU0EzRF9MTFZNIGlzIGFscmVhZHkgc2VsZWN0ZWQsCj4g
ZW5hYmxpbmcgQlIyX1BBQ0tBR0VfTExWTV9BTURHUFUgZG9lc24ndCBpbmNyZWFzZSBhIGxvdCB0
aGUgYnVpbGQgdGltZS4gV2UgZG9uJ3QKPiBrbm93IGlmIHRoZSBzeXN0ZW0gd2lsbCB1c2UgQU1E
X0RFQlVHPXVzZWxsdm0gb3Igbm90Lgo+CgpJIHRoaW5rIHdlIGNvdWxkLCBvciBhdCBsZWFzdCBw
bGFuIHRvIGFzIGEgZnV0dXJlIG1vZGlmaWNhdGlvbi4gTWF5YmUKdGhlIExMVk0gc2hhZGVyIGNv
bXBpbGVyIHN0aWxsIGhhcyB1c2VzPyBJJ20gbm90IHN1cmUuCgpNeSBvd24gbW90aXZhdGlvbiB3
YXMgdG8gcmVkdWNlIGJ1aWxkIHRpbWVzIHdoZW4gdXNpbmcgcmFkZW9uc2ksIGFzIGl0CnJlcXVp
cmVzIGNvbXBpbGluZyBib3RoIGEgaG9zdC1sbHZtIGFuZCB0YXJnZXQgbGx2bSBmb3IgYSBzaGFk
ZXIKYmFja2VuZCB0aGF0IGlzbid0IHVzZWQgYnkgZGVmYXVsdC4KCj4gWW91IGNhbiBkbyBib3Ro
LCBhZGQgYSBub3RlIHRvIHRoZSBjb21taXQgbG9nIGFuZCBhIGNvbW1lbnQgaW4gUmFkZW9uIFNJ
IGhlbHAKPiB0ZXh0IHRvIHJlbWVtYmVyIHdlIGhhdmUgdG8gdXNlIGFuIGVudmlyb25tZW50IG92
ZXJyaWRlLgo+CgpEb25lLgoKQmVzdCwKSm9zZXBoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
