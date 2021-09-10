Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37AEC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:00:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5D0661208
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5D0661208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D02084A0F;
	Fri, 10 Sep 2021 21:00:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lUQR50aO75Je; Fri, 10 Sep 2021 21:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB6888499C;
	Fri, 10 Sep 2021 20:59:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D7901BF2A7
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D28E8499C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z794OA0ZS04N for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 20:59:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67B5B83B3E
 for <buildroot@busybox.net>; Fri, 10 Sep 2021 20:59:56 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id e21so6777896ejz.12
 for <buildroot@busybox.net>; Fri, 10 Sep 2021 13:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=aB3JmmsI/gajt6p2Vg2cudlz9FyoQh/g+fyCi3VlNXk=;
 b=LJNdcV2IDGnhgQdmrilGQsEBTWHtg2lxTWL74zjI0sKX1Aiv/am84sVhn/gEUxrf1h
 IA8OZpzBM8GfwpC4useJRMe6i4O+t9byRzRcl1PgldlAI3raZIQH5UBveDaZUzMX1lKE
 zR1RjSeO/Qsz+jmgbVJ3+jPF4bAhEgrFaGVEsLwSNdN4K2eb/F7hVkt9n80Z8x9hlVrz
 arZYDNURcNUGGGPpR/IYsJ6gB2Ydc3hOj6aEKlXEuPckW6/yfp788+8nQtfZdcgPjk7i
 aCN/mpcuu/GNXQ3ExeWPy/g5DH+azzZgDKDmlThXJAa6R3qLVYTAAFKY7ytl/y56PAQK
 XZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=aB3JmmsI/gajt6p2Vg2cudlz9FyoQh/g+fyCi3VlNXk=;
 b=r8K5GfBO/CIS+ZQq8ij85JxMeF4Lch3xAEBl+bnMQYGZjB6OMN5WTtXTsnk45dw2MV
 frcN6ZkQApdP9OjuiJaUIjKSk70pFoHgnwbncvfXZyBFCtM45JRJFZsPoP7kWKPXomRX
 ETUwgL0UeIegb/+YnwI6P3Zctg5s8Noi3hBCYeTkJ3UNRmNT80YwJcYp60dQ1iMFqJEx
 a9ZkjqGhtq3wXaITWkUalH4Ky875WwlYn66AFIvJzaw56Lz1hl92vV5s/Ofk0Jlkb7ZZ
 xXUUD/JKSqbi/lsS5oTPZxKh9EnZ+HmOtu1mKyfPRQyN3Ntm9pqkDVlpGDYI0KRz3g8b
 gutg==
X-Gm-Message-State: AOAM530ZQWWwRxPpzx6F3r4LUryzqPEeeV6AUqK0bxAykATw3m4aaaY1
 +MnuYhrrZZeakKZTFsiY21s=
X-Google-Smtp-Source: ABdhPJy3+n7Jpg+sVb369znlS3he+XQP3RLmlOcn/jkgPG4IiCq1gwr0w4lwipSN+Yxko9BKcAWk8g==
X-Received: by 2002:a17:907:2a85:: with SMTP id
 fl5mr11240855ejc.91.1631307594675; 
 Fri, 10 Sep 2021 13:59:54 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 b8sm3342564edv.96.2021.09.10.13.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 13:59:53 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOncm-0002QB-2L; Fri, 10 Sep 2021 22:59:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <87ilz8ad2f.fsf@dell.be.48ers.dk>
 <DA971654-1893-453C-A37D-BC4C6E772195@benettiengineering.com>
