Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA65CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 18:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C00616F498;
	Thu, 11 Sep 2025 18:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1MYlhN_FtMdz; Thu, 11 Sep 2025 18:16:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26DE161B75
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26DE161B75;
	Thu, 11 Sep 2025 18:16:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 031C5234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E178F40B91
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39hZBrxCBC1j for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 18:16:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F460409FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F460409FA
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F460409FA
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:16:06 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-336dd55aae1so10847931fa.1
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 11:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757614564; x=1758219364;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LCAg6icRrOJei/UDgfqalwxnvSFY8I4a6k2TLpBGR+I=;
 b=KHmXFeTB2Yd0uptsuF4Ex5eMC/Ydog1XuYrDsy+qHnJRQcothYG/98xCEg1e/GANpi
 sQZFFd6sZSX5gVL1qGeZAG/t3MV2hJ0UwKGZDNIrOKdTJUyT95Pc+7xFJK3TSbSP+cTX
 OUB/bMR63VindKQIXy5bZ6zNvWV/8fJV7NAeBDjxYhbN0vnAKvAvwOPmkUCcEJpgyvl9
 zXcDi8kjx7KofstuTiG0TisMmT1vBin/UQKi0RoKU++pxKW3lr8XclV8EipJj3K9Edhs
 T6jVAhvUsaKPOVTO262KRABDrCzYb6SJv/99HPk0hEOSVrtVKrW84qGxRdudLBjZQ80a
 OyAw==
X-Gm-Message-State: AOJu0YwHa7iMonQFwgOKr3M4POUORr9i1Lw08PfHu+9WxVCiv/wROzYu
 8nv7+To5hlzW/Dp9+FCONYdUvAfG2pyCoPqaXWkWJRuV5/+h1jT0m4s3rgAPRyXooMRhWKn1faP
 a7qSXs8Ow5Q==
X-Gm-Gg: ASbGncsq/CKKiPLtO41RvFVJ5/j6S13oS9HI9NFKldyDWEtf4CYzbDpXvZMUUF3eeww
 nZLupygYc0OmIVQni7nEhbp9V5Pzszt0eJPzrc9hHX3heCdvVSy3e+3dQCw5vl0fYKK07BTiCSK
 LpfonJ1dtjFnxEUVMIuLCw/RUriPwuDwecvq4oQ4cmcKyOF5v3Sonb4lV6rrGqP52UKKlmWRkNa
 3lahEmpMFMUisDR0r1MzZl0XqpkDfgM5IR0DYHJhuU55hkRoyiCxYKmnLKB8Q22cc61cVhcQk3L
 igbNNlVaWb/W9GlUfWBpTpo+WtMBvbhPtX1XbMQkIgtvgydpmHm/hGFD2I2oEfyhy7SdJJc39wf
 VZTkxTUY8o3gHdjOJWLthlm4+fhhPLIUNnnYno1UwYxVgAT+Po4YeUAHpUs0CW4clLRXMhgK4jn
 dm
X-Google-Smtp-Source: AGHT+IEudkd3CWD7g14PR9FBIbrHweH6ZBrG4EQiGsOGgSKN1g3AeaNjz91FmLV7MZDLPxGbGAcZBg==
X-Received: by 2002:a05:651c:150b:b0:336:e102:95fd with SMTP id
 38308e7fff4ca-3513f196485mr152521fa.29.1757614563477; 
 Thu, 11 Sep 2025 11:16:03 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f163f401bsm4213861fa.19.2025.09.11.11.16.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 11:16:03 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-336d84b58edso10664161fa.0
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 11:16:02 -0700 (PDT)
X-Received: by 2002:a05:651c:3246:20b0:336:c6bb:10d6 with SMTP id
 38308e7fff4ca-3513e7ea48dmr146691fa.26.1757614562417; Thu, 11 Sep 2025
 11:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250910183458.1288165-1-james.hilliard1@gmail.com>
In-Reply-To: <20250910183458.1288165-1-james.hilliard1@gmail.com>
Date: Thu, 11 Sep 2025 11:15:49 -0700
X-Gmail-Original-Message-ID: <CA+h8R2o_71O5dt_CAxG6A+imXmnBuC-1NBAXESn9N4Zab_gTOg@mail.gmail.com>
X-Gm-Features: Ac12FXy_KEMGiXyR6jzUB7iiKYhxCXfQeiFZDGoq4VlvO1lZ4JTataM-BwPS22E
Message-ID: <CA+h8R2o_71O5dt_CAxG6A+imXmnBuC-1NBAXESn9N4Zab_gTOg@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1757614564; x=1758219364; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LCAg6icRrOJei/UDgfqalwxnvSFY8I4a6k2TLpBGR+I=;
 b=G13mn3UCxHW6c+Wj7tnIRnisCtj/Fx/BcOZ04Rw6mN217V1/4u2CWfrWk+14JH75Di
 jpt9TgR3denq3Oo4fevRjxtuUKAGvQpItoUlFg79zyUSZADV7VevxjtTjks3ma4Ui2Ih
 v9eWfnTBUevd7TIlNATmZH6xnwd4THh06AGourz4pVslj8jFfIWqchxqixl6KnRGsgT6
 qCI0j8rMi7gU5P8DDHVMP6lVt/Ng/CE5Ta5xc2bbV5a2j82fuyG73iK9KA3zze3rYOoc
 osvI+YJZEWaoO3XM8zzGEbV27yPU4Q9lsZo43wS44IwiXR0jMZtQyAN1af25qy54YAEt
 M6Cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=G13mn3UC
