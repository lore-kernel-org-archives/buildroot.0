Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7763CC7EE29
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 18:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16DEE842A3;
	Fri,  9 Jun 2023 18:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16DEE842A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_Gy4HJFiTob; Fri,  9 Jun 2023 18:11:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5529C84274;
	Fri,  9 Jun 2023 18:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5529C84274
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F8B01BF379
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 18:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5159D4190C
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 18:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5159D4190C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rbNt24ILbkZZ for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 18:10:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73C4C40127
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73C4C40127
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 18:10:54 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6b29b9f5c40so911110a34.2
 for <buildroot@buildroot.org>; Fri, 09 Jun 2023 11:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686334253; x=1688926253;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qn2/bbQ6/MbPCnzlSxDVFywDds0NRdRoP9wDT5hHJ1I=;
 b=gvezhBxOpQn251XkirzrBMREzyGWeCCu6iuLykGY2KHnhhtl4mAR3VnkeCqD89OLPR
 pLejrIlbWggfzOxp+ua+U+Sh4bgqtnyRPQw6e4zbkPA2QTS8zJyP3hYVn8a8pUk6JFM/
 XVYCC/vnyZEUhMJe58A7m/eXvgpYfDouO0+ClgDNa4dM3z46XGrHUkH0HP+GiViHGKmT
 9MwBOd0G55lUaho/pMorPz6KPuo+PYQqW3ktWazHomku1xzUGVFpCj/8XWqdty0pXlMh
 a8c0KzLPCg3MC7iO4WsyyLbNmNtjp81+wNNsky1EQ6HKmcaa1d0NBYgAGKEJmQVnEe2I
 O6uQ==
X-Gm-Message-State: AC+VfDyt26WRX2pIVsT9LXJPKu5RZ3ZaZd5/jSJo7jDUFDj2pNiQn3k9
 cGDFxiqRqpNRhsNBGjd3D93TKcCCpk96Lw==
X-Google-Smtp-Source: ACHHUZ6HHTITs9AfpJmhWvWFSiMeOSQk16f8yKg0uk0RckKyLEPHu0UuGQgLF+mc0fFYc04a6HTxhQ==
X-Received: by 2002:a05:6870:1a89:b0:19f:8df8:c50e with SMTP id
 ef9-20020a0568701a8900b0019f8df8c50emr1972587oab.0.1686334253025; 
 Fri, 09 Jun 2023 11:10:53 -0700 (PDT)
Received: from [10.0.0.73] ([76.8.199.226]) by smtp.gmail.com with ESMTPSA id
 og6-20020a056870bd4600b0019fadc057d0sm2479783oab.25.2023.06.09.11.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 11:10:52 -0700 (PDT)
Message-ID: <5e6129b8-9672-efd0-32c7-18d0defcad21@gmail.com>
Date: Fri, 9 Jun 2023 12:10:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: buildroot@buildroot.org
From: Lance Fredrickson <lancethepants@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686334253; x=1688926253;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qn2/bbQ6/MbPCnzlSxDVFywDds0NRdRoP9wDT5hHJ1I=;
 b=KgyMf22hJ0x/rkytCdV8xpwKdgymEFsxNJZznJgIbRBgTezZY+1kGXin0TUINMHOR+
 R5t/7joUxLP+2ZsTnvh0y80YR1N+EgFOfmhisQmx4kru4rz1QD69t2EeKbzNK4YoHt+M
 BfP7rZAEx1X+Y18I6dVMRYNXx5Rd0A5aVc7yGN82Wg7SXCjXJt9duXyc74gcACgWjQC4
 qZ4dxAizeet/6zXrXhcVQh82Mw8lmAbjXOY6fTLlHYO5lgPgfRQyOw19zNoU3jWWiT1u
 d0CU8xRxicYxvpdBWIYHwErbujuHd6qZjvat0B5tjaLhFMG7d5It6A3Rte7aUrHIOo2V
 q3jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=KgyMf22h
Subject: [Buildroot] 2023.05 host ccache detects avx512 and fails to buld
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWlncmF0aW5nIG15IHByb2plY3QgdG8gMjAyMy4wNSBJJ20gZW5jb3VudGVyaW5nIGFuIGlzc3Vl
IHdoZW4gZW5hYmxpbmcgCmNjYWNoZSBjb21waWxlciBzdXBwb3J0LgoKSW4gdGhlIGNtYWtlIGJ1
aWxkIGludm9jYXRpb24gSSBzZWUKLS0gUGVyZm9ybWluZyBUZXN0IEhBVkVfQ19BVlg1MTIgLSBT
dWNjZXNzCmFuZCB0aGVuIGJsYWtlMyBmYWlscyB0byBidWlsZAoKW8KgIDklXSBCdWlsZGluZyBD
IG9iamVjdCAKc3JjL3RoaXJkX3BhcnR5L2JsYWtlMy9DTWFrZUZpbGVzL2JsYWtlMy5kaXIvYmxh
a2UzX2F2eDUxMi5jLm8KL3RtcC9jY3lObTFOQS5zOjM4NDQ6IEVycm9yOiB1bnN1cHBvcnRlZCBp
bnN0cnVjdGlvbiBgdm1vdmRxdScKCkkndmUgdHJpZWQgYm90aCBpbiBWTSAoMTI5MDBrIHVzaW5n
IHZpcnR1YWxib3gpIGFuZCBvbiBhbmNpZW50IGNvcmVpNSAKYmFyZSBtZXRhbC4KClRoZSBmdW5u
eSB0aGluZyBpcyBJIGNhbiBtYW51YWxseSBjb21waWxlIGl0IGZpbmUgd2l0aC4KY21ha2UgXAot
V25vLWRldiBcCi1EQ01BS0VfQlVJTERfVFlQRT1SZWxlYXNlIFwKLURaU1REX0ZST01fSU5URVJO
RVQ9T04gXAotRFJFRElTX1NUT1JBR0VfQkFDS0VORD1PRkYgXAouLwoKVGhlbiBJIHRyeSBhZGRp
bmcgLURIQVZFX0NfQVZYNTEyPW5vIHRvIGNjYWNoZS5tayBhbmQgaXQgdGhlbiBzdWNjZWVkcy4K
ClNvIHNlZW1zIGxpa2Ugc29tZSBvcHRpb24gb3IgY29tYmluYXRpb24gb2Ygb3B0aW9ucyBpcyBt
YWtpbmcgY21ha2UgCnRoaW5rIGF2eDUxMiBpcyBzdXBwb3J0ZWQgd2hlbiBpdCBpcyBub3QuCgpM
YW5jZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
