Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D0EC021A4
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 02:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F71940B51;
	Fri, 14 Feb 2025 02:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Srvhry9t75hA; Fri, 14 Feb 2025 02:23:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C107F40B61
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C107F40B61;
	Fri, 14 Feb 2025 02:23:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53A83C2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 02:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36603606C7
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 02:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_yhqKvmz_yx for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 02:23:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04FC86065E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04FC86065E
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04FC86065E
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 02:23:37 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5439e331cceso1811422e87.1
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 18:23:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739499815; x=1740104615;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LW+5pkdbZlao+rFhpj5VTLGThZGQ2z0vnSvESLXp0XE=;
 b=GD5UQA/Qbuqo61GI74xscnxeStsgSzq2sKh7IS2tvI+FedsG2X5nvLDOFd45X8DAFG
 NU+0tC+PFaZlI7xV+f7XxAe6bufCTlXgL3OpRa7HH9ZkqzVC3Yv6PkW2jrNZ7l3Niiis
 u/GlSkIqLNCn1v+eaf5bXqkooLWHwBlNJtikjDnPI1TUpZfb4K+5Inkhe/oZ4ej9TaO3
 6IR3Cu1svAqXqAOk1MFRjjnH0SH/75XgNslrKK8n+tiglvFLnLTvPxV1C9bhdWVhWzP5
 R1mvgST5C5lhZwC016/YMdWEvSdvTV0qhJCUmAlXRLzrb+lRd9FdgjIKB2Vdj8400OoF
 +W7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI+sPN3tJ7/5r8aIIrCxT1W23TUuvUSSeELvGEwWsVSkXPfOtTU5wWilLF5gztuO6Pojqzy8SEUFg=@buildroot.org
X-Gm-Message-State: AOJu0YxpjkXX8mZ7JPvR73FozjT5Z+gOd0Sfv28Zn551Tpj8jWyPb480
 rtlLxg40b7h7CZg/u96v9YR0npQO1tZST3R5guaTKxaMVPC2JTCnJpNYPP7SUvKWsBAgLUU3aGt
 +vul93hesiUtwLXSbL4VG+AHNvtc=
X-Gm-Gg: ASbGnct0Q3mEN4ASiuvYX5JxoBwYRrQV0reW2RqbXYGqg/+ci+ywwjqhGmEqtS23I+u
 rNVHy5vAAxLfOk4cgt0uZy0seOxr+xr+NWx/9NmBosKwei6u0MfuoM0h+u+NDu/gSngqs8oIcMg
 ==
X-Google-Smtp-Source: AGHT+IGf1MF7x/116jeYcomm5B/COXAn7KsVt9VhkiXo3sG5iUkgjLtKzDgtZ062rNV0cXBFmmuIiNKYbpKwZNq6ccE=
X-Received: by 2002:a05:6512:2251:b0:545:fad:dba9 with SMTP id
 2adb3069b0e04-54518122cc9mr2943621e87.27.1739499815118; Thu, 13 Feb 2025
 18:23:35 -0800 (PST)
MIME-Version: 1.0
References: <20250212135027.759121-1-fancp2007@gmail.com>
 <20250213045050.816782-1-fancp2007@gmail.com>
 <c281fbe54e343bcc61c8e08e623e10a0@free.fr>
 <Z652OsALpn1B5OJR@waldemar-brodkorb.de>
In-Reply-To: <Z652OsALpn1B5OJR@waldemar-brodkorb.de>
From: Scott Fan <fancp2007@gmail.com>
Date: Fri, 14 Feb 2025 10:23:23 +0800
X-Gm-Features: AWEUYZmdQ5ElsDdwBDM_B2xNRuvNlAvK9nBto1UfUlH3GMKGNZJVdhTQNitoTno
Message-ID: <CAFkzVZbMTHBqRm1ABAnqMvRBCHGqT_MK9E4wZL+ieLf__e=T7A@mail.gmail.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org,
 Bernd Kuhls <bernd@kuhls.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739499815; x=1740104615; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LW+5pkdbZlao+rFhpj5VTLGThZGQ2z0vnSvESLXp0XE=;
 b=bZNWZeDUgIP8HeAuhwgt+VzSLFJb1qvS3cUW4btk1ppIS/YhHpduO0C793jTPTuqe+
 J30c04DMgTAYCwX6Ju3wXhr+DTbY8YEm1ZggWrsJJFZpqHQL3Z9cKujJO3Q0+PyeU8Qa
 +mtI53BRMgevC4Qh4eNC0gDmzK7SLdq7hjlY4FRQ7A06MJjuH13M4qsYpZUmX4MBhl/Y
 1QOV10PDryBzcpnOK6exLyw8IlaUmSfejG1rYQ+suPDV9J3GiUhItJsvSGuPUh8D4jHM
 uTMoHkfEzVfLBWadwS0lM+6hw/gkcjhRaxy0pIsX6W5avYe1oqDdi4t6svCiYlyTL7Y6
 YFbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bZNWZeDU
