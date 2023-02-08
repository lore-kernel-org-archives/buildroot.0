Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F02C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 15:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2007C409EA;
	Wed,  8 Feb 2023 15:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2007C409EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pqTc-oTNMbnD; Wed,  8 Feb 2023 15:22:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2444340933;
	Wed,  8 Feb 2023 15:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2444340933
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59BDE1BF36C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 411D381FEE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 411D381FEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wkdq0tsV-39f for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 15:22:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12DC581FEC
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12DC581FEC
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 15:22:34 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o18so17131933wrj.3
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 07:22:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1jDgq3BDmk81AykRKNt6VdtYES/1uWXHl4Hm/bBg6UM=;
 b=K25Sb7zxQO5Fa7tlQlAurFJfP4mtE1hZ2KEuKo+B/NYopQ61vhXQzjMbjb2eq3auIG
 0E/QmjyGb0vcwX77rnhk27pErn0eS/hBpSCxLmmdx91vveWfqejlzk6l7K5D2HiQLduq
 GIi8GzZoL55Ux5pALOrBX3M01GT6S8zV6mC3yzuEBvM+7A2xH62OOVVg5TRjbx78hgRB
 DgG0lwRZW3IfODTQctLvwlbRp9MoY6apPkqhZAWIZdQFhaIhAbsjofBHGLrNPqpX0HqG
 Y+wTl0bVeFPxxN35gi8b0x9DtS8/3ARBaTkPI353Er6f0Q8fQwZ65rOTDXi2igB7w/jA
 XHZQ==
X-Gm-Message-State: AO0yUKVsyZwv3+aCm2mrxtHkXrvXNQeUv026LNNYXM64bShOT01AbaEi
 o3Ub6n0CxcZepS5IJ9AcZSTfzw==
X-Google-Smtp-Source: AK7set+8QQ5FbXXknE/l2ykPqBnGQL496bxmlyEoLY1AqNlTtPoDaLk5G2+MTl8r1dHjMrt9cH/jPQ==
X-Received: by 2002:a05:6000:1108:b0:2c4:4c4:1284 with SMTP id
 z8-20020a056000110800b002c404c41284mr2198145wrw.11.1675869753274; 
 Wed, 08 Feb 2023 07:22:33 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 be7-20020a05600c1e8700b003dff2b493c8sm2495625wmb.36.2023.02.08.07.22.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 07:22:32 -0800 (PST)
Message-ID: <e7132446-36a0-4709-f02d-253598b8312d@smile.fr>
Date: Wed, 8 Feb 2023 16:22:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB0493F747C05E6E64D3A384719F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <VI1P190MB0493F747C05E6E64D3A384719F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1jDgq3BDmk81AykRKNt6VdtYES/1uWXHl4Hm/bBg6UM=;
 b=s7zURtmc90LTM50c1KV73SvF/jWd+zxKUpdzu51vTkOrli2Zx/ajdtFMWcd4rp6Pnj
 9753PdAS5PDrWuvNV54ViWpbAUKht2xD/CnkjP59wNEe5H8JRYsbdj9qrZm++/jpDW3b
 f27S4amgwabDoITso7vLg19URkSUd6SAqNXdB1fb5wXf7iV3yty85F+B+xU3XaK4J4WI
 ND6RkCt+dhkwK1UY0FHUlwEpCSnYPARk7nHqJxE7fh+RjCALDSH7nZl2IUxPanPMdC0o
 wIqybf7Gt8F+pgHcbLTjAUYYHVAbKknbdMIXK9ZIeJXO8g0zttxx8w7plTh3n9viyieq
 WBaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=s7zURtmc
Subject: Re: [Buildroot] [PATCH v2 10/11] package/libclc: move to
 llvm-project subfolder and bump to 15.0.3
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

