Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FC6CD13DE
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 18:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7DED40108;
	Sat, 31 Aug 2024 18:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EjpPhPk4q0l4; Sat, 31 Aug 2024 18:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F23940135
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F23940135;
	Sat, 31 Aug 2024 18:36:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5DB541BF316
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 18:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57B60840FE
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 18:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcON0jza83aE for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 18:36:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3BF97840F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BF97840F9
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BF97840F9
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 18:36:34 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-6b0c5b1adfaso26011667b3.0
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 11:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725129394; x=1725734194;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QjbXhimFbdBRxwUYN6A7wRCRALsy4gy0lNvACEjHDZU=;
 b=tJxorqS9COcah3mGHhHdaCllp3NaT9evU3ZQMUwxjV9J4av5Dy4DQGHUderZk7UgGp
 cP7zWRt5+jDx9vXjDgncl5wmjD1bJwIpHwT1fE9xjiO9K9loiYy2rSgpWY4U6BiQXXnb
 TUMPOodZiLWBFP0Xa1HA7IR+N+ycubSC/mtsMh2YFIGawd3b9qWCpzbpveXKmlYNJCA6
 HQD8B6+kJK/e6H54posyU+XLYslNk0W8r0jnhG0OyddAfbUnpdo5heHpK6dZ8lyZhLaP
 TRQ6Cqrgc4ySeTP9a2COHvu/Y1jClJcfussblnqZ1ru+zM4J3ldZExIhLr1ae7MtmCOI
 LR4w==
X-Gm-Message-State: AOJu0YzKyjFM9r1CB4Wpp02tK9WE5o1IiKrHZCU8ew7bt//OyE3mMJ38
 YPlVpKhAn8q0OLP+bIRiywoAHLEkp8+0lAlSvyKezm+qqIVfPEKSFMPXtzKTm3RrVOnNMlp5beg
 sd4f6cucKc2E+JxtexhXpOi/JPvNE6O2beZt+VgCUxN6mnY7L8shFaA==
X-Google-Smtp-Source: AGHT+IEX05KySC98pLisH5UMGBg44VOWaBROIsmjnZjjKdiO84w7U8DJXEbqNiGpmI/IiGzur/Zut8QLqdEWz9OL0ec=
X-Received: by 2002:a05:690c:f86:b0:6af:fc23:178e with SMTP id
 00721157ae682-6d40ee583bcmr69172367b3.1.1725129393814; Sat, 31 Aug 2024
 11:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240831145450.3162934-1-dario.binacchi@amarulasolutions.com>
 <20240831182545.6d9897ab@windsurf>
In-Reply-To: <20240831182545.6d9897ab@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 31 Aug 2024 20:36:23 +0200
Message-ID: <CABGWkvrX6uycmERpb4RaQuUYz0vRaFzLDNxrW95DTadaKJHCVg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725129394; x=1725734194;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QjbXhimFbdBRxwUYN6A7wRCRALsy4gy0lNvACEjHDZU=;
 b=Tz8W9LmFODkYuafbCxQGd0K5nWWHp4XnHOwX/fn/DCPcmQ7TPh+XQIw5n19HRH0u9k
 OUrfe9DJRIz4nY/Vx/dvJvOv7Z6MWrRnjWeM/8n8bimrkOdukpadiHtcXXoeLQ2NB7dI
 jEVgtlS3lNeA0vO/I6RbEox/0dMVRApSc/lVc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Tz8W9LmF
Subject: Re: [Buildroot] [PATCH v2 1/2] package/babeld: update URL site
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

