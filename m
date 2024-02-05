Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C1FC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 09:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 933946062F;
	Mon,  5 Feb 2024 09:28:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 933946062F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bQaHN6GVZaiH; Mon,  5 Feb 2024 09:28:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9700F605EC;
	Mon,  5 Feb 2024 09:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9700F605EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FCC31BF40B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAA1C40A67
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAA1C40A67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YNQi2zhk8bfB for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 09:27:57 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CC9A40108
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 09:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CC9A40108
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33b401fd72bso299209f8f.3
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 01:27:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707125275; x=1707730075;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0E/9RtSlLwHFYK126nCNShHCWiOZGrKuT8MiqfIIQY0=;
 b=AYmJWO4IjKNZ3ldp4oE86NiCeAhp681dmf5X3+r8P98pnqaRXJ0q3wT3tMRg6fBLf1
 GGK/h0N1JPjsOiZICs9htGwTZMRehP9O2ef9jiFr6PpVPBGHHriKmH96PPBVPrSDLqG6
 H/xc60i7VG0CPMRdzohPhJIH024RV5mRUjqZpzHbqkQTAMbaX415uhtetaOPO/zZv8Ey
 vpguhywNy2Gfup+tYkG0K8AtbETEFymFO9DsLLbP52HRY1sJcE+aZppshGrED819jyAS
 +2R3kbx7kXTrDQ8Zzjwu6e7V0fKBNs2dBNvz81cP8gSry3eNgsh0TJx5io5PFv+c3wmq
 KszA==
X-Gm-Message-State: AOJu0YyFRWK4lu9pKUZ2dKBTeELn9BITRNLNFZEMAtCrsrNQjWtgHAQX
 evpg8/mudUgckt+naIGWSJc5iXOyZnrokhGkVWdcaBwOJw8zHXCS
X-Google-Smtp-Source: AGHT+IEyDTUlZMLja/stlfFV7ReNoSjb9heHFCaBCOH30mVVvbv7Ow4R0fUdXYLseu79+2L5J/nNow==
X-Received: by 2002:a5d:64c5:0:b0:33b:3c99:357a with SMTP id
 f5-20020a5d64c5000000b0033b3c99357amr1685328wri.28.1707125275271; 
 Mon, 05 Feb 2024 01:27:55 -0800 (PST)
Received: from [192.168.100.115] ([138.199.7.138])
 by smtp.gmail.com with ESMTPSA id
 l4-20020adfa384000000b0033b12167a98sm7733296wrb.8.2024.02.05.01.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 01:27:54 -0800 (PST)
Message-ID: <10609434cc80f8c547228c26bf16a04ce1f14b72.camel@gmail.com>
From: Uladzimir Bely <wiselord1983@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 05 Feb 2024 12:27:55 +0300
In-Reply-To: <20240205101344.7725e2ea@windsurf>
References: <20240204085128.5059-1-wiselord1983@gmail.com>
 <20240205101344.7725e2ea@windsurf>
User-Agent: Evolution 3.50.3 (by Flathub.org) 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707125275; x=1707730075; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0E/9RtSlLwHFYK126nCNShHCWiOZGrKuT8MiqfIIQY0=;
 b=SQ0lJRhoPzVXHLi4zeJYB7NU7YAEoff0ffF98VLGpZddc0A7fkECl+oAFnO/sf7s2E
 cQXmHJdwJKK53T4+xOy0ZnJc3u+gjGdSRHc2tHQL74bxAWo05zQDHjq3BKKutnXTYnP+
 IFBt7nYyECKZuUyZAPb+L1h1JpDGwafOJLyNnkMkHp3s2Kg3RaPAAhVDfQtVj7pq6VSP
 py8G+Y8d0H1WgZ+2OIC7mNk03YBpcwBMdaf3rlIMv/2D8j0uIdUMg0fmCgSLq1qrXzGU
 0o5tV1PUSCmKlebI+Z8jM74fmKJxCMVuv5X3OxOZWFRFwUZC+s7J6P3dBUYS8/C4LzHE
 eZ2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SQ0lJRho
Subject: Re: [Buildroot] [PATCH 1/1] package/python-mpd2: bump to version
 3.1.1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

0JIg0J/QvSwgMDUvMDIvMjAyNCDQsiAxMDoxMyArMDEwMCwgVGhvbWFzIFBldGF6em9uaSDQv9C4
0YjQtdGCOgo+IEhlbGxvLAo+IAo+IE9uIFN1bizCoCA0IEZlYiAyMDI0IDExOjUxOjI4ICswMzAw
Cj4gV2lzZUxvcmQgPHdpc2Vsb3JkMTk4M0BnbWFpbC5jb20+IHdyb3RlOgo+IAo+ID4gU2lnbmVk
LW9mZi1ieTogV2lzZUxvcmQgPHdpc2Vsb3JkMTk4M0BnbWFpbC5jb20+Cj4gCj4gVGhhbmtzIGEg
bG90IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgQ291bGQgeW91IGNsYXJpZnkgd2hldGhlcgo+ICJX
aXNlTG9yZCIgaXMgeW91ciByZWFsIG5hbWU/IEluZGVlZCwgd2UgdW5mb3J0dW5hdGVseSBjYW5u
b3QgYWNjZXB0Cj4gY29udHJpYnV0aW9ucyBzdWJtaXR0ZWQgdW5kZXIgcHNldWRvbnltcy4KPiAK
PiBUaGFua3MgYSBsb3QgaW4gYWR2YW5jZSBmb3IgeW91ciBjbGFyaWZpY2F0aW9uLAo+IAo+IFRo
b21hcwoKSGVsbG8sIFRob21hcy4KClNvcnJ5LCB0aGUgbmlja25hbWUgd2FzIHNldCBpbiBteSAu
Z2l0Y29uZmlnIGZpbGUuCgpJIGNvdWxkIGVpdGhlciByZXNlbmQgdGhlIHBhdGNoIHdpdGggYSBw
cm9wZXIgdXNlcm5hbWUgKGUuZy4sCiJVbGFkemltaXIgQmVseSA8d2lzZWxvcmQxOTgzQGdtYWls
LmNvbT4iKSwgb3IgeW91IGFyZSBmcmVlIHRvIGVkaXQgdGhlCnBhdGNoIG9uIHlvdXIgb3duLgoK
UmVnYXJkcywKVWxhZHppbWlyIEJlbHkuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
