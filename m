Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEFBC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:53:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAA1C61029
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAA1C61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0D4A8191E;
	Thu, 19 Aug 2021 21:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LBdZsd22hGD9; Thu, 19 Aug 2021 21:53:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8316819E6;
	Thu, 19 Aug 2021 21:53:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10BFE1BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F356840176
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ZQLt0pMyGL7 for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:53:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0425F4011D
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:53:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9904:2733:9b91:ffcc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id F031C2003BE;
 Thu, 19 Aug 2021 23:53:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629410014;
 bh=2StlLLX2i63CnUKaglv/4TqjfwTNKuYdvqpKkrZjKpY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J9kWbKXFrbTkWuDbZ1VtjX21X/2hWsicmZw1XT+1yoc1xmtuYowKmB9TthZV4b215
 dA+UyqGhkjTU+47btnDRVqlfDxcGpgPeh9IbazeLvFvFMeBc9Xj48dZ4o5sK68pKXj
 F4ItZRz/gsBVpuAd+yyPy52SI0jvp4cV8jKaZAqquHocHF7eN57oaZbCL4oRONL5J1
 XkuszFVo3YVmCm7qNt9W2badNayO3vFTXlTyO5/uenoV0UchJ+4aAg7AT7ZZ5yFlqz
 25GY8tfzFaiQ1fn9dApPkS2rOsd0wVGKGnDMhSXaJy/4tgCYvvhKc1F8v4xNhfhMJn
 4TGTZ8sQPqplA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 19 Aug 2021 23:53:25 +0200
Date: Thu, 19 Aug 2021 23:53:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210819215325.GK27036@scaer>
References: <20210819160351.1045591-1-fontaine.fabrice@gmail.com>
 <20210819204326.GD27036@scaer>
 <CAPi7W838Rd84Gor1+eRAZYq66KQ4q73JieLKX0QfAWKiWoCG4w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W838Rd84Gor1+eRAZYq66KQ4q73JieLKX0QfAWKiWoCG4w@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/mpv: fix build of vaapi with
 egl-drm
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

