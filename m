Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8414CC0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 22:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B9D960F6F;
	Sun,  6 Aug 2023 22:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B9D960F6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cfRhkEMeHgob; Sun,  6 Aug 2023 22:15:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FD8060E71;
	Sun,  6 Aug 2023 22:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FD8060E71
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DF6F1BF59D
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 22:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83ADC40970
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 22:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83ADC40970
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f6DEkpBkES3B for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 22:15:01 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 278FA4089C
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 22:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 278FA4089C
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-313e742a787so2234050f8f.1
 for <buildroot@buildroot.org>; Sun, 06 Aug 2023 15:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691360099; x=1691964899;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N+0vpXkKyyKz4FNIC0GJsUY4+sC219WI80K7mJH2LWY=;
 b=NCisOui6vTSE48VcQJ9MAhyPNtm0/Tb2L5LoJs5Pvq+XHYpB93DHU7RJiAoLSk9SuZ
 fidLs2FQ2xd/9eZUAOfkFGwffegXHZgzR7fZ76Ctob5bYDOvXwV+Vn4hNDAKKf/SKKdZ
 tip5OanM5mKW4AawyLn+iShsQtujp96u+vSID4BvDaakHytH63/VCamAvYcwHPZU/Shc
 VW2Y1TBblFya6vOBwZK8iRrh1ab124Z2rNUC/f/AXR5WlFDHOfeGtS4Te8+FQ4IXdSPH
 FdDGAE3E91vlmsjLvIITsvE2IFdNOInjqKUhuUAxO6vE0l4TKeT0qY5xtDrexQS7XeIS
 5e6w==
X-Gm-Message-State: AOJu0YyeU4UaxHSlvsg/eZ3rABC52jqr9BU4kOgKLBNcEHnMLsHeymEv
 SBQMlh3bzQ3lIoR1y8ZSEB7Mnw==
