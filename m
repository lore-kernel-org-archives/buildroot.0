Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0176DECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 16:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FA56400B9;
	Tue,  6 Sep 2022 16:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FA56400B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aNnsxa0yuWrN; Tue,  6 Sep 2022 16:54:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A074400C6;
	Tue,  6 Sep 2022 16:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A074400C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 517AD1BF2C5
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 16:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39BCD61025
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 16:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39BCD61025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F9BRpXdLTZzE for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 16:54:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8638861030
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8638861030
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 16:54:41 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t7so11353148wrm.10
 for <buildroot@buildroot.org>; Tue, 06 Sep 2022 09:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=pC2bMoTulqxSPDLH60/2kWtwJEzT5sKLFY3SaUcvaNM=;
 b=BTyAN/vMbB0OJ1BeTVR7/CNbDEMlAUBMg+fye5fmgIHy2LPUElktlpr10ORFio41ad
 NDhZjyBUbQQI/eG7GMFcOrA5nOPsV4rVaqBv0Y7nDllBKd75m8BBvO/lOSV4IBtsMltt
 KdnvgS+VcenUzTYEtCUwW+/cxBYcIhH4rxLoZHu5v3Q9OmME06cFVvPUV5twWei42j47
 dXDW0iWlCUcetcw/ml7WW/p6mRpoMX3XmblsPhAiGFr/SYlLwEiGjM1wK1RUFpaI3V3G
 Fc+bBIBz+95fOwNViFlhiQ3x0pMrdSZ4Chkk56nBVhlmjCxx5bWvDq/BnyAeZl+01Oxf
 qbRA==
X-Gm-Message-State: ACgBeo1V30sbu6twPknl55ulScM97RWmU9NKerHp1hUiy2u08Z5kq7PF
 ZlJ4q2cJmt4tMmB2NfCH3XZ9xA==
X-Google-Smtp-Source: AA6agR76WYiVUR/CIAVDiE1L4DAhMu+aD1iJSBElFYK1wPvwT76KGr/MK116qLNc2MekYhbF1HRCZw==
X-Received: by 2002:adf:ef49:0:b0:225:8602:9a4d with SMTP id
 c9-20020adfef49000000b0022586029a4dmr27038028wrp.221.1662483279731; 
 Tue, 06 Sep 2022 09:54:39 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a05600c3acd00b003a643ac2b08sm14632607wms.8.2022.09.06.09.54.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 09:54:39 -0700 (PDT)
Message-ID: <e1fff70d-b88c-836b-c2fa-597549ac78fc@smile.fr>
Date: Tue, 6 Sep 2022 18:54:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
References: <20220904200409.3153993-1-romain.naour@gmail.com>
 <20220906155656.GG1585594@scaer>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220906155656.GG1585594@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=pC2bMoTulqxSPDLH60/2kWtwJEzT5sKLFY3SaUcvaNM=;
 b=XuKenX+dOgmgcjMxEUHrrEiP2pZk4gs7qbZ4RTdQuWvdI8QgXLT8mTuLOYAWFg7ed0
 i781Xljo2k26le/VMr2BJmCQshE/BFocLozx97YU0asCcFJzBj2nmJ9TmkHTV/vdDfle
 9mvBFQgLIARIoHbtg1Vbu6c3Elk/g3b59E0mk3IZwbTkoLPLNqGQwnXAS0k25SGhr4b3
 0A0D5kCOJMvmAQLuyishRZNxn0jwjm9QsNBPL1/aeNOT/6A8NizfqYbI3TlC5a22BXzh
 1stl8290ZpNiRQpsJsK7Zbm4KVgk+8uidSWYKyjLGJP6dDw8/if3SyZwONAyvomSdyu0
 ar3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=XuKenX+d
