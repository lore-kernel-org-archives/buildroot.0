Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A207C27C79
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 15:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A290940491;
	Wed, 19 Jun 2024 15:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSzy2eYG4EBg; Wed, 19 Jun 2024 15:12:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E2104049A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E2104049A;
	Wed, 19 Jun 2024 15:12:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 100E61BF3D2
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 15:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFE136108B
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 15:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8PL6OcWncfD for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 15:12:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.47;
 helo=mail-ed1-f47.google.com; envelope-from=jdknight@jdknight.me;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C7D5160760
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7D5160760
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7D5160760
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 15:12:41 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-57c75464e77so8386708a12.0
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 08:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718809959; x=1719414759;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TWs7MIKRQI9hjV6lpXVcCi8mJRPmApd4mYYpYwy7et4=;
 b=C6c8Z/SIIYD0UcMgiApavgJA4I7xfp2durbslZ6k9MP7Rj8l7w6yUF3WPn5xDrDB4E
 qt2uEM78gzOogbysxsSNRfoWfoZGHrJWQhADNN5PRFhoSM2S3UBjQKv0xgUG8MMBsVS/
 ZWg4G9F7+VBv0o6qjIB976wuCQep9qDQxeYI75sbicug7UN5nGfX3oLoGCS1Er9VDaEL
 hFhWy4TUTSlrpRyTOJbuddcmIUFQfT4cT5wujy6Uiax1gV8WfkGpZibyx7Wkd9ae2yq2
 WgWYWykNLB0LCZgTGMywRFVe/5sXcS691EHxUiFeHbA8XMtQl7KqtOMeRMNeNq85kUUI
 SyAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGds23O5AsKa+KWtvPfDxwgueyNFG26NbQp+/h7SC5Q4/ofKCPFU7lYtGaPdMEZ2R59BDpctNRLgjh28Qiudn53M/v58NLQw==
X-Gm-Message-State: AOJu0YwKwpHTNlczydxYRkn4Dky8JgFRTT8v7kap6oCZq/0ZbudOk6uy
 24oE/El10DKDhzoc2ZDzYgnD2ZxK2jUMGPuXnkgnlRj7aFQKSlZz+Gg3mZ8CdHNrcdxOSFzrB7S
 QQr1yKcDDjBnr0hiUhS0fZiaAoQI7sSfdNZmgAg==
X-Google-Smtp-Source: AGHT+IHJjsIXePEcGM61MJ0FYEq0dWiK76UEZRMliD3IWEnsWREQroaFsKUqrcNCo9BgfMS1v4br1LmjeDRO9ZzOwME=
X-Received: by 2002:a50:c309:0:b0:57a:3424:b36e with SMTP id
 4fb4d7f45d1cf-57d07e5aac1mr1743398a12.13.1718809959392; Wed, 19 Jun 2024
 08:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <SN4P221MB0682E582104B524681EBE0C9A0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
 <20231001103844.GK2579@scaer>
