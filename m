Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9925C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 14:27:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A71A960E93
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 14:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A71A960E93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B6CF427DB;
	Sat, 28 Aug 2021 14:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KVjnlHiNN_uH; Sat, 28 Aug 2021 14:27:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71123427DE;
	Sat, 28 Aug 2021 14:27:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 348C31BF37B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 14:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 306A8427DE
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 14:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GTCpN0fE47gn for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 14:27:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04064427DB
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 14:27:23 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id d16so16916420ljq.4
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 07:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vGC3JQcKbarrrQNBVT8H8fyyf08lrWuoxjvSBznPzP8=;
 b=VDoGWUJtJkGVYOehByW0lMfyFnvxukTvdL+pMPWk8JeZb2i8bLlDKLa/mNYequUgPn
 fKKgH1gDQKx2jCfpsgpqW//ST+TMfQBWu4SqY4DxETzw6nuzxlrPnd9Kgv1Y1CDB7QXJ
 9XdHg4zmoi59iuC3XNnpdQSfmJSNclByL6ZvNYyc4j74ehj9LqzfyG428SKWWvh8D6Au
 LRW6NbrMmj3XZ1n+Nk4FtDau/57zN00QoZcq/hX51BgsP1e6H5h/jmja3QXkvtAa4kIb
 kU0rHnKMclW1usVAEwL5t5oDJfwzPbCH/p3XS/X2pvAsDqFnAloOPTI8aodqhzHOagmG
 2sUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vGC3JQcKbarrrQNBVT8H8fyyf08lrWuoxjvSBznPzP8=;
 b=NwrtahhhE7AbDtGsEH20bRxQXWisY8MbGsfoIycB9DtHe/vInzLfcFOMa/3SvSBBc4
 gYyMebK/1uaAeTD6WwW4QBevhd59bfvBHIBTxdnpu1kLrILS13T8+tIYQNTqXmHJhPYZ
 xnEsEEwJ0zG1qo8TUXMqvkh3fYF8X9imGQZowxIF82YBGjn+d4MPmZPsgMVw4CT40Io6
 cpEwRJdYx60MZB4FviufW+gv/3Y75+HufLjshMl0jObs4iN73b7vJ/Zr04AaYgxZZE4v
 Qcs27R6P4nnXEjmCjveG02L2YlvPE1tTJunCNL+mVKSWXIj5F/4IrGxVVbHN+D/WBTq9
 BDxg==
X-Gm-Message-State: AOAM532UXad6NZfIb40loj/jknfkJkim0xlzbjeCzqTkkvVRHBqIlHLs
 3uXGJ6IlMQEjnT9FGpendqDeZ70igE6+T/R7ruYW1CNU/HkKEg==
X-Google-Smtp-Source: ABdhPJxGyjJN3XBzYusRZcpJu3eXV1hcAcw6hdzDllybNEAFVw/pSG9hJNAa26n8IuN5/NqsF1NxPfnijSQ7CSj3Zrs=
X-Received: by 2002:a2e:a0d1:: with SMTP id f17mr12479022ljm.230.1630160841978; 
 Sat, 28 Aug 2021 07:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210828071352.359497-1-fontaine.fabrice@gmail.com>
 <ba48fd48-031d-a85d-c021-4aeb4f41aad6@mind.be>
In-Reply-To: <ba48fd48-031d-a85d-c021-4aeb4f41aad6@mind.be>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Aug 2021 16:27:09 +0200
Message-ID: <CAPi7W82doV3sVmxEHq3x+gqRBJAr9oUftckF0r=OEi88fQ5vgg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/ushare: fix NLS build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

