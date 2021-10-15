Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B79C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 19:51:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68F14611C1
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 19:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68F14611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F042400DE;
	Fri, 15 Oct 2021 19:51:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GWcOHBb0ajcr; Fri, 15 Oct 2021 19:51:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 427214011F;
	Fri, 15 Oct 2021 19:51:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E47E1BF41F
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 19:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C5CF82D7C
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 19:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6rmVcPFvz9Zk for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 19:51:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C6CF82A72
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 19:51:05 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so3142526wmz.2
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 12:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iE4eVfIAMVi7i+OhLiLcn5Yi6+uzLf+fDUWx7+yBZCg=;
 b=Ki3mQrHkM2oVagGunEnN3bODyZPd8BsOdKh4LfIlhSAF0cApT9YULvqifwbPsqTkU1
 m0mLzTinAVPHRrpaJhxT6tCGX7vx/R4X+gL9V1AAdTiCkzmWhJ6QUywkCozRKnTLBw+3
 YtOycPhw+Xwkxv4R4mSrVDL2gh5y+yhM+vyNvADtwM6QM7p65wr/YS54S10F36t2TH+r
 pvAPIrz+jWFi+XVnTTryWV3LuowcngnLlA3VP8kIoJS329Krxy/RpsyReCMTjvoumpGn
 nNqE2VIwq/3v+7QPCjvi9KflL/y4CdjlF0o96T9eSMGxbOHf4K0g8pQe8Pa3yyprcqt1
 eNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iE4eVfIAMVi7i+OhLiLcn5Yi6+uzLf+fDUWx7+yBZCg=;
 b=Pg3bV5atqKjj7sqslv1ki+7P+V4DojBysyNW3T9KPqqHLeUKHXpy4hyHf14DP8Az3j
 PXpEg8CahEYX9xQVRjjGuXD8VzZSFN7WM2DLQj1jZq2iV0bv56tPpXIPQovJMkDCft7K
 QqO+icS0tq1dUdqrgNzPsv4h9QufOYyn0gZyLajFUK1VD5JIyjyXCOeYxjf4PZjlewHB
 ryzdz7wb7CnuDevrBrn21jHzkfLFMjnVx5/mCRcRdnKgRto79hFdu2BAY8Rk9jSNv6IV
 sEMnQHxwcFGfBeYRiswtOIOoxotT0AayViBRzhJfDl7AiH7RykrD5MhUSpko6LpN3+pb
 TdUg==
X-Gm-Message-State: AOAM533HYE7xDQ3fEefODv0fnIhqqh7AhhDWRSGYkqSbtxG+BJPkjTiK
 rfqPF/perfwS7sM0OOtDLCI=
X-Google-Smtp-Source: ABdhPJziocGeqkbCQ+IGVp9rVlL+8m1AAclYu8HLx2ZZdyuftAPaY3v6u907feBv+vLtMYvTi2MufA==
X-Received: by 2002:a7b:c393:: with SMTP id s19mr14843728wmj.13.1634327463553; 
 Fri, 15 Oct 2021 12:51:03 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id v13sm5901187wrs.53.2021.10.15.12.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 12:51:03 -0700 (PDT)
Message-ID: <dcd5309e-d65a-f348-c3d4-b7bc6e91beb9@gmail.com>
Date: Fri, 15 Oct 2021 21:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211003124027.343390-1-romain.naour@gmail.com>
 <20211003162237.7949d437@windsurf>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20211003162237.7949d437@windsurf>
