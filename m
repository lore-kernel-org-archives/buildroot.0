Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0EFCD6E5D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 20:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2404882C8F;
	Tue,  2 Jun 2026 20:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WsKXU0pmO3l8; Tue,  2 Jun 2026 20:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 482BE82C9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780431399;
	bh=TxZQemNmkUHxirhrviGWz1YKzw3ah6gf9INinsr57mM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=nxqPYKZaISguoSGNGAvp1eZQUGXm/Z9E0kvvkdAhHBRNktk0yoq85tXhO7pq8ujKu
	 Wu7tnOUOoGq6VZbmLJkSIAuxeaenchDwej7MfEygzjKUGdmCos0BaEKPRecVOnMtc9
	 qETMJXNlHMmD4SdUOE9QPYqgPfX/hli0I1c/OGb1F3ylpcJ0wvzZ4UWoEQ+QaAt1pF
	 U4AbgRdVdexOyxlkEzKy97ryc2HNbUh+rZuqpT1gg9MfXOASDEb/4vkXGXmn2t4GVX
	 kd2OvEuAlIhBKkfiXv220WWELqfe99EcD8qQPiUcLyJbNPNuBUfl/VOD/GrhkVYSFX
	 LIBVM0onG5gLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 482BE82C9C;
	Tue,  2 Jun 2026 20:16:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CB3D381
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1255882C9C
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9XS9CA8J-uB for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 20:16:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0DF7F82C8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DF7F82C8F
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DF7F82C8F
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:16:36 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-45efa80e0afso2811837f8f.2
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 13:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780431395; x=1781036195;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ci1HQHsM/XOsDCUWfAj8JRE/lB0NwNgj/6suDNiRWoI=;
 b=F1qCTb01kMj1CMVYF1KRE8aDdPm/qB02FWpxfjKcSdayEMobm9ow5Mqu1pbQ5sBv0A
 BrkznCQBPG5Uk2j/x8CdsyL8l2Eq3Zfq/yPDpjrSekcufp6DCQ5pAExhL70YeF0WxE5N
 OWrxcbaEZFDIXNiLX6J6MvP4o6lguPiC1omDaXHlgnagnIjOZmxTUK3gmhT8XBKP6JFT
 n9TbjqUfDe5iL0gSpFYO6rwCVNqetMGbbyXXpnvrH73JULk1BF/EPqN8XhgYCRVjHU4W
 zn2SBt69bEG3CLbp7huC55OZSWxR0xnvEvIwbs9UKxUHrZ2KVqN4CFS8TMtJ0/1sBFuC
 PhQQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+UF7Qu6lGprPqkXVvSs6HQM/IU/5eBR5uPv0MW7ku9zsozz0g7SHFQoRjVvmb7ZK5ENtm7zWHam/M=@buildroot.org
X-Gm-Message-State: AOJu0YyILOboyvYGmYAOrm0UXgWwcRsAVeuZviOH++SfoMmTjLKjgaE4
 br5fCcO3KOTBG76tV9kCGvpIrdcQZuDvc6zL3mQMO6JJlds3ykjrZxy1+CIgLN4yMWxAFinnamN
 f161f
X-Gm-Gg: Acq92OF3mhkmX3sh6nSKfUjzdAhxDAGeNmnTjT5CiY/Q/HS+RZCn/3l2FaswRJpPyfR
 2pe/2iGUYbAXOpVhVJS90FoSCLYfres4t4lXSUVvAMFelacviRSEZYA1mr3jtP7wn/u5cTzreMv
 iDpWoEJ5ozCXlyq8DnIOSqy191NIU49sDd75ltKy3huoFn+pugrek51nfb+RhUBJIPGK8WSX2NX
 45xTdYIm/YG6uXgDkD8Yg5HxuysZTWZt83e0d466udcKaZgr0XKXDEkefPW3Pl8LTodxtC46/wd
 dNXI19thEBbd4Q+Biauksnhx8HKRSUC8JJYuvfiEN29bG7d/DMuYcni247oqsooIvur8hDd5ead
 KOm1BQY6GfHf/fkY5BrM5hIWDUd2DWT9Dk6PpQggzjxzGSlZgQtfUgVH85FnpxSkqoth8DVryql
 u4YUltvAiqurd4eSRLo/2kjS78cXu+zRcVoJciSGUxRR/XpEQJ/HcKZcpHJkq/SRl+NManaRdUV
 KtIaMsZS8dGn1XdFMjKH+Vb0Gt/OIY44xsJE4HbyyX/LYz73jgVHi4HYvToWMlNmCudBgpOZXqZ
 nukDXLkVEVE=
X-Received: by 2002:a05:6000:40de:b0:45e:ea71:c6e1 with SMTP id
 ffacd0b85a97d-46021726514mr93358f8f.21.1780431394986; 
 Tue, 02 Jun 2026 13:16:34 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f35133csm1611279f8f.25.2026.06.02.13.16.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 13:16:34 -0700 (PDT)
Message-ID: <ca5adc6b-0fa3-4551-b594-eb4f562d4baa@smile.fr>
Date: Tue, 2 Jun 2026 22:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org
References: <20260601192855.1901119-1-arnout@rnout.be>
Content-Language: fr, en-US
In-Reply-To: <20260601192855.1901119-1-arnout@rnout.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780431395; x=1781036195; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ci1HQHsM/XOsDCUWfAj8JRE/lB0NwNgj/6suDNiRWoI=;
 b=maeo+hJT4FL5eTHHmBd15ekHN1U8w1T2ZDlFC7VESAHNWFkE8h30aoBG6mrHW+FzlI
 /HHoSWefs3inwVUR0VoNZKaHbcQoB4I/fd9MK9jofIRm3yco5uwTEsExN+WSozC6c7gy
 t5JggchNjwKGQJ1tr8fzCmmtvKBoMPZBs44V0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=maeo+hJT
