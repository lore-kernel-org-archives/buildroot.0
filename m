Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1F1C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 19:54:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C66D60EE1
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 19:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C66D60EE1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA90960723;
	Wed,  8 Sep 2021 19:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kvaitbu7z5uf; Wed,  8 Sep 2021 19:54:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F9C1605D1;
	Wed,  8 Sep 2021 19:54:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CEC71BF397
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 19:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B55D40265
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 19:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ieVYUOwzFWxs for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 19:54:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA80A40264
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 19:54:49 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id e26so2618171wmk.2
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 12:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XeeKiTXvXuiJemsKAvjdYi3Ow8uZUbDSE126fokd+QU=;
 b=eRk0s3uZKGlBDRhO2Ck1WxAIzJf3a5UVUGe/aLJ2f8wAVuO0jb4WW4GCE6iOA+4smT
 bM7XXYc4XAmqYpub1N35U91j23352PpiSp63q17WXceUm7qy4jhOGjRP/u1dJoX1HbeL
 IEOSK3L2TuaZLvgT1EsVrN7d6B0XVIXopxKVNKJ7NEJoxEzic2Bs/CEp3WB6aQtTn78b
 wAVvnAhcvS2WW6jyIh+UaiuJOAoHTYGzJyDCJfdxLqKH8b6znj1PT8zlR3pDJSw14vPS
 235FLlkOctaGyJuWxHOUKBoKh7xSJbeizj9LqWiFTEop9UXfV9XJNeukVVN9snzrlMYk
 kYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XeeKiTXvXuiJemsKAvjdYi3Ow8uZUbDSE126fokd+QU=;
 b=Ai/QW7plb7ODmYSbicC1LHzqZ1qYSpFS8I0tBxVYxohX1FL0uBVpjLiL7TPATszWEv
 RTzzW9NgGn1yyOlwCoRR9BScBQLoaNV2IlM2QENCGvagiV1tMOOHm+GY+xwvnQlMUubP
 aUGM68QxFlUHT+6JG2OLr0UfvJl65gGwuaPQ9w0aRbtSV00kb3io2Db4udzOWKWWaB9e
 1l/j0cQQYgrUAqBRuOeDKiOgjEQMfBTZlmZqL3TqQCW45Gndg8DwpUm05suxpgWB8gCi
 hXOGKplY082zwvaMq6xEN1cGBT7/2Aq2N4tHt40pnRCI1denf3S0xIWHmJMenELOh1PL
 4M2g==
X-Gm-Message-State: AOAM533A1bxJQOKMnQJchVl8aLkJG6i8BV7NmXF33zyoSTkrkkliE9cx
 bzYWveeDRKLh84NYHL3XxvI=
X-Google-Smtp-Source: ABdhPJzWZE2LMwNXokoWFEY8QEEoHQPxyBoK5Lee4IBXEbXqCNlvs5o/hABpDSXblsX1RqcIEx8qtQ==
X-Received: by 2002:a7b:c751:: with SMTP id w17mr41475wmk.162.1631130887913;
 Wed, 08 Sep 2021 12:54:47 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce?
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id n5sm2806806wmd.29.2021.09.08.12.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 12:54:47 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20210905173446.44137-1-yann.morin.1998@free.fr>
 <20210905174402.GV1053080@scaer>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <b8b5e5f2-5549-777d-1d94-c93fd21e9d4b@gmail.com>
