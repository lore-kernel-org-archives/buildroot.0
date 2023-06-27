Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD6EEB64D7
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 00:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23211400FC;
	Tue, 27 Jun 2023 00:33:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23211400FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Go8OqusNo8bk; Tue, 27 Jun 2023 00:33:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B83954186B;
	Tue, 27 Jun 2023 00:33:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B83954186B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CDAB1BF37F
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 00:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 123C381E30
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 00:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 123C381E30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nd1CpTl10Lng for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 00:33:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFC7181E19
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFC7181E19
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 00:33:00 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-440b66adc81so1226566137.1
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 17:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687825979; x=1690417979;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0XSSd79/wZfdCcFz2LfMblNPQnHddVQmBxZ65ND0KxE=;
 b=YNU72cWkWb5ljgZW9QZmRbUDoPCqB+AuW4Cgiw82+ZW0g9zcry+0SElNnC+Z2r38YQ
 fWnSMfFN+LyyfRF3k2BojGhHMBHhcSCBGUUbu/D+eEBNoUfjbpUuLZbr6+pUSxPmTIp1
 VFFTv54U9670DQJJEo5VWQUlOEAYmuyvdOX3ZhIbXAhq0kY7iA0EDqzu/NsbPpgUSa+f
 2+Lm+C8VTT9Hhb1SclWahus7LzHWusIW367UYTZaQ3rQaDRbIw9z55J9auGg2bNUbjry
 bZY6LS7PQUucUhdwbjH4XGVG5lr0sJtGpzJ9BVIzm3NNFlYQD54gyog3Bs7TTKUyIxq/
 7Q3Q==
X-Gm-Message-State: AC+VfDxdItKwhPcxiGyqHAl5x+PPyaThsSrn+2Rysmdu0FSnz5ss8JIX
 H1IijT1uDw042G4k6NIps6t74t0w6ejMmKtgcbk=
X-Google-Smtp-Source: ACHHUZ6tXerpKxHQ1GE378sx157vjYQWv6mh/JeGi4T1/FR4BWZAMoB3OTeKF0HhbmeUhkNs3tapde+ZJWf4jYav8w8=
X-Received: by 2002:a05:6102:34ec:b0:443:7503:a534 with SMTP id
 bi12-20020a05610234ec00b004437503a534mr516295vsb.16.1687825979240; Mon, 26
 Jun 2023 17:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
 <20230626160030.93063-11-bmeng.cn@gmail.com>
 <20230626172109.GG646621@scaer>
In-Reply-To: <20230626172109.GG646621@scaer>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Jun 2023 10:32:33 +1000
Message-ID: <CAKmqyKMa8OHWNWCH2_mFAin0_igrX5TSiKFxqX41=2-dD5RWPw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687825979; x=1690417979;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0XSSd79/wZfdCcFz2LfMblNPQnHddVQmBxZ65ND0KxE=;
 b=T30pvu8XlVMHXIG7EYk+rj1FdVzwxgD19L5YCMXUHz0gEPirSIualeRPHSzCxQApqp
 lqNVYv35tjcyQu23W/QHswHZo06DBWJi1cVQmTd/J9HJw4vdCPIn66wJ8nFP+i3zhBlL
 +UTy5rsDUQma6BSAyIWsSAtNa8jPJjrf2AKAxuEfBJFRI4zhja7jz9cS1U4DctC0jQPy
 YB8mOSr1FD3Lyv5rjFcVgffAqg73c7C+S0g/5U0HxGuwewNIC59Ej6J/ltSdqN3Z2EPz
 6SW5NvX3i92BwQQ01mABaidAkw6Rpvu2noIPHBsbTV2RIo1OOvSddnbuForHccy6vA/5
 yMLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=T30pvu8X
