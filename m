Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2785FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 09:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EDE142372;
	Sun, 24 Jul 2022 09:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EDE142372
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hTWsLY9vjK3x; Sun, 24 Jul 2022 09:52:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44E7941867;
	Sun, 24 Jul 2022 09:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44E7941867
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C8BA71BF2B9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2B6C610B6
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2B6C610B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dPihwiukTbSr for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 09:52:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BDE961004
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BDE961004
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 09:52:37 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id n185so5123639wmn.4
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bzo8C6VcmEXM/paRUvqg04sAQkJ6k8DW3BMJkpoKmbg=;
 b=7Jsk6vmlpZ40qq5+IwAqbfFuTK5r2sZVlJU0BCLH0/w3KZk+QS87Qhq+Tmg9P6mmRz
 han62jYTHWIqiRMZ1Um7/z/VOZIlfYHBY4qjaSxQM5hOYtnCz6oueVqU/rp4HEZMz+Mw
 cqKmu+E3J0A4pqZTwIrJd/kqps6U4S8fA4BlHPdeHdmNYvmy2KTdvz0L04FlwvFovgpD
 nuWfGEjqtYkgDm8aLsOAp8fjugn2GkqxJBGHOOK9jBtA4xsBMOOXT+vUm4LAjvSpLwpP
 9FSBB51SsNf/8t0Tua+uUBGm8c+u7DIGVxTUaQDmpOzzOyUyl68t1YmNbV97P2LId3Zb
 jh0A==
X-Gm-Message-State: AJIora/MEmueExI2mIwiLG/CPUV84CjeprFqTAWDWP0+noRs932WBeyG
 UQF7AAKPgKX1CUtcpN8ojU+kwg==
X-Google-Smtp-Source: AGRyM1sOxiKrNkHVsZRlMJ/2ew2VyuuQffmwrE3ENSfiCotJelfr+k9nErUDkzcyUhFozFLza403rw==
X-Received: by 2002:a05:600c:a02:b0:39d:bdf8:a4f4 with SMTP id
 z2-20020a05600c0a0200b0039dbdf8a4f4mr5085090wmp.201.1658656355090; 
 Sun, 24 Jul 2022 02:52:35 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 e24-20020a05600c219800b003a2cf1535aasm10486431wme.17.2022.07.24.02.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 02:52:34 -0700 (PDT)
Message-ID: <fa1b6f86-9fd4-75d8-bbad-52854a68f9a4@smile.fr>
Date: Sun, 24 Jul 2022 11:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, Abel Bernabeu
 <abel@x-silicon.com>, buildroot@buildroot.org
References: <20220723215448.2532160-1-abel@x-silicon.com>
 <20220723215448.2532160-2-abel@x-silicon.com>
 <815628b4-9584-cc91-1b5a-edc1e2a01c57@smile.fr>
 <02068fad-6ee9-0809-a570-be3efa8f4aea@mind.be>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <02068fad-6ee9-0809-a570-be3efa8f4aea@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bzo8C6VcmEXM/paRUvqg04sAQkJ6k8DW3BMJkpoKmbg=;
 b=2T2QrDwAcS/SODBVtDU2GrPrIXsrfIg4/b+0aBvdcIVmYOoQd/QyYcfR4I8kQOR6OO
 4p8Bv0CcUPHVqPTnoMteo5d6dZz97cbCrGyhSwe1sHr7fyzxrMZyKpqSRr55qWETJi7F
 SaK4sf+ehcQwBrCmIj6kzSteRFdDvU5mp1r5Hujd2AB1d9chYQDzYEeIglX8uzI86I2H
 IIzLZmLQ00JSPjNJmfVgPbRJKSc5bXRi2PC10eVaEOkcLGhFbNb0U69hRJ+lOKulh8kh
 ewVEsD8k99fjjadVmce1leLC/3I/OOfRqspMmkjsMV3/U7dniIbpTvE04ZAF9ZpoWdFZ
 9YTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=2T2QrDwA
