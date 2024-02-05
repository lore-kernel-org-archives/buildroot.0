Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30813C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC5C540438;
	Mon,  5 Feb 2024 17:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC5C540438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Z2YC9WXhOCA; Mon,  5 Feb 2024 17:21:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A92940468;
	Mon,  5 Feb 2024 17:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A92940468
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 692E61BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DC5040468
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DC5040468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HC4r7S7imW4J for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:21:26 +0000 (UTC)
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C16140438
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C16140438
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-42a9f4935a6so43874621cf.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 09:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707153685; x=1707758485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x+BeRHEvwf8LcPXKxmWA8Rbnr2M21mSYPr9mjy00Eh0=;
 b=jeWWWIv8W10CC4LOI10vFaFJZsTozFE50IuPUfziXaOqcmfbZ0ZCc4IImFaMDO0/zF
 kUjBTK7LcSfiGtso9PnjEaYgmAna4agoPE7OwjAf6khjUaNYXwA3SYkum4InQPudJWqP
 qGoNXOs09G2ou0EsCqFdBY1630mkntNlM75uuXzVa+wZUxsPBb+YhteCDi+4k9Nolr3o
 iqFAFFJC+iX7eZ64XLGO8nYi70kXwEFsPNzi+fdchZDNayYSuGEOdITuH/mgVnaUUyBq
 bkXFtqn9XpQBoIK68D519RusDBIRsGd5if/atolrZiIAUSTbCCMozGqFuEcztBucgRgm
 zWSA==
X-Gm-Message-State: AOJu0YxSrsYxOMUU7mv+/BjxBaMjuN+4jgfPHyE06+vO5fBbbFUd4Ks5
 8UUrzrndESGNqY2rqAze/QCT45GmFNBhwbHzdNyMoxxSQiQVTrBL/Sr/GHaGTCZ7FGaoUkX3675
 p01bjjpTpNt4fqVGHpn90mftAxWo=
X-Google-Smtp-Source: AGHT+IG2gZ8U2518y0m9KSp4KkfG3h1tI193jmQDaCn/5evkc3IFXmYS/XvVozOmdOUDdm8B+audQvcFxnZwo/Zt3Ak=
X-Received: by 2002:a05:622a:68ca:b0:42b:f34b:2044 with SMTP id
 ic10-20020a05622a68ca00b0042bf34b2044mr423543qtb.23.1707153684821; Mon, 05
 Feb 2024 09:21:24 -0800 (PST)
MIME-Version: 1.0
References: <20240111052225.2922249-1-james.hilliard1@gmail.com>
 <687fa6af-4d6f-4890-bd3a-c420ede9cdfd@mind.be>
In-Reply-To: <687fa6af-4d6f-4890-bd3a-c420ede9cdfd@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 5 Feb 2024 10:21:13 -0700
Message-ID: <CADvTj4ptOXX-KXLrdykFUZnQBo1YCmgd1niQ10rRv5PBXGbV+g@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707153685; x=1707758485; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x+BeRHEvwf8LcPXKxmWA8Rbnr2M21mSYPr9mjy00Eh0=;
 b=cBRrKJN6989xVA0/VmbMfAcZm+n6Gr5i+AhS3gZYhFf27lugAXJyK4sSujKiMWx8zU
 JteMYQuNWbpNiJIYBVsBFkF1oNwtCvgl7QrBaPOVSCsAe6PKx25M78OO17iAKPVaRgCt
 WQc9RGcCaEyFMqBH7LqB+1W/ax1cRsiz01Cl09uJ5F3ts/SKop3fFyNo0IYGFJ3JNLSW
 01rguZCn2q5rOPDOSSbByxDhgJD7Y2sj0cQSGw2zRpGt+C9betuDWQKStK4GIBTYUnMQ
 r0rf0V/Ji5QQvD6RUSb8yF2AOUUzpgqTdhMko+vYCTtthO0xrsao07hQEB8JtxLrOKWn
 pFog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cBRrKJN6
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rtoml: bump to version
 0.10.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBGZWIgNSwgMjAyNCBhdCA0OjI54oCvQU0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFy
