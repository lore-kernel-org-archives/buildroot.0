Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724A7C43458
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 10:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DA5F40DEE;
	Thu,  9 Jul 2026 10:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A1ltp4DUf1j8; Thu,  9 Jul 2026 10:04:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CA0D40DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783591469;
	bh=D0HdZSISqFMnb9RuXWuXmvriwR4xGglrtjdshF0rXAE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DiLipsbMmoecVOXUL52sPb4LnSEpWBiizehQWAl/9UttXujfIwyVAOS/3pWHLYWqG
	 PEuaQNL9vnputvtzEr92/jgiLwWeRU/nigyyKtmqIoZo3a7YEEfDQEVUVGTPJ4+BQ5
	 89l3IXMjsIMShOO1Yy5Ex2061LzAE4yng5kc8NZjLdV9PeFvUSwdc6Wq0MwXjEc5Zj
	 2yYhYg2xFuyE9RQJsxw1YR0fYnG0pAmPA66FcLeq3Q2uFmFgNacU5A0a+WUzVoBMCV
	 sQJjNiQdpYKo9re/5nw95RwR5nyfqP6GDx5HQdR3PoZWUH1ONcBDxnKBCgaAwX4ilW
	 RhWOTelv0m+3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CA0D40DF1;
	Thu,  9 Jul 2026 10:04:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88420315
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 10:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71CAD81F66
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 10:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uigv0TGbTlEB for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 10:04:26 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9243A81F67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9243A81F67
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9243A81F67
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 10:04:24 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-c9b373d5af0so1233608a12.2
 for <buildroot@buildroot.org>; Thu, 09 Jul 2026 03:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783591463; cv=none;
 d=google.com; s=arc-20260327;
 b=giWyjv6R8J/SHtSKTL4aCBHFd65s4KUPEvu+l02A69BoY5Pp+r/aujUinc6iNcsJ1K
 tXvtq/amZU9LHJS96pzYZTlKry4cx89O8GA5bpPMWHOI5IzaBuPGNz8gwBKCndsOrWRo
 WyQpvW6TlZPz6iXE5iLfTytcTJQ8nOdFDGfuK+Epgx6QxBFjTnBT5bT1pJ+SYsu70kab
 mxV43Yab+S44H9KaeSuvC8u8+de/FkgfrErYMZjoGOJ3tW+4ZNEB0QUqMr7J9LJepLaK
 TJs4X+GrkDUIufrW0zzondOojL7Q3mFE+6wPBthW1p2IR06AcQASDgXoHqpCgpTlv/Ex
 XulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ZEvE8SJLHR/jFGTU/BV2tEW5lDmD+kSrPwwT4NIwllc=;
 fh=0gwSQHHBBrd4SWYbfcl1R30TXmbgciNey5bnaaMKqY0=;
 b=EhIDzYhW+5rFTGSYYN5VS4XxlFo+5hMmfzzxZIfAk73OyJIymgHOVUqR/CVziIM016
 k3Cvkdu5AgkjFR2tlTkaXfH0ANH7ZABOLLs4YoG8f85yxdpD+kbv86rzC3YY+petJ8FH
 AN0y8jhBdok0caD1D9rtJWU8b4WR5v75RBIywiAdiZ6pY9NhBgMSvBZDIKZtTmR5wOmy
 ttpflCgG6d7MIdT33E8RiUdmFvmqn59xM9Et0VG90JugkAJHap0r3MlImlpaK+VQ6v+6
 lZFAhHogcSJLZIKD/YC1loUNY/CUg+gCqp6iOl+crml9HcH8Akt0+Q5l4/S1AicJweYg
 JdlQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783591463; x=1784196263;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZEvE8SJLHR/jFGTU/BV2tEW5lDmD+kSrPwwT4NIwllc=;
 b=BR6MRrRphd59MYmKseIPUL9XAI3B3N2HpfQE4a2y5lgZCVNRari+DLp52588zHW3uv
 a3AnXHJL827BG4zsGcLWviO76x2PEHxG7l6ewSuu999uah0jiXgYRfJ0jTtp2sBVX5CN
 5PQhjZKtFVIslkRRSXLZgiTuJ4x1sTjh4jT3Oi7Uu6dDg/cFtxhXBkEwBL6syJZFHPI+
 Fm45uJYK5Z2TWwKXd7QkFqRbKUL0EeNHfsRFWk5EsZFK6u+l8I/ixUu8jDE5dOtVbEy5
 i4pYbMskMqVdF3x27YCAn5gCGhZyHAtQH6YYu1udZ+WH2UtkCsMdjIeEX+OL/Q04erTj
 oSpg==
