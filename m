Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E83CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 16:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8778B84374;
	Fri, 15 May 2026 16:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-q5nJd9NpI7; Fri, 15 May 2026 16:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9682284420
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778863391;
	bh=fp6XOypl6VSc+YspN9cxTSVqNcRLomQohhG1uJSLQHE=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=GK+rdijNS2h0M7URr/E6TwSB0oY09SidYEixcG06tp6fXrkwpid8iBgmkNacxht/6
	 IKVZhlecji1mlwjgqwtebhdC4x0QAPYKkoOxQPEesoUnlGYFh3LKBpWEndfD4Wyg2e
	 7YFF17pw4vnNoJZItyqGavQ5cOIcxVxLzCoC3e9zEOdm22VRVNyB0OPWWjiOvy+RFk
	 uSP1KtGsap6ydgPCP9qHiXO3UhytQSB8+KOcIslrQbOH3UdpTgpORUgJ2UzapId5fv
	 yqcyyrR8rPRn3P8RPmoVs9cZZXq6iwB5LO06o3alcIvbaBoi0yoygJXML5Ga+bbqYj
	 6em5sdqt5aaWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9682284420;
	Fri, 15 May 2026 16:43:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E6F436F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8EB940EEC
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qEDtrGC1NqfF for <buildroot@buildroot.org>;
 Fri, 15 May 2026 16:43:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BC5174049D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC5174049D
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC5174049D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:43:09 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so142005e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778863387; x=1779468187;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0sUeCaV1mvoMKn9/jEJsUOt3TEGpynLaUO2hz7+GEPY=;
 b=rW8YeCMWGMiSmvN0WYqIPxSwnM+x7VuV+2/1ZE1rTnbGkm2tjWLqs8QaEGeuAh78Vr
 ZVRuDamvnvA5/sDLSJRb3BWlT2mbr/9Ch/KortSMDtZtYIyrBZ2Uuq616S4prOTrLcWq
 YBfHw6lqgqnQ5z2WTlKExgCQfEAOGdCI5RdqsavoOU2rirbGRJa87Xc7Deh5drTZ0bMa
 GpPPk2H5EXf4zXt6wHre0M59ZHYYhNWFUEaBwE0R1Ia9OTbZTd26nEe6VGvEZze4A8pb
 TIy3AkL9cnqtNjCTigICKFTctidOyXlIyyKUPC6+aCzSjH2pDPZdJ5PfQLmdWVRFB2hl
 cC0Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/jtbZGYRommZu/haXmrKKHBQ08ezR0A+FA0Js00JfYCgMId3mgMIuKvOYEskAoZMrFKmR+2rDiyow=@buildroot.org
X-Gm-Message-State: AOJu0YwX2W07+tHS4q4H2LXFF3ygK7AVizyZEHylLtcCP8RP+8SICSOf
 JRgHqYVDwjGyvq4gEc0qAqEi6BtzPEkZJPY/87ZxIPFacZYHDbvHEeZOUJEKYSgvWJxKqB5LXab
 YWE4MsII=
X-Gm-Gg: Acq92OF9wK8qw/7NjtC0yapP5DiteHGzH3wyQNSs8ISYT1PGm/e/aGagid3BvmkEYWF
 Wb8PH/DZ/tVXBb5O46BwCfcBwMpsVSkTWL1qNupjSdmdOoO9MddVu9KxRzBL7JcvBFEOGb5nq1D
 bqDriNiOsgv8MEI0xHLpkcR3cRGmzsFvN13ave8SFiyE/OThFO67tBtrAnVx/FVA7rPk7C/Fkbz
 MSBxO80jfe5BeCsmYzHGSHtrUn+Qw/x7fZQ1VgTnsbBqMBzFHHZTQENfkXDiETrEpnc/VplQZgH
 BNpBot9y7vDezvPBSyX9jYaEMGPrDItLhk2Vxg2vsv/eoyXg6fGaimTvHqiPLRsoOPcgyyYZD/4
 d/aT+ZdLKHFGesfktjTphYacjgixjMilKMlLjDc6dJ37nXgRI7g1JJ1A8+0fGWVUFTXD/rymLne
 iMBLM9awOU75mQ094YNoQAuCg5RpPNcO91qmzLv57FOkU8ofueuBJVKrmtyTrryzkx38e0MlbMB
 DpFKeAi2sXA+ktrVC3IXE9CWENPFleyhQN+SpKvzDLwefStNxXkY90nXIO9c0DzbCNUvt7B7luH
