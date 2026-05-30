Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E16CD6E54
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E2AF61AC4;
	Sat, 30 May 2026 13:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xEoExYujZSIy; Sat, 30 May 2026 13:58:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87B5161607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780149486;
	bh=/ogPudCAEJHZZtgaNVv/J4cB0S379LopSAxdxuKkE1g=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=jt/QoY2/GPNDFnTHw/zyw2dlqwekTzznATxDfczrfwWOOuXF1h/ykIzP7qJhP1Z6M
	 ANZ/VEV1Cjce4XSqVhE5gt60lBtLoPoeQlO94gytHwjTu/eDpFDE/XK6ujPq1Cpp7D
	 fU2UxU+Iip+/kLn9e6GPGRV7+N5uCe0Y7J46fYeMCoDvPWodn9lrKGjIX/lmZ5Z1O0
	 Bbz97C0J+96cgHqKOSBK9rlnnYLfeV6W33GsIzOEOKpXPZXKEgCQEdGevH/0cLkWzf
	 pTkKPAH1tc2yC/JkcmHA0EMVdUKO0Jn3Vzy+zAEJ+xlfVTFDUZmaUAtwJ1VWLNGxNJ
	 iU1hmYoewJQjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87B5161607;
	Sat, 30 May 2026 13:58:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A143C12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8661640608
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mU_i5Un6rjSk for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:58:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A1F74025D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A1F74025D
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A1F74025D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:58:03 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48fde648a71so96582425e9.0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 06:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780149482; x=1780754282;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wmHgom8GrAyBn4sJ/cJljqLn54Bo9Ir6sx7IH/YmwI4=;
 b=MIrtBx/pPJM2HphrBvPSLIsJja6U1jw40ISU+xVVG9wJCigSCqTUSYPdG8zZcaFC9D
 K1L+pL83u1sILM85gQRZRJPuKK6+8H6QcgW8GKzdLE8EryfLavYLSgxWV8Hg2S+W5f97
 vsJPUIY9IeYEHZGR3Z7cfr9HuAycCXUFHi0SWQKJpBBfIUn0MGUKKyLzFTVOxNec33YB
 eMMcgVJ6VyE9Typq4zvy3H2sa+RLvGFuyTerwNdDrsKDW1I8ftcEuJ+mY7FrV40U30RS
 0ro2GmYsMVRCFIX9E0LnEluKu65XEPHtsHj25xvxCPx225R5RYZuoaMkwIHlAMpG5gfB
 xHDw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/dX0Mi73JlA/IOOBNQmifdct/KO1mCuOQNhgfqmsjanlbZ2iIdoPFjMHYozS9BCpPgUnNJGm6pGn4=@buildroot.org
X-Gm-Message-State: AOJu0Yy7jN8A0A7If1gPXO0HmRdnACng41RJrVQqFfkoXND/0NPrNyto
 xyMT/CoQh3Q30mLS48eIeCHyDdZDntkt6v5O8ajoJ4nJBcKPpDmJcoNZSjlpsH8KStY=
X-Gm-Gg: Acq92OF2MYn0teMo8XWwiALv5N86UQYkGZTSAla34xmr+Zj0mx1YNsUlppqRzE0NSTF
 GcOukufmJg+7xb9BRAG18UKPCu0zTPA2mcjfILYxx6v84qJl1if9lqAsbhE3sVfpepar972lIjY
 KwgNfbx6aBT8b40X+lwuPJYV5ODfXfR48MJwqxEfVX5k9Uv+YW/ad66XflrstcmyF+YNnt2GmMe
 t1xLB30Tx2Am12y11KwWkI9S9/vdHqSVA5G7L3tfa4pb2Sx/WrG8AH+EM2XG+KVS02Qd2Ewg858
 wZsKj/eHfusbuM+oQue8+4BuPhLFxggnTCRUZa19Zjx6wZcs+We2NUrT8rfkNeYTkOugww42Thx
 671PlyAmmzqdY8bB0MYMJfu+hVvC88bVG4eeNnOgRRfAaGCraXrNQ8JSPpbhWanPmQrEaEj7IEB
 TncS10lEUcPekPkIKPCj5hbQPNjREMrApu4TDMN8XUzIYHwj8ffYPSaj+QxcwIO84bh8BvFuDvH
 7d03Unxo/8hpNlUOKM=
