Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4683C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 21:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56BF040026;
	Sun, 14 Jul 2024 21:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iIFTfeb8xID2; Sun, 14 Jul 2024 21:54:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CA2740106
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CA2740106;
	Sun, 14 Jul 2024 21:54:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B54591BF3CE
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 21:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1FCA40106
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 21:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6VJRQi3kv5h5 for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 21:54:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E7C040026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E7C040026
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E7C040026
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 21:54:00 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52e9c55febcso4737089e87.2
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 14:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720994038; x=1721598838;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/yqkQgDB1eai1PuUAj0ioPH/i5sIiJ9ps3r00c1tVe0=;
 b=oJ6CNoCNs+aMvtLJgpXy4eFSybCMWnL1l0hoCKO7/Sh+8+XcXztOWk7xJtAKSkb5WE
 bH4uvBsLJqDyTROLVTInZt/NO8bvoOQTUs9gRBOxkUcQKH5/gnvxYJV3+s8wHwqbp6S4
 3YO3JKx7TbeXz6q64DpsgiEWm+3xsERDgX0rx3pgxHc3yeqYYLAACw8EhziFrwPGdOM0
 COfcz2X+Eg+erEYR2rFWZzV2uIDJKWBtvBjcKqCTT6pq7ZRCFqEs+U26TDVX5mAyzU6X
 kHFYEQPMwL9jRHFnlKlrD7g00XvmgoePgzsegS9SmLDEn2M8cgqMk6nVLoi5o2p5b78i
 0WUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFsEyFhtry4HX77k3aeTO8ylEqbl3I2Uh80AGkKPsShzPAiEku+6pL4io3gSPQMnzpTAzwpAJRaaVOPe2PJ/N8azDQ2Fk30A==
X-Gm-Message-State: AOJu0Yw+3wm6cLUtIk0BX6LOnr58/3KPMQBE1XNALG/FGy8hBUh0SRYs
 6WP6Q9yf1OoUvIsXqaxkw6Dd+h+uExADN4BeSE3sULLy4nW8F1dYo6AJXFLO6GI=
X-Google-Smtp-Source: AGHT+IGptYyXtJgGLkwlInukwrNK1OBzkgMUWLWUHU2C/K26TfGut0oJZXruMqGy2EbxoIGbo3TEag==
X-Received: by 2002:a05:6512:3c9d:b0:52c:deae:b8fa with SMTP id
 2adb3069b0e04-52eb9991a0emr11444547e87.3.1720994038020; 
 Sun, 14 Jul 2024 14:53:58 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f25babbsm97097235e9.20.2024.07.14.14.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 14:53:57 -0700 (PDT)
Message-ID: <99111ccd-6581-4a06-9b85-9a782eb46b60@smile.fr>
Date: Sun, 14 Jul 2024 23:53:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Neal Frager <neal.frager@amd.com>
References: <20240619101343.1240550-1-neal.frager@amd.com>
 <20240628093436.41f0d254@booty>
Content-Language: fr
In-Reply-To: <20240628093436.41f0d254@booty>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720994038; x=1721598838; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/yqkQgDB1eai1PuUAj0ioPH/i5sIiJ9ps3r00c1tVe0=;
 b=qcTmZ0LthpMAzBH5tN6lKKfqyC+22nlDlWftC1Xeheyf9mBKoBZ9WJW4kzQNhPFcHu
 oNZGjmyIyHuBoJtVER6hdYpDgjWLFS4/x2Ims4yXlOj4/tvCoRq6wcHCtd4VcPMRl0hY
 sME5LvboBBgien6tHY8aC+aliZdMAv5eZCB5c=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=qcTmZ0Lt
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal_vpk180_defconfig: new
 defconfig
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
Cc: andy.a.kennedy@collins.com, ibai.erkiaga-elorza@amd.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTmVhbCwgQWxsLAoKTGUgMjgvMDYvMjAyNCDDoCAwOTozNCwgTHVjYSBDZXJlc29saSB2
aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gT24gV2VkLCAxOSBKdW4gMjAyNCAxMToxMzo0MyAr
MDEwMAo+IE5lYWwgRnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPiB3cm90ZToKPiAKPj4gVGhp
cyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIFhpbGlueCBWZXJzYWwgVlBLMTgwIEV2YWx1YXRpb24g
S2l0Lgo+Pgo+PiBWUEsxODAgZmVhdHVyZXMgY2FuIGJlIGZvdW5kIGhlcmU6Cj4+IGh0dHBzOi8v
d3d3LnhpbGlueC5jb20vcHJvZHVjdHMvYm9hcmRzLWFuZC1raXRzL3ZwazE4MC5odG1sCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IE5lYWwgRnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPgo+IAo+IFJl
dmlld2VkLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPgo+IAoK
QXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
