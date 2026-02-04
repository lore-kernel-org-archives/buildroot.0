Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D51E9536D
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 10:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EFA040C6C;
	Wed,  4 Feb 2026 10:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jCYoJRRylN8z; Wed,  4 Feb 2026 10:19:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89622409C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770200384;
	bh=ePuUBc7FwDJIydx2uXdSNPAfVam54HwOVhEpCErA25I=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pPjgtpPtFZNwqbabJx1pkZKzUypc5V2QHAFPpv85P8KmiU+EwAS7kH5C05LprYd2l
	 pHGfz8MowaEFIoupL2o4s+dQGRAzQPesqABF7viBuUePtpib7EpbAE8t5Z73UgHpHP
	 e/tAUyCnJ1+Tj0xe045iWPNNblHkI42Z8PVICymkaQuOm10+WFPBtmg4ZYY/KHOpNQ
	 Ov9Ni/s0NYe/KZh8l99uKe6eEcuNglVJcAfL8Uj+bjgYeCHsbUW+q9AUfnXBsvsykU
	 NoMo9Y4g+QogCQdw5VQGQDfuPCJn8LLCC3anMIgpsywtwcPD6bDRYgMRCrLm+9drFF
	 keU18kZJ9M2gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89622409C8;
	Wed,  4 Feb 2026 10:19:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB44D173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABA2D80C3D
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jhgv6x4_9ByJ for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 10:19:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8A8580BA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A8580BA4
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8A8580BA4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:19:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4806f9e61f9so34750875e9.1
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 02:19:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770200379; x=1770805179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UKA3twvLISkmSFzuCY1U8VIQScw3KvIaUazX5VYjA20=;
 b=IaLVWQF2aoQk1J4Wkvvax3PG1PFx2rZENh7vJwBiTgnA/KmBVQHxSvw17hrCw0OKPj
 GdEw6KzQ5Ieshh9n+TguUvcuqTCfSmzONKFC4NSfordnNKxkAcLsrwovoPEr/Gnydk7X
 ZGD4B75+aKA/WrkX6d9HL9A1MxMj9kp+rjojfkVUEN3j8gdKjvRkrSCYZujg83xNPFIM
 NBUXhyPrjJL6e7wP/IrNGl3v/3YmEJY/Dvqg40sNj9oInuD6xiqRVr2IwDYTzg3531Ia
 XzRQ1HSv/col1u/Nds1X5r9QWA13QH4NkFRPdT9mh3xEsgBI36zX+Ms+tOvYGH9K+wId
 f8jg==
X-Gm-Message-State: AOJu0YxY/ZklphCaMeGj1wsbF8un2VX6x8IiGKFQF38Mx/ZvlPrba7Lx
 pU6U6m28E1UcGg02eBkPD5QaTz3eg7K4kHLlikpQbhgBK6wpXk4eUnYqmKne
X-Gm-Gg: AZuq6aJdBLXCBau5u2TAaSLOuQox/trbQuzMKWo3MdZFka39mXxqZxnDpHBdMHH085z
 ZEb0EwyAeH8DEBmXRsnK/WjSM/D1yqWymQTNaa8Im+UUcPuNfddpMd1iUElKVXKt3o1FG6oJsa4
 WeuEfY0X5sZvyLqMc1I+VO/kAgEMFvsFbp9/4JjaLRdBwUer/lIDn1cmq67T70hFN+Pp5HJ3RkA
 MhgWIN0+g6gWlcF7ifLsy0INsPzwGt/x9jDC4AyUhUj5ymm2tvGAyYjO6rCEt3/q5CGpPdmWcy+
 +CfKviFFfRewPg+A3gEjUDr//noHTJOFwtBgtFpB7pcYeXr2+drxL1Mf20UUKc/TZUnorUrmxXk
 nr6tLlrALacMlU21ZvIqAxq5NsLQjYv+GTVx6Jghxlz0o4AcO06qd3x/EDyKGNJMkiwaVtYipde
 jSwTdsuWFEr5fJgcDXI9yk2WojWQ==
