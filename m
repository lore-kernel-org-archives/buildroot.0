Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F06AC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 19:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8777781167;
	Sun, 14 Jul 2024 19:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHMrJZ9NqWSZ; Sun, 14 Jul 2024 19:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EAD5811AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EAD5811AB;
	Sun, 14 Jul 2024 19:46:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B19F21BF40B
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 19:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E146401F6
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 19:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rqmA5vLkpYf for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 19:46:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A63C4400E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A63C4400E2
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A63C4400E2
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 19:46:06 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-367a3d1a378so3246469f8f.1
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 12:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720986364; x=1721591164;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cw8gPfPkaJhZec6fxBXt3fysS16o1fSpB1BQs9ba6fE=;
 b=l7yBpHtciPxDVBhMXAzB7/hytNoYwMkst9gEpnrvQFPE9QSRBT/lNEtQx1KraNKUrl
 3gcyPXbhM0EenKMCV6ChjO/CXxyGtm11Xb3wFOi9bbuakPG5gZFrOyyZibe70euIYfh7
 wniiD5R8ts+YkYszbGEsIxNYmwu67SaJUSrQ1L/i4ap/8qtZNBSVsW7nyFwuZdiXEihO
 u+jn5NscWvKJzJnJOYLBG79Og71NjEgH7X8uY7f0rEa8E8ZC9b1ZergZXv5HMgt9739B
 QNwJE0o1+y+T00+Op8VwInMIYo3KBEHBWoI7QCe7rSrLFjij8wIdUh1Dya0r+H8Epr3K
 26kQ==
X-Gm-Message-State: AOJu0YxPWZ0LeDLqWuJccAZ3MTBSaJXbB8WE+/ku1G6PNDXjUhFSprPu
 3KjAijqeoVdjRz0zugM0IPmjcxmCK8RmCgmQgOJaJsWKbUCgzAImA/PUTv9DSBw=
X-Google-Smtp-Source: AGHT+IHiKcG6Dhgf1rUd3OD9/YMuUCWOrPcgfJ1BRn8b34CBefix10PviXuotgkH/o3gtSVU8QxbsQ==
X-Received: by 2002:adf:e54b:0:b0:367:9754:8107 with SMTP id
 ffacd0b85a97d-367ceadc90bmr13677594f8f.62.1720986364014; 
 Sun, 14 Jul 2024 12:46:04 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dafba0esm4516661f8f.71.2024.07.14.12.46.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 12:46:03 -0700 (PDT)
Message-ID: <09155f65-8222-4a08-9fde-88141ba61501@smile.fr>
Date: Sun, 14 Jul 2024 21:46:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jan Kraval <jan.kraval@gmail.com>
References: <20240220051926.68559-1-jan.kraval@gmail.com>
 <20240513233014.3b09e56e@windsurf>
 <12ae846b-1fc5-49ca-a996-485eb8283405@gmail.com>
 <20240530112514.1843a3a7@windsurf>
Content-Language: fr
In-Reply-To: <20240530112514.1843a3a7@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720986364; x=1721591164; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cw8gPfPkaJhZec6fxBXt3fysS16o1fSpB1BQs9ba6fE=;
 b=P6J3VcFZw3EuluagIcbcWskclxnbykHZ50cslCN2jhbGbjLPXYxVOWfFC8cP7sj3Um
 qveCvIu5z3U6cgildnDUtDW0s24DNndCYkiHQAQ2Sq2LMLDxrWgJF+qT+qJF3i/1CK50
 9OA51tUrFIAdWNn6h1nsbkmb0NUxv5oXVazO0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=P6J3VcFZ
Subject: Re: [Buildroot] [PATCH 1/2] board/orangepi/orangepi-lite: switch to
 extlinux
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFuLCBBbGwsCgpMZSAzMC8wNS8yMDI0IMOgIDExOjI1LCBUaG9tYXMgUGV0YXp6b25p
IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBIZWxsbyBKYW4sCj4gCj4gT24gV2VkLCAyMiBN
YXkgMjAyNCAwNjozNzoyOSArMDIwMAo+IEphbiBLcmF2YWwgPGphbi5rcmF2YWxAZ21haWwuY29t
PiB3cm90ZToKPiAKPj4gQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWVRIT04zPXnCoHdhcyByZW1v
dmVkIGJ5IG1ha2Ugc2F2ZWRlZmNvbmZpZy4gQWN0dWFsCj4+IHZhbHVlIGRpZCBub3QgY2hhbmdl
LCBpdCBpcyBlbmFibGVkIGF1dG9tYXRpY2FsbHkgYnl8QlIyX1RBUkdFVF9VQk9PVF9ORUVEU19Q
WUxJQkZEVCwgd2hpY2ggcmVtYWluZWQgdW5jaGFuZ2VkIGluIHRoZSAKPj4gZGVmY29uZmlnLiBJ
ZiB0aGVyZSBpcyBzb21lIHJlYXNvbiB0byBrZWVwIHRoZSBsaW5lIGluIHRoZSBkZWZjb25maWcs
IAo+PiBwbGVhc2UgbGV0IG1lIGtub3csIEknbGwgc2VuZCBwYXRjaCB2MiBSZWdhcmRzLCBKYW4g
fAo+IAo+IE1ha2VzIHNlbnNlLCBubyBuZWVkIHRvIHNlbmQgYSB2MiB0aGVuIQoKQXBwbGllZCB0
byBtYXN0ZXIgYWZ0ZXIgYWRkaW5nIEJSMl9ET1dOTE9BRF9GT1JDRV9DSEVDS19IQVNIRVMgYW5k
IGhhc2ggZmlsZXMsCnRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBCZXN0IHJl
Z2FyZHMsCj4gCj4gVGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