X-Gm-Message-State: AOJu0YwZsA4JRn8e51RlPL95fxCkQwAiE9mSMT+aRCdB0PFJej4lOJqy
 GcpF84RRjEKoYYjocBNbta5EJiLr1b9rUkJOUW+g6tncHSBKHLY428oQADxlWhZzcx+irfvLYxW
 VCn8aH/aR+/0BZ6aod46MrzoMgDylwCuGNo+6rtjc5w==
X-Gm-Gg: AfdE7cmseXB4bWFPdtGQ855IxGeZj5iHxA5obHh8VoBet+Ee+clv/p0KRQmVENveVJG
 s+m8DSCVuzgu9d8TcoT0U+vIPdXb7lNGtiN7qdeN99Ts6N0p1KxE41OJtjkS5kHQDd/f6Fs/kZO
 s81og+n7sZOpLRwYBfRx5gvFw6u+7lNJCMihyjzb89z6vX3kqkHZgV6vTthgk5mL+fDENpP5oPu
 Z8wrjCMKU6a33i41OEKvd3JubndYafW6Ki+Aj4zvK9Fm0m/jQA6XF/MiFjMCoJwUlpDurpXQP8C
 ZAigZ5NP
X-Received: by 2002:a05:6a21:a38b:b0:3bf:a26e:3dbc with SMTP id
 adf61e73a8af0-3c0bc9b1499mr8385470637.19.1783591463194; Thu, 09 Jul 2026
 03:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260703023758.3883041-1-matt@thewebers.ws>
In-Reply-To: <20260703023758.3883041-1-matt@thewebers.ws>
From: John Ernberg <j@j-ernberg.se>
Date: Thu, 9 Jul 2026 12:04:12 +0200
X-Gm-Features: AVVi8Ce3wFOd7uis2_Fv48Z4HkeazcxTy0eI390QgX1ldmZLeGrgPNsxb8hq3Ok
Message-ID: <CAAHg4Zg8g5sxprMwQnUYpnApD18k8SrqBhuBzfk=6qhEospE=w@mail.gmail.com>
To: matt@thewebers.ws
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matthew Weber <mathew.l.weber3@boeing.com>, 
 Neal Frager <neal.frager@amd.com>, Julien Olivain <ju.o@free.fr>, 
 =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>, 
 Titouan Christophe <titouan.christophe@mind.be>,
 John Ernberg <john.ernberg@actia.se>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1783591463; x=1784196263;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZEvE8SJLHR/jFGTU/BV2tEW5lDmD+kSrPwwT4NIwllc=;
 b=KubnPwi9hQPFsHV9CntYXVxoK+8LGhGqO6P6Sshkq995jy8DO5qGb2vghI9VPh0p60
 rb6/4z0+JVYYhdfTTLjLKHXavbQxyrofhDz5mn4pU5XM8hSFLFu7K0N4vUCi4JagJUtb
 ruBoSPaGamghk5BXqTrqNhOByh2o69sLYnDlZnQyieYXJUjmlLFHdf52zcS9ZLRWvH4T
 SrFOkOzmA/a4nQkY5B7oy1TLf9PpsxNmbVj+LmhXCrwEZSyWJHfTqdAxuj5zjtHft14l
 lZd5Fe+DN8zDTu41fksJvmMF1nQiRAavqkIcLP+2DfWu8Jxp+ZvUQfSbnqiQK3QxSqC9
 pHcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=KubnPwi9
Subject: Re: [Buildroot] [PATCH] package/xen: bump to 4.21.1
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

