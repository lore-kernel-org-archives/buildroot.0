Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659DBC77B7A
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 06:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A968C41B9C;
	Sun, 11 Jun 2023 06:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A968C41B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MFptPQQofDu7; Sun, 11 Jun 2023 06:02:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77DF841B92;
	Sun, 11 Jun 2023 06:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77DF841B92
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4263A1BF2E5
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 06:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C08B83C10
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 06:02:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C08B83C10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPnb4K0nawwS for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 06:02:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5E0D83906
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5E0D83906
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 06:02:45 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-19f68a583a7so1506589fac.1
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 23:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686463365; x=1689055365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f1YP5Q4MAZ9HBU2+merT3ho8CJ28mqE90/K95JYwYz0=;
 b=RwY9Cqv2yOgCevSWBqVK9IF/kH7yHly0puQ7xWZ64yb3Gtbee75PWW1gSkYHBIIZlq
 6J1o5D5d70PweJ/CNfWJEjK9ezklc3z6Dpj6lYD035FvVe9964DqQ6bTDEHkTWhASpPM
 fLyYI+qehdY3vUDcsL8JHb85c/dOD4JprHQjgxNop50h//7OqsWo7cWxsRZqTq6Mg97Y
 4usRsM+CztezPowCpbwloEGQp+CBZg0nZNZyMQ9vdTXlywl+sOnNKuE7eBV35CtWd++b
 sp/igfABIGUJ5n+Z9G5auGgXcZiI92ZIxdcqtnekdzXehGCwATAOjq+Zs8XHFZdYO9MR
 3+jA==
X-Gm-Message-State: AC+VfDza2PUqIGRCer+Izv5lx8ryXnwJ0AqORNip0EIagQaibY6c1I96
 ukt9/PlO71P+Q7Ke18UHSoNyTdgTtGAK7rRS4q2+eDL//Xc=
X-Google-Smtp-Source: ACHHUZ7IYnAXq8rdL2seD4RvLaljg2d37dTHbfLoTQc7rK8FyMdPUJBIFtSUR+SnczvCG5P9ie7Ni3DciC4vpM3b8iM=
X-Received: by 2002:a05:6870:50e4:b0:19f:a340:228 with SMTP id
 s36-20020a05687050e400b0019fa3400228mr3123682oaf.5.1686463364584; Sat, 10 Jun
 2023 23:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230610181914.541374-1-james.hilliard1@gmail.com>
 <87wn0atuu1.fsf@tarshish>
