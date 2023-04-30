Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FC4C77B60
	for <buildroot@archiver.kernel.org>; Sun, 30 Apr 2023 09:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF367402D0;
	Sun, 30 Apr 2023 09:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF367402D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qbQzLRrcUoGW; Sun, 30 Apr 2023 09:01:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 070B340127;
	Sun, 30 Apr 2023 09:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 070B340127
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74C551BF3DF
 for <buildroot@lists.busybox.net>; Sun, 30 Apr 2023 09:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E3BC84153
 for <buildroot@lists.busybox.net>; Sun, 30 Apr 2023 09:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E3BC84153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9VFsHWbX-Fu0 for <buildroot@lists.busybox.net>;
 Sun, 30 Apr 2023 09:01:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7183384152
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7183384152
 for <buildroot@buildroot.org>; Sun, 30 Apr 2023 09:01:27 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bc075d6b2so1115906a12.0
 for <buildroot@buildroot.org>; Sun, 30 Apr 2023 02:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682845285; x=1685437285;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AP2ZzrCWLqC8F7HJ5BvWVWPWZouy5sxWQQUVUjKTUmQ=;
 b=eWpTRHuPaIRMO1XSlJ4INfsC4qa8C7cH6v6MTX/k0sZUmkWP7X07HMx9IvWSEKfH7A
 EP6GhHCSqVXV6VhT64UdN9BYCncVBlOROgIDrNuG47xK0k8gm0EHWNUzDtgT9Q1A8FUx
 ka+JcyILW/uEez7t6OarY9HSo3htHJFisL2loTDNEfg9anjqEdcS7VEBEQ0zdGHUUSbE
 VGmZrBAzsr9bJsQwNsgLXHOg4m6MWi4XrQaL3rg9klw2ve3oFSM+WvLew6LPZflNhqqm
 EiDJtvr6N25SlehbszC3lCCCQBOMewGTmqqgxtH0SrC4FgHlOqJQHxzZEcwZb/EyYmJ9
 JZ0g==
X-Gm-Message-State: AC+VfDx5UFYzgnPuw5sfzvTa9Uu1cYFv+VDTAsdK3bsWKBZtpDaOvDPZ
 DXnu71FWT7tH3tqkdEiBeWErRPfoQRuEuu+kTVarlsSkqtQ=
X-Google-Smtp-Source: ACHHUZ5Gq7vssGlTEdNkCyNxMYW7+LzeClNneC4os2PrkgYukul7g5bGqOsOyxYbFqPEM7dDaVaP1/ogxp09/ca2xnU=
X-Received: by 2002:aa7:da56:0:b0:50b:c380:a929 with SMTP id
 w22-20020aa7da56000000b0050bc380a929mr787075eds.10.1682845285207; Sun, 30 Apr
 2023 02:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230429124731.4014394-1-j.neuschaefer@gmx.net>
In-Reply-To: <20230429124731.4014394-1-j.neuschaefer@gmx.net>
From: Chris Packham <judge.packham@gmail.com>
Date: Sun, 30 Apr 2023 21:01:13 +1200
Message-ID: <CAFOYHZC5FVz3yRa7gpSB4ycgEgF8Zha61QVDzv9AbYmLqSngyQ@mail.gmail.com>
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682845285; x=1685437285;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AP2ZzrCWLqC8F7HJ5BvWVWPWZouy5sxWQQUVUjKTUmQ=;
 b=KvyXxpSQRtuIAwvnBEeMw72V6S1f9qtKF4D5zZbhRQoCJomHYrkyeoh84qKy1BZ1YA
 VNdtYHEIBGuHjZjlaW75IBre8YUriEX85R7YkS/UoWkaMhzq6y6Pd8YWjRlIM5gGUwnI
 X+GZ23B2csSjrdC2GNgymWEkt6oQHe3U9phFNYm9U3QbrWCjCPrt6bIC8vIwUgjxocmA
 3a4j5KhjaSImUuvzbT/or0p3qggDK2UfZwSEXfsraijUflMlp1NR2SoFGJQEdc8ytNp/
 GSrR+r7R3oysmiKh+4Z3+Gyzd2IlLPk5o0MIyH+qFnYM1GkLr0SVUF/TM5sqBeqGUku4
 yBnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=KvyXxpSQ
Subject: Re: [Buildroot] [PATCH] package/micropython: pass $TARGET_LDFLAGS
 to build
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

T24gU3VuLCBBcHIgMzAsIDIwMjMgYXQgMTI6NDfigK9BTSBKb25hdGhhbiBOZXVzY2jDpGZlcgo8
ai5uZXVzY2hhZWZlckBnbXgubmV0PiB3cm90ZToKPgo+IExERkxBR1MgbmVlZCB0byBiZSBwYXNz
ZWQgdG8gdGhlIG1pY3JvcHl0aG9uIGJ1aWxkIHN5c3RlbSB2aWEgdGhlCj4gTERGTEFHU19FWFRS
QSB2YXJpYWJsZSwgd2hpY2ggd2FzIHNvIGZhciBtaXNzaW5nLiBUaGlzIHBhdGNoIGFkZHMgaXQu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBn
bXgubmV0PgoKQWNrZWQtYnk6IENocmlzIFBhY2toYW0gPGp1ZGdlLnBhY2toYW1AZ21haWwuY29t
PgoKPiAtLS0KPgo+IChyZXNlbmRpbmcgZHVlIHRvIGVtYWlsIGlzc3VlcykKPiAtLS0KPiAgcGFj
a2FnZS9taWNyb3B5dGhvbi9taWNyb3B5dGhvbi5tayB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21pY3JvcHl0aG9uL21pY3Jv
cHl0aG9uLm1rIGIvcGFja2FnZS9taWNyb3B5dGhvbi9taWNyb3B5dGhvbi5tawo+IGluZGV4IDUx
YjQ1ZTVlOTkuLjVmNjg3YzczYjkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9taWNyb3B5dGhvbi9t
aWNyb3B5dGhvbi5tawo+ICsrKyBiL3BhY2thZ2UvbWljcm9weXRob24vbWljcm9weXRob24ubWsK
PiBAQCAtMzYsNiArMzYsNyBAQCBNSUNST1BZVEhPTl9NQUtFX09QVFMgKz0gXAo+ICAgICAgICAg
TUlDUk9QWV9QWV9VU1NMPTAgXAo+ICAgICAgICAgQ1JPU1NfQ09NUElMRT0kKFRBUkdFVF9DUk9T
UykgXAo+ICAgICAgICAgQ0ZMQUdTX0VYVFJBPSQoTUlDUk9QWVRIT05fQ0ZMQUdTKSBcCj4gKyAg
ICAgICBMREZMQUdTX0VYVFJBPSIkKFRBUkdFVF9MREZMQUdTKSIgXAo+ICAgICAgICAgQ1dBUk49
Cj4KPiAgZGVmaW5lIE1JQ1JPUFlUSE9OX0JVSUxEX0NNRFMKPiAtLQo+IDIuMzkuMgo+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
