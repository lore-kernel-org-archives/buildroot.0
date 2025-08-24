Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC74CA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 15:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57E068453E;
	Sun, 24 Aug 2025 15:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LwM4EJ9wvfzy; Sun, 24 Aug 2025 15:42:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82A5184427
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82A5184427;
	Sun, 24 Aug 2025 15:42:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6960CA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 15:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8AD740595
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 15:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gbFgKoC1vxW for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 15:42:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F141B40179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F141B40179
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F141B40179
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 15:42:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45a286135c8so23215045e9.0
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 08:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756050172; x=1756654972;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5oYnfkUj3gpzaefhu9XsRgIJ2kz7xV96pG/spXT/ukA=;
 b=uVqzpgt4pK2nt/8vc7iqHFD8VeIxmaE60SLXtG49wy8nDE6Mz+FtD5fBeGs1nOXo5H
 lDdzeX9SeK4+3o5xeLafiUUzrf0Cu3iOvXrqQJxG6feKmI6rFLjbVlDTNKiH+ZrgHHEu
 ElJLfpfURicMo0lCyxHHD1wdmuylEInPy8pbTfNqRbG3IDOv+EVjStSeHjvdREcv4ay9
 0jsJ+m048dyAXPfAwX7vmC97qvK/2KraGtdEi+a6nF7nIdskPY31zPTE6SLapT74ESpp
 EeCuQLHaEg6bmBvMub+rEQnWSl7u0IBCs2ZjAJvu3XfHGzGc9e2WQgecBrD8hkUxgr51
 +3Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1l4GYbuhY3czleZKSGeNl3E9KVQ8mKwl/zeH5g+mQf/z05HTqTPxhuADKNWOQg7I2sOCwGdRwpz8=@buildroot.org
X-Gm-Message-State: AOJu0YzKIkpL25/jx4F79gXos5hZqjB8HowkUqh9HbvQ+qzXthUxkPDI
 Vllh4IYn0SRKZ1wGJY3TYKS9E/HO9SIIFPb5ZzIJAKrmlMVyVVKxLmnvDG3qvtFRM0s=
X-Gm-Gg: ASbGncuUV1oh83xIQzr7XmFWWPVcgedOFxB5w4tXXg1vfoWXbeK845wyZEsXiOb+4Pg
 moDZD+4Q+XgAen1Zlx80CqIe5ChGd7KFl03kzvD1hnOId2SkSs5ZsKIrKgXJtpfKofKCWdUn+WB
 YheA4MNo7k6NlCUhdKfe65fBBOlD1pyXHBgCv8MVLVCyzePYhWfS6o5nl6iI/bNiSFZ7RnaGbiD
 L6M6AtDxzYq6ApjnbC9ziN2Yr4t0DqNxxavG5EuUhhO+ReuUc1Cvth8CY6PmWRsLfq1WcpABiWg
 1wTlf+fEvQktScjZr89l7Bpb4zzRfb5tTViMETB+t270bKZgAjuRwYIzu7Qyuqvex0vXE73S/2j
 JHF80JzZRl48GRQQvaDPDvW8KT9ql7+49lNZmoGOwNtOH/mtjGaJ9l5+VegG8xM1yROvzAbmjpu
 vHHV4W65YOX0bx7wvqv59CqfB+29KwlHmugh8WncotSNKOCAc11FQ5pXppaaVk
X-Google-Smtp-Source: AGHT+IFW72RI8jENO2v8N0V7PvKInPj16tvMHqhRbXxdRCmuSw2x4VYlkKMyVBDjZHAwN6p2ARgiig==
X-Received: by 2002:a5d:5d08:0:b0:3b7:94ad:ef50 with SMTP id
 ffacd0b85a97d-3c5d25d656amr9920010f8f.2.1756050171687; 
 Sun, 24 Aug 2025 08:42:51 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c7119c4200sm7804566f8f.53.2025.08.24.08.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Aug 2025 08:42:51 -0700 (PDT)
Message-ID: <90fe4323-eaba-4c7c-afdf-b833050df421@smile.fr>
Date: Sun, 24 Aug 2025 17:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Victor Krawiec <victor.krawiec@arturia.com>, buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>
References: <20250120162808.1219036-1-victor.krawiec@arturia.com>
 <20250812092846.24342-1-victor.krawiec@arturia.com>
Content-Language: fr
In-Reply-To: <20250812092846.24342-1-victor.krawiec@arturia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756050172; x=1756654972; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5oYnfkUj3gpzaefhu9XsRgIJ2kz7xV96pG/spXT/ukA=;
 b=15WcLWNwSAsaC+jFr6mBmAAvsTy4o3Pa+I+Vb87KEl98oaaJ+2hK1HEmOLy/C/Yyd2
 NYVFKCSt/mcD35cWc2DNwnqVnWe2Ndv9V39aYFxaKMWgVVPIxj8K0DnFoJqenSlCbrdA
 BJynvPKSQ9lobEAma1g79/9vtWGaI+kwnIkXQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=15WcLWNw
