Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60ABCC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 143F04026F;
	Wed, 28 Feb 2024 21:39:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GltocpLWeY3H; Wed, 28 Feb 2024 21:39:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D0DB403B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D0DB403B8;
	Wed, 28 Feb 2024 21:39:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE3F41BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D788E403B8
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:39:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vcnz-R09uIXM for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:39:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B1494026F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B1494026F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B1494026F
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:39:34 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-412b40e023dso1657955e9.1
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 13:39:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709156373; x=1709761173;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=difSy+6ynAYWNiUjaeYiil2AtLMetppBmfNd7sthLhY=;
 b=aCqscrOYGoGuI+sV+NR9acarj3HaQjU80hfCtpn9KyNPMk6IhMott1xAoDsc+rjRMF
 3Dk5Fo9id/3YZE8WjL4NNuG67MPEnNtm5Cn2iA0fl+x1naCQVEnaUAbPr9QIo4S+Pxwq
 3PE3zP77l0ZmJjtg8rkVKDnlOB+KHlg4Gn2C3T5P06D5vFDvhd8lng+UK/GVxSg5aCzi
 xE8JsUlFTyITf3IdoFGPj3YPZzOo9mJoO9s64zLFknpqvGvC2fY5smb/DxbDUYG1S+X/
 rUEOMU5M7mpR6Na3UVFXbFulwi6OAmbJNRAVeJcf5yJNXKNmYGc32SgoWNqB928+KOVO
 iyEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfaisMitivCtqUpOT4xIeL+WwXMRrodVDwSoQLib7W/eJSf0G3rYuJbqLW24Jb6HAuqxaA9yU/SLxB1CopfEZ5dRR213TSqQ==
X-Gm-Message-State: AOJu0YzeXV37C3thXrhOpFxnmsyvMYW5C/5mNcvUyJpTdx9V+eY1GCYv
 oVtZYDmgz9XPoMKQE3QarJKRZKQnoTAMIZSNNMp5MXNWRt3uwkOCmEMrOUKDgOE=
X-Google-Smtp-Source: AGHT+IHKvQdmUxCnp1nMjvDH9WAe0C/zvjW7r+gsUGHvQdbzAmTJTmOgTIaHVD/R11qqcXFOZkVMtA==
X-Received: by 2002:a05:600c:4e91:b0:412:b6c4:ac21 with SMTP id
 f17-20020a05600c4e9100b00412b6c4ac21mr337092wmq.41.1709156372812; 
 Wed, 28 Feb 2024 13:39:32 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a056000010800b0033d202abf01sm15498866wrx.28.2024.02.28.13.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 13:39:32 -0800 (PST)
