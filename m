Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663B3C28B30
	for <buildroot@archiver.kernel.org>; Sun, 23 Mar 2025 20:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88DAF40D91;
	Sun, 23 Mar 2025 20:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAsQAADnlcak; Sun, 23 Mar 2025 20:14:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADB2A40D8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADB2A40D8F;
	Sun, 23 Mar 2025 20:14:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B7905E
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 20:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C30A400F1
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 20:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZodqh86lOFL for <buildroot@buildroot.org>;
 Sun, 23 Mar 2025 20:14:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79DB34051B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79DB34051B
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79DB34051B
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 20:14:32 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-2c2ada8264aso1656747fac.2
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 13:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742760871; x=1743365671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T4J75mOd/Ty9vl2FftKuzrunp54rCSSH/zv9fFKjzMU=;
 b=rXoSkqmhaD6Ynl6nsczmgnxiHC7CFTyx7dZ0YqHWyMQqY1x1A7htCet1jn4K3S8e7J
 z1ca4OKxNqg98WOs0yjzBJu+k3JyYiWOGUpLW68IzTxJByxbyQaZ/FuIC9Dr/VqcgL9W
 bltBmk4Ok2zDo2nl3LdTtLa7Knyve8EmgmuHoTy4ZpBnnTYZEE4I7WdeelTwW4TaxyIB
 f4pJ8wYWuU0oDGOB6QybhOVUlp1jnPgwr2JmviUsMCCuZQWHHY91qRPXAnDfYGNodF4O
 Xv7bgZvPJ48jI604GPOWOBa7P1su7Kn6FzVPZqfMPfrFH1S5vGrmCYlM/MjoaGRNp8Lo
 oncA==
X-Gm-Message-State: AOJu0YznVxVj92B3gmDD1SzCVcXP8WToKBMleNJ/zmkg9XvIy9odCwGH
 CkgVYC4whbKHVRxpjM5KHLX8ZFTyK9xWWAhmNS8HVGvRDr89LLigBbM8iP2UPD346e8ZI75PFJg
 I
X-Gm-Gg: ASbGncuMNpSE8vXybgZOoCERgs4OhHYYoBsB+R3pQLXt9BrEfnyOXVccMCZ3+TGqouf
 xMwM9jixIx4YqxarTVZOjKMkAM3Janr+1dlo3YW8ZFZpJMNeS34YI+IcMPd/C8aXHo84HEBDWDj
 xLf3OSUYkJXxDTHGNu3S+Sjd/GRK/CG0Wg0qN8N+Dn+j48UHf6ass1dbN8ykWdTnV40rJKF0ASm
 R7eZyYFh9s3E+0DXL9QnF4f2iLQoyN7H6Lenq/YNLf23ZfdwHvDOeWsvzoKoaE1xxHBtXOdXTAx
 REi+J367bgr6rTck6nCzLxgwNJvgVmJ5B4m5bGo8E569geoKrypCCrB6BSgAmK2YC9i4MEo5TKJ
 roQEGuLIZjtZa
X-Google-Smtp-Source: AGHT+IHsSVITlZrJfatZm+Ma8+u3tCrOQ9PRjNaVh52HlCPcgythPjpcuFPfQSQOfDelW7f6m4qhFg==
X-Received: by 2002:a05:6870:46a8:b0:2c2:3ae9:5b9c with SMTP id
 586e51a60fabf-2c7801fe4d5mr7329974fac.2.1742760871271; 
 Sun, 23 Mar 2025 13:14:31 -0700 (PDT)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com.
 [209.85.167.171]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-72c0ac6c55esm1337192a34.46.2025.03.23.13.14.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Mar 2025 13:14:30 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-3fbc00143d6so2412704b6e.3
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 13:14:30 -0700 (PDT)
X-Received: by 2002:a05:6808:f90:b0:3f9:56ff:1468 with SMTP id
 5614622812f47-3febf79199amr5142082b6e.24.1742760870511; Sun, 23 Mar 2025
 13:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1742563913.git.yann.morin@orange.com>
In-Reply-To: <cover.1742563913.git.yann.morin@orange.com>
Date: Sun, 23 Mar 2025 13:14:19 -0700
X-Gmail-Original-Message-ID: <CA+h8R2o-PvEan9x9yJ1qcNNLw1QSMcrGqistf20FF_5iv=c5PA@mail.gmail.com>
X-Gm-Features: AQ5f1JpwKfgkQiMMNkuz5YKgtrwCP0dz0XBk1jIB-Y9eYLkLFMfXYFEAzu3H4G0
Message-ID: <CA+h8R2o-PvEan9x9yJ1qcNNLw1QSMcrGqistf20FF_5iv=c5PA@mail.gmail.com>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1742760871; x=1743365671; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T4J75mOd/Ty9vl2FftKuzrunp54rCSSH/zv9fFKjzMU=;
 b=aTsrvhp5OIw4NTOo1hV/LwV/uCGQWdCkuGRm8NHz9KbXrfTT7d6lugVToKdkDFiF/s
 +wMZoyvAVO/pB2FZ+NVZ8JjF7AltHih4IiL7kFxBnn+ORYhW6MoYnAhdh1/mUgzHfSoH
 VJwiFGcYyrBs4/eS6HKc8PPt1C7D2zbWgtv1yCZ1yYHHJdet8xLMFWnBXTxWcIS2uMWU
 jiPJ5XN2uMwdnGEIEm4AV3HISP1nuzwtRndN8d23uLvf2Iz5d0NmPmIFXI3f0DUOB2IJ
 ohG9Vj1/TX7bSTM1rlgkVAeS2hvX3sTEmR+IdyL2pHy0ycdp6+MPDTXylTuqcB9WM9/Y
 esew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=aTsrvhp5
Subject: Re: [Buildroot] [PATCH 0/4] package: add some docker credential
 helpers
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

SGkgWWFubiwKCgpPbiBGcmksIE1hciAyMSwgMjAyNSBhdCA2OjMy4oCvQU0gPHlhbm4ubW9yaW5A
b3JhbmdlLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiAiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW5A
b3JhbmdlLmNvbT4KPgo+IEhlbGxvIEFsbCEKPgo+IFRoaXMgc2VyaWVzIGludHJvZHVjZXMgc29t
ZSBkb2NrZXIgY3JlZGVudGlhbCBoZWxwZXJzIGZvciB2YXJpb3VzIGNsb3VkCj4gcHJvdmlkZXJz
OiBBV1MgRUNSLCBHb29nbGUgQ2xvdWQgUGxhdGZvcm0sIGFuZCBBenVyZS4gVGhpcyB3aWxsIGFs
bG93Cj4gb25lIHRvIHB1bGwgYW5kIHB1c2ggaW1hZ2VzIHRvL2Zyb20gdGhvc2UgcmVnaXN0cmll
cy4KPgo+IFRoZSBzZXJpZXMgc3RhcnRzIGJ5IGV4dGVuZGluZyB0aGUgZ29sYWItcGFja2FnZSBp
bmZyYSB0byBhY2NlcHQKPiBwYWNrYWdlcyB3aGljaCBzb3VyY2VzIGFyZSBsb2NhdGVkIGluIGEg
c3ViLWRpcmVjdG9yeS4KPgo+IFRoZW4gaXQgaW50cm9kdWNlcyB0aGUgY3JlZGVudGlhbCBoZWxw
ZXJzLiBQcmV0dHkgYm9yaW5nIHBhY2thZ2VzLi4uCgoKVGhhbmtzIQoKU2VyaWVzIGxndG0KClJl
dmlld2VkLWJ5OiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