SGVsbG8gVGhvbWFzLAoKT24gU2F0LCBBdWcgMzEsIDIwMjQgYXQgNjoyNeKAr1BNIFRob21hcyBQ
ZXRhenpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gU2F0
LCAzMSBBdWcgMjAyNCAxNjo1NDo0OSArMDIwMAo+IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5h
Y2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiA+IEFzIHJlcG9ydGVkIGluIFsx
XSwgdmVyc2lvbiAxLjkuMiBoYXMgYmVlbiBtb3ZlZCB0byBhbm90aGVyIGFyY2hpdmUsIGFuZAo+
ID4gaXQgaXMgcmVjb21tZW5kZWQgdG8gdXNlIGh0dHBzOi8vZ2l0aHViLmNvbS9qZWNoL2JhYmVs
ZCBhcyB0aGUgb2ZmaWNpYWwKPiA+IHJlcG9zaXRvcnkuCj4gPgo+ID4gSXQgd2FzIGFsc28gbmVj
ZXNzYXJ5IHRvIGNoYW5nZSB0aGUgc2hhIG9mIHRoZSBkb3dubG9hZGVkIHRhci5nei4KPiA+Cj4g
PiBGaXhlczoKPiA+IC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMjQ0
NzA2MGM4NmFjZjFiZDhkNmVlMGJjZjhmOWI2YWRjZGZjNTBjOQo+ID4KPiA+IFsxXSBodHRwczov
L2FsaW90aC1saXN0cy5kZWJpYW4ubmV0L3BpcGVybWFpbC9iYWJlbC11c2Vycy8yMDI0LUF1Z3Vz
dC8wMDQxODcuaHRtbAo+ID4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJp
bmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIHYxIC0+IHYy
Ogo+ID4gICAtIERvbid0IGJ1bXAgdG8gMS4xMC4wIGJ1dCB1cGRhdGUgdGhlIFVSTCBzaXRlLgo+
ID4KPiA+ICBwYWNrYWdlL2JhYmVsZC9iYWJlbGQuaGFzaCB8IDIgKy0KPiA+ICBwYWNrYWdlL2Jh
YmVsZC9iYWJlbGQubWsgICB8IDIgKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9iYWJlbGQv
YmFiZWxkLmhhc2ggYi9wYWNrYWdlL2JhYmVsZC9iYWJlbGQuaGFzaAo+ID4gaW5kZXggMmUwNTEz
ZWZhMDEwLi5lNzI1YjFmZTMxMGMgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL2JhYmVsZC9iYWJl
bGQuaGFzaAo+ID4gKysrIGIvcGFja2FnZS9iYWJlbGQvYmFiZWxkLmhhc2gKPiA+IEBAIC0xLDMg
KzEsMyBAQAo+ID4gICMgTG9jYWxseSBjb21wdXRlZAo+ID4gLXNoYTI1NiAgMTU0ZjAwZTBhOGJm
MzVkNmVhOTAyODg4NmMzZGM1YzNjMzQyZGQxYTM2N2RmNTVlZjI5YTU0N2I3NTg2N2YwNyAgYmFi
ZWxkLTEuOS4yLnRhci5nego+ID4gK3NoYTI1NiAgYzhjOGMzNjk4YWZiMDBjYWE1YTVjOWJiYmIw
YTIyYjU2ZDc5YWQzZjk3NzUzODI5MTViYTk3OWFjODhjNGU4ZiAgYmFiZWxkLTEuOS4yLnRhci5n
ego+ID4gIHNoYTI1NiAgYjQxNWM0MTI5MmNlZGVmNmM5N2IyNDM2MDllNTA1NTI4ODdjMjkzNDM1
NjZjNjM5ZjIzMjgyZDMxZWZkMmFmZCAgTElDRU5DRQo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
YmFiZWxkL2JhYmVsZC5tayBiL3BhY2thZ2UvYmFiZWxkL2JhYmVsZC5tawo+ID4gaW5kZXggNzg1
ZmEyYmNlOWYxLi42N2Q2NmRhMjRmMTcgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL2JhYmVsZC9i
YWJlbGQubWsKPiA+ICsrKyBiL3BhY2thZ2UvYmFiZWxkL2JhYmVsZC5tawo+ID4gQEAgLTUsNyAr
NSw3IEBACj4gPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+Cj4gPiAgQkFCRUxEX1ZFUlNJ
T04gPSAxLjkuMgo+ID4gLUJBQkVMRF9TSVRFID0gaHR0cDovL3d3dy5wcHMudW5pdi1wYXJpcy1k
aWRlcm90LmZyL35qY2gvc29mdHdhcmUvZmlsZXMKPiA+ICtCQUJFTERfU0lURSA9ICQoY2FsbCBn
aXRodWIsamVjaCxiYWJlbGQscmVmcy90YWdzKQo+Cj4gVGhpcyBsb29rcyBvZGQuIElzbid0IHRo
ZSB2ZXJzaW9uIG5lZWRlZCBzb21ld2hlcmU/CgpJdCBzZWVtZWQgc3RyYW5nZSB0byBtZSBhcyB3
ZWxsLiBJbmRlZWQsIEkgZG9uJ3Qgc2VlIG90aGVyIHNpbWlsYXIKX1NJVEUgc2V0dGluZ3MgaW4g
QnVpbGRyb290LgpCdXQgaWYgSSBnbyB0byB0aGUgR2l0SHViIFVSTCwgdGhlc2UgYXJlIHRoZSB0
YXJiYWxsIGFkZHJlc3NlczoKaHR0cHM6Ly9naXRodWIuY29tL2plY2gvYmFiZWxkL2FyY2hpdmUv
cmVmcy90YWdzL2JhYmVsZC0xLjkuMi50YXIuZ3oKLi4uCmh0dHBzOi8vZ2l0aHViLmNvbS9qZWNo
L2JhYmVsZC9hcmNoaXZlL3JlZnMvdGFncy9iYWJlbGQtMS4xMy4xLnRhci5negoKQW0gSSBtaXNz
aW5nIHNvbWV0aGluZz8KClRoYW5rcyBhbmQgcmVnYXJkcywKRGFyaW8KCj4KPiBUaG9tYXMKPiAt
LQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9v
dGxpbi5jb20KCgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERl
dmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBD
YW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMx
MAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
