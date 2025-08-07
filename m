Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC711C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 13:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 801C484DFD;
	Thu,  7 Aug 2025 13:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDb6NjAdHbTb; Thu,  7 Aug 2025 13:02:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E1FF84DF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E1FF84DF8;
	Thu,  7 Aug 2025 13:02:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E867331
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 13:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEAAA400D5
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 13:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OTYRuFt-Qcv for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 13:02:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=boerge.struempfel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E5FAC40177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5FAC40177
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5FAC40177
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 13:02:18 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e8fed231c24so150443276.3
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 06:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754571738; x=1755176538;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pqkkJFC4PRJU6ZwdKxHao7tbWzCpnTh9fWbL3yp2clM=;
 b=q7mOtJ6Cm0a3bz3DYtz7Nr/5v+/pPouihkQKK9/mI+K5RskI140+eMdfDHDjZdqKYM
 zwcBaeksnsUSdePX4A8YoPhi5RnorB807sK2KGcQo9XJAosaUFDJb/EzFVkOlhRD/UvZ
 +neMgJWTwY9wsgcinXQpat+SprdzNlX7kLnTFeDa0P5I9wS0H0C/IcKxFVXNddSJELGf
 wptc9VSd+mRWJDw7VwhYLEhYifsFUKOxkwFTlrb+3t68I/rNrbEkZj+qgwpPq7snM/ct
 G4jbiLLDCx5CU3GPlaiqXGO1hs2HK9zwVE8v4SLE+Fq6ZPnqbGIJIBZUrciDKzGTbSK7
 d0fw==
X-Gm-Message-State: AOJu0Yxkzh0rEodrKyxInqd8WdYPWuAzF4oawk8yqRgPTPIZUj4ggT/M
 nTjDlbpfojOFAK3mBJcAtT165QzW2ggf8jeV+sjFlcZ9N2iuJ5yvH8yRZ8APlEI9NJcDoZX4pUG
 uZyU+pQOtrxQCL/ZIrAeWai90mNZ0pf4LPAjfRFM=
X-Gm-Gg: ASbGncvnOkl32iLfRLMpxYIYYKJ2HbqSu7jMqT+Eo5QuP03ki110qT9AAanBNO5PytY
 RtTQ/XvpDHnfkJl1MyUKhDWQBVHi73goHcn7PRGiLUYLXBy46YU1IbiyqUlXne5jAeGnrQZfIUl
 lh3505uBdG6tz3t9hV8s/hTdVhonbvip1eAWPSF3pIu4N4OjWruii1KWqe+FFUWHeKVAVVhTMfY
 gsW3NIPDBzHJs3V/0kTXAev7W2kDf/wAprje3x/gIVDckNZqw==
X-Google-Smtp-Source: AGHT+IEavZGGLizN6lDAIrOhhFj+mDOwHPkrmfi9Simz4ODMW7QEW/TVtu/xULWjXOXUJftw3Mtn69gAHtUieqalfRo=
X-Received: by 2002:a05:690c:620c:b0:71a:34f4:74fe with SMTP id
 00721157ae682-71bc97fe376mr45239377b3.2.1754571737498; Thu, 07 Aug 2025
 06:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250805111656.3567465-1-peter@korsgaard.com>
In-Reply-To: <20250805111656.3567465-1-peter@korsgaard.com>
From: =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>
Date: Thu, 7 Aug 2025 15:02:05 +0200
X-Gm-Features: Ac12FXwnrYaqSKqIeYfNFEWul152ZnG6JwD7pZBOfm2q73Wq4X8_kMPSNTdG3b4
Message-ID: <CAEktqctbZSBYVdWqCYdev5eFDzPy_dX5qA9b95_ow-ODy2EsSw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754571738; x=1755176538; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pqkkJFC4PRJU6ZwdKxHao7tbWzCpnTh9fWbL3yp2clM=;
 b=eVufOLzy5hqzFvoBMG1a2SBuWsOAyHm43ndvhiS1tDlUy0TNHK3zucUWfnA51auDzv
 1YnbzenhL7bpDhSa85KyTrRv1F3MD8wMJ5aeNtxTUIsNrZz49G2fcdLJBE5TajNLqc4l
 6kGJtcBtT4KYY0ynHAuym9y+VoR+9bSs9FyKj/dlOm01WbO0Ydc6go8cbThlbvfPxI5p
 HE0lCWItZvsYLRbHgLRL5oEIZ9mckQValOZybs2gYsbgy7oUldlDmlGy4ekmgR9dzQQu
 uXLRAy331Q83EJ6z/EFUbX4oMUqp9yHfMtVluMDBvKPSjSX7sko77PP4PBwEFffs944p
 1zvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eVufOLzy
