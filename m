Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5874E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 10:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BBCD80DF7;
	Thu,  2 Jan 2025 10:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EF1WJtuwEQVv; Thu,  2 Jan 2025 10:20:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FD3480DF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FD3480DF9;
	Thu,  2 Jan 2025 10:20:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7186AF27
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3920180DF2
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMvvoQpu8sqX for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 10:20:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C938980DE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C938980DE7
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C938980DE7
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 10:20:43 +0000 (UTC)
X-CSE-ConnectionGUID: v8wAZtjnTBSfQ/vJlpWUBQ==
X-CSE-MsgGUID: PBMT6tRiQSWQnn+RLgdLiQ==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 11:20:40 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jan 2025 11:20:40 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Thu, 2 Jan 2025 11:20:39 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 02 Jan 2025 11:20:38 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: 9opyjHvCSf6/4wBHcHvwdw==
X-CSE-MsgGUID: rHGQE+hHT0i+S51cvOuT6Q==
X-IronPort-AV: E=Sophos;i="6.12,285,1728943200"; d="scan'208";a="234765572"
Date: Thu, 2 Jan 2025 11:20:38 +0100
To: Julien Olivain <ju.o@free.fr>
CC: <buildroot@buildroot.org>
Message-ID: <Z3ZodlNb+JEvB9ub@yd-6wlzhs3>
References: <20241227130231.862029-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241227130231.862029-1-ju.o@free.fr>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX203.corporate.adroot.infra.ftgroup (10.115.26.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1735813244; x=1767349244;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=IIP+ZcHT+oi4Tw0R1N+sbAVY+oWoAhkLCivoRmR9Tb4=;
 b=LAvXg5vhzpVk+1w/7SdglW9cUP//hMfEMRQtxFfkdNlrGY76U54lmBUz
 yfo6HrQ3FMpHPQFEYT3jTIoBGpRyYaHP25A+NrXVJtZrGHQPzWcmeSEVM
 L23niclcYVDJHHMXaEt+PmOWTPtmdxzQtv+DJemADK2+2ceRrXd+nnYas
 3Aewe32XwaCCe8356I7Gl3POxi8e33XoEODdbbTTtnR8mQLj/Ggc3wlO3
 O4oRekN7EK12cX1rwxulFNv081HO4yJ0eNJKvCYZEv8r08wEytNou9LpR
 PlYHAIjLpyVZByPdNEY8Vu8M0XSN/SNqrZH6c5cBT5HpP+svDJke4DsJF
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=LAvXg5vh
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new usbip runtime test
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

SnVsaWVuLCBBbGwsCgpPbiAyMDI0LTEyLTI3IDE0OjAyICswMTAwLCBKdWxpZW4gT2xpdmFpbiBz
cGFrZSB0aHVzbHk6Cj4gQ29tbWl0IFsxXSBpbnRyb2R1Y2VkIHRoZSB1c2JpcCBwYWNrYWdlLiBU
aGlzIGNvbW1pdCBhZGRzIGEgbmV3IHJ1bnRpbWUKPiB0ZXN0IHRvIGNoZWNrIHRoaXMgZnVuY3Rp
b25hbGl0eS4KPiAKPiBbMV0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRy
b290Ly0vY29tbWl0L2YwNWYyYzFhZDcxN2I3Y2RhMDY1ZWUwNmZjMWRhYTgwY2QwOWQ4NTkKPiAK
PiBDYzogWWFubiBFLiBNT1JJTiA8eWFubi5tb3JpbkBvcmFuZ2UuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+ClstLVNOSVAtLV0KPiBkaWZmIC0tZ2l0
IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF91c2JpcC9saW51eC11c2JpcC5m
cmFnbWVudCBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfdXNiaXAvbGludXgt
dXNiaXAuZnJhZ21lbnQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAu
LjU5MmY0NjExNDUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2UvdGVzdF91c2JpcC9saW51eC11c2JpcC5mcmFnbWVudAo+IEBAIC0wLDAgKzEsNSBA
QAo+ICtDT05GSUdfVVNCPXkKPiArQ09ORklHX1VTQl9FSENJX0hDRD15Cj4gK0NPTkZJR19VU0JJ
UF9DT1JFPXkKCkkgd2FzIHdvbmRlcmluZyB3aHkgeW91IG5lZWRlZCB0byByZXBlYXQgVVNCSVBf
Q09SRSBoZXJlLCBhbHRob3VnaCBpdAppcyBwYXJ0IG9mIHRoZSBmaXh1cHMgaW4gVVNCSVBfTElO
VVhfQ09ORklHX0ZJWFVQUy4uLgoKVHVybnMgb3V0IHRoYXQgdGhlIGZyYWdtZW50cyBhcmUgYXBw
bGllZCBiZWZvcmUgdGhlIHBhY2thZ2VzIGZpeHVwcywKc28geWVhaCwgd2UgbmVlZCBVU0JJUF9D
T1JFIChhbmQgVVNCIHRvbyBldmVuIHdpdGggbXkgcGF0Y2ggYXBwbGllZCkuCgpSZXZpZXdlZC1i
eTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3JpbkBvcmFuZ2UuY29tPgpUZXN0ZWQtYnk6IFlhbm4g
RS4gTU9SSU4gPHlhbm4ubW9yaW5Ab3JhbmdlLmNvbT4KClRoYW5rIHlvdSBmb3IgdGhpcyBydW50
aW1lIHRlc3QhIPCfkY0KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ICtDT05GSUdfVVNCSVBf
SE9TVD15Cj4gK0NPTkZJR19VU0JJUF9WSENJX0hDRD15Cj4gLS0gCj4gMi40Ny4xCj4gCgotLSAK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fX19fX19fX19fXwouLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS06ICAgICAgIF8gICAgOi0tLS0tLS0t
LS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAgICBf
Xy8gKSAgIHwgLyJcIEFTQ0lJIFJJQkJPTiB8CnwgICAgICAgICAgICAgICAgIHwgU29mdHdhcmUg
IERlc2lnbmVyIHwgIF8vIC0gLycgICB8IFwgLyBDQU1QQUlHTiAgICAgfAp8ICszMyA2MzguNDEx
LjI0NSAnLS0tLS0tLS0tLS0tLS0tLS0tLS06IChfICAgIGAtLSwgfCAgWCAgQUdBSU5TVCAgICAg
IHwKfCB5YW5uLm1vcmluIChhdCkgb3JhbmdlLmNvbSAgICAgICAgICAgfF89IiAgICAsLS0nIHwg
LyBcIEhUTUwgTUFJTCAgICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LTpfX19fX18vX19fX186LS0tLS0tLS0tLS0tLS0tLS0tJwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpDZSBtZXNzYWdlIGV0IHNlcyBwaWVjZXMg
am9pbnRlcyBwZXV2ZW50IGNvbnRlbmlyIGRlcyBpbmZvcm1hdGlvbnMgY29uZmlkZW50aWVsbGVz
IG91IHByaXZpbGVnaWVlcyBldCBuZSBkb2l2ZW50IGRvbmMNCnBhcyBldHJlIGRpZmZ1c2VzLCBl
eHBsb2l0ZXMgb3UgY29waWVzIHNhbnMgYXV0b3Jpc2F0aW9uLiBTaSB2b3VzIGF2ZXogcmVjdSBj
ZSBtZXNzYWdlIHBhciBlcnJldXIsIHZldWlsbGV6IGxlIHNpZ25hbGVyDQphIGwnZXhwZWRpdGV1
ciBldCBsZSBkZXRydWlyZSBhaW5zaSBxdWUgbGVzIHBpZWNlcyBqb2ludGVzLiBMZXMgbWVzc2Fn
ZXMgZWxlY3Ryb25pcXVlcyBldGFudCBzdXNjZXB0aWJsZXMgZCdhbHRlcmF0aW9uLA0KT3Jhbmdl
IGRlY2xpbmUgdG91dGUgcmVzcG9uc2FiaWxpdGUgc2kgY2UgbWVzc2FnZSBhIGV0ZSBhbHRlcmUs
IGRlZm9ybWUgb3UgZmFsc2lmaWUuIE1lcmNpLg0KDQpUaGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRh
Y2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgb3IgcHJpdmlsZWdlZCBpbmZvcm1hdGlv
biB0aGF0IG1heSBiZSBwcm90ZWN0ZWQgYnkgbGF3Ow0KdGhleSBzaG91bGQgbm90IGJlIGRpc3Ry
aWJ1dGVkLCB1c2VkIG9yIGNvcGllZCB3aXRob3V0IGF1dGhvcmlzYXRpb24uDQpJZiB5b3UgaGF2
ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIg
YW5kIGRlbGV0ZSB0aGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRhY2htZW50cy4NCkFzIGVtYWlscyBt
YXkgYmUgYWx0ZXJlZCwgT3JhbmdlIGlzIG5vdCBsaWFibGUgZm9yIG1lc3NhZ2VzIHRoYXQgaGF2
ZSBiZWVuIG1vZGlmaWVkLCBjaGFuZ2VkIG9yIGZhbHNpZmllZC4NClRoYW5rIHlvdS4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