Subject: Re: [Buildroot] [PATCH 1/5] configs: remove qemu_csky defconfigs
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
Cc: Guo Ren <ren_guo@c-sky.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAwMy8xMC8yMDIxIMOgIDE2OjIyLCBUaG9tYXMgUGV0YXp6
b25pIGEgw6ljcml0wqA6Cj4gSGVsbG8gUm9tYWluLAo+IAo+IE9uIFN1biwgIDMgT2N0IDIwMjEg
MTQ6NDA6MjMgKzAyMDAKPiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+IHdy
b3RlOgo+IAo+PiBXZSBhcmUgZ29pbmcgdG8gcmVtb3ZlIHRoZSBnY2MgZm9yayBmb3IgY3NreSBz
aW5jZSBpdCBkb2Vzbid0IGJ1aWxkCj4+IHdpdGggdGhlIGxhdGVzdCBjb21waWxlcnMgKGdjYyA4
LCAxMCwgMTEgdGVzdGVkKSBbMV0uCj4+Cj4+IFJlbW92aW5nIHRoZXNlcyBkZWZjb25maWdzIGFu
ZCB0aGUgY3NreSBnY2MgZm9yayBoYXMgYmVjb21lIHVuYXZvaWRhYmxlCj4+IHNpbmNlIHRoZSBC
dWlsZHJvb3QgRG9ja2VyIGltYWdlIHVzZWQgYnkgdGhlIGdpdGxhYiBDSSB3aWxsIHN3aXRjaCBz
b29uCj4+IHRvIERlYmlhbiBidWxsc2V5ZSBzb29uIFsyXS4KPj4KPj4gVGhlIGNrc3kgZ2NjIGZv
cmsgYmFzZWQgb24gZ2NjIDYgaGFzIG5vdCBiZWVuIHVwZGF0ZWQgc2luY2UgaXQgaGFzIGJlZW4K
Pj4gYWRkZWQgdG8gQnVpbGRyb290IFszXS4gU2luY2UgdGhlbiwgY3NreSBoYXMgYmVlbiBhZGRl
ZCB0byBiaW51dGlscyBhbmQKPj4gZ2NjIGJ1dCB1c2luZyB0aGUgbGF0ZXN0IHVwc3RyZWFtIHZl
cnNpb24gKGJpbnV0aWxzIDIuMzcgYW5kIGdjYyAxMSkgaXMKPj4gbm90IHlldCBwb3NzaWJsZSBk
dWUgdG8gYnVpbGQgaXNzdWUgd2l0aCBnbGliYyAyLjM0IFs0XS4KPj4KPj4gTW9yZW92ZXIsIHFl
bXVfY3NreSBkZWZjb25maWdzIHdhcyB0byBiZSB1c2VkIHdpdGggdGhlIGNza3kgcWVtdSBmb3Jr
Cj4+IChiYXNlZCBvbiBRZW11IDMueCkgYWRkZWQgYnkgY29tbWl0IFs1XSBhbmQgcmVtb3ZlZCBi
eSBjb21taXQgWzZdLgo+PiBTaW5jZSB0aGVuIGl0J3Mgbm90IHBvc3NpYmxlIHRvIGRvIGEgcnVu
dGltZSB0ZXN0IHdpdGggdGhlc2VzCj4+IGRlZmNvbmZpZ3MuCj4+Cj4+IFRoZXNlcyBkZWZjb25m
aWdzIGNhbiBiZSBhZGRlZCBiYWNrIGxhdGVyIGlmIHRoZSBjc2t5IHRvb2xjaGFpbiBzdXBwb3J0
Cj4+IGlzIGZpeGVkIGFuZCBjc2t5IHN1cHBvcnRlZCBieSB1cHN0cmVhbSBRZW11Lgo+Pgo+PiBb
MV0gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMS1BdWd1
c3QvNjIxNTA0Lmh0bWwKPj4gWzJdIDcxYjgzMjI3MTI4YmU2MmMxNjkzMTNlODViYjhmMzM5Zjk3
N2FkNjcKPj4gWzNdIDc4NzNhNWJkNWViYmViMTY3NDI5M2RhZTZiMDZiNTBmMGExZjIxODQKPj4g
WzRdIGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIwMjEtT2N0
b2Jlci82MjQ1OTYuaHRtbAo+PiBbNV0gZjgxNmU1YjI3NmYxZWYxNTg0MGJlYzY2NjdmMWU4MjE5
NzE3YWI3ZAo+PiBbNl0gNThhZjlhNzBjYzBmMTk1MTE2ZGVkYjNmZDBlMmNhNWI0ZmVjOWU3MAo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+
Cj4+IENjOiBHdW8gUmVuIDxyZW5fZ3VvQGMtc2t5LmNvbT4KPj4gQ2M6IFRob21hcyBQZXRhenpv
bmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gCj4gSSBhZ3JlZSB3aXRoIHRoZSBw
YXRjaCBzZXJpZXMuIFdoYXQgSSBwcm9wb3NlIGlzIHRvIHdhaXQgbWF5YmUgNC01IGRheXMKPiB0
byBzZWUgaWYgdGhlcmUgaXMgYSByZWFjdGlvbiBvciBzb21lIGZlZWRiYWNrIGZyb20gR3VvIFJl
bi4gQW5kIGlmCj4gdGhlcmUncyBubyBmZWVkYmFjaywgd2UgYXBwbHkgaW4gNC01IGRheXMuCgpJ
IGhhZCBhIHJlcGx5IGZyb20gR3VvLCB3ZSBjYW4gbW92ZSBmb3J3YXJkIGFuZCBtZXJnZSB0aGlz
IHNlcmllczoKCmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIw
MjEtT2N0b2Jlci82MjQ4NjYuaHRtbAoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gQmVzdCBy
ZWdhcmRzLAo+IAo+IFRob21hcwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
