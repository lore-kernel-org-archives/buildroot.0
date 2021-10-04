Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EC9C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 06:48:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14931613A0
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 06:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14931613A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3F1561B03;
	Mon,  4 Oct 2021 06:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SNWUiEb-Yzb3; Mon,  4 Oct 2021 06:48:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D75D61B01;
	Mon,  4 Oct 2021 06:48:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA2B41BF3BD
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 06:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A94D761B01
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 06:48:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9HVlSM5Mijrp for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 06:48:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAD9761AFE
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 06:48:18 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 k21-20020a05600c0b5500b0030d6ac87a80so1327653wmr.0
 for <buildroot@buildroot.org>; Sun, 03 Oct 2021 23:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NGD3Pf81MGVR1FVKfUtJUJL9vl4bFZ5EbcjnTmlAOBw=;
 b=oki4Y3VtfwYqInRM+OJKZ5zyj15B+w90c0YnfoXu9pJ0GDxo+4UPeEP5Aj7rX+/Adv
 sMwn6j/yorcUcDHU1HNfFRZPYGrLxVrEmJt3EVqhdl8DmDX4t+c9OXEdq1ZQxGNsjmKU
 T/Kiby3aQ37/J+OeQDjShzzetN+ofaScUC3aJUGQl+gvlxvUhHIwm93ROCqJUacxvTyh
 xsTJaYMGbWtQP+EJf5D8dm2dkLsl6JKrNNZfLgEVagMlKldmROkZLUDceWhhNW+9gts/
 2U6/htRNbTdPFZdyLEiWVsBiVjSPJdWOWc+tXJ2ePWFVn5HPzXHa+G8BVE4Udzb9/rMS
 wZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NGD3Pf81MGVR1FVKfUtJUJL9vl4bFZ5EbcjnTmlAOBw=;
 b=zbJoO1xKnUGwb6hQ45zQfg9Mut54BhjDKHpaBuG37g/6n7rTpbwlqWHifBSWL5tRMN
 qU5GxlaoMFVSfxo3ITyqEXOjssPc4FYalsUm7oXffbp8eExmdm+wMVYIUmCQp/uARPSv
 Q7SGLy5j4ud7Ipp8dgUVkbzSNVLFbaT8X08I8ZxnF37HXgtxIDiptk7Ck7GkKeQTc5dn
 Y1rJ1cidYMbgV31LS+4Ma9ix4WLFf5ODv9jBwjJxisWZfp26a3M5SiLBDpkOG+tcRxbO
 0iirNfOz1NfMBTUQmXV48vVB02Y4s2qO4+yP0L/Lv+0IUIq+MLWlYTwPf7tskVezQkhF
 78dQ==
X-Gm-Message-State: AOAM531r+LjQquSs8H1UXrZxHu3JTMzS3Xeg0ic9/z9JA2sZkSk6hrPU
 RnKDT1PdqVTXfC7vhXBi7RREaDugA/So9LsQmGzhaOaVL4ibIw==
X-Google-Smtp-Source: ABdhPJw8zSqwO6u7yml0bcUhToA7CpPiYadTywNyVVjY7qqeeqRhk6QEJ0Bj9jQBsCV73NcnNP3kEWS3n/h8ftoNep0=
X-Received: by 2002:a7b:c11a:: with SMTP id w26mr2060796wmi.99.1633330096851; 
 Sun, 03 Oct 2021 23:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAGN0SiFsNW+JZ=bgy4t7Ef63w3YkGr6MEkpa4tzFJuV9JMGhiw@mail.gmail.com>
 <20211003220119.37f6e642@gmx.net>
In-Reply-To: <20211003220119.37f6e642@gmx.net>
From: Jianhui zhao <zhaojh329@gmail.com>
Date: Mon, 4 Oct 2021 14:48:06 +0800
Message-ID: <CAGN0SiH8eNfRnScTHM5Eqq=_TvuLy06rbzCkK3Su34BsLJnrDA@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/rtty: bump version to 8.0.0
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWVzLCB0aGF0J3MgaXQuCgpQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+IOS6jjIw
MjHlubQxMOaciDTml6XlkajkuIAg5LiK5Y2INDowMeWGmemBk++8mgo+Cj4gSGVsbG8gSmlhbmh1
aSwKPgo+IE9uIEZyaSwgMSBPY3QgMjAyMSAxNToyMDoyNiArMDgwMCwgSmlhbmh1aSB6aGFvIDx6
aGFvamgzMjlAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gU2lnbmVkLW9mZi1ieTogSmlhbmh1aSBa
aGFvIDx6aGFvamgzMjlAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgcGFja2FnZS9ydHR5L3J0dHku
aGFzaCB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ydHR5L3J0dHkuaGFzaCBiL3BhY2th
Z2UvcnR0eS9ydHR5Lmhhc2gKPiA+IGluZGV4IGIyZTlkYjI0MzYuLjFiNDZhZmY0N2MgMTAwNjQ0
Cj4gPiAtLS0gYS9wYWNrYWdlL3J0dHkvcnR0eS5oYXNoCj4gPiArKysgYi9wYWNrYWdlL3J0dHkv
cnR0eS5oYXNoCj4gPiBAQCAtMSwyICsxLDIgQEAKPiA+IC1zaGEyNTYgIDliYzVkMzBkZmE5YmQ2
NjRhNjI3MTFiNjIyOWY0NzUwNWI4M2FkYjM2NDkwN2YyNGUzYTQwNGFhZDUyYTQ4MDIKPiA+ICBy
dHR5LTcuNC4wLnRhci5nego+ID4gK3NoYTI1NiAgYjljNTU1MDA1Yjc2YzFhZDBmNWFmODkxOTY0
Mzc1YmJkZjUwZWUyMmI5YTlmNTNkZGQ0OGQyY2RiNGU1M2I0OQo+ID4gIHJ0dHktOC4wLjAudGFy
Lmd6Cj4gPiAgc2hhMjU2ICA5OWVmZWQ0YmJjMGI2MmY5NmY5OTllZjIzMzk5ZTM4MjM0ZmI5MTY1
MWFmNzM0ZmQzODlhNTJiMDMzYTg1YjU1Cj4gPiAgTElDRU5TRQo+Cj4gQ2hhbmdlIHRvIHBhY2th
Z2UvcnR0eS9ydHR5Lm1rIFJUVFlfVkVSU0lPTiBtaXNzaW5nPwo+Cj4gUmVnYXJkcywKPiBQZXRl
cgo+Cj4gPiAtLQo+ID4gMi4yNS4xCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
