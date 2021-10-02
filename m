Return-Path: <SRS0=UKoJ=OW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F01BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 15:58:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C932361A58
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 15:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C932361A58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 547D8606CC;
	Sat,  2 Oct 2021 15:58:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hoxtfAU7CWnj; Sat,  2 Oct 2021 15:58:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4A926063A;
	Sat,  2 Oct 2021 15:58:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77FE11BF38B
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 15:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EE426063A
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 15:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nY_cHZD7pJq5 for <buildroot@lists.busybox.net>;
 Sat,  2 Oct 2021 15:58:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A734060592
 for <buildroot@buildroot.org>; Sat,  2 Oct 2021 15:58:28 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 m14-20020a05600c3b0e00b0030d4dffd04fso3671923wms.3
 for <buildroot@buildroot.org>; Sat, 02 Oct 2021 08:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hPkuKXuzyBbAhXVaE5La7WRh4dG53uy+TqVBuOzVD3k=;
 b=bKoKPRP1H05alc81gJ/o6o0GazYAGvGzO2Uk1aIaDzvwdfowLJJmWM5SZWR82I9hZr
 F5mBwI8BfEg2Llk3Sw+2rRdJSt1FLXJBw4Mda99wTxflRHOxovbEU5hPk+WI8D/ScS9r
 IdDNFwZc/ZpF521hjKr1rsrbVHDuBdWsOmtDn00FzQXljZKhpFemVikRpkKHDgJBXr+L
 3nHqfMDbgGrv+nVnmIJSIUzJCY2PIwOU8ttDIhllq6cqR4gViE1jzSuWqP1fMERzI7Ll
 WvZGxgkJBqGAsYrY9SRq/3IZ5Qt7XZ0RNoJ6SA9e998XA3aK9CIW0yGq1i9SR7ZDjyOa
 p17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hPkuKXuzyBbAhXVaE5La7WRh4dG53uy+TqVBuOzVD3k=;
 b=W7GNcZARiYVuPNYgTgRQmAnidcbGUiZ4jZl0HNloxN2dh8nTZ07RCI0aGAqFT3UvGN
 j+UJwZNAXfkMG0guZgchmbjPWREAuxcz4X4xvS+7avxF45Qo5yRAVZnTJ+XdnzkBnatN
 pc70x2jeUpvYsJsUu0t8hs47GEVFmx/AqNSgwIXlMAQA978TMPBAHAEi55k8yPMBgtd4
 OoSVUQPzXt8gC1JivgPEP2A1Pb1lf8ahQ424J7do5FoHgLDe3uQNZp4U9ARdJjAR8zys
 FWSQ9pdlQwmDKfX1++tpTi+gee/k1I0x/PRFBfhPIr2KwSb3YJA+EDTs3rJpEGNiS7lh
 aUXg==
X-Gm-Message-State: AOAM531k/gdok1P5P1WjL3iA3bS7fYTBCQoG4oqdYnDabMaZmU3ezBDR
 deIJT7nX6AHJcy+cgjUIQ7Q=
X-Google-Smtp-Source: ABdhPJzhRGUd7ru5QCZnWrFhUsx8DS39PAtQUYfqy71krU1mW+fTxdv6dPhJwUEkVjF/6LrhjYmIeQ==
X-Received: by 2002:a1c:4d2:: with SMTP id 201mr9833199wme.156.1633190306770; 
 Sat, 02 Oct 2021 08:58:26 -0700 (PDT)
Received: from [192.168.1.39] (arennes-651-1-314-16.w2-12.abo.wanadoo.fr.
 [2.12.73.16])
 by smtp.gmail.com with ESMTPSA id n15sm9203012wrg.58.2021.10.02.08.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 08:58:26 -0700 (PDT)
Message-ID: <6d635d7e-e88a-3b23-9682-a19ff3d08b7d@gmail.com>
Date: Sat, 2 Oct 2021 17:58:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, Guo Ren <ren_guo@c-sky.com>
References: <37a2790a-8c48-1cfd-a160-567618850bbe@gmail.com>
 <24407e05-d940-826a-690f-5bbe1aeec252@mind.be>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <24407e05-d940-826a-690f-5bbe1aeec252@mind.be>
