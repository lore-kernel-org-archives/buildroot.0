Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3C7C54798
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 00:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 447894148B;
	Wed, 28 Feb 2024 00:06:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5OWaB6UGcws7; Wed, 28 Feb 2024 00:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 517B5415D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 517B5415D6;
	Wed, 28 Feb 2024 00:06:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A35D41BF365
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 00:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9044C60C0D
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 00:06:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GCssUkrFNlAq for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 00:06:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8119260655
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8119260655
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8119260655
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 00:06:29 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5101cd91017so7135906e87.2
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 16:06:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709078787; x=1709683587;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ahIZquEyvudakjB4k7R+wfvSd4EeQGI5icznGocCTTo=;
 b=FeosmXTlVOZJfA5KGB/4b0vaWG55NbwTnlmPvfYoSZYDimXQceYySBwBqzl/KLyiXI
 NLR7izmtN3Yl+FtHld1GanzHEn+M97M2vmf650Lk4M54oZ28Mz18Kupy9xit9/Y/eB8j
 SlgBpJVXUxTCREn/rkMog1+vjgX1wYFTIoGzY9HzC1fFXrUVPoi5h3d2UJyb+GVUv9iF
 EBNys5NXOCqX3KVuN+V1AdnRFRNjgKi8SHXm4rTVX6L1RHehg3A70HznO9Au/Gj/gsTj
 3YCDAQyGXBMviEEDeVCdoRFAPnEYz+fs5eE9EW7huuV6EuwOV9B9EHLjMyqRm5Eo21nb
 ZeqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/0aYwWcEfaApySLXrWxiewK2uGYS2kuQZKphxozl8B0KW5s4kHSN7o/1KthrL1oBW7bbVdCCyXUnnD1o4qum0Md7Wc2JAbA==
X-Gm-Message-State: AOJu0YwF5eyFRLykGjeW3uRJZhQRssqXT1Ej+g54ZHQeVWsR48Y3u/LI
 hVPOcjbIE37mJ3LvqPy1eH3SjnzYjO3m4vZuefZd08l/hnU4q88a
X-Google-Smtp-Source: AGHT+IFtJIVl5FCXd5P8a1RBaBC0sKQkr2MUxSAYBFd3ILxgn0a0mpMr7H8jfsEaDbqhcbzfPUjA+Q==
X-Received: by 2002:a05:6512:3c8a:b0:513:16cc:c5b2 with SMTP id
 h10-20020a0565123c8a00b0051316ccc5b2mr1329370lfv.33.1709078787009; 
 Tue, 27 Feb 2024 16:06:27 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 kt8-20020a170906aac800b00a3d0dd84276sm1243142ejb.184.2024.02.27.16.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 16:06:26 -0800 (PST)
Message-ID: <066a576a350d384c6547dc27b55e75c8044ed9e8.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 buildroot@buildroot.org
Date: Wed, 28 Feb 2024 01:06:36 +0100
In-Reply-To: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709078787; x=1709683587; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ahIZquEyvudakjB4k7R+wfvSd4EeQGI5icznGocCTTo=;
 b=ZZ7BsX8ri0MTLQHRTVo/RqY6w7CK0My9UWRhDQLRUX/bkXotVrMMTDLqs2f1//lu6x
 0t/7TlfuGF+8THOZEK7qAF53OarrHyDZ9ZSRBGnB3/qGJYKPayDpOourXTxllummXjlQ
 UqXELoIpLXvWSEXs14rLIiRD6NeN3hixFeS4BP4b/gBnEpywohx1+7xzTBoa3sC3Yo18
 ovS2Sl/YbvbFIJdRnfTEtQumKPCEo745AajeyaIXCVW5d1Nsj8wyat/QugFzsWX6qdC7
 ByLEiVAoIFGG3snSSW0wD0yZC3XFoFxfRcYrz3R9z0IHbhY/k9dKxNmfJyqrLUJ6yNmO
 lqXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZZ7BsX8r
