Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EC2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78A696118D;
	Sat, 23 Jul 2022 15:54:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78A696118D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T3r9_f3flFYp; Sat, 23 Jul 2022 15:54:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7292460F90;
	Sat, 23 Jul 2022 15:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7292460F90
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 390421BF46A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13EAE8481E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13EAE8481E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Whes1zAlDnZy for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:54:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F31084813
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F31084813
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:54:32 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v13so2431101wru.12
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:cc:in-reply-to
 :content-transfer-encoding;
 bh=+JCufLQdfwwiJOpWbQnmZSazZfgY4nZQrLhAqd29rnU=;
 b=I5Vk97VZNlLmKad3X2XeCzZ2YUjt8RhVjJyG1GgDdsCqm/CUaN+puuLICq9SkMJKld
 c6Dg9FWFB2yi0Jmf21bfep5UzeOXhviHcFsiW6eeleF4wUOcUPBQUJxKPOxYPUJGPT27
 XitzMU+vSnagynhD6tbRnE6ucrMPUphfZiAldV0aykI6GEJX5SwIErlC3XsYmNzR12n6
 +9fqRvfq9oE3BabXe37UO2RHmXCQ3onAX205tWJvcUPmxRw+J/3kLTu9HD2vMYM1B4e8
 u7Qx9jZZXhGViGp6+RRdKFnUSL6+TioM70O9BGt1Ht/jw7MJJze3srwR6z3QUZo3VNXM
 PJDQ==
X-Gm-Message-State: AJIora/kni3Du+QPxqjcv7Youssir9+Gy2OMyS7caELt1Ipi66HK30qr
 QKBLzh0ynJO6BAo6xGkCyiUi5A==
X-Google-Smtp-Source: AGRyM1tsEybrMxR+9HT4P8wr046suAclJxjxsoHQyECkwc5MUlOi9mX+RCTUz7+thDeSd38osSSRDw==
X-Received: by 2002:a5d:430d:0:b0:210:2ce0:e2a9 with SMTP id
 h13-20020a5d430d000000b002102ce0e2a9mr3114754wrq.627.1658591670482; 
 Sat, 23 Jul 2022 08:54:30 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c4ed200b003a3199c243bsm17196267wmq.0.2022.07.23.08.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 08:54:30 -0700 (PDT)
Message-ID: <13cfe8bd-1c6e-7458-d061-b36eb08fe57e@smile.fr>
Date: Sat, 23 Jul 2022 17:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?Nuno_Gon=c3=a7alves?= <nunojpg@gmail.com>,
 buildroot@buildroot.org
References: <CAEXMXLSfJb_POn6fxsg1Gwi7odHx0yj9LWN4XQ_mc9epsi=dsg@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CAEXMXLSfJb_POn6fxsg1Gwi7odHx0yj9LWN4XQ_mc9epsi=dsg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:cc:in-reply-to:content-transfer-encoding;
 bh=+JCufLQdfwwiJOpWbQnmZSazZfgY4nZQrLhAqd29rnU=;
 b=tY6sYUFbXpXn653lveAwjEVh0txS47O8T56AELhUoNkkd9ghhNNaJu6SoMp245Nx0j
 ND0oh3jK23OUBDZIZuiYCNvgsk4Xyyo08fevWu5/bB/aclGMLSnDCI5USnQPFqDAL0QY
 kX42wb2oatCJqBo4dpA90nH1pbY4v6xOSohajkEkSyj08E9AscQ6Hg9dSXZJ8H+7vjQ8
 oc2L4IvHbuJmf5HsxSRZ6QF7adRZVRRNotDNk1KAUfCVqsEjuefILFYEvwXQT3MfybVQ
 BA8vAujrAPxDrhRyrf8zZzXGkAcQ9pix0dG+1Tlm4dNnfqUis1Bnr6KWr2S9+4S3TaLc
 +XWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=tY6sYUFb