Subject: Re: [Buildroot] [PATCH v2] package/sqlite: fix build issue since
 bump to 3.49.0
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

SGkgV2FsZGVtYXIsCgpUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2suCgpJIGhhdmUgc2VudCBh
IG5ldyBwYXRjaCB0byBmaXggaXQsIHNlZSB0aGUgbGluayBiZWxvdzoKaHR0cHM6Ly9wYXRjaHdv
cmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI1MDIxNDAyMTQxNi4zOTIz
NjMtMS1mYW5jcDIwMDdAZ21haWwuY29tLwoKQ291bGQgeW91IHRha2UgYSBtb21lbnQgdG8gdGVz
dCB0aGlzIHBhdGNoIGZvciB5b3VyIHdvcms/IHRoYW5rcy4KClNjb3R0IEZhbgoKT24gRnJpLCBG
ZWIgMTQsIDIwMjUgYXQgNjo0NuKAr0FNIFdhbGRlbWFyIEJyb2Rrb3JiIDx3YnhAb3BlbmFkay5v
cmc+IHdyb3RlOgo+Cj4gSGkgU2NvdHQsCj4gSnVsaWVuIE9saXZhaW4gd3JvdGUsCj4KPiA+IE9u
IDEzLzAyLzIwMjUgMDU6NTAsIFNjb3R0IEZhbiB3cm90ZToKPiA+ID4gQXMgb2YgcmVsZWFzZSAz
LjQ5LjAsIHRoZSBhdXRob3IgaGFzIHJlcGxhY2VkIHRoZSBjb25maWd1cmUgc2NyaXB0IHVzZWQK
PiA+ID4gaW4KPiA+ID4gdGhlIHByZWNvbXBpbGVkIGFtYWxnYW1hdGlvbiB0YXJiYWxsIHdpdGgg
QXV0b3NldHVwIGluc3RlYWQgb2YKPiA+ID4gQXV0b3Rvb2xzLgo+ID4gPgo+ID4gPiBUaGUgImF1
dG90b29scy1wYWNrYWdlIiBhbmQgImhvc3QtYXV0b3Rvb2xzLXBhY2thZ2UiIGxpbmVzIGFyZSBu
byBsb25nZXIKPiA+ID4gYXZhaWxhYmxlLCBzbyB0aG9zZSBoYXZlIHRvIGJlIHJlcGxhY2VkIGJ5
IHRoZSAiZ2VuZXJpYy1wYWNrYWdlIiBhbmQKPiA+ID4gImhvc3QtZ2VuZXJpYy1wYWNrYWdlIiBs
aW5lcyBpbiB0aGUgLm1rIGZpbGUuCj4gPiA+Cj4gPiA+IFRoZSBBdXRvc2V0dXAgY29uZmlndXJh
dGlvbiBzY3JpcHQgZG9lcyBub3Qgc3VwcG9ydCB0aGUKPiA+ID4gImVuYWJsZS1keW5hbWljLWV4
dGVuc2lvbnMiIGFuZCAiZGlzYWJsZS1zdGF0aWMtc2hlbGwiIG9wdGlvbnMsCj4gPiA+IHNvIHRo
ZSByZWxldmFudCBsaW5lcyBpbiB0aGUgLm1rIGZpbGUgYXJlIHJlbW92ZWQuCj4gPiA+Cj4gPiA+
IFRoZSBBdXRvc2V0dXAgY29uZmlndXJhdGlvbiBzY3JpcHQgY2FuIGF1dG9tYXRpY2FsbHkgZGV0
ZWN0IHdoZXRoZXIKPiA+ID4gdGhyZWFkcyBhcmUgc3VwcG9ydGVkIGFuZCBzZXQgdGhlIHJlbGV2
YW50IFNRTElURV9USFJFQURTQUZFIGZsYWcsCj4gPiA+IHNvIHRoZSByZWxldmFudCBsaW5lcyBp
biB0aGUgLm1rIGZpbGUgYXJlIHJlbW92ZWQuCj4gPiA+Cj4gPiA+IEZpeGVzOgo+ID4gPiAgIGh0
dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvP3JlYXNvbj1zcWxpdGUtMy40OS4wCj4gPiA+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFNjb3R0IEZhbiA8ZmFuY3AyMDA3QGdtYWlsLmNvbT4KPiA+
Cj4gPiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgo+Cj4gT24gbWFzdGVyIEkgc3RpbGwgZ2V0
Ogo+IEVSUk9SOiBFeHBsaWNpdCAtLWVkaXRsaW5lIGZhaWxlZCB0byBmaW5kIGEgbWF0Y2hpbmcg
bGlicmFyeS4KPgo+IFdpdGggQlIyX1BBQ0tBR0VfTElCRURJVD15IGluc3RlYWQgb2YgcmVhZGxp
bmUgc3VwcG9ydC4KPgo+IEFueSBpZGVhPyBJIGFtIHRyeWluZyB0byBidWlsZCBhc3Rlcmlzay4K
Pgo+IGJlc3QgcmVnYXJkcwo+ICBXYWxkZW1hcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
