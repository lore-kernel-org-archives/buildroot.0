Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C66C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 14:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3597C60F2F;
	Sun, 10 Aug 2025 14:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HxHKcy86Qd5M; Sun, 10 Aug 2025 14:11:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B8E660F15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B8E660F15;
	Sun, 10 Aug 2025 14:11:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E848831
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA39B4014E
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjEP32x2r0R7 for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 14:11:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B5484400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5484400B8
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5484400B8
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:11:12 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-458baf449cbso34991485e9.0
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 07:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754835071; x=1755439871;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2KDHMkH1UHBhs/OdSls9Ks+ZwR7VK/Vq5SqVULAvRbA=;
 b=L4Dbq5Le6Yctoc6uyi/19ZhY8IdUcSJNFSOGL+z4NiYVOjjBbMCpnZSbyRE/wYweXB
 tcn/Fs35KQw0JNNB8l3jDwqsQEEYNpvxNZWsPDPUhHgmnDhjimCxSSVabNuSfMRlQOFh
 +W5dp65W6cLQuaN/Zd5z714QBem32wNtxldM7MqFRO/0+tS2NZ/Hdrd2sQW/73voZ3uF
 9Q25muHkX32Uw6W/nVW0DELGo7diXOG3FkVdBx6xRNHcXhhqXwjz1hI0JqPJv9uF1RBz
 iqRP2O9Szsb5dGg/NeDOsUWvbe+4QAS/ghAGq1wOhtv6buCwI6PrzoxpTF+kzf/4VmTV
 f4rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc2m1ZpMG9MXkXCM6ty7v0sHGyACzyhUnnBa46FbpM+NLuxsGPBG/a2HRCbTftcgwfeGuG9FGctbA=@buildroot.org
X-Gm-Message-State: AOJu0YypT3R0dhxzo+yok35jmDzS+FK3W09wilHKTiwmoEs8wOpTXC7U
 5wg2kw4cuLniEm8wEaMzZn78hnND95cTYXHtOPBnklizRA1aUWovvuwBBJzLh5UaCUo=
X-Gm-Gg: ASbGncu76yeOzYffNFOgVTFClSRMteuTrwn2kB9BSeMsxF5m9NTz1yy6O5fI3EKltJT
 xPfuYez7PCDvKUgTOgVb8kcvnGSBNymmwG///Jfy5gHEciA6aRSg/i7p941EO9TS+3s+nbsPm/r
 SCRpv3r/FafeN9YmNiCAlIrd7CoAOJChUXdyzaNG10svHjYPxSbfhnPa7h283D41d9073GRnsSj
 pqeYy3y90w/izcspXnlYkCIbVYiq7fzN++KCLieY+m12m59UIF8RLit6K5Y3+hsDITKFT9F6Ynk
 MBc00I46R5DZN9f/6H1XuSVJ19UIr7QQBHavoe2hKoA/NBaLOnx7FQq3BCFHrqabj2h465rq6Kq
 fwa4IryOqvA3rYJ2Kb28Uyu5DFzWF2090K54Cg4ipMQHJXpBsVGi+2OcMNZ4xBSYYdT4ipJoYtU
 GCYZ/mM2UPNLXlPYAtwW9hDE+qgaM9DxT12PuMANza0o88+r64K/ks+RRkUnHjECvahDuh+Ds=
X-Google-Smtp-Source: AGHT+IH5E2kszEoFnO7ZwqUhm+V/SxjPCTC02MfwgtHve8OnNYzEE355EJAtB+6oWkDu2cfy4d+Xtw==
X-Received: by 2002:a05:600c:4686:b0:459:dfde:3324 with SMTP id
 5b1f17b1804b1-459f4faf99amr70811615e9.29.1754835070651; 
 Sun, 10 Aug 2025 07:11:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e78a35cdsm103978735e9.3.2025.08.10.07.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 07:11:10 -0700 (PDT)
Message-ID: <0ead42e3-6522-4f92-8a21-a8c8352375c2@smile.fr>
Date: Sun, 10 Aug 2025 16:11:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250810124820.2116495-1-thomas.petazzoni@bootlin.com>
 <20250810124820.2116495-2-thomas.petazzoni@bootlin.com>