SGkgTWF0dGhldywKCkFwb2xvZ2llcyBmb3IgdGhlIGRlbGF5LgoKT24gRnJpLCBKdWwgMywgMjAy
NiBhdCA0OjM44oCvQU0gPG1hdHRAdGhld2ViZXJzLndzPiB3cm90ZToKPgo+IEZyb206IE1hdHRo
ZXcgV2ViZXIgPG1hdGhldy5sLndlYmVyM0Bib2VpbmcuY29tPgo+Cj4gQnVtcCBYZW4gZnJvbSA0
LjE5LjUgdG8gNC4yMS4xLgo+Cj4gUmVzb2x2ZWQgaW4gdmVyc2lvbiBidW1wOgo+IC0gMDAwMi1B
cm0tcGxhdGZvcm1zLWZpeC1idWlsZC13aXRoLWdjYzE1LnBhdGNoCj4gICBVcHN0cmVhbTogaHR0
cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1jb21taXRkaWZmO2g9Mzlm
OTUwODllMmJhMTVjNTQzOGNlOTA0YzBjYmJkOGQ3OWQzZTZlNwo+Cj4gVGhlIGdpdC1jaGVja291
dC5zaCBmaXggZm9yIG5vbi1tYXN0ZXIgYnJhbmNoIGNoZWNrb3V0IGlzIG5vdyBpbmNsdWRlZDoK
PiAgIGh0dHBzOi8veGVuYml0cy54ZW5wcm9qZWN0Lm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNv
bW1pdGRpZmY7aD0wMWZiMjNkZDcxMDA2ZDg3ZTg3NGYzMTBlOWM1MGYzMTU4MmYyNzRlCj4KPiBS
ZW1haW5pbmcgcGF0Y2hlcyByZWZyZXNoZWQgZm9yIHVwZGF0ZWQgY29udGV4dDoKPiAtIDAwMDEt
Tm8tdHJhY2UtYmFja2VuZC5wYXRjaCAoQnVpbGRyb290IHNwZWNpZmljLCBjcm9zcy1jb21waWxl
IHdvcmthcm91bmQpCj4gLSAwMDAyLVVwZGF0ZS1saW5rZXItZmxhZ3MucGF0Y2ggKEJ1aWxkcm9v
dCBzcGVjaWZpYywgY3Jvc3MtY29tcGlsZSB3b3JrYXJvdW5kKQo+Cj4gU3RhcnRpbmcgd2l0aCBY
ZW4gNC4yMCwgcWVtdS14ZW4gaXMgbm8gbG9uZ2VyIGJ1bmRsZWQgaW4gdGhlIHJlbGVhc2UKPiB0
YXJiYWxsLiBBZGQgYSBuZXcgcWVtdS14ZW4gcGFja2FnZSB0aGF0IHByb3ZpZGVzIHRoZSBxZW11
LXhlbiBzb3VyY2UKPiB0cmVlIHdpdGggcmVxdWlyZWQgbWVzb24gc3VicHJvamVjdHMgcHJlLXBv
cHVsYXRlZC4gVGhpcyBhdm9pZHMgYW55Cj4gbmV0d29yayBhY2Nlc3MgZHVyaW5nIHRoZSBidWls
ZC4KPgo+IE5ldyBkZXBlbmRlbmNpZXM6Cj4gLSBxZW11LXhlbiAocHJvdmlkZXMgcWVtdS14ZW4g
c291cmNlIGZvciB0b29scyBidWlsZCkKPiAtIGhvc3QtcHl0aG9uLWRpc3RsaWIgKG5lZWRlZCBi
eSBRRU1VJ3MgbWt2ZW52KQo+Cj4gVGhlIHFlbXUteGVuIHBhY2thZ2U6Cj4gLSBGZXRjaGVzIHFl
bXUteGVuIHZpYSBnaXQgKHdpdGhvdXQgcmVjdXJzaXZlIHN1Ym1vZHVsZXMgdG8gYXZvaWQKPiAg
IG1hc3NpdmUgUk9NIGRvd25sb2FkcykKPiAtIFByZS1wb3B1bGF0ZXMgcmVxdWlyZWQgbWVzb24g
c3VicHJvamVjdHMgKGtleWNvZGVtYXBkYiwKPiAgIGJlcmtlbGV5LXNvZnRmbG9hdC0zLCBiZXJr
ZWxleS10ZXN0ZmxvYXQtMykgZnJvbSBnaXRsYWIgYXJjaGl2ZXMKPiAtIEFwcGxpZXMgcGFja2Fn
ZWZpbGVzIG92ZXJsYXlzIChtZXNvbi5idWlsZCkgZm9yIHN1YnByb2plY3RzIHRoYXQKPiAgIG5l
ZWQgdGhlbQo+IC0gUmVtb3ZlcyAud3JhcCBmaWxlcyBmb3IgdW51c2VkIHN1YnByb2plY3RzIHRv
IHByZXZlbnQgYW55IG5ldHdvcmsKPiAgIGFjY2VzcyBhdHRlbXB0cyBkdXJpbmcgdGhlIGJ1aWxk
Cj4gLSBQYXRjaGVzIHhlbl9uYXRpdmUuaCAjZXJyb3IgdG8gI3dhcm5pbmcgZm9yIGNyb3NzLWNv
bXBpbGUKPgo+IFRlc3RlZCB3aXRoOgo+ICAgICBzdXBwb3J0L3Rlc3RpbmcvcnVuLXRlc3RzIFwK
PiAgICAgICAgIC1kIGRsIC1vIG91dHB1dF9mb2xkZXIgXAo+ICAgICAgICAgdGVzdHMucGFja2Fn
ZS50ZXN0X3hlbi5UZXN0WGVuQWFyY2g2NAo+ICAgICBzdXBwb3J0L3Rlc3RpbmcvcnVuLXRlc3Rz
IFwKPiAgICAgICAgIC1kIGRsIC1vIG91dHB1dF9mb2xkZXIgXAo+ICAgICAgICAgdGVzdHMucGFj
a2FnZS50ZXN0X3hlbi5UZXN0WGVuQXJtdjcKPgo+IEJvdGggYWFyY2g2NCBhbmQgYXJtMzIgcnVu
dGltZSB0ZXN0cyBwYXNzLgo+Cj4gUXVpY2sgYnVpbGQgZGVmY29uZmlnIHVzZWQgZm9yIGl0ZXJh
dGlvbjoKPiAgICAgQlIyX2FhcmNoNjQ9eQo+ICAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkK
PiAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOPXkKPiAgICAgQlIyX1RPT0xDSEFJ
Tl9FWFRFUk5BTF9CT09UTElOX0FBUkNINjRfR0xJQkNfU1RBQkxFPXkKPiAgICAgQlIyX1BBQ0tB
R0VfWEVOPXkKPiAgICAgQlIyX1BBQ0tBR0VfWEVOX0hZUEVSVklTT1I9eQo+ICAgICBCUjJfUEFD
S0FHRV9YRU5fVE9PTFM9eQo+ICAgICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0
Cj4KPiBSZWxhdGVkIHByaW9yIGF0dGVtcHRzOgo+ICAgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI2MDIxMTA1NTEzOC43MTk0NTktMS1tYXR0
aGV3Lmwud2ViZXJAZ21haWwuY29tLwo+ICAgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9w
cm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI1MTAwNzE2NDc1Ni44OTMyNjQtMS10aXRvdWFuLmNo
cmlzdG9waGVAbWluZC5iZS8KPgo+IENjOiBOZWFsIEZyYWdlciA8bmVhbC5mcmFnZXJAYW1kLmNv
bT4KPiBDYzogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiBDYzogVmluY2VudCBTdGVo
bMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+IENjOiBUaXRvdWFuIENocmlzdG9waGUgPHRp
dG91YW4uY2hyaXN0b3BoZUBtaW5kLmJlPgo+IENjOiBKb2huIEVybmJlcmcgPGpvaG4uZXJuYmVy
Z0BhY3RpYS5zZT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IFdlYmVyIDxtYXRoZXcubC53ZWJl
cjNAYm9laW5nLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9xZW11LXhlbi9Db25maWcuaW4gICAgICAg
ICAgICAgICAgICAgIHwgIDkgKysrCj4gIHBhY2thZ2UvcWVtdS14ZW4vcWVtdS14ZW4uaGFzaCAg
ICAgICAgICAgICAgICB8ICA1ICsrCj4gIHBhY2thZ2UvcWVtdS14ZW4vcWVtdS14ZW4ubWsgICAg
ICAgICAgICAgICAgICB8IDU3ICsrKysrKysrKysrKysrKysrKysKCkNhbid0IHRoaXMganVzdCBi
ZSBwYXJ0IG9mIHRoZSB4ZW4ubWs/IEl0IGRvZXNuJ3QgZnVuY3Rpb24gb3V0c2lkZSBvZgppdCBh
bnl3YXkuIE9yIGF0IGxlYXN0IGtlcHQgaW4gdGhlIHhlbiBkaXJlY3RvcnkgaGVyZSBzbyBpdCdz
IGNsZWFyZXIKdGhhdCBpdCdzIHRpZ2h0bHkgYm91bmQgdG9nZXRoZXIuCgpJJ20gYWxzbyBub3Qg
ZnVsbHkgY29udmluY2VkIHRoZSBxZW11LXhlbiBwYXJ0IGlzIG5lZWRlZCBhdCBhbGwsIFhlbgpk
b2VzIHN1cHBvcnQgc3lzdGVtIHFlbXUsIGFuZCBsb29raW5nIGF0IHRoZSBjb21taXRzIHRoZSBY
ZW4gcHJvamVjdApkaWQgb24gdG9wIG9mIHRoZSBxZW11IHZlcnNpb24gdGhleSBwaWNrZWQgaGVy
ZSB0aGV5IGFyZSBwcmV0dHkgbXVjaApvbmx5IHJlcXVpcmVkIGZvciAqQlNELgpIYXZlIEkgb3Zl
cmxvb2tlZCBzb21ldGhpbmcgdGhhdCB3b3VsZCBtYWtlIGEgc3lzdGVtIHFlbXUgcGF0aCBpbmFw
cHJvcHJpYXRlPwpCdXQgaXQncyBhbHNvIHNvbWV0aGluZyBJIHdpbGwgbm90IGJsb2NrIG9uLCBp
ZiBubyBvbmUgZWxzZSBoYXMgYQpwcm9ibGVtIHdpdGggdGhlIGV4dHJhIGRvd25sb2FkcyBhcHBy
b2FjaC4KClRoZSByZXN0IG9mIHRoZSBidW1wIGxvb2tzIGZpbmUgdG8gbWUuCgpUaGFua3MhIC8v
IEpvaG4gRXJuYmVyZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
