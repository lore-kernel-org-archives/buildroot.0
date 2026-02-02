Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC2EE7DF08
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D37A540C03;
	Mon,  2 Feb 2026 17:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7yEE3IBzUE9; Mon,  2 Feb 2026 17:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22F994078F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770051771;
	bh=66N6lm4j5QiZcMvKxhxwJrubgsLsLoJkveDhIgJ8/5U=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qky6tPvvOUg7FvFiLdCrGHz0NU2lfT1wDtKiGZczfmLK+HB3PXMHKClrHGORUgiqp
	 YIaDhxBE/I9n2FsRTq1w3fHuT6jvgkoT+EfBMLRS9j4orMT+ffApZetOwquQtDOoIa
	 FPw6wgruco3n8JlM8C714LRp2Z+YFtChl2JbfKICm/ev+evwAf1yJEWnhQgshDtbhQ
	 KA6wzzklB3Zdejbd3xwbWdWlZ09jt/01sD+mbxBWzX30O4i2zyMaoCu+KKkNcM/jmq
	 DUIu45LppiTbFb3LPDWwsiyuKkeCNFkGr405IEtvaWXnxiDVH7xEZpXwH74WvqDOsl
	 FkGQc8+q/U5hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22F994078F;
	Mon,  2 Feb 2026 17:02:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 642901E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CFD64078F
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uy_Diub6O4Hp for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:02:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C04040595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C04040595
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C04040595
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:02:48 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-432d2670932so4331794f8f.2
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 09:02:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770051767; x=1770656567;
 h=content-transfer-encoding:in-reply-to:cc:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iAZkiD86c4mkEY/+Owcfk1bHQyu8YMwK6LUdRNSIHFE=;
 b=uuibotclbg5948zEB9dFJ+3vgG+XRlufjI5gD+ib/V8N2lB/0S/u6T2urWWbZKdXLY
 nXA67Yih3TB/hpdZjRGEBA3+anfcPOUGorAbSVK7rxweZYbKy0lByYWcRSDFjyVECJUg
 bgR6fhCi1QbFI1BBm/6IWUtuL6oOjrp4rjZW1OS3A7/XeF4+fRpmvW9o8vMARdgcgym0
 UMSOyaBmk2KHdnk76Vym1Sd+i8pOO5ebNkRwlirQ75qWGc9u5VeKB4/T5p2BaRXsLSw/
 vpl6gfkrmIapuPsfMUzTWW2k0jyLRJwJcfyxpmGeEKX0hGsn5/1TQaRbeJR6WA/jpVHU
 wXOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjET7xHhxzsU0A5C2Xjh3P06VgtkssC7h3BlHeysbwoOgCPpJwJl3LtQjyNEkkKInjzwdm981YDFc=@buildroot.org
X-Gm-Message-State: AOJu0YxEexpWBNkrWpjq39H6UTj+x07B0fzcKrcHNIx6L6Rjn1LqaF4A
 +pr3pGuDbmww5Yeg5kxyIVvLIAeuO7T1jiwYjnzkdvKYhW+h97Jh1rgzryWzud2eX+5xX1Qg4Pj
 YNbGB1C0=
X-Gm-Gg: AZuq6aKmH8zcKFvoRsaJ5ZUiOjr3chORHfWzXHgOwKzmWXJP9Jy1s1oAJ+HY6QnY2bZ
 qOg20+Fk9IHSis/Em1+wkqrf6BlGPelBr6myxLzGa0drRF4dVo2MWRmi21INlh7FgKNSFYXjInv
 DlndvSF5fgL0aV+LIUT7Lni514p8u0cLDccpNz8Jaz82Fk76bBEYIWrv6cvvyJpf86pGKRQHKvm
 yYVNu5ptOB0cacvafR11aeZdBmqYb28sTOpVIXgCnozbRZnwKZqFnn8y7cc7BGuzKZZPgyOsFqp
 KdnShuFpCRWMR2GL0UzI3gWiiWYktCQfpJEnIolRJ8KtO1TzuX0vWeTlpWSXBhMc2Q9YJI7jjGR
 VundGVFeQeYMUyyreYdQiT/MFGVT6lm6DvMFcPsvjKVdHuoBBtunc2j+HfT5L2JwI/hgkqJRU+p
 jTloDiLwNJSzsz3lFrjVA1jKxqCqI/i65dx6slPeAfY1caela+fEBA
