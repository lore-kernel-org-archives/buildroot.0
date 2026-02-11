Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF82AE9E31E
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 15:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AACE80DBB;
	Wed, 11 Feb 2026 15:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Zs_hYSX0tir; Wed, 11 Feb 2026 15:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C54C80DDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770823193;
	bh=6EnkA3QMiFM08LeQm/wodjF3QpE4BsbnlRDSaCokWBg=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zn7Ye6vipl3P86A56bzyqe8ivbYDNvVskke1KjdKGexXUZUfA4m7tF7IL3fJhLOev
	 qkHSUgYL7jWs0/nIJWU12sDxAiqAoNR8cJD3ihGB9Se8rDzP+k71qC8UfRDyexJf9U
	 L0L+UOkAEgP/2EVk2nOqd0askM7qp3RLTcXEFPcnJiPWCdJ8tiH5zC8UIEGFe2YJPP
	 c0AChaMaWeCH6jY10tFTsWwFy1/CXd1Y/+CtAM0bQ1UNqaBuUQb6Nx4TSoUAbcINyd
	 k6jB+Sm2MlX/NaaBTOBL6vH+/P3umMGvS9FbZE0Jksms3f6gMUwCSFcbRoiYkUTYHg
	 ExkjneTzA3yRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C54C80DDE;
	Wed, 11 Feb 2026 15:19:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B5A323D
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 15:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6944A40E8A
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 15:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQk-Mw-YdrId for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 15:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4A259409F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A259409F5
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A259409F5
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 15:19:51 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-4362507f396so1840739f8f.0
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 07:19:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770823189; x=1771427989;
 h=content-transfer-encoding:in-reply-to:cc:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gAxct0wDLtQVVjLXDmvLe5y7Eyr2ndz/G40NXVpEIj4=;
 b=JDdtOGfnknDQeXWD3omPlRMiqe4T0c6pT9+rbgWckbR16xEhLiGpAH4eLAsbhDSfpz
 wAO+9o/QpjBN71hpHs3SkOj9PiJhtNThlhJUjIlslRrt1hpadibJ5g+8ifdEDKmUUtiz
 NvhC8PQyXcBOcwh4BNxxnBSScj0e6Ut8F3dhqC4zjYfqvsHHHMfG1Ch8vvEOrKGcUgGW
 +vCIuOvxlLjB5dD3Q7SpXH6BeMwWrvvE1G9ZocFy+GWAZDfVprrGarRUY0WwXUva7cAa
 hv7Od8zlY1l18kud8DuLX1WbjmxMgn6nPrhgvFu7URTq9Esy9sVdsuLqNgv3eAjIV2lp
 dbBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPfKRv8c0QRuMULeWiAdi6ddNwJvxw/1tk6/WHcJuFRQk+Z9EirZY3WmXaHrmJlCB+DtgQCbyaYQE=@buildroot.org
X-Gm-Message-State: AOJu0YwWCw12Qmn9AcYMzilSWJLqCqDTR9+W3VDbU/KBzJysFG4TrWXf
 ADq+ro7bYO0qWxA5XEdZTtgwdWW7oKYIzylS9aUrkS5HxBvji4qpGhnadUbdIN7hxZl9KKS9OYF
 sEIAvcAM=
X-Gm-Gg: AZuq6aIUE46trP/hjNvoclDJg7TRK1oh6brDP0g8YrwzAkAkyhMUzR1hJq1+nI8ytVU
 d5K8x9Pc00/gim/1Oh3Z7Xq6ETKXpOMkJvTSUmRWXHX/medLrwnoWPjNyem0jD2IOsAE/yQpbt3
 QWvYH/EeDjoAVGL9BzhrNNtm2pMFNc5KG2t9hWJWgmiT3DqltOGBdQSs24jGWhMIS6P/KhSiLSE
 R0jEN9TBB2zmlMXv0vMRfgumjka6M87GQdCJjCET75p0gAGy+PaHrwiGRJ3KcAjjuO12sIJNmo+
 yPrNichtdjO8IG0qTH0fjGeylAUfoUKlngOzz/qk2d1dcQ5tw42VQ6g9Oi2r49VvmtTPhvjQjrN
 uIYetHVVIfaEQLEytkILuuuf7BD98jmeW4t1qN925MLSaylOcnq6bhb1ftcV7441osh0wUyA6yO
 cDI98Ym0q8R4CAwslxns5bMXo/4W3zi9/MH0eb8K3fSNB4G1XbSrC66/q1aO2WaDkXwE0Dyxpbq
 aywXdx+ASHrjs/nw9qaGZ24HA==
X-Received: by 2002:a5d:5f42:0:b0:430:fd0f:28fe with SMTP id
 ffacd0b85a97d-43629381b46mr28491359f8f.31.1770823189048; 
 Wed, 11 Feb 2026 07:19:49 -0800 (PST)