Subject: Re: [Buildroot] [PATCH v2] package/llvm-project/lld: fix broken
 symlink in SDK
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVmljdG9yLAoKTGUgMTIvMDgvMjAyNSDDoCAxMToyOCwgVmljdG9yIEtyYXdpZWMgYSDD
qWNyaXTCoDoKPiBGcm9tOiB2a3Jhd2llYyA8dmljdG9yLmtyYXdpZWNAYXJ0dXJpYS5jb20+Cj4g
Cj4gVGhlIHN5bWxpbmsgYmluL2xsZCAtPiAkKEdOVV9UQVJHRVRfTkFNRSkvYmluL2xsZCBpcyBi
cm9rZW4gaW5zaWRlIGEgU0RLIGNvbnRhaW5pbmcgaG9zdC1sbGQgcGFja2FnZQo+IFRoZSBzeW1s
aW5rIHN0aWxsIHBvaW50cyB0byB0aGUgbG9jYXRpb24gb2YgbGxkIGluc2lkZSB0aGUgYnVpbGQn
cyBob3N0IGZvbGRlciBpbnN0ZWFkIG9mIHRoZSBsb2NhdGlvbiBvZiBsbGQgaW5zaWRlIHRoZSBT
REsKPiBJbiBjb25zZXF1ZW5jZSBHQ0MgaXMgbm90IGFibGUgdG8gZmluZCBsbGQgbGlua2VyCj4g
Q2hhbmdpbmcgdGhlIHN5bWxpbmsgdG8gYmUgcmVsYXRpdmUgZHVyaW5nIGhvc3QtbGxkIGluc3Rh
bGxhdGlvbiBmaXhlcyB0aGUgcHJvYmxlbQo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpY3RvciBLcmF3
aWVjIDx2aWN0b3Iua3Jhd2llY0BhcnR1cmlhLmNvbT4KPiAKPiAtLS0KPiBDaGFuZ2VzIHYxIC0+
IHYyOgo+ICAgLSBDaGFuZ2UgU29CIGxpbmUgdG8gdXNlIGZ1bGwgbmFtZQoKSXQncyBpbXBvcnRh
bnQgdG8gaGF2ZSB0aGUgY29tbWl0IEF1dGhvciBpcyBtYXRjaGluZyB3aXRoIHRoZSBTb0IgbGlu
ZS4KCldBUk5JTkc6IEF1dGhvciBpcyBhIHNpbmdsZSBuYW1lOiAidmtyYXdpZWMiCldBUk5JTkc6
IEF1dGhvciBhbmQgU29CIGxpbmUgZG8gbm90IG1hdGNoLCBvciBtaXNzaW5nIFNvQiBsaW5lCgpB
ZnRlciB1cGRhdGluZyB5b3VyIGdpdGNvbmZpZywgeW91IGNhbiB1cGRhdGUgeW91ciBjb21taXQg
dXNpbmc6CgpnaXQgY29tbWl0IC0tYW1lbmQgLS1yZXNldC1hdXRob3IKCkJlc3QgcmVnYXJkcywK
Um9tYWluCgoKPiAtLS0KPiAgcGFja2FnZS9sbHZtLXByb2plY3QvbGxkL2xsZC5tayB8IDQgKyst
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbGQvbGxkLm1rIGIvcGFja2FnZS9s
bHZtLXByb2plY3QvbGxkL2xsZC5tawo+IGluZGV4IGM5YTJkMzc5NmIuLmU3MjMzZTc0YWUgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9sbHZtLXByb2plY3QvbGxkL2xsZC5tawo+ICsrKyBiL3BhY2th
Z2UvbGx2bS1wcm9qZWN0L2xsZC9sbGQubWsKPiBAQCAtMjAsOCArMjAsOCBAQCBIT1NUX0xMRF9D
T05GX09QVFMgKz0gLURMTFZNX0NPTU1PTl9DTUFLRV9VVElMUz0kKEhPU1RfRElSKS9saWIvY21h
a2UvbGx2bQo+ICAjIEdDQyBsb29rcyBmb3IgdG9vbHMgaW4gYSBkaWZmZXJlbnQgcGF0aCBmcm9t
IExMRCdzIGRlZmF1bHQgaW5zdGFsbGF0aW9uIHBhdGgKPiAgZGVmaW5lIEhPU1RfTExEX0NSRUFU
RV9TWU1MSU5LUwo+ICAJbWtkaXIgLXAgJChIT1NUX0RJUikvJChHTlVfVEFSR0VUX05BTUUpL2Jp
bgo+IC0JbG4gLXNmICQoSE9TVF9ESVIpL2Jpbi9sbGQgJChIT1NUX0RJUikvJChHTlVfVEFSR0VU
X05BTUUpL2Jpbi9sbGQKPiAtCWxuIC1zZiAkKEhPU1RfRElSKS9iaW4vbGxkICQoSE9TVF9ESVIp
LyQoR05VX1RBUkdFVF9OQU1FKS9iaW4vbGQubGxkCj4gKwlsbiAtc2ZyICQoSE9TVF9ESVIpL2Jp
bi9sbGQgJChIT1NUX0RJUikvJChHTlVfVEFSR0VUX05BTUUpL2Jpbi9sbGQKPiArCWxuIC1zZnIg
JChIT1NUX0RJUikvYmluL2xsZCAkKEhPU1RfRElSKS8kKEdOVV9UQVJHRVRfTkFNRSkvYmluL2xk
LmxsZAo+ICBlbmRlZgo+ICAKPiAgSE9TVF9MTERfUE9TVF9JTlNUQUxMX0hPT0tTICs9IEhPU1Rf
TExEX0NSRUFURV9TWU1MSU5LUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