Date: Fri, 10 Sep 2021 22:59:52 +0200
In-Reply-To: <DA971654-1893-453C-A37D-BC4C6E772195@benettiengineering.com>
 (Giulio Benetti's message of "Fri, 10 Sep 2021 21:40:51 +0200")
Message-ID: <87a6kk6t9z.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 2.9.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net, Francois Perrad <fperrad@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Pj4+Pj4gIkdpdWxpbyIgPT0gR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGll
bmdpbmVlcmluZy5jb20+IHdyaXRlczoKCiA+IEhpIFBldGVyLCBGcmFuY29pcywKID4+IElsIGdp
b3JubyAxMCBzZXQgMjAyMSwgYWxsZSBvcmUgMTM6MjQsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJA
a29yc2dhYXJkLmNvbT4gaGEgc2NyaXR0bzoKID4+IAogPj4g77u/CiA+Pj4gCiA+Pj4+Pj4+ICJG
cmFuY29pcyIgPT0gRnJhbmNvaXMgUGVycmFkIDxmcGVycmFkQGdtYWlsLmNvbT4gd3JpdGVzOgog
Pj4gCiA+Pj4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRA
Z2Fkei5vcmc+CiA+Pj4gLS0tCiA+Pj4gcGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5oYXNoIHwg
MiArLQogPj4+IHBhY2thZ2UvaGFyZmJ1enovaGFyZmJ1enoubWsgICB8IDIgKy0KID4+PiAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKID4+IAogPj4+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2hhcmZidXp6L2hhcmZidXp6Lmhhc2ggYi9wYWNrYWdlL2hhcmZi
dXp6L2hhcmZidXp6Lmhhc2gKID4+PiBpbmRleCA3NzRiMzEwNGEuLmExMDFmM2U3ZCAxMDA2NDQK
ID4+PiAtLS0gYS9wYWNrYWdlL2hhcmZidXp6L2hhcmZidXp6Lmhhc2gKID4+PiArKysgYi9wYWNr
YWdlL2hhcmZidXp6L2hhcmZidXp6Lmhhc2gKID4+PiBAQCAtMSwzICsxLDMgQEAKID4+PiAjIExv
Y2FsbHkgY29tcHV0ZWQKID4+PiAtc2hhMjU2ICBkNTg0NjEzOTVjZTI4YjlkYzAzOTAzMjU0Mzc0
ZGQ3MGMzOGM4YzI4YzUwNDZkYjEyM2MwOGY3YWI5NDE3YmU3ICBoYXJmYnV6ei0yLjguMi50YXIu
eHoKID4+PiArc2hhMjU2ICAzZTFjMmUxZDJjNjVkNTYzNjRmZDE2ZDFjNDFhMDZiMmEzNTc5NTQ5
NmY3OGRmZmY2MzVjMmI3NDE0YjU0YzVhICBoYXJmYnV6ei0yLjkuMC50YXIueHoKID4+PiBzaGEy
NTYgIDQzNDVlMTczNWY4YmM2ZDgxMmZlZDUxODBjYWJiNWE1ZTg4YTQxMDlkMzMyNjUyZjJhNDVj
MTNjZmE1ZWU2OTIgIENPUFlJTkcKID4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9oYXJmYnV6ei9o
YXJmYnV6ei5tayBiL3BhY2thZ2UvaGFyZmJ1enovaGFyZmJ1enoubWsKID4+PiBpbmRleCBjN2Y1
ZGZlOWQuLmNjYjBkOTQwZCAxMDA2NDQKID4+PiAtLS0gYS9wYWNrYWdlL2hhcmZidXp6L2hhcmZi
dXp6Lm1rCiA+Pj4gKysrIGIvcGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5tawogPj4+IEBAIC00
LDcgKzQsNyBAQAogPj4+ICMKID4+PiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogPj4gCiA+Pj4g
LUhBUkZCVVpaX1ZFUlNJT04gPSAyLjguMgogPj4+ICtIQVJGQlVaWl9WRVJTSU9OID0gMi45LjAK
ID4+IAogPj4gRG9lc24ndCBoYXJidXp6IGZvbGxvdyB0aGUgZ25vbWUtc3R5bGUgb2RkIHZlcnNp
b25zIGFyZSBkZXZlbG9wbWVudAogPj4gdmVyc2lvbnM/IElmIHNvLCBkbyB3ZSB3YW50IHRvIGhh
dmUgMi45LnggaW4gQnVpbGRyb290PwoKID4gSXQgZG9lc27igJl0IHNlZW0gdG8gZm9sbG93IHRo
YXQgc2NoZW1lIGFueW1vcmUgc2luY2Ugc29tZSB0aW1lLgogPiBJZiB3ZSBjaGVjayB3aGF0IFVi
dW50dSB1c2VzIGluIGxhc3QgdmVyc2lvbnM6CiA+IGh0dHBzOi8vcGtncy5vcmcvc2VhcmNoLz9x
PUhhcmZidXp6CiA+IHRoZXnigJlyZSBlaXRoZXIgb2RkIGFuZCBldmVuLgogPiBVYnVudHUgICAg
ICAgICAgSGFyZmJ1enoKID4gMTguMDQoTFRTKSAgICAgMS43LjIKID4gMjAuMDQoTFRTKSAgICAy
LjYuNAogPiAyMS4wNCAgICAgICAgICAgICAgMi43LjQKCiA+IFNvIEkgdGhpbmsgd2XigJlyZSBm
aW5lIGZvbGxvd2luZyBldmVyeSByZWxlYXNlLgogPiBBZnRlciB0aGlzIHBhdGNoIHRoZXJlIGlz
IG1pbmUgd2l0aCB2ZXJzaW9uIDIuOS4xCgpBaGgsIG9rIC0gU29ycnkgdGhlbi4gSSdsbCBnZXQg
dG8geW91ciAyLjkuMSBwYXRjaCB0aGlzIHdlZWtlbmQuCgotLSAKQnllLCBQZXRlciBLb3JzZ2Fh
cmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