Subject: Re: [Buildroot] [PATCH v--cc=Romain Naour <romain.naour@smile.fr>]
 support/scripts/generate-gitlab-ci-yml: use large runners for defconfigs
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

SGVsbG8gQXJub3V0LCBBbGwsCgpMZSAwMS8wNi8yMDI2IMOgIDIxOjI4LCBBcm5vdXQgVmFuZGVj
YXBwZWxsZSB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gZGVmY29uZmlncyBhcmUgdmVyeSB1
bmxpa2VseSB0byBzdWNjZXNzZnVsbHkgYnVpbGQgb24gYSBzbWFsbCBydW5uZXIKPiBiZWNhdXNl
IHRoZXkgYnVpbGQgYSBrZXJuZWwgKGFuZCBvZnRlbiBhIHRvb2xjaGFpbikuIFRoZXkncmUgYWxz
byBsaWtlbHkKPiB0byBiZW5lZml0IGEgbG90IGZyb20gdGhlIGFkZGl0aW9uYWwgcGFyYWxsZWxp
c20gb24gbGFyZ2VyIHJ1bm5lcnMuCj4gCj4gRm9yIG5vdywgYWx3YXlzIGJ1aWxkIHRoZW0gb24g
bGFyZ2UgcnVubmVycy4gVGhlcmUgbWF5IGJlIHNvbWUgZm9yIHdoaWNoCj4gZXZlbiB0aGUgbGFy
Z2UgcnVubmVycyBkb24ndCBoYXZlIHN1ZmZpY2llbnQgZGlzayBzcGFjZSBvciBtZW1vcnksIGJ1
dAo+IHdlJ2xsIHNvbHZlIHRoYXQgd2hlbiBpdCBoYXBwZW5zLgoKV2UgbWF5IGludHJvZHVjZSBh
ICIjIGdpdGxhYi1ydW5uZXI6IiB0YWcgZGlyZWN0bHkgaW4gdGhlIGRlZmNvbmZpZyBib2FyZApk
aXJlY3RvcnkgKGluIHRoZSByZWFkbWUudHh0IGZpbGU/KTogYm9hcmQvYWFyY2g2NC1lZmkvcmVh
ZG1lLnR4dAooYWFyY2g2NF9lZmlfZGVmY29uZmlnKS4KClRoaXMgbmV3IGNvbnN0cmFpbiByZXF1
aXJlcyB0byBjb21wbGV0ZSB0aGUgc3dpdGNoIHRvIGEgcHJlYnVpbHQgdG9vbGNoYWluIGFuZApl
dmVudHVhbGx5IHJlbW92ZSB1bm1haW50YWluZWQgZGVmY29uZmlncy4gKFdlIHN0aWxsIGhhdmUg
YSBmZXcgZGVmY29uZmlnIHVzaW5nCmEgNC54IGtlcm5lbCB0aGF0IHByb2JhYmx5IGRvZXNuJ3Qg
YnVpbGQgd2l0aCBsYXRlc3QgZ2NjIHZlcnNpb24pLgoKRm9yIG5vdyB1c2UgbGFyZ2UgcnVubmVy
cyBmb3IgYWxsIGRlZmNvbmZpZ3MuCgpBcHBsaWVkIHRvIG1hc3Rlci4gVGhhbmtzLgoKQmVzdCBy
ZWdhcmRzLApSb21haW4KCj4gCj4gU2lnbmVkLW9mZi1ieTogQXJub3V0IFZhbmRlY2FwcGVsbGUg
PGFybm91dEBybm91dC5iZT4KPiAtLS0KPiAgc3VwcG9ydC9zY3JpcHRzL2dlbmVyYXRlLWdpdGxh
Yi1jaS15bWwgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3NjcmlwdHMvZ2VuZXJhdGUtZ2l0bGFi
LWNpLXltbCBiL3N1cHBvcnQvc2NyaXB0cy9nZW5lcmF0ZS1naXRsYWItY2kteW1sCj4gaW5kZXgg
MmE4YzliZTVmNS4uNDhjMjcyZTZmNSAxMDA3NTUKPiAtLS0gYS9zdXBwb3J0L3NjcmlwdHMvZ2Vu
ZXJhdGUtZ2l0bGFiLWNpLXltbAo+ICsrKyBiL3N1cHBvcnQvc2NyaXB0cy9nZW5lcmF0ZS1naXRs
YWItY2kteW1sCj4gQEAgLTEyNiw3ICsxMjYsNyBAQCBnZW5fdGVzdHMoKSB7Cj4gIAo+ICAgICAg
aWYgWyAtbiAiJHtkb19kZWZjb25maWdzfSIgXTsgdGhlbgo+ICAgICAgICAgIGZvciBjZmcgaW4g
IiR7ZGVmY29uZmlnc1tAXX0iOyBkbwo+IC0gICAgICAgICAgICBwcmludGYgJyVzJXM6IHsgZXh0
ZW5kczogLmRlZmNvbmZpZ18lcyB9XG4nIFwKPiArICAgICAgICAgICAgcHJpbnRmICclcyVzOiB7
IGV4dGVuZHM6IFsgLmRlZmNvbmZpZ18lcywgLnJ1bm5lci1sYXJnZSBdIH1cbicgXAo+ICAgICAg
ICAgICAgICAgICAgICAgIiR7Y2ZnfSIgIiR7ZGVmY29uZmlnc19leHR9IiAiJHtkb19kZWZjb25m
aWdzfSIKPiAgICAgICAgICBkb25lCj4gICAgICBmaQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
