Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B2EC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52D454031F;
	Wed,  1 May 2024 20:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7LMd6Ol0roe; Wed,  1 May 2024 20:28:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 226B1405E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 226B1405E9;
	Wed,  1 May 2024 20:28:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDD9A1BF3D6
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7187401BB
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_VwF8a7acOn for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:28:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF0A5401BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF0A5401BA
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF0A5401BA
 for <buildroot@buildroot.org>; Wed,  1 May 2024 20:28:41 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41b79450f8cso45855615e9.3
 for <buildroot@buildroot.org>; Wed, 01 May 2024 13:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714595320; x=1715200120;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X35plsQEq5kAyy+FoVUmC1AA9eO4E0NJJpeGGA4uJ+k=;
 b=LbqBuNp39VVdYtf1UgfvCcn8DioBzwjzgx/xc9GNcGvpUCFwvStd1a8zNxzV9SZ+jc
 wLuaTjifDMdf6qFb7ZUkArAoas2dCUUUm05z6p1KFZ33aHO3XvSTSUs8XDQPfUNNyMmE
 gm4+YGOzsXkWK9eLOtyCGWBLGIxxqrfi27v8EFLtwuOYdvesJfNLOV2Fv6JeDDnMlKY5
 Zdp4BvtITzUAF8ZOuKWP9IpO75EWYJfDz/gVFHU6shTSd5OC1jUONZ+I45RRaz3bd6xj
 tPwuRkZRJEc/dkU/jp8Cp1ML+OicurjwO+tJmiTfKh3EaId0cZTXqxJ3iXnOtj9OY3QN
 JYCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+3+wKk8wcd5+f/o0jbRo8GdsnQN9AsMWhgkmwzWY/QrP4j1f6aTyA6aQHtAQV9m/2RmRDI5npJgNL9Tb3c8kodpmKjH/6Ng==
X-Gm-Message-State: AOJu0YxYmuRm56NjCR4sW+RNjz+10OgsKkCmCnBJJGl7Gv/TpOVovK1X
 FW5xZ2e8jrSCZoThujYriioqK8rE1lhgPzFDkXHBk6Ljvk0sFffP7xFZ83gsNoA=
X-Google-Smtp-Source: AGHT+IGMAc9jrwY2aDjpR+6HXcjWd77vTDl1F0WMzeoVtWFth5uZvpa/POu+jb5VplPq+T5FyzOIew==
X-Received: by 2002:a05:600c:35c5:b0:41a:7ab1:fd98 with SMTP id
 r5-20020a05600c35c500b0041a7ab1fd98mr2411370wmq.21.1714595319770; 
 Wed, 01 May 2024 13:28:39 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a1c4c06000000b00418db9e4228sm3200351wmf.29.2024.05.01.13.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 13:28:39 -0700 (PDT)
Message-ID: <d5f383b8-751a-4824-964d-fbc81780135b@smile.fr>
Date: Wed, 1 May 2024 22:28:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240501120050.670109-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240501120050.670109-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714595320; x=1715200120;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X35plsQEq5kAyy+FoVUmC1AA9eO4E0NJJpeGGA4uJ+k=;
 b=WRUC/XDKKd7KUNnnDNlqI6zsf+jWK2F4LSVxSSB6DEiNs8FQTq8RYm0Cjk0A5wKOGN
 JRlmXMq9HTygGW/OiXtXmQNmoiwmC2A+RupVus5nwokPlB6NQxmEhppaltNV2Gf2Ys09
 XKWhUvrW9DdDmfaFc2kQ04W5k9IRKbA1uIwP81rkTJHEjkY+8t5i0tOElwm8stxqFhh1
 CYsft9awfw9Rxg1E7MBE9wx49/NHYHTyU8l1/1x+076g/Q3HwB+zVI5oqJO442QzaHrO
 86M55ZhQzVQy3yJuZZUw3hYrHFYDxB8euuLtwv1+a7JXeoxDESjyaQ6NhGsdrOuWG9nH
 Kwnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=WRUC/XDK