Subject: Re: [Buildroot] [PATCH v7 00/17] Add support for AM62x-SK HS-FS
 devices
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sIFJvbWFpbiEKCk9uIFR1ZSwgMjAyNC0wMi0yNyBhdCAxNzozMCArMDEwMCwg
RGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gVGhlIFNLLUFNNjJCLVAxIGlzIHRoZSBuZXdlc3QgdmVy
c2lvbiBvZiBTSy1BTTYyIHdoaWNoIGluY2x1ZGVzCj4gaGlnaC1zZWN1cml0eSBmaWVsZC1zZWN1
cmFibGUgKEhTLUZTKSBzaWxpY29uIHRvIG9wdGlvbmFsbHkgY3VzdG9taXplIGtleXMKPiBhbmQg
ZW5jcnlwdGlvbiBmb3Igc2VjdXJpdHkgYXBwbGljYXRpb25zLgo+IFRoaXMgcmVxdWlyZXMgZW5h
YmxpbmcgdGhlIEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NFQ1RZUEVfSFNfRlMgb3B0aW9u
LAo+IHdoaWNoLCBob3dldmVyLCB3YXMgYnVnZ3kuIFRoaXMgc2VyaWVzIGZpeGVzIHRoZSBlcnJv
cnMgYW5kIGJ1bXBzIHRoZSBMaW51eAo+IGtlcm5lbCBhbmQgVS1Cb290IHJlcXVpcmVkIGZvciBz
dWNoIGEgbmV3IGRldmljZS4KPiAKPiBEYXJpbyBCaW5hY2NoaSAoMTcpOgo+IMKgIGNvbmZpZ3Mv
dGlfYW02Mnhfc2tfZGVmY29uZmlnOiBmaXggQlIyX1RBUkdFVF9PUFRFRV9PU19QTEFURk9STQo+
IMKgwqDCoCBzZXR0aW5nCj4gwqAgY29uZmlncy90aV9hbTY0eF9za19kZWZjb25maWc6IGZpeCBC
UjJfVEFSR0VUX09QVEVFX09TX1BMQVRGT1JNCj4gwqDCoMKgIHNldHRpbmcKPiDCoCBjb25maWdz
L3RpX2FtNjJ4X3NrX2RlZmNvbmZpZzogZXhwbGljaXRseSBzZXQgdGhlIHRpLWszLXI1LWxvYWRl
cgo+IMKgwqDCoCB2ZXJzaW9uCj4gwqAgY29uZmlncy90aV9hbTY0eF9za19kZWZjb25maWc6IGV4
cGxpY2l0bHkgc2V0IHRoZSB0aS1rMy1yNS1sb2FkZXIKPiDCoMKgwqAgdmVyc2lvbgo+IMKgIGJv
b3QvdGktazMtcjUtbG9hZGVyOiBidW1wIHRvIHZlcnNpb24gMjAyNC4wMQo+IMKgIHBhY2thZ2Uv
cHl0aG9uLWF0dHJzOiBhZGQgaG9zdCB2YXJpYW50Cj4gwqAgcGFja2FnZS9weXRob24tcnBkcy1w
eTogYWRkIGhvc3QgdmFyaWFudAo+IMKgIHBhY2thZ2UvcHl0aG9uLXJlZmVyZW5jaW5nOiBhZGQg
aG9zdCB2YXJpYW50Cj4gwqAgcGFja2FnZS9weXRob24tanNvbnNjaGVtYS1zcGVjaWZpY2F0aW9u
czogYWRkIGhvc3QgdmFyaWFudAo+IMKgIHBhY2thZ2UvcHl0aG9uLWpzb25zY2hlbWE6IGFkZCBo
b3N0IHZhcmlhbnQKPiDCoCBib290L3RpLWszLXI1LWxvYWRlcjogc2V0IGJpbm1hbiBlbnZpcm9u
bWVudAo+IMKgIGJvb3QvdWJvb3Q6IGFkZCBCUjJfVEFSR0VUX1VCT09UX1VTRV9CSU5NQU4gb3B0
aW9uCj4gwqAgcGFja2FnZS90aS1rMzogbW92ZSBUSV9LM197U0VDVFlQRSxTT0N9IG91dCBvZiB0
aGUgaW1hZ2UtZ2VuIHNjb3BlCj4gwqAgcGFja2FnZS90aS1rMzogZGlzYWJsZSBIUy1GUyBmb3Ig
QU02NSBTT0MKPiDCoCBib290L3RpLWszL3RpLWszLXI1LWxvYWRlcjogaW5zdGFsbCB0aWJvb3Qz
LmJpbgo+IMKgIGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnOiBidW1wIFUtQm9vdCB2ZXJz
aW9uIHRvIDIwMjQuMDEKPiDCoCBjb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZzogYnVtcCBM
aW51eCB2ZXJzaW9uIHRvIDYuNi4xNwoKSSdtIHNvcnJ5IGZvciBtaXNsZWFkaW5nIHlvdSB3aXRo
IHRoZSByZXN1bHRzIHdpdGggdjYuCkkndmUgYnVpbHQgdjcgc2VyaWVzIGZvciBHUCBhbmQgaXQg
cnVucyBmaW5lIG9uIFNLLUFNNjIgKEdQKS4KU2VlbXMgSSd2ZSBtZXNzZWQgdXAgZWl0aGVyIGJv
b3QgZGlwIHN3aXRjaGVzIGluaXRpYWxseSBvciB0aGUgc2VyaWFsCmNvbnNvbGUuIFRoYW5rcyBm
b3IgeW91ciBlZmZvcnRzIQoKVGVzdGVkLWJ5OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRl
ci5zdmVyZGxpbkBnbWFpbC5jb20+CgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
