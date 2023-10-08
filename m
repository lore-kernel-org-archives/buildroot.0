Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D237E95A82
	for <buildroot@archiver.kernel.org>; Sun,  8 Oct 2023 18:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8B114139E;
	Sun,  8 Oct 2023 18:16:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8B114139E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ah0x0yaA1FoR; Sun,  8 Oct 2023 18:16:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CD1D41740;
	Sun,  8 Oct 2023 18:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CD1D41740
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F16021BF3AD
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 18:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C728660BA1
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 18:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C728660BA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Gz1QYAkqVKv for <buildroot@lists.busybox.net>;
 Sun,  8 Oct 2023 18:16:43 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 995E160B8D
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 18:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 995E160B8D
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9b27bc8b65eso635016566b.0
 for <buildroot@buildroot.org>; Sun, 08 Oct 2023 11:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696789000; x=1697393800;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vd0Gvj4hLaWBQM+7F/Uhzg8o9cQniMLvWs9XMhKSvr4=;
 b=Vyom/j6uJFg5cXhNRN3gq4DNreaWOWIe3Aj5venRXl2CKYmm/pN2bgpmZ1qGKlJv7l
 THT32tp1js0D9PfnXu7h2cqD+gxSuCi8VJ/J2axOV4RKP2GUgDV+AtwhGmFoCEAzIniO
 aalSE2dIShzfjN9rTBCAVCTS/NdibxrUwOYR9K2Y/hUCFmFMtwduxAvIOVlFEJz4/QkF
 cFTWJfqtU1130zwiRaGb0kKXQLSjKZsNUhFAmZ3wQIbHCLbCjQg6SGgP63qauruE+Qd0
 Mngs7KCn9WdS7OLTBRA0S2aXIjPhyzxPqI3iOyllZGGprPaPXbs7EEFou02jEfuDXKz+
 QpgQ==
X-Gm-Message-State: AOJu0YwFek+/C0X+cgM10gPeUI3d3hRQ9/Ia9gRLWXcbzVS2KU+o+D32
 q8w25BNw0ShYPLFQx7yrbY4jwA==
X-Google-Smtp-Source: AGHT+IGx38z567YcxQjCpfpcCIvgct3xhdZm1Slw7ijgwLVT5iz8wCjxoAorR9xrLFm5kjNu/XZN8Q==
X-Received: by 2002:a17:907:9802:b0:9ae:56ad:65a7 with SMTP id
 ji2-20020a170907980200b009ae56ad65a7mr13731593ejc.45.1696789000306; 
 Sun, 08 Oct 2023 11:16:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 gz24-20020a170906f2d800b00985ed2f1584sm5802001ejb.187.2023.10.08.11.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Oct 2023 11:16:39 -0700 (PDT)
Message-ID: <e79b5d32-2992-61f9-e631-189270e7a876@mind.be>
Date: Sun, 8 Oct 2023 20:16:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1672006091.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1672006091.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696789000; x=1697393800; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vd0Gvj4hLaWBQM+7F/Uhzg8o9cQniMLvWs9XMhKSvr4=;
 b=WM3+/BfizPp/XggdL+wkbcrjuR25SuCPKxHDuSQeXWFxiwDcw4p1EBVAdv6dOuwtZz
 exT+gxZycRhyzNLKBZzWGOCwqRX5jFGgqTYyyTpiUeRamqeWTVUu9fDwmJaOXkZr7CzJ
 TwQ620tjbU1Gscsp1z3M+RKbv4hvYm3tjn50rjVCqoNZlftcw5hHTn2BsFuSEpZDPmfn
 nQcY8TzFcPZ4MGcJN8CrWNhYKsMRpSiC2mubs8gcR3J/H0b9doormXn6krPOsC3TWaQb
 QHToJO0Z0qGpCRLtwwLBPOFPNia2TqVuDS4n9j0PEJojmDjUFB7x5y0YJvEGf2mfva9O
 vvCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WM3+/Bfi
Subject: Re: [Buildroot] [PATCH 0/3 v4] system: add option to handle /var as
 an overlayfs with r/o rootfs (branch yem/systemdify-var)
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin@orange.com>,
 =?UTF-8?Q?Je=cc=81re=cc=81my_Rosen?= <jeremy.rosen@smile.fr>,
 Romain Naour <romain.naour@smile.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNS8xMi8yMDIyIDIzOjA4LCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+IEhlbGxvIEFsbCEK