bm91dEBtaW5kLmJlPiB3cm90ZToKPgo+Cj4KPiBPbiAxMS8wMS8yMDI0IDA2OjIyLCBKYW1lcyBI
aWxsaWFyZCB3cm90ZToKPiA+IE1pZ3JhdGUgZnJvbSBzZXR1cHRvb2xzLXJ1c3QgdG8gbWF0dXJp
biBpbmZyYXN0cnVjdHVyZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8
amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gICBwYWNrYWdlL3B5dGhvbi1y
dG9tbC9weXRob24tcnRvbWwuaGFzaCB8IDIgKy0KPiA+ICAgcGFja2FnZS9weXRob24tcnRvbWwv
cHl0aG9uLXJ0b21sLm1rICAgfCA2ICsrKy0tLQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9w
eXRob24tcnRvbWwvcHl0aG9uLXJ0b21sLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1ydG9tbC9weXRo
b24tcnRvbWwuaGFzaAo+ID4gaW5kZXggMDRkMjJlZDFhNC4uNTlmMTdkOWQ2MiAxMDA2NDQKPiA+
IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXJ0b21sL3B5dGhvbi1ydG9tbC5oYXNoCj4gPiArKysgYi9w
YWNrYWdlL3B5dGhvbi1ydG9tbC9weXRob24tcnRvbWwuaGFzaAo+ID4gQEAgLTEsNCArMSw0IEBA
Cj4gPiAgICMgTG9jYWxseSBjYWxjdWxhdGVkIGFmdGVyIHZlbmRvcmluZwo+ID4gLXNoYTI1NiAg
ODIxYTQzMGFiNjU4N2JkYWFmN2NiOTUwNDRlOGUwZDk5Yzc3YzZhZWQwYWRjZTVhMzcwMDQ1YjI3
MGY3ZWUyMCAgcnRvbWwtMC44LjAudGFyLmd6Cj4gPiArc2hhMjU2ICA5ODdkM2Q5ZTlkNTY3NjFi
MTdjM2U0ZTE3MjkzN2NiY2M3OTNiZjI0YjBlYmIyNzMwNjQ3YTlhMmNmODZjNzg5ICBydG9tbC0w
LjEwLjAudGFyLmd6Cj4KPiAgIFNhbWUgcHJvYmxlbToKPgo+IEVSUk9SOiB3aGlsZSBjaGVja2lu
ZyBoYXNoZXMgZnJvbSBwYWNrYWdlL3B5dGhvbi1ydG9tbC8vcHl0aG9uLXJ0b21sLmhhc2gKPiBF
UlJPUjogcnRvbWwtMC4xMC4wLnRhci5neiBoYXMgd3Jvbmcgc2hhMjU2IGhhc2g6Cj4gRVJST1I6
IGV4cGVjdGVkOiA5ODdkM2Q5ZTlkNTY3NjFiMTdjM2U0ZTE3MjkzN2NiY2M3OTNiZjI0YjBlYmIy
NzMwNjQ3YTlhMmNmODZjNzg5Cj4gRVJST1I6IGdvdCAgICAgOiA2MjRjYzFmZjJiM2ZkZWE0MmFl
ZWUzYTRkMTUzN2QzNzQzMWVjMDAxODcwZGZlZTFlMDRhMTJiZDMwNzZhMmQzCgpIbW0sIEknbSB1
bmFibGUgdG8gcmVwcm9kdWNlIHRoaXMgaXNzdWUuCgo+Cj4KPiAgIFJlZ2FyZHMsCj4gICBBcm5v
dXQKPgo+ID4gICAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwo+ID4gICBzaGEy
NTYgIGNkNWZmZGU4MGU2ZDMyODZhMmUyZTVmMDJmYjJjYjA3YjgyMzkzMWNhMzY4ZTdjNzM1YTZj
NWY1YWViZTcxMDMgIExJQ0VOU0UKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1ydG9t
bC9weXRob24tcnRvbWwubWsgYi9wYWNrYWdlL3B5dGhvbi1ydG9tbC9weXRob24tcnRvbWwubWsK
PiA+IGluZGV4IDgxOWRjZjMyODguLjE2ZjlkZWE1NzMgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdl
L3B5dGhvbi1ydG9tbC9weXRob24tcnRvbWwubWsKPiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXJ0
b21sL3B5dGhvbi1ydG9tbC5tawo+ID4gQEAgLTQsMTAgKzQsMTAgQEAKPiA+ICAgIwo+ID4gICAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4KPiA+IC1QWVRIT05fUlRPTUxfVkVSU0lPTiA9IDAu
OC4wCj4gPiArUFlUSE9OX1JUT01MX1ZFUlNJT04gPSAwLjEwLjAKPiA+ICAgUFlUSE9OX1JUT01M
X1NPVVJDRSA9IHJ0b21sLSQoUFlUSE9OX1JUT01MX1ZFUlNJT04pLnRhci5nego+ID4gLVBZVEhP
Tl9SVE9NTF9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzMz
L2E2L2I0MmQ4ZTBlMjhiZWM5ZmQ3ZmRiYWZiMmQ3NmRiM2Y4NTc4ZjE1MWE2NjllYmE1NjRkNDIy
NzU2ZDkwOQo+ID4gLVBZVEhPTl9SVE9NTF9TRVRVUF9UWVBFID0gc2V0dXB0b29scy1ydXN0Cj4g
PiArUFlUSE9OX1JUT01MX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFj
a2FnZXMvY2EvYjIvMGU3N2EwMGU3NWVkNTgyZWMxYzRjM2E5ZTFlZWVkODg2YTE1YzE5NWJjY2U4
N2I3ZGFmMTE3MWM0MTE1Cj4gPiArUFlUSE9OX1JUT01MX1NFVFVQX1RZUEUgPSBtYXR1cmluCj4g
PiAgIFBZVEhPTl9SVE9NTF9MSUNFTlNFID0gTUlUCj4gPiAgIFBZVEhPTl9SVE9NTF9MSUNFTlNF
X0ZJTEVTID0gTElDRU5TRQo+ID4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