In-Reply-To: <87wn0atuu1.fsf@tarshish>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 11 Jun 2023 00:02:33 -0600
Message-ID: <CADvTj4o15zSrqaWixSWjLJKEdJ7E3uaV2yoGwUXE_Q8pwaNFQQ@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686463365; x=1689055365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f1YP5Q4MAZ9HBU2+merT3ho8CJ28mqE90/K95JYwYz0=;
 b=RjeNMS5qemp77cvMqPbfcOlYcQs7rTmqew5S8/RA9o34VhvOAIR37dyFvVIGCxjK5J
 M4wKI6lKNSdh/PbmEY9VZBXsEcJp0NyfkqlvB5do0Qy63RUbTYYyyEHxQ7Ps+bwpURUY
 rZQOkeMA+q4vbUo9xUgEPdBmOBwabO1zMBb1Jst57yR+0D+98xIPbVSQ6QBoy7HoxMT6
 mBfdrpij0FEo6ral15Y86RW7Z0vIJvUmLtU3Z4bhP60D7SJeFl1jhF7M9/Xovh3gfbqw
 ljWZ+2NR3POBiZqplY37GkQGPbgYe0IRDXbcpB3yv9PymH+AudEBe3N+EVJ0UMSnHDYp
 efgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=RjeNMS5q
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: use bundled headers
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBKdW4gMTAsIDIwMjMgYXQgMTE6NDbigK9QTSBCYXJ1Y2ggU2lhY2ggPGJhcnVjaEB0
a29zLmNvLmlsPiB3cm90ZToKPgo+IEhpIEphbWVzLAo+Cj4gT24gU2F0LCBKdW4gMTAgMjAyMywg
SmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4KPiA+IERldGFpbHM6IGh0dHBzOi8vZ2l0aHViLmNvbS9z
dHJhY2Uvc3RyYWNlL2lzc3Vlcy8yNTMKPiA+Cj4gPiBGaXhlczoKPiA+ICAtIGh0dHA6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzg2Ny84Njc1YWVjYTUzNjUzZDlkNzkyMTgyYmU2
MWEyOGVhNTUwZGM1MzBkCj4KPiBUaGFua3MgZm9yIGZvbGxvd2luZyB1cCBvbiB0aGlzLgo+Cj4g
R2l0aHViIGlzc3VlICMyNTMgeW91IGxpbmtlZCB0byBtZW50aW9ucyAtLWVuYWJsZS1idW5kbGVk
IGFzIGEKPiB3b3JrYXJvdW5kLiBTaG91bGRuJ3Qgd2UgYmFja3BvcnQgdXBzdHJlYW0gY29tbWl0
IDhmNjkxMjA2ZTRhYTc2Cj4gaW5zdGVhZD8KPgo+ICAgaHR0cHM6Ly9naXRodWIuY29tL3N0cmFj
ZS9zdHJhY2UvY29tbWl0LzhmNjkxMjA2ZTRhYTc2OWNjOTllMjY0ZjFjMTVhZTY5NTY3ODlmOTEK
Pgo+IEJ1dCB0aGVuIGFnYWluIG1heWJlIHdlIGRvIHdhbnQgdG8gaGFyZGNvZGUgLS1lbmFibGUt
YnVuZGxlZCBmb3IKPiBjb25zaXN0ZW5jeT8KClNlZW1zIGJ1bmRsZWQgbWF5IGJlIGxlc3MgbGlr
ZWx5IHRvIGJyZWFrIGluIHRoZSBmdXR1cmUuCgo+Cj4gYmFydWNoCj4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+IC0t
LQo+ID4gIHBhY2thZ2Uvc3RyYWNlL3N0cmFjZS5tayB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9zdHJhY2Uvc3RyYWNlLm1rIGIvcGFja2FnZS9zdHJhY2Uvc3RyYWNlLm1rCj4gPiBpbmRl
eCA2NTE0YmZlMzU0Li45ZjZiMzMzMzE4IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9zdHJhY2Uv
c3RyYWNlLm1rCj4gPiArKysgYi9wYWNrYWdlL3N0cmFjZS9zdHJhY2UubWsKPiA+IEBAIC0xMCw3
ICsxMCw3IEBAIFNUUkFDRV9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL3N0cmFjZS9zdHJhY2Uv
cmVsZWFzZXMvZG93bmxvYWQvdiQoU1RSQUNFX1ZFUlNJCj4gPiAgU1RSQUNFX0xJQ0VOU0UgPSBM
R1BMLTIuMSsKPiA+ICBTVFJBQ0VfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgTEdQTC0yLjEtb3It
bGF0ZXIKPiA+ICBTVFJBQ0VfQ1BFX0lEX1ZFTkRPUiA9IHN0cmFjZV9wcm9qZWN0Cj4gPiAtU1RS
QUNFX0NPTkZfT1BUUyA9IC0tZW5hYmxlLW1wZXJzPW5vCj4gPiArU1RSQUNFX0NPTkZfT1BUUyA9
IC0tZW5hYmxlLWJ1bmRsZWQ9eWVzIC0tZW5hYmxlLW1wZXJzPW5vCj4gPgo+ID4gIGlmZXEgKCQo
QlIyX1BBQ0tBR0VfTElCVU5XSU5EKSx5KQo+ID4gIFNUUkFDRV9ERVBFTkRFTkNJRVMgKz0gbGli
dW53aW5kCj4KPgo+IC0tCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB+LiAufiAgIFRrIE9wZW4gU3lzdGVtcwo+ID19LS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tb29PLS1VLS1Pb28tLS0tLS0tLS0tLS17
PQo+ICAgIC0gYmFydWNoQHRrb3MuY28uaWwgLSB0ZWw6ICs5NzIuNTIuMzY4LjQ2NTYsIGh0dHA6
Ly93d3cudGtvcy5jby5pbCAtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
