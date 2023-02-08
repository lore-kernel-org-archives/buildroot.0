Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED55C64EC5
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 14:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF1CC8141C;
	Wed,  8 Feb 2023 14:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF1CC8141C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LFu_8GzXbMdQ; Wed,  8 Feb 2023 14:53:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCD6781403;
	Wed,  8 Feb 2023 14:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCD6781403
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A037A1BF2C7
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B18340BF9
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B18340BF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KFsJ7X-QtAMo for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 14:53:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FCE640BF1
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FCE640BF1
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 14:53:44 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 az4-20020a05600c600400b003dff767a1f1so1676283wmb.2
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 06:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IrBZATfi/OpqmQzsqJXiTjcWHPe1Wp3Dgj2bahc6iek=;
 b=QEqRwF/FD5F/DOTPSV68TD+0TZ/nPVG+La5XzA/tUtFMxwpWr0QHooKJygmdlKaDYJ
 PUUMNe4JI8hKTBbBZpz1Sp/BjGCWDW5WT8q++bptm9eaPsVy9ddscicAhp1dZb2GIP12
 ixCRJbUOGpQ7GvgEfW80v2NEs5JMjveKsspZ3/rI8vJcHak/CtHhQTpVLW3oln+gQJng
 4D0PebWq4rUhZkBU3t5BEimCgj+VEn0qtjYmIL5EMqtIhDeVwGAvlXdaTo4U6xsMHP26
 42x6Zc302GRzP+iFEzq1+fVcbyDJC3+0QfmVS0dofwvt1G14hCYwjkccxKjktFcNpRWt
 D2iw==
X-Gm-Message-State: AO0yUKVKoUADP4lVTu9Du5yQHtuyOh+BqEVRla1YbPpRpHg86W0lVZBo
 yKRB/jVQb6tpVLrfhrSf+C+WQzhw/O3UDEo3
X-Google-Smtp-Source: AK7set8CJQhGU1s0wtc4aPngfuUpEDE8rCH5Sfl2YRJMJncrSy1BZn0Jp9cFouBa5eSUEtZC4D7y7g==
X-Received: by 2002:a05:600c:3083:b0:3e0:481:c897 with SMTP id
 g3-20020a05600c308300b003e00481c897mr6904968wmn.37.1675868022501; 
 Wed, 08 Feb 2023 06:53:42 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a05600c19c600b003dc0cb5e3f1sm2331136wmq.46.2023.02.08.06.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 06:53:42 -0800 (PST)
Message-ID: <f067049d-1a0b-6567-3040-1c179a9aa913@smile.fr>
Date: Wed, 8 Feb 2023 15:53:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB0493D5D425B65A666B08D6C99F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <VI1P190MB0493D5D425B65A666B08D6C99F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IrBZATfi/OpqmQzsqJXiTjcWHPe1Wp3Dgj2bahc6iek=;
 b=5Ghpx0KvUEG/ZxjRvyPZOMSFqop1dB/6RLMK+lnVvP7DdECtLdtXLaChCDon4bgNCq
 yyNSdGtkknQkwDAI2xKQX6xFtHIfSGVXxmsmHNP0RTEX/U4v82meGAUqnONyD62DWAgo
 khx9FNwLZHrMRWDgF9nGUkm6/cmrn+LtZFW7mRVuqYXHCMp9Z4RS7l5TZD1ktSN2XZhV
 zY6rIS64sxD9AICceagIL5MaLqSJ9z0fES1Y/QxdEI+wxyQiXUqbVX/9QsTfkb6TneIO
 cgwbtx/wSgDLCwi51D+aquJMRy8T2Dn3FkM/2qzp88Maf5BB3GdrzqTKZbWurx8I1n4B
 7fsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=5Ghpx0Kv
Subject: Re: [Buildroot] [PATCH v2 05/11] package/compiler-rt: move to
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

