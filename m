Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BCDC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 10:30:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A795A61B26
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 10:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A795A61B26
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78DBC841D1;
	Sun,  3 Oct 2021 10:30:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K1S0lr0Z9IhN; Sun,  3 Oct 2021 10:30:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAC9E841D4;
	Sun,  3 Oct 2021 10:30:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D83111BF59F
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 10:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3EB4841D4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 10:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BPRURNaSKAD8 for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 10:30:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D852E841D1
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 10:30:11 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id ba1so52780307edb.4
 for <buildroot@buildroot.org>; Sun, 03 Oct 2021 03:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/2LFNDyMkOPlZZGDURi9cdAoSxmoWKh4LON4l+lylBo=;
 b=AqhzPV6EnvhKWkXfoB3UdB9yhbauk9zw/qcpieoLTUHJX068ZeSBuLcCpYBE1h0sUJ
 wlpi30WpNBD9XO7PW+xvQF71QWqVy+0uWySIGDGUPEuC174k2AUvxx2HPJNHRx292XqG
 od9kwv4LDp+7wo62OPa6cEdMOZZpk3t/y0Ari9RlobNNbFAomRRN/CbaETXH0fOqa6r4
 c5ZkgCJxC0QulQ3u2EXzG7PR/kWqAIMAZhFeZlR4STfrREbAjTb2GCuHUQ+SdiIV+iKO
 QqVLUDKrYMqhqN7yszyU9fF0Xm18uKPJ/IIaLA3jXmFTj73F7EOthBqpB7bBoevmSCok
 HCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/2LFNDyMkOPlZZGDURi9cdAoSxmoWKh4LON4l+lylBo=;
 b=AuL68HRAbK/P1MHkMtbdnPCFal1lv8dLNSnKdrjQCXNrmRipPDsqgrjEexP3l1vc7r
 NMhE3vuzgV23r+Qjpy1qLW8Yg3YE9gyrml+YQKUakVqOvRWk8uDjPLowY8FLPKHJ/ZKm
 hDCt7T4x4qlmqoDFlKadgxR3GfKfmSjoaDq+1ABJbo5Hg1+EGYOWrT6bsHBdbXOHS520
 AMvkD839L8JHBEJw1/VkELZ91tP7DWK8nSHKv3o5fuQnvRK3+6wZpruV2hOYxB3XLc8G
 I5+dTo254f1K28RozUAm4B+ybCoXckUorctXh07Y91SXWY1SigtOBWIEjvJoEx3Wg5ft
 d4Yg==
X-Gm-Message-State: AOAM530r+byvJRd79rBUVhuSFob5SrP239hJwKEOm1XsNLa2K/KoYwfw
 oltIv0nUAj7A9OTSen2wGRIYOLzivbnnqk0p
X-Google-Smtp-Source: ABdhPJytrS5nJATOzmIvU/wifaqzuT8bl1d/uedpAjxbjYPQG6gGLCfSb6cibaaCKv/gpsrzY+jLCw==
X-Received: by 2002:a17:906:1e16:: with SMTP id
 g22mr9602695ejj.471.1633257009695; 
 Sun, 03 Oct 2021 03:30:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id cf16sm5532671edb.51.2021.10.03.03.30.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 03:30:09 -0700 (PDT)
Message-ID: <6dcfa41a-d847-1774-53af-111faaf561ee@mind.be>
Date: Sun, 3 Oct 2021 12:30:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211001125302.386178-1-herve.codina@bootlin.com>
 <20211001152610.1ff12e0c@windsurf> <20211001183539.53c49fdb@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211001183539.53c49fdb@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/lua-augeas: new package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMS8xMC8yMDIxIDE4OjM1LCBIZXJ2ZSBDb2RpbmEgd3JvdGU6Cj4gSGVsbG8sCj4gCj4g
