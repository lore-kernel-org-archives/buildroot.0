Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DC0EE49BC
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 15:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E0A980EA0;
	Wed, 11 Sep 2024 15:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LOgqy7YE4Ofk; Wed, 11 Sep 2024 15:44:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3347F81003
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3347F81003;
	Wed, 11 Sep 2024 15:44:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B5CF1BF33C
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 15:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56F61401B7
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 15:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g5vJ3T0uVhBl for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 15:44:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CA6FC4012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA6FC4012F
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA6FC4012F
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 15:44:23 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-6d3c10af2efso62144377b3.0
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 08:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726069462; x=1726674262;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RLFC58fBL1FtfIHazkUaejH7OldkAEjuLDFmPZcSwto=;
 b=Kcu7843hBKm8WUw55RCD+zJGZYx4LcPVMp1wgAqNTPnmd6YbVeDDnkaoq9+ejcAOgc
 IW6zwvFGIFGLuuMtyS+PgX/WjNdXa+yMljN3l+uRt00rMmsfHJKPAqEs0chgDkZII0pE
 YLymLQV7dTg8mUJCr58wKmtCv6/ot8AADGEWUbgSd1k70qZE3+S09TAtDk5q2JSLuqsX
 s22ovlscCIj+uXu6IaJE4lun8PTU81JX60Q4tD2xudHCtWAO3+Uz3++pYTzMlMz4NbJt
 +C9Jv6DxrD0aOiMefD1B9DcCAw4oxSLPoy7eMrDosJAAjprldEMLAZ4x7eJ9F6sfsjVj
 cAAA==
X-Gm-Message-State: AOJu0YyQTIG5JVNtUCEN0PY2OYpBc50z23h9i60Yti6sWydmOoe2dRvU
 3nYw/0nipMW1ieidYNWtyXWYXclwUFa2PQUegDhHiOE0pJG9QQTucvX+mJyOzVwFFE1Re3jxxb0
 XtxX8cv8cyQ6BVgBSCyYwYZ3tFgMT20v/fj02SLgsgz43ULwzTB3j+Q==
X-Google-Smtp-Source: AGHT+IGGNRlR5xUGpHiSbIrFzutstYV76Xne2g9CrNQUBxWOgxwaFWnw1JD0Th3/OI3/1n9DDblVy0RpUj+vDvpYEwM=
X-Received: by 2002:a05:690c:83:b0:6c9:9341:1ce1 with SMTP id
 00721157ae682-6db45154151mr176573487b3.32.1726069462410; Wed, 11 Sep 2024
 08:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240908181505.403963-1-dario.binacchi@amarulasolutions.com>
 <953fb6ae-0313-4160-915a-cae5367da531@mind.be>
In-Reply-To: <953fb6ae-0313-4160-915a-cae5367da531@mind.be>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 11 Sep 2024 17:44:11 +0200
Message-ID: <CABGWkvoSQ0MVcosXO-RLiTtOTWbwB7C6n2caGZ2_kAhORzRbpA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726069462; x=1726674262;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RLFC58fBL1FtfIHazkUaejH7OldkAEjuLDFmPZcSwto=;
 b=BYYbQDZkUIn9ozI4mPLh7r+3Uv5jBAU91/X+6fuY+//AxDv9IMQUaqoWuV+Sd7Bcp5
 liPKYEPR3hRbyGj6S8sJ60lf+FoaiJuTHGJ0VeUcpYrWY7MYM0/8EqiFtv+pY/c6BC03
 xV8s9CxdyEGgKOefontrouoSf6ukUxAeJa+w4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=BYYbQDZk