X-Received: by 2002:a05:6000:1863:b0:432:a9db:f9a2 with SMTP id
 ffacd0b85a97d-435f3aaa27bmr18717864f8f.41.1770051766674; 
 Mon, 02 Feb 2026 09:02:46 -0800 (PST)
Received: from [172.16.2.208] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131ce58sm44173762f8f.20.2026.02.02.09.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 09:02:46 -0800 (PST)
Message-ID: <41a35fa0-0c72-44cd-8f47-c9eb4727a098@smile.fr>
Date: Mon, 2 Feb 2026 18:02:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Buildroot Notifications <buildroot.notifications@gmail.com>,
 buildroot@buildroot.org
References: <69798de3.050a0220.10c4f0.eab1@mx.google.com>
Content-Language: fr
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
In-Reply-To: <69798de3.050a0220.10c4f0.eab1@mx.google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770051767; x=1770656567; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:cc:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iAZkiD86c4mkEY/+Owcfk1bHQyu8YMwK6LUdRNSIHFE=;
 b=jwcmMCGairS3MV1brDXXzj3qBMlmFVUVorcwv/9meTRS9VvioxbUGfkO4Oci9gcjkM
 xVkS0Fe/v84ggnWuRxZy9diu/YkF3HUNz/194IqmB476//RQJ/cvD02fLCNgYIfZcBNj
 RJA+URknIeTP9vDQU1hlYVSKMBzJL6fmO830g=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=jwcmMCGa
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2026-01-27
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLCBKYW1lcywgQWxsLAoKTGUgMjgvMDEvMjAyNiDDoCAwNToxNywgQnVpbGRy
b290IE5vdGlmaWNhdGlvbnMgYSDDqWNyaXTCoDoKPiBIZWxsbywKPiAKCi4uLgoKPiAKPiBHaXRs
YWIgQ0kgcmVzdWx0cyBmb3IgMjAyNi0wMS0yNwo+ID09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Cj4gCj4gRGV0YWlsIG9mIHJ1bnRpbWUtdGVzdCBmYWlsdXJlcyBmb3IgbWFzdGVyCj4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gCj4gICAgICAgICAg
ICAgIHJ1bnRpbWUtdGVzdCB8ICAgICAgICAgICAgICAgICAgICAgICAgbGluayB0byB0aGUgam9i
ICAgICAgICAgICAgICAgICAgICAgICAgfCBvcnBoPwo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0KPiAgICAgICAgICBUZXN0UHl0aG9uUHliaW5kIHwgaHR0cHM6Ly9n
aXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMjg1NzQxMzk2NSB8ICAg
ICAgCj4gLi4uUHl0aG9uUHkzTWFnaWNXb3JtaG9sZSB8IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWls
ZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTI4NTc0MTM5NDEgfCAgICAgIApUaGUgdGVzdCBU
ZXN0UHl0aG9uUHkzTWFnaWNXb3JtaG9sZSBzZWVtcyB0byBoYW5nIHNpbmNlIHRoZSBweXRob24g
My4xNCB2ZXJzaW9uCmJ1bXAuIFdvcm1ob2xlIHJlbGF0ZWQgcGFja2FnZXMgc2VlbXMgdXAgdG8g
ZGF0ZS4KCkphbWVzLCBjYW4geW91IGhhdmUgYSBsb29rPwoKQmVzdCByZWdhcmRzLApSb21haW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
