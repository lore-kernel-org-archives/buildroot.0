Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA329C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 11:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DEE960A73;
	Sat,  8 Jan 2022 11:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VwgClaEttQ4q; Sat,  8 Jan 2022 11:05:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4D7A60803;
	Sat,  8 Jan 2022 11:05:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 189FD1BF34E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 11:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F31344016F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 11:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oy6ojPkUvcIH for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 11:04:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 234134012E
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 11:04:33 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id l10so16143768wrh.7
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 03:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7Nysx1vsh2AccajbDJtqf3Pivvan23lnuxSkKfAXUWc=;
 b=75/PRW9RrH3R6KAo5vwBVwBArFr9SzfyZmH6nWoqZMgUMhu1iS9CeyfeJY1Tim50nP
 wzoqx0GGM7QjE3iIqnkdv2aN8XR1TVhe9yZSPe4yWVHB6r+3lh+zSz+TEVh2Fin6tcZL
 a0AVXhRgzUSSH/s3zV92wtACKooFHtSnN5lNQfxEqlX72wXJlXa+cKPgrs4qQMcs8J3H
 /av0wC0+BGBUl5HSWbzAd73i8Zn6uj01GdUmpB1yB7ucuj8VvdEwMy1OQFnGttdeq2DB
 NBJUszSxbyWmTkkIPfabSUT7+/2QT6BCBODU72YkWP5hEGgVArDhjtmo7wqOH03SJJqT
 J4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Nysx1vsh2AccajbDJtqf3Pivvan23lnuxSkKfAXUWc=;
 b=TlR5U3Fkf3IvAOZ8uQL5hjq24wc0AZjX5Kaimx0sqqVbAJOwKaSoN5k+mY8knhjqPU
 JHFokJVoWjObVXtVwaJ171f1oWppCe3wuEcOfvM1mmKW4thphMEDg1fCf39D7AbWwH9D
 3M6Br/5blRcnBmZHXPYPjxDIwJZH+PfpXrlO+a1W649wlTdiCIg2zWJAcUy5EymErZpE
 0E38Jkos+haj0orrs5Z+ElWZbXE2EKm0GOpWXILUVan4dFBvpWCq2bWNc2PWwyiDD8CH
 9TPobwpnmWDg/hE32jLiyeeJrBws4+kxzvehg4gJpN8bmCP/jP7BO2IGzUztHioobzHk
 uiQA==
X-Gm-Message-State: AOAM532LjFZf3p9miBZvhNrnC4y28w4S7dGkw+mT910RM/P/o1zQawNE
 n0ipwluo04wTGkoqsE6fN3i0/w==
X-Google-Smtp-Source: ABdhPJwjNy5ag7+YDQSYzqiuL+F5OUh5M5p7eqpE65iIgFATK7+GLiiIC2q2rg2POb8Hy9PxZYz2TQ==
X-Received: by 2002:adf:c843:: with SMTP id e3mr57919439wrh.38.1641639871258; 
 Sat, 08 Jan 2022 03:04:31 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id i15sm1432569wrf.6.2022.01.08.03.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 03:04:30 -0800 (PST)
Message-ID: <49065289-1e01-f807-3e4f-d5e6303de5b5@smile.fr>
Date: Sat, 8 Jan 2022 12:04:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20201126152832.1115350-1-nolange79@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20201126152832.1115350-1-nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: Allow extra config
 options
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTm9yYmVydCwKCkxlIDI2LzExLzIwMjAgw6AgMTY6MjgsIE5vcmJlcnQgTGFuZ2UgYSDD
qWNyaXTCoDoKPiBTeXN0ZW1kIGhhcyB2ZXJ5IG1hbnkgb3B0aW9ucywgYWRkaW5nIGEgd2F5IGZv
ciB0aGUgdXNlcgo+IHRvIHNldCBjdXN0b20gb3B0aW9ucyBjYW4gaGVscCBjdXN0b21pemF0aW9u
cwo+IHdpdGhvdXQgY2hhbmdpbmcgYnVpbGRyb290IGZpbGVzLgoKVGhpcyBpcyBhbHNvIHRydWUg
b2YgYW55IHBhY2thZ2UgaW4gQnVpbGRyb290LiBVc2VycyBtYXkgd2FudCB0byBwcm92aWRlIGEK
Y3VzdG9tIG9wdGlvbiB0aGF0IGlzIG5vdCBoYW5kbGVkIHlldCBieSBCdWlsZHJvb3QuCgpXaGF0
IGlmIHRoZSBvcHRpb24gcHJvdmlkZWQgaW4gQlIyX1BBQ0tBR0VfU1lTVEVNRF9FWFRSQV9DT05G
SUcgcmVxdWlyZXMgYSBidWlsZApkZXBlbmRlbmN5ID8KCkJlc3QgcmVnYXJkcywKUm9tYWluCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