Content-Language: fr, en-US
In-Reply-To: <20250810124820.2116495-2-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754835071; x=1755439871; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2KDHMkH1UHBhs/OdSls9Ks+ZwR7VK/Vq5SqVULAvRbA=;
 b=NOtTNc+QJPZBSBtRVhc6wP8xVgif20C/F59GaW2IMJFAs1ixYjW4N9xnMBxx2Os3z0
 P3EiQ3pO7Bybdd+5l22TDSpkX2vV0HYe2lfXoRkl1ZBZOwkHEKvFaTuO5nYN4leuEZ2V
 5fuZXhIGxNvMaybUtL4uTRbpVTFIgaeLJGRUE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=NOtTNc+Q
Subject: Re: [Buildroot] [PATCH 2/3] support/scripts/gen-bootlin-toolchains:
 drop tweak for Microblaze bleeding-edge toolchains
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAxMC8wOC8yMDI1IMOgIDE0OjQ4LCBUaG9tYXMgUGV0YXp6
b25pIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBUaGlzIGlzc3VlIGhhcyBiZWVuIGZpeGVk
IGluIHRoZSBCb290bGluIHRvb2xjaGFpbnMgdGhhbmtzIHRvIHRoZQo+IE1pY3JvYmxhemUgImF0
b21pYyBmaXgiIGluIEdDQy4KCkkgZ3Vlc3MgeW91IGFyZSByZWZlcnJpbmcgdG8gdGhlIHBlbmRp
bmcgcGF0Y2ggZnJvbSBOZWFsIEZyYWdlciBbMV0uCgpbMV0KaHR0cHM6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI1MDcyODA0NTE0NS4xMzIzMzMtMS1u
ZWFsLmZyYWdlckBhbWQuY29tLwoKTm90ZTogcGF0Y2ggMy8zIHdhcyBub3QgcmVjZWl2ZWQgeWV0
IG9uIHRoZSBtYWlsaW5nIGxpc3QgKHBhdGNoIHRvbyBiaWcgcHJvYmFibHkpLgoKQmVzdCByZWdh
cmRzLApSb21haW4KCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFz
LnBldGF6em9uaUBib290bGluLmNvbT4KPiAtLS0KPiAgc3VwcG9ydC9zY3JpcHRzL2dlbi1ib290
bGluLXRvb2xjaGFpbnMgfCA1IC0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3NjcmlwdHMvZ2VuLWJvb3RsaW4tdG9vbGNoYWlu
cyBiL3N1cHBvcnQvc2NyaXB0cy9nZW4tYm9vdGxpbi10b29sY2hhaW5zCj4gaW5kZXggNTAyNDEx
ZDRjYy4uNDJlMWM5OTVmNSAxMDA3NTUKPiAtLS0gYS9zdXBwb3J0L3NjcmlwdHMvZ2VuLWJvb3Rs
aW4tdG9vbGNoYWlucwo+ICsrKyBiL3N1cHBvcnQvc2NyaXB0cy9nZW4tYm9vdGxpbi10b29sY2hh
aW5zCj4gQEAgLTQ3OSwxMSArNDc5LDYgQEAgZGVmIGdldF90b29sY2hhaW5zKCk6Cj4gICAgICAg
ICAgICAgICAgICB2YXJpYW50ID0gImJsZWVkaW5nLWVkZ2UiCj4gICAgICAgICAgICAgICAgICB2
ZXJzaW9uID0gcGFydHNbMl1bbGVuKCJibGVlZGluZy1lZGdlLSIpOl0KPiAgCj4gLSAgICAgICAg
ICAgICMgR0NDIDE0Lnggb24gTWljcm9ibGF6ZSBpcyB2ZXJ5IGJyb2tlbiwgc2VlCj4gLSAgICAg
ICAgICAgICMgaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MTE4
MjgwCj4gLSAgICAgICAgICAgIGlmIGFyY2ggaW4gWyJtaWNyb2JsYXplZWwiLCAibWljcm9ibGF6
ZWJlIl0gYW5kIHZhcmlhbnQgPT0gImJsZWVkaW5nLWVkZ2UiOgo+IC0gICAgICAgICAgICAgICAg
Y29udGludWUKPiAtCj4gICAgICAgICAgICAgIHRtcFsoYXJjaCwgbGliYywgdmFyaWFudCldID0g
dmVyc2lvbgo+ICAKPiAgICAgICAgICBpZiBsZW4odG1wKSA9PSAwOgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
