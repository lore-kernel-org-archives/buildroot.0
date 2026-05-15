Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DAACD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F08541D7E;
	Fri, 15 May 2026 17:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 20MsoBPGRExo; Fri, 15 May 2026 17:46:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25D3241D27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867167;
	bh=+82jSNm39anDatczh/er2XlUOazbv+beAZhdh7dJbDc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XPVAnsnROvbTBjuPY9bsbK5L6TXtfgrnXyzztjtB6jkS+Nik05dJM+VMTtyPxQEBN
	 PohGi0y5koER/kZPg7+CLU4GXtNueVcXDo0kfx90m+eseLN1HHHBlAIyrXiG3p0mdz
	 xIMgY7xoZ3z1OEBGXUP05Xb/YSaAa0beEgLhMWlcvFfE0w+X3GKub/slO41JP7PNRJ
	 Z01zY5fCVPgn+sapmp6pl2DN/8A9SK09o2iZ6I7Bp55+ivub5GQyGGvnG7Gm76pgrI
	 FoRuJOioSJidEhYkSVruwmRJLq7dtB5C5s0SFXQ2jvuGiogugv5ox9P+JC+dj5IEAA
	 o+Nw+NKBrFosA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25D3241D27;
	Fri, 15 May 2026 17:46:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B3F8823F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99DC341D24
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rn1Axn1TAFNM for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 64C3541C4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64C3541C4F
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64C3541C4F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:03 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso731285e9.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867161; x=1779471961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zDn7zPng73tHeG2fzPduIuNBwdkP86DSyNOv/BBHkws=;
 b=lC5DPivZhDdmz/CxR3ZE1D3AhVX2uZLrppiUzwgV/h2zHwZ6jKRZasnIX272Z/CTNO
 3jGqME+ZwuUaTxA/0kvr3sc2+YcIZbzGy5L1jeAg4DYH0fHSmF9gndWU59JF7WS3/86r
 E3zNIt/RfK4ctoZnBSdK/3EmOqD+mLCxZbrTu8loE/17qC02XtGtsSFMw256IxdgiD2z
 e7lWmhB5f4pYdtob477G23nc9uKBxs/iDLvFw8quV/6mCAOCY6S+nKPeJWtvPK9559MW
 m1Uc5Kdwf8tpKDEMSJ9vjG5xq9DIscFpTLOztgzbV+jEFt4XOia9aISBuykiC1dF8z0a
 z9ug==
X-Forwarded-Encrypted: i=1;
 AFNElJ+QXoO5Y3VOsihuEE4/wfsBbGJmAOjm20Lfcp8sXp3RxwdWZ67sXW/XUQ4vu+A6nV5UZu3e9gZiaWY=@buildroot.org
X-Gm-Message-State: AOJu0Yzt3ztxQ9WYQZlDUtref7egvAEirLexFd6wyEe9hjHipxWIJl2l
 zueXbSG5Pd+1bHc4kV5m8PR50a8RKuzxfVllhe2pAvoXFcC5PYJ10WBwDz5pzfIhNBcjrcnXb9H
 CAGn3
X-Gm-Gg: Acq92OHCSpOZh006Z+sQzQUYKlpBsPf2aacoMs+m6Kjt7DXPM2bPNWaJku+vBtIX73t
 wtfNCD3LiNCCRES3RUgmFdKKRy+mMKN3D29P6RaUWBizLGCQ6SYQBSAFGfwgcpDvgRom9I6D/bH
 u7kIOvwnYSkIXRnJRyDr0egBOM/CIM9028ujGuoTK79uO8QcaNAfxPvz1ge5LmSAhwoR9hqDKsk
 UFB6c13daVjP01mQhMmpyp8BjqBFsSQSMcsgMCS0OSF7DKF3QkEwn/T3HP+FdzZiV8mJywyDAbW
 8SteFtScYZXm1BRGVnfMZVkJcrnW95ntxjkRRrkSGrxEt64gX2V48LzKJgdmFbBrsmgml5OrchO
 zPvDWIeAT03PtdSIpwewr5WVLukSiiAesZVuIxWP1g4aamklG87gLBx7cMdd4GGSutGdmyE7c8s
 oDPFh+yvZgQX6uShgyCkY3EeOkrJ5PM9qP8nxOi+1CVsFa
