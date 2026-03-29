Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E853EFC97E8
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 19:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ACF360A62;
	Sun, 29 Mar 2026 19:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yi-74_JBcCSb; Sun, 29 Mar 2026 19:19:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6A7B607C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774811981;
	bh=8ot6Ve2sHOeB7KcdTUaco4viP1WFaEjDeCtYiTwchNM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pRsDTokMydRpiRzzL9db84Yoc2ZByY311ea9J+3YhtUv4A8gIzlNvsfOJuK3CPh+w
	 QvLzcr8cKJ/ahsb44CC9RkN0CNc43+ULLmqOfojz+HGoRp6nkE6P33GfPpt08DgZU7
	 +TagjbLAhR8Acm1GUijosMgKYw+veTCjmgV+mxKemgxWURZndergt30hHtSXW1ng/q
	 kZO1cDMeQrtdCdvmtpGzrZhfJYVKzJkGByTV0vmljCYaAMDkYCJCs4skCi94Lkfei+
	 4C0jHDUiWFr+Wp0u4+lkL5uZ9NKvqK3bewS3ueDk4BrsZnqAe0gfXleZSrGJQA7AOn
	 T8f5i3Tg/QlYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6A7B607C0;
	Sun, 29 Mar 2026 19:19:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3EED1D3
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 19:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 956FD607C0
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 19:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZGyyLmXUkVs for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 19:19:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=a.p.dicarlo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ABCA160719
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABCA160719
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABCA160719
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 19:19:38 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-661cfb9f3aaso5555640a12.2
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 12:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774811976; cv=none;
 d=google.com; s=arc-20240605;
 b=CO6Ifxu4V6bDUgtMjz2ARTtmrGpw6LfL4iDHP9JZR4CpHiXCr5mJ5zYqG7BHyjUIq6
 NHinb1VanIztKgrrQ0Z48nZcE2HBRBivd8G4fydF5WcP1utRNDOR3Sl1qpA6P60flg6O
 UNyYWvPaXTC9l1MjfCtYQ8Lxjmq2+VECmfttCck9jbBDRvjd0p5d20lnn4cxta3YFyTG
 WY1fCdR0ZuJyQRQ8X1gN7e/yhz6i/Jf7D/gSpm8D2iBAhGRA1hcfIPCNyvj7z1bxTg5z
 g2nx3XlaZpBrYodPrhEpyQhF9BGbDzkhC7UbfIdQRQMRxvbGB9XkUA5US6D4HUlGG2eM
 MEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ImsXaWq/KNgd0Qa92rjbaaVYVDvK46OyaiLwU6T5hLQ=;
 fh=WMMirCp0IvTESJms/QIymyUekEPCI12ylFwTpt51H/Y=;
 b=KT6LHfwdBc0sJli/5lNR3cp31gpH+HM/aXYFPo5IXIrmdsEKU53B1OdLDVzkuJoF9e
 N/pSIVWD8vuwr5IUkk43Ui8HfJBbgUo3cevgpc0k1VmBc+8BkO7P9xCjG9/QOQ7691qW
 jkVwqbNqmQqKHyiRwOaFBTqgcwX8EjhTPx556n6umLhJr4q+lypB1S2ZG0B3QpCa5NcR
 Suu1/+feWrF0MGDtOMjkAVy9qZUicuJXZCVssC8whD/K+8TjZeNQn94UGNc74fkheH8N
 Ieqc2/yBhgG97amNGMtn6KtkVxsTJofxXaozAzU6vzWVt8WOujYObwr3j6I9N5wiD5oW
 mwRA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774811976; x=1775416776;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ImsXaWq/KNgd0Qa92rjbaaVYVDvK46OyaiLwU6T5hLQ=;
 b=tDKrws0FTC7awTBrhMUluVlZUNZX4ETLM8Tpltv3yWcLxNYvlhodU3c+6rrlLUKvbP
 349qIPojP2BEE+OtTO9c87rT5imBHzLCYT7NFVfWqVhHwuNxqPJtT4TdpAMnAmJk0/64
 Y7r8QhANVz9cBsq2XBnP8fdPZritBZSZsY3HzKN1o9bA/+pB4OjjPP0crPFWC2yRQ8Vy
 yCPbKaqPviM8qu40WCmO7Aky48jyla7F8HrOVZmrXXmfmar1uNiYWsiuajQsIUaFwiMx
 q0UkbY+6n7Cjbcg/D2d/9X9qzZ9VjS5yL1AeKv+sBX8HgcDG48Dk+bDxJHQ1750oQ32+
 7aUQ==
