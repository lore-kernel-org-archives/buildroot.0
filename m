Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6125EEA845
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 18:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A86A40AF5;
	Thu, 12 Feb 2026 18:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5QKNNmyuSVi; Thu, 12 Feb 2026 18:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75CA2406C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770922757;
	bh=Ee5H4VtjTO/kx6P1ihJNzURcUSpjRi3S7XAjm2vXNAw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=szGHJwYJDQAz1sk0BSQC9yo9DSo29JdrwVbc0x0mAc1yVxigzuuVeMDCP2rVcpVUC
	 ifIKMxHEvU/s4rR00UBG/sWHtJbo77GRD6WDLI/gNhCkve/yOazRPKLQCySY1uPFSB
	 VRxmvMYRNAhiKexo5oQZ8EIITMNFMGkHpTVNkjt/GNkcLgPyIWWk6xXe0PLJK4HcYs
	 /o6P4nR740lcLD8+E5VjpJimZXhOiWmBSuCY9p8mthjzBSOtroDdUuQOJjOC8i/EiF
	 qhgXlz7i12Z9kutJjSdnqBNJk7hcIvz+jhTS8q+bcqhOHwbDnbh4PCats+nA9jZrQC
	 evaGQm2nwfd5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75CA2406C3;
	Thu, 12 Feb 2026 18:59:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B31621CA
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 18:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92F2360893
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 18:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-Rk2k2LK_se for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 18:59:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 48DEF6077F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48DEF6077F
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48DEF6077F
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 18:59:15 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-65a1974d3dfso155883a12.3
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 10:59:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770922753; x=1771527553;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j1ro7nPVpsATNqLPyXIxs365eqL70UorAupyutlO3Ck=;
 b=fjZOD2ST2A49BzcNVQz6JR0d13S/uldjULL5HiNyTXnU9to593cCM+ivuYZD570YiO
 Hriym0RwjTFrG76Pt+dmYM9McHNWOZVeLyxIwj6qssIgMndoFscQWLjPARVNZUCFMpAa
 Xf2ivlMcSEMdyxFVbFkGx186Lqias30US5wqwWSjG5jGTj1mmn2DWxiCfZ9An4JC5kyI
 bhshhRvOC+trPvkZ8mGuFrqIJJ7bxm8SXcPqyseidZqj01gDlb+UN62i3xdOaphCs/xO
 AGd+Wd0x2saxeJ1MeS5hb8/N+QveNPUbbcDF+gnO0KnlP/DPuJi8CGOvdAUTiQKD+Fdp
 Bakw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVABEeYHbJGRYkjz6lMkV7Pznq9VXk0YAUMSGVXCYc/g3jlrxNd6byT9lgH/zSLkHdXNWkDAe5kFWw=@buildroot.org
X-Gm-Message-State: AOJu0Yyw+A/2XTYAMsfegi/wOuKZShDg4GYpDDBAYNkS02EOjz5nYjKL
 xoMr3lJ2Vl/01IvpUEI66dwuThV+A3+mPRksGcLochOEQ15cSZQ+XbuEpaiVV/7G/TU=
X-Gm-Gg: AZuq6aKaTI5bqWi0fN1s2EIWahq/P7qLubtBrlonuOejhfXYAHl/sOpsDD9AaSKKioh
 mXdTXkarmwoCv6uN65RozmhXS04YQzzxH//mzVGBZnUiesxkYrWpIoejVJXVSIofhdPQPthO2Lc
 IQe4ASXSKsbZSr7cr0ntpqurmGu9S6rY47FYjhGVxqsNLxZI8n2PqdiMIefvTW/XAiTq6k7VtS3
 2yP24N+W2lXyFEv0nO2WfBR21QCrXzjU8jm7PS+CAG+t5ig0eL7ypMRil+lXrqGUL1TxeYvUFhN
 klT8lSbwRiZlJcchT59PlC7y7XSOjP2k8oJ1IxykMXL+79e6MqdyPqbVW41jTJPBFEDrl1f0Fdt
 5FXASXIT4vtgNUmZTXfZq09yMCXgF+DMffYnFseRYo4LioZW3TDovR7yKNvysvJ1NPrFzG36XM2
 dhhUzVEoEHG4QwllXrcLJs0T8ZnUNkgtUyz+lcBzVsZ7fkpSY379dj/i6W4jEWF4xetRHLm8Jgq
 UdKVpB/zMBKya/05/bhgSuhDEhlJbKM9BT8JsDdtCkf6NYZCRwG/2KdvQZcMrmGYg==
