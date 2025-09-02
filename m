Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82C5CA1005
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 23:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A136C41410;
	Tue,  2 Sep 2025 23:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHq4V8Eu8Tgc; Tue,  2 Sep 2025 23:04:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE9F3412B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE9F3412B3;
	Tue,  2 Sep 2025 23:04:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9251439
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 23:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B44240703
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 23:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N5At0jTSZfvA for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 23:04:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 011E3406FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 011E3406FF
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 011E3406FF
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 23:03:59 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e96eb999262so4526780276.2
 for <buildroot@buildroot.org>; Tue, 02 Sep 2025 16:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756854239; x=1757459039;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cOcTk0mh1sSNb3dYTuI/D8BtlV3HmEXK3JdmpGud/hY=;
 b=Y4oLzbYybTjJg5vnzi7soOJ3F0j25+qOfK34nugwek5kCCiQhCvzrgsNQcEawACVql
 /AytQ4KQaG3NS4AAhShcTn11JPHGB8jxHyLri8sybUS4JQvLm16WhBgJU7BT6ysAIXVL
 gskIaJ+OvkLma5LHLqVIL+eexlMUHCfRzS5gX3WkE8DpZRPq11a+KjCRJsjLVLN1YyRW
 YOF+r4UfDYvOLNfvPze9eq9gXlRmjdLd3RgyO8thlWcmFePPg48kC4Ph5rzxGNngTh7b
 8t6L8esdRvg/fhO2m8TcMPYvZWJhftQS4MaisB3A/FM7YMh1+ZnVqJrryWnMadM97FTW
 G6rQ==
X-Gm-Message-State: AOJu0Yzi4mZXeKctZb79vW/KKLREtlsolXdxuwYRQX6+cNPzHbKxWLic
 u+Hjz384m0DM/dJoGmtjgpvhzhyuYYcn059/NGNSN+ZfDZBHOmlnij4Y1609n88Ksx0YHJQLFC4
 cj29eDBz1ds55tyCF2sGyXIa1qGCek3M+u+70
X-Gm-Gg: ASbGncuUQ6lnzDM1Ly7iGE0axfvaDdqpuLdOELGYdJR9w9a2fDlSkOcLtGnXsqFHD72
 hy1GxQj48m+vBXFAEvKkzlyLeeW+4mGSyp5RWJYynJaXPkvtyoam4y6HVuUhHAckCVvQHCwWzZb
 Dq4Yuupd3hAnZi46U/qfq9u3Qnj/FhsrCb3o/v9rdoJLQAf9w9r8wuY0vozPtu6yiVYwjyXkI/N
 rLhSmc=
X-Google-Smtp-Source: AGHT+IHCVw4XW1f5CkCnNoMV+FqctF9fvRR/3SZWSKYSB5mhULjitjtleDayCXqn0aSVDo71CUZClYAmb0RBk1MoI7k=
X-Received: by 2002:a05:690c:f86:b0:71f:eece:bda8 with SMTP id
 00721157ae682-7227635a14emr139427157b3.8.1756854238610; Tue, 02 Sep 2025
 16:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250831123953.391803-1-clg@kaod.org>
 <20250831123953.391803-5-clg@kaod.org>
In-Reply-To: <20250831123953.391803-5-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Sep 2025 08:33:47 +0930
X-Gm-Features: Ac12FXyE7HOMJLXHd_CK5vmkXE1xMJJUQy1WKNhBLMqpS-QJ1gRRmoZQh2PVJZA
Message-ID: <CACPK8Xd=TLYZbtKQQBYhdhQtKAaV3OS-uqs9UKphFq3LHZGE+g@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1756854239; x=1757459039; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cOcTk0mh1sSNb3dYTuI/D8BtlV3HmEXK3JdmpGud/hY=;
 b=IPBuR7wHUHTyY7QL5O6POzU9/qi6Pn19tca9dJBtFnhBY26EiJkEm420EL92qZX3xe
 xLh7IgUGV+ZB9mA58n3azw5CVSu13kwxbBqrh7aqUoJnOrQcM/Wdi6O2VVxHmChlAy52
 uIiGwkgiNCar6VUCVY3IaH6v3IUyTV7+o8HF4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jms.id.au
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=IPBuR7wH
Subject: Re: [Buildroot] [PATCH 4/4] configs/aspeed_*: update hostname and
 /etc/issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAzMSBBdWcgMjAyNSBhdCAyMjoxMSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9k
Lm9yZz4gd3JvdGU6Cj4KPiBJbmNsdWRlIHRoZSBTb0MgbW9kZWwgaW4gYm90aCBob3N0bmFtZSBh
bmQgL2V0Yy9pc3N1ZSB0byBtYXRjaCB0aGUKPiAuZHRzIGZpbGUgbmFtZXMuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgoKUmV2aWV3ZWQtYnk6IEpv
ZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
