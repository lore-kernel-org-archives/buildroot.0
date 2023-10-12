Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB924CDB47E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 11:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E86082278;
	Thu, 12 Oct 2023 11:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E86082278
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eDYB8SPQfwqA; Thu, 12 Oct 2023 11:52:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47E2882269;
	Thu, 12 Oct 2023 11:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47E2882269
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BBE491BF33E
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 11:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 952B44013F
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 11:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 952B44013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6PSLG4-1_z4 for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 11:52:45 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14398400E7
 for <buildroot@uclibc.org>; Thu, 12 Oct 2023 11:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14398400E7
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-405497850dbso9140185e9.0
 for <buildroot@uclibc.org>; Thu, 12 Oct 2023 04:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697111563; x=1697716363;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0b+nr2OdDqAVglABXyRjct58dgqLP0i+FK4UHQLvjFQ=;
 b=Dt9MfRYIjhlFlQGyNVJ5MSEaCqKZnl0Dh0/c+sJzRuojvfk4tuaQNJZTlByP+GUp84
 egpzgazou6rzDOVgEoRQAMYe4g12U1ZWRJFDMmzzlGZaqrLu1kKdjvXMmwTH8e1d6Lu+
 0K8uvVUWFOkfCTYm07HoEhvgZHfDqvJoUyWzPvRDgMubfbouPInVCI3I6H+GUgTqJ0+m
 xnRtxaxTGw4YVZJwdtViomTP2knqyjvepyqJQ+hUr3wsWNPb+jSq30aAcsHnoI/evdOn
 qTk8F5mXsOJW6CmK34b3l04f2FqtZTIcybU1OW6DVVbXhvPKAjZy/XOb2fQb3u6b57GQ
 bMRQ==
X-Gm-Message-State: AOJu0Yw2BsPec9HcKtYFDV2itxUaVj9ko0FYQMYgPt/l6tG1V168ZkKK
 cEq6z80EWl0s0tux4t7CUG7alg==
X-Google-Smtp-Source: AGHT+IG0l+g0sA8mYUkbKnrCHaRXwYqZQC+CwEYwGz5ywvVN77FDPPBpB+cnxhX5aO210voB/xSQWg==
X-Received: by 2002:a05:600c:1caa:b0:407:5b54:bb15 with SMTP id
 k42-20020a05600c1caa00b004075b54bb15mr5233709wms.36.1697111562932; 
 Thu, 12 Oct 2023 04:52:42 -0700 (PDT)
Received: from [10.5.3.222]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a1c7719000000b004065daba6casm21834984wmi.46.2023.10.12.04.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 04:52:42 -0700 (PDT)
Message-ID: <6e992358-2589-4b56-b9ac-fc8b6f53d8c1@smile.fr>
Date: Thu, 12 Oct 2023 13:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@uclibc.org
References: <20231011163408.32325-1-romain.naour__9329.73186006478$1697042081$gmane$org@gmail.com>
 <pan$be3a0$7a911afa$92bc3df$90b193fe@ID-313208.user.individual.net>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <pan$be3a0$7a911afa$92bc3df$90b193fe@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1697111563; x=1697716363;
 darn=uclibc.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0b+nr2OdDqAVglABXyRjct58dgqLP0i+FK4UHQLvjFQ=;
 b=xOnsjsXyTumI5Xc03PrbAwmVvLS87fQ38tE4yKiKEgvbE3bnCReodUOT0pCyW2ptoa
 fk6mAG9SeQJlR6ei/ktm7+OgnAL4LZHjXuo3m78OfkL7n2ZbcZQBGEmZNHjzTuBcaAaO
 26xRnk715OBp6DtwBTbLHZHoxZXuVIZJSesnTxfe0uFMelOmC6ZVGR9SguNYVaIi+CgH
 d7gi7oVpF0CP+o9r+p9QNTDGkwf3YN1adJ+lzezAyYhdMNZigLyFtLW0cvJ/xAdwnHIO
 UquTfM5OZCjjEeGWKp4dQPK+1Nb13mAu71JyF8r8IAago/gRmtcKF1OwiZbjhE1RdVgc
 1QvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=xOnsjsXy
Subject: Re: [Buildroot] [PATCH] package/python3: really disable zlib
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQmVybmQsCgpMZSAxMS8xMC8yMDIzIMOgIDE5OjIzLCBCZXJuZCBLdWhscyBhIMOpY3Jp
dMKgOgo+IEFtIFdlZCwgMTEgT2N0IDIwMjMgMTg6MzQ6MDggKzAyMDAgc2NocmllYiBSb21haW4g
TmFvdXI6Cj4gCj4+ICtVcHN0cmVhbTogTm90IGFwcGxpY2FibGUgKyhwYXRjaGluZyBhIEJSIHBh
dGNoCj4+IDAwMjUtQWRkLW9wdGlvbnMtdG8tZGlzYWJsZS16bGliLWJ6aXAyLWFuZC14ei1tb2R1
bGVzLnBhdGNoKQo+IAo+IEhpIFJvbWFpbiwKPiAKPiBkaWQgeW91IHRlc3Qgd2hldGhlciB0aGlz
IHBhdGNoIGFsc28gZml4ZXMgdGhlIHByb2JsZW0/Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8KPiAyMDIzMDgwOTIxMTQwMS4zNTg3MTc3LTQt
YmVybmRAa3VobHMubmV0LwoKTm8gYnV0IGl0J3Mgc2VlbXMgdGhlcmUgaXMgdGhlIHNhbWUgaXNz
dWUgd2l0aCBweXRob24gMy4xMiBbMV0uCgpMZXQncyB0cnkgdG8gZml4IGdpdGxhYi1jaSBpc3N1
ZXMgcmVsYXRlZCB0byBweXRob24gYmVmb3JlIHN3aXRjaGluZyB0byBweXRob24KMy4xMiA6KQoK
WzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24vY3B5dGhvbi9ibG9iLzMuMTIvY29uZmlndXJl
LmFjI0w1MDQ1CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gUmVnYXJkcywgQmVybmQKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
