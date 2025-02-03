Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF40C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 17:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA1E460586;
	Mon,  3 Feb 2025 17:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kx2mdQxSHk3z; Mon,  3 Feb 2025 17:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1DB060C31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1DB060C31;
	Mon,  3 Feb 2025 17:38:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA0CD185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D7CA41271
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c07EcbT5_klq for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 17:38:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 672B8410B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 672B8410B3
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 672B8410B3
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:38:27 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3eb7e725aa0so1810080b6e.0
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 09:38:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738604306; x=1739209106;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=62Iixnek7yrdLBxk0tiZd+Z/Bs7KF3F8p7vP2WYFBe0=;
 b=HM4J46FPM+mg6MRVQ5o+q35sTFzU9wSVQ41llgn8RDSG3N0oVVtnDOOJhAYb2V4goB
 qGiUsHuVHJp4Eyl6rnzGEODgJUsmbiTe1WS+/vyaHCsEwka96jwErlOeXo//IG4kJOf5
 1L+w9Rq5aXHP6xPUByyLO/Yp6EsWLKjt1YRaoTZbyCPgeRACrVqM3VihI/fZJuDXz7/S
 OlXz+4S0DMk721qXFNsXgnu4o5thz6fBHFGf+jZd6aK16yqfiAor9+ONeCNKJU/th7lJ
 az4Ykl4JutEcNAIhUhQdlOSZvrzjfDB2V+j/R8SGXbM65KjEfjiatdqKMyAy5sbqto0K
 jq9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8FDrrOod6WqMIVUPLIgzd19zwFh6JuA2qeXxYwoMyuSWs9aDnMRzGjHMNxcYhSDmojYqpx5AoUHw=@buildroot.org
X-Gm-Message-State: AOJu0YyelW0uDvHjbWcy3QksapukGRBTrJagYJPEnu3H8SB8DJiBPfr+
 TIrkYLCDJd30ZbwBBM9oAtpWB3xoGgNUSF1trSSrrflWOdR7SWyD0bROf99c102x4h0Yd9OXWnh
 e
X-Gm-Gg: ASbGncuhsVfLeb4kt2pTXpFuNALNCajrl7pIp+h0gnjb1JavfrYy3DlelRT6aUq+BAU
 xLCpqH57H4NLnp+W7c2kGFCZ0pb2TACX01UatN4NtFlot6nQBwX+E+54hyEz374FGDll+O4OUYO
 CnrNmpr2UuWVpQ0d6L7bfmIj2vSAQdmzsadAKEMfGQqV5htb+uSHkZyPHvrVOJ8nE+N+4WblTRk
 hi8doRE5LllVe2LyGt8qMYPsOOXSPCbS77XY6rQ7kHlbEiYSiGEG2cWi+s3TkGC4VOw/juZkhpN
 qedfnfjvKV1zOQmDtnjhw5wqEUjaCLJOAFfB7ks+/2rwG1s65kRecYs=
X-Google-Smtp-Source: AGHT+IG/J5HJjS7OboNUdvr5eYfjzW/NvpBSttBm7WnEbLaaHDAFR/y4xX7/1LadO784nzBIznrrXg==
X-Received: by 2002:a05:6808:bc5:b0:3ea:5ab4:584d with SMTP id
 5614622812f47-3f323b3d97fmr15994615b6e.33.1738604306176; 
 Mon, 03 Feb 2025 09:38:26 -0800 (PST)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com.
 [209.85.160.52]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f3335423d4sm2633202b6e.15.2025.02.03.09.38.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 09:38:25 -0800 (PST)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-29fc424237bso3094736fac.0
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 09:38:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWZC4DIdW122k51RbC8NYrvK3kDX/C0QS5Xqff6HOmyJTcZ1JSAK8Wrh425abhTrDb7oR4AFuN9fn8=@buildroot.org
X-Received: by 2002:a05:6870:c69c:b0:2a0:d2d:e606 with SMTP id
 586e51a60fabf-2b32f2f8538mr13277508fac.38.1738604305231; Mon, 03 Feb 2025
 09:38:25 -0800 (PST)
MIME-Version: 1.0
References: <20250131212420.5956C8678A@busybox.osuosl.org>
 <536f4074-7be7-4c4a-aadf-4d9bf0a028f6@gmx.de>
 <38f38c04-5983-4f05-9045-31d5e86eccc2@mind.be>
 <782533c1-7da0-4d66-9a9c-0dbfa1d009db@gmx.de>