X-Received: by 2002:a05:600c:871a:b0:47e:e61d:b8d2 with SMTP id
 5b1f17b1804b1-4830e976f0fmr34693185e9.27.1770200379308; 
 Wed, 04 Feb 2026 02:19:39 -0800 (PST)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4831088c4cesm34011705e9.11.2026.02.04.02.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 02:19:38 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: elmehdi.younes@smile.fr,
	romain.naour@smile.fr,
	shirokovalexs@gmail.com
Date: Wed,  4 Feb 2026 11:19:36 +0100
Message-ID: <20260204101937.58460-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0c99ea3e-3253-4f64-ae5c-64e460150dfb@smile.fr>
References: <0c99ea3e-3253-4f64-ae5c-64e460150dfb@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770200379; x=1770805179; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UKA3twvLISkmSFzuCY1U8VIQScw3KvIaUazX5VYjA20=;
 b=c6JuE9mcJJR2jz3i5FVTG7KxHQujkVYx6wshLHMi/RXnpOklvyQdchPODhaIRtUVRN
 VHmOwYrFcuM1ZsC15tIyneJYjPkHtJ3FY1CIxnjaw21f1kYmjxWUb+DKvz2VF0peyvMs
 mUgxQjqdcegtzibG3ZJDs5nmr4zU176tNg6FbmMbwrOuoyh0p53nt6xrE9BpBghj6aaX
 wKxsP33d4Pap+pmTriGpRb8yIzDmPAllwvlRV+xE9KIe7kC8avzfAmDJ4+XOcYs7W+qF
 Ir2FpiZroHfvxQqGWLcG5oOHTtUlhJNFtT8tdhx+4wZU8LfyFx/Sv+fzGGpOpuM404DE
 ar+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c6JuE9mc
Subject: Re: [Buildroot] [v7, 2/2] package/uutils-coreutils: new tests
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

SGVsbG8sIFJvbWFpbiwgQWxsCgo+IFRoZSBUZXN0UnVzdEJpbiBhbmQgVGVzdFJ1c3Qgc2hvdWxk
IG9ubHkgdGVzdCB0aGUgcnVzdCB0b29sY2hhaW4uIFJpcGdyZXAgaXMKPiBvbmx5IHVzZWQgdG8g
dmFsaWRhdGUgdGhlIHJ1c3QgdG9vbGNoYWluLiBBZGRpbmcgdXV0aWxzLWNvcmV1dGlscyBpbiB0
aGlzIGxpc3QKPiBpcyBpbmRlZWQgY29udmVuaWVudCBidXQgSSB3b3VsZCBwcmVmZXIgYSBzZXBh
cmF0ZSB0ZXN0IGZvciB1dXRpbHMtY29yZXV0aWxzLiBJdAo+IHdvdWxkIGJlIG5hbWVkIFRlc3RV
dXRpbHNDb3JldXRpbHMgdGhhdCB3b3VsZCBoZWxwIHRvIGlkZW50aWZ5IGFueSBpc3N1ZSBjYXVz
ZWQKPiBieSB0aGUgcGFja2FnZSBpdHNlbGYuCj4gCj4gdXV0aWxzLWNvcmV1dGlscyBzaG91bGQg
YmUgdGVzdGVkIGFnYWluc3QgYm90aCBSdXN0QmluIGFuZCBSdXN0IHRvb2xjaGFpbi4KClRoYW5r
IHlvdSBmb3IgdGhlIHJldmlldyBhbmQgY2xhcmlmaWNhdGlvbnMuIEnigJlsbCByZXdvcmsgdGhh
dCBwYXJ0LiBJdOKAmXMgbXVjaApjbGVhcmVyIG5vdy4KClJlZ2FyZHMKQWxleGFuZGVyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
