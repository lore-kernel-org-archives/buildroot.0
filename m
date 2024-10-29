Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA030D2AB3C
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 13:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C0524052B;
	Tue, 29 Oct 2024 13:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjFDx__n_Kqj; Tue, 29 Oct 2024 13:34:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B74B40530
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B74B40530;
	Tue, 29 Oct 2024 13:34:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D4654EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E21C481173
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlR1NlIwTxUk for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 13:34:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E87D180588
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E87D180588
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E87D180588
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:34:31 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2fabb837ddbso81626711fa.1
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 06:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730208870; x=1730813670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SN2qb5z96bK0O2EPQohUz5VJYmBy8UbnkcE/1TtYz3o=;
 b=oYZXGNVDmiszV7tSmeVwGACCOVuDPVkVmplqTzilTMs0rB50Fm+ZLbEg6cpv5SG009
 ZdY35YB7iKdtxEwxc7kYO1gvJlJQcd9WljigZltw3AmOSpspltiWoE3lBEBaL2N7wa1L
 JipkWGXK/j6+8O0/H3R4q6CuVNM2jB4xW0l+0o+QffsP40QYaedQGiPW55LI2zHVG6Gn
 7qgCMya8Y6z4kMr7UAAFgl3t5ftW90RZ/W8W3Ko0DCNEedwkhd2QzXxAIrmxu+gK7NLI
 s4yIv8jUI28QvcijYz88qZLx7WHjhtx55PjkF0HHkbOxZIsfnnxC3NxdyyuYhjlWnqzd
 RMfQ==
X-Gm-Message-State: AOJu0YwYucMBX8i1gWR4bHFzeXG3SAEQIxCnk6WaMW0AK1CvaeDSH9wQ
 fjN2YSpmyNPqvSYcn4uf5e6tWNOds5V8wWf2S72zrbO2Oc0RPxKH/YhoWGL68BFKNpYbE94/Rob
 jHQPgTe3AX1NkurYi7cgnRSnGR3Y=
X-Google-Smtp-Source: AGHT+IHDA4SHO+O5X++ajujHm3aJt+xUNyEzdgg6p1P7YzBWfFP4yV/OZpcLGDjY7VClP4lEB3SIr5VvCjnEkzaTeRM=
X-Received: by 2002:a05:6512:39c2:b0:538:96ce:f2ed with SMTP id
 2adb3069b0e04-53b348ba01fmr8951349e87.10.1730208869440; Tue, 29 Oct 2024
 06:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241029044843.703796-1-fancp2007@gmail.com>
 <20241029122141.50cd82d3@windsurf>
In-Reply-To: <20241029122141.50cd82d3@windsurf>
From: Scott Fan <fancp2007@gmail.com>
Date: Tue, 29 Oct 2024 21:34:18 +0800
Message-ID: <CAFkzVZbMnTyfy2VfrNY0Pb4-Xi=MDmuGvgyvpk-rBns3NO8N+w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730208870; x=1730813670; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SN2qb5z96bK0O2EPQohUz5VJYmBy8UbnkcE/1TtYz3o=;
 b=Q6cwFH5RjEsHABMGfn5bMnk8QrqFntE3Jf9GDLvnqFY72rZhCvsVOV18NPa1SN8+/L
 NrJK0yCdVsDtDhJ9BrkPKZvNgV/QTj7JuursKMU3u/fu5zfTMctnwCZ0AhUDX6rv3si1
 5FuqGxyLgpEneW0PxQUGxSjIMiYXQ+De8mAuVETIFGtDWvb8WTTjxwFf8As7kczwwoCh
 ez7pBhnzhsqdqRZsUEtDm6UMgfutS1MmHTwVafnaZhjMHBJ71hXjvvi1MXiXppL1QopQ
 pF+iOI954LnaA26pvrNV6IL+Izh8ld1SWDYZm3V8pwq/vp+wt5aRRxKSU+tpq0BQhBtB
 TsPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Q6cwFH5R
Subject: Re: [Buildroot] [PATCH] package/procps-ng: fix typos in config
 option and help text
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
Cc: Julien Olivain <ju.o@free.fr>, Peter Korsgaard <jacmet@uclibc.org>,
 Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gVHVlLCBPY3QgMjksIDIwMjQgYXQgNzoyMeKAr1BNIFRob21hcyBQZXRh
enpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gU2Nv
dHQsCj4KPiBPbiBUdWUsIDI5IE9jdCAyMDI0IDEyOjQ4OjM4ICswODAwCj4gU2NvdHQgRmFuIDxm
YW5jcDIwMDdAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gIGlmIEJSMl9QQUNLQUdFX1BST0NQU19O
Rwo+ID4KPiA+IC1jb25maWcgQlIyX1BBQ0tBR0VfUFJPQ1BTX05TX09SSUdJTkFMX1RPUAo+ID4g
K2NvbmZpZyBCUjJfUEFDS0FHRV9QUk9DUFNfTkdfT1JJR0lOQUxfVE9QCj4KPiBUaGFua3MgZm9y
IHNwb3R0aW5nIHRoaXMuIEhvd2V2ZXIsIHNpbmNlIHRoaXMgb3B0aW9uIGhhcyBtYWRlIGl0cyB3
YXkKPiB0byBCdWlsZHJvb3QgMjAyNC4wOCwgSSB0aGluayB3ZSBoYXZlIG5vIGNob2ljZSBidXQg
dG8gYWRkIGFuIGVudHJ5IGluCj4gdGhlIENvbmZpZy5pbi5sZWdhY3kgZmlsZSBmb3IgdGhlIG9s
ZCBvcHRpb24gbmFtZS4KSSBmb3VuZCwgbm8gZGVmY29uZmlnIGZpbGUgaGFzIHVzZWQgdGhpcyBv
cHRpb24gc28gZmFyLgoKClNjb3R0IEZhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