Subject: Re: [Buildroot] [PATCH 1/1] package/rp-pppoe: fixup download URL
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gTW9uLCBTZXAgOSwgMjAyNCBhdCA4OjM54oCvUE0gQXJub3V0IFZhbmRl
Y2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiB3cm90ZToKPgo+Cj4KPiBPbiAwOC8wOS8yMDI0IDIw
OjE1LCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPiA+IEFzIHJlcG9ydGVkIGluIFsxXSwgdGhlIGRv
d25sb2FkIG9mIHJwLXBwcG9lLTMuMTUudGFyLmd6IGlzIG5vIGxvbmdlcgo+ID4gZ3VhcmFudGVl
ZCBmcm9tIHRoZSBkb3dubG9hZCBzZWN0aW9uIG9mIHRoZSBwcm9qZWN0Lgo+ID4gQXMgc3VnZ2Vz
dGVkIGJ5IERpYW5uZSwgdGhlIG1haW50YWluZXIsIGZvciBub3cgd2UgImNhbiBncmFiIHRoZSB0
YXJiYWxsCj4gPiBmcm9tIGFyY2hpdmUub3JnIGFuZCB0aGVuIGZpZ3VyZSBvdXQgYSB3YXkgdG8g
bWFrZSBpdCBhdmFpbGFibGUgdG8KPiA+IGJ1aWxkcm9vdCB1c2VycyIuCj4KPiAgIFRoZXJlJ3Mg
YSBtaXJyb3Igb24gaHR0cHM6Ly9kb3dubG9hZHMudWxzLmNvLnphL3JwLXBwcG9lLyB0aGF0IHN0
aWxsIGhhcyB0aGUKPiAzLjE1IHRhcmJhbGwuIFBlcmhhcHMgd2Ugc2hvdWxkIHVzZSB0aGF0IG9u
ZT8KClllcyB5b3UgYXJlIHJpZ2h0LgpBcyByZXBvcnRlZCBhbHNvIGluIHRoZSBycC1wcHBvZSBt
YWlsaW5nIGxpc3Q6Cmh0dHBzOi8vZGlhbm5lLnNrb2xsLmNhL3BpcGVybWFpbC9ycC1wcHBvZS8y
MDI0cTMvMDAwNjUzLmh0bWwKClRoYW5rcyBhbmQgcmVnYXJkcywKRGFyaW8KCj4KPiAgIFJlZ2Fy
ZHMsCj4gICBBcm5vdXQKPgo+ID4KPiA+IFRoZSBpZGVhIGlzIHRvIGxhdGVyIHN1Ym1pdCBhIHBh
dGNoIHRvIGJ1bXAgdGhlIHZlcnNpb24gdG8gNC4wIHVzaW5nIHRoZQo+ID4gb2ZmaWNpYWwgcmVw
b3NpdG9yeSwgd2hpY2ggaXMgaHR0cHM6Ly9zYWxzYS5kZWJpYW4ub3JnL2Rza29sbC9ycC1wcHBv
ZS4KPiA+Cj4gPiBGaXhlczoKPiA+IC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jl
c3VsdHMvODY3NjQ1NmZlZWM5ZGQ0MDExNTI4ODcxMDFhZDFhOWNlOTZjYjc2OQo+ID4KPiA+IFsx
XSBodHRwczovL2RpYW5uZS5za29sbC5jYS9waXBlcm1haWwvcnAtcHBwb2UvMjAyNHEzLzAwMDY1
Mi5odG1sCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFj
Y2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4gLS0tCj4gPiAgIHBhY2thZ2UvcnAtcHBwb2Uv
cnAtcHBwb2UubWsgfCAyICstCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3JwLXBwcG9lL3JwLXBw
cG9lLm1rIGIvcGFja2FnZS9ycC1wcHBvZS9ycC1wcHBvZS5tawo+ID4gaW5kZXggZjUwZjFlNWEx
ZmQxLi5mYWU2Njg5NGMxMDMgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3JwLXBwcG9lL3JwLXBw
cG9lLm1rCj4gPiArKysgYi9wYWNrYWdlL3JwLXBwcG9lL3JwLXBwcG9lLm1rCj4gPiBAQCAtNSw3
ICs1LDcgQEAKPiA+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+Cj4gPiAgIFJQX1BQUE9F
X1ZFUlNJT04gPSAzLjE1Cj4gPiAtUlBfUFBQT0VfU0lURSA9IGh0dHBzOi8vZGlhbm5lLnNrb2xs
LmNhL3Byb2plY3RzL3JwLXBwcG9lL2Rvd25sb2FkCj4gPiArUlBfUFBQT0VfU0lURSA9IGh0dHA6
Ly93ZWIuYXJjaGl2ZS5vcmcvd2ViLzIwMjIwNTIzMDUwMTEwL2h0dHBzOi8vZGlhbm5lLnNrb2xs
LmNhL3Byb2plY3RzL3JwLXBwcG9lL2Rvd25sb2FkCj4gPiAgIFJQX1BQUE9FX0xJQ0VOU0UgPSBH
UEwtMi4wCj4gPiAgIFJQX1BQUE9FX0xJQ0VOU0VfRklMRVMgPSBkb2MvTElDRU5TRQo+ID4gICBS
UF9QUFBPRV9DUEVfSURfVkFMSUQgPSBZRVMKCgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9y
IEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9u
cy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0
aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoK
VC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVs
YXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