X-Gm-Message-State: AOJu0YzTCUcKm1MyR5q3XRE39K3KxljeiLVf5fAuYgQSRZBGFfF2VGqz
 UyVk36SoODvM5cflXkL4XPXaRnLj3OKei52ARm7uC0SyzG85BGyPqQ1Y4naz0hjXf0mwK88nLaQ
 49Q1VXOgihefji9pdIKnyDhkap/8p0gLkbJBG
X-Gm-Gg: ATEYQzyeSEqrnHw+BXdLZ1ZpbHMB//TgXwyXa89Xx0eTrG8iNAq9JWTTB3X2pbXq+Wn
 m7oo5q9owHIVAYEt4+O5NEo7qZ9oBlljk36xp7Wp3KEjrayvk5y6mnOvnv9nCe/eC1tWbIqmJAG
 sad4M1CieZxoso7XVLe4VsXR2kX00uGA9/eVzaEEFT5SDkKMRU+F4T9OTEpXlthjwOmtHpuK/+Y
 4NAg4IUZwWiOK5zLjkD2f/IC4lVUZ70E5fLgQ8pBuIN4u+Abhcyrlc+NW6fxGL2PuxKpgR504/G
 HN9mKShZ6yjCmPb4k3ZSOq4E1A6KILXIhbk453vZ4w==
X-Received: by 2002:a05:6402:1461:b0:66b:b6e2:66e1 with SMTP id
 4fb4d7f45d1cf-66bb6e2687bmr1677331a12.18.1774811975706; Sun, 29 Mar 2026
 12:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260319022906.47253-1-a.p.dicarlo@gmail.com>
 <20260329154709.539516-1-a.p.dicarlo@gmail.com>
 <20260329154709.539516-2-a.p.dicarlo@gmail.com>
 <e08de844-666a-46f0-b178-4f378834855a@gmx.de>
In-Reply-To: <e08de844-666a-46f0-b178-4f378834855a@gmx.de>
From: Adam Di Carlo <a.p.dicarlo@gmail.com>
Date: Sun, 29 Mar 2026 15:19:22 -0400
X-Gm-Features: AQROBzDbHcAx7OeGL4i_CAO-JLMs5dXBMBqw6AyixdVr4s3X-i8akHyHvJBAV8A
Message-ID: <CAN5AvA=5cK--+DjnHjZsNiH6sYWXewYzjkAFELn_EhaDeHC-ww@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774811976; x=1775416776; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ImsXaWq/KNgd0Qa92rjbaaVYVDvK46OyaiLwU6T5hLQ=;
 b=h03DEWPNzsPQqcNnHlxr5XhSZRIVYF6D4hl4d2ITwhR7mvqCn2NsDvDzif19ZAn+cn
 /Gjk7hvIoZW7IN9fR64Xqr08eQNEj741AVy8ul3kNQcAs5psMxiiwSrOw+5ST83yWJC7
 dDqIR+EEn9KyAQI5MdjZ5J8pO5KK4FdPs0o4KPSIEpYrvF9J7ZyWtGjokGJWItRVxfZ2
 qfdBs06Un6B9cdOmLRF+tkt4BXCXqcV37rkkjfJO5V3g9FtabSwPTxhpm47bGlMQXPJH
 WRZv8ktdSi9unTOXh4CT4Ai6axLI3ZqxElFF3qnTcolewOniBcansJy26rAhTRGWgliZ
 EutQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=h03DEWPN
Subject: Re: [Buildroot] [PATCH v2 1/3] package/gst1-plugins-base: if libdrm
 is enabled, make use of it
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

