Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973DCC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 14:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 349F4403A7;
	Wed,  8 Feb 2023 14:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 349F4403A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zp7M2J7KxIRS; Wed,  8 Feb 2023 14:49:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08863414FA;
	Wed,  8 Feb 2023 14:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08863414FA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3DAA1BF2C7
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAF4040BF9
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAF4040BF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GHzgtNx_ZAI7 for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 14:49:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5A9E40BEF
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5A9E40BEF
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 14:49:13 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a2so16733564wrd.6
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 06:49:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qy1oQohPuMCbeVnuSxBDyBFexqTYgbqD0Vo5CyPW35A=;
 b=iUdaxtHJi4/eyLTDX7BptdiP/cAQk5zbP2B9/lHMH5/tbt4HqzTvsGrJ8/c4xLDSYu
 VNhwzAk0K5Ud1KL8GWnyT0ymDiZZpvOEfA2xkv96d1IMoer80+WqvlnkWIMbhl5n/cfB
 OVxVK5mwP9JImIvJB5Qvnk/4n953RK3BjtxeM5DP6pkdzzaNUO5uIJiwoOofLZ6hp/3j
 cma/J1RMnalw+4ExhzZeVELXzIyExmIc49ME1dcf7m55Rdc46j6I43b77iiO//m1zCPC
 5uMGZ/VZTJsLK1cMiP/tYy41c0Hx5IPaNTmhq0CwsHCLTCfmviE+tsVSdDTL6rhWqeRD
 jmIg==
X-Gm-Message-State: AO0yUKX9g0i8hy+4wDovonqAhAfWlruEzPG5Sug1hr0k8nccOtZpMMnt
 bjtnahLklj8JxJ8IWotAOJGMP4G8AQ5hQse0
X-Google-Smtp-Source: AK7set+SQSaMMJ9waWPCek0F0R9vVT8AgyJHNwWJrMg6E3y/RBxqD2ZcyZ/sq13l0TbkK1YenU/8Ug==
X-Received: by 2002:a5d:4450:0:b0:2bf:e8f7:b4fb with SMTP id
 x16-20020a5d4450000000b002bfe8f7b4fbmr7860274wrr.70.1675867751917; 
 Wed, 08 Feb 2023 06:49:11 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a5d48cc000000b00241fab5a296sm13671498wrs.40.2023.02.08.06.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 06:49:11 -0800 (PST)
Message-ID: <800ca93a-4af6-7192-5796-65802eb73275@smile.fr>
Date: Wed, 8 Feb 2023 15:49:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB0493C88AA8516546768559B79F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <VI1P190MB0493C88AA8516546768559B79F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qy1oQohPuMCbeVnuSxBDyBFexqTYgbqD0Vo5CyPW35A=;
 b=aEPV7GhT/71VdMrc6vHFSlBEfX44uhtlvmXKiZP7/LM6K1prGyqCE7Xk4ybacEyFGE
 TMJVGygYiJCA1HYFjrFSuHrEap77ronsyjIKs3UU36glJbPoGEngxByu5pQ1ulWYQxP/
 1t6Ryc458kOeIVM97JdX6/J3abD7/oHWdlyqfufs3n5URYNhKrl8u+YqZvCrCw7pmYsY
 Tksb51DeWr9CEpy8j2wvwekCubz/a1ZVhGwevB8qj+56Tbd3+72/+osU+8m26GnMPPtN
 lTVUORYHo1CFTdtYQUWz1YycWDTpGynNAzbx7MzeTVsR4XjPLZ+G4xJct7j4Z5nYur6r
 tEFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=aEPV7GhT
Subject: Re: [Buildroot] [PATCH v2 03/11] package/lld: move to llvm-project
 subfolder
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