TGUgc2FtLiAyOCBhb8O7dCAyMDIxIMOgIDE1OjUwLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJu
b3V0QG1pbmQuYmU+IGEgw6ljcml0IDoKPgo+Cj4KPiBPbiAyOC8wOC8yMDIxIDA5OjEzLCBGYWJy
aWNlIEZvbnRhaW5lIHdyb3RlOgo+ID4gQ29tbWl0IGM0ZTFhMDc1MTAxOTE0ZjhlMGQ0N2Y4YmI5
YzA2YmVhMTNiYTBmZDIgZm9yZ290IHRvIGFkZAo+ID4gLS1lbmFibGUtbmxzIHRvIHBhdGNoIHJl
c3VsdGluZyBpbiB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmU6Cj4gPgo+ID4gVW5rbm93biBv
cHRpb24gIi0tZW5hYmxlLW5scyIuCj4gPgo+ID4gRml4ZXM6Cj4gPiAgLSBodHRwOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy82YWIyNTU1YjQxOTM1NWYwMTMxMGYyMzBmZTYxMmYy
YTM2OTliYmZkCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFp
bmUuZmFicmljZUBnbWFpbC5jb20+Cj4KPiAgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KPgo+
ICBIYXMgdGhlIHBhdGNoIGJlZW4gdXBkYXRlZCB1cHN0cmVhbT8KWWVzIGFuZCBJIG1lcmdlZCBp
dDoKaHR0cHM6Ly9naXRodWIuY29tL2RkdWdvdmljL3VTaGFyZS9jb21taXQvMjAxNjIxY2Y3MWNl
OWNkMTZmNjk5NDcxYzM0M2FjMTA1MTNmZGVlNwo+Cj4gIFJlZ2FyZHMsCj4gIEFybm91dAo+Cj4g
PiAtLS0KPiA+ICAuLi4tdC1idWlsZC1wby1maWxlcy1pZi1OTFMtaXMtZGlzYWJsZWQucGF0Y2gg
fCAxOSArKysrKysrKysrKysrKy0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdXNoYXJl
LzAwMDEtRG9uLXQtYnVpbGQtcG8tZmlsZXMtaWYtTkxTLWlzLWRpc2FibGVkLnBhdGNoIGIvcGFj
a2FnZS91c2hhcmUvMDAwMS1Eb24tdC1idWlsZC1wby1maWxlcy1pZi1OTFMtaXMtZGlzYWJsZWQu
cGF0Y2gKPiA+IGluZGV4IGYwZmE4OTk5OGYuLjNmYmRhMjgzOGUgMTAwNjQ0Cj4gPiAtLS0gYS9w
YWNrYWdlL3VzaGFyZS8wMDAxLURvbi10LWJ1aWxkLXBvLWZpbGVzLWlmLU5MUy1pcy1kaXNhYmxl
ZC5wYXRjaAo+ID4gKysrIGIvcGFja2FnZS91c2hhcmUvMDAwMS1Eb24tdC1idWlsZC1wby1maWxl
cy1pZi1OTFMtaXMtZGlzYWJsZWQucGF0Y2gKPiA+IEBAIC0xLDQgKzEsNCBAQAo+ID4gLUZyb20g
OTc3MTcxNzgxZjVkNDllNjFiNDZjMDI0MWZiNjdjYmI3ZDY2NjQ5OCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKPiA+ICtGcm9tIGM5ZjU3ODNiYjJkZjRhMTljNjI4MWRhZWRhMzBlOGFiOTA1ZDJj
YTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gPiAgRnJvbTogRmFicmljZSBGb250YWluZSA8
Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiAgRGF0ZTogU3VuLCAyMiBBdWcgMjAyMSAx
MDo0NDo0OCArMDIwMAo+ID4gIFN1YmplY3Q6IFtQQVRDSF0gRG9uJ3QgYnVpbGQgcG8gZmlsZXMg
aWYgTkxTIGlzIGRpc2FibGVkCj4gPiBAQCAtNyw4ICs3LDggQEAgU2lnbmVkLW9mZi1ieTogRmFi
cmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiAgW1Vwc3RyZWFt
IHN0YXR1czogaHR0cHM6Ly9naXRodWIuY29tL2RkdWdvdmljL3VTaGFyZS9wdWxsLzEyXQo+ID4g
IC0tLQo+ID4gICBNYWtlZmlsZSAgfCA3ICsrKysrLS0KPiA+IC0gY29uZmlndXJlIHwgMSArCj4g
PiAtIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4g
KyBjb25maWd1cmUgfCAzICsrKwo+ID4gKyAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiAgZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZp
bGUKPiA+ICBpbmRleCBlYmQ4ZjkxLi42Njg2Y2ZkIDEwMDY0NAo+ID4gQEAgLTMxLDEwICszMSwx
OSBAQCBpbmRleCBlYmQ4ZjkxLi42Njg2Y2ZkIDEwMDY0NAo+ID4gICAgICAgZm9yIHN1YmRpciBp
biAkKFNVQkRJUlMpOyBkbyBcCj4gPiAgICAgICAgICQoTUFLRSkgLUMgJCRzdWJkaXIgJEA7IFwK
PiA+ICBkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIvY29uZmlndXJlCj4gPiAtaW5kZXggNGEzZWZl
MC4uMTYyYTc3NiAxMDA3NTUKPiA+ICtpbmRleCA0YTNlZmUwLi5mNDg4MDZhIDEwMDc1NQo+ID4g
IC0tLSBhL2NvbmZpZ3VyZQo+ID4gICsrKyBiL2NvbmZpZ3VyZQo+ID4gLUBAIC03MjMsNiArNzIz
LDcgQEAgYXBwZW5kX2NvbmZpZyAiTERGTEFHUz0kTERGTEFHUyIKPiA+ICtAQCAtNDE0LDYgKzQx
NCw4IEBAIGZvciBvcHQgZG8KPiA+ICsgICA7Owo+ID4gKyAgIC0td2l0aC1saWJkbG5hLWRpcj0q
KSBsaWJkbG5hZGlyPSIkb3B0dmFsIjsKPiA+ICsgICA7Owo+ID4gKysgIC0tZW5hYmxlLW5scykg
bmxzPSJ5ZXMiCj4gPiArKyAgOzsKPiA+ICsgICAtLWRpc2FibGUtbmxzKSBubHM9Im5vIgo+ID4g
KyAgIDs7Cj4gPiArICAgLS1lbmFibGUtZGxuYSkgZGxuYT0ieWVzIgo+ID4gK0BAIC03MjMsNiAr
NzI1LDcgQEAgYXBwZW5kX2NvbmZpZyAiTERGTEFHUz0kTERGTEFHUyIKPiA+ICAgYXBwZW5kX2Nv
bmZpZyAiSU5TVEFMTD0kSU5TVEFMTCIKPiA+Cj4gPiAgIGFwcGVuZF9jb25maWcgIkRFQlVHPSRk
ZWJ1ZyIKPiA+CkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