Subject: Re: [Buildroot] [PATCH] package/gcc: don't install
 libstdc++.so.a.b.c-gdb.py
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTnVubywKCkxlIDIwLzA0LzIwMjIgw6AgMTM6MjQsIE51bm8gR29uw6dhbHZlcyBhIMOp
Y3JpdMKgOgo+IGxpYnN0ZGMrKy5zby5hLmIuYy1nZGIucHkgaXMgbm90IHJlcXVpcmVkIGFuZCBp
biBhbnkgY2FzZSBpdCBpcyBjdXJyZW50bHkKPiB1c2luZyBob3N0IHBhdGhzIGFuZCBzbyBub3Qg
ZnVuY3Rpb25hbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOdW5vIEdvbsOnYWx2ZXMgPG51bm9qcGdA
Z21haWwuY29tPgo+IC0tLQo+ICBwYWNrYWdlL2djYy9nY2MtZmluYWwvZ2NjLWZpbmFsLm1rIHwg
MSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2djYy9nY2MtZmluYWwvZ2NjLWZpbmFsLm1rCj4gYi9wYWNrYWdlL2djYy9nY2MtZmlu
YWwvZ2NjLWZpbmFsLm1rCj4gaW5kZXggYWE4ODNiZWI3Yi4uNTAxOGYzYTZjMSAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL2djYy9nY2MtZmluYWwvZ2NjLWZpbmFsLm1rCj4gKysrIGIvcGFja2FnZS9n
Y2MvZ2NjLWZpbmFsL2djYy1maW5hbC5tawo+IEBAIC0xOTksNiArMTk5LDcgQEAgZW5kZWYKPiAK
PiAgaWZlcSAoJChCUjJfU1RBVElDX0xJQlMpLCkKPiAgZGVmaW5lIEhPU1RfR0NDX0ZJTkFMX0lO
U1RBTExfU0hBUkVEX0xJQlMKPiArIHJtIC1mICQoSE9TVF9HQ0NfRklOQUxfR0NDX0xJQl9ESVIp
L2xpYnN0ZGMrKy5zbyotZ2RiLnB5IDsgXAo+ICAgZm9yIGkgaW4gJChIT1NUX0dDQ19GSU5BTF9V
U1JfTElCUykgOyBkbyBcCj4gICBjcCAtZHBmICQoSE9TVF9HQ0NfRklOQUxfR0NDX0xJQl9ESVIp
LyQke2l9LnNvKiBcCj4gICAkKFNUQUdJTkdfRElSKS91c3IvbGliLyA7IFwKCkluZGVlZCB0aGUg
bGlic3RkYysrLnNvKi1nZGIucHkgaXMgY29waWVkIGJ5IEhPU1RfR0NDX0ZJTkFMX0lOU1RBTExf
U0hBUkVEX0xJQlMKc2luY2UgaXQgbWF0Y2ggJCR7aX0uc28qLgpTbyBmYXIsIG9ubHkgbGlic3Rk
YysrIHNlZW1zIHRvIGluc3RhbGwgc3VjaCBmaWxlLgoKVGhlIGZpbGUgY29udGFpbnMgdHdvIGhh
cmRjb2RlZCBwYXRoOgoKcHl0aG9uZGlyID0gJzxmdWxsIHBhdGg+L291dHB1dC9ob3N0L3NoYXJl
L2djYy0xMi4xLjAvcHl0aG9uJwpsaWJkaXIgPSAnPGZ1bGwgcGF0aD4vb3V0cHV0L2hvc3QvYWFy
Y2g2NC1idWlsZHJvb3QtbGludXgtZ251L2xpYi8uLi9saWI2NCcKCldoaWxlIHJldmlld2luZyB5
b3VyIHBhdGNoIEkgbm90aWNlZCB3ZSBoYXZlIGEgZml4dXAgZm9yIGV4dGVybmFsIHRvb2xjaGFp
bnM6CgpodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPTA0OTEz
NWM0MDliMDgxZDM3Yjk0NTVjZDc1NjRjODU4MTMzNGUxMWIKCkl0IHNlZW1zIHdlIG5lZWQgdGhp
cyBmaXh1cCBmb3IgaW50ZXJuYWwgdG9vbGNoYWluIHRvby4KCkJlc3QgcmVnYXJkcywKUm9tYWlu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
