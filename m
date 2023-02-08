Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69469C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 14:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0634C40BFC;
	Wed,  8 Feb 2023 14:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0634C40BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ayGCmANsaEuu; Wed,  8 Feb 2023 14:52:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DFD040BF1;
	Wed,  8 Feb 2023 14:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DFD040BF1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 610E21BF2C7
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B0026110F
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B0026110F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3aHwsu9py4mR for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 14:52:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCD196110E
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCD196110E
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 14:52:35 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so1653821wmb.2
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 06:52:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XE2tcg5bHBhDCo+vDfpffFh0fKAQhjotaWoG/oYKk9I=;
 b=WilayICfgf229SoXPppfXKcaEOfJWtdlymxTmQLgkOMr7YSfllzHAwpIKZb7P6yghf
 rqe+ZvA8mwAkiah3vCz/JSXpBttibXWtjNWHuLcTAHG8kjMeBYotJS/MSRyx9sX5f6Cd
 eLtRrBpyMHdRnqDHNVsGhfhSChFWZ8TI7peZV0U24snBPgoiAhhXmBxFUitnnxrbNX3e
 sbka+VaFs9f4xoQZA6wsYxcBYrqEyjbkG4ysTHgtv1QPkIDVKT1aNWxQMrGDGC9cQBPr
 3X0uYLtZAog1Ew84x+J+1fg8s1Q4Z0v+p6zdKUgKAOOgCoEcIUIkn4dKNTg+MoNoztcp
 eMyw==
X-Gm-Message-State: AO0yUKUkOkvAFZHrOvlvxdlAaXJiXMSS2SSYqYdF6hNy34jt1p1KJTQk
 FQq9nFy2ExyslyW+N0gtnKbTeQ==
X-Google-Smtp-Source: AK7set+rqPi+bu5SOGm3ImriAw2OZjh163i/seG8ZTPwse07IIetcnSrFmBswQMHrDDsN+cFmmEq7A==
X-Received: by 2002:a05:600c:490a:b0:3dc:433a:e952 with SMTP id
 f10-20020a05600c490a00b003dc433ae952mr6592701wmp.33.1675867954008; 
 Wed, 08 Feb 2023 06:52:34 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a05600c4fc700b003db0ad636d1sm2473538wmq.28.2023.02.08.06.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 06:52:33 -0800 (PST)
Message-ID: <7ecbf4e7-c57d-8486-7336-63f089720b6a@smile.fr>
Date: Wed, 8 Feb 2023 15:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB04933E751949AC273E5E7F929F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <VI1P190MB04933E751949AC273E5E7F929F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XE2tcg5bHBhDCo+vDfpffFh0fKAQhjotaWoG/oYKk9I=;
 b=nmK/hiIUzZrStK5QJekZy1e4U2JjEPgOJGbtgPGKWuROezyMa739xMG8DbvMtdagjB
 z3f42BjvY4oGODJXjYmaHQ+Nuqb84EiBPTRjVrwVIA2jzcOXAtnv/vdOSMD2UYj+xZi8
 CT7jOO9x6kq688XSKDl39bw103ip4QD8HtfwSFU16KhjMhep9TdPS/pE4eOWgLMbUZP2
 dlJr7axzFNsKV22L0I4pno/ozQIn4P4lLzr+H6luSHyVSSaH42UrRqsqVncQNHjH3AWh
 joCpGcgn82eG44w1rddLbEW/BXDLRRyeLt+PcF1dXTkQAsNzNXeNU3NEmlZl0WMvdGGd
 Ozhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=nmK/hiIU
Subject: Re: [Buildroot] [PATCH v2 04/11] package/clang: move to
 llvm-project subfolder
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

