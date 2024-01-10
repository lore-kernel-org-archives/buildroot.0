Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B23C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 15:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D944B4171B;
	Wed, 10 Jan 2024 15:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D944B4171B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWQzoFCntaYs; Wed, 10 Jan 2024 15:28:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBB33417FA;
	Wed, 10 Jan 2024 15:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBB33417FA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FB881BF364
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07599436F9
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07599436F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2vYxCfTB9Kwn for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 15:28:34 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EDA3436D9
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 15:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EDA3436D9
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e5701cbbaso4270475e9.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 07:28:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704900512; x=1705505312;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NY8opAwxtrvjqJ1VIEFV6BrQCW/BQUlwuYprCw6Tdok=;
 b=LrlWfD43qJvPRsunfvxzYVDyoPbFuibLnowBF+nJwJs7IwJD0zPyiaMAFejN5lwStQ
 yvLwWV/1WjoDjFc8+uFKBFsGl5GlCImjHQBB6fImwh79w/f7NMYM+NCpOQv0hH+sBgdg
 vpSt8RFIDHlfu6KhEtX6kkKEvnlALBdAjGI+ggetO4gtyG94jMenH/O5v8iPByfacqKT
 cSi13535C8XvNyZWiDN3BFnKQBYs+R+ysQaaF0ex+d1dk1NkIBoewwlDCSz1VpXgwF78
 wYyUdBLIgmSFdjPE58A5Ra3ul2SyH651deQq4u2Et+IX/eZcTE40Brnt2QwP8bSpTtkg
 mjKw==
X-Gm-Message-State: AOJu0YxbBp9OlfwkQ/twMNCHsvkqBOnDdgr7VrqTEuIQ0qOxkO1hGICl
 tCOTknW21rtgH5ccXut1zvmDH81LHf3IJ2ucIyKahteeZhQ=
X-Google-Smtp-Source: AGHT+IGXhCejlpCVSbAXS4ob8HMrk5pIvCibeLOf9p56qaXGND4KcDGnrm6bnW5Hh5gvk8p2pY8mfQ==
X-Received: by 2002:a05:600c:4301:b0:40e:52cb:eed9 with SMTP id
 p1-20020a05600c430100b0040e52cbeed9mr139760wme.51.1704900512475; 
 Wed, 10 Jan 2024 07:28:32 -0800 (PST)
Received: from [10.5.2.57] (176-161-53-116.abo.bbox.fr. [176.161.53.116])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c310b00b0040d5f466deesm2624370wmo.38.2024.01.10.07.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 07:28:32 -0800 (PST)
Message-ID: <60219205-d762-43a6-9d8f-4ab74e3fd6a8@smile.fr>
Date: Wed, 10 Jan 2024 16:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20240101215142.2480384-1-yann.morin.1998@free.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240101215142.2480384-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1704900512; x=1705505312;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NY8opAwxtrvjqJ1VIEFV6BrQCW/BQUlwuYprCw6Tdok=;
 b=jJUQRUpxXf8nHwfjWQekftT2V61rEJ9qMiV6WyIOfpxdmgSZj7Bld1Wk3bTr3M8oIJ
 C5wy2/jNF8K99dmPzop4xvEI60JAhqTkjbipw/0N1R2wbAMK/WaJJuFJ2y+0Z0ON1bC+
 CTb7D+lXTHYetCMgjIliSUDKlNT+1pp1RB7pCLioKUeDMce6jsgvaWrz2jeU0pGreTHH
 FgAyGpmV7Yv47i3nGHk0/Nh1eBtwRW94cA+JOFXZeCWpVwEaGcII3XjeVw4CNw/TO+/v
 UloqwNzFbn8DVu8GSa0RoVovFG3p6JOHK1tGVc1VKGhSRqKAIY2fck8Rs41YWX0aTNkD
 mzew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=jJUQRUpx
