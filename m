Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F3AC636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 14:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F06A61114;
	Wed,  8 Feb 2023 14:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F06A61114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vj8k-OvrQXMK; Wed,  8 Feb 2023 14:48:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A2D36110E;
	Wed,  8 Feb 2023 14:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A2D36110E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 657C51BF2C7
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C4044031C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C4044031C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AZIfCGybkHYH for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 14:48:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5F544032E
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5F544032E
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 14:48:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h16so16982710wrz.12
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 06:48:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vhk4h2opQh/BjLAcZHot4Kfy81K9XLi+y9Vy6BYRkfQ=;
 b=fZo/N+se4WnzyIkEjCAaqPyeV7oMarqGG83MhKLDkvxulCU83TT/VRjKwqThILbnOB
 3XjJNUe+4HWLADspQl+zgBl1rKYa5y8ICSFC+/zwsthUuKGCynSI6ZYZkI3a84bEnP2r
 2mZ4qZ/PRRPs6dIIMP7NqV/+wzOnIraMlrU8HcMn4cyRZ7WPDxto1+qqGd4hSxzzvsLG
 EA4FPtpYF804xKvqCDSvamKvKDbnxkv2hlyMOnCbwctM2MnT9Or4fdlYF2eVFJIZTlAJ
 aqx7Zm2WTRiJeEslA1VKXkQc8hoaAWDX2lSuBigSl0J77v6VNKMbBh/oUdpUiVRgJoP3
 W+Jw==
X-Gm-Message-State: AO0yUKXv7m0jqESqqtUXPPfBqOetgDqEN9wIxxkm4ba5bWEr+3pJMaDP
 lhBTtMhhdRzHN0m4Iq4m761Cvw==
X-Google-Smtp-Source: AK7set8FywxIHDTOf9hN8Cpjo3qtoLOmLUeiE8uEHXygxy1GHSMyhGSod1Coc1M2xYWYlVxsCLdtKw==
X-Received: by 2002:adf:fc83:0:b0:2c3:daf9:2993 with SMTP id
 g3-20020adffc83000000b002c3daf92993mr7321273wrr.50.1675867699098; 
 Wed, 08 Feb 2023 06:48:19 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 v7-20020adfebc7000000b002bc7e5a1171sm14012741wrn.116.2023.02.08.06.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 06:48:18 -0800 (PST)
Message-ID: <63707e9a-16fd-b81d-c582-fe1b5f67d92e@smile.fr>
Date: Wed, 8 Feb 2023 15:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB0493B8352071CFBCAC9B508D9F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <VI1P190MB0493B8352071CFBCAC9B508D9F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vhk4h2opQh/BjLAcZHot4Kfy81K9XLi+y9Vy6BYRkfQ=;
 b=pMJvEWnrNOxGRnEOVZKWlozF0g7m8lMWRidm29NYtGFRmgg2jfBcMOKYfLC+VrP7wF
 TUzeQbpvL4jNHQbH2iLnepS75yTE3v07v3fiolKnOZpi/jfzP2ils2al1vo8q9MGesZm
 4qpsxuoqQFIkMLjap3U19267MQ9ckGi1hZFlnC+8v8tCEByaRJIJM86jw9pi4UVtFKc/
 2+o5AJZY2P1OaZpn0Xf+B0AgnRfQp4E2NO+cdiIBr4TuVEEKerhLVHsIu8c7jW8bsF2r
 7fW1kvPs5W1YLywya7NX9Z479T7E05NWG8dtbhyPVZ65kZG4qOwWwslzC2Q+AiEmE1OD
 4waA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=pMJvEWnr
