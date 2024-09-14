Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8DAC021AA
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 18:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D2126076D;
	Sat, 14 Sep 2024 18:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ei2v3LnHWfNN; Sat, 14 Sep 2024 18:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3947060776
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3947060776;
	Sat, 14 Sep 2024 18:42:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 181301BF31D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1495F810A5
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8BJEN87ZzNM for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 18:42:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2f; helo=mail-vs1-xe2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B51981089
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B51981089
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B51981089
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 18:42:45 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-49bc7387371so1155852137.2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 11:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726339365; x=1726944165;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=twg5b3FR3PfHMCxp6TSY8KBc9pNVwKO7nGtC/luBZdw=;
 b=v0iFOdGXvZ6aITr5figuusFgMnquF9Ad14hWm9fbTL8FESRRPI/YVCGlRQfOn6IeD4
 TXb2FqeZbBnUx08eaCF7HJp00zXSr844lqvnqY/D7Uh/YvAukQ3a9q89pFqT62BIYg7P
 TZTM0nYlfb71QT0Py0yy5WN+hn+6/mYvXfdwgpkKVnsxIDCpTkyU7BIGAauMfNL6PCv+
 inpoe+qu3BL/JKVWfsIbiRiNCGEcTx78dwilgi/5XfnCaFN4nm6x+9sgaN/uX6ZYH8f6
 Z5ejMPEEYxcJVfVRvxoYf/Wfyu7HunWq1I7+SyWEo7xiJ3ERbTmroCHqmiCjGRcwg1Kh
 PaFA==
X-Gm-Message-State: AOJu0Yy3PviOdEGVQm55xJ8w5VUnnw/pkw8yQhg2AzikD3+EaDA6SLHX
 izhlk98JUUNXl1nIBUG80Vyejti8GgdMIrCYMupLOlcrWWA6bVvtkr1sGQZMHwzAusq42ugtIYj
 3YCU7heQpgeT4d2YK1u4H39HYMuI0QYVx
X-Google-Smtp-Source: AGHT+IFwxwUZVbYWfz/kKWwIC6AQGPF9BWIeofZcsRbs6GRmmxPhTnrRKC8KTlcKH+F+mpvjhXYq55oslPCBlhsdgQ4=
X-Received: by 2002:a05:6102:dcb:b0:492:a6fb:23cd with SMTP id
 ada2fe7eead31-49d41468264mr11468632137.6.1726339364597; Sat, 14 Sep 2024
 11:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240907211638.945542-1-james.hilliard1@gmail.com>
 <20240914112030.7369d08b@windsurf>
In-Reply-To: <20240914112030.7369d08b@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 14 Sep 2024 12:42:33 -0600
Message-ID: <CADvTj4pvvCKDYY10OR7vkh4Dd6BYo=sKd4qWU0H2K8f7BbPAjw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726339365; x=1726944165; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=twg5b3FR3PfHMCxp6TSY8KBc9pNVwKO7nGtC/luBZdw=;
 b=BCSoy/2WKJG7f4oFNgtrVvAhdYmcQ4WqiVO5DAEk+BHJHl670ntdG3+r1tTFq0XtCr
 PPSRWBy5EN102lwi38c99ApByVbvlEJexOk9cUYxu1g01t3KQ89jdSrfrticRylQGFZA
 juGGlrWR0ZfvMN+lYG9L0GjISE2HDpg0Im+aFBT4YR+HymTi7GilcPriQcyLH1AHT8BD
 XyNo1zaJ+v7lMkE6nMu79epuYaxgRBF4cNWTNahrteSpX21BINKgxEWeyFWCmB263aXg
 REOiFAZmsb8ZerhIiKAzf8FXinbyJngFDCj7sEfmmkY9f9QMCeO6PWx9Ft2FwqPm53vY
 9kjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BCSoy/2W
Subject: Re: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.7.1
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

T24gU2F0LCBTZXAgMTQsIDIwMjQgYXQgMzoyMOKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gSmFtZXMsCj4KPiBPbiBT
YXQsICA3IFNlcCAyMDI0IDE1OjE2OjM4IC0wNjAwCj4gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBSZXN0b3JlIGNhcmdvMiBhcmNoaXZlIHN1
ZmZpeCBmb3JtYXQgYXMgd2VsbC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFy
ZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHBhY2thZ2UvcHl0aG9u
LW1hdHVyaW4vcHl0aG9uLW1hdHVyaW4uaGFzaCB8IDIgKy0KPiA+ICBwYWNrYWdlL3B5dGhvbi1t
YXR1cmluL3B5dGhvbi1tYXR1cmluLm1rICAgfCA3ICsrKystLS0KPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IFRoYW5rcywgYnV0IGl0IGRv
ZXNuJ3Qgd29yayBmb3IgbWU6Cj4KPiBFUlJPUjogd2hpbGUgY2hlY2tpbmcgaGFzaGVzIGZyb20g
cGFja2FnZS9weXRob24tbWF0dXJpbi9weXRob24tbWF0dXJpbi5oYXNoCj4gRVJST1I6IHB5dGhv
bi1tYXR1cmluLTEuNy4xLWNhcmdvMi50YXIuZ3ogaGFzIHdyb25nIHNoYTI1NiBoYXNoOgo+IEVS
Uk9SOiBleHBlY3RlZDogOTJjNWZjMmEyNGYzMjYyM2E2OTk0MzM0YjUyM2E1ODdkY2E2M2ViYjVi
NDZhZTE0YTI1NWEyZWJjMjVmZDNmNwo+IEVSUk9SOiBnb3QgICAgIDogOWIyNWU4MjMyYjY3ZTdh
ZDg2NTJhZGZlOTVlODkwODY4ZjU2YWRmYjY1YTkzYWQ0YzJhMmNiNmE3MjM2YTk0Zgo+IEVSUk9S
OiBJbmNvbXBsZXRlIGRvd25sb2FkLCBvciBtYW4taW4tdGhlLW1pZGRsZSAoTUlUTSkgYXR0YWNr
CgpXZWlyZCwgSSBkZWxldGVkIHRoZSBhcmNoaXZlIGZyb20gbXkgZGwgZGlyZWN0b3J5IGFuZCB0
cmllZCB3aXRoIGEgZnVsbCBjbGVhbgpidWlsZCBhbmQgd2FzIG5vdCBhYmxlIHRvIHJlcHJvZHVj
ZS4KCj4KPiBDb3VsZCB5b3UgaGF2ZSBhIGxvb2s/Cj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQ
ZXRhenpvbmksIENUTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5l
ZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
