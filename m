Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AB5CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 10:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A842F407B7;
	Wed, 13 Aug 2025 10:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJj12Ftpmucs; Wed, 13 Aug 2025 10:00:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1B0740829
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1B0740829;
	Wed, 13 Aug 2025 10:00:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03935938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 10:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E969B40225
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 10:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FTRVJzHnbpRa for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 10:00:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E049B4023C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E049B4023C
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E049B4023C
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 10:00:31 +0000 (UTC)
X-CSE-ConnectionGUID: sBbGujbdTH2O7kT4tJX9mw==
X-CSE-MsgGUID: 1jZMJ+XNRVisyWG+bForTw==
Received: from unknown (HELO opfedv3rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 12:00:28 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Aug 2025 12:00:28 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Wed, 13 Aug 2025 12:00:27 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 13 Aug 2025 12:00:26 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: TR6M/k/kRui+2jI4GAuj2Q==
X-CSE-MsgGUID: vrfeh2y5Th+gcd/oPqQ99w==
X-IronPort-AV: E=Sophos;i="6.17,285,1747692000"; d="scan'208";a="321331138"
Date: Wed, 13 Aug 2025 12:00:26 +0200
To: "Frager, Neal" <neal.frager@amd.com>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Message-ID: <aJxiOiEp8IG2zdXX@yd-6wlzhs3>
References: <20250813084354.2739722-1-neal.frager@amd.com>
 <aJxY+xaZhMFLzxX9@yd-6wlzhs3> <20250813112755.63b17355@booty>
 <SA1PR12MB5615D78075169997FF3A7369F02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SA1PR12MB5615D78075169997FF3A7369F02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX106.corporate.adroot.infra.ftgroup (10.115.27.3)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1755079232; x=1786615232;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=s/OjNMJGG3ME97JkXzyM4Lg8G11i+r2tipu8Z+6lkQs=;
 b=X8vrtG1IpstObs6z8i36dfuRxcTxazNqErFePeQG/aa1hQNGBQ9bp10M
 ff+yesiT4ntJdeUVTR0XYBIvYoMFrl/evKriM8ks5gIu3ZxpaxhPdd0s3
 RbsxR4jC1xnnaOIslBjafkoocniOcVe43mQ3AAeiZxVnbRDsdg10SJoaY
 xR1Pm4WRTd+SjR8b7O0jQTU0OJz1zd1TZANomCCoAHCXNY4aMlhjV5amf
 WPKcvPARE8rMyYFs9BW2HE5M/iwaz6Xuy8AYBpuZ2tgoifIFbJiuNgX63
 4Nzsv5yZShvpzQmm2x9ciOaFYuHO04tGcnew//UP3xlk0HS6RwNR3DEVu
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=X8vrtG1I
Subject: Re: [Buildroot] [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
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

TmVhbCwgQWxsLAoKT24gMjAyNS0wOC0xMyAwOTo0NCArMDAwMCwgRnJhZ2VyLCBOZWFsIHNwYWtl
IHRodXNseToKPiA+IE9uIDIwMjUtMDgtMTMgMDk6NDMgKzAxMDAsIE5lYWwgRnJhZ2VyIHZpYSBi
dWlsZHJvb3Qgc3Bha2UgdGh1c2x5OgpbLS1TTklQLS1dCj4gPiA+IC0gICBkZXBlbmRzIG9uIEJS
Ml9hYXJjaDY0Cj4gPiA+ICsgICBkZXBlbmRzIG9uIEJSMl9jb3J0ZXhfYTUzIHx8IEJSMl9jb3J0
ZXhfYTcyCj4gPiBOb3RlIHRoYXQgKEJSMl9jb3J0ZXhfYTUzIHx8IEJSMl9jb3J0ZXhfYTcyKSBp
cyBub3QgYSBzdWJzZXQgb2YKPiA+IEJSMl9hYXJjaDY0OyB0aGV5IGNhbiBlYWNoIGJlIHNlbGVj
dCB3aGVuIHRoZSB0YXJnZXQgaXMgQlIyX2FybSwKPiA+IEJSMl9hcm1lYiBvciBCUjJfYWFyY2g2
NF9iZS4KWy0tU05JUC0tXQo+IEkgd2lsbCB0aHVzIGNoYW5nZSB0aGUgZGVwZW5kZW5jeSB0byB0
aGUgZm9sbG93aW5nOgo+IGRlcGVuZHMgb24gQlIyX2FhcmNoNjQKPiBkZXBlbmRzIG9uIEJSMl9j
b3J0ZXhfYTUzIHx8IEJSMl9jb3J0ZXhfYTcyCj4gSSB0aGluayBpdCBsb29rcyBlYXNpZXIgdG8g
dW5kZXJzdGFuZCBhcyB0d28gbGluZXMuCgpXaGVuIHRoZSBkZXBlbmRlbmN5IGlzIG5vdCB0cmlj
dmlhbCwgSSB0aGluayBpdCBpcyBnb29kIHRvIGludHJvZHVjZSBhbgppbnRlcm1lZGlhdGUgc3lt
Ym9sOgoKICAgIGNvbmZpZyBCUjJfVEFSR0VUX1hJTElOWF9FTUJFRERFRFNXX0FSQ0hfU1VQUE9S
VFMKICAgICAgICBib29sCiAgICAgICAgZGVmYXVsdCB5CiAgICAgICAgIyBBbGwgWGlsaW54IFNv
Q3MgdXNpbmcgdGhpcyBwYWNrYWdlIGFyZSBhYXJjaDY0IG9ubHkKICAgICAgICBkZXBlbmRzIG9u
IEJSMl9hYXJjaDY0CiAgICAgICAgIyBvbmx5IENQVXMgd2l0aCBjb3JyZXNwb25kaW5nIGZpcm13
YXJlczoKICAgICAgICBkZXBlbmRzIG9uIEJSMl9jb3J0ZXhfYTUzIHx8IEJSMl9jb3J0ZXhfYTcy
ICAjIG9ubHkgQ1BVcyB3aXRoCgouLi4gYW5kIHRoZW4gdXNlIHRoYXQgaW4gdGhlIG1haW4gc3lt
Ym9sOgoKICAgIGNvbmZpZyBCUjJfVEFSR0VUX1hJTElOWF9FTUJFRERFRFNXCiAgICAgICAgYm9v
bCAieGlsaW54LWVtYmVkZGVkc3ciCiAgICAgICAgZGVwZW5kcyBvbiBCUjJfVEFSR0VUX1hJTElO
WF9FTUJFRERFRFNXX0FSQ0hfU1VQUE9SVFMKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAK
Ci4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLTrMhcyFIMyFzIXMhcyFIMyF
zIXMhcyFIMyFzIXMhcyFIMyFzIXMhcyFIMyFzIXMhcyFIMyFzIXMhcyFIMyFzIXMhcyFX8yFIMyF
zIXMhcyFIMyFzIXMhcyFIMyFzIXMhcyFIMyFOi0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBF
LiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAgICBfXy8gKSAgIHwgLyJcIEFTQ0lJIFJJ
QkJPTiB8CnwgICAgICAgICAgICAgICAgIHwgU29mdHdhcmUgIERlc2lnbmVyIHwgIF8vIC0gLycg
ICB8IFwgLyBDQU1QQUlHTiAgICAgfAp8ICszMyA2MzguNDExLjI0NSAnLS0tLS0tLS0tLS0tLS0t
LS0tLS06IChfICAgIGAtLSwgfCAgWCAgQUdBSU5TVCAgICAgIHwKfCB5YW5uLm1vcmluIChhdCkg
b3JhbmdlLmNvbSAgICAgICAgICAgfF89IiAgICAsLS0nIHwgLyBcIEhUTUwgTUFJTCAgICB8Cict
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTpfX19fX18vX19fX186LS0tLS0t
LS0tLS0tLS0tLS0tJwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQpDZSBtZXNzYWdlIGV0IHNlcyBwaWVjZXMgam9pbnRlcyBwZXV2ZW50IGNvbnRl
bmlyIGRlcyBpbmZvcm1hdGlvbnMgY29uZmlkZW50aWVsbGVzIG91IHByaXZpbGVnaWVlcyBldCBu
ZSBkb2l2ZW50IGRvbmMNCnBhcyBldHJlIGRpZmZ1c2VzLCBleHBsb2l0ZXMgb3UgY29waWVzIHNh
bnMgYXV0b3Jpc2F0aW9uLiBTaSB2b3VzIGF2ZXogcmVjdSBjZSBtZXNzYWdlIHBhciBlcnJldXIs
IHZldWlsbGV6IGxlIHNpZ25hbGVyDQphIGwnZXhwZWRpdGV1ciBldCBsZSBkZXRydWlyZSBhaW5z
aSBxdWUgbGVzIHBpZWNlcyBqb2ludGVzLiBMZXMgbWVzc2FnZXMgZWxlY3Ryb25pcXVlcyBldGFu
dCBzdXNjZXB0aWJsZXMgZCdhbHRlcmF0aW9uLA0KT3JhbmdlIGRlY2xpbmUgdG91dGUgcmVzcG9u
c2FiaWxpdGUgc2kgY2UgbWVzc2FnZSBhIGV0ZSBhbHRlcmUsIGRlZm9ybWUgb3UgZmFsc2lmaWUu
IE1lcmNpLg0KDQpUaGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRhY2htZW50cyBtYXkgY29udGFpbiBj
b25maWRlbnRpYWwgb3IgcHJpdmlsZWdlZCBpbmZvcm1hdGlvbiB0aGF0IG1heSBiZSBwcm90ZWN0
ZWQgYnkgbGF3Ow0KdGhleSBzaG91bGQgbm90IGJlIGRpc3RyaWJ1dGVkLCB1c2VkIG9yIGNvcGll
ZCB3aXRob3V0IGF1dGhvcmlzYXRpb24uDQpJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVtYWls
IGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSB0aGlzIG1lc3Nh
Z2UgYW5kIGl0cyBhdHRhY2htZW50cy4NCkFzIGVtYWlscyBtYXkgYmUgYWx0ZXJlZCwgT3Jhbmdl
IGlzIG5vdCBsaWFibGUgZm9yIG1lc3NhZ2VzIHRoYXQgaGF2ZSBiZWVuIG1vZGlmaWVkLCBjaGFu
Z2VkIG9yIGZhbHNpZmllZC4NClRoYW5rIHlvdS4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