Subject: Re: [Buildroot] [PATCH v2 02/11] package/llvm: move to llvm-project
 folder
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAyNS8xMC8yMDIyIMOgIDA4OjA0LCBMYW5nIERhbmllbCB2aWEgYnVpbGRyb290
IGEgw6ljcml0wqA6Cj4gVG8gbWFrZSB1cGRhdGluZyBlYXNpZXIsIG1vdmUgbGx2bSBpbnRvIHRo
ZSBsbHZtLXByb2plY3QgZm9sZGVyCj4gYW5kIHVzZSB0aGUgZGVmaW5lZCBpbmZvcm1hdGlvbi4K
PiAKClJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KCgo+
IFNpZ25lZC1vZmYtYnk6IERhbmllbCBMYW5nIDxkLmxhbmdAYWJhdGVjLmF0Pgo+IC0tLQo+IENo
YW5nZXMgdjEgLT4gdjI6Cj4gLSBObyBjaGFuZ2VzCj4gLS0tCj4gIERFVkVMT1BFUlMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNiArKystLS0KPiAg
cGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyICstCj4gIC4uLi9sbHZtLzAwMDEtbmZjLUZpeC1taXNzaW5nLWluY2x1ZGUucGF0Y2gg
ICAgICAgICAgICAgICAgIHwgMAo+ICBwYWNrYWdlL3sgPT4gbGx2bS1wcm9qZWN0fS9sbHZtL0Nv
bmZpZy5pbiAgICAgICAgICAgICAgICAgICB8IDAKPiAgcGFja2FnZS97ID0+IGxsdm0tcHJvamVj
dH0vbGx2bS9sbHZtLmhhc2ggICAgICAgICAgICAgICAgICAgfCAwCj4gIHBhY2thZ2UveyA9PiBs
bHZtLXByb2plY3R9L2xsdm0vbGx2bS5tayAgICAgICAgICAgICAgICAgICAgIHwgNSArKy0tLQo+
ICA2IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAgcmVu
YW1lIHBhY2thZ2UveyA9PiBsbHZtLXByb2plY3R9L2xsdm0vMDAwMS1uZmMtRml4LW1pc3Npbmct
aW5jbHVkZS5wYXRjaCAoMTAwJSkKPiAgcmVuYW1lIHBhY2thZ2UveyA9PiBsbHZtLXByb2plY3R9
L2xsdm0vQ29uZmlnLmluICgxMDAlKQo+ICByZW5hbWUgcGFja2FnZS97ID0+IGxsdm0tcHJvamVj
dH0vbGx2bS9sbHZtLmhhc2ggKDEwMCUpCj4gIHJlbmFtZSBwYWNrYWdlL3sgPT4gbGx2bS1wcm9q
ZWN0fS9sbHZtL2xsdm0ubWsgKDk4JSkKPiAKPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RF
VkVMT1BFUlMKPiBpbmRleCBjODE4M2IyMjkwLi44NzYzZmRlMTgyIDEwMDY0NAo+IC0tLSBhL0RF
VkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAgLTE2MTAsNyArMTYxMCw3IEBAIEY6CXBh
Y2thZ2UvZWFybHlvb20vCj4gIEY6CXBhY2thZ2UvZ2NvbmYvCj4gIEY6CXBhY2thZ2UvbGlibnNz
Lwo+ICBGOglwYWNrYWdlL2xsZC8KPiAtRjoJcGFja2FnZS9sbHZtLwo+ICtGOglwYWNrYWdlL2xs
dm0tcHJvamVjdC9sbHZtLwo+ICBGOglwYWNrYWdlL3B5dGhvbi1jeXRob24vCj4gIEY6CXBhY2th
Z2UvcHl0aG9uLXB5Y3Vwcy8KPiAgRjoJcGFja2FnZS9weXRob24tcmF2ZW4vCj4gQEAgLTI1NDQs
NyArMjU0NCw3IEBAIEY6CXBhY2thZ2UvbGliZ3RhLwo+ICBGOglwYWNrYWdlL2xpYmllYzYxODUw
Lwo+ICBGOglwYWNrYWdlL2xpYnNwYXRpYWxpbmRleC8KPiAgRjoJcGFja2FnZS9saW51eC1zeXNj
YWxsLXN1cHBvcnQvCj4gLUY6CXBhY2thZ2UvbGx2bS8KPiArRjoJcGFja2FnZS9sbHZtLXByb2pl
Y3QvbGx2bS8KPiAgRjoJcGFja2FnZS9sdWdhcnUvCj4gIEY6CXBhY2thZ2UvbWNlbG9nLwo+ICBG
OglwYWNrYWdlL21lc2EzZC8KPiBAQCAtMjk1Niw3ICsyOTU2LDcgQEAgTjoJVmFsZW50aW4gS29y
ZW5ibGl0IDx2YWxlbnRpbmtvcmVuYmxpdEBnbWFpbC5jb20+Cj4gIEY6CXBhY2thZ2UvY2xhbmcv
Cj4gIEY6CXBhY2thZ2UvY2xpbmZvLwo+ICBGOglwYWNrYWdlL2xpYmNsYy8KPiAtRjoJcGFja2Fn
ZS9sbHZtLwo+ICtGOglwYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtLwo+ICAKPiAgTjoJVmFueWEg
U2VyZ2VldiA8dnNlcmdlZXZAZ21haWwuY29tPgo+ICBGOglwYWNrYWdlL2x1YS1wZXJpcGhlcnkv
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KPiBp
bmRleCBlM2EzNGQ2ZTk3Li4zYjdkNGE5NDQ4IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmln
LmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBAQCAtMjA2OSw3ICsyMDY5LDcgQEAgY29t
bWVudCAibGludXgtcGFtIHBsdWdpbnMiCj4gIAlzb3VyY2UgInBhY2thZ2UvbGlicGFtLXRhY3Bs
dXMvQ29uZmlnLmluIgo+ICBlbmRpZgo+ICAJc291cmNlICJwYWNrYWdlL2xpcXVpZC1kc3AvQ29u
ZmlnLmluIgo+IC0Jc291cmNlICJwYWNrYWdlL2xsdm0vQ29uZmlnLmluIgo+ICsJc291cmNlICJw
YWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9s
dHRuZy1saWJ1c3QvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL21hdGlvL0NvbmZpZy5p
biIKPiAgCXNvdXJjZSAicGFja2FnZS9tcGMvQ29uZmlnLmluIgo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2xsdm0vMDAwMS1uZmMtRml4LW1pc3NpbmctaW5jbHVkZS5wYXRjaCBiL3BhY2thZ2UvbGx2
bS1wcm9qZWN0L2xsdm0vMDAwMS1uZmMtRml4LW1pc3NpbmctaW5jbHVkZS5wYXRjaAo+IHNpbWls
YXJpdHkgaW5kZXggMTAwJQo+IHJlbmFtZSBmcm9tIHBhY2thZ2UvbGx2bS8wMDAxLW5mYy1GaXgt
bWlzc2luZy1pbmNsdWRlLnBhdGNoCj4gcmVuYW1lIHRvIHBhY2thZ2UvbGx2bS1wcm9qZWN0L2xs
dm0vMDAwMS1uZmMtRml4LW1pc3NpbmctaW5jbHVkZS5wYXRjaAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2xsdm0vQ29uZmlnLmluIGIvcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9Db25maWcuaW4K
PiBzaW1pbGFyaXR5IGluZGV4IDEwMCUKPiByZW5hbWUgZnJvbSBwYWNrYWdlL2xsdm0vQ29uZmln
LmluCj4gcmVuYW1lIHRvIHBhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0vQ29uZmlnLmluCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbGx2bS9sbHZtLmhhc2ggYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9s
bHZtL2xsdm0uaGFzaAo+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQo+IHJlbmFtZSBmcm9tIHBhY2th
Z2UvbGx2bS9sbHZtLmhhc2gKPiByZW5hbWUgdG8gcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9s
bHZtLmhhc2gKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9sbHZtL2xsdm0ubWsgYi9wYWNrYWdlL2xs
dm0tcHJvamVjdC9sbHZtL2xsdm0ubWsKPiBzaW1pbGFyaXR5IGluZGV4IDk4JQo+IHJlbmFtZSBm
cm9tIHBhY2thZ2UvbGx2bS9sbHZtLm1rCj4gcmVuYW1lIHRvIHBhY2thZ2UvbGx2bS1wcm9qZWN0
L2xsdm0vbGx2bS5tawo+IGluZGV4IDk3N2MwYTA4YzIuLjFhZGFkMTdiMTYgMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS9sbHZtL2xsdm0ubWsKPiArKysgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZt
L2xsdm0ubWsKPiBAQCAtNCw5ICs0LDggQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iwo+ICAKPiAtIyBMTFZNLCBDbGFuZyBhbmQgbGxkIHNob3VsZCBiZSB2ZXJzaW9uIGJ1bXBlZCB0
b2dldGhlcgo+IC1MTFZNX1ZFUlNJT04gPSAxMS4xLjAKPiAtTExWTV9TSVRFID0gaHR0cHM6Ly9n
aXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L3JlbGVhc2VzL2Rvd25sb2FkL2xsdm1vcmctJChM
TFZNX1ZFUlNJT04pCj4gK0xMVk1fVkVSU0lPTiA9ICQoTExWTV9QUk9KRUNUX1ZFUlNJT04pCj4g
K0xMVk1fU0lURSA9ICQoTExWTV9QUk9KRUNUX1NJVEUpCj4gIExMVk1fU09VUkNFID0gbGx2bS0k
KExMVk1fVkVSU0lPTikuc3JjLnRhci54ego+ICBMTFZNX0xJQ0VOU0UgPSBBcGFjaGUtMi4wIHdp
dGggZXhjZXB0aW9ucwo+ICBMTFZNX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLlRYVAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