Subject: Re: [Buildroot] [PATCH 1/2] package/go: bump to version 1.25.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgMTE6MzTigK9BTSBKYW1lcyBIaWxsaWFy
ZAo8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBCdWlsZGluZyBHbyAxLjI0
IGFuZCBsYXRlciByZXF1aXJlcyBHbyAxLjIyLjYgb3IgbGF0ZXIgZm9yIGJvb3RzdHJhcC4KPgo+
IFRvIHN1cHBvcnQgdGhpcyB3ZSB1c2Ugb3VyIHByZXZpb3VzIEdvIHZlcnNpb24gMS4yMy4xMiBh
cyB0aGUgdmVyc2lvbgo+IGZvciBnby1ib290c3RyYXAtc3RhZ2U0IGFuZCBoYXZlIHRoZSBidWls
ZCBmb3IgR28gMS4yNS4xIGRlcGVuZCBvbgo+IGdvLWJvb3RzdHJhcC1zdGFnZTQuCj4KPiBHbyB2
ZXJzaW9uIDEuMjMuMTIgaXMgdGhlIGxhdGVzdCBnbyB2ZXJzaW9uIHdlIGNhbiBidWlsZCB1c2lu
Zwo+IGdvLWJvb3RzdHJhcC1zdGFnZTMuCj4KPiBUaGUgcGFja2FnZSBidWlsZCBmb3IgZ28tYm9v
dHN0cmFwLXN0YWdlNCBpZiBlZmZlY3RpdmVseSBpZGVudGljYWwgdG8KPiBnby1ib290c3RyYXAt
c3RhZ2UzIHdpdGggb25seSB0aGUgR28gdmVyc2lvbiBhbmQgc3RhZ2UgbnVtYmVyIGNoYW5nZWQu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWls
LmNvbT4KPiAtLS0KPiAgcGFja2FnZS9nby9Db25maWcuaW4uaG9zdCAgICAgICAgICAgICAgICAg
ICAgIHwgIDkgKy0tCj4gIC4uLmxkdmNzLWZhbHNlLXdoZW4tYnVpbGRpbmctZ28tYm9vdHN0ci5w
YXRjaCB8IDcxICsrKysrKysrKysrKysrKysrKysKPiAgcGFja2FnZS9nby9nby1ib290c3RyYXAt
c3RhZ2U0L0NvbmZpZy5pbi5ob3N0IHwgIDQgKysKPiAgLi4uL2dvLWJvb3RzdHJhcC1zdGFnZTQu
aGFzaCAgICAgICAgICAgICAgICAgIHwgIDMgKwo+ICAuLi4vZ28tYm9vdHN0cmFwLXN0YWdlNC5t
ayAgICAgICAgICAgICAgICAgICAgfCA1NCArKysrKysrKysrKysrKwo+ICBwYWNrYWdlL2dvL2dv
LXNyYy9nby1zcmMubWsgICAgICAgICAgICAgICAgICAgfCAgNCArLQo+ICBwYWNrYWdlL2dvL2dv
Lmhhc2ggICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxNCArKy0tCj4gIHBhY2thZ2UvZ28v
Z28ubWsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIDggZmlsZXMgY2hh
bmdlZCwgMTQ3IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9nby9nby1ib290c3RyYXAtc3RhZ2U0LzAwMDEtY21kLWRpc3Qtc2V0LWJ1
aWxkdmNzLWZhbHNlLXdoZW4tYnVpbGRpbmctZ28tYm9vdHN0ci5wYXRjaAo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9nby9nby1ib290c3RyYXAtc3RhZ2U0L0NvbmZpZy5pbi5ob3N0Cj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2dvL2dvLWJvb3RzdHJhcC1zdGFnZTQvZ28tYm9v
dHN0cmFwLXN0YWdlNC5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2dvL2dvLWJv
b3RzdHJhcC1zdGFnZTQvZ28tYm9vdHN0cmFwLXN0YWdlNC5tawo+CgpMZ3RtLAoKVGVzdGVkLWJ5
OiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
