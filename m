Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EFDC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 17:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E835560754;
	Sun, 14 Jul 2024 17:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sclUsAdMBUXa; Sun, 14 Jul 2024 17:46:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2546060687
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2546060687;
	Sun, 14 Jul 2024 17:46:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 233631BF3F2
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F0A4405C9
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Je7iYUHeVAd for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 17:46:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7EE7540506
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EE7540506
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EE7540506
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 17:46:22 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2eedeca1c79so17184741fa.3
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 10:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720979180; x=1721583980;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XPXfLI4p1mPyFlzx2TZN6KX6XKiltqBjft0zP0Ym5Ts=;
 b=GGLUymIBrXTh5tSGhaAlewSKj26cakPMpvlgzBemBXG7xWrmoEywDGP3RUbKlkm0uX
 Ey7DJTV/IeueeQaZWW6vkzX7/w081zcMbEuQiJNxoMq80RQpkUp3n2MY0V8AdF6oqkOF
 vVUk/93WQSc8y2TiXF3EErck817+4oiHKQvG4OmOwqBcE5btJitoGeKiXyiA6xVd830/
 gseizIq5BYdlO/PEoysautZOg6lJL9sJAYkKn2dvDeUzQJ7UOiqXMiB6c0O5YlskGIIx
 Lh/4TXCjhzNucNcLenSWImz9AWlZoZzVuYJIPeXFVtZic+4VSgqk+FvMU6T1TU7pm+/L
 xyNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYpnu6Kr/d7cWemaCitduEsAjJLaT/qf1WtHAxkwkFooYE/2xYKBIT57aRxQadUIyMw/zhikzgPNzwzExhN/S14L8Fc6TnYA==
X-Gm-Message-State: AOJu0YzuGccHFujEsZLUOsO0OByy9SWJvlZJ3UUDomowQ1SBOvvxEDyw
 +VQ9jF8P2cIV3EVp4bU9jEfYjZMPGzdBNmzYDP3DwJWW/Nm7I/tGwNRdT554/vQ=
X-Google-Smtp-Source: AGHT+IEGlBnpRYY03V1rDM4BQxL24TSWCbr1DlR7ywGoVNNjlqQ8ZHJroQQzOj8dILLtnbaa7kCv3w==
X-Received: by 2002:a2e:2ac4:0:b0:2ee:8adb:6190 with SMTP id
 38308e7fff4ca-2eeb3181a58mr123433501fa.35.1720979180114; 
 Sun, 14 Jul 2024 10:46:20 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680daccbd2sm4324014f8f.49.2024.07.14.10.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 10:46:19 -0700 (PDT)
Message-ID: <cfaf217e-437e-480f-a4a8-1510f8ec11ba@smile.fr>
Date: Sun, 14 Jul 2024 19:46:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kilian.zinnecker@mail.de, buildroot@buildroot.org
References: <20240217083525.561684-1-kilian.zinnecker@mail.de>
 <8b75fd72-c3e4-4359-9691-2bf824904d45@benettiengineering.com>
 <6052941.lOV4Wx5bFT@laptop>
Content-Language: fr
In-Reply-To: <6052941.lOV4Wx5bFT@laptop>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720979180; x=1721583980; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XPXfLI4p1mPyFlzx2TZN6KX6XKiltqBjft0zP0Ym5Ts=;
 b=OdlXE14LxObN64fM0ycU/vnqeuu8JJSHCUQBqqfLCm92R2p5Dy0q4LymyOMgbnCjTp
 NppsjhnlYlc+lO6TcPtfY+d/0Ok+Ki7Dvk2ZJStJIHrEU6r75HynfK0ieVUseMJXKNSM
 zjjdBpJrkAxjxy2NLyIe4ga/Fy4fZuZwoNqsw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=OdlXE14L
Subject: Re: [Buildroot] [PATCH v3] configs/rock5b_defconfig: switch to
 mainline linux
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8ga2lsaWFuLAoKTGUgMDkvMDYvMjAyNCDDoCAxNDozMywga2lsaWFuLnppbm5lY2tlci0t
LSB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gSGVsbG8gR2l1bGlvLCBBbGwsCj4gCj4+IGl0
IGxvb2tzIGV2ZXJ5dGhpbmcgZ29vZCB0byBtZSBub3csIHNvOgo+PiBSZXZpZXdlZC1ieTogR2l1
bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4gCj4g
VGhhbmtzIGZvciBhbGwgdGhlIGZlZWRiYWNrIGFuZCBmb3IgcmV2aWV3aW5nIEdpdWxpbyEKPiAK
PiBAYWxsOiBBcmUgdGhlcmUgc3RpbGwgdGhpbmdzIHdoaWNoIEkgbWF5IGZpeCBvciBpbXByb3Zl
LCBzbyB0aGF0IHRoZSBwYXRjaCBtYXkgCj4gZmluYWxseSBiZSBhcHBsaWVkPyBGcm9tIG15IHNp
ZGUgaXRzIG5vdCB1cmdlbnQsIGJ1dCBvZiBjb3Vyc2UgSSB3b3VsZCBsaWtlIHRvIAo+IHNlZSB0
aGUgcGF0Y2ggaG9wZWZ1bGx5IGdldCBhY2NlcHRlZCBhdCBzb21lIHBvaW50LCBhbmQgb2ZjIGlm
IG5lZWRlZCwgSSB3b3VsZCAKPiBnaXZlIGl0IGEgdHJ5IHRvIGltcHJvdmUgdGhlIHBhdGNoLgoK
QXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBC
ZXN0IHJlZ2FyZHMsCj4gS2lsaWFuIAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