X-Google-Smtp-Source: AGHT+IFH4ciNerKzu/cuN0MKmtbMjpurFBlXJEBKB4vTgrBOjWi4qq99haHS1KdJgLFe//4qfOe8lA==
X-Received: by 2002:adf:ebc7:0:b0:313:e2e3:d431 with SMTP id
 v7-20020adfebc7000000b00313e2e3d431mr3421368wrn.12.1691360099094; 
 Sun, 06 Aug 2023 15:14:59 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:eeca:726b:991c:1980?
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 t6-20020adfe446000000b003179b3fd837sm8610530wrm.33.2023.08.06.15.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Aug 2023 15:14:58 -0700 (PDT)
Message-ID: <889a3d25-a872-761b-4024-2dfe753330d1@smile.fr>
Date: Mon, 7 Aug 2023 00:14:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: fr
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230806220255.4099091-1-james.hilliard1@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230806220255.4099091-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1691360099; x=1691964899;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N+0vpXkKyyKz4FNIC0GJsUY4+sC219WI80K7mJH2LWY=;
 b=uSYuVpyZl79WXTJnf4jN3294zVn3eBgRQypLP3lVrxh//gOZu4GLrIj+Una1aErvf5
 8/gziTSJqhrvGiwNAMpUvM3oWRtsYTJ6irpdy7ro+Mvo06NABBcE+BTa2GIALVusyJjO
 q0ZZjyaN10o++udN6hWEL4TkLGQFySw+1w1qPuNeZM5ynqoz0ow3/1d6vk7Nx0kChAbu
 A9vnbCY9NhpOvduzsiw+UGarLIwmAc6YMi1Pp+BvzXWFTf54PLV9FM0bmNXbfudXgCLm
 RMiuUZiAaVqDE1na5ZF/jI23kN+y1FIJIV/P4JQjZ9GzBgWMOZrGHMl4+XF/TK4UpVOl
 lruA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=uSYuVpyZ
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-botocore: bump to
 version 1.31.20
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
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsIEFsbCwKCkxlIDA3LzA4LzIwMjMgw6AgMDA6MDIsIEphbWVzIEhpbGxpYXJk
IGEgw6ljcml0wqA6Cj4gV2hlbiB3ZSBidW1wZWQgdXJsbGliMyBpbiAwNzRiYzQyOTcxMTgxZWU3
MWQ4ZmY1YmQ1NzY0MWI3YjdlYjc1ODBmCj4gd2UgYnJva2UgY29tcGF0aWJpbGl0eSB3aXRoIHB5
dGhvbi1ib3RvY29yZS4KPiAKPiBUaGlzIGNvbXBhdGliaWxpdHkgZXJyb3Igd2FzIGZpeGVkIHVw
c3RyZWFtIGluIGJvdG9jb3JlIDEuMjkuMTIyOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9ib3RvL2Jv
dG9jb3JlL2NvbW1pdC8wYTZkOGUzYzYzMjVkYTM5NWEwNDIyNzU5OWNmYTI5MjE5MGQ2ODQxCj4g
Cj4gRml4ZXM6Cj4gIC0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vam9icy80NzY4NTYxNDgyCgpUZXN0UHl0aG9uUHkzQm90b2NvcmUgaXMgZml4ZWQgd2l0aCB0
aGlzIHBhdGNoIGFwcGxpZWQuClRlc3RlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJA
c21pbGUuZnI+CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFt
ZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyB2
MSAtPiB2MjoKPiAgIC0gYWRkIGZpeGVzIGluZm8KPiAtLS0KPiAgcGFja2FnZS9weXRob24tYm90
b2NvcmUvcHl0aG9uLWJvdG9jb3JlLmhhc2ggfCA0ICsrLS0KPiAgcGFja2FnZS9weXRob24tYm90
b2NvcmUvcHl0aG9uLWJvdG9jb3JlLm1rICAgfCA0ICsrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5oYXNoIGIvcGFja2FnZS9weXRob24tYm90
b2NvcmUvcHl0aG9uLWJvdG9jb3JlLmhhc2gKPiBpbmRleCA4OWY0YzA2ZGU4Li4xZjVlNWMwZDNi
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5o
YXNoCj4gKysrIGIvcGFja2FnZS9weXRob24tYm90b2NvcmUvcHl0aG9uLWJvdG9jb3JlLmhhc2gK
PiBAQCAtMSw2ICsxLDYgQEAKPiAgIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcv
cHlwaS9ib3RvY29yZS9qc29uCj4gLW1kNSAgODA1ZTYzOGMzNTNjNTMyYzJhZjdhNzUzOGQ1YmQ0
ZDYgIGJvdG9jb3JlLTEuMjkuMTE1LnRhci5nego+IC1zaGEyNTYgIDU4ZWVlOGNmOGY0ZjNlNTE1
ZGYyOWY2ZGM1MzVkZDg2ZWQzZjRjZWE0MDk5OWM1YmM3NDY0MGZmNDBiZGM3MWYgIGJvdG9jb3Jl
LTEuMjkuMTE1LnRhci5nego+ICttZDUgIGVmYWRlZjU0ZGMxOTU5ODk4YTQyZDRjYWU5NDk1NzJm
ICBib3RvY29yZS0xLjMxLjIwLnRhci5nego+ICtzaGEyNTYgIDQ4NWVmMTc1Y2QwMTFlYmM5NjVm
NDU3N2Q4Y2MwMmEyMjZjNDZiZDYwOGRkMmJiNzVjZTY5MzgzMjhjZmYwZmQgIGJvdG9jb3JlLTEu
MzEuMjAudGFyLmd6Cj4gICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gIHNo
YTI1NiAgMGQ1NDJlMGM4ODA0ZTM5YWE3ZjM3ZWIwMGRhNWE3NjIxNDlkYzY4MmQ3ODI5NDUxMjg3
ZTExYjkzOGU5NDU5NCAgTElDRU5TRS50eHQKPiAgc2hhMjU2ICBjZmM3NzQ5Yjk2ZjYzYmQzMWMz
YzQyYjVjNDcxYmY3NTY4MTQwNTNlODQ3YzEwZjNlYjAwMzQxN2JjNTIzZDMwICB0ZXN0cy91bml0
L2F1dGgvYXdzNF90ZXN0c3VpdGUvTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhv
bi1ib3RvY29yZS9weXRob24tYm90b2NvcmUubWsgYi9wYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9w
eXRob24tYm90b2NvcmUubWsKPiBpbmRleCAzZTgyOGZlZjc4Li5iNzZkMWM2NGQ3IDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5tawo+ICsrKyBi
L3BhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5tawo+IEBAIC00LDkgKzQs
OSBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1QWVRIT05fQk9UT0NP
UkVfVkVSU0lPTiA9IDEuMjkuMTE1Cj4gK1BZVEhPTl9CT1RPQ09SRV9WRVJTSU9OID0gMS4zMS4y
MAo+ICBQWVRIT05fQk9UT0NPUkVfU09VUkNFID0gYm90b2NvcmUtJChQWVRIT05fQk9UT0NPUkVf
VkVSU0lPTikudGFyLmd6Cj4gLVBZVEhPTl9CT1RPQ09SRV9TSVRFID0gaHR0cHM6Ly9maWxlcy5w
eXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzllLzAwLzQ1NjAwODFhNDMxYWFhMTRjMjI1NzA0MGQ0
M2Y1NmMyY2NiYTgxNmQ4YmNlM2I4ZTE1NzdhMTlmNDA3Ngo+ICtQWVRIT05fQk9UT0NPUkVfU0lU
RSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9mOS8wZC9lYzI0Y2I2
NmI3NjUxMjY4NDYyZDVlYjVkOWQzYzE0MGE5OWY0ODdkYjNlZDU4YTQ1NjE3OTkxYjExZTgKPiAg
UFlUSE9OX0JPVE9DT1JFX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4gIFBZVEhPTl9CT1RPQ09S
RV9MSUNFTlNFID0gQXBhY2hlLTIuMAo+ICBQWVRIT05fQk9UT0NPUkVfTElDRU5TRV9GSUxFUyA9
IExJQ0VOU0UudHh0IHRlc3RzL3VuaXQvYXV0aC9hd3M0X3Rlc3RzdWl0ZS9MSUNFTlNFCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
