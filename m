Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA7CEB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 15:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 368274194C;
	Thu, 15 Jun 2023 15:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 368274194C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZitaneQnbX4; Thu, 15 Jun 2023 15:28:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 807A241948;
	Thu, 15 Jun 2023 15:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 807A241948
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 277ED1BF296
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 15:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DD0D41948
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 15:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DD0D41948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 46Gn4X8UQCvE for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 15:28:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 567BD40166
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 567BD40166
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 15:28:41 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-518ff822360so2495058a12.1
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 08:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686842919; x=1689434919;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YBYQPWLXMMS2F6V5d6YWwhrmvD3G0UuGvy78AV6ei4M=;
 b=bJjr9dduCbLMmHhB1j2vp33pWUmt4KpwfgjpjJgE6zZ6BD+YNJdCYCoxV+dKi1x516
 8gZPemsWHUGhdWLm16L2xB5Pis5iG1c0HPBf7H5jWDTU41gMdhmCcEfK44QLwUHssa6k
 atUhjOo2trMLQpr8QZeUucBsS+nq7j5gHunSATzfxohKKzQFhqabZbrMA7RNyzMt2rKv
 JADHVu8qR1LvmuTstIRPqy3MrRtiIQVtr7ktS8R2CxgZfIHK4PBqUa8p4PnUd51xz2hp
 pnc/Y2rDBGGBflhBgUvSFWelrq4Z3euf9ugdeW1FhLR0es0+AkPd41r3SPt7B7KkHNPJ
 nsoA==
X-Gm-Message-State: AC+VfDzferyvEl4piuynGdchaL/Gb3cEoCwpQKWVVrC52d6wWpeVc/uC
 ANskyIeSzEVzGhFxhG6013joEe5VoPLOxFlyrKk=
X-Google-Smtp-Source: ACHHUZ6Sieet0c0WyZFHnaTGuwkLVt8n1Y3H9sHXNi+skpny2XFGZWInOWKbNBZCk4bBwYLOOdnz95ZX+U5vCG4oCtk=
X-Received: by 2002:a50:fe91:0:b0:518:a5e5:47b6 with SMTP id
 d17-20020a50fe91000000b00518a5e547b6mr3691777edt.24.1686842919313; Thu, 15
 Jun 2023 08:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230612165344.3829304-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20230612165344.3829304-1-giulio.benetti@benettiengineering.com>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Thu, 15 Jun 2023 18:28:29 +0300
Message-ID: <CA+fTLhis7aZyd5WyhAqvFGCYRNLw+HvSBXqU3X2JW2AccQ==2A@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686842919; x=1689434919;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YBYQPWLXMMS2F6V5d6YWwhrmvD3G0UuGvy78AV6ei4M=;
 b=QHtsxX3rsvW+0da1aLPy4fXd7z7HkmUvqxBHMtcNBb+O2Qr/YjafgzRdOp0Q0Yh22J
 WsLJoQIgtxs8J5LTYNRgoXGUAyx4yUpuWJXhm3lbXU1U0L+tUTF5f6Hhq0TfLV6dpAvd
 cn+p1OL1CbgIK7/tepnKmpQAUfV4r7AAiBmZV2ncEKeeaEy4IdSWPlcAvvTvowGCXRWR
 8oE80Lwq8lzTXlz4pei4c6A+EB3nHGhWj5JDHDPYzHHuSSjyh0ajEiqa8/MLszMkYJ82
 pMQG6ydipdlQslo6Tv0r7qw6+50J0bOapmYQxtIBHctXHWy8Zfo68aHxlZBfjvXfB/2g
 A0TQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=QHtsxX3r
Subject: Re: [Buildroot] [PATCH] package/rtl8189fs: en/disable runtime debug
 according to BR2_ENABLE_RUNTIME_DEBUG
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S29udGFrdCBHaXVsaW8gQmVuZXR0aSAoPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmlu
Zy5jb20+KQpraXJqdXRhcyBrdXVww6RldmFsIEUsIDEyLiBqdXVuaSAyMDIzIGtlbGwgMTk6NTM6
Cj4KClllcywgdGhpcyBwYXRjaCB0dXJucyBvZmYgdGhlIGRlYnVnIG1vZGUgZm9yIHJ0bDgxODlm
cy4KCj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0
dGllbmdpbmVlcmluZy5jb20+CgpUZXN0ZWQtYnk6IEluZHJlayBLcnV1c2EgPGluZHJlay5rcnV1
c2FAZ21haWwuY29tPgoKVGhhbmtzLApJbmRyZWsKCj4KPiAtLS0KPiAgcGFja2FnZS9ydGw4MTg5
ZnMvcnRsODE4OWZzLm1rIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3J0bDgxODlmcy9ydGw4MTg5ZnMubWsgYi9wYWNr
YWdlL3J0bDgxODlmcy9ydGw4MTg5ZnMubWsKPiBpbmRleCBkZDM1YTE2NmU1Li42YjA1ODUwNzNi
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcnRsODE4OWZzL3J0bDgxODlmcy5tawo+ICsrKyBiL3Bh
Y2thZ2UvcnRsODE4OWZzL3J0bDgxODlmcy5tawo+IEBAIC0xMyw2ICsxMywxMCBAQCBSVEw4MTg5
RlNfTU9EVUxFX01BS0VfT1BUUyA9IFwKPiAgICAgICAgIEtWRVI9JChMSU5VWF9WRVJTSU9OX1BS
T0JFRCkgXAo+ICAgICAgICAgS1NSQz0kKExJTlVYX0RJUikKPgo+ICtpZmVxICgkKEJSMl9FTkFC
TEVfUlVOVElNRV9ERUJVRyksKQo+ICtSVEw4MTg5RlNfTU9EVUxFX01BS0VfT1BUUyArPSBDT05G
SUdfUlRXX0RFQlVHPW4KPiArZW5kaWYKPiArCj4gIGRlZmluZSBSVEw4MTg5RlNfTElOVVhfQ09O
RklHX0ZJWFVQUwo+ICAgICAgICAgJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfV0lS
RUxFU1MpCj4gICAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19DRkc4MDIx
MSkKPiAtLQo+IDIuMzQuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