Subject: Re: [Buildroot] csky 8xx toolchain issue
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LAoKTGUgMjYvMDgvMjAyMSDDoCAyMzo1OSwgQXJub3V0IFZhbmRlY2FwcGVs
bGUgYSDDqWNyaXTCoDoKPiAKPiAKPiBPbiAyNi8wOC8yMDIxIDIxOjM5LCBSb21haW4gTmFvdXIg
d3JvdGU6Cj4+IEhlbGxvIEd1bywKPj4KPj4gSSBub3RpY2VkIHRoYXQgdGhlIGNza3kgOHh4IHRv
b2xjaGFpbiBkb2Vzbid0IGJ1aWxkIHdpdGggYSByZWNlbnQgY29tcGlsZXIuCj4+IEl0IHRyaWdn
ZXIgYW4gaW50ZXJuYWwgY29tcGlsZXIgZXJyb3Igd2l0aCB0aGUgZ2NjIGluc3RhbGxlZCBvbiB0
aGUgaG9zdCAoRGViaWFuCj4+IGJ1c3RlciwgZ2NjIDguMy4wLTYpOyBGZWRvcmEgMzMsIGdjYyAx
MC4zLjEtMTsgRmVkb3JhIDM0LCBnY2MgMTEuMC4xLTAuMykuCj4+Cj4+IFtxZW11X2Nza3k4MDdf
dmlydF9kZWZjb25maWddCj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1OTMvYnVpbGRyb290Ly0v
am9icy8xNTM1NDY0OTc0Cj4+Cj4+IFtxZW11X2Nza3k4MTBfdmlydF9kZWZjb25maWddCj4+IGh0
dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1OTMvYnVpbGRyb290Ly0vam9icy8xNTM1NDY0OTc1Cj4+Cj4+
IFtxZW11X2Nza3k4NjBfdmlydF9kZWZjb25maWddCj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1
OTMvYnVpbGRyb290Ly0vam9icy8xNTM1NDY0OTc2Cj4+Cj4+IFRoZSBsYXN0IGtub3cgaG9zdCBj
b21waWxlciBpcyBnY2MgNiBmcm9tIERlYmlhbiBzdHJldGNoIHRoYXQgaXMgc3RpbGwgdXNlZCBi
eQo+PiB0aGUgZ2l0bGFiLWNpIGJ1aWxkcy4gSXQgd2FzIG5vdCBub3RpY2VkIGJlZm9yZSBiZWNh
dXNlIGNza3kgaXMgbm90IHRlc3RlZCBieQo+PiBCdWlsZHJvb3QgYXV0b2J1aWxkZXJzLgo+Pgo+
PiBTaW5jZSBjc2t5IGlzIG5vdyB1cHN0cmVhbSBpbiBnY2MvYmludXRpbHMgYW5kIHRoZSBjc2t5
IGludGVybmFsIHRvb2xjaGFpbiBpcwo+PiBiYXNlZCBvbiBnY2MgNiwgaXQgd291bGQgbWFrZSBz
ZW5zIHRvIHVwZ3JhZGUgdG8gYW4gdXBzdHJlYW0gdmVyc2lvbi4KPj4KPj4gQ2FuIHlvdSB1cGRh
dGUgdGhlIGNza3kgdG9vbGNoYWluPwo+Pgo+PiBJJ20gbm90IHN1cmUgd2hhdCB3ZSBoYXZlIHRv
IGRvIGZvciB0aGUgdXBjb21pbmcgMjAyMS4wOCByZWxlYXNlLgo+PiBSZW1vdmUgY3NreSBkZWZj
b25maWdzIGFuZCB0aGUgZ2NjIGNza3kgZm9yayAoc2VsZWN0Cj4+IEJSMl9BUkNIX0hBU19OT19U
T09MQ0hBSU5fQlVJTERST09UKT8KPj4gVGhvbWFzLCB3aGF0IGRvIHlvdSB0aGluaz8KPiAKPiAg
SSB0aGluayByZW1vdmluZyB0aGluZ3MgaXMgYSBiaXQgaGVhdnktaGFuZGVkLiBPdXIgQ0kgaXMg
c3RpbGwgcGFzc2luZywgc28gaXQncwo+IG9ubHkgcGVvcGxlIHdobyByZWFsbHkgYnVpbGQgYW5k
IHVzZSBjc2t5IHdobyBzZWUgdGhlIHByb2JsZW0uIEluIGEgc2ltaWxhcgo+IHZlaW4sIEkgdGhp
bmsgaXQncyBPSyB0byBzdGlsbCBhcHBseSB0b29sY2hhaW4gdXBkYXRlcyBmb3IgY3NreSB0aGlz
IGxhdGUgaW4gdGhlCj4gY3ljbGUuCgpUaGUgY3NreSB0b29sY2hhaW4gaXMgc3RpbGwgYnJva2Vu
IHdpdGggcmVjZW50IGhvc3QgY29tcGlsZXIgYW5kIG91ciBDSSB3aWxsCnN3aXRjaCB0byBEZWJp
YW4gYnVsbHNleWUgc29vbi4KCkkgdHJpZWQgdG8gYnVpbGQgd2l0aCB0aGUgbGF0ZXN0IHVwc3Ry
ZWFtIHZlcnNpb24gb2YgYmludXRpbHMsIGdjYyBhbmQgZ2xpYmMgYW5kCm5vdGhpbmcgYnVpbGQu
Cgp1cHN0cmVhbSBnY2MtMTEgZG9lc24ndCBzdXBwb3J0IGNza3k2MTAgYW5kIGNza3k4NjAgbmVl
ZGVkIGZvcgpxZW11X2Nza3k2MTBfdmlydF9kZWZjb25maWcgYW5kIHFlbXVfY3NreTg2MF92aXJ0
X2RlZmNvbmZpZy4KCnFlbXVfY3NreTgwN192aXJ0X2RlZmNvbmZpZyBhbmQgcWVtdV9jc2t5ODEw
X3ZpcnRfZGVmY29uZmlnIGZhaWwgdG8gYnVpbGQgZ2xpYmMKd2l0aCB0aGUgZm9sbG93aW5nIGVy
cm9yOgoKZ2xpYmMtMi4zNC05LWc5YWNhYjBiYmE2YTVhNTczMjNiMWY5NGJmOTViMjE2MThhOWU1
YWE0L2J1aWxkL2VsZi9saWJydGxkLm9zOiBpbgpmdW5jdGlvbiBgX19zeW5jX2ZldGNoX2FuZF9h
ZGRfMic6CgpidWlsZC9ob3N0LWdjYy1pbml0aWFsLTExLjIuMC9idWlsZC9jc2t5LWJ1aWxkcm9v
dC1saW51eC1nbnVhYml2Mi9saWJnY2MvLi4vLi4vLi4vbGliZ2NjL2NvbmZpZy9jc2t5L2xpbnV4
LWF0b21pYy5jOjExNjoKdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19rZXJuZWxfY21weGNoZycK
CkJ1dCBldmVuIGlmIHRoZSBidWlsZCBzdWNjZWVkZWQgdGhlcmUgaXMgbm8gcWVtdSBiaW5hcnkg
dG8gZG8gYSBydW50aW1lIHRlc3QuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiAgUmVnYXJk
cywKPiAgQXJub3V0Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