Subject: Re: [Buildroot] [PATCH 10/10] board/sifive: hifive-unleashed:
 Include QEMU instructions in readme.txt
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
Cc: Bin Meng <bmeng@tinylab.org>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBKdW4gMjcsIDIwMjMgYXQgMzoyMeKAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEJpbiwgQWxsLAo+Cj4gT24gMjAyMy0wNi0yNyAw
MDowMCArMDgwMCwgQmluIE1lbmcgc3Bha2UgdGh1c2x5Ogo+ID4gRnJvbTogQmluIE1lbmcgPGJt
ZW5nQHRpbnlsYWIub3JnPgo+ID4KPiA+IFRoZSB1cHN0cmVhbSBRRU1VICdzaWZpdmVfdScgbWFj
aGluZSBzdXBwb3J0cyBydW5uaW5nIHVwc3RyZWFtIFUtQm9vdAo+ID4gZm9yIHRoZSBTaUZpdmUg
SGlGaXZlIFVubGVhc2hlZCBib2FyZCBvdXQgb2YgdGhlIGJveC4KPiA+Cj4gPiBBZGQgdGhlIFFF
TVUgaW5zdHJ1Y3Rpb25zIGZvciB0ZXN0aW5nIGluIHJlYWRtZS50eHQuCj4KPiBBaCwgaXMgdGhl
IDY0TWlCIFNEY2FyZCByZXF1aXJlZCB0byBiZSBib290YWJsZSB1bmRlciBxZW11PwoKWWVzLCBR
RU1VIHJlcXVpcmVzIHRoZSBTRCBjYXJkIHRvIGJlIGEgcG93ZXIgb2YgMgoKaHR0cHM6Ly9naXRs
YWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vY29tbWl0L2E5YmNlZGQxNWE1ODM0Y2E5YWU2YzNh
OTc5MzNlODVhYzdlZGJkMzYKCkFsaXN0YWlyCgo+Cj4gSS5lLiBpcyBpdCB0aGUgc2FtZSBpc3N1
ZSBhcyBmaXhlZCBieSA2ZjllODNmNWY3NGQgKHN1cHBvcnQvdGVzdGluZzoKPiB0ZXN0X3ViaTog
cmVkdWNlIHRoZSByb290ZnMudWJpIHNpemUgdG8gNjRNIHRvIG1hdGNoIHRoZSBRZW11IGVtdWxh
dGVkCj4gZmxhc2ggZGV2aWNlKT8KPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+ID4g
U2lnbmVkLW9mZi1ieTogQmluIE1lbmcgPGJtZW5nQHRpbnlsYWIub3JnPgo+ID4gLS0tCj4gPgo+
ID4gIGJvYXJkL3NpZml2ZS9oaWZpdmUtdW5sZWFzaGVkL3JlYWRtZS50eHQgfCAxNyArKysrKysr
KysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2JvYXJkL3NpZml2ZS9oaWZpdmUtdW5sZWFzaGVkL3JlYWRtZS50eHQgYi9i
b2FyZC9zaWZpdmUvaGlmaXZlLXVubGVhc2hlZC9yZWFkbWUudHh0Cj4gPiBpbmRleCAzMjYzOTEz
ZTljLi5lOWNjYjI2ZmE2IDEwMDY0NAo+ID4gLS0tIGEvYm9hcmQvc2lmaXZlL2hpZml2ZS11bmxl
YXNoZWQvcmVhZG1lLnR4dAo+ID4gKysrIGIvYm9hcmQvc2lmaXZlL2hpZml2ZS11bmxlYXNoZWQv
cmVhZG1lLnR4dAo+ID4gQEAgLTExMywzICsxMTMsMjAgQEAgQm9vdGluZyB0aGUgU1BJIGZsYXNo
IG9uIHRoZSBib2FyZAo+ID4KPiA+ICBNYWtlIHN1cmUgdGhhdCB0aGUgYWxsIERJUCBzd2l0Y2hl
cyBhcmUgc2V0IHRvIHRoZSBvZmYgcG9zaXRpb24gZm9yCj4gPiAgZGVmYXVsdCBib290IG1vZGUg
KE1TRUwgbW9kZSA9IDAxMTApIHRvIGJvb3QgZnJvbSBTUEkgZmxhc2guCj4gPiArCj4gPiArVGVz
dGluZyB1bmRlciBRRU1VCj4gPiArPT09PT09PT09PT09PT09PT09Cj4gPiArCj4gPiArVGhlIFNE
IGNhcmQgaW1hZ2UgY2FuIGJlIHRlc3RlZCB1c2luZyBRRU1VOgo+ID4gKwo+ID4gKyQgcWVtdS1z
eXN0ZW0tcmlzY3Y2NCAtTSBzaWZpdmVfdSxtc2VsPTExIC1zbXAgNSAtbSA4RyBcCj4gPiArICAg
IC1kaXNwbGF5IG5vbmUgLXNlcmlhbCBzdGRpbyAtbmljIHVzZXIgXAo+ID4gKyAgICAtYmlvcyBv
dXRwdXQvaW1hZ2VzL3UtYm9vdC1zcGwuYmluIFwKPiA+ICsgICAgLWRyaXZlIGZpbGU9b3V0cHV0
L2ltYWdlcy9zZGNhcmQuaW1nLGlmPXNkCj4gPiArCj4gPiArVGhlIFNQSSBmbGFzaCBpbWFnZSBj
YW4gYmUgdGVzdGVkIHdpdGggYSBzbGlnaHRseSBkaWZmZXJlbnQgY29tbWFuZDoKPiA+ICsKPiA+
ICskIHFlbXUtc3lzdGVtLXJpc2N2NjQgLU0gc2lmaXZlX3UsbXNlbD02IC1zbXAgNSAtbSA4RyBc
Cj4gPiArICAgIC1kaXNwbGF5IG5vbmUgLXNlcmlhbCBzdGRpbyAtbmljIHVzZXIgXAo+ID4gKyAg
ICAtYmlvcyBvdXRwdXQvaW1hZ2VzL3UtYm9vdC1zcGwuYmluIFwKPiA+ICsgICAgLWRyaXZlIGZp
bGU9b3V0cHV0L2ltYWdlcy9zcGktbm9yLmltZyxpZj1tdGQKPiA+IC0tCj4gPiAyLjM0LjEKPiA+
Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4g
LS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1U
aW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4g
fCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAg
IHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0t
Li0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0
cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAg
diAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
