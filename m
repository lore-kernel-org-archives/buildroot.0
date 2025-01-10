Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D96CE77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 17:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 348C883BD0;
	Fri, 10 Jan 2025 17:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JCzqpzS7-A7; Fri, 10 Jan 2025 17:54:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A9D483BD1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A9D483BD1;
	Fri, 10 Jan 2025 17:54:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B249942
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 17:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58C2C41319
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 17:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OxqCN9_zPg_k for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 17:54:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E25D41317
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E25D41317
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E25D41317
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 17:54:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D43FA60140;
 Fri, 10 Jan 2025 18:54:30 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:48742])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jan 2025 18:54:30 +0100
MIME-Version: 1.0
Date: Fri, 10 Jan 2025 18:54:30 +0100
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Michael Trimarchi <michael@amarulasolutions.com>
In-Reply-To: <CABGWkvrbE2X_ooy29ichMbLa-O78y1h8tV4eFzvmb3si00cRHQ@mail.gmail.com>
References: <20250105200826.2858503-1-ju.o@free.fr>
 <CABGWkvrbE2X_ooy29ichMbLa-O78y1h8tV4eFzvmb3si00cRHQ@mail.gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <fb10e5fb8309947c46fd5da8782f6591@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736531673;
 bh=jC2rcccwQDY9ZQhjolZF7yzyZG5Puc11Xo2AnniRjpc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yh9jsbzkpRUAuJvieBBx9r1+1PPJkpCzKj+p8FGdaTNmjU+BlzFmaZojRPyKtEVrL
 0DbBUAj91HIMWWL+lFO2DGFZbgXH1OkEzES67JNKzr3t5U3XPixD1wuOmtZ1hvg33L
 YtuaS4bhFsdwi5GLhqPfclMfLdusbsZME6mPOzl3vMHlCk13Vrsck3zdReeCdvkux8
 GXpfAzNG3/4A8NxznEHmR4cwlA6E1L2UvynIv96Anbb4+4M/0uiXDzLikSmkOBwZFV
 Z/6kRcmxuE8YH5mKOe8K4qtDBG41ATf0jJRObBSWXyKLdWLu46Owq6AUuenpDij1lK
 EQYvcFFJCcQQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Yh9jsbzk
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx6ulz_bsh_smm_m2: fix kernel
 hash
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFyaW8sCgpPbiAwOS8wMS8yMDI1IDE0OjU5LCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPiBI
aSBKdWxpZW4sCj4gCj4gT24gU3VuLCBKYW4gNSwgMjAyNSBhdCA5OjA44oCvUE0gSnVsaWVuIE9s
aXZhaW4gPGp1Lm9AZnJlZS5mcj4gd3JvdGU6Cj4+IAo+PiBDb21taXQgNzUzMjBmNTY3ZCAiY29u
Zmlncy9pbXg2dWx6X2JzaF9zbW1fbTI6IGJ1bXAgVS1Cb290IHRvIDIwMjQuMTAKPj4gYW5kIExp
bnV4IHRvIDYuMS4xMjAiIHVwZGF0ZWQgdGhlIGtlcm5lbCBmcm9tIDYuMS42OCB0byA2LjEuMTIw
IGJ1dAo+PiBmb3Jnb3QgdG8gdXBkYXRlIGl0cyBwZXItY29uZmlnIGtlcm5lbCBoYXNoIGZpbGUu
Cj4+IAo+PiBUaGUgZGVmY29uZmlnIGZhaWxzIHdpdGggdGhlIGVycm9yOgo+PiAKPj4gICAgIEVS
Uk9SOiBObyBoYXNoIGZvdW5kIGZvciBsaW51eC02LjEuMTIwLnRhci54ego+PiAKPj4gVGhpcyBm
YWlsdXJlIGhhcHBlbiBzaW5jZSBjb21taXQgMDcxNDllNWYzMCAie2xpbnV4LCBsaW51eC1oZWFk
ZXJzfToKPj4gYnVtcCA1Lns0LCAxMCwgMTV9LnggLyA2LnsxLCA2LCAxMn0ueCBzZXJpZXMiIHdo
aWNoIHVwZGF0ZWQgdGhlCj4+IEJ1aWxkcm9vdCA2LjEga2VybmVsIHNlcmllcyBmcm9tIDYuMS4x
MjAgdG8gNi4xLjEyMi4KPj4gCj4+IFRoaXMgY29tbWl0IGZpeGVzIHRoZSBpc3N1ZSBieSB1cGRh
dGluZyB0aGUgaGFzaC4KPj4gCj4+IFdoaWxlIGF0IGl0LCBpdCBhbHNvIGNoYW5nZXMgdGhlICJM
b2NhbGx5IGNvbXB1dGVkIiBjb21tZW50Cj4+IGJ5IHRoZSB1cHN0cmVhbSBsaW5rIHRvIGhhc2hl
cy4KPj4gCj4+IEZpeGVzOgo+PiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9qb2JzLzg3NTE5ODMyNDMKPj4gCj4+IENjOiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8u
YmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+IENjOiBNaWNoYWVsIFRyaW1hcmNoaSA8
bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9s
aXZhaW4gPGp1Lm9AZnJlZS5mcj4KPj4gLS0tCj4+ICBib2FyZC9ic2gvaW14NnVsei1ic2gtc21t
LW0yL3BhdGNoZXMvbGludXgvbGludXguaGFzaCB8IDQgKystLQo+PiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9ib2Fy
ZC9ic2gvaW14NnVsei1ic2gtc21tLW0yL3BhdGNoZXMvbGludXgvbGludXguaGFzaCAKPj4gYi9i
b2FyZC9ic2gvaW14NnVsei1ic2gtc21tLW0yL3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+PiBp
bmRleCAyNWU0NDY0YWRiLi42ZDY5ZWFiYmQ2IDEwMDY0NAo+PiAtLS0gYS9ib2FyZC9ic2gvaW14
NnVsei1ic2gtc21tLW0yL3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+PiArKysgYi9ib2FyZC9i
c2gvaW14NnVsei1ic2gtc21tLW0yL3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+PiBAQCAtMSwy
ICsxLDIgQEAKPj4gLSMgTG9jYWxseSBjYWxjdWxhdGVkCj4+IC1zaGEyNTYgIAo+PiAzNjVmZjI2
YTMwZTIwNmRlOWIxODQ4OWY0NWQzODU4MmEwYTYxYjdjNTkxOWY4YWI4OTI5NWE0NzMxNjc4NGUx
ICAKPj4gbGludXgtNi4xLjY4LnRhci54ego+PiArIyBGcm9tIGh0dHBzOi8vd3d3Lmtlcm5lbC5v
cmcvcHViL2xpbnV4L2tlcm5lbC92Ni54L3NoYTI1NnN1bXMuYXNjCj4+ICtzaGEyNTYgIAo+PiA2
MWM5OTdiOGFjYmJiOGFiMTg0NTY1ZTk2ZjQ3NmVjYmI3ZTc3M2NiMzViOThhMWE0YzgzMmQ4MDli
MmJmNzE5ICAKPj4gbGludXgtNi4xLjEyMC50YXIueHoKPj4gLS0KPj4gMi40Ny4xCj4+IAo+IAo+
IFJldmlld2VkLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0
aW9ucy5jb20+CgpUaGFua3MgZm9yIHJldmlld2luZyEgSSBhcHBsaWVkIHRvIG1hc3Rlci4KCj4g
VGhhbmtzIGFuZCByZWdhcmRzLAo+IERhcmlvCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