TGUgMjUvMTAvMjAyMiDDoCAwODowNywgTGFuZyBEYW5pZWwgdmlhIGJ1aWxkcm9vdCBhIMOpY3Jp
dMKgOgo+IFRvIG1ha2UgdmVyc2lvbiBidW1waW5nIGVhc2llciwgbW92ZSBsbHZtIHRvIGEgbmV3
IGxsdm0tcHJvamVjdCBzdWJmb2xkZXIKPiBhbmQgc3BlY2lmeSBzaXRlIGFuZCB2ZXJzaW9uIGZv
ciB0aGUgcHJvamVjdC4KClJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBz
bWlsZS5mcj4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmll
bCBMYW5nIDxkLmxhbmdAYWJhdGVjLmF0Pgo+IC0tLQo+IENoYW5nZXMgdjEgLT4gdjI6Cj4gLSBO
byBjaGFuZ2VzCj4gLS0tCj4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDIgKy0KPiAgcGFja2FnZS9Db25maWcuaW4uaG9zdCAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMiArLQo+ICBwYWNrYWdlL3sgPT4gbGx2bS1wcm9qZWN0fS9sbGQvQ29uZmlnLmlu
Lmhvc3QgfCAwCj4gIHBhY2thZ2UveyA9PiBsbHZtLXByb2plY3R9L2xsZC9sbGQuaGFzaCAgICAg
ICB8IDAKPiAgcGFja2FnZS97ID0+IGxsdm0tcHJvamVjdH0vbGxkL2xsZC5tayAgICAgICAgIHwg
NSArKy0tLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKPiAgcmVuYW1lIHBhY2thZ2UveyA9PiBsbHZtLXByb2plY3R9L2xsZC9Db25maWcuaW4uaG9z
dCAoMTAwJSkKPiAgcmVuYW1lIHBhY2thZ2UveyA9PiBsbHZtLXByb2plY3R9L2xsZC9sbGQuaGFz
aCAoMTAwJSkKPiAgcmVuYW1lIHBhY2thZ2UveyA9PiBsbHZtLXByb2plY3R9L2xsZC9sbGQubWsg
KDg3JSkKPiAKPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiBpbmRleCA4
NzYzZmRlMTgyLi5kNGJhYjFhYTM2IDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMKPiArKysgYi9E
RVZFTE9QRVJTCj4gQEAgLTE2MDksNyArMTYwOSw3IEBAIEY6CXBhY2thZ2UvY2xhbmcvCj4gIEY6
CXBhY2thZ2UvZWFybHlvb20vCj4gIEY6CXBhY2thZ2UvZ2NvbmYvCj4gIEY6CXBhY2thZ2UvbGli
bnNzLwo+IC1GOglwYWNrYWdlL2xsZC8KPiArRjoJcGFja2FnZS9sbHZtLXByb2plY3QvbGxkLwo+
ICBGOglwYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtLwo+ICBGOglwYWNrYWdlL3B5dGhvbi1jeXRo
b24vCj4gIEY6CXBhY2thZ2UvcHl0aG9uLXB5Y3Vwcy8KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9D
b25maWcuaW4uaG9zdCBiL3BhY2thZ2UvQ29uZmlnLmluLmhvc3QKPiBpbmRleCA4Y2NiZjQwYTg0
Li42MGVjOTdhMzljIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluLmhvc3QKPiArKysg
Yi9wYWNrYWdlL0NvbmZpZy5pbi5ob3N0Cj4gQEAgLTUwLDcgKzUwLDcgQEAgbWVudSAiSG9zdCB1
dGlsaXRpZXMiCj4gIAlzb3VyY2UgInBhY2thZ2UvanNtaW4vQ29uZmlnLmluLmhvc3QiCj4gIAlz
b3VyY2UgInBhY2thZ2Uva21vZC9Db25maWcuaW4uaG9zdCIKPiAgCXNvdXJjZSAicGFja2FnZS9s
aWJwMTEvQ29uZmlnLmluLmhvc3QiCj4gLQlzb3VyY2UgInBhY2thZ2UvbGxkL0NvbmZpZy5pbi5o
b3N0Igo+ICsJc291cmNlICJwYWNrYWdlL2xsdm0tcHJvamVjdC9sbGQvQ29uZmlnLmluLmhvc3Qi
Cj4gIAlzb3VyY2UgInBhY2thZ2UvbHBjMzI1MGxvYWRlci9Db25maWcuaW4uaG9zdCIKPiAgCXNv
dXJjZSAicGFja2FnZS9sdHRuZy1iYWJlbHRyYWNlL0NvbmZpZy5pbi5ob3N0Igo+ICAJc291cmNl
ICJwYWNrYWdlL2x6bWEtYWxvbmUvQ29uZmlnLmluLmhvc3QiCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGxkL0NvbmZpZy5pbi5ob3N0IGIvcGFja2FnZS9sbHZtLXByb2plY3QvbGxkL0NvbmZpZy5p
bi5ob3N0Cj4gc2ltaWxhcml0eSBpbmRleCAxMDAlCj4gcmVuYW1lIGZyb20gcGFja2FnZS9sbGQv
Q29uZmlnLmluLmhvc3QKPiByZW5hbWUgdG8gcGFja2FnZS9sbHZtLXByb2plY3QvbGxkL0NvbmZp
Zy5pbi5ob3N0Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGxkL2xsZC5oYXNoIGIvcGFja2FnZS9s
bHZtLXByb2plY3QvbGxkL2xsZC5oYXNoCj4gc2ltaWxhcml0eSBpbmRleCAxMDAlCj4gcmVuYW1l
IGZyb20gcGFja2FnZS9sbGQvbGxkLmhhc2gKPiByZW5hbWUgdG8gcGFja2FnZS9sbHZtLXByb2pl
Y3QvbGxkL2xsZC5oYXNoCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGxkL2xsZC5tayBiL3BhY2th
Z2UvbGx2bS1wcm9qZWN0L2xsZC9sbGQubWsKPiBzaW1pbGFyaXR5IGluZGV4IDg3JQo+IHJlbmFt
ZSBmcm9tIHBhY2thZ2UvbGxkL2xsZC5tawo+IHJlbmFtZSB0byBwYWNrYWdlL2xsdm0tcHJvamVj
dC9sbGQvbGxkLm1rCj4gaW5kZXggNGJmOTAzY2RhMC4uNDZlYzNiMTNmZiAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2xsZC9sbGQubWsKPiArKysgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbGQvbGxk
Lm1rCj4gQEAgLTQsOSArNCw4IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAg
Cj4gLSMgTExWTSwgQ2xhbmcgYW5kIGxsZCBzaG91bGQgYmUgdmVyc2lvbiBidW1wZWQgdG9nZXRo
ZXIKPiAtTExEX1ZFUlNJT04gPSAxMS4xLjAKPiAtTExEX1NJVEUgPSBodHRwczovL2dpdGh1Yi5j
b20vbGx2bS9sbHZtLXByb2plY3QvcmVsZWFzZXMvZG93bmxvYWQvbGx2bW9yZy0kKExMRF9WRVJT
SU9OKQo+ICtMTERfVkVSU0lPTiA9ICQoTExWTV9QUk9KRUNUX1ZFUlNJT04pCj4gK0xMRF9TSVRF
ID0gJChMTFZNX1BST0pFQ1RfU0lURSkKPiAgTExEX1NPVVJDRSA9IGxsZC0kKExMRF9WRVJTSU9O
KS5zcmMudGFyLnh6Cj4gIExMRF9MSUNFTlNFID0gQXBhY2hlLTIuMCB3aXRoIGV4Y2VwdGlvbnMK
PiAgTExEX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLlRYVAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
