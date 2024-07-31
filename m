Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98261C3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 14:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A36040231;
	Wed, 31 Jul 2024 14:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2nsDWLn1tM3t; Wed, 31 Jul 2024 14:59:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 407BC4056F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 407BC4056F;
	Wed, 31 Jul 2024 14:59:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A36AD1BF232
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 14:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 903654056F
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 14:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ixg9izS_2I4h for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 14:59:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6AA3340231
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AA3340231
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AA3340231
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 14:59:32 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52f015ea784so960566e87.1
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 07:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722437970; x=1723042770;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PY1T98XM3xT/zHh1/J2B/eBnTIDuczfkgvH7hVH1Scg=;
 b=bn9qznY9OeTMa4kK7Xw2FzptoedExG994hYbM729VfA2j5jxLgZd6c7o6p4LJ/MrB2
 c3FrOqsPH8ge+8zWULIhaIWKPVh9TX62fLaNB9TIoc5eKP/4qLo4aFwNNZLuc51JXbnR
 a13McNi3FPP0b1qz2GvR9taw8DyWJ/rGyfRyUEGLZzdJ55ein59RW3hNEFv5unmri80I
 5Udo4x8kRfGZYnnJOTr1wL/A1XAkC14GWoN1Wx3ZAi+LK9pRP5rT5nN19a1xOQE0Nd99
 kjRE5laOaWm7UndwuZe+qEpEztYFGWHW00lu1vNnrJYBiNwJw/ay21fq746EXkNBfBIz
 J/ww==
X-Gm-Message-State: AOJu0YwNMJZLxof4+4ZLfG03Pc+PXMkq7tobo7OqdI2dW4zJfmDq39Cy
 aeQwpmBKlJzsehSwjtgHM4Oc5+UQ3u2Re3HpBvF6R9/D1G/xshssPEvd2AldUelWt2dtp7+oMZp
 6MqpQC5B4d6V69CXJ2ujlVwwQk0CK8A==
X-Google-Smtp-Source: AGHT+IH9vSdNO5cmgf+9Q1V/fymMqBRo68tRGgVv7Krbisqwj9sMRBfO0TJwkk1vIYEfoI4G108KC9x4m1RrdiX1Wz8=
X-Received: by 2002:a05:6512:2207:b0:52e:fd7c:8b9b with SMTP id
 2adb3069b0e04-52fd5340ce8mr8392967e87.7.1722437969349; Wed, 31 Jul 2024
 07:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240731144421.363494-1-philip-dylan@gleonec.bzh>
In-Reply-To: <20240731144421.363494-1-philip-dylan@gleonec.bzh>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 31 Jul 2024 11:59:18 -0300
Message-ID: <CAOMZO5BO_07mXQTiyLWBMV8CXd3-6N_sYHcT_O1yY+aRcFFiOA@mail.gmail.com>
To: Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722437970; x=1723042770; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PY1T98XM3xT/zHh1/J2B/eBnTIDuczfkgvH7hVH1Scg=;
 b=FKJdHP6DHl5rFLAzdjFJ8Q+T5jxRacKLxfDEM0fBj0M5/THf3CSPpbYoC569WZ2xSl
 n6bCvqL9ySUUgMk/5d/TCkJtOkyOyzinUZeGCa0P2nAA3K4OUINeovrpzGU887k9FVZJ
 hFncwJarKF8v8FbKpfveIsZhGy/ye4Kgaayam1mmu2TPRuhwDdqce8kINYtE9vONS2nN
 aCD6HZMcNIpMqZGkom7VpsFlU2HRZFj1VcT0BNjr+I7+0jUKfETIVnZtKKZsFwNBDA6E
 +UHcoZUu0ekmtN/c9mZBgQi5E5QVBKnG3K4+V/lbv+gaGDOpcP4fSKSdzLMPubq8wJe/
 utJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FKJdHP6D
Subject: Re: [Buildroot] [PATCH 0/2] Udoo Neo kernel update
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

SGkgUGhpbGlwLUR5bGFuLAoKT24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgMTE6NDTigK9BTSBQaGls
aXAtRHlsYW4gR2xlb25lYwo8cGhpbGlwLWR5bGFuQGdsZW9uZWMuYnpoPiB3cm90ZToKPgo+IEhl
bGxvLAo+Cj4gSSdtIGN1cnJlbnRseSBwbGF5aW5nIHdpdGggdGhlIFVkb28gTmVvIGJvYXJkIGFu
ZCBoYXZlIGZvdW5kIHRoYXQgdGhlCj4ga2VybmVsIGluIHRoZSBjdXJyZW50IGJvYXJkIGNvbmZp
Z3VyYXRpb24gZG9lcyBub3QgYnVpbGQuCj4KPiBXaGlsZSBhIHBvaW50IHJlbGVhc2UgYnVtcCB3
b3VsZCBiZSBzdWZmaWNpZW50LCBJIHRvb2sgdGhlIG9wcG9ydHVuaXR5Cj4gdG8gdXBkYXRlIHRo
ZSBrZXJuZWwgdG8gdGhlIGxhdGVzdCBMVFMgdmVyc2lvbi4gSGFzaGVzIHZlcmlmaWNhdGlvbiB3
YXMKPiBhZGRlZCB0byBlbnN1cmUgdGhlIGludGVncml0eSBvZiB1Ym9vdCBhbmQgbGludXggc291
cmNlcy4KPgo+IFRoZSA2LjYga2VybmVsIGRvZXMgbm90IGFkZCBhbnkgcmVncmVzc2lvbiBjb21w
YXJlZCB0byB0aGUgbGF0ZXN0IDUuMTUKPiBrZXJuZWwuCgpUaGFua3MgZm9yIHRoZSB1cGRhdGUu
CgpGb3IgdGhlIHNlcmllczoKClJldmlld2VkLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBn
bWFpbC5jb20+CgpDb3VsZCB5b3UgcGxlYXNlIGRvIG1lIGEgZmF2b3IgYW5kIGNoZWNrIGlmIHRo
ZSBXaWZpIGNoaXAgZ2V0cyBkZXRlY3RlZD8KCmRtZXNnIHwgZ3JlcCBTRElPCgpUaGFua3MKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