Subject: Re: [Buildroot] [PATCH] Revert "support/download: generate even
 more reproducible tarballs"
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>,
 Vincent Fazio <vfazio@xes-inc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCkxlIDAxLzAxLzIwMjQgw6AgMjI6NTEsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiBDb21taXQgNzY4ZjlmODBmNjJjIChzdXBwb3J0L2Rvd25sb2FkOiBnZW5lcmF0ZSBl
dmVuIG1vcmUgcmVwcm9kdWNpYmxlCj4gdGFyYmFsbHMpIGNhdXNlcyBub24tcmVwcm9kdWNpYmls
aXR5IGluIHRhcmJhbGxzIHdlIHByZXZpb3VzeQo+IGdlbmVyYXRlZCwgZXNwZWNpYWxseSB0aGUg
YXJjaGl2ZXMgZm9yIHR3byBjYXJnby12ZW5kb3JlZCBwYWNrYWdlcywKPiByaXBncmVwIGFuZCBz
ZW50cnktY2xpLgo+IAo+IFRoZSBjYXVzZSBpcyB0aGF0IHRob3NlIHR3byBwYWtjYWdlcyBldmVu
dHVhbGx5IHZlbmRvciBhIGZpbGUgdGhhdCBoYXMKPiB0aGUgdSt4IGJpdCBzZXQsIGJ1dCBpcyBv
dGVocndpc2UgZ28teC4gV2l0aCA3NjhmOWY4MGY2MmMsIHRoZSBmaWxlcyBhcmUKPiBub3cgZ28r
eCwgc28gdGhlIGhhc2ggZm9yIHRob3NlIGdlbmVyYXRlZCBhcmNoaXZlcyBoYXMgY2hhbmdlZC4K
PiAKPiBCZXNpZGVzLCB0aGF0IGNvbW1pdCB3YXMgd3Jvbmc6IGl0IGRpZCBub3QgYWNjb3VudCBm
b3IgdGhlICdyJyBiaXQgZm9yCj4gZ28gcGFydCwgbGVhdmluZyBzb21lIG5vbi1yZXByb2R1Y2li
aWxpdHkgc3RpbGwgdW5hY2NvdW50ZWQgZm9yLgo+IAo+IFNvLCB0byBnZW5lcmF0ZSByZWFsbHkg
cmVwcm9kdWNpYmxlIGFyY2hpdmVzLCB3ZSB3b3VsZCBuZWVkIHRvIGZpeCB0aGF0Cj4gcmVhZCBi
aXQgYXMgd2VsbCwgYW5kIHRoYXQgaGFzIHRoZSBwb3RlbnRpYWwgdG8gYWZmZWN0IGFsbCB0aGUg
YXJjaGl2ZXMKPiB3ZSBnZW5lcmF0ZWQgc28gZmFyLiBJZiB3ZSB3YW50ZWQgdG8gZG8gc28sIHdl
J2QgbmVlZCBhIHdheSB0byB2ZXJzaW9uCj4gYWxsIGdlbmVyYXRlZCBhcmNoaXZlcywgbGlrZSB3
ZSBkbyBmb3IgZ2l0IGFuZCBzdm4sIGJ1dCBub3cgZm9yIGFsbCB0aGUKPiBkaWZmZXJlbnQgQ1ZT
ZXMsIGFzIHdlbGwgYXMgZm9yIGFsbCB0aGUgdmVuZG9yaW5nIHBvc3QtcHJvY2Vzc2VzLgo+IAo+
IEZvciA3NjhmOWY4MGY2MmMsIGFsbCB0aGF0IHdhcyBvZiBjb25lcm4gd2FzIHRoZSB3b3JraW5n
IGNvcGllcyBvZiBDVlNlcwo+IChpLmUuIGdpdCwgc3ZuLCBjdnMuLi4pIHRoYXQgd2UgY2FjaGUg
aW4gdGhlIEJ1aWxkcm9vdCBkb3dubG9hZCBkaXIsIG5vdAo+IHRoZSB0ZW1wb3JhcnkgZmlsZXMg
ZHVyaW5nIHBvc3QtcHJvY2Vzc2luZy4gSW5kZWVkLCBpbiB0aGF0IGxhdHRlciBjYXNlLAo+IHRo
ZSB1c2VyIGhhcyB2aXJ0dWFsbHkgbm8gd2F5IHRvIG1hbmdsZSB3aXRoIHRoZSBtb2RlIG9mIHRo
ZQo+IGludGVybWVkaWF0ZSBleHRyYWN0IGJlZm9yZSByZXBhY2suCj4gCj4gQW5kIHdlIGRvIGhh
dmUgYSBiaWcgZmF0IHdhcm5pbmcgdGhhdCB1c2VycyBzaG91bGQgbm90IGF0dGVtcHQgdG8gbWVk
ZGxlCj4gd2l0aCB0aGUgZ2l0IHRyZWUgdGhhdCBCdWlsZHJvb3QgY2FjaGVzLgo+IAo+IEFzIDc2
OGY5ZjgwZjYyYyBob3dldmVyIGRlbW9uc3RyYXRlcywgaXMgdGhhdCBpdCB0b29rIHF1aXRlIGEg
bG9uZyB0aW1lCj4gYmV0d2VlbiB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBnaXQgY2FjaGluZywg
YW5kIHRoZSB0aW1lIHNvbWVvbmUKPiBldmVudHVhbGx5IGRpc2NvdmVyZWQgdGhleSBjb3VsZCBt
ZWRkbGUgaW4gdGhlcmUuIFRoaXMgc2hvd3MgdGhhdCB0aGUKPiBpc3N1ZSBpdCBub3QgYWN0dWFs
bHkgY3JpdGljYWwgaW4gbW9zdCBzZXR1cHMuCj4gCj4gQWxzbywgdGhlIHRhciBtYW51YWwgWzBd
IGhpbnRzIGF0IGEgYmV0dGVyIHNvbHV0aW9uIHRvIGhhbmRsZQo+IHJlcHJvZHVjaWJpbGl0eSwg
d2hpY2ggZXZlbiBhdm9pZHMgdG91Y2hpbmcgdGhlIGZpbGVzIG9uIGRpc2sgd2hpY2ggaXMKPiBl
dmVuIG5pY2VyOgo+IAo+ICAgICDigJgtLW1vZGU9J2dvK3UsZ28tdyfigJkKPiAgICAgICAgIE9t
aXQgaXJyZWxldmFudCBpbmZvcm1hdGlvbiBhYm91dCBmaWxlIHBlcm1pc3Npb25zLgo+IAo+IElm
IHdlIHdlcmUgdG8gYWN0dWFsbHkgaGFuZGxlIHRoZSBtb2RlIGJpdCBmb3IgcmVwcm9kdWNpYmls
aXR5LCB3ZSdkCj4gbmVlZCB0bzoKPiAgIC0gaW50cm9kdWNlIGFyY2hpdmUgdmVyc2lvbmluZyBm
b3IgYWxsIGRvd25sb2FkIGJhY2tlbmRzIGFuZAo+ICAgICBwcm9zdC1wcm9jZXNzaW5nCj4gICAt
IHVzZSB0aGUgdGFyIG9mZmljaWFsbHkgc3VnZ2VzdGVkIG1ldGhvZAo+IAo+IFNvLCByZXZlcnQg
dGhhdCBjaGFuZ2UsIGFzIGl0IHdhcyBpbmNvbXBsZXRlLCB3YXMgbm90IHJlYWxseSBmaXhpbmcg
bXVjaAo+IGlzc3VlcywgYW5kIGNhdXNlcyBhY3R1YWwgaXNzdWVzLgo+IAo+IFRoaXMgcmV2ZXJ0
cyBjb21taXQgNzY4ZjlmODBmNjJjMWRhNmUyOThjNjgwZjBmNGJmYTg4N2YzOGM3OC4KPiAKPiBb
MF0gaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS90YXIvbWFudWFsL3Rhci5odG1sI1JlcHJv
ZHVjaWJpbGl0eQo+IAo+IFRoYW5rcyB0byBWaW5jZW50IGFuZCBBcm5vdXQgZm9yIHBvaW50aW5n
IGF0IHRoZSB0YXIgbWFudWFsLgoKVGVzdGVkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBzbWlsZS5mcj4KClRlc3RlZCB1c2luZyBUZXN0UnVzdFZlbmRvcmluZyBmcm9tIFsxXToKCldp
dGggbWFzdGVyIHRoZSB0ZXN0IGZhaWwgZHVlIHRoZSB3cm9uZyBoYXNoOgoKRVJST1I6IHdoaWxl
IGNoZWNraW5nIGhhc2hlcyBmcm9tIHBhY2thZ2UvcmlwZ3JlcC8vcmlwZ3JlcC5oYXNoCkVSUk9S
OiByaXBncmVwLWFmNmI2YzU0M2IyMjRkMzQ4YTg4NzZmMGMwNjI0NWQ5ZWE3OTI5YzUudGFyLmd6
IGhhcyB3cm9uZyBzaGEyNTYKaGFzaDoKRVJST1I6IGV4cGVjdGVkOiA2ZjFkNGE4YjY1M2NlNDhk
NTlhZDc3NzI4OGIxMjU3Y2JkYTYwN2RiMjlkYjE5ZDAzMWI3ZTYyMmM2MDUyNmY4CkVSUk9SOiBn
b3QgICAgIDogOWQ5NzY5ZTQ1ZmZlNjA4OWY1OGJjMTlmYTM5ZGQ2YjYyOTlhYTBjM2FkOTA1MDhk
MjFkZmEyN2EzZDM0MTZkNQoKV2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQgdGhlIHRlc3QgcGFzcy4K
ClsxXSBodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDIzLURl
Y2VtYmVyLzY4MTc2NS5odG1sCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBSZXBvcnRlZC1i
eTogQW50b2luZSBDb3V0YW50IDxhbnRvaW5lLmNvdXRhbnRAc21pbGUuZnI+Cj4gUmVwb3J0ZWQt
Ynk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4gQ2M6
IFZpbmNlbnQgRmF6aW8gPHZmYXppb0B4ZXMtaW5jLmNvbT4KPiBDYzogQXJub3V0IFZhbmRlY2Fw
cGVsbGUgKEVzc2Vuc2l1bS9NaW5kKSA8YXJub3V0QG1pbmQuYmU+Cj4gLS0tCj4gIHN1cHBvcnQv
ZG93bmxvYWQvaGVscGVycyB8IDMgLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L2Rvd25sb2FkL2hlbHBlcnMgYi9zdXBwb3J0L2Rv
d25sb2FkL2hlbHBlcnMKPiBpbmRleCAyNjU2ODVlZmY1Li45MGE3ZDZjMWVjIDEwMDc1NQo+IC0t
LSBhL3N1cHBvcnQvZG93bmxvYWQvaGVscGVycwo+ICsrKyBiL3N1cHBvcnQvZG93bmxvYWQvaGVs
cGVycwo+IEBAIC01Myw5ICs1Myw2IEBAIG1rX3Rhcl9neigpIHsKPiAgICAgIHRtcD0iJChta3Rl
bXAgLS10bXBkaXI9IiQocHdkKSIpIgo+ICAgICAgcHVzaGQgIiR7aW5fZGlyfSIgPi9kZXYvbnVs
bAo+ICAKPiAtICAgICMgRW5mb3JjZSBncm91cC9vdGhlcnMgbW9kZSBiaXRzCj4gLSAgICBjaG1v
ZCAtUiBnby13eCtYIC4KPiAtCj4gICAgICAjIEVzdGFibGlzaCBsaXN0Cj4gICAgICBmaW5kIC4g
LW5vdCAtdHlwZSBkIC1hbmQgLW5vdCBcKCAtZmFsc2UgIiR7ZmluZF9vcHRzW0BdfSIgXCkgPiIk
e3RtcH0ubGlzdCIKPiAgICAgICMgU29ydCBsaXN0IGZvciByZXByb2R1Y2liaWxpdHkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