WWVzIGluZGVlZCwgc29ycnkuICAgSSBndWVzcyBJIGJldHRlciBkbyBhIFYzID8/CgpPbiBTdW4s
IE1hciAyOSwgMjAyNiBhdCAxMjoyMOKAr1BNIEZpb25hIEtsdXRlIDxmaW9uYS5rbHV0ZUBnbXgu
ZGU+IHdyb3RlOgo+Cj4gQW0gMjkuMDMuMjYgdW0gMTc6NDcgc2NocmllYiBBZGFtIERpIENhcmxv
Ogo+ID4gVGhpcyBmb3JtYWxpemVzIHRoZSByZWxhdGlvbiBiZXR3ZWVuIHRoZSBjb25maWd1cmF0
aW9uIG9wdGlvbiwgbm93Cj4gPiBhdXRvbWF0aWNhbGx5IGFrYSByYW5kb21seSBzZXQsIGRlcGVu
ZGluZyBvbiB0aGUgc3RhdGUgb2YKPiA+IGxpYmRybSAoQlIyX1BBQ0tBR0VfTElCRFJNKS4gIFNp
bmNlIHRoYXQgaG9zdCBkZXBlbmRlbmN5IHdhcyBub3QKPgo+IGxpYmRybSBpcyBhIHRhcmdldCBw
YWNrYWdlLCBub3QgYSBob3N0IHBhY2thZ2UuIEkgYXNzdW1lIHRoaXMgc2hvdWxkIGJlCj4gIlNp
bmNlIHRoYXQgZGVwZW5kZW5jeSBb4oCmXSI/Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gRmlvbmEKPgo+
ID4gcHJldmlvdXNseSBub3RlZCwgY29uZmlndXJlIHdvdWxkIHNvbWV0aW1lcyBjaG9vc2Ugb25l
IHdheSBvciBhbm90aGVyLAo+ID4gYnV0IHVzdWFsbHkgd2l0aG91dC4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBBZGFtIERpIENhcmxvIDxhLnAuZGljYXJsb0BnbWFpbC5jb20+Cj4gPiAtLS0KPiA+
ICAgcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtcGx1Z2lucy1iYXNlL2dzdDEtcGx1Z2lucy1iYXNl
Lm1rIHwgNyArKysrKysrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtcGx1Z2lucy1iYXNlL2dz
dDEtcGx1Z2lucy1iYXNlLm1rIGIvcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtcGx1Z2lucy1iYXNl
L2dzdDEtcGx1Z2lucy1iYXNlLm1rCj4gPiBpbmRleCBhZGZiNDA3Mzg2Li40NjdlMTU0MTRiIDEw
MDY0NAo+ID4gLS0tIGEvcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtcGx1Z2lucy1iYXNlL2dzdDEt
cGx1Z2lucy1iYXNlLm1rCj4gPiArKysgYi9wYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1wbHVnaW5z
LWJhc2UvZ3N0MS1wbHVnaW5zLWJhc2UubWsKPiA+IEBAIC00Nyw2ICs0NywxMyBAQCBlbHNlCj4g
PiAgIEdTVDFfUExVR0lOU19CQVNFX0NPTkZfT1BUUyArPSAtRGludHJvc3BlY3Rpb249ZGlzYWJs
ZWQKPiA+ICAgZW5kaWYKPiA+Cj4gPiAraWZlcSAoJChCUjJfUEFDS0FHRV9MSUJEUk0pLHkpCj4g
PiArR1NUMV9QTFVHSU5TX0JBU0VfQ09ORl9PUFRTICs9IC1EZHJtPWVuYWJsZWQKPiA+ICtHU1Qx
X1BMVUdJTlNfQkFTRV9ERVBFTkRFTkNJRVMgKz0gbGliZHJtCj4gPiArZWxzZQo+ID4gK0dTVDFf
UExVR0lOU19CQVNFX0NPTkZfT1BUUyArPSAtRGRybT1kaXNhYmxlZAo+ID4gK2VuZGlmCj4gPiAr
Cj4gPiAgIGlmZXEgKCQoQlIyX1BBQ0tBR0VfT1JDKSx5KQo+ID4gICBHU1QxX1BMVUdJTlNfQkFT
RV9ERVBFTkRFTkNJRVMgKz0gb3JjCj4gPiAgIEdTVDFfUExVR0lOU19CQVNFX0NPTkZfT1BUUyAr
PSAtRG9yYz1lbmFibGVkCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
