Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498ECC27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 21:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E46316111E;
	Wed, 19 Jun 2024 21:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b59ok59giWta; Wed, 19 Jun 2024 21:58:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E2A2605E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E2A2605E0;
	Wed, 19 Jun 2024 21:58:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99BDA1BF287
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 21:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93C2640508
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 21:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-lPn0khRZac for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 21:58:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=kris@embeddedts.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35C0C404ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35C0C404ED
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35C0C404ED
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 21:58:40 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-704090c11easo239256b3a.2
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 14:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718834320; x=1719439120;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:to:reply-to:subject:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pfWKq8rX/qIni+8/KjOX+eLvgiXOdsmTku7CUTCTE4w=;
 b=vHq3EumFu1jRpgDnr7cwR5K4DkJZHmYQZrus3+UGktBEWITxNn8SOME1RCv9jqRPd8
 V7rgO2UrMFExpzlwtoUj3zxhigdAemcPJO0MjwO9IjwWzY/PeTMXvaq4lx/5/H2/cVio
 4E9UtAI5mZQEbXMc7EPqrVDuV7OEpn9/iokIQBbyC+0s3CgTzIrH2ilGFgZx9dX0Lk7p
 su50ZnCacI15Nv+nElOCCFZWa9XVkbViumnMnKfDWuQWksqhxURqIl0Pux+g4+mXYtLT
 cKl9j2LJBbtDqOMS+W1AUWQ89wbXcuS+XPejAkzazSPS9e/IKS6CUog6/xTOufr9ZJGp
 GJMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD/ZZXsJBxLSMUdtU3rSxUF6zyoRp7q/byqlC2R2V+if9wFBZgjj8jk39L81cXRMhOiR/FPo+WAvFBB+vhLZqqQWjud6bZfA==
X-Gm-Message-State: AOJu0YyRjWpwOYlBAc+ee7CphO+lEPHA5KG5ssiCzFoITOdd0lb1KABF
 V2xJ0qrdVT8+WjpM6oz6CKprpcXxcK/phV24trWGdC1qlD5PttFpS6Iriniza4E=
X-Google-Smtp-Source: AGHT+IFms5ib8ZHikLxTdCb+ilLi84Djt8DpORKv4aZFuj1+i2jfhuQJKMzOlNk9/4wTNPOQG0epwQ==
X-Received: by 2002:a05:6a00:cc1:b0:706:2bd4:a68a with SMTP id
 d2e1a72fcca58-7062bd4a764mr3790093b3a.10.1718834320262; 
 Wed, 19 Jun 2024 14:58:40 -0700 (PDT)
Received: from [10.10.10.151] (71-34-94-103.ptld.qwest.net. [71.34.94.103])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb99f4dsm11120567b3a.216.2024.06.19.14.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 14:58:39 -0700 (PDT)
X-Google-Original-From: Kris Bahnsen <kris@embeddedTS.com>
Message-ID: <d623962a622fa56b05ec3ebf887db7fcaf953b04.camel@embeddedTS.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Date: Wed, 19 Jun 2024 14:58:38 -0700
In-Reply-To: <666bca1d.5d0a0220.286d8.4109SMTPIN_ADDED_MISSING@mx.google.com>
References: <666bca1d.5d0a0220.286d8.4109SMTPIN_ADDED_MISSING@mx.google.com>
Organization: embeddedTS
User-Agent: Evolution 3.38.3-1+deb11u2 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embeddedts.com; s=google; t=1718834320; x=1719439120; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:to:reply-to:subject:message-id:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pfWKq8rX/qIni+8/KjOX+eLvgiXOdsmTku7CUTCTE4w=;
 b=B7zEt7QMuHfI8nIH8RcHoCZ36HjUKwNQN8T+nKLviiltQzdluMnegWX5YOD6ZoglEm
 CI0m7PcVOu2y3AxRb6+YDKq7nmHAXQa5SCh9y9mE1PvwkYaDgL3aGLMcKiGQPxxy3jfO
 aMqgTY1zoEF99x9GZESnKMKDivrZ/AWZa8c68=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=embeddedts.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=embeddedts.com header.i=@embeddedts.com
 header.a=rsa-sha256 header.s=google header.b=B7zEt7QM
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2024-06-13
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: kris@embeddedTS.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBGcmksIDIwMjQtMDYtMTQgYXQgMDQ6NDIgKzAwMDAsIFRob21hcyBQZXRhenpv
bmkgd3JvdGU6Cj4gSGVsbG8sCj4gCj4gQXV0b2J1aWxkZXIgZmFpbHVyZXMKPiA9PT09PT09PT09
PT09PT09PT09PQo+IAoKWy4uLl0KCgpSZXN1bHRzIGZvciB0aGUgJ21hc3RlcicgYnJhbmNoCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCkJ1aWxkIGZhaWx1cmVzIHJlbGF0ZWQgdG8g
eW91ciBwYWNrYWdlczoKCsKgwqDCoCBhcmNowqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZWFzb27CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKfMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAK
dXJswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgCi0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQrCoMKgwqAgb3Ixa8KgwqDCoMKg
IHwgd2lsYy1kcml2ZXItbGludXg0bWljcm9jaGlwLi4uIHwgCmh0dHA6Ly9hdXRvYnVpbGQuYnVp
bGRyb290Lm5ldC9yZXN1bHRzL2ExODRiNjEyNGQzNDE5MWM3YmZlNWVjYTdhNTcxNDAwZDY4M2Q5
YzMKCgpUaGFua3MgZm9yIHlvdXIgY29udHJpYnV0aW9uIHRvIEJ1aWxkcm9vdCEKCgpXZSBhcmUg
d29ya2luZyBvbiBhIHBhdGggdG8gYmV0dGVyIHN1cHBvcnQgdGhpcyBkcml2ZXIgZXh0ZXJuYWxs
eSBhcyBNaWNyb2NoaXAKbm8gbG9uZ2VyIG1haW50YWlucyBpdCBvdXRzaWRlIG9mIHRoZWlyIGtl
cm5lbCAod2hpY2ggbGFncyBiZWhpbmQgTGludXgKdXBzdHJlYW0pLiBJbiB0aGUgbmV4dCBmZXcg
d2Vla3MgSSdsbCBiZSB3b3JraW5nIG9uIGEgc29sdXRpb24gdG8gdGhlIGlzc3VlIG9mCm91ciBv
d25lcnNoaXAgb2YgdGhlIGV4dGVybmFsIG1vZHVsZSwgYnV0IG5vdCBvZiBNaWNyb2NoaXAncyBk
cml2ZXIgZGlyZWN0bHkuCgpJIGFwb2xvZ2l6ZSBmb3IgdGhlIGRlbGF5cyBpbiBhZGRyZXNzaW5n
IHRoaXMsIEkganVzdCB3YW50IHRoZSBjb21tdW5pdHkgdG8Ka25vdyB0aGF0IHdlIGFyZSBrZWVw
aW5nIGFuIGV5ZSBvbiB0aGVzZSB0aGluZ3MuCgotLSAKS3JpcyBCYWhuc2VuClNvZnR3YXJlIEVu
Z2luZWVyCmVtYmVkZGVkVFMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