X-Received: by 2002:a05:6402:399a:b0:65b:a76d:6ff0 with SMTP id
 4fb4d7f45d1cf-65bad1402c3mr2590a12.31.1770922752920; 
 Thu, 12 Feb 2026 10:59:12 -0800 (PST)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65ba66c8c75sm567019a12.5.2026.02.12.10.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 10:59:12 -0800 (PST)
Message-ID: <d13a47d0-39c4-4bd4-801c-ca4cdd4bc8ca@smile.fr>
Date: Thu, 12 Feb 2026 19:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Steve deRosier <derosier@cal-sierra.com>, Adam Ford <aford173@gmail.com>
References: <20251203-virglrenderer-v2-v2-0-2846fc1a579a@gmail.com>
 <20251203-virglrenderer-v2-v2-1-2846fc1a579a@gmail.com>
Content-Language: fr, en-US
In-Reply-To: <20251203-virglrenderer-v2-v2-1-2846fc1a579a@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770922753; x=1771527553; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j1ro7nPVpsATNqLPyXIxs365eqL70UorAupyutlO3Ck=;
 b=m2Zm4r1mDw3qdxRwDLqtF+yZ8x8wXrv6CryMeVS5lX+eaiJ1QHjn7qUmCyhML1q03d
 9yYMu5IW0d4KtUBKuM1jLnHpVGRc5DKrQPCEZkR/3CrXNJ/4WVBsXwcPuipuomY2P/T6
 iuX6CRkWD0LJIj1OAyfFRZTZ7EaT5ANYd+p7Q=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=m2Zm4r1m
Subject: Re: [Buildroot] [PATCH RESEND v2 1/2] package/virglrenderer: new
 package
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