T24gRnJpLCAxIE9jdCAyMDIxIDE1OjI2OjEwICswMjAwCj4gVGhvbWFzIFBldGF6em9uaSA8dGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4gCj4gWy4uLl0KPiAKPj4+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2x1YS1hdWdlYXMvQ29uZmlnLmluIGIvcGFja2FnZS9sdWEtYXVnZWFz
L0NvbmZpZy5pbgo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAwMDAu
LmVkMDdkYTU0MjYKPj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL3BhY2thZ2UvbHVhLWF1Z2Vh
cy9Db25maWcuaW4KPj4+IEBAIC0wLDAgKzEsMTAgQEAKPj4+ICtjb25maWcgQlIyX1BBQ0tBR0Vf
TFVBX0FVR0VBUwo+Pj4gKwlib29sICJsdWEtYXVnZWFzIgo+Pj4gKwlkZXBlbmRzIG9uIEJSMl9Q
QUNLQUdFX0FVR0VBUwo+Pgo+PiBJIHRoaW5rIGEgInNlbGVjdCIgaGVyZSB3b3VsZCBiZSBiZXR0
ZXIuIEkgbG9va2VkIGF0IHNldmVyYWwgb3RoZXIKPj4gcGFja2FnZS9sdWEtKi9Db25maWcuaW4s
IGFuZCBtb3N0IG9mIHRoZSB0aW1lIHdlIHNlbGVjdCB0aGUgbGlicmFyaWVzCj4+IHRoYXQgdGhl
eSBuZWVkLgo+Pgo+PiBPZiBjb3Vyc2UsIGl0IG1lYW5zIHlvdSB3b3VsZCBoYXZlIHRvIHJlcGxp
Y2F0ZSB0aGUgImRlcGVuZHMgb24iIG9mCj4+IHBhY2thZ2UvYXVnZWFzL0NvbmZpZy5pbiwgYnV0
IHRoYXQncyBub3QgYSBiaWcgZGVhbC4KPiAKPiBJIHVzZWQgdGhlIHNhbWUgZGVwZW5kZW5jeSBj
b25zdHJ1Y3Rpb24gYXMgdGhlIG9uZSBwcmVzZW50IGluCj4gcHl0aG9uLWF1Z2VhcyAocHl0aG9u
IGJpbmRpbmcgZm9yIGF1Z2VhcykuCj4gU2FtZSBraW5kIG9mIGJpbmRpbmcsIHNhbWUga2luZCBv
ZiBkZXBlbmRlbmN5Lgo+IAo+IEkgY2FuIGNoYW5nZSB0byAic2VsZWN0IiBoZXJlIGlmIHlvdSBw
cmVmZXIuCgogIFllcywgc2VsZWN0IGlzIHByZWZlcnJlZC4gSSBkb24ndCBrbm93IHdoeSBpdCB3
YXMgbm90IGRvbmUgbGlrZSB0aGF0IGZvciAKcHl0aG9uLWF1Z2Vhcy4KCltzbmlwXQo+IElmIHRo
aXMgbWFrZXMgc2Vuc2UsIEkgY2FuIGFkZCB0aGUgZm9sbG93aW5nIGNvbW1lbnQgaW4gdjI6Cj4g
ICAgTERGTEFHUz0kKExERkxBR1MpIGlzIHByZXNlbnQgdG8gcGFzcyBMREZMQUdTIGZyb20gZW52
aXJvbm1lbnQKPiAgICB0byBjb21tYW5kIGxpbmUuCj4gICAgV2l0aCBMREZMQUdTIGluIGNvbW1h
bmQgbGluZSwgcmVsYXRlZCBvcmRpbmFyeSBhc2lnbm1lbnQgcHJlc2VudAo+ICAgIGluIHRoZSBt
YWtlZmlsZSBhcmUgaWdub3JlZCBhbmQgc28gbHVhLWF1Z2VhcyBtYWtlZmlsZSBjYW5ub3Qgbm90
Cj4gICAgYWRkICctTC9saWInIHRvIHRoaXMgdmFsdWUuCgogIFllcyBwbGVhc2UgYWRkIHRoYXQg
Y29tbWVudC4gSXQgY2FuIGJlIGluIHRoZSBjb21taXQgbWVzc2FnZSBvciBpbiB0aGUgLm1rIApm
aWxlLCB1cCB0byB5b3UuCgoKICBSZWdhcmRzLAogIEFybm91dAoKCj4gCj4gT3IgSSBjYW4gc2lt
cGx5IGFkZCBhIHBhdGNoIHRvIHJlbW92ZSB0aGUgaW5jb3JyZWN0IGxpbmUgaW4gbHVhLWF1Z2Vh
cwo+IG1ha2VmaWxlIGFuZCByZW1vdmUgJ0xERkxBR1M9JChMREZMQUdTKScgZnJvbSBtYWtlIGNv
bW1hbmQgbGluZS4KPiAKPiBXaGljaCBzb2x1dGlvbiBkbyB5b3UgcHJlZmVyID8KPiAKPiAKPj4K
Pj4+ICsJTFVBX1ZFUlNJT049IiQoTFVBSU5URVJQUkVURVJfQUJJVkVSKSIgXAo+Pj4gKwlJTlNU
QUxMX0NNT0Q9Ii91c3IvbGliL2x1YS8kKExVQUlOVEVSUFJFVEVSX0FCSVZFUikiIFwKPj4+ICsJ
TFVBX0NGTEFHUz0iIgo+Pgo+PiBMVUFfQ0ZMQUdTIGlzIG5lZWRlZCA/Cj4gCj4gTm8sIExVQV9D
RkxBR1MgaXMgbm90IG5lZWRlZC4KPiBXaWxsIGJlIHJlbW92ZWQgaW4gdjIuCj4gCj4+Cj4+PiAr
ZGVmaW5lIExVQV9BVUdFQVNfQlVJTERfQ01EUwo+Pj4gKwkkKFRBUkdFVF9NQUtFX0VOVikgJChU
QVJHRVRfQ09ORklHVVJFX09QVFMpICQoTUFLRTEpIC1DICQoQEQpIFwKPj4KPj4gaXMgJChNQUtF
MSkgbmVlZGVkPyBUaGlzIHByb2plY3QgaGFzIGEgc2luZ2xlIEMgc291cmNlIGZpbGUsIGl0IHdv
dWxkCj4+IGJlIGNoYWxsZW5naW5nIHRvIGhhdmUgcGFyYWxsZWwgYnVpbGQgaXNzdWVzLCBubz8K
PiAKPiBDaGFuZ2VkIHRvICQoTUFLRSkKPiAKPj4KPj4+ICsJCSQoTFVBX0FVR0VBU19DT05GX09Q
VFMpIGFsbAo+Pj4gK2VuZGVmCj4+PiArCj4+PiArZGVmaW5lIExVQV9BVUdFQVNfSU5TVEFMTF9U
QVJHRVRfQ01EUwo+Pj4gKwkkKFRBUkdFVF9NQUtFX0VOVikgJChUQVJHRVRfQ09ORklHVVJFX09Q
VFMpICQoTUFLRTEpIC1DICQoQEQpIFwKPj4KPj4gU2FtZSBxdWVzdGlvbiBoZXJlLgo+IAo+IFNh
bWUgY2hhbmdlIDopCj4gCj4+Cj4+PiArCQkkKExVQV9BVUdFQVNfQ09ORl9PUFRTKSBERVNURElS
PSIkKFRBUkdFVF9ESVIpIiBpbnN0YWxsCj4+PiArZW5kZWYKPj4+ICsKPj4+ICskKGV2YWwgJChn
ZW5lcmljLXBhY2thZ2UpKQo+Pgo+PiBUaGFua3MhCj4+Cj4+IFRob21hcwo+IAo+IFRoYW5rcyBm
b3IgdGhlIHJldmlldwo+IAo+IEhlcnbDqQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