Received: from [10.5.90.22]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e39c75sm5248116f8f.29.2026.02.11.07.19.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 07:19:48 -0800 (PST)
Message-ID: <fd52f63a-ffdc-4efd-8608-2117c22eb2fe@smile.fr>
Date: Wed, 11 Feb 2026 16:19:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Buildroot Notifications <buildroot.notifications@gmail.com>,
 buildroot@buildroot.org
References: <698c02ec.050a0220.22020.0cc3@mx.google.com>
Content-Language: fr, en-US
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@xes-inc.com>
In-Reply-To: <698c02ec.050a0220.22020.0cc3@mx.google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770823189; x=1771427989; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:cc:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gAxct0wDLtQVVjLXDmvLe5y7Eyr2ndz/G40NXVpEIj4=;
 b=Ijrvxtp2kT4ASpQXsdfCX/OzHh/SP3Of7tMymJesLr9DuEM4231pTGnDKsCcrTYCbp
 wxyDsr88RR9kGppCHQE+vLpT0fJzKJY8Mi1yWdQe9YviEl02lkft0K9STrj1ZHy+jZsI
 QYj/n2emKA40z99l1oacrUJwZZCycpuJ1jC44=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Ijrvxtp2
Subject: [Buildroot] [autobuild.buildroot.org] Analysis of runtime-test
 failures for 2026-02-10
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

SGkgQWxsLAoKTGUgMTEvMDIvMjAyNiDDoCAwNToxNywgQnVpbGRyb290IE5vdGlmaWNhdGlvbnMg
YSDDqWNyaXTCoDoKPiBIZWxsbywKPiAKWy4uLl0KCk9ubHkgMyByZW1haW5pbmcgcnVudGltZSBp
c3N1ZXM6Cgo+IAo+IEdpdGxhYiBDSSByZXN1bHRzIGZvciAyMDI2LTAyLTEwCj4gPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KPiAKPiBEZXRhaWwgb2YgcnVudGltZS10ZXN0IGZhaWx1
cmVzIGZvciBtYXN0ZXIKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiAKPiAgICAgICAgICAgICAgcnVudGltZS10ZXN0IHwgICAgICAgICAgICAgICAgICAgICAg
ICBsaW5rIHRvIHRoZSBqb2IgICAgICAgICAgICAgICAgICAgICAgICB8IG9ycGg/Cj4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLQo+ICAgICAgICAgIFRlc3RQeXRob25Q
eWJpbmQgfCBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2Jz
LzEzMDQ4MDg4MDU0IHwgICAgICAKCk9uIGdvaW5nIGRpc2N1c3Npb24gYWJvdXQgb3ZlcndyaXRl
IHRoZSBgX3ZlcnNpb24ucHlgIGZpbGUgYW5kIGF2b2lkIGNvcHlpbmcKaGVhZGVycyBpbiBob3N0
IGRpcmVjdG9yeSBbMV0KClsxXQpodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvUEgx
UDExME1CMTYwMzk4MEE4QkNGNjEwQTA1NTBFMjMyOUY5QkFAUEgxUDExME1CMTYwMy5OQU1QMTEw
LlBST0QuT1VUTE9PSy5DT00vI3QKCj4gICAgICAgICAgIFRlc3ROb2RlSlNCYXNpYyB8IGh0dHBz
Oi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTMwMzI2ODIxMjIg
fCAgICAgIAoKICBhcm0tbGludXgtZysrLmJyX3JlYWw6IGZhdGFsIGVycm9yOiBLaWxsZWQgc2ln
bmFsIHRlcm1pbmF0ZWQgcHJvZ3JhbSBjYzFwbHVzICBbMl0KClJlZHVjaW5nIEJSMl9KTEVWRUwg
dmFsdWUgYWxsb3dzIHRvIGJ1aWxkIE5vdGVKUyBhbmQgY29tcGxldGUgdGhlIGJ1aWxkLgoKWzJd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC83MDI5NmZlZC1kNjkzLTRiNzQtODc4
ZS02ZWE5NTE2ZDJlMTNAc21pbGUuZnIvCgo+ICAgICAgVGVzdEZpcmV3YWxsZFN5c3RlbWQgfCBo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzEzMDMyNjgx
OTQxIHwgT1JQSCAKPiAKCldlIHNob3VsZCBhcHBseSB0aGUgcGF0Y2ggdGhhdCByZXBsYWNlIGV4
dDIgaW5zdGVhZCBvZiBjcGlvIFszXQoKWzNdCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNjAyMDIxNDQ1NTAuMTg3NzQ4MC0xLXJvbWFpbi5u
YW91ckBzbWlsZS5mci8KQmVzdCByZWdhcmRzLApSb21haW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