SGVsbG8gSm9zZXBoLCBBbGwsCgpMZSAwNC8xMi8yMDI1IMOgIDA1OjI5LCBKb3NlcGggS29ndXQg
YSDDqWNyaXTCoDoKPiBBZGQgdmlyZ2xyZW5kZXJlciwgYW4gb3B0aW9uYWwgZGVwZW5kZW5jeSBv
ZiBRRU1VLCB3aGljaCBmYWNpbGl0YXRlcwo+IGFjY2VsZXJhdGlvbiBvZiByZW5kZXJpbmcgYW5k
IG9wdGlvbmFsbHkgdmlkZW8gZGVjb2RlIHRocm91Z2gKPiB2aXJ0aW8tZ3B1Lgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEpvc2VwaCBLb2d1dCA8am9zZXBoLmtvZ3V0QGdtYWlsLmNvbT4KPiAtLS0KPiAg
REVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2Fn
ZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS92aXJn
bHJlbmRlcmVyL0NvbmZpZy5pbiAgICAgICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIHBhY2thZ2UvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLmhhc2ggfCAgNSAr
KysrKwo+ICBwYWNrYWdlL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci5tayAgIHwgMzYgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCA3NiBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5k
ZXggZmI4ZWVkYjVjZi4uOWFlNDY4ODRjMyAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysr
IGIvREVWRUxPUEVSUwo+IEBAIC0xNzg3LDYgKzE3ODcsNyBAQCBGOglwYWNrYWdlL3B5dGhvbi14
bGliLwo+ICBGOglwYWNrYWdlL3NlbnRyeS1jbGkvCj4gIEY6CXBhY2thZ2Uvc2VudHJ5LW5hdGl2
ZS8KPiAgRjoJcGFja2FnZS91bmNsdXR0ZXIteGZpeGVzLwo+ICtGOglwYWNrYWdlL3ZpcmdscmVu
ZGVyZXIvCj4gIAo+ICBOOglKb3NodWEgSGVuZGVyc29uIDxqb3NodWEuaGVuZGVyc29uQG1pY3Jv
Y2hpcC5jb20+Cj4gIEY6CXBhY2thZ2UvcXQ1L3F0NXdheWxhbmQvCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KPiBpbmRleCAxYzRkY2YyYzc1Li5m
N2NmZmZhZTBhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2Fn
ZS9Db25maWcuaW4KPiBAQCAtMTgwNyw2ICsxODA3LDcgQEAgbWVudSAiR3JhcGhpY3MiCj4gIAlz
b3VyY2UgInBhY2thZ2Uvc3RiL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS90aWZmL0Nv
bmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS91bmNsdXR0ZXIteGZpeGVzL0NvbmZpZy5pbiIK
PiArCXNvdXJjZSAicGFja2FnZS92aXJnbHJlbmRlcmVyL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAi
cGFja2FnZS93YWZmbGUvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3dheWxhbmQvQ29u
ZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3dheWxhbmQtcHJvdG9jb2xzL0NvbmZpZy5pbiIK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS92aXJnbHJlbmRlcmVyL0NvbmZpZy5pbiBiL3BhY2thZ2Uv
dmlyZ2xyZW5kZXJlci9Db25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwMDAuLjhmNTk0ODQ5ZjYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS92aXJn
bHJlbmRlcmVyL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMzMgQEAKPiArY29uZmlnIEJSMl9QQUNL
QUdFX1ZJUkdMUkVOREVSRVIKPiArCWJvb2wgInZpcmdscmVuZGVyZXIiCj4gKwlkZXBlbmRzIG9u
IEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMgIyBsaWJkcm0KPiArCWRlcGVuZHMgb24gQlIyX1VT
RV9NTVUgIyBsaWJkcm0KPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSEFTX0xJQkVHTCB8fCBC
UjJfUEFDS0FHRV9IQVNfTElCR0wgIyBsaWJlcG94eQo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0xJ
QkVQT1hZCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCRFJNCj4gKwloZWxwCj4gKwkgIFZpckdM
IGlzIGEgdmlydHVhbCAzRCBHUFUgZm9yIHVzZSBpbnNpZGUgUUVNVQo+ICsJICB2aXJ0dWFsIG1h
Y2hpbmVzLCB0aGF0IGFsbG93cyB0aGUgZ3Vlc3Qgb3BlcmF0aW5nCj4gKwkgIHN5c3RlbSB0byB1
c2UgdGhlIGNhcGFiaWxpdGllcyBvZiB0aGUgaG9zdCBHUFUgdG8KPiArCSAgYWNjZWxlcmF0ZSAz
RCByZW5kZXJpbmcuCj4gKwo+ICsJICBodHRwczovL2RvY3MubWVzYTNkLm9yZy9kcml2ZXJzL3Zp
cmdsLmh0bWwKPiArCj4gK2lmIEJSMl9QQUNLQUdFX1ZJUkdMUkVOREVSRVIKPiArCj4gK2NvbmZp
ZyBCUjJfUEFDS0FHRV9WSVJHTFJFTkRFUkVSX1ZFTlVTCj4gKwlib29sICJ2ZW51cyIKPiArCWRl
cGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQICMgdnVsa2FuLWxvYWRlcgo+ICsJZGVwZW5k
cyBvbiAhQlIyX1NUQVRJQ19MSUJTICMgdnVsa2FuLWxvYWRlcgo+ICsJZGVwZW5kcyBvbiBCUjJf
VE9PTENIQUlOX0hBU19USFJFQURTICMgdnVsa2FuLWxvYWRlcgo+ICsJc2VsZWN0IEJSMl9QQUNL
QUdFX1ZVTEtBTl9MT0FERVIKPiArCWhlbHAKPiArCSAgVmVudXMgaXMgYSB2aXJ0aW8tZ3B1IHBy
b3RvY29sIGZvciBWdWxrYW4gY29tbWFuZAo+ICsJICBzZXJpYWxpemF0aW9uLgo+ICsKPiArCSAg
U2F5ICd5JyBpZiB5b3Ugd2FudCB0byBydW4gYXBwbGljYXRpb25zIHdpdGggVnVsa2FuCj4gKwkg
IGFjY2VsZXJhdGlvbiBpbiB2aXJ0dWFsaXplZCBndWVzdHMuCj4gKwo+ICsJICBodHRwczovL2Rv
Y3MubWVzYTNkLm9yZy9kcml2ZXJzL3ZlbnVzLmh0bWwKPiArCj4gK2VuZGlmCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLmhhc2ggYi9wYWNrYWdlL3Zp
cmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwLi40ZGY4ZTNhMTgxCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2th
Z2UvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLmhhc2gKPiBAQCAtMCwwICsxLDUgQEAKPiAr
IyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiArc2hhMjU2ICA4YmFlOTI5MDkwMjFlYTg3ZTIwODdhZTk2
ZGYzMjJmOTAxNDBjNDE0YmQ1ZjM4ODEwYWYzZjNlNTE0NmE1NjdiICB2aXJnbHJlbmRlcmVyLTEu
Mi4wLnRhci5nego+ICsKPiArIyBMaWNlbnNlCj4gK3NoYTI1NiAgM2IzMmNhZjE2ZTI0MDJjMmFm
ZjJiNzE2ODU4NzEzZjNlMWZlZGVkODVjMjVlNzFiZjgyOTgxNmVlNTAwOTQwMiAgQ09QWUlORwo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci5tayBiL3Bh
Y2thZ2UvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4yZTI1YTc0NzViCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L3BhY2thZ2UvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLm1rCj4gQEAgLTAsMCArMSwzNiBA
QAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgdmlyZ2xyZW5kZXJlcgo+ICsj
Cj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtWSVJHTFJFTkRFUkVSX1ZFUlNJT04g
PSAxLjIuMAo+ICtWSVJHTFJFTkRFUkVSX1NJVEUgPSBodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvdmlyZ2wvdmlyZ2xyZW5kZXJlci8tL2FyY2hpdmUvJChWSVJHTFJFTkRFUkVSX1ZFUlNJ
T04pCj4gK1ZJUkdMUkVOREVSRVJfTElDRU5TRSA9IE1JVAo+ICtWSVJHTFJFTkRFUkVSX0xJQ0VO
U0VfRklMRVMgPSBDT1BZSU5HCj4gK1ZJUkdMUkVOREVSRVJfSU5TVEFMTF9TVEFHSU5HID0gWUVT
Cj4gK1ZJUkdMUkVOREVSRVJfREVQRU5ERU5DSUVTID0gXAo+ICsJbGliZXBveHkgXAo+ICsJbGli
ZHJtIFwKPiArCWxpYmVnbCBcCj4gKwlob3N0LXBrZ2NvbmYKCkZlZWwgZnJlZSB0byBkaXNjcmVl
dGx5IGhhdmUgYSBsb29rIGF0IHZpcmdscmVuZGVyZXJfMS4yLjAuYmIgcmVjaXBlIFsxXS4KCkkg
bm90aWNlZCB0aGF0IGhvc3QtcHl0aG9uLXB5eWFtbCBhbmQgaG9zdC1weXRob24zIGFyZSBuZWVk
ZWQgaGVyZSBzaW5jZSBzb21lCnB5dGhvbiBzY3JpcHRzIGFyZSB1c2VkIGJ5IHRoZSBidWlsZCBz
eXN0ZW0gaW1wb3J0IHRoaXMgcHl0aG9uIG1vZHVsZToKCnNyYy9nYWxsaXVtL2F1eGlsaWFyeS91
dGlsL3VfZm9ybWF0X3BhcnNlLnB5OjMzOmltcG9ydCB5YW1sCgpsaWJnYm0gaXMgYWxzbyBjaGVj
a2VkIGJ5IG1lc29uIFsyXSwgc28gYWRkIGxpYmdibSBpbgpWSVJHTFJFTkRFUkVSX0RFUEVOREVO
Q0lFUy4gQWRkICJkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hBU19MSUJHQk0iIGFzCkJSMl9QQUNL
QUdFX1ZJUkdMUkVOREVSRVIgZGVwZW5kZW5jeS4KClsxXQpodHRwczovL2dpdGh1Yi5jb20vb3Bl
bmVtYmVkZGVkL29wZW5lbWJlZGRlZC1jb3JlL2Jsb2IvbWFzdGVyL21ldGEvcmVjaXBlcy1ncmFw
aGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXJfMS4yLjAuYmIKClsyXQpodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvdmlyZ2wvdmlyZ2xyZW5kZXJlci8tL2Jsb2IvdmlyZ2xyZW5k
ZXJlci0xLjIuMC9tZXNvbi5idWlsZD9yZWZfdHlwZT10YWdzI0wyOTUKCj4gK1ZJUkdMUkVOREVS
RVJfQ1BFX0lEX1ZBTElEID0gWUVTCj4gKwo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1ZJUkdMUkVO
REVSRVJfVkVOVVMpLHkpCj4gK1ZJUkdMUkVOREVSRVJfQ09ORl9PUFRTICs9IC1EdmVudXM9dHJ1
ZQo+ICtWSVJHTFJFTkRFUkVSX0RFUEVOREVOQ0lFUyArPSB2dWxrYW4tbG9hZGVyCgpDYW4geW91
IGNoZWNrIGlmIHZ1bGthbi1oZWFkZXJzIGlzIG5lZWRlZCBoZXJlPwoKPiArZW5kaWYKCldlIGhh
dmUgbGlidmEgaW4gQnVpbGRyb290LCB3aGF0IGFib3V0IGFkZGluZyBsaWJ2YSBvcHRpb25hbCBk
ZXBlbmRlbmN5PwoKaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJWQSkseSkKVklSR0xSRU5ERVJFUl9D
T05GX09QVFMgKz0gLUR2aWRlbz10cnVlClZJUkdMUkVOREVSRVJfREVQRU5ERU5DSUVTICs9IGxp
YnZhCmVsc2UKVklSR0xSRU5ERVJFUl9DT05GX09QVFMgKz0gLUR2aWRlbz1mYWxzZQplbmRpZgoK
QmVzdCByZWdhcmRzLApSb21haW4KCgo+ICsKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9NRVNBM0Rf
R0FMTElVTV9EUklWRVJfUkFERU9OU0kpLHkpCj4gK1ZJUkdMUkVOREVSRVJfRFJNX0JBQ0tFTkRT
ICs9IGFtZGdwdS1leHBlcmltZW50YWwKPiArZW5kaWYKPiArCj4gK2lmZXEgKCQoQlIyX1BBQ0tB
R0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX0ZSRUVEUkVOTykseSkKPiArVklSR0xSRU5ERVJFUl9E
Uk1fQkFDS0VORFMgKz0gbXNtCj4gK2VuZGlmCj4gKwo+ICtpZm5lcSAoJChWSVJHTFJFTkRFUkVS
X0RSTV9CQUNLRU5EUyksKQo+ICtWSVJHTFJFTkRFUkVSX0NPTkZfT1BUUyArPSAtRGRybS1yZW5k
ZXJlcnM9JChWSVJHTFJFTkRFUkVSX0RSTV9CQUNLRU5EUykKPiArZW5kaWYKPiArCj4gKyQoZXZh
bCAkKG1lc29uLXBhY2thZ2UpKQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