Message-ID: <5da91e8f-c095-4f6f-bf96-f3da4bc52162@smile.fr>
Date: Wed, 28 Feb 2024 22:39:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240228181411.10174-1-ju.o@free.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240228181411.10174-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709156373; x=1709761173;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=difSy+6ynAYWNiUjaeYiil2AtLMetppBmfNd7sthLhY=;
 b=1FHtX8zzlM93s5qi6Z8rrX+vg9+iyPGHrOpZ1cJP8cw5wFuIqWXrJy1QE8vndCryam
 yEtDj9fTUvhllUjrwb0aQ0pdt8BeU6TR/TpaJ7A2aMXk47ZfxFR9hpzJDQGbEJNzHzLe
 tCi6YW9E5HcB6lAy/Yi6xZG4yE/XLeMLM8S/eSeF26M6c6/gHd7+c1US8MFy7wv8B6Tg
 j5UWyBolVWvmjUaxPvqjzZ4orq+IkZyL1xUpIO9UAWhdgb3aAxPDkvQZi2ghbQeqX3C5
 6S0qXAWpRlH3sPIeHKkPCA/UARy8jZIpU063KtLz8Pe7/3621XmMaQDTWj5K6sVXfTYl
 Xl8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=1FHtX8zz
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/syslinux: fix build with
 gnu-efi >= 3.0.16
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLAoKTGUgMjgvMDIvMjAyNCDDoCAxOToxNCwgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBDb21taXQgZmE5ODkzYWQ4ZiAicGFja2FnZS9nbnUtZWZpOiBidW1wIHRvIHZl
cnNpb24gMy4wLjE3IiB1cGRhdGVkCj4gZ251LWVmaS4gVGhpcyB1cGRhdGUgaW50cm9kdWNlZCBz
eXNsaW51eCBidWlsZCBmYWlsdXJlLCBhcyByZXBvcnRlZAo+IGluIFsxXS4KPiAKPiBUaGlzIGNv
bW1pdCBhZGRzIGEgcGFja2FnZSBwYXRjaCB0byBmaXggdGhpcyBpc3N1ZS4gRm9yIHRlY2huaWNh
bAo+IGRldGFpbHMgb2YgdGhlIGlzc3VlLCBzZWUgdGhlIHBhY2thZ2UgcGF0Y2ggY29tbWl0IGxv
Zy4KPiAKPiBGaXhlczoKPiAtIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC8tL2pvYnMvNjI1Njg4MDkzNwo+IC0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vam9icy82MjU2ODgwOTQ5Cj4gCj4gWzFdIGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjQtRmVicnVhcnkvNjg1OTcxLmh0bWwK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgoKUmV2aWV3
ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKQmVzdCByZWdhcmRz
LApSb21haW4KCgo+IC0tLQo+IENoYW5nZXMgdjEgLT4gdjI6Cj4gLSBSZW1vdmVkIC5jaGVja3Bh
Y2thZ2VpZ25vcmUgZW50cnkgZm9yIHRoZSBwYXRjaAo+IC0gQWRkZWQgVXBzdHJlYW06IHRhZyB3
aXRoIHVwc3RyZWFtIHByb3Bvc2FsIFVSTCBpbiB0aGUgcGF0Y2gKPiAtLS0KPiAgLi4uc3RkZGVm
LmgtYWRkLXdjaGFyX3QtdHlwZS1kZWZpbml0aW9uLnBhdGNoIHwgNTkgKysrKysrKysrKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgYm9vdC9zeXNsaW51eC8wMDE5LXN0ZGRlZi5oLWFkZC13Y2hhcl90LXR5cGUtZGVmaW5p
dGlvbi5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9ib290L3N5c2xpbnV4LzAwMTktc3RkZGVmLmgt
YWRkLXdjaGFyX3QtdHlwZS1kZWZpbml0aW9uLnBhdGNoIGIvYm9vdC9zeXNsaW51eC8wMDE5LXN0
ZGRlZi5oLWFkZC13Y2hhcl90LXR5cGUtZGVmaW5pdGlvbi5wYXRjaAo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAuLjY1ZDk0NjNhNmY2Cj4gLS0tIC9kZXYvbnVsbAo+
ICsrKyBiL2Jvb3Qvc3lzbGludXgvMDAxOS1zdGRkZWYuaC1hZGQtd2NoYXJfdC10eXBlLWRlZmlu
aXRpb24ucGF0Y2gKPiBAQCAtMCwwICsxLDU5IEBACj4gK0Zyb20gMDYzZGFjNTVjNDVkMDI2NDY3
MWMzNDYzZTgyNGFiNjU5ZTVjYmI4NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTog
SnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiArRGF0ZTogVHVlLCAyNyBGZWIgMjAyNCAy
MTowOToxNSArMDEwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIHN0ZGRlZi5oOiBhZGQgd2NoYXJfdCB0
eXBlIGRlZmluaXRpb24KPiArCj4gK1N5c2xpbnV4IGZhaWwgdG8gYnVpbGQgd2l0aCBnbnUtZWZp
ID49IDMuMC4xNiB3aXRoIGVycm9yOgo+ICsKPiArICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSAv
aG9zdC9pNjg2LWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5jbHVkZS9lZmkvZWZp
Lmg6NDQsCj4gKyAgICAgICAgICAgICAgICAgICAgIGZyb20gL2J1aWxkL3N5c2xpbnV4LTYuMDMv
ZWZpL2VmaS5oOjIzLAo+ICsgICAgICAgICAgICAgICAgICAgICBmcm9tIC9idWlsZC9zeXNsaW51
eC02LjAzL2VmaS9hZHYuaDo0LAo+ICsgICAgICAgICAgICAgICAgICAgICBmcm9tIC9idWlsZC9z
eXNsaW51eC02LjAzL2VmaS9hZHYuYzoyOToKPiArICAgIC9ob3N0L2k2ODYtYnVpbGRyb290LWxp
bnV4LWdudS9zeXNyb290L3Vzci9pbmNsdWRlL2VmaS9pYTMyL2VmaWJpbmQuaDo5MDo5OiBlcnJv
cjogdW5rbm93biB0eXBlIG5hbWUgJ3djaGFyX3QnCj4gKyAgICAgdHlwZWRlZiB3Y2hhcl90IENI
QVIxNjsKPiArICAgICAgICAgICAgIF5+fn5+fn4KPiArCj4gK1RoaXMgaXMgYmVjYXVzZSBnbnUt
ZWZpIHN0YXJ0ZWQgdG8gdXNlIHRoZSAid2NoYXJfdCIgdHlwZSBmcm9tIHRoZQo+ICt0b29sY2hh
aW4ncyA8c3RkZGVmLmg+IGhlYWRlciwgaW4gY29tbWl0IFsxXS4gQmVmb3JlIHRoaXMgY29tbWl0
LAo+ICtnbnUtZWZpIHdhcyBkZWZpbmluZyB0aGUgdHlwZSBhcyAic2hvcnQiLgo+ICsKPiArU3lz
bGludXggaXMgaW5jbHVkaW5nIGl0cyBvd24gbWluaW1hbCBzdGRkZWYuaCBmaWxlLCB3aGljaCBt
YXNrcyB0aGUKPiArb25lIHByb3ZpZGVkIGJ5IHRoZSB0b29sY2hhaW4uIFNlZSBbMl0uIFRoaXMg
ZmlsZSBkb2VzIG5vdCBoYXZlIGEgdHlwZQo+ICtkZWZpbml0aW9uIGZvciAid2NoYXJfdCIuCj4g
Kwo+ICtGaW5hbGx5LCB0aGUgUE9TSVggPHN0ZGRlZi5oPiBoZWFkZXIgaXMgc3VwcG9zZWQgdG8g
cHJvdmlkZSB0aGlzCj4gKyJ3Y2hhcl90IiB0eXBlIGRlZmluaXRpb24uIFNlZSBbM10uCj4gKwo+
ICtUaGlzIGNvbW1pdCBmaXhlcyB0aGUgaXNzdWUgYnkgYWRkaW5nIHRoZSAid2NoYXJfdCIgdHlw
ZSBkZWZpbml0aW9uIGluCj4gK3RoZSBjb20zMi9pbmNsdWRlL3N0ZGRlZi5oIGhlYWRlci4gU2lu
Y2UgU3lzbGludXggaGFzICItZnNob3J0LXdjaGFyIgo+ICtpbiBpdHMgQ0ZMQUdTIChzZWUgWzRd
KSwgIndjaGFyX3QiIGlzIHNpbXBseSBkZWZpbmVkIGFzICJzaG9ydCIuIFRoaXMKPiArYWxzbyBm
b2xsb3cgdGhlIHByZXZpb3VzIGdudS1lZmkgPCAzLjAuMTYgYmVoYXZpb3IuCj4gKwo+ICtUaGlz
IGlzc3VlIHdhcyBzZWVuIGluIEJ1aWxkcm9vdCBMaW51eCwgaW4gWzVdLgo+ICsKPiArWzFdIGh0
dHBzOi8vc291cmNlZm9yZ2UubmV0L3AvZ251LWVmaS9jb2RlL2NpLzE4OTIwMGQwYjBmNmZmZjQ3
M2QzMDI4ODBkOTU2OWY0NWQ0ZDhjNGQKPiArWzJdIGh0dHBzOi8vcmVwby5vci5jei9zeXNsaW51
eC5naXQvYmxvYi9yZWZzL3RhZ3Mvc3lzbGludXgtNi4wMzovY29tMzIvaW5jbHVkZS9zdGRkZWYu
aAo+ICtbM10gaHR0cHM6Ly9wdWJzLm9wZW5ncm91cC5vcmcvb25saW5lcHVicy85Njk5OTE5Nzk5
L2Jhc2VkZWZzL3N0ZGRlZi5oLmh0bWwKPiArWzRdIGh0dHBzOi8vcmVwby5vci5jei9zeXNsaW51
eC5naXQvYmxvYi9yZWZzL3RhZ3Mvc3lzbGludXgtNi4wMzovbWsvZWZpLm1rI2wyNwo+ICtbNV0g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyNC1GZWJy
dWFyeS82ODU5NzEuaHRtbAo+ICsKPiArVXBzdHJlYW06IFByb3Bvc2VkOiBodHRwczovL3d3dy5z
eXNsaW51eC5vcmcvYXJjaGl2ZXMvMjAyNC1GZWJydWFyeS8wMjY5MDMuaHRtbAo+ICtTaWduZWQt
b2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+ICstLS0KPiArIGNvbTMyL2lu
Y2x1ZGUvc3RkZGVmLmggfCAyICsrCj4gKyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
Cj4gKwo+ICtkaWZmIC0tZ2l0IGEvY29tMzIvaW5jbHVkZS9zdGRkZWYuaCBiL2NvbTMyL2luY2x1
ZGUvc3RkZGVmLmgKPiAraW5kZXggZjUyZDYyZjMuLjQzN2IxMWYyIDEwMDY0NAo+ICstLS0gYS9j
b20zMi9pbmNsdWRlL3N0ZGRlZi5oCj4gKysrKyBiL2NvbTMyL2luY2x1ZGUvc3RkZGVmLmgKPiAr
QEAgLTI5LDQgKzI5LDYgQEAKPiArICAqLwo+ICsgI2RlZmluZSBjb250YWluZXJfb2YocCwgYywg
bSkgKChjICopKChjaGFyICopKHApIC0gb2Zmc2V0b2YoYyxtKSkpCj4gKyAKPiArK3R5cGVkZWYg
c2hvcnQgd2NoYXJfdDsKPiArKwo+ICsgI2VuZGlmIC8qIF9TVERERUZfSCAqLwo+ICstLSAKPiAr
Mi40NC4wCj4gKwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