Subject: Re: [Buildroot] [PATCH 1/2] package/qemu: fix disabling fp-bench
 test compilation
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
Cc: Romain Naour <romain.naour@gmail.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sIEFsbCwKCkxlIDAxLzA1LzIwMjQgw6AgMTQ6MDAsIERhcmlvIEJpbmFjY2hp
IGEgw6ljcml0wqA6Cj4gV2l0aCB0aGUgYnVtcCB0byB2ZXJzaW9uIDguMS4xLCB0aGUgcGF0Y2gg
dGhhdCBkaXNhYmxlZCB0aGUgY29tcGlsYXRpb24KPiBvZiB0aGUgZnAtYmVuY2ggdGVzdCBpcyBu
byBsb25nZXIgYXBwbGljYWJsZSwgZXZlbiB0aG91Z2ggdGhlIHBhY2thZ2UKPiBjb21waWxhdGlv
biBwcm9jZXNzIGRvZXMgbm90IHJlcG9ydCBhbnkgZXJyb3JzIGluIGFwcGx5aW5nIHRoZSBwYXRj
aAo+IGl0c2VsZi4gVGhlIG5ldyBwYXRjaCBkb2VzIG5vdCBkaXNhYmxlIHRoZSB0ZXN0IGJ5IGRl
ZmF1bHQgYnV0IG9ubHkgaWYKPiB0aGUgZmlsZSBmZW52LmggaXMgbm90IG1pc3NpbmcsIHdpdGgg
dGhlIGhvcGUgdGhhdCB0aGlzIGFwcHJvYWNoIHdpbGwgYmUKPiBjb25zaWRlcmVkIGFjY2VwdGFi
bGUgYnkgdGhlIG1haW50YWluZXIgYW5kIG1lcmdlZCB1cHN0cmVhbS4KPiAKPiBUaGUgcGF0Y2gg
aXMgYW4gYWRhcHRhdGlvbiBvZiB0aGUgb25lIHNlbnQgdXBzdHJlYW0uCgpUaGFua3MgZm9yIHNl
bmRpbmcgaXQgdXBzdHJlYW0uCgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxk
YXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAtLS0KPiAgLmNoZWNrcGFja2Fn
ZWlnbm9yZSAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgLi4uZnAtZGlzYWJs
ZS1mcC1iZW5jaC1idWlsZC1ieS1kZWZhdWx0LnBhdGNoIHwgMjggLS0tLS0tLS0tLS0KPiAgLi4u
b24tdC1idWlsZC1mcC1iZW5jaC10ZXN0LWlmLWZlbnYuaC1pLnBhdGNoIHwgNDkgKysrKysrKysr
KysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDI5IGRlbGV0
aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9xZW11LzAwMDEtdGVzdHMtZnAt
ZGlzYWJsZS1mcC1iZW5jaC1idWlsZC1ieS1kZWZhdWx0LnBhdGNoCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL3FlbXUvMDAwMS10ZXN0cy1mcC1tZXNvbi1kb24tdC1idWlsZC1mcC1iZW5j
aC10ZXN0LWlmLWZlbnYuaC1pLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhLy5jaGVja3BhY2thZ2Vp
Z25vcmUgYi8uY2hlY2twYWNrYWdlaWdub3JlCj4gaW5kZXggMWIzMzZjZTdhM2VlLi5jMTZlMTdj
YzM1ZTQgMTAwNjQ0Cj4gLS0tIGEvLmNoZWNrcGFja2FnZWlnbm9yZQo+ICsrKyBiLy5jaGVja3Bh
Y2thZ2VpZ25vcmUKPiBAQCAtMTA3Myw3ICsxMDczLDcgQEAgcGFja2FnZS9weXRob24zLzAwMjgt
Zml4LWJ1aWxkaW5nLW9uLW9sZGVyLWRpc3RyaWJ1dGlvbnMucGF0Y2ggbGliX3BhdGNoLlVwc3Ry
ZWEKPiAgcGFja2FnZS9weXRob24zLzAwMjktY29uZmlndXJlLmFjLWZpeHVwLUNDLXByaW50LW11
bHRpYXJjaC1vdXRwdXQtZm9yLW11cy5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiAgcGFja2Fn
ZS9weXRob24zLzAwMzAtQWRkLWFuLW9wdGlvbi10by1kaXNhYmxlLXRoZS1iZXJrZWxleWRiLW1v
ZHVsZS5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiAgcGFja2FnZS9weXRob24zLzAwMzEtbGli
LWNyeXB0LXVDbGliYy1uZy1kb2Vzbi10LXNldC1lcnJuby13aGVuLWVuY3J5cHRpby5wYXRjaCBs
aWJfcGF0Y2guVXBzdHJlYW0KPiAtcGFja2FnZS9xZW11LzAwMDEtdGVzdHMtZnAtZGlzYWJsZS1m
cC1iZW5jaC1idWlsZC1ieS1kZWZhdWx0LnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ICtwYWNr
YWdlL3FlbXUvMDAwMS10ZXN0cy1mcC1tZXNvbi1kb24tdC1idWlsZC1mcC1iZW5jaC10ZXN0LWlm
LWZlbnYuaC1pLnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQoKV2Ugd2FudCB0byByZW1vdmUgLmNo
ZWNrcGFja2FnZWlnbm9yZSBmaWxlLgpBbGwgcGF0Y2hlcyBsaXN0ZWQgaGVyZSBhcmUgbm90IHll
dCB1c2luZyAiVXBzdHJlYW06IiB0YWcuCgpTZWU6Cmh0dHBzOi8vbmlnaHRseS5idWlsZHJvb3Qu
b3JnL21hbnVhbC5odG1sI19hZGRpdGlvbmFsX3BhdGNoX2RvY3VtZW50YXRpb24KCj4gIHBhY2th
Z2UvcWVtdS8wMDAyLXNvZnRtbXUtcWVtdS1zZWNjb21wLmMtYWRkLW1pc3NpbmctaGVhZGVyLWZv
ci1DTE9ORV8ucGF0Y2ggbGliX3BhdGNoLlVwc3RyZWFtCj4gIHBhY2thZ2UvcWV4dHNlcmlhbHBv
cnQvMDAwMS1DcmVhdGUtYS1tYWluLWluY2x1ZGUtZmlsZS1RRXh0U2VyaWFsUG9ydC5wYXRjaCBs
aWJfcGF0Y2guVXBzdHJlYW0KPiAgcGFja2FnZS9xZXh0c2VyaWFscG9ydC8wMDAyLVRlbGwtcW1h
a2UtdG8tYWRkLWEtcGtnY29uZmlnLWZpbGUtdG8tZWFzZS11c2FnZS13aXQucGF0Y2ggbGliX3Bh
dGNoLlVwc3RyZWFtCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcWVtdS8wMDAxLXRlc3RzLWZwLWRp
c2FibGUtZnAtYmVuY2gtYnVpbGQtYnktZGVmYXVsdC5wYXRjaCBiL3BhY2thZ2UvcWVtdS8wMDAx
LXRlc3RzLWZwLWRpc2FibGUtZnAtYmVuY2gtYnVpbGQtYnktZGVmYXVsdC5wYXRjaAo+IGRlbGV0
ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IGZiN2E5YTY5ODk3Yi4uMDAwMDAwMDAwMDAwCj4g
LS0tIGEvcGFja2FnZS9xZW11LzAwMDEtdGVzdHMtZnAtZGlzYWJsZS1mcC1iZW5jaC1idWlsZC1i
eS1kZWZhdWx0LnBhdGNoCj4gKysrIC9kZXYvbnVsbAo+IEBAIC0xLDI4ICswLDAgQEAKPiAtRnJv
bSA4M2Q5NzZkNmQ3ZjAzNTc2NTlkNWRhYTBmMDFjNTIwNDhhNjA5ZTg4IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQo+IC1Gcm9tOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+
Cj4gLURhdGU6IFdlZCwgMjUgQXVnIDIwMjEgMjE6NTU6NTMgKzAyMDAKPiAtU3ViamVjdDogW1BB
VENIXSB0ZXN0cy9mcDogZGlzYWJsZSBmcC1iZW5jaCBidWlsZCBieSBkZWZhdWx0Cj4gLQo+IC1G
aXhlczoKPiAtaHR0cHM6Ly9saXN0cy5ub25nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVs
LzIwMjEtMDMvbXNnMDA5NDcuaHRtbAo+IC0KPiAtU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3Vy
IDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+IC0tLS0KPiAtIHRlc3RzL2ZwL21lc29uLmJ1aWxk
IHwgMSArCj4gLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAtCj4gLWRpZmYgLS1n
aXQgYS90ZXN0cy9mcC9tZXNvbi5idWlsZCBiL3Rlc3RzL2ZwL21lc29uLmJ1aWxkCj4gLWluZGV4
IDhiZDA5NzlmNjcuLjJmZTAxOWQyYzYgMTAwNjQ0Cj4gLS0tLSBhL3Rlc3RzL2ZwL21lc29uLmJ1
aWxkCj4gLSsrKyBiL3Rlc3RzL2ZwL21lc29uLmJ1aWxkCj4gLUBAIC02NDAsNiArNjQwLDcgQEAg
ZnBiZW5jaCA9IGV4ZWN1dGFibGUoCj4gLSAgIGRlcGVuZGVuY2llczogW3FlbXV1dGlsXSwKPiAt
ICAgaW5jbHVkZV9kaXJlY3RvcmllczogW3NmaW5jLCBpbmNsdWRlX2RpcmVjdG9yaWVzKHRmZGly
KV0sCj4gLSAgIGNfYXJnczogZnBjZmxhZ3MsCj4gLSsgIGJ1aWxkX2J5X2RlZmF1bHQ6IGZhbHNl
LAo+IC0gKQo+IC0gCj4gLSBmcHRlc3Rsb2cyID0gZXhlY3V0YWJsZSgKPiAtLS0gCj4gLTIuMzUu
MQo+IC0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11LzAwMDEtdGVzdHMtZnAtbWVzb24tZG9u
LXQtYnVpbGQtZnAtYmVuY2gtdGVzdC1pZi1mZW52LmgtaS5wYXRjaCBiL3BhY2thZ2UvcWVtdS8w
MDAxLXRlc3RzLWZwLW1lc29uLWRvbi10LWJ1aWxkLWZwLWJlbmNoLXRlc3QtaWYtZmVudi5oLWku
cGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uODM2NzU0
YmEyMzFhCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcWVtdS8wMDAxLXRlc3RzLWZw
LW1lc29uLWRvbi10LWJ1aWxkLWZwLWJlbmNoLXRlc3QtaWYtZmVudi5oLWkucGF0Y2gKPiBAQCAt
MCwwICsxLDQ5IEBACj4gK0Zyb20gYjRhNjkyZjQ2MTM1YWYxMDExYmYwYWRiZmViMTlhYmYzNTRj
YTE5MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogRGFyaW8gQmluYWNjaGkgPGRh
cmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ICtEYXRlOiBUdWUsIDMwIEFwciAy
MDI0IDA5OjQwOjU1ICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gdGVzdHMvZnAvbWVzb246IGRv
bid0IGJ1aWxkIGZwLWJlbmNoIHRlc3QgaWYgZmVudi5oIGlzCj4gKyBtaXNzaW5nCj4gKwo+ICtU
aGUgZnAtYmVuY2ggdGVzdCAoaS4gZS4gdGVzdHMvZnAvZnAtYmVuY2guYykgdXNlIGZlbnYuaCB0
aGF0IGlzIG5vdAo+ICthbHdheXMgcHJvdmlkZWQgYnkgdGhlIGxpYmMgKHVDbGliYykuIFRoZSBw
YXRjaCBkaXNhYmxlcyBpdHMgY29tcGlsYXRpb24KPiAraW4gY2FzZSB0aGUgaGVhZGVyIGlzIG5v
dCBhdmFpbGFibGUuCj4gKwo+ICtUaGUgcGF0Y2ggaXMgYmFzZWQgb24gYSBzdWdnZXN0aW9uIGZy
b20gUGFvbG8gQm9uemluaSwgd2hpY2ggeW91IGNhbgo+ICtmaW5kIGF0IHRoZSBmb2xsb3dpbmcg
bGluay4KPiArCj4gK0xpbms6IGh0dHBzOi8vbGlzdHMubm9uZ251Lm9yZy9hcmNoaXZlL2h0bWwv
cWVtdS1kZXZlbC8yMDIxLTAzL21zZzAwNDkyLmh0bWwKPiArU3VnZ2VzdGVkLWJ5OiBQYW9sbyBC
b256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgo+ICtTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5h
Y2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gK1tVcHN0cmVhbSBz
dGF0dXM6IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9xZW11LWRldmVsL3Bh
dGNoLzIwMjQwNDMwMTY0NzUyLjY0NTUyMS0xLWRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlv
bnMuY29tL10KClBsZWFzZSwgdXNlICJVcHN0cmVhbToiIHRhZyBpbnN0ZWFkICh3aXRob3V0IFsu
Li5dKQoKVXBzdHJlYW06Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9xZW11
LWRldmVsL3BhdGNoLzIwMjQwNDMwMTY0NzUyLjY0NTUyMS0xLWRhcmlvLmJpbmFjY2hpQGFtYXJ1
bGFzb2x1dGlvbnMuY29tLwoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+ICstLS0KPiArIHRlc3Rz
L2ZwL21lc29uLmJ1aWxkIHwgMTQgKysrKysrKystLS0tLS0KPiArIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvdGVzdHMv
ZnAvbWVzb24uYnVpbGQgYi90ZXN0cy9mcC9tZXNvbi5idWlsZAo+ICtpbmRleCBjYmMxNzM5MmQ2
NzguLmNkMDUyNjY3ZTk0MCAxMDA2NDQKPiArLS0tIGEvdGVzdHMvZnAvbWVzb24uYnVpbGQKPiAr
KysrIGIvdGVzdHMvZnAvbWVzb24uYnVpbGQKPiArQEAgLTEyNiwxMiArMTI2LDE0IEBAIHRlc3Qo
J2ZwLXRlc3QtbXVsQWRkJywgZnB0ZXN0LAo+ICsgICAgICAgICAgICBbJ2YxNl9tdWxBZGQnLCAn
ZjMyX211bEFkZCcsICdmNjRfbXVsQWRkJywgJ2YxMjhfbXVsQWRkJ10sCj4gKyAgICAgIHN1aXRl
OiBbJ3NvZnRmbG9hdC1zbG93JywgJ3NvZnRmbG9hdC1vcHMtc2xvdycsICdzbG93J10sIHRpbWVv
dXQ6IDkwKQo+ICsgCj4gKy1leGVjdXRhYmxlKAo+ICstICAnZnAtYmVuY2gnLAo+ICstICBbJ2Zw
LWJlbmNoLmMnLCAnLi4vLi4vZnB1L3NvZnRmbG9hdC5jJ10sCj4gKy0gIGRlcGVuZGVuY2llczog
W3FlbXV1dGlsLCBsaWJ0ZXN0ZmxvYXQsIGxpYnNvZnRmbG9hdF0sCj4gKy0gIGNfYXJnczogZnBj
ZmxhZ3MsCj4gKy0pCj4gKytpZiBjYy5oYXNfaGVhZGVyKCdmZW52LmgnKQo+ICsrICBleGVjdXRh
YmxlKAo+ICsrICAgICdmcC1iZW5jaCcsCj4gKysgICAgWydmcC1iZW5jaC5jJywgJy4uLy4uL2Zw
dS9zb2Z0ZmxvYXQuYyddLAo+ICsrICAgIGRlcGVuZGVuY2llczogW3FlbXV1dGlsLCBsaWJ0ZXN0
ZmxvYXQsIGxpYnNvZnRmbG9hdF0sCj4gKysgICAgY19hcmdzOiBmcGNmbGFncywKPiArKyAgKQo+
ICsrZW5kaWYKPiArIAo+ICsgZnB0ZXN0bG9nMiA9IGV4ZWN1dGFibGUoCj4gKyAgICdmcC10ZXN0
LWxvZzInLAo+ICstLSAKPiArMi40My4wCj4gKwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
