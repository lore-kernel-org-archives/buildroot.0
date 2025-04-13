Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA69C3601E
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 10:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F17E81F40;
	Sun, 13 Apr 2025 10:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wt4TOiN6J3T1; Sun, 13 Apr 2025 10:37:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 214BB8217C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 214BB8217C;
	Sun, 13 Apr 2025 10:37:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65A7D108
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 10:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BDA040544
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 10:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6I9l-vi2yq9 for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 10:37:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C2FB40137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C2FB40137
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C2FB40137
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 10:37:53 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e63504bedd0so2123467276.0
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 03:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744540672; x=1745145472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yhyAwKpP9fWM9m4CHRfPweWXVEodYLv02I3SXpPS898=;
 b=Jx+YXrcbZZh/0mlwOFNp1FXkU+Ui8UiVUjnh+NM4rqGWj2+mWYvFlYTMvAZd3KVuMq
 AbyGlpq2fNzun7y7WWPL9rT4zNDqYr82es8O7xE1zLF3DTuo6bEjgBfzNqwc/yG6FSwt
 Lhl7t7/hFMNPXEN2XHrHjohnSm7Aw1iZbTyecBHoHiknupT/QJSc+obVssiooykSz7Zr
 bTIIgrk9ZmHWnQnE+vcoS0tqM9C8b9den01viBWaqeDUD1EEUdTQL/MpIMCsU0j9/NyR
 6Y8l0ZT5ndQeAUAwNYYMTUqrqBoJu0EJ2GyLO1ANfhFWDI0D/VnQtOrkrIGJUzeD6BUf
 9iRw==
X-Gm-Message-State: AOJu0YzQXwIlois4Ungc4hnMgafHoW8ASDylQ++RqMVrG1zJylzqlhjZ
 DVItH27EWCWoMOXO055jaXHBsYa4MtpPPRhM9ZMbckc95Zw1l9pBtfvwgpo0NHhJ1LFeVZm3TfK
 6LBh5gZhcbxjLiVGBWcQqfy9ZtoF2/42z5fsAqw==
X-Gm-Gg: ASbGncsUeHl7zIcrFUAXcGoG9TlTx92lZhCRmtViI9aSvT4mD/sDGHRX1EjbsQ00k58
 GWwc/KQ++o3bNwX7yJJoZI7o82j5k6HC4EwcRENArPhY+asRcdc+NRTxWIz+dvn7WjCoDxaPEc2
 8brIunyVBrGw/zUvRn4QN1
X-Google-Smtp-Source: AGHT+IHJ8uwwRe9BcCcLhrYTNgKVMqB2xZbq/QP7T6NztQq+dryeuABpmp5LE3PnpR3r71tzqOqQVlI+ibuqqakG540=
X-Received: by 2002:a05:6902:4807:b0:e6d:f140:fa36 with SMTP id
 3f1490d57ef6-e704deca4fcmr14301745276.22.1744540671879; Sun, 13 Apr 2025
 03:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250411085817.3269572-1-dario.binacchi@amarulasolutions.com>
 <b4f47833-1907-4270-96b3-9f32c223cdbd@gmail.com>
In-Reply-To: <b4f47833-1907-4270-96b3-9f32c223cdbd@gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 13 Apr 2025 12:37:41 +0200
X-Gm-Features: ATxdqUGyNLrxWou6jnmtPTE7JWNGo3D31Ay-SjjfbkJ1asT0WPN5OFcrWzk1fYQ
Message-ID: <CABGWkvpnK4+bxAQGBRhFz1tnkRec0ar5GtuJJmf6Bc+3eZY==w@mail.gmail.com>
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais=2DPou?= <rgallaispou@gmail.com>
Cc: buildroot@buildroot.org, Bartosz Bilas <b.bilas@grinn-global.com>, 
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-amarula@amarulasolutions.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1744540672; x=1745145472;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yhyAwKpP9fWM9m4CHRfPweWXVEodYLv02I3SXpPS898=;
 b=TITxEtZ+HT3ZI73FvSqCmvlD7GT7VhUtXvvsza/SuDt9Yniy7lPGMFoyodoi6JmPVr
 LQeWktUWa7uNgL/+RAZ1PvOrJDLtnYIvCGwD175EDB/7blsZmZY1M0MY1eo5TvAWYAeR
 lrVgNgUFGK/eD73MiVEjE/U508zemzza3TQNY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=TITxEtZ+
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/stm32mp157*_dk*: bump TF-A
 to 2.10, Linux to 6.12.22 and U-Boot to 2025.04
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