Subject: Re: [Buildroot] [PATCH] arch/xtensa: xtensa little endian target
 requires an overlay file
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDYvMDkvMjAyMiDDoCAxNzo1NiwgWWFubiBFLiBNT1JJTiBhIMOpY3JpdMKgOgo+IFJvbWFp
biwgQWxsLAo+IAo+IE9uIDIwMjItMDktMDQgMjI6MDQgKzAyMDAsIFJvbWFpbiBOYW91ciBzcGFr
ZSB0aHVzbHk6Cj4+IFVzaW5nIGEgY3VzdG9tIFh0ZW5zYSBwcm9jZXNzb3IgY29uZmlndXJhdGlv
biBzZWxlY3QgbGl0dGxlIGVuZGlhbgo+PiBieSBkZWZhdWx0LiBCdXQgeHRlbnNhIGZvciBsaXR0
bGUgZW5kaWFuIHJlcXVpcmVzIGFuIHh0ZW5zYSBvdmVybGF5Cj4+IGZpbGUgY29udGFpbmluZyBh
IHZlcnNpb24gb2YgeHRlbnNhLWNvbmZpZy5oIGhlYWRlciBmb3IgZ2NjIHNldHRpbmcKPj4gWENI
QUxfSEFWRV9CRSB0byAwLgo+Pgo+PiBXaGVuIEJSMl9YVEVOU0FfTElUVExFX0VORElBTiBpcyBz
ZWxlY3RlZCwgd2UgaGF2ZSB0byBjaGVjayBpZgo+PiBhbiBvdmVybGF5IGZpbGUgaXMgcHJvdmlk
ZWQuIEVycm9yIG91dCBpZiBCUjJfWFRFTlNBX09WRVJMQVlfRklMRQo+PiBpcyBlbXB0eS4KPiAK
PiBXZWxsLCB3aHkgZG9uJ3Qgd2UgYWx3YXlzIGNoZWNrIGZvciBhbiBvdmVybGF5IHdoZW4gQlIy
X1hURU5TQV9DVVNUT009eT8KPiAKPiBJbmRlZWQsIHdoZXRoZXIgYmlnIG9yIGxpdHRsZSBlbmRp
YW4sIGlmIHRoZSB1c2VyIHNlbGVjdHMgYSBjdXN0b20KPiB4dGVuc2EgY29uZmlndXJhdGlvbiwg
dGhleSBiZXR0ZXIgcHJvdmlkZSB0aGUgb3ZlcmxheSBmb3IgdGhhdAo+IGNvbmZpZ3VyYXRpb24s
IG90aGVyd2lzZSB0aGF0IGRvZXMgbm90IG1ha2Ugc2Vuc2UsIGFuZCB0aGV5IHNob3VsZCBiZQo+
IHVzaW5nIEJSMl94dGVuc2FfZnNmPXkgaW5zdGVhZC4KPiAKPiBTbywgbWF5YmUganVzdCB0aGlz
Cj4gCj4gICAgIGRpZmYgLS1naXQgYS9hcmNoL2FyY2gubWsueHRlbnNhIGIvYXJjaC9hcmNoLm1r
Lnh0ZW5zYQo+ICAgICBpbmRleCBmZDQxMGY2YmZhLi45Y2Y2ZjQ1Njc4IDEwMDY0NAo+ICAgICAt
LS0gYS9hcmNoL2FyY2gubWsueHRlbnNhCj4gICAgICsrKyBiL2FyY2gvYXJjaC5tay54dGVuc2EK
PiAgICAgQEAgLTEwLDYgKzEwLDkgQEAKPiAgICAgICMgICBlbmRpZgo+ICAgICAgIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPiAgICAgIEJSX0FSQ0hfWFRFTlNBX09WRVJMQVlfRklMRSA9ICQoY2Fs
bCBxc3RyaXAsJChCUjJfWFRFTlNBX09WRVJMQVlfRklMRSkpCj4gICAgICtpZmVxICgkKEJSX0JV
SUxESU5HKSQoQlIyX1hURU5TQV9DVVNUT00pOiQoQlJfQVJDSF9YVEVOU0FfT1ZFUkxBWV9GSUxF
KSx5eTopCj4gICAgICskKGVycm9yIE5vIHh0ZW5zYSBvdmVybGF5IGZpbGUgcHJvdmlkZWQuIENo
ZWNrIHlvdXIgQlIyX1hURU5TQV9PVkVSTEFZX0ZJTEUgc2V0dGluZykKPiAgICAgK2VuZGlmCj4g
ICAgICBpZm5lcSAoJChmaWx0ZXIgaHR0cDovLyUgaHR0cHM6Ly8lIGZ0cDovLyUgc2NwOi8vJSwk
KEJSX0FSQ0hfWFRFTlNBX09WRVJMQVlfRklMRSkpLCkKPiAgICAgIEFSQ0hfWFRFTlNBX09WRVJM
QVlfVVJMID0gJChCUl9BUkNIX1hURU5TQV9PVkVSTEFZX0ZJTEUpCj4gICAgICBBUkNIX1hURU5T
QV9PVkVSTEFZX0ZJTEUgPSAkKCQoUEtHKV9ETF9ESVIpLyQobm90ZGlyICQoQlJfQVJDSF9YVEVO
U0FfT1ZFUkxBWV9GSUxFKSkKPiAKPiBUaG91Z2h0cz8KClllcywgdGhhdCBjYW4gYmUgYW4gb3B0
aW9uLgoKQWRkaW5nIE1heCBGaWxpcHBvdiBpbiBDYy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoK
PiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4gCj4+IEZpeGVzOgo+PiBodHRwOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9mMGIvZjBiYTQ3ZDI1MzRhZWIzY2MyOTIxMTI0
YWE2MzlhZTNhYTA3MmI5Ygo+Pgo+PiB4dGVuc2EtYnVpbGRyb290LWxpbnV4LXVjbGliYy9iaW4v
bGQ6IGxkc28vbGRzby9sZC11Q2xpYmNfc28uYShsZHNvLm9TKTogY29tcGlsZWQgZm9yIGEgYmln
IGVuZGlhbiBzeXN0ZW0gYW5kIHRhcmdldCBpcyBsaXR0bGUgZW5kaWFuCj4+Cj4+IFsxXSBodHRw
czovL2djYy5nbnUub3JnL2dpdC8/cD1nY2MuZ2l0O2E9YmxvYjtmPWluY2x1ZGUveHRlbnNhLWNv
bmZpZy5oO2hiPTJlZTVlNDMwMDE4NmE5MmFkNzNmMWExYTY0Y2I5MThkYzc2YzhkNjcjbDI4Cj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4K
Pj4gQ2M6IE1heCBGaWxpcHBvdiA8amNtdmJrYmNAZ21haWwuY29tPgo+PiAtLS0KPj4gIGFyY2gv
YXJjaC5tay54dGVuc2EgfCA4ICsrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FyY2gubWsueHRlbnNhIGIvYXJjaC9hcmNo
Lm1rLnh0ZW5zYQo+PiBpbmRleCBmZDQxMGY2YmZhLi41MTZkNzdiZjkxIDEwMDY0NAo+PiAtLS0g
YS9hcmNoL2FyY2gubWsueHRlbnNhCj4+ICsrKyBiL2FyY2gvYXJjaC5tay54dGVuc2EKPj4gQEAg
LTM0LDMgKzM0LDExIEBAIGRlZmluZSBhcmNoLXh0ZW5zYS1vdmVybGF5LWV4dHJhY3QKPj4gIAkJ
JChBUkNIX1hURU5TQV9PVkVSTEFZX0ZJTEUpIHwgXAo+PiAgCSQoVEFSKSAtLXN0cmlwLWNvbXBv
bmVudHM9MSAtQyAkKDEpICQoVEFSX09QVElPTlMpIC0gJCgyKQo+PiAgZW5kZWYKPj4gKwo+PiAr
IyBCeSBkZWZhdWx0IEdDQyBidWlsZCB4dGVuc2EgZm9yIEJpZyBFbmRpYW4uIFRvIGJ1aWxkIGZv
ciBMaXR0bGUgRW5kaWFuIGEKPj4gKyMgWHRlbnNhIG92ZXJsYXkgZmlsZSBtdXN0IGJlIHByb3Zp
ZGVkLgo+PiAraWZlcSAoJChCUjJfWFRFTlNBX0xJVFRMRV9FTkRJQU4pLHkpCj4+ICtpZmVxICgk
KGNhbGwgcXN0cmlwLCQoQlIyX1hURU5TQV9PVkVSTEFZX0ZJTEUpKSwpCj4+ICskKGVycm9yIE5v
IHh0ZW5zYSBvdmVybGF5IGZpbGUgcHJvdmlkZWQuIENoZWNrIHlvdXIgQlIyX1hURU5TQV9PVkVS
TEFZX0ZJTEUgc2V0dGluZykKPj4gK2VuZGlmCj4+ICtlbmRpZgo+PiAtLSAKPj4gMi4zNC4zCj4+
Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