SGVsbG8sCgpMZSAyNS8xMC8yMDIyIMOgIDA4OjA3LCBMYW5nIERhbmllbCB2aWEgYnVpbGRyb290
IGEgw6ljcml0wqA6Cj4gVG8gbWFrZSB2ZXJzaW9uIGJ1bXBpbmcgZWFzaWVyLCBtb3ZlIGxsdm0g
dG8gYSBuZXcgbGx2bS1wcm9qZWN0IHN1YmZvbGRlcgo+IGFuZCBzcGVjaWZ5IHNpdGUgYW5kIHZl
cnNpb24gZm9yIHRoZSBwcm9qZWN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBMYW5nIDxk
LmxhbmdAYWJhdGVjLmF0Pgo+IC0tLQo+IENoYW5nZXMgdjEgLT4gdjI6Cj4gLSBObyBjaGFuZ2Vz
Cj4gLS0tCj4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCA2ICsrKy0tLQo+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICAuLi4tRHJpdmVyLVRvb2xDaGFp
bnMtR251LVVzZS1HQ0NfSU5TVEFMTF9QUkVGSVgtaW4tLnBhdGNoIHwgMAo+ICBwYWNrYWdlL3sg
PT4gbGx2bS1wcm9qZWN0fS9jbGFuZy9Db25maWcuaW4gICAgICAgICAgICAgICAgIHwgMAo+ICBw
YWNrYWdlL3sgPT4gbGx2bS1wcm9qZWN0fS9jbGFuZy9jbGFuZy5oYXNoICAgICAgICAgICAgICAg
IHwgMAo+ICBwYWNrYWdlL3sgPT4gbGx2bS1wcm9qZWN0fS9jbGFuZy9jbGFuZy5tayAgICAgICAg
ICAgICAgICAgIHwgNyArKystLS0tCj4gIHBhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0tcHJvamVj
dC5tayAgICAgICAgICAgICAgICAgICAgICAgfCAzICsrLQo+ICA3IGZpbGVzIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAgcmVuYW1lIHBhY2thZ2UveyA9PiBsbHZt
LXByb2plY3R9L2NsYW5nLzAwMDEtbGliLURyaXZlci1Ub29sQ2hhaW5zLUdudS1Vc2UtR0NDX0lO
U1RBTExfUFJFRklYLWluLS5wYXRjaCAoMTAwJSkKPiAgcmVuYW1lIHBhY2thZ2UveyA9PiBsbHZt
LXByb2plY3R9L2NsYW5nL0NvbmZpZy5pbiAoMTAwJSkKPiAgcmVuYW1lIHBhY2thZ2UveyA9PiBs
bHZtLXByb2plY3R9L2NsYW5nL2NsYW5nLmhhc2ggKDEwMCUpCj4gIHJlbmFtZSBwYWNrYWdlL3sg
PT4gbGx2bS1wcm9qZWN0fS9jbGFuZy9jbGFuZy5tayAoOTYlKQo+IAo+IGRpZmYgLS1naXQgYS9E
RVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IGQ0YmFiMWFhMzYuLmQ1MTZmNTg1ZDggMTAw
NjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtMTYwNSwxMCAr
MTYwNSwxMCBAQCBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9h
ZXhwZWN0LnB5Cj4gIE46CUpvc2VwaCBLb2d1dCA8am9zZXBoLmtvZ3V0QGdtYWlsLmNvbT4KPiAg
RjoJcGFja2FnZS9hdC1zcGkyLWF0ay8KPiAgRjoJcGFja2FnZS9hdC1zcGkyLWNvcmUvCj4gLUY6
CXBhY2thZ2UvY2xhbmcvCj4gIEY6CXBhY2thZ2UvZWFybHlvb20vCj4gIEY6CXBhY2thZ2UvZ2Nv
bmYvCj4gIEY6CXBhY2thZ2UvbGlibnNzLwo+ICtGOglwYWNrYWdlL2xsdm0tcHJvamVjdC9jbGFu
Zy8KPiAgRjoJcGFja2FnZS9sbHZtLXByb2plY3QvbGxkLwo+ICBGOglwYWNrYWdlL2xsdm0tcHJv
amVjdC9sbHZtLwo+ICBGOglwYWNrYWdlL3B5dGhvbi1jeXRob24vCj4gQEAgLTI1MjUsNyArMjUy
NSw2IEBAIEY6CXBhY2thZ2UvYWx1cmUvCj4gIEY6CXBhY2thZ2UvYXViaW8vCj4gIEY6CXBhY2th
Z2UvYmludXRpbHMvCj4gIEY6CXBhY2thZ2UvYnVsbGV0Lwo+IC1GOglwYWNrYWdlL2NsYW5nLwo+
ICBGOglwYWNrYWdlL2NsaW5mby8KPiAgRjoJcGFja2FnZS9lZmwvCj4gIEY6CXBhY2thZ2UvZW5l
dC8KPiBAQCAtMjU0NCw2ICsyNTQzLDcgQEAgRjoJcGFja2FnZS9saWJndGEvCj4gIEY6CXBhY2th
Z2UvbGliaWVjNjE4NTAvCj4gIEY6CXBhY2thZ2UvbGlic3BhdGlhbGluZGV4Lwo+ICBGOglwYWNr
YWdlL2xpbnV4LXN5c2NhbGwtc3VwcG9ydC8KPiArRjoJcGFja2FnZS9sbHZtLXByb2plY3QvY2xh
bmcvCj4gIEY6CXBhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0vCj4gIEY6CXBhY2thZ2UvbHVnYXJ1
Lwo+ICBGOglwYWNrYWdlL21jZWxvZy8KPiBAQCAtMjk1Myw5ICsyOTUzLDkgQEAgRjoJcGFja2Fn
ZS9nZXR0ZXh0LXRpbnkvCj4gIEY6CXBhY2thZ2UvdGlueXNzaC8KPiAgCj4gIE46CVZhbGVudGlu
IEtvcmVuYmxpdCA8dmFsZW50aW5rb3JlbmJsaXRAZ21haWwuY29tPgo+IC1GOglwYWNrYWdlL2Ns
YW5nLwo+ICBGOglwYWNrYWdlL2NsaW5mby8KPiAgRjoJcGFja2FnZS9saWJjbGMvCj4gK0Y6CXBh
Y2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5nLwo+ICBGOglwYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZt
Lwo+ICAKPiAgTjoJVmFueWEgU2VyZ2VldiA8dnNlcmdlZXZAZ21haWwuY29tPgo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4gaW5kZXggM2I3ZDRh
OTQ0OC4uMTVkZDI3Nzk2ZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBi
L3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTE5NzAsNyArMTk3MCw3IEBAIG1lbnUgIk90aGVyIgo+
ICAJc291cmNlICJwYWNrYWdlL2NhcG5wcm90by9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2th
Z2UvY2N0ei9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvY2VyZWFsL0NvbmZpZy5pbiIK
PiAtCXNvdXJjZSAicGFja2FnZS9jbGFuZy9Db25maWcuaW4iCj4gKwlzb3VyY2UgInBhY2thZ2Uv
bGx2bS1wcm9qZWN0L2NsYW5nL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9jbW9ja2Ev
Q29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL2NvbXBpbGVyLXJ0L0NvbmZpZy5pbiIKPiAg
CXNvdXJjZSAicGFja2FnZS9jcHBjbXMvQ29uZmlnLmluIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2NsYW5nLzAwMDEtbGliLURyaXZlci1Ub29sQ2hhaW5zLUdudS1Vc2UtR0NDX0lOU1RBTExfUFJF
RklYLWluLS5wYXRjaCBiL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5nLzAwMDEtbGliLURyaXZl
ci1Ub29sQ2hhaW5zLUdudS1Vc2UtR0NDX0lOU1RBTExfUFJFRklYLWluLS5wYXRjaAo+IHNpbWls
YXJpdHkgaW5kZXggMTAwJQo+IHJlbmFtZSBmcm9tIHBhY2thZ2UvY2xhbmcvMDAwMS1saWItRHJp
dmVyLVRvb2xDaGFpbnMtR251LVVzZS1HQ0NfSU5TVEFMTF9QUkVGSVgtaW4tLnBhdGNoCj4gcmVu
YW1lIHRvIHBhY2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5nLzAwMDEtbGliLURyaXZlci1Ub29sQ2hh
aW5zLUdudS1Vc2UtR0NDX0lOU1RBTExfUFJFRklYLWluLS5wYXRjaAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2NsYW5nL0NvbmZpZy5pbiBiL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5nL0NvbmZp
Zy5pbgo+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQo+IHJlbmFtZSBmcm9tIHBhY2thZ2UvY2xhbmcv
Q29uZmlnLmluCj4gcmVuYW1lIHRvIHBhY2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5nL0NvbmZpZy5p
bgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2NsYW5nL2NsYW5nLmhhc2ggYi9wYWNrYWdlL2xsdm0t
cHJvamVjdC9jbGFuZy9jbGFuZy5oYXNoCj4gc2ltaWxhcml0eSBpbmRleCAxMDAlCj4gcmVuYW1l
IGZyb20gcGFja2FnZS9jbGFuZy9jbGFuZy5oYXNoCj4gcmVuYW1lIHRvIHBhY2thZ2UvbGx2bS1w
cm9qZWN0L2NsYW5nL2NsYW5nLmhhc2gKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jbGFuZy9jbGFu
Zy5tayBiL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5nL2NsYW5nLm1rCj4gc2ltaWxhcml0eSBp
bmRleCA5NiUKPiByZW5hbWUgZnJvbSBwYWNrYWdlL2NsYW5nL2NsYW5nLm1rCj4gcmVuYW1lIHRv
IHBhY2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5nL2NsYW5nLm1rCj4gaW5kZXggM2M3NWY4ZDZiMS4u
MDk0M2UyMWE4YyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2NsYW5nL2NsYW5nLm1rCj4gKysrIGIv
cGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcvY2xhbmcubWsKPiBAQCAtNCwxMCArNCw5IEBACj4g
ICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLSMgTExWTSwgQ2xhbmcgYW5kIGxs
ZCBzaG91bGQgYmUgdmVyc2lvbiBidW1wZWQgdG9nZXRoZXIKPiAtQ0xBTkdfVkVSU0lPTl9NQUpP
UiA9IDExCj4gLUNMQU5HX1ZFUlNJT04gPSAkKENMQU5HX1ZFUlNJT05fTUFKT1IpLjEuMAo+IC1D
TEFOR19TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L3JlbGVhc2Vz
L2Rvd25sb2FkL2xsdm1vcmctJChDTEFOR19WRVJTSU9OKQo+ICtDTEFOR19WRVJTSU9OX01BSk9S
ID0gJChMTFZNX1BST0pFQ1RfVkVSU0lPTl9NQUpPUikKPiArQ0xBTkdfVkVSU0lPTiA9ICQoTExW
TV9QUk9KRUNUX1ZFUlNJT04pCj4gK0NMQU5HX1NJVEUgPSAkKExMVk1fUFJPSkVDVF9TSVRFKQo+
ICBDTEFOR19TT1VSQ0UgPSBjbGFuZy0kKENMQU5HX1ZFUlNJT04pLnNyYy50YXIueHoKPiAgQ0xB
TkdfTElDRU5TRSA9IEFwYWNoZS0yLjAgd2l0aCBleGNlcHRpb25zCj4gIENMQU5HX0xJQ0VOU0Vf
RklMRVMgPSBMSUNFTlNFLlRYVAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xsdm0tcHJvamVjdC9s
bHZtLXByb2plY3QubWsgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtLXByb2plY3QubWsKPiBp
bmRleCA3YmE4OWJiNjA1Li43NDdhNmY1NjQ3IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGx2bS1w
cm9qZWN0L2xsdm0tcHJvamVjdC5tawo+ICsrKyBiL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0t
cHJvamVjdC5tawo+IEBAIC00LDcgKzQsOCBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCj4gIAo+IC1MTFZNX1BST0pFQ1RfVkVSU0lPTiA9IDExLjEuMAo+ICtMTFZNX1BST0pFQ1Rf
VkVSU0lPTl9NQUpPUiA9IDExCj4gK0xMVk1fUFJPSkVDVF9WRVJTSU9OID0gJChMTFZNX1BST0pF
Q1RfVkVSU0lPTl9NQUpPUikuMS4wCgpJdCBzZWVtcyBub3QgcmVsYXRlZCB0byB0aGUgY2xhbmcg
bW92ZSB0byBsbHZtLXByb2plY3Qgc3ViZm9sZGVyLgoobWF5YmUgYSByZWJhc2UgKyBzcXVhc2gg
aXNzdWUpCgpJdCBzaG91bGQgYmUgZG9uZSBhdCB0aGUgYmVnZW5pbmcgb2YgdGhpcyBzZXJpZXMu
CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gIExMVk1fUFJPSkVDVF9TSVRFID0gaHR0cHM6Ly9n
aXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L3JlbGVhc2VzL2Rvd25sb2FkL2xsdm1vcmctJChM
TFZNX1BST0pFQ1RfVkVSU0lPTikKPiAgCj4gIGluY2x1ZGUgJChzb3J0ICQod2lsZGNhcmQgcGFj
a2FnZS9sbHZtLXByb2plY3QvKi8qLm1rKSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
