Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033DBC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 20:03:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A00E860E90
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 20:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A00E860E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6369E8332A;
	Sun, 25 Jul 2021 20:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6YPHznAOwqM8; Sun, 25 Jul 2021 20:03:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA252832BF;
	Sun, 25 Jul 2021 20:03:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BEAA1BF405
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 20:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28F1B832BF
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 20:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3mVUP853CZBI for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 20:02:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41A3083224
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 20:02:58 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id x14so2921342edr.12
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 13:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=CN6S+CX217XCHnkOhAOfzFDBPPG/tsal1YDdQvwzHU4=;
 b=eM6qePty46US1A+LUYJVO3MOMLjqsC3B/6QN85F20xs0MppVjrtqc9aRNdkA6AzOY7
 5j0WjF3pbdr0UtraVyeMI4TObRGDMWadl8+eazkS45VcaL3EB0wRxXwdbnoMc0KAm1Di
 uR2sSyQoVTyEQ4RFq3VaQf+5G5evtKj/B25JwhopdXh+Maqiu+kLt5q7TCXu+4P+0ofr
 oCUjeFefWtJ1hZY4OOm1BJnq0AZ7BL5qgQVk6BZCLy7gt4+yVGurerRvXnasgQp2eDin
 sR1AYbWMDDxUR/XlxW3J/04ZMFcvcxPQvWe9e1pijtogPZgTYk5I/0gW+jdDlMbmCChX
 +q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=CN6S+CX217XCHnkOhAOfzFDBPPG/tsal1YDdQvwzHU4=;
 b=VDVNUHjZjoYJUw64z6GK+JcCGgTlUxpfT/RAm8XxpQ9sWt+ONM9Qd2GEcpAl7LDVSs
 ueDQ1BEtCm+mnS2NL2/rtYtDvgSqfR9h3euXfN6n6ipiHRuOGZDK7CjOp2vlS3EX4K4A
 zxfmxC7GdNdQj74IxcPqgoTq+6dDLkfrVcE6b0EyHq85bspuo0Aq0SDNz/Qoj7G9Zzhn
 m34e27IIUc6Hcf65+GmJsFKG9WJ4bQe3/zgRoPQrDrb37Q6tyrNuA3bMWsIXzn8fjab3
 u3aQ0YsRQzpt+3xcacfP0DuB95vOYjh1vRiW22RFdcAC8R9uxpcMlHfZi37xd6LwlqIF
 doXg==
X-Gm-Message-State: AOAM531ob4VeQ4qE7ktkgVzEoMJ/11FrRK9AgSXPwi9XvB0OxhFPFccL
 J8Wy4AVQo3vtxj39BqUulnCiuXqhUjQw+g==
X-Google-Smtp-Source: ABdhPJwFrta/dTqZklA+v6zrlMwOPKjbXD3jgfxf8Hy04O98CXh87hlCBYeJYXSOILK4cQxQpS0QOA==
X-Received: by 2002:aa7:ca57:: with SMTP id j23mr17236036edt.224.1627243376333; 
 Sun, 25 Jul 2021 13:02:56 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id e27sm3224462ejc.41.2021.07.25.13.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 13:02:55 -0700 (PDT)
Date: Sun, 25 Jul 2021 22:02:53 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YP3DbeAxo8Ynjitn@pevik>
References: <YP29mbZnR6ENTNsC@pevik>
 <9E170EEE-7976-42E3-AD7E-62B4715BAC00@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9E170EEE-7976-42E3-AD7E-62B4715BAC00@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: fix time_t on 64-bits
 platforms build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgR2l1bGlvLAoKPiBIaSBQZXRyLAoKPiA+IElsIGdpb3JubyAyNSBsdWcgMjAyMSwgYWxsZSBv
cmUgMjE6MzgsIFBldHIgVm9yZWwgPHBldHIudm9yZWxAZ21haWwuY29tPiBoYSBzY3JpdHRvOgoK
PiA+IO+7v0hpIEdpdWxpbywKCj4gPj4gUGxlYXNlIGRyb3AgdGhpcyBwYXRjaCBzaW5jZSBJ4oCZ
bSBnb2luZyBhbm90aGVyIHVwc3RyZWFtIHBhdGNoLgo+ID4gWWVwLCBJIGZpcnN0IHNlbnQgbXkg
cGF0Y2hlcyB1cHN0cmVhbS4gSSBzaG91bGQgaGF2ZSBDYyB5b3UsIEknbGwgdHJ5IHRvCj4gPiBy
ZW1lbWJlciBmb3IgbmV4dCB0aW1lLgoKPiBBaCB0aGV54oCZcmUgeW91cnMsIEkgZGlkbuKAmXQg
aGF2ZSB0byB0aW1lIHRvIGNoZWNrLgoKCj4gPiBBbHNvIGZlZWwgZnJlZSB0byBiYWNrcG9ydCB0
aGVtIHRvIEJ1aWxkcm9vdCBhbmQgcGxlYXNlIENjIG1lIChzbyB3ZSBkb24ndCBzZW50Cj4gPiB0
aGUgc2FtZSBwYXRjaCBib3RoKS4KCj4gU3VyZSwgZ29vZCBpZGVhLCB0aGFuayB5b3UuCgo+IEni
gJltIGdvaW5nIHRvIGJhY2twb3J0IHRoZW0gdG8gYnVpbGRyb290IHRoZW4uCgorMS4gVGhhbmtz
IQoKS2luZCByZWdhcmRzLApQZXRyCgo+IEJlc3QgcmVnYXJkcwo+IEdpdWxpbyBCZW5ldHRpCgoK
PiA+IEtpbmQgcmVnYXJkcywKPiA+IFBldHIKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWls
ZHJvb3RAYnVzeWJveC5uZXQKPiA+IGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0
cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