SGVsbG8gUmFwaGFlbCwKCk9uIEZyaSwgQXByIDExLCAyMDI1IGF0IDQ6MTLigK9QTSBSYXBoYcOr
bCBHYWxsYWlzLVBvdQo8cmdhbGxhaXNwb3VAZ21haWwuY29tPiB3cm90ZToKPgo+Cj4KPiBMZSAx
MS8wNC8yMDI1IMOgIDEwOjU4LCBEYXJpbyBCaW5hY2NoaSBhIMOpY3JpdCA6Cj4gPiBUaGUgcGF0
Y2ggYnVtcHMgQXJtIFRydXN0ZWQgRmlybXdhcmUgKFRGLUEpIHRvIHZlcnNpb24gMi4xMCBMVFMg
dGhlIExpbnV4Cj4gPiBrZXJuZWwgdG8gdmVyc2lvbiA2LjEyLjIyIGFuZCBVLUJvb3QgdG8gdmVy
c2lvbiAyMDI1LjA0Lgo+ID4gVGhlIG5ldyB2ZXJzaW9uIG9mIFUtQm9vdCBoYXMgYWRkZWQgRUZJ
IENhcHN1bGUgc3VwcG9ydCwgd2hpY2ggZGVwZW5kcyBvbgo+ID4gR251VExTLCB0aHVzIHJlcXVp
cmluZyB0aGUgYWN0aXZhdGlvbiBvZiBCUjJfVEFSR0VUX1VCT09UX05FRURTX0dOVVRMUy4KPiA+
Cj4gPiBUZXN0ZWQgb24gU1RNMzJNUDE1N0MtREsyIERpc2NvdmVyeSBCb2FyZC4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0
aW9ucy5jb20+Cj4KPiBIaSBEYXJpbywKPgo+IFRoaXMgcGF0Y2ggdGVzdHMgZmluZSBvbiBTVE0z
Mk1QMTUuICBIb3dldmVyIGl0IGJyZWFrcyB0aGUgYnVpbGQgb24KPiBTVE0zMk1QMTMuCgpBcyBm
YXIgYXMgSSBrbm93LCBteSBwYXRjaCBkb2Vzbid0IGJyZWFrIHRoZSBTVE0zMk1QMTMgY29uZmln
dXJhdGlvbiBidWlsZC4KSW5zdGVhZCwgSSBub3RpY2VkIHRoYXQgdGhpcyBjb25maWd1cmF0aW9u
IHNob3dzIGhhc2ggZXJyb3JzIGZvciBPUC1URUUuCknigJl2ZSBzZW50IGEgcGF0Y2ggZm9yIHRo
YXQ6CgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNo
LzIwMjUwNDEzMDk1OTAwLjE5NDAzNzMtMS1kYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25z
LmNvbS8KCkNvdWxkIHlvdSBsZXQgbWUga25vdyB3aGF0IGtpbmQgb2YgZXJyb3IgeW91IHNhdz8i
Cgo+IE5vdyB0aGF0IFNUTTMyTVAxNSBhbmQgU1RNMzJNUDEzIGhhdmUgYmVlbiB0aWVkIHRocm91
Z2ggdGhpcwo+IHBhdGNoWzFdIGFuZCB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBsYXRlciBib2Fy
ZCBbMl0sIExpbnV4IGFuZCBVLUJvb3QKPiBjb21wb25lbnRzIG5lZWQgdG8gYmUgdXBkYXRlZCBv
biBib3RoIHBsYXRmb3JtcyBhdCB0aGUgc2FtZSB0aW1lLgoKQXMgZmFyIGFzIEkga25vdywgSSBk
b24ndCB0aGluayBpdCdzIG5lY2Vzc2FyeS4KRGlmZmVyZW50IHNoYTI1NnN1bXMgY2FuIGJlIHVz
ZWQgd2l0aGluIHRoZSBzYW1lIGZpbGUuCkFueXdheSwgSeKAmXZlIGFsc28gdXBkYXRlZCB0aGUg
U1RNMzJNUDEzIGNvbmZpZ3VyYXRpb24gcmVnYXJkaW5nClUtQm9vdCBhbmQgTGludXggYXMgeW91
IHJlcXVlc3RlZC4KCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJv
b3QvcGF0Y2gvMjAyNTA0MTMwOTU5MDAuMTk0MDM3My0yLWRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFz
b2x1dGlvbnMuY29tLwoKVGhhbmtzIGFuZCByZWdhcmRzLApEYXJpbwoKPgo+IEJhc2VkIG9uIHlv
dXIgY2hhbmdlcywgSSB0ZXN0ZWQgVEYtQSAyLjEyICsgVS1Cb290IDIwMjUuMDQgKyBMaW51eAo+
IDYuMTIuMjIgb24gU1RNMzJNUDEzIGFuZCBpdCBkaWQgYWxyaWdodC4KPgo+IENhbiB5b3UgdXBk
YXRlIHRoZSBTVE0zMk1QMTMgY29uZmlnID8gRG9pbmcgc28gd2lsbCBhbHNvIHJlbW92ZSB0aGUK
PiBzZWNvbmQgbGludXguaGFzaCBhbmQgdWJvb3QuaGFzaC4KCj4KPiBUaGFua3MgOikKPgo+IFJl
Z2FyZHMsCj4gUmFwaGHDq2wKPgo+Cj4gWzFdCj4gaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9i
dWlsZHJvb3QvY29tbWl0Lz9pZD1mMjFkYjJiZDgzYmYzMDczYTUwYjhiY2Q3OWFmNmU3YWVkNmZi
MDAwCj4gWzJdCj4gaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9p
ZD05ODAyZmEwYjViYWEwYjY4ZmJjNjdiYzA3YTJlNDIwNjAxMmY3MzA2CgoKCi0tIAoKRGFyaW8g
QmluYWNjaGkKClNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKCmRhcmlvLmJpbmFjY2hp
QGFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CgoKQW1hcnVsYSBTb2x1dGlvbnMgU1JMCgpWaWEgTGUgQ2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZp
c28sIFZlbmV0bywgSVQKClQuICszOSAwNDIgMjQzIDUzMTAKaW5mb0BhbWFydWxhc29sdXRpb25z
LmNvbQoKd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