In-Reply-To: <20231001103844.GK2579@scaer>
From: James Knight <james.d.knight@live.com>
Date: Wed, 19 Jun 2024 11:12:27 -0400
Message-ID: <CALAjcgU2viMsYr_29Cmx+JsE_4fKkhgYEbvQv7t62djYbv+7sg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=live.com
Subject: Re: [Buildroot] [PATCH 1/2] package/skeleton-init-systemd: copy
 over etc-factory content
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
Cc: James Knight <james.d.knight@live.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCk9uIFN1biwgT2N0IDEsIDIwMjMgYXQgNjozOOKAr0FNIFlhbm4gRS4gTU9SSU4gPHlh
bm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiBXaHkgaXMgdGhhdCBub3QgbGlzdGVkIGlu
IHRoZSBzeXN0ZW1kIHRtcGZpbGVzLCBzbyB0aGF0IGl0IGlzIGluc3RhbGxlZAo+IHdoZW4gcnVu
bmluZyBzeXN0ZW1kLXRtcGZpbGVzLCBlaXRoZXIgYXQgcnVudGltZSBieSBzeXN0ZW1kIG9uIGEg
ci93Cj4gZmlsZXN5c3RlbSwgb3IgYXQgYnVpbGR0aW1lIHdpdGggQlIyX0lOSVRfU1lTVEVNRF9Q
T1BVTEFURV9UTVBGSUxFUyA/CgpTb3JyeSwgSSBhbSBub3QgdG9vIGtub3dsZWRnZWFibGUgb24g
dGhlIGNvbmNlcHRzIG9mIHN5c3RlbWQgdG1wZmlsZXMKYW5kIHRtcGZpbGVzIHByZS1zZWVkIGNv
bmNlcHRzIChqdXN0IHJlY2VudGx5IHN0dW1ibGVkIHVwb24gYSBjb21taXQKWzFdIHdoaWNoIHBy
b3ZpZGVzIHNvbWUgaGVscCBpbmZvcm1hdGlvbiB0byBsZWFybiBtb3JlKS4KClRoZSBwcm9wb3Nl
ZCBjaGFuZ2Ugd2FzIGp1c3QgbWUgb2JzZXJ2aW5nIHRoYXQgdGhlIGltYWdlIEkgYnVpbHQKbmVl
ZGVkIGAvZXRjL3BhbS5kL3N5c3RlbS1hdXRoYCB0byBsb2dpbi4gTm90aWNlZCB0aGUgc3RvY2sg
ZmlsZSB3YXMKc3RvcmVkIGluIHRoaXMgZmFjdG9yeSBmaWxlIGFuZCBhc3N1bWVkIGl0IHNob3Vs
ZCBoYXZlIGJlZW4gY29waWVkIGF0CmJ1aWxkIHRpbWUgKHNvbWV3aGF0IGZvbGxvd2luZyB3aGF0
IHRoZSBjYXRhbG9nLWRiIGxvZ2ljIHdhcyBkb2luZykuCgo+IEFsc28sIG5vbmUgb2Ygb3VyIHJ1
bnRpbWUgdGVzdHMgZm9yIHN5c3RlbWQgZXhoaWJpdHMgdGhpcyBsb2dpbiBpc3N1ZToKPiAuLi4K
PiBDb3VsZCB5b3UgdHJ5IHRvIGFkZCBhIGJpdCBtb3JlIGV4cGxhbmF0aW9ucyBhbmQgY29udGV4
dCwgcGxlYXNlPwoKVGhlIGxvZ2luIGlzc3VlIGFwcGVhcnMgdG8gaGFwcGVuIGluIGEgYm9hcmQg
Y29uZmlndXJhdGlvbiB0aGF0IGlzCnVzaW5nIHN5c3RlbWQsIGxpbnV4LXBhbSBhbmQgc2hhZG93
IHBhY2thZ2VzIGluc3RhbGxlZCAobm90ClNFTGludXgtc3BlY2lmaWMpLiBBbm90aGVyIHVzZXIg
aGFzIHJlcG9ydGVkIHRoaXMgc2NlbmFyaW8gWzJdLgoKRnJvbSB3aGF0IEkgY2FuIHRlbGwsIHRo
ZSBzaGFkb3cgcGFja2FnZSBhZGRzIGEgUEFNIGNvbmZpZ3VyYXRpb24Kd2hpY2ggcmVxdWlyZXMg
YHN5c3RlbS1hdXRoYCBbM10gYW5kIGxlYXZlcyB0aGUgcmVzcG9uc2liaWxpdHkgb2YgdGhlCnN5
c3RlbSB0byBkZWZpbmUgdGhpcy4gc3lzdGVtZCBwcm92aWRlcyBhIHN0b2NrIGNvbmZpZ3VyYXRp
b24gYW5kIGFsc28Kbm90ZXMgdGhhdCBpdCBzaG91bGQgYmUgdXNlZCBhcyBhIHRlbXBsYXRlIG9u
bHkgYW5kIHRhaWxvcmVkIGZvciB0aGUKc3BlY2lmaWMgZW52aXJvbm1lbnQuIEZvciBteSBib2Fy
ZCBjb25maWd1cmF0aW9uLCBJIHdpbGwgbW9zdCBsaWtlbHkKYmUgYWRkaW5nIGEgY3VzdG9tIHZl
cnNpb24gaW4gYSBib2FyZC1zcGVjaWZpYyBza2VsZXRvbiB3aGVuIEkgcGxhbiB0bwpmb2N1cyBv
biBhdXRoZW50aWNhdGlvbi1yZWxhdGVkIGZlYXR1cmVzL2lzc3Vlcy4gSG93ZXZlciwgZm9yIHRo
ZQppbml0aWFsIGRldmVsb3BtZW50IG9mIGEgYm9hcmQsIEkgZG8gbm90IG1pbmQgdXNpbmcgdGhl
IHN0b2NrCnRlbXBsYXRlLiBJIGFzc3VtZWQgaGF2aW5nIHRoaXMgZmlsZSBieSBkZWZhdWx0IHdv
dWxkIGhlbHAgd2l0aAppbml0aWFsIGJvYXJkIGNvbmZpZ3VyYXRpb25zIGF2b2lkIGxvZ2luIGlz
c3Vlcy4KClsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzMwOTE4XzE2NjYx
MjIxOTlfNjM0RjAxRDdfMzA5MThfMzY0XzFfM2ZlNjhhZmRiYjc5NTA1MTYxYWM3NmUzMWU2MDU0
ZGM0NGRkMzQwZC4xNjY2MTIyMTg0LmdpdC55YW5uLm1vcmluQG9yYW5nZS5jb20vClsyXTogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjIxMjI0MTcxOTIwLjExMjU2LTEtcmFw
aGFlbC5wYXZsaWRpc0BnbWFpbC5jb20vVC8KWzNdOiBodHRwczovL2dpdGh1Yi5jb20vc2hhZG93
LW1haW50L3NoYWRvdy9ibG9iL2NkZTA4ZTQyMmQ4YzE3OWQ0YmE2MjJkYTIyOTBjMzFlYzY0NWM2
MTEvZXRjL3BhbS5kL2xvZ2luI0wzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