X-Received: by 2002:a05:600c:34c4:b0:48a:89d9:a419 with SMTP id
 5b1f17b1804b1-48fe60ecdafmr70666365e9.11.1778863387397; 
 Fri, 15 May 2026 09:43:07 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe537c516sm76369685e9.13.2026.05.15.09.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 09:43:07 -0700 (PDT)
Message-ID: <02586566-c1dd-4381-87c7-144d2f484346@smile.fr>
Date: Fri, 15 May 2026 18:43:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20260427201606.896700-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20260427201606.896700-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778863387; x=1779468187; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0sUeCaV1mvoMKn9/jEJsUOt3TEGpynLaUO2hz7+GEPY=;
 b=fbnp3M0+LqIscTXiqhd30DCYd3ZCmCtQ008jX4yE1qgV/8HrjgZoJF+0gYPeXBOaYQ
 Lm+U003Q4khbtMJLYnsTjMGaLqecRSrLfWDHweCPdeqo6p7Z3F1x3O+jrgeKPSCdfn2a
 J+TPFTtHmzO6T++SLY/wyBL2U7cZtlKPtxRMY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=fbnp3M0+
Subject: Re: [Buildroot] [PATCH 1/1] package/libabseil-cpp: add patch to fix
 build with gcc <= 12
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

