Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687DCC4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 04:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B219A60FD2;
	Tue, 31 Oct 2023 04:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B219A60FD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p4J9Iu-9W6_E; Tue, 31 Oct 2023 04:05:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0629460FD0;
	Tue, 31 Oct 2023 04:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0629460FD0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 413E71BF30E
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 04:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19982402E5
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 04:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19982402E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30Z6uHRw3HOp for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 04:04:56 +0000 (UTC)
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15384402AD
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 04:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15384402AD
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-7ba0c234135so739627241.1
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 21:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698725095; x=1699329895;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QlazQJ2+KREnS2lDbcpj1EVyT3KqpHYogr9cyNJFXMo=;
 b=mXU8U1y8NU+8Zsc6ATVgag8a0tqxk7EnQQMN1NrsGxAqTTX87N9c5BIlmr59hepCpH
 rslclzSVCkFZtQr2zLuGE1aAqmyn8r9dt49ua8bEAg2rcMjJ34TGdf8VK2SPJ3sLE7Ke
 Rr5b+ZqYj2nsBWcJx/t7edkKvkHB3FzC19KxdoZ26dBi7iohnFGiGGszZbYwmF+dDaxZ
 YGGM4POmUZcxz/sa2J3efFXGRexO8wCt0UjSB/46VEMaIko/cU7Ld4KmD4rfoYqUa/Wr
 h0DRb+H6qTmbv9B4HtZYrmwkxln5Iev26HnXhKaJkSMCYXKNz4bxsxn12Hizqt+jrb3R
 zw+g==
X-Gm-Message-State: AOJu0Yx3m40hkcs3tEMI5920sGMPyu0T1/M3QDWWvXEtmwUSkCOCIZIg
 ri+/Ls+jcj75uyuRvZMTMVtczjR9rLAxD5g58Rgh2Og1c50=
X-Google-Smtp-Source: AGHT+IHp9kZMFxjbciWmn7mk7oLsSax3rIg3BvgZquaXQaF0kYLrmqyvsGAkpgzdOCMYlN6qzdpLcHGUc2FcALGBLYE=
X-Received: by 2002:a05:6102:2092:b0:457:c37d:33c with SMTP id
 h18-20020a056102209200b00457c37d033cmr7042988vsr.10.1698725094474; Mon, 30
 Oct 2023 21:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231030142153.645962-1-peter@korsgaard.com>
In-Reply-To: <20231030142153.645962-1-peter@korsgaard.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 Oct 2023 14:04:27 +1000
Message-ID: <CAKmqyKNXnQbb-m4O_KjCN7amV0-wbWL+xj6gMewTQAVEYNMzPA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698725095; x=1699329895; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QlazQJ2+KREnS2lDbcpj1EVyT3KqpHYogr9cyNJFXMo=;
 b=dd5gnfYo0f5AE01aeCDRfeqR+hNE9TNbsrUgBKc+sy8EymjAhDdHD/Vb+y+xcoLP1Z
 N5ARyuONpKP69PDrlkQp4E57twqLIE3/0i1032ptR6VhqXLn8cbHXL85jaQzKIHj7zt5
 YVTAknt8yOCjogJhPAIixNpuwshYibEDS2T9cxoTgLt3zsXCVIbDgLU+IPleJB680JcJ
 UaHQn4dWLnDVeHDbgEkM1G9jrzYgm3iED6o1mCAAsAEr25kDVERkeN4Il6/Yw9QKIXXi
 U5RuIBKNk37Qw9XuToKvO9ZpEvHauvbLh1UbYOLzp/WCUCivWOXKJGjWejjRRj0vCcqA
 gNqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dd5gnfYo
Subject: Re: [Buildroot] [PATCH] package/xen: security bump to version 4.14.6
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
Cc: Alistair Francis <alistair@alistair23.me>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBPY3QgMzEsIDIwMjMgYXQgMTI6MjLigK9BTSBQZXRlciBLb3JzZ2FhcmQgPHBldGVy
QGtvcnNnYWFyZC5jb20+IHdyb3RlOgo+Cj4gSW5jbHVkZXMgYSBudW1iZXIgb2YgYnVnZml4ZXMg
YW5kIHRoZSBzZWN1cml0eSBmaXhlcyB1cCB0byB4c2EtNDM2Ogo+IGh0dHBzOi8veGVucHJvamVj
dC5vcmcvZG93bmxvYWRzL3hlbi1wcm9qZWN0LWFyY2hpdmVzL3hlbi1wcm9qZWN0LTQtMTQtc2Vy
aWVzL3hlbi1wcm9qZWN0LTQtMTQtNi8KPgo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFy
ZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KClJldmlld2VkLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxh
bGlzdGFpci5mcmFuY2lzQHdkYy5jb20+CgpBbGlzdGFpcgoKPiAtLS0KPiAgcGFja2FnZS94ZW4v
eGVuLmhhc2ggfCAyICstCj4gIHBhY2thZ2UveGVuL3hlbi5tayAgIHwgMiArLQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3hlbi94ZW4uaGFzaCBiL3BhY2thZ2UveGVuL3hlbi5oYXNoCj4gaW5kZXggNTYz
N2YwZThkOS4uZDIzNTBhYzUxNSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3hlbi94ZW4uaGFzaAo+
ICsrKyBiL3BhY2thZ2UveGVuL3hlbi5oYXNoCj4gQEAgLTEsMyArMSwzIEBACj4gICMgTG9jYWxs
eSBjb21wdXRlZAo+IC1zaGEyNTYgIGExYTI0MDkyYWQxNDY1OGVlZDQyMGI3ZDU2YjY3ZDBkOWQ1
YjMxNGU5NmMzMGE3OTliNDVmM2E3MjFmOThiZjAgIHhlbi00LjE0LjUudGFyLmd6Cj4gK3NoYTI1
NiAgNzkxNzY4MWJjNmU3NDQ3ODk4MTUxMzFmY2Y3Nzk5ZTZiODNhMGQ0NWI1ODAxYWM2NTQzMjJi
MDM3Y2U0NzJmOCAgeGVuLTQuMTQuNi50YXIuZ3oKPiAgc2hhMjU2ICBlY2NhOTUzOGU5ZDNmN2Uz
YzJiZmY4Mjc1MDJmNDQ5NWUyZWY5ZTIyYzQ1MTI5ODY5NmVhMDg4ODZiMTc2YzJjICBDT1BZSU5H
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UveGVuL3hlbi5tayBiL3BhY2thZ2UveGVuL3hlbi5tawo+
IGluZGV4IDE2OTc1M2U4OWYuLjY1MTQ0MmNmZGYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS94ZW4v
eGVuLm1rCj4gKysrIGIvcGFja2FnZS94ZW4veGVuLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICMK
PiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPgo+IC1YRU5fVkVSU0lPTiA9IDQuMTQuNQo+ICtY
RU5fVkVSU0lPTiA9IDQuMTQuNgo+ICBYRU5fU0lURSA9IGh0dHBzOi8vZG93bmxvYWRzLnhlbnBy
b2plY3Qub3JnL3JlbGVhc2UveGVuLyQoWEVOX1ZFUlNJT04pCj4gIFhFTl9MSUNFTlNFID0gR1BM
LTIuMAo+ICBYRU5fTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiAtLQo+IDIuMzkuMgo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