RmFicmljZSwgQWxsLAoKT24gMjAyMS0wOC0xOSAyMzozMSArMDIwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gTGUgamV1LiAxOSBhb8O7dCAyMDIxIMOgIDIyOjQzLCBZYW5uIEUu
IE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgo+ID4gT24gMjAyMS0w
OC0xOSAxODowMyArMDIwMCwgRmFicmljZSBGb250YWluZSBzcGFrZSB0aHVzbHk6Cj4gPiA+IEJ1
aWxkIG9mIHZhYXBpIHdpdGggZWdsLWRybSBpcyBicm9rZW4gc2luY2UgY29tbWl0Cj4gPiA+IDZl
YzQ3YzRlNTljN2M4YzU3ZTk3MmRhYjk4NWM4YTJiYTBiZjcxNzQgYmVjYXVzZSBlZ2wtZHJtIGlz
IGEgcGFydCBvZiBnbAo+ID4gPiBncm91cCB3aGljaCBpcyBvbmx5IGVuYWJsZWQgaWYgQlIyX1BB
Q0tBR0VfSEFTX0xJQkdMIG9yCj4gPiA+IEJSMl9QQUNLQUdFX0hBU19MSUJHTEVTIGFyZSBzZXQ6
Cj4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9tcHYtcGxheWVyL21wdi9ibG9iL2VjMDAwNmJmYTFh
YWY2MDhhNzE0MTkyOWYyODcxYzg5YWM3YTE1ZDYvd3NjcmlwdCNMNTcyCj4gPiA+Cj4gPiA+IEZp
eGVzOgo+ID4gPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9lNWMx
NTIyOGY0MmE3M2Y4YzM0YjI2NjMwYjIwNzRjMzBlNWY1OTY2Cj4gPgo+ID4gVGhpcyBpc3N1ZSBp
cyBhYm91dCBtaXNzaW5nIFgxMSwgc28gSSBhbSBub3Qgc3VyZSBJIHNlZSB0aGUgcmVsYXRpb24K
PiA+IHdpdGggdGhpcyBjaGFuZ2UuLi4KPiBUaGlzIGlzc3VlIGlzIG5vdCBhYm91dCBtaXNzaW5n
IFgxMSBkZXNwaXRlIHdoYXQgaXMgYmVpbmcgZGlzcGxheWVkIGluCj4gdGhlIGxvZyBtZXNzYWdl
Lgo+IHZhYXBpIGhhcyB0aGUgZm9sbG93aW5nIGRlcGVuZGVuY2llcyBhcyB3cml0dGVuIGluCj4g
aHR0cHM6Ly9naXRodWIuY29tL21wdi1wbGF5ZXIvbXB2L2Jsb2IvZWMwMDA2YmZhMWFhZjYwOGE3
MTQxOTI5ZjI4NzFjODlhYzdhMTVkNi93c2NyaXB0I0w2MzI6Cj4gJ2RlcHMnOiAnbGliZGwgJiYg
KHgxMSB8fCB3YXlsYW5kIHx8IGVnbC1kcm0pJywKPiAKPiBJbiB0aGUgYXV0b2J1aWxkZXIgZmFp
bHVyZSwgd2UgdHJ5IHRvIGVuYWJsZSB2YWFwaSBiZWNhdXNlCj4gQlIyX1BBQ0tBR0VfTVBWX1NV
UFBPUlRTX1ZBQVBJIGlzIHNldCB0byB0cnVlIGJlY2F1c2UKPiBCUjJfUEFDS0FHRV9MSUJEUk0g
YW5kIEJSMl9QQUNLQUdFX01FU0EzRF9PUEVOR0xfRUdMIGFyZSBhbHNvIHNldCB0bwo+IHRydWUu
Cj4gSG93ZXZlciwgYXMgd3JpdHRlbiBpbiBteSBjb21taXQgbWVzc2FnZSwgdGhpcyBmYWlscyBi
ZWNhdXNlIHdlIGFsc28gZGlzYWJsZSBnbC4KCkFoLCBPSy4KCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gPiAtLS0K
PiA+ID4gIHBhY2thZ2UvbXB2L21wdi5tayB8IDMgKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21wdi9tcHYu
bWsgYi9wYWNrYWdlL21wdi9tcHYubWsKPiA+ID4gaW5kZXggOTFlMzFkZDE1MC4uZjhlY2FlYjc4
YSAxMDA2NDQKPiA+ID4gLS0tIGEvcGFja2FnZS9tcHYvbXB2Lm1rCj4gPiA+ICsrKyBiL3BhY2th
Z2UvbXB2L21wdi5tawo+ID4gPiBAQCAtMTQ4LDYgKzE0OCw5IEBAIE1QVl9ERVBFTkRFTkNJRVMg
Kz0gbGliZ2wKPiA+ID4gIGVsc2UgaWZlcSAoJChCUjJfUEFDS0FHRV9IQVNfTElCR0xFUykseSkK
PiA+ID4gIE1QVl9DT05GX09QVFMgKz0gLS1lbmFibGUtZ2wKPiA+ID4gIE1QVl9ERVBFTkRFTkNJ
RVMgKz0gbGliZ2xlcwo+ID4gPiArZWxzZSBpZmVxICgkKEJSMl9QQUNLQUdFX0hBU19MSUJFR0wp
LHkpCj4gPiA+ICtNUFZfQ09ORl9PUFRTICs9IC0tZW5hYmxlLWdsCj4gPiA+ICtNUFZfREVQRU5E
RU5DSUVTICs9IGxpYmVnbAo+ID4KPiA+IEhlcmUsIHlvdSBhcmUgY2hlY2tpbmcgd2l0aCBCUjJf
UEFDS0FHRV9IQVNfTElCRUdMLCBidXQgaW4gdGhlIHByZXZpb3VzCj4gPiBwYXRjaCwgYXMgbm90
ZWQgYnkgVGhvbWFzLCB5b3UgdXNlZCBCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0VHTC4KPiA+
Cj4gPiBBbnkgcmVhc29uIGZvciB0aGUgZGlzY3JlcGFuY3k/Cj4gWWVzLCBiZWNhdXNlIGVnbC1k
cm0gKGFuZCBzbyB2YWFwaS1kcm0pIGRlcGVuZHMgb24gZ2JtOgo+ICdkZXBzJzogJ2RybSAmJiBn
Ym0gJiYgZWdsJywKCll1cCwgSSBrbm93IGhhdmUgc2VlbiB5b3VyIGV4cGxhbmF0aW9ucyBhYm91
dCBnYm0gb24gdGhlIHByZXZpb3VzIHBhdGNoCnRvby4KCj4gQnV0IGdsIChhbmQgc28gdmFhcGkp
IGRvZXMgbm90IG9ubHkgZGVwZW5kcyBvbiBlZ2wtZHJtLCBpdCBjYW4gYmUKPiBlbmFibGVkIGlm
IHdheWxhbmQgYW5kIGVnbCBhcmUgYXZhaWxhYmxlIChnbC13YXlsYW5kKToKPiAnZGVwcyc6ICdn
bC1jb2NvYSB8fCBnbC14MTEgfHwgZWdsLXgxMSB8fCBlZ2wtZHJtIHx8ICcKPiArICdnbC13aW4z
MiB8fCBnbC13YXlsYW5kIHx8IHJwaSB8fCAnCj4gKyAncGxhaW4tZ2wnLAo+ID4KPiA+IEFuZCBs
b29raW5nIGZyb20gZnVydGhlciBhd2F5LCBpdCBsb29rcyBsaWtlIHRoZSB0d28gcHJvYmxlbXMg
YXJlIHJlYWxseQo+ID4gcmVsYXRlZCBvbmUgdG8gdGhlIG90aGVyLCBhbmQgc28gbWF5YmUgbmVl
ZCB0byBiZSBmaXhlZCBpbiB0aGUgc2FtZQo+ID4gcGF0Y2guLi4KPiBJTUhPLCB0aGV5IGFyZSBu
b3QgcmVsYXRlZCBidXQgSSBjYW4gbWVyZ2UgYm90aCBpZiB5b3UgcHJlZmVyLiBCZXJuZAo+IHdo
YXQgaXMgeW91ciBvcGluaW9uPwoKTm8sIHdpdGggeW91ciBleHBsYW5hdGlvbnMsIHNlcGFyYXRl
IHBhdGNoZXMgbWFrZSBzZW5zZS4KCkNhbiB5b3UgcmVzcGluIGJvdGggd2l0aCBjb21taXQgbG9n
cyBleHBhbmRlZCB3aXRoIHlvdXIgcmVzcGVjdGl2ZQpleHBsYW5hdGlvbnMsIHBsZWFzZT8KClJl
Z2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ID4gUmVnYXJkcywKPiA+IFlhbm4gRS4gTU9SSU4uCj4g
Pgo+ID4gPiAgZWxzZQo+ID4gPiAgTVBWX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtZ2wKPiA+ID4g
IGVuZGlmCj4gPiA+IC0tCj4gPiA+IDIuMzAuMgo+ID4gPgo+ID4gPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBidWlsZHJvb3QgbWFpbGluZyBs
aXN0Cj4gPiA+IGJ1aWxkcm9vdEBidXN5Ym94Lm5ldAo+ID4gPiBodHRwOi8vbGlzdHMuYnVzeWJv
eC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiA+Cj4gPiAtLQo+ID4gLi0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4KPiA+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVk
IHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gPiB8ICszMyA2NjIg
Mzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAg
ICAgICAgICAgICAgfAo+ID4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0t
OiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiA+IHwgaHR0cDovL3lt
b3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNv
bnNwaXJhY3kuICB8Cj4gPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwo+IEJlc3QgUmVnYXJkcywK
PiAKPiBGYWJyaWNlCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJ
TiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNw
aXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FN
UEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0t
LS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwK
fCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAg
IHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
