Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D524BC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 11:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2AB54051A;
	Sun, 14 Jul 2024 11:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_RMLYlLBSI9; Sun, 14 Jul 2024 11:10:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5716440533
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5716440533;
	Sun, 14 Jul 2024 11:10:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 506901BF3EC
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 11:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AA55401B2
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 11:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AcNkhV5L5pTT for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 11:10:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E11BF40021
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E11BF40021
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E11BF40021
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 11:10:23 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4266edee10cso21236915e9.2
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 04:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720955421; x=1721560221;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0U7HLBM4z+GsERbmETmHq6gPZFTPBKPEpg0nyDzkLMk=;
 b=DbhWx0nzUdXthwLmQMTC/oKK6teQ1jjUkFj3N4XcFnRiLQlh7hzFj2mciBKh8UOnR8
 5hED1JmF9qgRblT1VADbja7pnviSy/WHU/c5U/4BH1QIHOxSkYBFFCLOqNWwEOK1Veh4
 8nAir/Vhnh8dYGcBJIgSxthwgq4HdnKWKzpglv4aaAjV4FJwM63VWqB02PFJYYEcQTVk
 ihjNedEPT26FwelxdacjFzwQFrz7MyFHa67BuKoDhZ+csLTzoDj4oswanToDwNCjbeXM
 xVVLOIbiEMZLaCTBz8JkNHvbxgB7MZrVR3sRvE1emtXpl8smZQnZwC+Y0qxms4NRPVog
 Nr0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw9S+QdWqXVWxp9AWYk81s823JFlgkNW+w93bKWqm100g5Ay6fNAv2WE2SJFmD86yThLfQS+o0SSI6k4cS1w/7GMEF30HE8g==
X-Gm-Message-State: AOJu0Yy8g5zT3xpzVBJhvkvYDLGDKz2WABM+kkMkaTkDI94pmpY+v+ha
 7bgl7B1MaO1HJIxD9amRyZZ9lXhXPtRJ65FKDVPsT8XC0jesZWOki5IFicEoPG4=
X-Google-Smtp-Source: AGHT+IEVR0rNRHOS/oovYiJwx6sT6y0Z7hG0ynUefsVSwrDKBxceE1bek8GrrWfAPIoPT75yWOos5A==
X-Received: by 2002:a05:6000:c6:b0:367:963b:ab81 with SMTP id
 ffacd0b85a97d-367ceacaa90mr10427261f8f.46.1720955421169; 
 Sun, 14 Jul 2024 04:10:21 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dab3c2dsm3611174f8f.1.2024.07.14.04.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 04:10:20 -0700 (PDT)
Message-ID: <b27cbc6b-d3c3-43cd-b661-02f98512fe92@smile.fr>
Date: Sun, 14 Jul 2024 13:10:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Antoine Coutant <antoine.coutant@smile.fr>, buildroot@buildroot.org
References: <20240713093700.13981-1-antoine.coutant@smile.fr>
Content-Language: fr
In-Reply-To: <20240713093700.13981-1-antoine.coutant@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720955421; x=1721560221; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0U7HLBM4z+GsERbmETmHq6gPZFTPBKPEpg0nyDzkLMk=;
 b=QgDOp9bq0XhBAUhdFXXpF60ou9TiN0259BaGDTfoIzwZdEi9unenHB2i18gg9md4qT
 4JbKCA1Ysg2GzpOvoCyC0Ddft2gekJ3nrhMvskAQklPfwBSD7MmtKt9poamYCHvBFMDy
 GUs1jb/ul2gNmY4WswctOc36xm/XCg7BDfR+g=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=QgDOp9bq
