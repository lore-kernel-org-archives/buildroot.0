Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435F4C52D71
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 10:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A86F94134A;
	Fri,  9 Aug 2024 10:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2bhALS0-p_6; Fri,  9 Aug 2024 10:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35D3041335
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35D3041335;
	Fri,  9 Aug 2024 10:00:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C41881BF2F6
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 10:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B367D81EB1
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 10:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7M6xf9s_Uw-d for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 10:00:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4090B81EA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4090B81EA4
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4090B81EA4
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 10:00:29 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 12:00:27 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Aug 2024 12:00:26 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 12:00:25 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Fri, 09 Aug 2024 12:00:24 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.09,275,1716242400"; d="scan'208";a="180120872"
Date: Fri, 9 Aug 2024 12:00:24 +0200
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Message-ID: <ZrXouDfJpbEU85QC@tl-lnx-nyma7486-2>
References: <20240805-z-linker-v1-1-8362e6645f67@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240805-z-linker-v1-1-8362e6645f67@gmx.net>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX103.corporate.adroot.infra.ftgroup (10.115.26.4)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1723197631; x=1754733631;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=j0BHVA2DAElye/z82ZBft0EUepO+B4mZdqFP6ojJXSk=;
 b=FIaUr7LLpWwbykviUvDiHcimol0F3qrM4OUh/08OpSHQTI6FCxudwtdG
 f49ShStDRC9lxE6y1fhE/wKAao/ubHIM694Sd1bXun9OgObEvDZSY+yvW
 8q6G/Usx9NtJ9Ydg3oiiTU3FMnT+wKT0eAjQh2wKqax4zDklT8JHmr7Yy
 YpLR7HLBYXkISznNg7chMQBr6RomZQeVPf95PIwxSxc6ZxN37ZBQQOd9p
 Ihmp3E949kp7Hs95BfPZ4Fb1oLoGNOoEH+EgaQ0khRTsFkrj8ui83uYC7
 I5w246VsdA4SkggnR1x8ZlwZCpHBhLLNffpd8/bAQ2AmaW6vFCR0ctSpf
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=FIaUr7LL
Subject: Re: [Buildroot] [PATCH] package/Makefile.in: Use "-z text" instead
 of "-Wl, -z, text"
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Si4sIEFsbCwKCk9uIDIwMjQtMDgtMDUgMjM6NTMgKzAyMDAsIEouIE5ldXNjaMOkZmVyIHZpYSBi
dWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IEFmdGVyIHRoZSByZWNlbnQgYWRkaXRpb24gdG8gLVds
LC16LHRleHQgdG8gVEFSR0VUX0xERkxBR1MgaW4gY2FzZSBvZgo+IG11c2wtbGliYyBhbmQgZHlu
YW1pYyBsaW5raW5nLCBpdCB3YXMgZm91bmQgdGhhdCBzb21lIHBhY2thZ2VzIHBhc3MKPiBUQVJH
RVRfTERGTEFHUyBkaXJlY3RseSB0byBsZCwgYnV0IHRoZSAtV2wgc3ludGF4IG9ubHkgd29ya3Mg
d2l0aAo+IGNvbXBpbGVyIGRyaXZlcnMgKGdjYy9jbGFuZykuIFRoaXMgY29tbWl0IGNoYW5nZXMg
dGhlIGZsYWcgdG8gLXogdGV4dCwKPiB3aGljaCB0aGUgZ2NjIGFuZCBjbGFuZyBhbHNvIHVuZGVy
c3RhbmQgYW5kIHBhc3MgdG8gdGhlIGxpbmtlci4KWy0tU05JUC0tXQo+ICsjIHN1cHBvcnQgLVds
LFsuLi5dLiAteiBpcyBzdXBwb3J0ZWQgYnkgYm90aCBnY2MgYW5kIGNsYW5nLCBzbyBpdCBwcm9i
YWJseQo+ICsjIHdvbid0IGNhdXNlIHVzIHByb2JsZW1zLgoKSSBsYXVnaGVkIGF0IHRoYXQgbGFz
dCBwYXJ0LiA7LSkKClllcywgaXQgaXMgY2F1c2luZyBhbiBpc3N1ZSB3aXRoIGdwc2Q6CgogICAg
JCB3Z2V0IC1PIGRlZmNvbmZpZy5jMDM5OSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcv
cmVzdWx0cy9jMDMvYzAzOTk4OTk0N2I5NjBhYzZhZjE3Yzg3MDkwMzY2YWJjMjZkY2I2ZC9jb25m
aWcKCiAgICAkIGNhdCA8PC1fRU9GXyA+dHN0LWdwc2QKICAgICMhL3Vzci9iaW4vZW52IGJhc2gK
ICAgIG1ha2UgZGlzdGNsZWFuCiAgICBybSBici5sb2cKICAgIG1ha2UgQlIyX0RFRkNPTkZJRz0k
KHB3ZCkvZGVmY29uZmlnLmMwMzk5IGRlZmNvbmZpZyB8fCBleGl0IDEyNQogICAgYnJtYWtlIC1q
MjIgZ3BzZC1kZXBlbmRzIHx8IGV4aXQgMTI1CiAgICBtYWtlIGdwc2QKICAgIF9FT0ZfCgogICAg
JCBnaXQgY2hlY2tvdXQgMjAyNC4wOC1yYzEKICAgICQgZ2l0IGJpc2VjdCBzdGFydAogICAgJCBn
aXQgYmlzZWN0IGJhZAogICAgJCBnaXQgY2hlY2tvdXQgJ21hc3RlckB7MjAyNC0wNy0wMX0nCiAg
ICAkIGdpdCBiaXNlY3QgZ29vZAogICAgJCBnaXQgYmlzZWN0IHJ1biAuL3RzdC1ncHNkCgogICAg
YmQwMzU4NzJiZTk5NDg1MTVlZTUwYWUwMzRiZGE0YTJlMDQ0ZmYyMiBpcyB0aGUgZmlyc3QgYmFk
IGNvbW1pdAogICAgY29tbWl0IGJkMDM1ODcyYmU5OTQ4NTE1ZWU1MGFlMDM0YmRhNGEyZTA0NGZm
MjIKICAgIEF1dGhvcjogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KICAg
IERhdGU6ICAgTW9uIEF1ZyA1IDIzOjUzOjU2IDIwMjQgKzAyMDAKCiAgICAgICAgcGFja2FnZS9N
YWtlZmlsZS5pbjogVXNlICIteiB0ZXh0IiBpbnN0ZWFkIG9mICItV2wsIC16LCB0ZXh0IgoKICAg
IFstLVNOSVAtLV0KCk9mIGNvdXJzZSwgSSBzdXNwZWN0IHRoZSByZWFsIGN1bHByaXQgaXMgbm90
IHRoaXMgYWN0dWFsIGNoYW5nZTsgaXQKcHJvYmFibHkganVzdCB0cmlnZ2VycyBhIGxhdGVudCBp
c3N1ZSBpbiB0aGUgZ3BzZCBidWlsZCBwcm9jZXNzLCB3aGljaAp1c2VzIHNjb25zLCBzbyBtZWgu
Li4KCkknbGwgdHJ5IHRvIGhhdmUgYSBsb29rLCBidXQgaWYgc29tZW9uZSBlbHNlIGNhbiBhbHNv
IGxvb2sgYXQgaXQsIHRoYXQKd291bGQgYmUgbmljZS4gVGhhbmtzIQoKUmVnYXJkcywKWWFubiBF
LiBNT1JJTi4KCj4gIGlmZXEgKCQoQlIyX1RPT0xDSEFJTl9VU0VTX01VU0wpOiQoQlIyX1NUQVRJ
Q19MSUJTKSx5OikKPiAtVEFSR0VUX0xERkxBR1MgKz0gLVdsLC16LHRleHQKPiArVEFSR0VUX0xE
RkxBR1MgKz0gLXogdGV4dAo+ICBlbmRpZgo+IAo+ICAjIEJ5IGRlc2lnbiwgX0ZPUlRJRllfU09V
UkNFIHJlcXVpcmVzIGdjYyBvcHRpbWl6YXRpb24gdG8gYmUgZW5hYmxlZC4KPiAKPiAtLS0KPiBi
YXNlLWNvbW1pdDogZjlmMmFkZTliYjIwN2QyNDgxYjEyYTMyNWJiYTdjZWU1YTNlOWNiZgo+IGNo
YW5nZS1pZDogMjAyNDA4MDUtei1saW5rZXItNjhlMjJmY2IzMzg4Cj4gCj4gQmVzdCByZWdhcmRz
LAo+IC0tCj4gSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBfX19fX19fX19fX18KLi0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tOiAgICAgICBfICAgIDotLS0tLS0tLS0tLS0tLS0tLS0uCnwg
IFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgICAgX18vICkgICB8IC8iXCBB
U0NJSSBSSUJCT04gfAp8ICAgICAgICAgICAgICAgICB8IFNvZnR3YXJlICBEZXNpZ25lciB8ICBf
LyAtIC8nICAgfCBcIC8gQ0FNUEFJR04gICAgIHwKfCArMzMgNjM4LjQxMS4yNDUgJy0tLS0tLS0t
LS0tLS0tLS0tLS0tOiAoXyAgICBgLS0sIHwgIFggIEFHQUlOU1QgICAgICB8CnwgeWFubi5tb3Jp
biAoYXQpIG9yYW5nZS5jb20gICAgICAgICAgIHxfPSIgICAgLC0tJyB8IC8gXCBIVE1MIE1BSUwg
ICAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS06X19fX19fL19fX19f
Oi0tLS0tLS0tLS0tLS0tLS0tLScKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXw0KQ2UgbWVzc2FnZSBldCBzZXMgcGllY2VzIGpvaW50ZXMgcGV1dmVu
dCBjb250ZW5pciBkZXMgaW5mb3JtYXRpb25zIGNvbmZpZGVudGllbGxlcyBvdSBwcml2aWxlZ2ll
ZXMgZXQgbmUgZG9pdmVudCBkb25jDQpwYXMgZXRyZSBkaWZmdXNlcywgZXhwbG9pdGVzIG91IGNv
cGllcyBzYW5zIGF1dG9yaXNhdGlvbi4gU2kgdm91cyBhdmV6IHJlY3UgY2UgbWVzc2FnZSBwYXIg
ZXJyZXVyLCB2ZXVpbGxleiBsZSBzaWduYWxlcg0KYSBsJ2V4cGVkaXRldXIgZXQgbGUgZGV0cnVp
cmUgYWluc2kgcXVlIGxlcyBwaWVjZXMgam9pbnRlcy4gTGVzIG1lc3NhZ2VzIGVsZWN0cm9uaXF1
ZXMgZXRhbnQgc3VzY2VwdGlibGVzIGQnYWx0ZXJhdGlvbiwNCk9yYW5nZSBkZWNsaW5lIHRvdXRl
IHJlc3BvbnNhYmlsaXRlIHNpIGNlIG1lc3NhZ2UgYSBldGUgYWx0ZXJlLCBkZWZvcm1lIG91IGZh
bHNpZmllLiBNZXJjaS4NCg0KVGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMgbWF5IGNv
bnRhaW4gY29uZmlkZW50aWFsIG9yIHByaXZpbGVnZWQgaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUg
cHJvdGVjdGVkIGJ5IGxhdzsNCnRoZXkgc2hvdWxkIG5vdCBiZSBkaXN0cmlidXRlZCwgdXNlZCBv
ciBjb3BpZWQgd2l0aG91dCBhdXRob3Jpc2F0aW9uLg0KSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhp
cyBlbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhp
cyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMuDQpBcyBlbWFpbHMgbWF5IGJlIGFsdGVyZWQs
IE9yYW5nZSBpcyBub3QgbGlhYmxlIGZvciBtZXNzYWdlcyB0aGF0IGhhdmUgYmVlbiBtb2RpZmll
ZCwgY2hhbmdlZCBvciBmYWxzaWZpZWQuDQpUaGFuayB5b3UuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