SGVsbG8gSnVsaWVuLAoKTGUgMjcvMDQvMjAyNiDDoCAyMjoxNiwgSnVsaWVuIE9saXZhaW4gdmlh
IGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IGxpYmFic2VpbC1jcHAgaGVhZGVycyBjYW4gYnJlYWsg
c29tZSBwYWNrYWdlcyBidWlsZCwgbGlrZSBwcm90b2J1ZiwKPiB3aGVuIGNvbXBpbGVkIHdpdGgg
Z2NjIDEyLiBTZWUgWzFdIFsyXS4gVGhlIGlzc3VlIGhhcyBiZWVuIHJlcG9ydGVkCj4gaW4gcHJv
dG9idWYgdXBzdHJlYW0sIGluIFszXS4KPiAKPiBUaGUgaXNzdWUgaXMgZHVlIHRvIGdjYyA8PSAx
MiBub3Qgc3VwcG9ydGluZyB0aGUgbWl4IG9mIHN0YW5kYXJkCj4gQysrIGF0dHJpYnV0ZXMgd2l0
aCBHTlUgYXR0cmlidXRlcy4gU2VlIFs0XS4KPiAKPiBHY2MgMTIgaGFzIGJlZW4gcmVtb3ZlZCBm
cm9tIEJ1aWxkcm9vdCBpbnRlcm5hbCB0b29sY2hhaW5zIGluCj4gY29tbWl0IFs1XSwgYnV0IGdj
YyAxMiBjYW4gc3RpbGwgYmUgcHJlc2VudCBpbiBleHRlcm5hbCB0b29sY2hhaW5zCj4gb3Igb24g
dGhlIGhvc3QuIFRoaXMgaXMgY3VycmVudGx5IHRoZSBjYXNlIG9mIHRoZSBCdWlsZHJvb3QgRG9j
a2VyCj4gcmVmZXJlbmNlIGltYWdlLCBiYXNlZCBvbiBEZWJpYW4gMTIgKEJvb2t3b3JtKS4KPiAK
PiBUaGlzIGNvbW1pdCBmaXhlcyB0aGUgaXNzdWUgYnkgYWRkaW5nIGEgcGFja2FnZSBwYXRjaC4K
PiAKPiBGaXhlczoKPiAtIFsxXSBbMl0gYW5kIG1hbnkgbW9yZS4KPiAKPiBbMV0gaHR0cHM6Ly9n
aXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMzkwNDA2NjM0Ngo+IFsy
XSBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMzNmNmNmZDM3Y2I0OGMx
NWE1M2IzZTcxMjNkNWNlODM4OGEwZjJhYgo+IFszXSBodHRwczovL2dpdGh1Yi5jb20vcHJvdG9j
b2xidWZmZXJzL3Byb3RvYnVmL2lzc3Vlcy8yNjM4Mwo+IFs0XSBodHRwczovL2djYy5nbnUub3Jn
L1BSNjk1ODUKPiBbNV0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vY29tbWl0LzU4Y2Y3YzUxZGEzYWU0ODA0MzMyZjY4ZWU5MzRlMTUzZDY5NWQwNDcKPiBbNl0g
aHR0cHM6Ly9naXRodWIuY29tL2Fic2VpbC9hYnNlaWwtY3BwL3B1bGwvMjA0NAoKRm9sbG93aW5n
IHRoZSByZXBseSBmcm9tIERvd2FuOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3Qv
MjkwNTcxNjUtNzIyMi00NDRmLTg3YjUtNzMxZmQ5OWU5NGQyQHNtaWxlLmZyLwoKQXBwbGllZCB0
byBtYXN0ZXIuIFRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4gLS0tCj4gIC4uLlNMX0FUVFJJQlVU
RV9XQVJOX1VOVVNFRC13aXRoLWdjYy0xMi5wYXRjaCB8IDU1ICsrKysrKysrKysrKysrKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvbGliYWJzZWlsLWNwcC8wMDAyLWJhc2UtZml4LUFCU0xfQVRUUklCVVRFX1dBUk5f
VU5VU0VELXdpdGgtZ2NjLTEyLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliYWJz
ZWlsLWNwcC8wMDAyLWJhc2UtZml4LUFCU0xfQVRUUklCVVRFX1dBUk5fVU5VU0VELXdpdGgtZ2Nj
LTEyLnBhdGNoIGIvcGFja2FnZS9saWJhYnNlaWwtY3BwLzAwMDItYmFzZS1maXgtQUJTTF9BVFRS
SUJVVEVfV0FSTl9VTlVTRUQtd2l0aC1nY2MtMTIucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAuLjhmNWUyNTU3OTUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIv
cGFja2FnZS9saWJhYnNlaWwtY3BwLzAwMDItYmFzZS1maXgtQUJTTF9BVFRSSUJVVEVfV0FSTl9V
TlVTRUQtd2l0aC1nY2MtMTIucGF0Y2gKPiBAQCAtMCwwICsxLDU1IEBACj4gK0Zyb20gNzczMjY4
MjYxMTk0MzljMDZlMzQxYzlkMDkwNjMzZWNkOWI1MjBkNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKPiArRnJvbTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiArRGF0ZTogTW9uLCAy
NyBBcHIgMjAyNiAxOTozODoxOSArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIGJhc2U6IGZpeCBB
QlNMX0FUVFJJQlVURV9XQVJOX1VOVVNFRCB3aXRoIGdjYyA8PSAxMgo+ICsKPiArR2NjIDw9IDEy
IGRvZXMgbm90IHN1cHBvcnQgbWl4aW5nIHN0YW5kYXJkIEMrKyBhdHRyaWJ1dGVzIHdpdGgKPiAr
R05VIGF0dHJpYnV0ZXMuIFNlZSBbMV0uCj4gKwo+ICtUaGlzIGNhbiBsZWFkIHRvIGJ1aWxkIGZh
aWx1cmVzIHN1Y2ggYXMgWzJdIFszXSBhbmQgWzRdLiBJbiB0aG9zZQo+ICtzaXR1YXRpb25zLCB0
aGUgY29tcGlsYXRpb24gZmFpbHMgd2l0aCBlcnJvciBzdWNoIGFzOgo+ICsKPiArICAgIC91c3Iv
aW5jbHVkZS9hYnNsL2Jhc2UvYXR0cmlidXRlcy5oOjEwNzY6MzY6IGVycm9yOiBleHBlY3RlZCBp
ZGVudGlmaWVyIGJlZm9yZSAnWycgdG9rZW4KPiArCj4gK0djYyBtYWludGFpbmVycyBtZW50aW9u
ZWQgaW4gWzFdIGNvbW1lbnQgOSB0aGF0IHRoaXMgYnVnZml4IHdpbGwKPiArbm90IGJlIGJhY2tw
b3J0ZWQgaW4gR2NjIDEyLiBHY2MgMTIgaXMgc3RpbGwgdXNlZCBpbiBMVFMKPiArZGlzdHJpYnV0
aW9ucy4gRm9yIGV4YW1wbGUsIGl0IGlzIGluY2x1ZGVkIGluIERlYmlhbiAxMiAoQm9va3dvcm0p
LAo+ICt3aGljaCBpcyBzdGlsbCBzdXBwb3J0ZWQgdW50aWwgMjAyOC4gU2VlIFs1XS4KPiArCj4g
K1RoaXMgY29tbWl0IGFkZHMgYSB3b3JrYXJvdW5kIGZvciBnY2MgPD0gMTIgd2hpY2ggdXNlcwo+
ICtfX2F0dHJpYnV0ZV9fIGluIHRoYXQgY2FzZSwgd2hpY2ggZml4ZXMgdGhlIGNvbXBpbGF0aW9u
IGZhaWx1cmUuCj4gKwo+ICtbMV0gaHR0cHM6Ly9nY2MuZ251Lm9yZy9QUjY5NTg1Cj4gK1syXSBo
dHRwczovL2dpdGh1Yi5jb20vcHJvdG9jb2xidWZmZXJzL3Byb3RvYnVmL2lzc3Vlcy8yNjM4Mwo+
ICtbM10gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzMzZjZjZmQzN2Ni
NDhjMTVhNTNiM2U3MTIzZDVjZTgzODhhMGYyYWIvYnVpbGQtZW5kLmxvZwo+ICtbNF0gaHR0cHM6
Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMzkwNDA2NjM0Ngo+
ICtbNV0gaHR0cHM6Ly93d3cuZGViaWFuLm9yZy9yZWxlYXNlcy9ib29rd29ybS8KPiArCj4gK1Vw
c3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vYWJzZWlsL2Fic2VpbC1jcHAvcHVsbC8yMDQ0Cj4g
K1NpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4gKy0tLQo+ICsg
YWJzbC9iYXNlL2F0dHJpYnV0ZXMuaCB8IDcgKysrKysrKwo+ICsgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKQo+ICsKPiArZGlmZiAtLWdpdCBhL2Fic2wvYmFzZS9hdHRyaWJ1dGVzLmgg
Yi9hYnNsL2Jhc2UvYXR0cmlidXRlcy5oCj4gK2luZGV4IDU4ODdmY2FmLi5hMjYxNDNlMSAxMDA2
NDQKPiArLS0tIGEvYWJzbC9iYXNlL2F0dHJpYnV0ZXMuaAo+ICsrKysgYi9hYnNsL2Jhc2UvYXR0
cmlidXRlcy5oCj4gK0BAIC0xMDkyLDcgKzEwOTIsMTQgQEAgc3RydWN0IEFic2xJbnRlcm5hbF9Z
b3VGb3Jnb3RUb0V4cGxpY2l0bHlJbml0aWFsaXplQUZpZWxkIHsKPiArIC8vIFNlZSBodHRwczov
L2NsYW5nLmxsdm0ub3JnL2RvY3MvQXR0cmlidXRlUmVmZXJlbmNlLmh0bWwjd2Fybi11bnVzZWQg
YW5kCj4gKyAvLyBodHRwczovL2djYy5nbnUub3JnL29ubGluZWRvY3MvZ2NjL0NfMDAyYl8wMDJi
LUF0dHJpYnV0ZXMuaHRtbCNpbmRleC13YXJuXzAwNWZ1bnVzZWQtdHlwZS1hdHRyaWJ1dGUKPiAr
ICNpZiBBQlNMX0hBVkVfQ1BQX0FUVFJJQlVURShnbnU6Ondhcm5fdW51c2VkKQo+ICsrLy8gT25s
eSBHQ0MgPj0gMTMgYWxsb3dzIG1peGluZyBzdGFuZGFyZCBhbmQgZ251IGF0dHJpYnV0ZXMuCj4g
KysvLyBJbiBjYXNlIG9mIGdjYyA8IDEzLCBmYWxsYmFjayBvbiB1c2luZyBfX2F0dHJpYnV0ZV9f
Lgo+ICsrLy8gaHR0cHM6Ly9nY2MuZ251Lm9yZy9QUjY5NTg1Cj4gKysjaWYgZGVmaW5lZChfX0dO
VUNfXykgJiYgIWRlZmluZWQoX19jbGFuZ19fKSAmJiBfX0dOVUNfXyA8IDEzCj4gKysjZGVmaW5l
IEFCU0xfQVRUUklCVVRFX1dBUk5fVU5VU0VEIF9fYXR0cmlidXRlX18oKHdhcm5fdW51c2VkKSkK
PiArKyNlbHNlCj4gKyAjZGVmaW5lIEFCU0xfQVRUUklCVVRFX1dBUk5fVU5VU0VEIFtbZ251Ojp3
YXJuX3VudXNlZF1dCj4gKysjZW5kaWYKPiArICNlbHNlCj4gKyAjZGVmaW5lIEFCU0xfQVRUUklC
VVRFX1dBUk5fVU5VU0VECj4gKyAjZW5kaWYKPiArLS0gCj4gKzIuNTQuMAo+ICsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