Subject: Re: [Buildroot] [PATCH 0/7] Adding RustiCL
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQW50b2luZSwgQWxsLAoKTGUgMTMvMDcvMjAyNCDDoCAxMTozNiwgQW50b2luZSBDb3V0
YW50IGEgw6ljcml0wqA6Cj4gQWxsLAo+IAo+IFRoaXMgc2VyaWVzIGZvbGxvd3MgdGhlIGxhc3Qg
c2VyaWVzIEkgc2VudCBhdCB0aGUgZW5kIG9mIG15IGludGVybnNoaXAKPiBbMV0uCj4gCj4gSeKA
mW0gc29ycnkgZm9yIHRoZSBsb25nIHRpbWUgYmV0d2VlbiB0aG9zZSB0d28gc2VyaWVzLCBidXQg
SSBkbyBub3QgaGF2ZQo+IHRpbWUgdG8gc3BlbmQgb24gaXQgc2luY2UgdGhlIGVuZCBvZiBteSBp
bnRlcm5zaGlwLiAKPiAKPiBDb21wYXJlZCB0byB0aGUgcHJldmlvdXMgb25lLCB0aGlzIHNlcmll
cyBmaXhlcyBwcm9ibGVtcyByYWlzZWQgYnkKPiByZWNlaXZlcnMuIFRoYW5rcyBmb3IgeW91ciBy
ZXZpZXchCj4gSSBhbHNvIG1hZGUgdGhlIE9wZW5DTC1oZWFkZXJzIHBhY2thZ2UgdGhlIGRlZmF1
bHQgcHJvdmlkZXIgb2YgT3BlbkNMCj4gaGVyZGVycyBiZWNhdXNlIGFsbCBPcGVuQ0wgaGVhZGVy
cyBhcmUgc291cmNlZCBmcm9tIHRoZSBzYW1lIHJlcG8sIGFuZAo+IGJlY2F1c2UgdGhleSBzaG91
bGQgYmUgYmFja3dhcmQgY29tcGF0aWJsZSAobWVzYSBPcGVuQ0wgaGVhZGVycyBhcmUKPiBvbGQp
Lgo+IEZpbmFsbHksIEkgbWFkZSBPcGVuQ0wgQ2xvdmVyIG9ubHkgYXZhaWxhYmxlIGluIElDRCBt
b2RlIHRvIHN0YXkKPiBjb25zaXN0ZW50IGJldHdlZW4gT3BlbkNMIGltcGxlbWVudGF0aW9ucy4K
PiAKPiBDb250cmFyeSB0byB0aGUgcHJldmlvdXMgc2VyaWVzLCB0aGlzIG9uZSBoYXZlIG5vdCBi
ZWVuIHRlc3RlZCBvbiB0aGUKPiBrYWRoYXMgdmltMyBib2FyZCAoSSBkb27igJl0IGhhdmUgYWNj
ZXNzIHRvIGl0IHNpbmNlIHRoZSBlbmQgb2YgbXkKPiBpbnRlcm5zaGlwKS4gSSB0ZXN0ZWQgdGhl
IGJ1aWxkIG9uY2Ugd2l0aCBxZW11X3g4Nl82NF9kZWZjb25maWcgYW5kIHRoZQo+IGJ1aWxkIHdh
cyBzdWNjZXNzZnVsLiBCdXQsIGFuIG90aGVyIGJ1aWxkIHdpdGggdGhlIGtoYWRhc192aW0zX2Rl
ZmNvbmZpZwo+IGZhaWxlZDogCj4gCj4gLi9idWlsZHJvb3QvdGVzdC9raGFkYXNfdmltM19kZWZj
b25maWdfcnVzdGljbF81L2hvc3QvYWFyY2g2NC1idWlsZHJvb3QtbGludXgtZ251L3N5c3Jvb3Qv
dXNyL2luY2x1ZGUvZmVhdHVyZXMuaDo0MTQ6NDogd2FybmluZzogX0ZPUlRJRllfU09VUkNFIHJl
cXVpcmVzIGNvbXBpbGluZyB3aXRoIG9wdGltaXphdGlvbiAoLU8pIFstVyN3YXJuaW5nc10KPiAu
L2J1aWxkcm9vdC90ZXN0L2toYWRhc192aW0zX2RlZmNvbmZpZ19ydXN0aWNsXzUvaG9zdC9hYXJj
aDY0LWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5jbHVkZS9iaXRzL21hdGgtdmVj
dG9yLmg6MzQ6MjU6IGVycm9yOiAnX19uZW9uX3ZlY3Rvcl90eXBlX18nIGF0dHJpYnV0ZSBpcyBu
b3Qgc3VwcG9ydGVkIG9uIHRhcmdldHMgbWlzc2luZyAnbmVvbicgb3IgJ212ZSc7IHNwZWNpZnkg
YW4gYXBwcm9wcmlhdGUgLW1hcmNoPSBvciAtbWNwdT0KPiAuL2J1aWxkcm9vdC90ZXN0L2toYWRh
c192aW0zX2RlZmNvbmZpZ19ydXN0aWNsXzUvaG9zdC9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1n
bnUvc3lzcm9vdC91c3IvaW5jbHVkZS9iaXRzL21hdGgtdmVjdG9yLmg6MzU6MjU6IGVycm9yOiAn
X19uZW9uX3ZlY3Rvcl90eXBlX18nIGF0dHJpYnV0ZSBpcyBub3Qgc3VwcG9ydGVkIG9uIHRhcmdl
dHMgbWlzc2luZyAnbmVvbicgb3IgJ212ZSc7IHNwZWNpZnkgYW4gYXBwcm9wcmlhdGUgLW1hcmNo
PSBvciAtbWNwdT0KPiAuL2J1aWxkcm9vdC90ZXN0L2toYWRhc192aW0zX2RlZmNvbmZpZ19ydXN0
aWNsXzUvaG9zdC9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5jbHVk
ZS9iaXRzL21hdGgtdmVjdG9yLmg6NDA6OTogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICdfX1NW
RmxvYXQzMl90Jwo+IC4vYnVpbGRyb290L3Rlc3Qva2hhZGFzX3ZpbTNfZGVmY29uZmlnX3J1c3Rp
Y2xfNS9ob3N0L2FhcmNoNjQtYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vzci9pbmNsdWRl
L2JpdHMvbWF0aC12ZWN0b3IuaDo0MTo5OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ19fU1ZG
bG9hdDY0X3QnCj4gLi9idWlsZHJvb3QvdGVzdC9raGFkYXNfdmltM19kZWZjb25maWdfcnVzdGlj
bF81L2hvc3QvYWFyY2g2NC1idWlsZHJvb3QtbGludXgtZ251L3N5c3Jvb3QvdXNyL2luY2x1ZGUv
Yml0cy9tYXRoLXZlY3Rvci5oOjQyOjk6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSAnX19TVkJv
b2xfdCcKPiBjbGFuZyBkaWFnOiAuL2J1aWxkcm9vdC90ZXN0L2toYWRhc192aW0zX2RlZmNvbmZp
Z19ydXN0aWNsXzUvaG9zdC9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3Iv
aW5jbHVkZS9mZWF0dXJlcy5oOjQxNDo0OiB3YXJuaW5nOiBfRk9SVElGWV9TT1VSQ0UgcmVxdWly
ZXMgY29tcGlsaW5nIHdpdGggb3B0aW1pemF0aW9uICgtTykgWy1XI3dhcm5pbmdzXQo+IHBhbmlj
a2VkIGF0IGJpbmRnZW4tY2xpL21haW4ucnM6NTI6MzY6Cj4gCj4gSeKAmW0gc2VuZGluZyB0aGlz
IHBhdGNoIHNlcmllcyB0byBzYXZlIHRoZSB3b3JrIGRvbmUsIGFzIEkgZG9u4oCZdCBrbm93IGlm
Cj4gSSB3aWxsIGhhdmUgdGltZSB0byB3b3JrIG9uIGl0LiAKCkl0IHNlZW1zIHlvdXIgcGF0Y2gg
c2VyaWVzIG9ubHkgd29yayBvbiB0b3Agb2YgbWVzYSAyMy54LiBTaW5jZSBtZXNhIDI0LjAKcnVz
dGljbCBpbmNsdWRlIG5ldyBsbHZtIHN0dWZmIHRvIGJ1aWxkIFsxXS4KClNvbWVob3cgaXQgdGFr
ZXMgdGhlIHdyb25nIGNsYW5nIG9yIGxsdm0gaGVhZGVycy9saWJyYXJpZXMuLi4KCkl0IHNlZW1z
IHN1Y2gga2luZCBvZiBpc3N1ZSBoYXMgYWxlYWR5IGJlIHJlcG9ydGVkIHRvIG1lc2EgWzJdLiBJ
J20gbm90IHN1cmUgaWYKaXQncyBhIG1lc29uIG9yIG1lc2Egb3IgcnVzdGljbCBvciBCdWlsZHJv
b3QgaXNzdWUgeWV0LgoKV2UgY2FuJ3QgYXBwbHkgeW91ciBzZXJpZXMgZm9yIG5vdyBidXQgYXMg
c29vbiBhcyB0aGlzIGlzc3VlIGlzIHNvbHZlZCwgd2UgY2FuCnJlc3VtZSB0aGUgcnVzdGljbCB3
b3JrLgoKWzFdCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9jb21t
aXQvMjk5Zjk0OTc3NThjYTVkNzI3OGU1YWFmZDIxMGFhOTFkMjBkZmI0ZApbMl0gaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL2lzc3Vlcy8xMTA5MAoKPiAKPiAoSSB3
aXNoIGEgZ29vZCBidWlsZHJvb3Qgc3VtbWVyIGNhbXAgdG8gZXZlcnlvbmUgd2hvIHBhcnRpY2lw
YXRlcyAhKQoKVGhhbmtzIQoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFJlZ2FyZHMsCj4g
QW50b2luZSBDb3V0YW50Cj4gCj4gWzFdOiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvYnVpbGRyb290L2xpc3QvP3Nlcmllcz0zOTMyOTgmc3RhdGU9JTJBJmFyY2hpdmU9Ym90
aAo+IAo+IAo+IAo+IEFudG9pbmUgQ291dGFudCAoMyk6Cj4gICBwYWNrYWdlL29wZW5jbC1pY2Qt
bG9hZGVyOiBuZXcgcGFja2FnZQo+ICAgcGFja2FnZS9sbHZtLXByb2plY3Q6IGFkZCBvcGVuY2wt
Yy1iYXNlLmggb24gdGFyZ2V0Cj4gICBwYWNrYWdlL21lc2EzZDogcmVtb3ZlIHRoZSBkZXBlbmRl
bmN5IG9uIENsb3ZlciBhbmQgYnVpbGQgaXQgaW4gSUNECj4gICAgIG1vZGUKPiAKPiBSb21haW4g
TmFvdXIgKDMpOgo+ICAgcGFja2FnZS9wa2ctbWVzb24ubWs6IGFkZCBydXN0IGNyb3NzLWNvbXBp
bGVyIHN1cHBvcnQKPiAgIHBhY2thZ2Uvc3BpcnYtbGx2bS10cmFuc2xhdG9yOiBhZGQgdGFyZ2V0
IHZhcmlhbnQgdG8gcHJvdmlkZQo+ICAgICBMTFZNU1BJUlZMaWIKPiAgIHBhY2thZ2UvbWVzYTNk
OiBhZGQgUnVzdGlDTCBzdXBwb3J0Cj4gCj4gU2ViYXN0aWFuIFdleWVyICgxKToKPiAgIHBhY2th
Z2Uvb3BlbmNsLWhlYWRlcnM6IG5ldyBwYWNrYWdlCj4gCj4gIHBhY2thZ2UvQ29uZmlnLmluICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsKPiAgcGFja2FnZS9sbHZtLXByb2plY3Qv
Y2xhbmcvY2xhbmcubWsgICAgICAgICAgIHwgIDkgKysrCj4gIHBhY2thZ2UvbWVzYTNkLWhlYWRl
cnMvbWVzYTNkLWhlYWRlcnMubWsgICAgICB8ICAyICstCj4gIC4uLmVtb3ZlLXRoZS1pbnN0YWxs
YXRpb24tb2YtQ0wtaGVhZGVycy5wYXRjaCB8IDcxICsrKysrKysrKysrKysrKysrKysKPiAgcGFj
a2FnZS9tZXNhM2QvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgIHwgNTAgKysrKysrKysr
KystLQo+ICBwYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgICAgICAgICAgICAgICAgICAgICAgfCAx
NyArKystLQo+ICBwYWNrYWdlL29wZW5jbC1oZWFkZXJzL0NvbmZpZy5pbiAgICAgICAgICAgICAg
fCAgNyArKwo+ICBwYWNrYWdlL29wZW5jbC1oZWFkZXJzL29wZW5jbC1oZWFkZXJzLmhhc2ggICAg
fCAgMyArCj4gIHBhY2thZ2Uvb3BlbmNsLWhlYWRlcnMvb3BlbmNsLWhlYWRlcnMubWsgICAgICB8
IDIzICsrKysrKwo+ICBwYWNrYWdlL29wZW5jbC1pY2QtbG9hZGVyL0NvbmZpZy5pbiAgICAgICAg
ICAgfCAxMiArKysrCj4gIC4uLi9vcGVuY2wtaWNkLWxvYWRlci9vcGVuY2wtaWNkLWxvYWRlci5o
YXNoICB8ICAzICsKPiAgLi4uL29wZW5jbC1pY2QtbG9hZGVyL29wZW5jbC1pY2QtbG9hZGVyLm1r
ICAgIHwgMjAgKysrKysrCj4gIHBhY2thZ2UvcGtnLW1lc29uLm1rICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDEzICsrKysKPiAgcGFja2FnZS9zcGlydi1sbHZtLXRyYW5zbGF0b3IvQ29uZmln
LmluICAgICAgIHwgMjIgKysrKysrCj4gIC4uLi9zcGlydi1sbHZtLXRyYW5zbGF0b3IubWsgICAg
ICAgICAgICAgICAgICB8IDEwICsrKwo+ICBzdXBwb3J0L21pc2MvY3Jvc3MtY29tcGlsYXRpb24u
Y29uZi5pbiAgICAgICAgfCAgMiArCj4gIDE2IGZpbGVzIGNoYW5nZWQsIDI1NyBpbnNlcnRpb25z
KCspLCAxMCBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbWVzYTNk
LzAwMDgtaW5jbHVkZS1yZW1vdmUtdGhlLWluc3RhbGxhdGlvbi1vZi1DTC1oZWFkZXJzLnBhdGNo
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL29wZW5jbC1oZWFkZXJzL0NvbmZpZy5pbgo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9vcGVuY2wtaGVhZGVycy9vcGVuY2wtaGVhZGVy
cy5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL29wZW5jbC1oZWFkZXJzL29wZW5j
bC1oZWFkZXJzLm1rCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL29wZW5jbC1pY2QtbG9h
ZGVyL0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9vcGVuY2wtaWNkLWxv
YWRlci9vcGVuY2wtaWNkLWxvYWRlci5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L29wZW5jbC1pY2QtbG9hZGVyL29wZW5jbC1pY2QtbG9hZGVyLm1rCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL3NwaXJ2LWxsdm0tdHJhbnNsYXRvci9Db25maWcuaW4KPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
