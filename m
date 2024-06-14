Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2E9C27C6E
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 22:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97B8C404FF;
	Fri, 14 Jun 2024 22:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUbQsYiIeuyR; Fri, 14 Jun 2024 22:26:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B49D40525
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B49D40525;
	Fri, 14 Jun 2024 22:26:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 027901BF31C
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 22:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF0884172A
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 22:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XklBU6rz7ImI for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 22:26:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.48;
 helo=mail-ed1-f48.google.com; envelope-from=jdknight@jdknight.me;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ACDBE41722
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACDBE41722
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACDBE41722
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 22:26:08 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-57c68682d1aso2841039a12.3
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 15:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718403966; x=1719008766;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=48svVDPjE//2yoti/CPqQOUxcTymbZ9gHHGUkQVpdP8=;
 b=vDZScdA15fu1WAZckDiau2ujUjlkfjFpVJdtLdBxxbDU9UcSXthjTZoJB8lzuUPot0
 c0sVLXSZ6rzXdcXpxNuGxWGWd1koNC9IO6/oMfz0eLfWBWF84lrcQ0f6ybPgmVDtN9dL
 dD/UcHocXgrLmF3PKM0nGYpFHUS15CFTnmVhm/gDqXYedItnNSL6iwAjEuJ+BZV6+6B2
 gutIyCk5jXWRQixc67x0sLb587bqoRcZRMvOv8m5M3RoAb6UpXZ91TeIS/5k4rdzvXdy
 DGUF0ANFFqHEkGN7jtwtWlkJ1nf+s73w0UWg2zCN5mcNuPbriabCi1RfdIXkcS1O4lq0
 QqFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOyGchy+TFfHMohjp4PzsfABwKHdQxX3bsJhttWAleUEnwvDmJ80+gLvnISsZB42zlxKSzYMQxFzPJaogYIJj4P0uHJV3zvQ==
X-Gm-Message-State: AOJu0Yxc3SidQsygWqhOM/EVWTHTa4t9+m9bIfVLD0a+jkKM7RDkzrH3
 7aSFX6667YCQY6tMYzvz7K3KUMva5cGZ4kdtbGwb2fm9W0SIW4aw7wk5cMG81n68LQnkwae17sj
 xpScnf7jxHNmuYrLMnuci4+lz5DJzdpkh3bGNSA==
X-Google-Smtp-Source: AGHT+IGDiXWtjBkiRWnBwGMoCGTWlJMSe7AhfBi9S/sMnBELL4w7L2s857W6M2m+ZGIAgXd8vWkLJWCssatIANv16h8=
X-Received: by 2002:a50:8d0c:0:b0:57a:2537:a730 with SMTP id
 4fb4d7f45d1cf-57cbd6527fbmr2280917a12.4.1718403966263; Fri, 14 Jun 2024
 15:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <CALAjcgXZKYjpsFV1E7Ry-0N5NEGV01hebSb8tEgoAtHvkfvCOA@mail.gmail.com>
 <645d83bb-1760-4632-b48a-03f94c7e716a@grenoble.cnrs.fr>
In-Reply-To: <645d83bb-1760-4632-b48a-03f94c7e716a@grenoble.cnrs.fr>
From: James Knight <james.d.knight@live.com>
Date: Fri, 14 Jun 2024 18:25:56 -0400
Message-ID: <CALAjcgWZJgL7Kg_3aNOz3=O+_0xmAigE3M5R_Z4vW5COcf6SEQ@mail.gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=live.com
Subject: Re: [Buildroot] inquiry | configuring for a specific linux lts
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

RWRnYXIsCgpPbiBGcmksIEp1biAxNCwgMjAyNCBhdCA0OjU54oCvUE0gRWRnYXIgQm9uZXQgPGJv
bmV0QGdyZW5vYmxlLmNucnMuZnI+IHdyb3RlOgo+Li4uCj4gTm90IHN1cmUgdGhpcyBhbnN3ZXJz
IHlvdXIgcXVlc3Rpb24gYnV0LCBpbiB5b3VyIHBlcnNvbmFsIGRlZmNvZmlnLCB5b3UKPiBkb24n
dCBuZWVkIHRvIGtlZXAgYEJSMl9ET1dOTE9BRF9GT1JDRV9DSEVDS19IQVNIRVNgLgoKSSBhcHBy
ZWNpYXRlIHRoZSBzdWdnZXN0aW9uIChhbmQgSSBpbWFnaW5lIGl0IHdvdWxkIHdvcmspLiBBbHRo
b3VnaCwgSQphbSBob3BpbmcgdG8gaGF2ZSBteSBjb25maWd1cmF0aW9ucyBzdGlsbCBkb3dubG9h
ZCB0aGUgYXJjaGl2ZQp2ZXJzaW9ucyB3aXRoIGBCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFT
SEVTYCBlbmFibGVkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