In-Reply-To: <782533c1-7da0-4d66-9a9c-0dbfa1d009db@gmx.de>
Date: Mon, 3 Feb 2025 09:38:14 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rrLXajnCW0WoOxB-=5dw_3VpsLHWjvLFYvnVEdyFqziw@mail.gmail.com>
X-Gm-Features: AWEUYZlGsAdYb80ofIZknH2_AOBIOrCgwEA6373-iQFRCCRUQraZvGo35Gh0DlQ
Message-ID: <CA+h8R2rrLXajnCW0WoOxB-=5dw_3VpsLHWjvLFYvnVEdyFqziw@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738604306; x=1739209106; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=62Iixnek7yrdLBxk0tiZd+Z/Bs7KF3F8p7vP2WYFBe0=;
 b=Yxv8b8f6PYq2xyVN5mIsKJebXbIbhSLCBdE1Ii0PtHcrjeDsAs7nhzQoUG1wc8KbBM
 Zop0ay2dpMW6Wfo8hawRaGZrngBe7+Xll+TJoyIJWLcOJD/psk5z9/6kGfw1HhsEC5wm
 Zr1rSjtHUuYFOt6IMlWKEsUW8znUxr9YLsAWiteCVjRsS4jRPImr5rlZBtF4mA5Enw3t
 JDahODOYzV4zVVYd83+axFydSsnpyPFqTG/BlLjeBZ4KkjINY8XC3N1sHRMowjgdTbAH
 FXXA3IAFBrAvEJa7o6a1j/hVLxHd9tPz/8CI1dYsxVZ182n+TZanoDNkeXtI3560+WZa
 5nOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=Yxv8b8f6
Subject: Re: [Buildroot] [git commit] package/containerd: bump to version
 v2.0.2
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKCk9uIE1vbiwgRmViIDMsIDIwMjUgYXQgMzo0NOKAr0FNIEZpb25hIEtsdXRlIDxm
aW9uYS5rbHV0ZUBnbXguZGU+IHdyb3RlOgo+Cj4gSGkgQXJub3V0IQo+Cj4gQW0gMDMuMDIuMjUg
dW0gMTE6NTcgc2NocmllYiBBcm5vdXQgVmFuZGVjYXBwZWxsZToKPiA+IE9uIDAzLzAyLzIwMjUg
MTE6MzgsIEZpb25hIEtsdXRlIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gPj4gSGksCj4gPj4KPiA+
PiBjb250YWluZXJkIGZhaWxzIHRvIGJ1aWxkIGZvciBtZSBhZnRlciB0aGlzIHVwZGF0ZSwgd2l0
aCB0aGUgZXJyb3IKPiA+PiBtZXNzYWdlIHNheWluZyAibGQiIGNhbm5vdCBiZSBmb3VuZCwgbG9n
IGJlbG93LiBJIG5vdGljZSB0aGF0Cj4gPj4gaG9zdC9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1t
dXNsL2Jpbi8gaXMgYWJzZW50IGZyb20gdGhlIGNvbmZpZ3VyZWQKPiA+PiBwYXRoLCBhbmQgQ0Mg
YW5kIENYWCBhcmUgc2V0IGluIGVudmlyb25tZW50LCBidXQgbm90IExELgo+ID4gW3NuaXBdCj4K
PiBJdCBsb29rcyBsaWtlIEdvIGFjdHVhbGx5IGZvcmNlcyB0aGF0IGZsYWcsIGJlY2F1c2UgKm9s
ZCogQmludXRpbHMKPiB2ZXJzaW9ucyBoYWQgYSBidWcgaW4gdGhlIEJGRCBsaW5rZXI6Cj4gaHR0
cHM6Ly9naXRodWIuY29tL2dvbGFuZy9nby9pc3N1ZXMvMjIwNDAKPgo+IFRoZXJlIGlzIGEgcGVu
ZGluZyB1cHN0cmVhbSBwYXRjaCB0byBkcm9wIHRoYXQ6Cj4gaHR0cHM6Ly9nby1yZXZpZXcuZ29v
Z2xlc291cmNlLmNvbS9jL2dvLysvMzkxMTE1Cj4KPiBJJ20gdGVzdGluZyBhIGJ1aWxkIHdpdGgg
dGhhdCBwYXRjaCByaWdodCBub3csIEknbGwgc2VuZCBhIHBhdGNoIGZvcgo+IHBhY2thZ2UvZ28v
Z28tc3JjIGlmIGl0IGZpeGVzIHRoZSBwcm9ibGVtLgoKClRoYW5rcyBmb3IgbG9va2luZyBpbnRv
IHRoaXMuIEkgZGlkIG5vdCBzZWUgdGhpcyBidWlsZCBpc3N1ZSBvbiBteSBlbmQuCgpJIGhhdmUg
Z29sZCBpbnN0YWxsZWQgb24gbXkgc3lzdGVtLCB3aGljaCBpcyBwcm9iYWJseSB3aHkgaXQgd29y
a3MgZm9yIG1lLgoKV2hlbiBJIGFwcGxpZWQgdGhlIHBhdGNoIHRoYXQgeW91IHNlbnQgbWUgSSBn
ZXQgdGhpczoKCkVSUk9SOiBZb3VyIHN5c3RlbSB1c2VzIGJmZC5MRCAyLjQwIG9yIG9sZGVyIHdo
aWNoIGhhcyBpc3N1ZXMgd2l0aApkeW5hbWljIGxpbmtpbmcgb24gYWFyY2g2NApDb25zaWRlciB1
cGdyYWRpbmcgb3Igc3dpdGNoaW5nIHRvIGJpbnV0aWxzLWdvbGQuCgpCZXN0IHJlZ2FyZHMsCkNo
cmlzdGlhbiBTdGV3YXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
