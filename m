Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5BDFF6E7C
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 21:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC23E4094C;
	Tue, 17 Mar 2026 21:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4j4pof74hzCa; Tue, 17 Mar 2026 21:16:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB77C4099D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773782213;
	bh=L+mN4c5ALAgGtffxCXFwnIrcvUg6vWp80m7spyVu7Ww=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Hv9iuXn5mOkPpoj3KpqzZdnTyokDm8ZlXGix3IzVzdVwkETL4pjFGH/QzlqgB7mnJ
	 nauLquo+ifp29BKupEO/SKQKSV4xEXgm8Mq7TTyB7Z/ElhPoZH3QfXIXrPNTCZk+Lu
	 gs9K1KP7rSBUu2AsaDOhDVNsaOQMh7Tldp+nhOsFYgdNJ/w104rGMEDdf27GOCyKVa
	 wlqthno2xTWqo8uvNp5r5bPrfQXGDNDBFkmtPlSG1FLHyCp/n/KnqD8T43O9hNxkJI
	 e5RPcvsSAgLJSBLXZDuIB1uAYOp8SU58Edem7bvjScZ0akYM2qT+PJ6H3H7g5r09QE
	 zVXFkHKEgYg2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB77C4099D;
	Tue, 17 Mar 2026 21:16:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 197461B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 21:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F376F4018F
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 21:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5OxVS9nZYQH for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 21:16:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C7D29400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7D29400E5
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7D29400E5
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 21:16:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso56041555e9.3
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 14:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773782208; x=1774387008;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5ECQjsc756DEFDFKE4aRpW2T7ThYjzkJGwyjjsYIc/c=;
 b=H8nsm3prosK5y3T/6chioId2ohFqc1ybNVuzqkGHdODVHhDz5TASlJZmNPTEnAHUzM
 gY5z0WevMYXmIHC9h/225z0DYz2/8MzdCKAHLSacA5QH5EwyK+19SVgGiLvPO89fms+F
 +2QkLAoVkdempHRJotvRycxNU0F5VwdsfHodkh6/SkAkSz6y3rUJ5s/c/lf46C+e/+PY
 ktDHzZFUfTSyAIsGu2wflro/DmFmClUwC163bbeu91UQtapOTiIOiMemU/o8F6mw+lP7
 TYlnU8ASRJfOVEQ+QHyRFSPKclzUq2ITKqq1YTFys7vRfYkIXYn1kXjhigbXd80jV0MG
 6Sjg==
X-Gm-Message-State: AOJu0YwuSxHNHioWXiz05GOP4Ry7c1NkGc1R/MUxlhoy8M0kNSExoViF
 LyvGHUuz5aYqGw2IH3+KbyAjpH4RtLiGV4QCmNcz83RS74P/GjLYly6x6FQ6LUYdSq4D9S0xQmN
 wvnIX
X-Gm-Gg: ATEYQzxEnUdJ/azkGEUlqy4JxG3l87lTw+EptNzHLOK04iEXUono/8jEI2Efv2llC2G
 xB+etoPvrqB39RSqn0/Eyvn5nZ2Lw0EwywY532wa6dQPkgkyOD3juV0yckoUHFnTBMX0uvl+hjU
 mrP3QHJYMB4vPo5Kv/wuQHLbSQau5nStBrnSWSOZgjdYdkZWLEQBrVkm78dBIm99w45PjMMhRYi
 8mtvvMgI2kmAKQqRBfVTBoLb0IeReNM30mr/KmZjrEFTwjDifLjI9TdDhXcQ6qiN/DmN+Whll/v
 KovVrxM3nZKi3UXybQlsnboPV/lFTzYseDEItCqT3cl2bYBn/l9emede7ypVCS3DgelrKCJ2IR6
 +Te7YltEli2nnOXMiRlM+V7K+myraTNvX3fYPT6fqVC3RTcnT48NCUUuWl39o+oJ5DiipZp79+O
 6DyAgSWwIIPyDIyuCOq805nAy3Ahn0X9uS9v6pPBkRt4ey906V87BWafIXc3IPDb8MAR0Hz+E7H
 XEWCcF7kFx6MSNGFFpAVJg3k3slcjk2TJpzbursY0AAyHsHwOyR48OLroQcg4KRBbFZRo6/u/bc
X-Received: by 2002:a05:600c:1d09:b0:47e:e952:86c9 with SMTP id
 5b1f17b1804b1-486f41fcd04mr18330445e9.0.1773782208353; 
 Tue, 17 Mar 2026 14:16:48 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4856ea8fb0dsm166128405e9.3.2026.03.17.14.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 14:16:48 -0700 (PDT)
Message-ID: <3ae9dc41-7ee9-4b03-8fae-2aacb42926b9@smile.fr>
Date: Tue, 17 Mar 2026 22:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: buildroot@buildroot.org
References: <20260224132033.1700023-1-fabien.lehoussel@smile.fr>
 <20260224133649.89563-1-thomas.perale@mind.be>