Subject: Re: [Buildroot] [PATCH 2/2] arch/riscv: Added support for RISC-V
 vector extension on the architecture menu.
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Mark Corbin <mark@dibsco.co.uk>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMjQvMDcvMjAyMiDDoCAxMToyNSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgYSDDqWNyaXTCoDoK
PiAKPiAKPiBPbiAyNC8wNy8yMDIyIDEwOjA4LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4+IEhlbGxv
IEFiZWwsCj4+Cj4+IExlIDIzLzA3LzIwMjIgw6AgMjM6NTQsIEFiZWwgQmVybmFiZXUgYSDDqWNy
aXTCoDoKPj4+IFRoaXMgbmV3IHNldHRpbmcgd2lsbCBhbGxvdyB0byB0ZXN0IG5ldyB0b29sY2hh
aW5zIGFscmVhZHkgYXZhaWxhYmxlCj4+PiB0aGF0IHN1cHBvcnQgdGhlIHZlY3RvciBleHRlbnNp
b24gKG1vcmUgcGF0Y2hlcyBjb21pbmcgc29vbikuCj4+Cj4+IEl0IHNlZW1zIHRoYXQgaXMgdGhl
IHNhbWUgc2VyaWVzIGFzIHYxOgo+Pgo+PiBodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJv
amVjdC9idWlsZHJvb3QvbGlzdC8/c2VyaWVzPTMwNzg0OCZzdGF0ZT0qCj4+Cj4+IFNlZSAyMi41
LjUuICJQYXRjaCByZXZpc2lvbiBjaGFuZ2Vsb2ciIHNlY3Rpb24gZm9yIGhlbHAuCj4+Cj4+IGh0
dHBzOi8vbmlnaHRseS5idWlsZHJvb3Qub3JnL21hbnVhbC5odG1sI3N1Ym1pdHRpbmctcGF0Y2hl
cwo+Pgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFiZWwgQmVybmFiZXUgPGFiZWxAeC1zaWxpY29u
LmNvbT4KPj4+IC0tLQo+Pj4gwqAgYXJjaC9Db25maWcuaW4ucmlzY3YgfCA3ICsrKysrKysKPj4+
IMKgIGFyY2gvYXJjaC5tay5yaXNjdsKgwqAgfCA0ICsrKysKPj4+IMKgIDIgZmlsZXMgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL0NvbmZpZy5pbi5y
aXNjdiBiL2FyY2gvQ29uZmlnLmluLnJpc2N2Cj4+PiBpbmRleCAyODhlZDgzM2ViLi5lNGRjOTM2
Y2Y4IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9Db25maWcuaW4ucmlzY3YKPj4+ICsrKyBiL2FyY2gv
Q29uZmlnLmluLnJpc2N2Cj4+PiBAQCAtMTgsNiArMTgsOSBAQCBjb25maWcgQlIyX1JJU0NWX0lT
QV9SVkQKPj4+IMKgIGNvbmZpZyBCUjJfUklTQ1ZfSVNBX1JWQwo+Pj4gwqDCoMKgwqDCoCBib29s
Cj4+PiDCoCArY29uZmlnIEJSMl9SSVNDVl9JU0FfUlZWCj4+PiArwqDCoMKgIGJvb2wKPj4+ICsK
Pj4+IMKgIGNob2ljZQo+Pj4gwqDCoMKgwqDCoCBwcm9tcHQgIlRhcmdldCBBcmNoaXRlY3R1cmUg
VmFyaWFudCIKPj4+IMKgwqDCoMKgwqAgZGVmYXVsdCBCUjJfcmlzY3ZfZwo+Pj4gQEAgLTYzLDYg
KzY2LDEwIEBAIGNvbmZpZyBCUjJfUklTQ1ZfSVNBX0NVU1RPTV9SVkQKPj4+IMKgIGNvbmZpZyBC
UjJfUklTQ1ZfSVNBX0NVU1RPTV9SVkMKPj4+IMKgwqDCoMKgwqAgYm9vbCAiQ29tcHJlc3NlZCBJ
bnN0cnVjdGlvbnMgKEMpIgo+Pj4gwqDCoMKgwqDCoCBzZWxlY3QgQlIyX1JJU0NWX0lTQV9SVkMK
Pj4+ICsKPj4+ICtjb25maWcgQlIyX1JJU0NWX0lTQV9DVVNUT01fUlZWCj4+Cj4+IFRoaXMgb3B0
aW9uIG11c3QgZGVwZW5kcyBvbiBnY2MtMTIuCj4gCj4gwqBObywgaXQncyB0aGUgb3RoZXIgd2F5
IHJvdW5kOiBpdCBzaG91bGQgZm9yY2UgR0NDIDEyLCBieSBzZWxlY3RpbmcKPiBCUjJfQVJDSF9O
RUVEU19HQ0NfQVRfTEVBU1RfMTIuCgpJbmRlZWQsIFRob21hcyBjb21tZW50ZWQgb24gdGhpcyB5
ZXN0ZXJkYXkgWzFdCgpbMV0gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L3BpcGVybWFpbC9idWls
ZHJvb3QvMjAyMi1KdWx5LzY0NjY5OC5odG1sCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4g
wqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4gCj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gUm9tYWluCj4+
Cj4+PiArwqDCoMKgIGJvb2wgIlZlY3RvciBJbnN0cnVjdGlvbnMgKFYpIgo+Pj4gK8KgwqDCoCBz
ZWxlY3QgQlIyX1JJU0NWX0lTQV9SVlYKPj4+IMKgIGVuZGlmCj4+PiDCoCDCoCBjaG9pY2UKPj4+
IGRpZmYgLS1naXQgYS9hcmNoL2FyY2gubWsucmlzY3YgYi9hcmNoL2FyY2gubWsucmlzY3YKPj4+
IGluZGV4IGYzYmYyYjM0NjcuLjA3YTk0YWE2YTQgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL2FyY2gu
bWsucmlzY3YKPj4+ICsrKyBiL2FyY2gvYXJjaC5tay5yaXNjdgo+Pj4gQEAgLTI2LDUgKzI2LDkg
QEAgZW5kaWYKPj4+IMKgIGlmZXEgKCQoQlIyX1JJU0NWX0lTQV9SVkMpLHkpCj4+PiDCoCBHQ0Nf
VEFSR0VUX0FSQ0ggOj0gJChHQ0NfVEFSR0VUX0FSQ0gpYwo+Pj4gwqAgZW5kaWYKPj4+ICtpZmVx
ICgkKEJSMl9SSVNDVl9JU0FfUlZWKSx5KQo+Pj4gK0dDQ19UQVJHRVRfQVJDSCA6PSAkKEdDQ19U
QVJHRVRfQVJDSCl2Cj4+PiArZW5kaWYKPj4+ICsKPj4+IMKgIMKgIGVuZGlmCj4+Cj4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