Date: Wed, 8 Sep 2021 21:54:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210905174402.GV1053080@scaer>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH] package/e2fsprogs: bump version to fix
 regression
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Kevin Tomary <kevin.tomary@hotmail.com>, Leon de Rooij <leon@exquisip.nl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGVsbG8gWWFubiwgQWxsLAoKTGUgMDUvMDkvMjAyMSDDoCAxOTo0NCwgWWFubiBFLiBNT1JJTiBh
IMOpY3JpdMKgOgo+IEFsbCwKPiAKPiBPbiAyMDIxLTA5LTA1IDE5OjM0ICswMjAwLCBZYW5uIEUu
IE1PUklOIHNwYWtlIHRodXNseToKPj4gVmVyc2lvbiAxLjQ2LjMgaGFkIGEgcmVncmVzc2lvbiwg
d2hpY2ggbWVhbnQgdGhlIGZpbGUgdGhhdCB3b3VsZCBzdG9yZQo+PiB0aGUgZmlsZXN5c3RlbSBp
bWFnZSBoYWQgdG8gcHJlLWV4aXN0LCBvciBta2ZzLmV4dDIgd291bGQgZmFpbCB0bwo+PiBnZW5l
cmF0ZSB0aGUgZmlsZXN5c3RlbToKPj4KPj4gICAgIG1rZnMuZXh0NDogTm8gc3VjaCBmaWxlIG9y
IGRpcmVjdG9yeSB3aGlsZSB0cnlpbmcgdG8gZGV0ZXJtaW5lCj4+ICAgICBmaWxlc3lzdGVtIHNp
emUKPj4KPj4gVGhlIHJlZ3Jlc3Npb24gd2FzIGZpeGVkIHVwc3RyZWFtLCBhbmQgaXMgbm93IHBh
cnQgb2YgdGhlIDEuNDYuNAo+PiByZWxlYXNlLCBzbyBidW1wIHRvIHRoYXQgcmVsZWFzZS4KPj4K
Pj4gRml4ZXM6ICMxNDE5Ngo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5u
Lm1vcmluLjE5OThAZnJlZS5mcj4KPj4gUmVwb3J0ZWQtYnk6IEtldmluIFRvbWFyeSA8a2V2aW4u
dG9tYXJ5QGhvdG1haWwuY29tPgo+PiBSZXBvcnRlZC1ieTogTGVvbiBkZSBSb29paiA8bGVvbkBl
eHF1aXNpcC5ubD4KClRoZXJlIGlzIGFub3RoZXIgcmVncmVzc2lvbiB3aXRoIGUyZnNwcm9nIDEu
NDYuNDoKCmh0dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1OTMvYnVpbGRyb290Ly0vam9icy8xNTY4Njcy
OTQwCgpXaXRoIHRoZSBmaXggYmFja3BvcnRlZCB0byAxLjQ2LjMgdGhlIGV4dDQgdGVzdCBpcyBv
ay4KCmh0dHBzOi8vZ2l0aHViLmNvbS90eXRzby9lMmZzcHJvZ3MvY29tbWl0LzUzNDY0NjU0YmQz
M2U1OGUzZmZmMDc5ZjM0MjYxYjgyM2Q4MzlmM2IKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPj4K
Pj4gLS0tCj4+IEZvciB0aGUgc3RhYmxlIGJyYW5jaCAyMDIxLjA4LngsIEknbGwgc2VuZCBhIGRp
ZmZlcmVudCBwYXRjaCwgdGhhdCBqdXN0Cj4+IGJhY2twb3J0cyB0aGUgdXBzdHJlYW0gZml4Lgo+
IAo+IEluIGZhY3QsIDIwMjEuMDggc3RpbGwgaGFzIGUyZnNwcm9ncyAxLjQ2LjIsIHdoaWNoIGlz
IG5vdCBhZmZlY3RlZDsgc28sCj4gbm8gYmFja3BvcnRzIG5lZWRlZC4KPiAKPiBSZWdhcmRzLAo+
IFlhbm4gRS4gTU9SSU4uCj4gCj4+IC0tLQo+PiAgcGFja2FnZS9lMmZzcHJvZ3MvZTJmc3Byb2dz
Lmhhc2ggfCAyICstCj4+ICBwYWNrYWdlL2UyZnNwcm9ncy9lMmZzcHJvZ3MubWsgICB8IDIgKy0K
Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9lMmZzcHJvZ3MvZTJmc3Byb2dzLmhhc2ggYi9wYWNrYWdl
L2UyZnNwcm9ncy9lMmZzcHJvZ3MuaGFzaAo+PiBpbmRleCAzNjYxODAxMTk5Li42M2M3Yzk5Mjlm
IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL2UyZnNwcm9ncy9lMmZzcHJvZ3MuaGFzaAo+PiArKysg
Yi9wYWNrYWdlL2UyZnNwcm9ncy9lMmZzcHJvZ3MuaGFzaAo+PiBAQCAtMSw1ICsxLDUgQEAKPj4g
ICMgRnJvbSBodHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi9saW51eC9rZXJuZWwv
cGVvcGxlL3R5dHNvL2UyZnNwcm9ncy92MS40Ni4zL3NoYTI1NnN1bXMuYXNjCj4+IC1zaGEyNTYg
IDg2ZDE1ODBmYWNkZDQ5ZjJlMGU2YjAyN2UyNmIxZTZjNDhhZjUzODc2MmRjNDBhZWVkMmE4NzE1
M2MxZjExYjcgIGUyZnNwcm9ncy0xLjQ2LjMudGFyLnh6Cj4+ICtzaGEyNTYgIGIxMTA0MjUzM2Mx
YjFkY2YxNzUxMmYwZGE0OGUwNWIwYzU3M2RhZGExZGQ4Yjc2Mjg2NGQxMGY0ZGMzOTk3MTMgIGUy
ZnNwcm9ncy0xLjQ2LjQudGFyLnh6Cj4+ICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+PiAgc2hhMjU2
ICA1ZGE1ZWYxNTNlNTU5YzFkOTkwZDRjM2VlZGJlZGQ0NDQyZGI4OTJkMzdlYWUxZjM1ZmZmMDY5
ZGU4ZWM5MDIwICBOT1RJQ0UKPj4gIHNoYTI1NiAgMDMyOTg5YjUwOGYxYTcyZWJlZTViMzQxN2U1
NWQwNmQ0NzNmOWVlMjAzZTQ1YWIxMTg2NGE3ZTQ5Y2RlYzYzZCAgbGliL3NzL21pdC1zaXBiLWNv
cHlyaWdodC5oCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2UyZnNwcm9ncy9lMmZzcHJvZ3MubWsg
Yi9wYWNrYWdlL2UyZnNwcm9ncy9lMmZzcHJvZ3MubWsKPj4gaW5kZXggNTUyOGVjYmMzNC4uY2E4
OTEwNjZhMiAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9lMmZzcHJvZ3MvZTJmc3Byb2dzLm1rCj4+
ICsrKyBiL3BhY2thZ2UvZTJmc3Byb2dzL2UyZnNwcm9ncy5tawo+PiBAQCAtNCw3ICs0LDcgQEAK
Pj4gICMKPj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+ICAKPj4gLUUyRlNQUk9HU19WRVJT
SU9OID0gMS40Ni4zCj4+ICtFMkZTUFJPR1NfVkVSU0lPTiA9IDEuNDYuNAo+PiAgRTJGU1BST0dT
X1NPVVJDRSA9IGUyZnNwcm9ncy0kKEUyRlNQUk9HU19WRVJTSU9OKS50YXIueHoKPj4gIEUyRlNQ
Uk9HU19TSVRFID0gJChCUjJfS0VSTkVMX01JUlJPUikvbGludXgva2VybmVsL3Blb3BsZS90eXRz
by9lMmZzcHJvZ3MvdiQoRTJGU1BST0dTX1ZFUlNJT04pCj4+ICBFMkZTUFJPR1NfTElDRU5TRSA9
IEdQTC0yLjAsIE1JVC1saWtlIHdpdGggYWR2ZXJ0aXNpbmcgY2xhdXNlIChsaWJzcyBhbmQgbGli
ZXQpCj4+IC0tIAo+PiAyLjI1LjEKPj4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3Rz
LmJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
