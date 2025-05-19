Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121B9C54754
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 09:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACCCF40CF7;
	Mon, 19 May 2025 09:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQfT5ZH1FnhL; Mon, 19 May 2025 09:16:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C32FE40D01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C32FE40D01;
	Mon, 19 May 2025 09:16:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72E5FD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 09:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5606B40CF7
 for <buildroot@buildroot.org>; Mon, 19 May 2025 09:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VqhDoJQsFFA for <buildroot@buildroot.org>;
 Mon, 19 May 2025 09:15:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1FB1C40D01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FB1C40D01
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FB1C40D01
 for <buildroot@buildroot.org>; Mon, 19 May 2025 09:15:58 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 47991C102B;
 Mon, 19 May 2025 11:15:55 +0200 (CEST)
Message-ID: <4a4473d3-56d6-4576-9a8f-5b708a1569df@grenoble.cnrs.fr>
Date: Mon, 19 May 2025 11:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Buildroot development <buildroot@buildroot.org>
Cc: Petr Vorel <petr.vorel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1747646155;
 bh=NHQayvJrogE1K/Q0VlQ33HP5UQBUPvDP4eCy+JIqj9o=;
 h=Date:To:Cc:From:Subject:From;
 b=IQL1IT+HqcbVGjtIA9/pUKq6HAPwPyCyRUXgNU97+tZcajKtcUTLHUkh2ekEjJADz
 xTUDGeDjdouEq13WMu5truAQNiJzRANKAKKBXyBgRyjn+Y9IGSauYbc7JikJn2f/RC
 Gf7HI2JZs6uJW0SjNdsafhSNlj/Ka4yL3R9ri/YJHgcanFACMGywQPJwITaQERpV8p
 zz/6XVEL90pZPO+OZuX8FpAMNNz1sBdPb5BwVcGzm/htd8lmpue8Qb0bvbJKaQyPeq
 f3h3Ouep0oNm6S3b+j3fShak+IPh1m76oHUC9c/vrU5SwdNfZbqSx54J+KBUxxB0SZ
 72wMV8rylQLiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=IQL1IT+H
Subject: [Buildroot] [PATCH 1/1] support/kconfig: fix another compiler
 warning
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29tcGlsaW5nIHdpdGggR0NDIDEzLjMgZ2VuZXJhdGVzIHRoaXM6CgouL3V0aWwuYzogSW4gZnVu
Y3Rpb24g4oCYZmlsZV93cml0ZV9kZXDigJk6Ci4vdXRpbC5jOjg2OjI2OiB3YXJuaW5nOiDigJgl
c+KAmSBkaXJlY3RpdmUgd3JpdGluZyAxMCBvciBtb3JlIGJ5dGVzIGludG8gYSByZWdpb24gb2Yg
c2l6ZSBiZXR3ZWVuIDEgYW5kIDQwOTcgWy1XZm9ybWF0LW92ZXJmbG93PV0KICAgODYgfCAgICAg
ICAgIHNwcmludGYoYnVmMiwgIiVzJXMiLCBkaXIsIG5hbWUpOwogICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICBefgouL3V0aWwuYzo4Njo5OiBub3RlOiDigJhzcHJpbnRm4oCZIG91dHB1
dCAxMSBvciBtb3JlIGJ5dGVzIChhc3N1bWluZyA0MTA3KSBpbnRvIGEgZGVzdGluYXRpb24gb2Yg
c2l6ZSA0MDk3CiAgIDg2IHwgICAgICAgICBzcHJpbnRmKGJ1ZjIsICIlcyVzIiwgZGlyLCBuYW1l
KTsKICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CgpUaGlz
IGlzIHNpbWlsYXIgdG8gdGhlIHdhcm5pbmdzIGdlbmVyYXRlZCBieSBHQ0MgOS40IGFuZCBmaXhl
ZCBpbgozMjQ2MTJkNjhlICgic3VwcG9ydC9rY29uZmlnOiBmaXggY29tcGlsZXIgd2FybmluZ3Mi
KS4KCkF2b2lkIHRoZSB3YXJuaW5nIGJ5IGVubGFyZ2luZyB0aGUgZGVzdGluYXRpb24gYnVmZmVy
IG9mIGZwcmludGYoKS4KClNpZ25lZC1vZmYtYnk6IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2Js
ZS5jbnJzLmZyPgotLS0KIHN1cHBvcnQva2NvbmZpZy91dGlsLmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zdXBwb3J0
L2tjb25maWcvdXRpbC5jIGIvc3VwcG9ydC9rY29uZmlnL3V0aWwuYwppbmRleCA4NjY1ZjViYjg5
Li44NmNlOTk0MzY3IDEwMDY0NAotLS0gYS9zdXBwb3J0L2tjb25maWcvdXRpbC5jCisrKyBiL3N1
cHBvcnQva2NvbmZpZy91dGlsLmMKQEAgLTM1LDcgKzM1LDcgQEAgc3RydWN0IGZpbGUgKmZpbGVf
bG9va3VwKGNvbnN0IGNoYXIgKm5hbWUpCiBpbnQgZmlsZV93cml0ZV9kZXAoY29uc3QgY2hhciAq
bmFtZSkKIHsKIAljaGFyICpzdHI7Ci0JY2hhciBidWZbUEFUSF9NQVgrMjBdLCBidWYyW1BBVEhf
TUFYKzFdLCBkaXJbUEFUSF9NQVgrMV07CisJY2hhciBidWZbUEFUSF9NQVgrMjBdLCBidWYyW1BB
VEhfTUFYKzExXSwgZGlyW1BBVEhfTUFYKzFdOwogCXN0cnVjdCBzeW1ib2wgKnN5bSwgKmVudl9z
eW07CiAJc3RydWN0IGV4cHIgKmU7CiAJc3RydWN0IGZpbGUgKmZpbGU7Ci0tIAoyLjQzLjAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