X-Received: by 2002:a05:600c:a08b:b0:48f:d620:c27f with SMTP id
 5b1f17b1804b1-490a2a7c401mr49315665e9.4.1780149481949; 
 Sat, 30 May 2026 06:58:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:1015:b940:d4d1:7b69:edd2:59ef?
 ([2a01:e0a:1015:b940:d4d1:7b69:edd2:59ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909ca65f54sm109637235e9.5.2026.05.30.06.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 May 2026 06:58:01 -0700 (PDT)
Message-ID: <11e045a4-23da-4dab-887b-234c2368b0f6@mind.be>
Date: Sat, 30 May 2026 15:58:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
References: <22a288c8-0eb8-496d-a966-cee7ac5d244f@mind.be>
 <E9A4658A-E2FC-4096-B39C-1195F1278833@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <E9A4658A-E2FC-4096-B39C-1195F1278833@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780149482; x=1780754282; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wmHgom8GrAyBn4sJ/cJljqLn54Bo9Ir6sx7IH/YmwI4=;
 b=dwLfBvyuPSTLrZXvM+/zMMSLTTpjzccuWcEQgoDpNf/fflvo3DUxf9uBPRMxDtubEx
 Jj3ZcMOrjX+m0vCZt45c9e+CLj5sgsJ4lQ+HqiCYCN1nSfF2it4nOdayzIdLTgG3rc0l
 AJpU/eafs3wAGpIUZFbk7EWtI7OX1mFjdQ78DXLqWBYug1XS54lhwZeKVH1rW7tkGaHa
 IV9F6JMQmr/+oxxeuZwd2mvhUcGEs31wIt3xIN3bBiL3p7t7pJxrXdfYszwAItp0dqnd
 tWC3erghS/2snkPIMlwI+0cwrfLJEgPrkSfRo0I5V86lGhigUewOmrvz1XLCJ0SeLe7g
 y5xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dwLfBvyu
Subject: Re: [Buildroot] [PATCH for next] package/uclibc: bump to 1.0.58
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gYWdhaW4gZXZlcnlvbmUsCgpPbiAzMC8wNS8yNiAxNDo1NSwgV2FsZGVtYXIgQnJvZGtv
cmIgd3JvdGU6Cj4gSGksCj4KPiBQbGVhc2Ugd2FpdCBhIGxpdHRsZSBiaXQuIEkgbmVlZCB0byBw
cmVwYXJlIGFub3RoZXIgcmVsZWFzZSBzb29uLCB3ZSBoYXZlIHNvbWUgcmVncmVzc2lvbnMgZm9y
IG5vbW11IHRhcmdldHMgaW4gdGhpcyBSZWxlYXNlLgo+IEJlc3QgcmVnYXJkcwo+ICAgV2FsZGVt
YXIKCkFjdHVhbGx5LCB0aGUgdWNsaWJjIGJ1bXAgZG9lcyBOT1Qgc29sdmUgdGhlIGlzc3VlIHdp
dGggCmJvb3RsaW4tYXJtdjUtdWNsaWJjLgpJIGhhZCBhIGxvY2FsIHBhdGNoIGZvciBzYW1iYTQg
dGhhdCBhY3R1YWxseSBmaXhlZCB0aGUgaXNzdWU7IGJ1dCBmb3Jnb3QgCmFib3V0IGl0LCBhbmQg
dGhlcmVmb3JlIEkgbWlzdGFrZW5seSBkZXRlcm1pbmVkIHRoYXQgdGhlIHVjbGliYyBidW1wIAp3
b3VsZCBmaXggdGhlIGlzc3VlIHdpdGggYSBwcmVidWlsdCBib290bGluIHRvb2xjaGFpbi4KVGhl
IHNhbWJhNCBpc3N1ZSB3aXRoIHVjbGliYyB3aWxsIG9ubHkgYmUgZml4ZWQgd2hlbiBidWlsZGlu
ZyB3aXRoIGEgCnRvb2xjaGFpbiB0aGF0IGluY2x1ZGVzIHVjbGliYyA+PTEuMC41OC4KCk5vdCBz
dXJlIGlmIGl0IGlzIHN0aWxsIHdvcnRoIHRvIGluY2x1ZGUgaXQgaW4gbWFzdGVyIHVuZGVyIHRo
b3NlIApjaXJjdW1zdGFuY2VzLgoKRm9yIHRoZSByZWNvcmQsIHRoZSBzYW1iYTQgYnVpbGQgZXJy
b3Igd2l0aCB1Y2xpYmM8MS4wLjU4OgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIMKgIMKg
IC4uLy4uL2xpYi91dGlsL2NoYXJzZXQvaWNvbnYuYzogSW4gZnVuY3Rpb24g4oCYc3lzX2ljb252
4oCZOgogwqAgwqAgLi4vLi4vbGliL3V0aWwvY2hhcnNldC9pY29udi5jOjE2NjozODogZXJyb3I6
IHBhc3NpbmcgYXJndW1lbnQgMSBvZiAK4oCYaWNvbnbigJkgbWFrZXMgaW50ZWdlciBmcm9tIHBv
aW50ZXIgd2l0aG91dCBhIGNhc3QgWy1XaW50LWNvbnZlcnNpb25dCiDCoCDCoCDCoCAxNjYgfMKg
IMKgIMKgIMKgIMKgaWYgKHJldCA9PSAoc2l6ZV90KS0xKSBpY29udihjZCwgTlVMTCwgTlVMTCwg
TlVMTCwgCk5VTEwpOwogwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIF5+CiDCoCDCoCDCoCDCoCDCoCB8wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfAogwqAg
wqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHZvaWQgKgogwqAgwqAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uLy4uL2xp
Yi9yZXBsYWNlL3N5c3RlbS9pY29udi5oOjQzLAogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBmcm9tIC4uLy4uL2xpYi91dGlsL2NoYXJzZXQvaWNvbnYuYzoyMjoKL2hvbWUvdGl0b3Uv
YnItdGVzdC1wa2ctbmV4dC9ib290bGluLWFybXY1LXVjbGliYy9ob3N0L2FybS1idWlsZHJvb3Qt
bGludXgtdWNsaWJjZ251ZWFiaS9zeXNyb290L3Vzci9pbmNsdWRlL2ljb252Lmg6MjA6MTU6IApu
b3RlOiBleHBlY3RlZCDigJhpY29udl904oCZIHtha2Eg4oCYbG9uZyBpbnTigJl9IGJ1dCBhcmd1
bWVudCBpcyBvZiB0eXBlIOKAmHZvaWQgKuKAmQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
CkFuZCBtYW55IHNpbWlsYXIgZXJyb3JzLiBUaGlzIGhhcHBlbnMgYmVjYXVzZSB1Y2xpYmMgZGVm
aW5lcyBpY29udl90IGFzIApgbG9uZyBpbnRgLCB3aGlsZSBvdGhlciBsaWJDcyBkZWZpbmUgaXQg
YXMgYSBwb2ludGVyLgoKU29ycnkgZm9yIHRoZSBub2lzZSwKVGl0b3VhbgoKPgo+PiBBbSAzMC4w
NS4yMDI2IHVtIDExOjU1IHNjaHJpZWIgVGl0b3VhbiBDaHJpc3RvcGhlIDx0aXRvdWFuLmNocmlz
dG9waGVAbWluZC5iZT46Cj4+Cj4+IO+7v0hlbGxvIEp1bGllbiwgV2FsZGVtYXIgYW5kIGFsbCwK
Pj4KPj4gSSBiZWxpZXZlIHdlIHNob3VsZCBhbHNvIGFwcGx5IHRoaXMgb24gbWFzdGVyOgo+Pgo+
Pj4gT24gMjUvMDUvMjYgMTQ6MzUsIEp1bGllbiBPbGl2YWluIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4+Pj4gT24gMjUvMDUvMjAyNiAwODoyNiwgV2FsZGVtYXIgQnJvZGtvcmIgd3JvdGU6Cj4+Pj4g
TmV3IHJlbGVhc2Ugd2l0aCBmb2xsb3dpbmcgY2hhbmdlczoKPj4+Pgo+PiBbLS0gc25pcCAtLV0K
Pj4+PiBXYWxkZW1hciBCcm9ka29yYiAoNyk6Cj4+Pj4gICAgICAgIGJpdHMvc3RhdHguaDogYWRk
IHNvbWUgbWlzc2luZyBkZWZpbmVzCj4+Pj4gICAgICAgIGJpdHMvc3RhdHguaDogc3luYyBzdHJ1
Y3Qgd2l0aCBnbGliYwo+Pj4+ICAgICAgICBzeXMvZmFub3RpZnkuaDogc3luYyB3aXRoIG11c2wK
Pj4+PiAgICAgICAgbGliaWNvbnY6IGZpeCB0eXBlZGVmIG9mIGljb252X3QKPj4gXl5eXl5eXl5e
Xl5eXl5eXl5eCj4+IFRoaXMgdWNsaWJjIGxpYmljb252IGNvbW1pdCBhY3R1YWxseSBmaXhlcyBh
IHNhbWJhNCBidWlsZCBmYWlsdXJlLgo+PiBUaGUgaXNzdWUgaXMgcHJlc2VudCBvbiBtYXN0ZXIs
IGFuZCBubyBsb25nZXIgb24gbmV4dCAodGVzdGVkIHdpdGggLi91dGlscy90ZXN0LXBrZyAtcCBz
YW1iYTQgLVQgYm9vdGxpbi1hcm12NS11Y2xpYmMpLgo+Pgo+PiBLaW5kIHJlZ2FyZHMsCj4+IFRp
dG91YW4KPj4+PiAgICAgICAgbWlzYzogYWRkIHVuaWNvZGUgY2hhcmFjdGVyIGZ1bmN0aW9ucyAo
YzExKQo+Pj4+ICAgICAgICBuZXRpbmV0L3RjcC5oOiBzeW5jIHdpdGggZ2xpYmMKPj4+PiAgICAg
ICAgYnVtcCB2ZXJzaW9uIGZvciAxLjAuNTggcmVsZWFzZQo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1i
eTogV2FsZGVtYXIgQnJvZGtvcmIgPHdieEBvcGVuYWRrLm9yZz4KPj4+IEFwcGxpZWQgdG8gbmV4
dCwgdGhhbmtzLgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCj4+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