PiAKPiBUaGlzIHRocmVlLXBhdGNoIHNlcmllcyBpbnRyb2R1Y2VzIGFuIGFsdGVybmF0ZSBvcHRp
b24gdG8gaGFuZGxlIC92YXIgYXMKPiBhbiBvdmVybGF5ZnMsIHdoZW4gdXNpbmcgYSByZWFkLW9u
bHkgcm9vdGZzIHdpdGggc3lzdGVtZC4KPiAKPiBUaGUgcmF0aW9uYWxlIGJlaGluZCB3YW50aW5n
IHRvIHVzZSBhbiBvdmVybGF5ZnMgcmF0aGVyIHRoYW4gdGhlIGZhY3RvcnkKPiB3ZSB1c2VkIHRv
IGNyZWF0ZSBzbyBmYXIsIGlzIHRoYXQgaW4gc29tZSBjb3JuZXItY2FzZXMsIHRoZSBmYWN0b3J5
IGRvZXMKPiBub3Qgd29yaywgYW5kIGNhbid0IGVhc2lseSBiZSBmaXhlZCAobWVzbWVyaXNpbmcg
aGFuZC13YXZpbmcuLi4pLCB3aGlsZQo+IHRoZSBvdmVybGF5ZnMgSnVzdC1Xb3Jrc+KEoiAoYXQg
dGhlIGV4cGVuc2Ugb2YgYSBsaXR0bGUgdHJpY2tlcnkgYXQKPiBydW50aW1lKS4KPiAKPiBUaGlz
IHNlcmllcyB3b3VsZCBub3QgaGF2ZSBiZWVuIGVudGlyZWx5IHBvc3NpYmxlIHdpdGhvdXQgdGhl
IGlucHV0IGZyb20KPiBOb3JiZXJ0LCB3aG8gcHJvdmlkZWQgdGhlIGJhc2lzIGZvciB0aGUgb3Zl
cmxheWZzLWJhc2VkIHNvbHV0aW9uLCBhbmQKPiBleHBsYW5hdGlvbnMgb24gaG93IHRoaW5ncyBm
aXQgdG9nZXRoZXIgaW4gYSBzeXN0ZW1kIHN5c3RlbS4gVGhhbmtzIQo+IAo+IENoYW5nZXMgdjMg
LT4gdjQ6Cj4gICAgLSBkcm9wIHBhdGNoZXMgYWxyZWFkeSBhcHBsaWVkCj4gICAgLSBzcGxpdCBt
b3VudGluZyB0aGUgYmFzZSB0bXBmcyBvdXQgb2YgdGhlIHNlcnZpY2UgdW5pdCBhbmQgaW50byBp
dHMKPiAgICAgIG93biAubW91bnQgdW5pdAo+ICAgIC0gcmVuYW1lIHRoZSBzZXJ2aWNlIHVuaXQg
dG8gYSBtb3JlIGFwcHJvcHJpYXRlIG5hbWUKPiAgICAtIHVwZGF0ZSBleHBsYW5hdGlvbnMgb24g
aG9zIHRvIHByb3ZpZGUgb25lJ3Mgb3duIGJhY2tpbmcgc3RvcmUKPiAgICAgIGluc3RlYWQgb2Yg
dGhlIHRtcGZzCj4gCj4gQ2hhbmdlcyB2MiAtPiB2MzoKPiAgICAtIGludHJvZHVjZSB0aGUgb3Zl
cmxheWZzLWJhc2VkIHByb3Bvc2FsIGZyb20gTm9yYmVydAo+ICAgIC0gc29tZSByZXdvcmRpbmcK
PiAgICAtIHNvbWUgdHlwbyBmaXhlcyAoeWFoLCBZYW5uIGJlaW5nIFlhbm4gYmVpbmcgbWUuLi4p
Cj4gCj4gQ2hhbmdlcyB2MSAtPiB2MjoKPiAgICAtIHNwbGl0IFlhbm5Ad29yayBpbml0aWFsIHBh
dGNoIGludG8gdGhlIGZpcnN0IHR3byBwYXRjaAo+ICAgIC0gbW92ZSB0aGUgc3lzdGVtZC10bXBm
aWxlIGhhbmRsaW5nIHRvIHRoZSBza2VsZXRvbgo+ICAgIC0gaW50cm9kdWNlIG9wdGlvbnMgdG8g
ZW5hYmxlL2Rpc2FibGUgZmFjdG9yeSBvciBzeXN0ZW1kLXRtcGZpbGVzCj4gCj4gUmVnYXJkcywK
PiBZYW5uIEUuIE1PUklOLgo+IAo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBZYW5uIEUuIE1PUklOICgzKToKPiAg
ICAgICAgc3lzdGVtOiBpbnRyb2R1Y2UgYSBjaG9pY2UgZm9yIC92YXIgbWFuYWdlbWVudAo+ICAg
ICAgICBzeXN0ZW06IGFkZCBvcHRpb24gdG8gdXNlIGFuIG92ZXJsYXlmcyBvbiAvdmFyIG9uIGEg
ci9vIHJvb3Qgdy8gc3lzdGVtZAo+ICAgICAgICBzdXBwb3J0L3Rlc3Rpbmc6IGFkZCBzeXN0ZW1k
IHRlc3RzIGZvciBmYWN0b3J5IGFuZCBvdmVybGF5ZnMKCiAgU2VyaWVzIGFwcGxpZWQgdG8gbWFz
dGVyLCB0aGFua3MsIHdpdGggYSBudW1iZXIgb2YgbW9kaWZpY2F0aW9uczoKCk9uIHRoZSBvdmVy
bGF5ZnMgcGF0Y2g6CiAgICAgIC0gTWVyZ2UgY29tbWl0IG1lc3NhZ2VzIGZyb20gWWFubiBhbmQg
ZnJvbSBOb3JiZXJ0LgogICAgICAtIFJlbW92ZSB0aGUgcnVuLWJ1aWxkcm9vdC1tb3VudHMtdmFy
Lm1vdW50IHVuaXQ7IGluc3RlYWQsIGp1c3QgcmV1c2UKICAgICAgICB0aGUgZXhpc3RpbmcgdG1w
ZnMgZm9yIHRoZSB1cHBlciBsYXllciBpbiB0aGUgZGVmYXVsdCBjYXNlLgogICAgICAtIFVwZGF0
ZSB0aGUgaGVscCB0ZXh0IHRvIGV4cGxhaW4gaG93IHRvIG1vdW50IGEgY3VzdG9tIHVwcGVyIGxh
eWVyCiAgICAgICAgd2l0aCBmc3RhYi4KCk9uIHRoZSB0ZXN0IHBhdGNoOgogICAgICAtIHVzZSBh
IHNpbXBsZSBtb3VudCB1bml0IGZvcgogICAgICAgIFRlc3RJbml0U3lzdGVtU3lzdGVtZFJvRnVs
bE92ZXJsYXlmc1ZhckJhY2tpbmc7CiAgICAgIC0gY2hhbmdlIHRoZSB0ZXN0IG9mIFRlc3RJbml0
U3lzdGVtU3lzdGVtZFJvRnVsbE92ZXJsYXlmc1ZhckJhY2tpbmcgdG8KICAgICAgICBjaGVjayB0
aGF0IHRoZSBleGFjdCBleHBlY3RlZCBtb3VudCB3YXMgcGVyZm9ybWVkOwogICAgICAtIGFkZCBh
IHRlc3Qgb2YgdmFyIGJhY2tpbmcgd2l0aCBmc3RhYiBpbnN0ZWFkIG9mIG1vdW50IHVuaXQuCgoK
ICBSZWdhcmRzLAogIEFybm91dAoKCj4gCj4gICAuLi4vc2tlbGV0b24taW5pdC1zeXN0ZW1kL3sg
PT4gZmFjdG9yeX0vdmFyLm1vdW50ICB8ICAgMAo+ICAgLi4uL292ZXJsYXlmcy9wcmVwYXJlLXZh
ci1vdmVybGF5LnNlcnZpY2UgICAgICAgICAgfCAgMTkgKysKPiAgIC4uLi9vdmVybGF5ZnMvcnVu
LWJ1aWxkcm9vdC1tb3VudHMtdmFyLm1vdW50ICAgICAgIHwgIDEyICsrCj4gICBwYWNrYWdlL3Nr
ZWxldG9uLWluaXQtc3lzdGVtZC9vdmVybGF5ZnMvdmFyLm1vdW50ICB8ICAxNCArKwo+ICAgLi4u
L3NrZWxldG9uLWluaXQtc3lzdGVtZC9za2VsZXRvbi1pbml0LXN5c3RlbWQubWsgfCAgMjggKyst
Cj4gICAuLi4vdGVzdGluZy9jb25mL292ZXJsYXlmcy1rZXJuZWwtZnJhZ21lbnQuY29uZmlnICB8
ICAgMSArCj4gICAuLi4vcnVuLWJ1aWxkcm9vdC1tb3VudHMtdmFyLm1vdW50LmQvYmFzZS5jb25m
ICAgICB8ICAgMiArCj4gICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvaW5pdC90ZXN0X3N5c3RlbWQu
cHkgICAgICAgICB8IDIwOSArKysrKysrKysrKysrKysrKysrKy0KPiAgIHN5c3RlbS9Db25maWcu
aW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQ4ICsrKystCj4gICA5IGZp
bGVzIGNoYW5nZWQsIDMxMSBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPiAgIHJlbmFt
ZSBwYWNrYWdlL3NrZWxldG9uLWluaXQtc3lzdGVtZC97ID0+IGZhY3Rvcnl9L3Zhci5tb3VudCAo
MTAwJSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3NrZWxldG9uLWluaXQtc3lzdGVt
ZC9vdmVybGF5ZnMvcHJlcGFyZS12YXItb3ZlcmxheS5zZXJ2aWNlCj4gICBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9za2VsZXRvbi1pbml0LXN5c3RlbWQvb3ZlcmxheWZzL3J1bi1idWlsZHJv
b3QtbW91bnRzLXZhci5tb3VudAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc2tlbGV0
b24taW5pdC1zeXN0ZW1kL292ZXJsYXlmcy92YXIubW91bnQKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBzdXBwb3J0L3Rlc3RpbmcvY29uZi9vdmVybGF5ZnMta2VybmVsLWZyYWdtZW50LmNvbmZpZwo+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9pbml0L3N5c3RlbWQt
b3ZlcmxheS91c3IvbGliL3N5c3RlbWQvc3lzdGVtL3J1bi1idWlsZHJvb3QtbW91bnRzLXZhci5t
b3VudC5kL2Jhc2UuY29uZgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