SGVsbG8sCgpMZSAyNS8xMC8yMDIyIMOgIDA4OjA4LCBMYW5nIERhbmllbCB2aWEgYnVpbGRyb290
IGEgw6ljcml0wqA6Cj4gVG8gbWFrZSB2ZXJzaW9uIGJ1bXBpbmcgZWFzaWVyLCBtb3ZlIGxsdm0g
dG8gYSBuZXcgbGx2bS1wcm9qZWN0IHN1YmZvbGRlcgo+IGFuZCBzcGVjaWZ5IHNpdGUgYW5kIHZl
cnNpb24gZm9yIHRoZSBwcm9qZWN0LgoKUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWlu
Lm5hb3VyQHNtaWxlLmZyPgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gU2lnbmVkLW9mZi1i
eTogRGFuaWVsIExhbmcgPGQubGFuZ0BhYmF0ZWMuYXQ+Cj4gLS0tCj4gQ2hhbmdlcyB2MSAtPiB2
MjoKPiAtIE5vIGNoYW5nZXMKPiAtLS0KPiAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgcGFja2FnZS9Db25maWcuaW4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgcGFja2FnZS97ID0+
IGxsdm0tcHJvamVjdH0vY29tcGlsZXItcnQvQ29uZmlnLmluICAgICAgICB8IDAKPiAgcGFja2Fn
ZS97ID0+IGxsdm0tcHJvamVjdH0vY29tcGlsZXItcnQvY29tcGlsZXItcnQuaGFzaCB8IDAKPiAg
cGFja2FnZS97ID0+IGxsdm0tcHJvamVjdH0vY29tcGlsZXItcnQvY29tcGlsZXItcnQubWsgICB8
IDYgKystLS0tCj4gIDUgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQo+ICByZW5hbWUgcGFja2FnZS97ID0+IGxsdm0tcHJvamVjdH0vY29tcGlsZXItcnQvQ29u
ZmlnLmluICgxMDAlKQo+ICByZW5hbWUgcGFja2FnZS97ID0+IGxsdm0tcHJvamVjdH0vY29tcGls
ZXItcnQvY29tcGlsZXItcnQuaGFzaCAoMTAwJSkKPiAgcmVuYW1lIHBhY2thZ2UveyA9PiBsbHZt
LXByb2plY3R9L2NvbXBpbGVyLXJ0L2NvbXBpbGVyLXJ0Lm1rICg4NSUpCj4gCj4gZGlmZiAtLWdp
dCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXggZDUxNmY1ODVkOC4uZTY2MDY0MDhj
MCAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0xOTY2
LDcgKzE5NjYsNiBAQCBGOglwYWNrYWdlL2JyaWRnZS11dGlscy8KPiAgRjoJcGFja2FnZS9jaGVj
a3BvbGljeS8KPiAgRjoJcGFja2FnZS9jaGVja3NlYy8KPiAgRjoJcGFja2FnZS9jZ3JvdXBmcy1t
b3VudC8KPiAtRjoJcGFja2FnZS9jb21waWxlci1ydC8KPiAgRjoJcGFja2FnZS9jcmRhLwo+ICBG
OglwYWNrYWdlL2N1bml0Lwo+ICBGOglwYWNrYWdlL2RhY2Fwby8KPiBAQCAtMjAwNCw2ICsyMDAz
LDcgQEAgRjoJcGFja2FnZS9saWJzc2gyLwo+ICBGOglwYWNrYWdlL2xpYnRhbGxvYy8KPiAgRjoJ
cGFja2FnZS9saWJxbWkvCj4gIEY6CXBhY2thZ2UvbGlnaHR0cGQvCj4gK0Y6CXBhY2thZ2UvbGx2
bS1wcm9qZWN0L2NvbXBpbGVyLXJ0Lwo+ICBGOglwYWNrYWdlL2xvZ3JvdGF0ZS8KPiAgRjoJcGFj
a2FnZS9tYWtlZGV2cy8KPiAgRjoJcGFja2FnZS9tZW10ZXN0ZXIvCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KPiBpbmRleCAxNWRkMjc3OTZmLi4x
ZDQ4YjE0NDhiIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2Fn
ZS9Db25maWcuaW4KPiBAQCAtMTk3Miw3ICsxOTcyLDcgQEAgbWVudSAiT3RoZXIiCj4gIAlzb3Vy
Y2UgInBhY2thZ2UvY2VyZWFsL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9sbHZtLXBy
b2plY3QvY2xhbmcvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL2Ntb2NrYS9Db25maWcu
aW4iCj4gLQlzb3VyY2UgInBhY2thZ2UvY29tcGlsZXItcnQvQ29uZmlnLmluIgo+ICsJc291cmNl
ICJwYWNrYWdlL2xsdm0tcHJvamVjdC9jb21waWxlci1ydC9Db25maWcuaW4iCj4gIAlzb3VyY2Ug
InBhY2thZ2UvY3BwY21zL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9jcmFja2xpYi9D
b25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvZGF3Z2RpYy9Db25maWcuaW4iCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvY29tcGlsZXItcnQvQ29uZmlnLmluIGIvcGFja2FnZS9sbHZtLXByb2pl
Y3QvY29tcGlsZXItcnQvQ29uZmlnLmluCj4gc2ltaWxhcml0eSBpbmRleCAxMDAlCj4gcmVuYW1l
IGZyb20gcGFja2FnZS9jb21waWxlci1ydC9Db25maWcuaW4KPiByZW5hbWUgdG8gcGFja2FnZS9s
bHZtLXByb2plY3QvY29tcGlsZXItcnQvQ29uZmlnLmluCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
Y29tcGlsZXItcnQvY29tcGlsZXItcnQuaGFzaCBiL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2NvbXBp
bGVyLXJ0L2NvbXBpbGVyLXJ0Lmhhc2gKPiBzaW1pbGFyaXR5IGluZGV4IDEwMCUKPiByZW5hbWUg
ZnJvbSBwYWNrYWdlL2NvbXBpbGVyLXJ0L2NvbXBpbGVyLXJ0Lmhhc2gKPiByZW5hbWUgdG8gcGFj
a2FnZS9sbHZtLXByb2plY3QvY29tcGlsZXItcnQvY29tcGlsZXItcnQuaGFzaAo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2NvbXBpbGVyLXJ0L2NvbXBpbGVyLXJ0Lm1rIGIvcGFja2FnZS9sbHZtLXBy
b2plY3QvY29tcGlsZXItcnQvY29tcGlsZXItcnQubWsKPiBzaW1pbGFyaXR5IGluZGV4IDg1JQo+
IHJlbmFtZSBmcm9tIHBhY2thZ2UvY29tcGlsZXItcnQvY29tcGlsZXItcnQubWsKPiByZW5hbWUg
dG8gcGFja2FnZS9sbHZtLXByb2plY3QvY29tcGlsZXItcnQvY29tcGlsZXItcnQubWsKPiBpbmRl
eCBjOGVhODZlODk5Li44NGFkZDYwODAxIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvY29tcGlsZXIt
cnQvY29tcGlsZXItcnQubWsKPiArKysgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9jb21waWxlci1y
dC9jb21waWxlci1ydC5tawo+IEBAIC00LDExICs0LDkgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+ICAKPiAtIyBDb21waWxlci1SVCBzaG91bGQgYmUgYnVtcGVkIHRvZ2V0aGVy
IHdpdGggTExWTSBhbmQgQ2xhbmcgYXMgdGhlIHJ1bi10aW1lIGlzCj4gLSMgdGllZCB0byB0aGUg
dmVyc2lvbiBvZiB0aG9zZSB0b29scwo+IC1DT01QSUxFUl9SVF9WRVJTSU9OID0gMTEuMS4wCj4g
K0NPTVBJTEVSX1JUX1ZFUlNJT04gPSAkKExMVk1fUFJPSkVDVF9WRVJTSU9OKQo+ICBDT01QSUxF
Ul9SVF9TT1VSQ0UgPSBjb21waWxlci1ydC0kKENPTVBJTEVSX1JUX1ZFUlNJT04pLnNyYy50YXIu
eHoKPiAtQ09NUElMRVJfUlRfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJv
amVjdC9yZWxlYXNlcy9kb3dubG9hZC9sbHZtb3JnLSQoQ09NUElMRVJfUlRfVkVSU0lPTikKPiAr
Q09NUElMRVJfUlRfU0lURSA9ICQoTExWTV9QUk9KRUNUX1NJVEUpCj4gIENPTVBJTEVSX1JUX0xJ
Q0VOU0UgPSBOQ1NBIE1JVAo+ICBDT01QSUxFUl9SVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS5U
WFQKPiAgQ09NUElMRVJfUlRfREVQRU5ERU5DSUVTID0gaG9zdC1jbGFuZyBsbHZtCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