SGVsbG8sCgpMZSAyNS8xMC8yMDIyIMOgIDA4OjEzLCBMYW5nIERhbmllbCB2aWEgYnVpbGRyb290
IGEgw6ljcml0wqA6Cj4gVG8gbWFrZSB2ZXJzaW9uIGJ1bXBpbmcgZWFzaWVyLCBtb3ZlIGxsdm0g
dG8gYSBuZXcgbGx2bS1wcm9qZWN0IHN1YmZvbGRlcgo+IGFuZCBzcGVjaWZ5IHNpdGUgYW5kIHZl
cnNpb24gZm9yIHRoZSBwcm9qZWN0LgoKVGhpcyBwYXRjaCBzaG91bGQgZ28gYmVmb3JlIGxsdm0t
Y21ha2UgKGFuZCBiZWZvcmUgbGx2bS1wcm9qZWN0IHZlcnNpb24gYnVtcCkKd2l0aG91dCB0aGUg
dmVyc2lvbiBidW1wLiBJbmNsdWRlIHRoZSBsaWJjbGMgdmVyc2lvbiBidW1wIHdpdGggdGhlIGxs
dm0tcHJvamVjdAp2ZXJzaW9uIGJ1bXAuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgTGFuZyA8ZC5sYW5nQGFiYXRlYy5hdD4KPiAtLS0KPiBDaGFuZ2Vz
IHYxIC0+IHYyOgo+IC0gbGliY2xjOiBBZGQgbWlzc2luZyBjaGFuZ2UgdG8gcGFja2FnZS9Db25m
aWcuaW4KPiAtIEJ1bXAgdG8gMTUuMC4zIGluc3RlYWQgb2YgMTUuMC4xCj4gLS0tCj4gIERFVkVM
T1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCA0ICsrLS0KPiAgcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgLi4uL2xpYmNsYy8wMDAxLXN1cHBvcnQtb3V0LW9m
LXRyZWUtYnVpbGQucGF0Y2ggICAgICAgICAgICAgICB8IDAKPiAgcGFja2FnZS97ID0+IGxsdm0t
cHJvamVjdH0vbGliY2xjL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICB8IDAKPiAgcGFja2Fn
ZS97ID0+IGxsdm0tcHJvamVjdH0vbGliY2xjL2xpYmNsYy5oYXNoICAgICAgICAgICAgICAgICB8
IDIgKy0KPiAgcGFja2FnZS97ID0+IGxsdm0tcHJvamVjdH0vbGliY2xjL2xpYmNsYy5tayAgICAg
ICAgICAgICAgICAgICB8IDQgKystLQo+ICA2IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKPiAgcmVuYW1lIHBhY2thZ2UveyA9PiBsbHZtLXByb2plY3R9L2xp
YmNsYy8wMDAxLXN1cHBvcnQtb3V0LW9mLXRyZWUtYnVpbGQucGF0Y2ggKDEwMCUpCj4gIHJlbmFt
ZSBwYWNrYWdlL3sgPT4gbGx2bS1wcm9qZWN0fS9saWJjbGMvQ29uZmlnLmluICgxMDAlKQo+ICBy
ZW5hbWUgcGFja2FnZS97ID0+IGxsdm0tcHJvamVjdH0vbGliY2xjL2xpYmNsYy5oYXNoICg1MSUp
Cj4gIHJlbmFtZSBwYWNrYWdlL3sgPT4gbGx2bS1wcm9qZWN0fS9saWJjbGMvbGliY2xjLm1rICg5
MiUpCj4gCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXggZTY2
MDY0MDhjMC4uNmRiZjRmZTdhNSAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIvREVW
RUxPUEVSUwo+IEBAIC0yNTM4LDEyICsyNTM4LDEyIEBAIEY6CXBhY2thZ2UvaXJybGljaHQvCj4g
IEY6CXBhY2thZ2UvbGlibGluZWFyLwo+ICBGOglwYWNrYWdlL2xlbnNmdW4vCj4gIEY6CXBhY2th
Z2UvbGliYnBmLwo+IC1GOglwYWNrYWdlL2xpYmNsYy8KPiAgRjoJcGFja2FnZS9saWJndGEvCj4g
IEY6CXBhY2thZ2UvbGliaWVjNjE4NTAvCj4gIEY6CXBhY2thZ2UvbGlic3BhdGlhbGluZGV4Lwo+
ICBGOglwYWNrYWdlL2xpbnV4LXN5c2NhbGwtc3VwcG9ydC8KPiAgRjoJcGFja2FnZS9sbHZtLXBy
b2plY3QvY2xhbmcvCj4gK0Y6CXBhY2thZ2UvbGx2bS1wcm9qZWN0L2xpYmNsYy8KPiAgRjoJcGFj
a2FnZS9sbHZtLXByb2plY3QvbGx2bS8KPiAgRjoJcGFja2FnZS9sdWdhcnUvCj4gIEY6CXBhY2th
Z2UvbWNlbG9nLwo+IEBAIC0yOTU0LDggKzI5NTQsOCBAQCBGOglwYWNrYWdlL3Rpbnlzc2gvCj4g
IAo+ICBOOglWYWxlbnRpbiBLb3JlbmJsaXQgPHZhbGVudGlua29yZW5ibGl0QGdtYWlsLmNvbT4K
PiAgRjoJcGFja2FnZS9jbGluZm8vCj4gLUY6CXBhY2thZ2UvbGliY2xjLwo+ICBGOglwYWNrYWdl
L2xsdm0tcHJvamVjdC9jbGFuZy8KPiArRjoJcGFja2FnZS9sbHZtLXByb2plY3QvbGliY2xjLwo+
ICBGOglwYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtLwo+ICAKPiAgTjoJVmFueWEgU2VyZ2VldiA8
dnNlcmdlZXZAZ21haWwuY29tPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3Bh
Y2thZ2UvQ29uZmlnLmluCj4gaW5kZXggMWQ0OGIxNDQ4Yi4uODgyZTI5NjUzMyAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTIw
MTAsNyArMjAxMCw3IEBAIG1lbnUgIk90aGVyIgo+ICAJc291cmNlICJwYWNrYWdlL2xpYmNhcC9D
b25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvbGliY2FwLW5nL0NvbmZpZy5pbiIKPiAgCXNv
dXJjZSAicGFja2FnZS9saWJjZ3JvdXAvQ29uZmlnLmluIgo+IC0Jc291cmNlICJwYWNrYWdlL2xp
YmNsYy9Db25maWcuaW4iCj4gKwlzb3VyY2UgInBhY2thZ2UvbGx2bS1wcm9qZWN0L2xpYmNsYy9D
b25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvbGliY29maS9Db25maWcuaW4iCj4gIAlzb3Vy
Y2UgInBhY2thZ2UvbGliY29ycmVjdC9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvbGli
Y3Jvc3NndWlkL0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJjbGMvMDAwMS1z
dXBwb3J0LW91dC1vZi10cmVlLWJ1aWxkLnBhdGNoIGIvcGFja2FnZS9sbHZtLXByb2plY3QvbGli
Y2xjLzAwMDEtc3VwcG9ydC1vdXQtb2YtdHJlZS1idWlsZC5wYXRjaAo+IHNpbWlsYXJpdHkgaW5k
ZXggMTAwJQo+IHJlbmFtZSBmcm9tIHBhY2thZ2UvbGliY2xjLzAwMDEtc3VwcG9ydC1vdXQtb2Yt
dHJlZS1idWlsZC5wYXRjaAo+IHJlbmFtZSB0byBwYWNrYWdlL2xsdm0tcHJvamVjdC9saWJjbGMv
MDAwMS1zdXBwb3J0LW91dC1vZi10cmVlLWJ1aWxkLnBhdGNoCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGliY2xjL0NvbmZpZy5pbiBiL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xpYmNsYy9Db25maWcu
aW4KPiBzaW1pbGFyaXR5IGluZGV4IDEwMCUKPiByZW5hbWUgZnJvbSBwYWNrYWdlL2xpYmNsYy9D
b25maWcuaW4KPiByZW5hbWUgdG8gcGFja2FnZS9sbHZtLXByb2plY3QvbGliY2xjL0NvbmZpZy5p
bgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmNsYy9saWJjbGMuaGFzaCBiL3BhY2thZ2UvbGx2
bS1wcm9qZWN0L2xpYmNsYy9saWJjbGMuaGFzaAo+IHNpbWlsYXJpdHkgaW5kZXggNTElCj4gcmVu
YW1lIGZyb20gcGFja2FnZS9saWJjbGMvbGliY2xjLmhhc2gKPiByZW5hbWUgdG8gcGFja2FnZS9s
bHZtLXByb2plY3QvbGliY2xjL2xpYmNsYy5oYXNoCj4gaW5kZXggYzQ5NjI5MWQ4MS4uNzE0MDg4
NGY2YyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYmNsYy9saWJjbGMuaGFzaAo+ICsrKyBiL3Bh
Y2thZ2UvbGx2bS1wcm9qZWN0L2xpYmNsYy9saWJjbGMuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+
ICAjIGxvY2FsbHkgY2FsY3VsYXRlZAo+IC1zaGEyNTYgIDhmMDIxM2U1MmUyZmNhY2EzZGZjYzQz
OGYwNWQwZTE1ZTliM2M5NmZkNmIwOTk0YTgwMmIyNjdkYzEwNDdhMWQgIGxpYmNsYy0xMy4wLjEu
c3JjLnRhci54ego+ICtzaGEyNTYgIDA3ZThhMmIzMWUwN2E4Y2M4YTk3NmE2YmZkODc3OTdkMjU0
M2Q1YTk1MzBmNDQ5NzU1YmY1MTE5YWNiZGJlOGUgIGxpYmNsYy0xNS4wLjMuc3JjLnRhci54ego+
ICBzaGEyNTYgIDNjNTM2YzA1MmRiOWFmZDk5NzgwOWUzODc4NWM5ZjJhOWU1NGUyODkyMzMwZmE3
YzViNDM4ZTE4YTc0MTM0NzkgIExJQ0VOU0UuVFhUCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGli
Y2xjL2xpYmNsYy5tayBiL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xpYmNsYy9saWJjbGMubWsKPiBz
aW1pbGFyaXR5IGluZGV4IDkyJQo+IHJlbmFtZSBmcm9tIHBhY2thZ2UvbGliY2xjL2xpYmNsYy5t
awo+IHJlbmFtZSB0byBwYWNrYWdlL2xsdm0tcHJvamVjdC9saWJjbGMvbGliY2xjLm1rCj4gaW5k
ZXggNWQyNDZjZjRmOC4uOWYzMDNkNmQyZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYmNsYy9s
aWJjbGMubWsKPiArKysgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9saWJjbGMvbGliY2xjLm1rCj4g
QEAgLTQsOCArNCw4IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLUxJ
QkNMQ19WRVJTSU9OID0gMTMuMC4xCj4gLUxJQkNMQ19TSVRFID0gaHR0cHM6Ly9naXRodWIuY29t
L2xsdm0vbGx2bS1wcm9qZWN0L3JlbGVhc2VzL2Rvd25sb2FkL2xsdm1vcmctJChMSUJDTENfVkVS
U0lPTikKPiArTElCQ0xDX1ZFUlNJT04gPSAkKExMVk1fUFJPSkVDVF9WRVJTSU9OKQo+ICtMSUJD
TENfU0lURSA9ICQoTExWTV9QUk9KRUNUX1NJVEUpCj4gIExJQkNMQ19TT1VSQ0UgPSBsaWJjbGMt
JChMSUJDTENfVkVSU0lPTikuc3JjLnRhci54ego+ICBMSUJDTENfTElDRU5TRSA9IEFwYWNoZS0y
LjAgd2l0aCBleGNlcHRpb25zIG9yIE1JVAo+ICBMSUJDTENfTElDRU5TRV9GSUxFUyA9IExJQ0VO
U0UuVFhUCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