X-Received: by 2002:a05:600c:34c3:b0:48f:d0f7:78f1 with SMTP id
 5b1f17b1804b1-48fe60e4e27mr76131045e9.4.1778867161238; 
 Fri, 15 May 2026 10:46:01 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a17ec2sm14746144f8f.24.2026.05.15.10.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:00 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:45:59 +0200
Message-ID: <20260515174600.529346-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506121800.507252-1-buildroot@bubu1.eu>
References: <20260506121800.507252-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867161; x=1779471961; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zDn7zPng73tHeG2fzPduIuNBwdkP86DSyNOv/BBHkws=;
 b=G6o8v8DzvfIV+j4e/RDuJ1qxHVXJeAbEBUifN1yi2SL05Z/UaTP1u5AXRb7rMqF5k/
 Xp93yE6NsWs5CqTLhJ/4wvUErcbEo+xYujiEdB6V4nrVuv6z2Y2DSbNOpNORwinp+4Zb
 gsyJ7yIahCDsjDY6HpPODCuqbTyRQ5JjGg6BwvpDS3TmFFyfxpbm0HagA2Ki3Ih9jXRZ
 +Zkok4Y2gsk46+dRvaX1p1qwcRxcrwVZ73j8mQyDf+1JO8kPxU1vH7x7nGsQ8b0UG7Mu
 smUb86NKCGH26S0/g/924pUQgOscdE01dEe1+VgjEXxS5bZ+xF+S6ugRSz5RRyW434dI
 xQfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G6o8v8Dz
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 6.0.5
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gRGphbmdvIDYuMC41IGZpeGVzIHRocmVlIHNlY3VyaXR5IGlzc3VlcyB3
aXRoIHNldmVyaXR5IOKAnGxvd+KAnSBhbmQgc2V2ZXJhbCBidWdzIGluIDYuMC40Lgo+IAo+IFNl
Y3VyaXR5IEZpeGVzOgo+ICogQ1ZFLTIwMjYtNTc2NjogUG90ZW50aWFsIGRlbmlhbC1vZi1zZXJ2
aWNlIHZ1bG5lcmFiaWxpdHkgaW4gQVNHSQo+ICAgICByZXF1ZXN0cyB2aWEgZmlsZSB1cGxvYWQg
bGltaXQgYnlwYXNzIEFTR0kgcmVxdWVzdHMgd2l0aCBhIG1pc3NpbmcKPiAgICAgb3IgdW5kZXJz
dGF0ZWQgQ29udGVudC1MZW5ndGggaGVhZGVyIGNvdWxkIGJ5cGFzcyB0aGUKPiAgICAgRklMRV9V
UExPQURfTUFYX01FTU9SWV9TSVpFIGxpbWl0LCBwb3RlbnRpYWxseSBsb2FkaW5nIGxhcmdlIGZp
bGVzIGludG8KPiAgICAgbWVtb3J5IGFuZCBjYXVzaW5nIHNlcnZpY2UgZGVncmFkYXRpb24uCj4g
Cj4gICAgIEFzIGEgcmVtaW5kZXIsIERqYW5nbyBleHBlY3RzIGEgbGltaXQgdG8gYmUgY29uZmln
dXJlZCBhdCB0aGUgd2ViIHNlcnZlcgo+ICAgICBsZXZlbCByYXRoZXIgdGhhbiBzb2xlbHkgcmVs
eWluZyBvbiBGSUxFX1VQTE9BRF9NQVhfTUVNT1JZX1NJWkUuCj4gCj4gICAgIFRoaXMgaXNzdWUg
aGFzIHNldmVyaXR5IOKAnGxvd+KAnSBhY2NvcmRpbmcgdG8gdGhlIERqYW5nbyBzZWN1cml0eSBw
b2xpY3kKPiAKPiAqIENWRS0yMDI2LTM1MTkyOiBTZXNzaW9uIGZpeGF0aW9uIHZpYSBwdWJsaWMg
Y2FjaGVkIHBhZ2VzIGFuZCBTRVNTSU9OX1NBVkVfRVZFUllfUkVRVUVTVAo+ICAgICBSZXNwb25z
ZSBoZWFkZXJzIGRpZCBub3QgdmFyeSBvbiBjb29raWVzIGlmIGEgc2Vzc2lvbiB3YXMgbm90IG1v
ZGlmaWVkLAo+ICAgICBidXQgU0VTU0lPTl9TQVZFX0VWRVJZX1JFUVVFU1Qgd2FzIFRydWUuIEEg
cmVtb3RlIGF0dGFja2VyIGNvdWxkIHN0ZWFsIGEKPiAgICAgdXNlcuKAmXMgc2Vzc2lvbiBhZnRl
ciB0aGF0IHVzZXIgdmlzaXRzIGEgY2FjaGVkIHB1YmxpYyBwYWdlLgo+IAo+ICAgICBUaGlzIGlz
c3VlIGhhcyBzZXZlcml0eSDigJxsb3figJ0gYWNjb3JkaW5nIHRvIHRoZSBEamFuZ28gc2VjdXJp
dHkgcG9saWN5Lgo+IAo+ICogQ1ZFLTIwMjYtNjkwNzogUG90ZW50aWFsIGV4cG9zdXJlIG9mIHBy
aXZhdGUgZGF0YSBkdWUgdG8gaW5jb3JyZWN0Cj4gICAgIGhhbmRsaW5nIG9mIFZhcnk6ICogaW4g
VXBkYXRlQ2FjaGVNaWRkbGV3YXJlCj4gCj4gICAgIFByZXZpb3VzbHksIFVwZGF0ZUNhY2hlTWlk
ZGxld2FyZSB3b3VsZCBlcnJvbmVvdXNseSBjYWNoZSByZXF1ZXN0cyB3aGVyZQo+ICAgICB0aGUg
VmFyeSBoZWFkZXIgY29udGFpbmVkIGFuIGFzdGVyaXNrICgnKicpLiBUaGlzIGNvdWxkIGxlYWQg
dG8gcHJpdmF0ZQo+ICAgICBkYXRhIGJlaW5nIHN0b3JlZCBhbmQgc2VydmVkLgo+IAo+ICAgICBU
aGlzIGlzc3VlIGhhcyBzZXZlcml0eSDigJxsb3figJ0gYWNjb3JkaW5nIHRvIHRoZSBEamFuZ28g
c2VjdXJpdHkgcG9saWN5Lgo+IAo+IEJ1Z2ZpeGVzOgo+ICogRml4ZWQgYSBtaXNwbGFjZWQgPC9k
aXY+IGluIHRoZQo+ICAgZGphbmdvL2NvbnRyaWIvYWRtaW4vdGVtcGxhdGVzL2FkbWluL2NoYW5n
ZV9saXN0Lmh0bWwgdGVtcGxhdGUgYWRkZWQKPiAgIGluIERqYW5nbyA2LjAgdGhhdCBjb3VsZCBi
ZSBwcm9ibGVtYXRpYyB3aGVuIG92ZXJyaWRpbmcgdGhlIHBhZ2luYXRpb24KPiAgIGJsb2NrICgj
MzcwMjkpLgo+ICogRml4ZWQgYSBidWcgaW4gRGphbmdvIDYuMCB3aGVyZSBkZXByZWNhdGlvbiB3
YXJuaW5ncyBpbmNvcnJlY3RseQo+ICAgc2tpcHBlZCBsaW5lcyBmcm9tIHRoaXJkLXBhcnR5IHBh
Y2thZ2VzIHByZWZpeGVkIHdpdGgg4oCcZGphbmdv4oCdCj4gICAoIzM3MDY3KS4KPiAKPiBSZWxl
YXNlIG5vdGVzOiBodHRwczovL2RvY3MuZGphbmdvcHJvamVjdC5jb20vZW4vNi4wL3JlbGVhc2Vz
LzYuMC41Lwo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmN1cyBIb2ZmbWFubiA8YnVpbGRyb290QGJ1
YnUxLmV1PgoKQXBwbGllZCB0byAyMDI2LjAyLnguIFRoYW5rcwoKPiAtLS0KPiAgcGFja2FnZS9w
eXRob24tZGphbmdvL3B5dGhvbi1kamFuZ28uaGFzaCB8IDQgKystLQo+ICBwYWNrYWdlL3B5dGhv
bi1kamFuZ28vcHl0aG9uLWRqYW5nby5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9w
eXRob24tZGphbmdvL3B5dGhvbi1kamFuZ28uaGFzaCBiL3BhY2thZ2UvcHl0aG9uLWRqYW5nby9w
eXRob24tZGphbmdvLmhhc2gKPiBpbmRleCA2YzMxN2NmNmUwLi41YWYwNDNmMmMyIDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWRqYW5nby9weXRob24tZGphbmdvLmhhc2gKPiArKysgYi9w
YWNrYWdlL3B5dGhvbi1kamFuZ28vcHl0aG9uLWRqYW5nby5oYXNoCj4gQEAgLTEsNiArMSw2IEBA
Cj4gICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvZGphbmdvL2pzb24K
PiAtbWQ1ICA5ZDQyOWNiZWY4YzgzNTdhNDgwZDBiOTIwZGQ5YTk1NiAgZGphbmdvLTYuMC40LnRh
ci5nego+IC1zaGEyNTYgIDhjZmEyNTcyYjNmMjc2OGIyZTg0OTgzY2YzYzQ4MTE4NzdhMDFlZGI2
NGU4MTc5ODZlYzVkNjA3NTFjMTEzYWMgIGRqYW5nby02LjAuNC50YXIuZ3oKPiArbWQ1ICA0NGMx
OGE4ZjI2NGMxMzI2ZTZmZTRmMTA1M2ZlYTVmYyAgZGphbmdvLTYuMC41LnRhci5nego+ICtzaGEy
NTYgIGJjNmQ2ODcyZTk4YTI4NjRjODM2ZTQyZWRkNjQ0YjM2MmRiMzExMTQ3ZGQ1YWE4ZDViODJi
YTdhMDMyZjUyNjkgIGRqYW5nby02LjAuNS50YXIuZ3oKPiAgIyBMb2NhbGx5IGNvbXB1dGVkIHNo
YTI1NiBjaGVja3N1bXMKPiAgc2hhMjU2ICBiODQ2NDE1ZDFiNTE0ZTljMWRmZjE0YTIyZGViOTA2
ZDc5NGJjNTQ2Y2E2MTI5Zjk1MGExOGNkMDkxZTJhNjY5ICBMSUNFTlNFCj4gIHNoYTI1NiAgYmUz
MGRjMGUzZjcwMTBhZjZjNDUzZDIwNWZlYWVjZTFmODk0OTQ3ODliNmU5MmYwYzI1NWVmNTk3YTFl
Njg2NCAgZGphbmdvL2NvbnRyaWIvZ2lzL21lYXN1cmUucHkKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9weXRob24tZGphbmdvL3B5dGhvbi1kamFuZ28ubWsgYi9wYWNrYWdlL3B5dGhvbi1kamFuZ28v
cHl0aG9uLWRqYW5nby5tawo+IGluZGV4IDIwMWVlY2UxNjQuLmZlODgxMjhlMjQgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS9weXRob24tZGphbmdvL3B5dGhvbi1kamFuZ28ubWsKPiArKysgYi9wYWNr
YWdlL3B5dGhvbi1kamFuZ28vcHl0aG9uLWRqYW5nby5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAj
Cj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1QWVRIT05fREpBTkdPX1ZFUlNJT04g
PSA2LjAuNAo+ICtQWVRIT05fREpBTkdPX1ZFUlNJT04gPSA2LjAuNQo+ICBQWVRIT05fREpBTkdP
X1NPVVJDRSA9IGRqYW5nby0kKFBZVEhPTl9ESkFOR09fVkVSU0lPTikudGFyLmd6Cj4gIFBZVEhP
Tl9ESkFOR09fU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9z
b3VyY2UvZC9kamFuZ28KPiAgUFlUSE9OX0RKQU5HT19MSUNFTlNFID0gQlNELTMtQ2xhdXNlLCBN
SVQgKGpxdWVyeSwgdXRpbHMvYXJjaGl2ZS5weSksIEJTRC0yLUNsYXVzZSAoaW5saW5lcy5qcyks
IENDLUJZLTQuMCAoYWRtaW4gc3ZnIGZpbGVzKQo+IC0tIAo+IDIuNTQuMAo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxp
bmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