Content-Language: fr
In-Reply-To: <20260224133649.89563-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773782208; x=1774387008; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5ECQjsc756DEFDFKE4aRpW2T7ThYjzkJGwyjjsYIc/c=;
 b=o48z3PQThoeBoszyPb2b+PPtpuakecYiaCHI/2MbugibmVjFKXCpJcsimO0SC0yqxR
 /xBAfifCo+yNCg8jLfd45leeM05WYb2MOhY/X8NJbaZ7WCjCbSxT/CyuhLd6/ieoMrBD
 /BcEqfYISwYrrerwRTPS4qaj80m8NXrkNUY+A=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=o48z3PQT
Subject: Re: [Buildroot] [PATCH 1/1 v2] support/scripts/generate-cyclonedx:
 add source attribute to CVEs
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

SGVsbG8gRmFiaWVuLCBUaG9tYXMsIEFsbCwKCkxlIDI0LzAyLzIwMjYgw6AgMTQ6MzYsIFRob21h
cyBQZXJhbGUgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IFRoYW5rcyBGYWJpZW4uCj4gCj4g
QWNrZWQtQnk6IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4KCkFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gSW4gcmVwbHkg
b2Y6Cj4+IEFkZCAnc291cmNlJyBhdHRyaWJ1dGUgdG8gZWFjaCBDVkUgaW4gdnVsbmVyYWJpbGl0
aWVzIG5vZGUsIGluY2x1ZGluZyBOVkQKPj4gVVJMIHJlZmVyZW5jZSB0byBlbmFibGUgcHJvcGVy
IGltcG9ydCBpbnRvIERlcGVuZGVuY3ktVHJhY2suCj4+Cj4+IERlcGVuZGVuY3ktVHJhY2sncyBW
RVggaW1wb3J0ZXIgcmVxdWlyZXMgdGhlIHNvdXJjZSBhdHRyaWJ1dGUgdG8KPj4gcHJvcGVybHkg
cHJvY2VzcyB2dWxuZXJhYmlsaXR5IGVudHJpZXMuIFdpdGhvdXQgaXQsIHZ1bG5lcmFiaWxpdGll
cyBhcmUKPj4gc2tpcHBlZCBkdXJpbmcgaW1wb3J0IHdpdGggImRvZXMgbm90IGhhdmUgYW4gSUQg
YW5kIC8gb3Igc291cmNlIiB3YXJuaW5ncy4KPj4KPj4gSW5jbHVkZSB0aGUgZnVsbCBOVkQgVVJM
IGZvbGxvd2luZyB0aGUgQ3ljbG9uZURYIDEuNiBkb2N1bWVudGF0aW9uIGZvcm1hdDoKPj4gaHR0
cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwve0NWRS1JRH0KPj4KPj4gVGVzdCBFbnZpcm9u
bWVudDoKPj4gLSBCdWlsZHJvb3Q6IDIwMjUuMDIuMTEgKG9yIG1hc3RlcikKPj4gLSBEZXBlbmRl
bmN5LVRyYWNrOiB2NC4xMy42Cj4+Cj4+IFRlc3QgUmVzdWx0cyAtIEJFRk9SRSAod2l0aG91dCBz
b3VyY2UgYXR0cmlidXRlKToKPj4gYXBpc2VydmVyXzEgIHwgMjAyNi0wMi0yMyAxNjowNTo0MCw4
OTAgSU5GTyBbVmV4VXBsb2FkUHJvY2Vzc2luZ1Rhc2tdIFByb2Nlc3NpbmcgQ3ljbG9uZURYIFZF
WCB1cGxvYWRlZCB0byBwcm9qZWN0OiBlNDNmZTE4NS1jMGEzLTRlM2EtYTkwOC02NjczNDRhNjZh
OWMKPj4gYXBpc2VydmVyXzEgIHwgMjAyNi0wMi0yMyAxNjowNTo0MCw5NDEgV0FSTiBbQ3ljbG9u
ZURYVmV4SW1wb3J0ZXJdIFZFWCB2dWxuZXJhYmlsaXR5IGF0IHBvc2l0aW9uICMwIGRvZXMgbm90
IGhhdmUgYW4gSUQgYW5kIC8gb3Igc291cmNlOyBTa2lwcGluZyBpdAo+PiBhcGlzZXJ2ZXJfMSAg
fCAyMDI2LTAyLTIzIDE2OjA1OjQwLDk0MSBXQVJOIFtDeWNsb25lRFhWZXhJbXBvcnRlcl0gVkVY
IHZ1bG5lcmFiaWxpdHkgYXQgcG9zaXRpb24gIzEgZG9lcyBub3QgaGF2ZSBhbiBJRCBhbmQgLyBv
ciBzb3VyY2U7IFNraXBwaW5nIGl0Cj4+IC4uLgo+PiBhcGlzZXJ2ZXJfMSAgfCAyMDI2LTAyLTIz
IDE2OjA1OjQwLDk0MSBXQVJOIFtDeWNsb25lRFhWZXhJbXBvcnRlcl0gVkVYIHZ1bG5lcmFiaWxp
dHkgYXQgcG9zaXRpb24gIzE5IGRvZXMgbm90IGhhdmUgYW4gSUQgYW5kIC8gb3Igc291cmNlOyBT
a2lwcGluZyBpdAo+PiBhcGlzZXJ2ZXJfMSAgfCAyMDI2LTAyLTIzIDE2OjA1OjQwLDk0MSBJTkZP
IFtDeWNsb25lRFhWZXhJbXBvcnRlcl0gVGhlIHVwbG9hZGVkIFZFWCBkb2VzIG5vdCBjb250YWlu
IGFueSBhcHBsaWNhYmxlIHZ1bG5lcmFiaWxpdGllczsgU2tpcHBpbmcgVkVYIGltcG9ydAo+Pgo+
PiBUZXN0IFJlc3VsdHMgLSBBRlRFUiAod2l0aCBzb3VyY2UpOgo+PiBhcGlzZXJ2ZXJfMSAgfCAy
MDI2LTAyLTIzIDE2OjE3OjEzLDQ5MiBJTkZPIFtWZXhVcGxvYWRQcm9jZXNzaW5nVGFza10gUHJv
Y2Vzc2luZyBDeWNsb25lRFggVkVYIHVwbG9hZGVkIHRvIHByb2plY3Q6IGU0M2ZlMTg1LWMwYTMt
NGUzYS1hOTA4LTY2NzM0NGE2NmE5Ywo+PiBhcGlzZXJ2ZXJfMSAgfCAyMDI2LTAyLTIzIDE2OjE3
OjE0LDA1NCBJTkZPIFtWZXhVcGxvYWRQcm9jZXNzaW5nVGFza10gQ29tcGxldGVkIHByb2Nlc3Np
bmcgb2YgQ3ljbG9uZURYIFZFWCBmb3IgcHJvamVjdDogZTQzZmUxODUtYzBhMy00ZTNhLWE5MDgt
NjY3MzQ0YTY2YTljCj4+Cj4+IENWRXMgYXJlIGNvcnJlY3RseSBpbXBvcnRlZCBpbiBEZXBlbmRl
bmN5LVRyYWNrCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEZhYmllbiBMZWhvdXNzZWwgPGZhYmllbi5s
ZWhvdXNzZWxAc21pbGUuZnI+Cj4gCj4+IC0tLQo+PiAgdXRpbHMvZ2VuZXJhdGUtY3ljbG9uZWR4
IHwgNCArKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYg
LS1naXQgYS91dGlscy9nZW5lcmF0ZS1jeWNsb25lZHggYi91dGlscy9nZW5lcmF0ZS1jeWNsb25l
ZHgKPj4gaW5kZXggMmI2YzZkNjNkMy4uMzUxOThhNDdjZiAxMDA3NTUKPj4gLS0tIGEvdXRpbHMv
Z2VuZXJhdGUtY3ljbG9uZWR4Cj4+ICsrKyBiL3V0aWxzL2dlbmVyYXRlLWN5Y2xvbmVkeAo+PiBA
QCAtMzI3LDYgKzMyNywxMCBAQCBkZWYgY3ljbG9uZWR4X3Z1bG5lcmFiaWxpdGllcyhzaG93X2lu
Zm9fZGljdCk6Cj4+ICAKPj4gICAgICByZXR1cm4gW3sKPj4gICAgICAgICAgImlkIjogY3ZlLAo+
PiArICAgICAgICAic291cmNlIjogewo+PiArICAgICAgICAgICAgIm5hbWUiOiAiTlZEIiwKPj4g
KyAgICAgICAgICAgICJ1cmwiOiAiaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvIiAr
IGN2ZQo+PiArICAgICAgICB9LAo+PiAgICAgICAgICAiYW5hbHlzaXMiOiB7Cj4+ICAgICAgICAg
ICAgICAic3RhdGUiOiAicmVzb2x2ZWRfd2l0aF9wZWRpZ3JlZSIgaWYgY3ZlIGluIFZVTE5fV0lU
SF9QRURJR1JFRSBlbHNlICJpbl90cmlhZ2UiLAo+PiAgICAgICAgICAgICAgImRldGFpbCI6IGYi
VGhlIENWRSAne2N2ZX0nIGhhcyBiZWVuIG1hcmtlZCBhcyBpZ25vcmVkIGJ5IEJ1aWxkcm9vdCIK
Pj4gLS0gCj4+IDIuNDMuMAo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