Subject: Re: [Buildroot] [PATCH] package/libgpiod2: bump version to 2.2.2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBBdWcgNSwgMjAyNSBhdCAxOjE34oCvUE0gUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBr
b3JzZ2FhcmQuY29tPiB3cm90ZToKPgo+IEJ1Z2ZpeCByZWxlYXNlLiBGcm9tIE5FV1M6Cj4KPiAt
IGRvbid0IGltcGxpY2l0bHkgdW5xdW90ZSB1bm5hbWVkIGxpbmVzIGluIGdwaW9pbmZvCj4gLSBy
ZW1vdmUgdXNlbGVzcyB2YXJpYWJsZSBpbiByZWNvbmZpZ3VyZSBleGFtcGxlCj4gLSBkb24ndCBs
ZXQgc3RydWN0IGxpbmVfY29uZmlnIGJhbGxvb24gb3V0IG9mIGNvbnRyb2wgYW5kIHRyaWdnZXIg
YW4gT09NCj4gLSBkcm9wIHB5dGhvbjMtY29uZmlnIGNoZWNrIGZyb20gY29uZmlndXJlLmFjCj4K
PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlicy9saWJncGlvZC9saWJncGlvZC5n
aXQvY29tbWl0Lz9pZD03NTlkODMxYWE4ODQ2YTVkMDA3Y2FjMjUwZjc4ZDc0YTUxNGUxZWM5Cj4K
PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+CkFj
a2VkLWJ5OiBCb2VyZ2UgU3RydWVtcGZlbCA8Ym9lcmdlLnN0cnVlbXBmZWxAZ21haWwuY29tPgo+
IC0tLQo+ICBwYWNrYWdlL2xpYmdwaW9kMi9saWJncGlvZDIuaGFzaCB8IDIgKy0KPiAgcGFja2Fn
ZS9saWJncGlvZDIvbGliZ3Bpb2QyLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGli
Z3Bpb2QyL2xpYmdwaW9kMi5oYXNoIGIvcGFja2FnZS9saWJncGlvZDIvbGliZ3Bpb2QyLmhhc2gK
PiBpbmRleCAyODQ1YTBhZDk0Li4yNGJjZmFmYzZjIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGli
Z3Bpb2QyL2xpYmdwaW9kMi5oYXNoCj4gKysrIGIvcGFja2FnZS9saWJncGlvZDIvbGliZ3Bpb2Qy
Lmhhc2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAgIyBGcm9tIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcv
cHViL3NvZnR3YXJlL2xpYnMvbGliZ3Bpb2Qvc2hhMjU2c3Vtcy5hc2MKPiAtc2hhMjU2ICAwZTk0
ODA0OWMzMDliODdjMjIwZmIyNGVlMGQ2MDVkN2NkNWI3MmYyMjM3NmU2MDg0NzA5MDNmZmZhMmQ0
YjE4ICBsaWJncGlvZC0yLjIuMS50YXIueHoKPiArc2hhMjU2ICA3ZTNiZmYwMjA5ZDc1ZmJjYTJl
OWZjZmYxZmQ1ZjA3Y2M1OGI1NDNlMTI5ZTA4YjZkNGJiMWU0YTU2Y2ZlYzBkICBsaWJncGlvZC0y
LjIuMi50YXIueHoKPiAgIyBIYXNoIGZvciBsaWNlbnNlIGZpbGUKPiAgc2hhMjU2ICBmNjQ2YWQ1
MTU5ZWZiNTFjMTEzMGE0YjQzYzMxZjA3NTk3NTBiMWUyNTRkMmFjZjUxMGYzNjhlZTJlMjA4NWMz
ICBDT1BZSU5HCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZ3Bpb2QyL2xpYmdwaW9kMi5tayBi
L3BhY2thZ2UvbGliZ3Bpb2QyL2xpYmdwaW9kMi5tawo+IGluZGV4IDliNDdhYjdjMmEuLmM1YjUz
ZjYzMWIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJncGlvZDIvbGliZ3Bpb2QyLm1rCj4gKysr
IGIvcGFja2FnZS9saWJncGlvZDIvbGliZ3Bpb2QyLm1rCj4gQEAgLTYsNyArNiw3IEBACj4KPiAg
IyBCZSBjYXJlZnVsIHdoZW4gYnVtcGluZyB2ZXJzaW9ucy4KPiAgIyBEZXBlbmRlbmN5IG9uIGtl
cm5lbCBoZWFkZXIgdmVyc2lvbnMgbWF5IGNoYW5nZS4KPiAtTElCR1BJT0QyX1ZFUlNJT04gPSAy
LjIuMQo+ICtMSUJHUElPRDJfVkVSU0lPTiA9IDIuMi4yCj4gIExJQkdQSU9EMl9TT1VSQ0UgPSBs
aWJncGlvZC0kKExJQkdQSU9EMl9WRVJTSU9OKS50YXIueHoKPiAgTElCR1BJT0QyX1NJVEUgPSBo
dHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9zb2Z0d2FyZS9saWJzL2xpYmdwaW9kCj4gIExJQkdQ
SU9EMl9MSUNFTlNFID0gTEdQTC0yLjErCj4gLS0KPiAyLjM5LjUKPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
