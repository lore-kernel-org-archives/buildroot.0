Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C2AC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 05:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A499C400CE;
	Mon, 18 Dec 2023 05:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A499C400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zzxk2ueLGPJl; Mon, 18 Dec 2023 05:54:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B570F40370;
	Mon, 18 Dec 2023 05:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B570F40370
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBD891BF3B8
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 05:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C193360BFC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 05:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C193360BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dCCDfYge6_tC for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 05:54:55 +0000 (UTC)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 889E260BD5
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 05:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 889E260BD5
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5e611740893so5263857b3.0
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 21:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702878894; x=1703483694;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+0gir1wVdAoRMcUFR3HAF6rJXeZbMaF/waYYpHHXUmQ=;
 b=kjv82eyViQAo2zWWU+jRKpWKGVQGVu1HQ4MoLTkmOc1sIXgInT/O1y/kkzb/fXt0mW
 jWxT8vz0QHDa5E+2qEB1SSlllV3Rtd9H3jGJPcxS0wOCjcJTQAcfLJbe+dtIL60JLgtf
 HCYg2VaO7lcmRA0uSsFfNwCuNb7jZjlmUdphaPc/Yl6aKMm+XTMxKhhyNmsq5+16IS+3
 v5xdsqlwzawMkuaDiWFHTLFIk4j169xxQEFABp9eRV8kt+WGB91J7LY/+BEeJbWsn8ju
 ZkctP4jJfEcVMvu98gO1HoSoz7IfCV8pp2+1+Podf+IJo4d/TANHDjorXSZf1veDWOK5
 p9Yg==
X-Gm-Message-State: AOJu0YwDvMsOhYe416ptegF6T5CdQC9ORMUiOPnia0n0bQdpc3bDchUT
 GJtknbjUEQ65WbxwnvuuxkwX8nphchZ0KjIQlIg=
X-Google-Smtp-Source: AGHT+IEIPY6x2UqDGgKOKC4pUNHwolte1yCrWx2oTMBbLJFdApL6u+rCOjeG8aHeePFhphU45+gmUrQyZQMC6DkUe/I=
X-Received: by 2002:a0d:d58d:0:b0:5e6:66d7:39a5 with SMTP id
 x135-20020a0dd58d000000b005e666d739a5mr1206912ywd.53.1702878894206; Sun, 17
 Dec 2023 21:54:54 -0800 (PST)
MIME-Version: 1.0
References: <CAHQn7p+q+ZEpLdDWYG6M-oLP6mSqXtE1M95MKjQQfEBtOmf6xQ@mail.gmail.com>
 <87ttoia2na.fsf@48ers.dk>
In-Reply-To: <87ttoia2na.fsf@48ers.dk>
From: Davis <davikovs@gmail.com>
Date: Mon, 18 Dec 2023 07:53:00 +0200
Message-ID: <CAHQn7pLwHQYFpYwzKd=Wzrebs2AY6jEQbJQoQHKPn2pn1BO1cA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702878894; x=1703483694; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+0gir1wVdAoRMcUFR3HAF6rJXeZbMaF/waYYpHHXUmQ=;
 b=Vnj1NC/aAAoi/Wmz2Pne2MGSbP0Vi21CctRtUKt5GSMrDscfJzvs68QfEaS5OK1yCi
 QB/PniMv0Gsgw4zxQjse2IdYQCd+8+hQjej9P7z9AyDORj30vJWakHaSjNrbC3rTFMOL
 hFCnltzBcSUt1TDHPgNjuVnhT/cmn6Gnq0B7zcXtDs6UcMBOguXEYvjMP8eFcyb8FE9c
 rfU/tv7wTxE1SWcBWevhr5NcitUnGeda7kHpi/bMO7Vz2XuHnytltqrfDN+ouJ/66nFS
 lMn2+oT9UlsUhGIIDN8JrODeWIcsAiWZz8E/W0M1RWQyBZOiciH/kTXuxL6fmJe5js5Z
 Zq4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vnj1NC/a
Subject: Re: [Buildroot] Bluez 5.71 released
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

SSBjYW4gc2VuZCBhIHBhdGNoIGlmIHNvbWVib2R5IGVsc2UgKHdobyB1bmRlcnN0YW5kcyB0aGUg
bGVnYWwgc2lkZSkKd2lsbCBzaWduIGl0IG9mZi4KQWxzbyBpdCB3b3VsZCBiZSBnb29kIGlmIHNv
bWVib2R5IGNvdWxkIHRlc3QgaXQgd2l0aCBhICJ2YW5pbGxhIiBidWlsZHJvb3QuCgpTaG91bGQg
SSBzZW5kIHRoZSBwYXRjaD8KCkJyLApEYXZpcwoKc2VzdGQuLCAyMDIzLiBnLiAxNi4gZGVjLiwg
cGxrc3QuIDExOjU5IOKAlCBsaWV0b3TEgWpzIFBldGVyIEtvcnNnYWFyZAooPHBldGVyQGtvcnNn
YWFyZC5jb20+KSByYWtzdMSramE6Cj4KPiA+Pj4+PiAiRGF2aXMiID09IERhdmlzICA8ZGF2aWtv
dnNAZ21haWwuY29tPiB3cml0ZXM6Cj4KPiAgPiBHcmVldGluZ3MhCj4gID4gTG9va3MgbGlrZSBC
bHVleiA1LjcxIGhhcyBiZWVuIHJlbGVhc2VkLgo+ICA+IEl0IGZpeGVzIENWRS0yMDIzLTQ1ODY2
OiBodHRwczovL3VidW50dS5jb20vc2VjdXJpdHkvQ1ZFLTIwMjMtNDU4NjYKPgo+ICA+IENvdWxk
IGl0IGJlIHBvc3NpYmxlIHRvIGJ1bXAgQmx1ZXogdmVyc2lvbiB0byA1LjcxIGluIGJ1aWxkcm9v
dD8KPgo+IFN1cmUsIGNhbiB5b3Ugc2VuZCBhIHBhdGNoPyBUaGFua3MuCj4KPiAtLQo+IEJ5ZSwg
UGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
