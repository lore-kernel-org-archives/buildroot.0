Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EFFCD4F21
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 18:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDAAE80AD3;
	Wed, 13 May 2026 18:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1QewKU51Zap; Wed, 13 May 2026 18:17:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E848B80ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778696243;
	bh=rMCduOBhLGVm0uHkGirsnIqWgCs9tUD1J8at8ni0wF8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VA+kHBQ/J45ZdQqKMiPo1TZ1s340CtMQyaTcQ/XiGZnOgC62lMuGpRW5umbbdj0xu
	 4RCyKCEEvWdITbZneLzOhYERLD3E6vSye/xKxJ8nE/Pb+jUJMCozo63+U6emAomCwI
	 4Ybrf8qeDJZiKC4cXJn1ickZGkn653D/H1tNNRZgSNNoeSRxtC9NSViQIPeUYkfRki
	 NwBDEFU7zwmBUwLi/PmEK/6W7pAWsnsJCtf2NyJOQyMUG9ClvhkpQgp31801hxnFsA
	 Ad+NAJxfVK+ctF9j2BfIA3/ysGBh1PJuT4euy8JpvRhjqs1lSQQjiETiRYnFsoagZj
	 iYNyCXbBUf6mA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E848B80ADA;
	Wed, 13 May 2026 18:17:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B759036F
 for <buildroot@buildroot.org>; Wed, 13 May 2026 18:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 999CF80ADA
 for <buildroot@buildroot.org>; Wed, 13 May 2026 18:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjDXG1xIjhcx for <buildroot@buildroot.org>;
 Wed, 13 May 2026 18:17:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B68D980AD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B68D980AD3
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B68D980AD3
 for <buildroot@buildroot.org>; Wed, 13 May 2026 18:17:20 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-7dcd17e19b6so4066065a34.1
 for <buildroot@buildroot.org>; Wed, 13 May 2026 11:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778696239; cv=none;
 d=google.com; s=arc-20240605;
 b=AQOnk71Vk70nNJR8732Y3w6HF2O3oSaLVcLhBdnk7nCLVELjp+2siL2O3cHMZcEKWX
 rCYc3E+09HXkKvLBYer68hKGr7mzSZIC2TTz5dPlwF9uNWFivNumtuO1H/m9lH8ueJaW
 a3jUVeEU7ZHwBhWE9FH8D5zd3wFZ0LbzuTG//S375miFtAR6IUIbDrrSv2Ym9DMeAzBq
 7t58v4+WmJjhewKVCQZamTQB1jTzCpp8RzBMHAWC+NOJl6LKkmY06lTK+Um+IU/3R1xv
 FzhDQvK+TZbFv5WshVR2ajSTMQ6DRFEFgHoHS+1RfCtVPJAQsfHtPG0caldrxWMuKxH4
 H3vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=55fVMlPyWSXlho+Y9ocnkwyPPV90rIgq7aP69fSqEsU=;
 fh=vqI4HZAeDLA61/B+Lw/9MOP6+wMkwdbrtiLhDiBqY2w=;
 b=d+zWh4Q2fx2sRoKpej9Lxnl8/2u1vun7gvHwX42pPhX2Y9mydCz8QZkvcMnD36/vXu
 fGCzDqnRCP/mkKI/vFg1jMYfMnYoT1JR7IQregyqaz01mrQ+NfWcxjJvrVAEytl4MPGF
 ErqnhIdz9XzJGm3BUxPTZoxqbGYq/qvXNVfS9Yv8z2oWKl8ijvz6U4myM9CKygKKjTpH
 ze0DnpJ7bucGCMMEOfxaDokF8Dh4mvTOEgRT2XUzID4fdPMDRs84NdovBjuNajP1sBfY
 kLuq9UKsVORGuJO8EwNj8qdqjZMipsFRALKjBLr1E9/H0fHa7iZqJc/fixy5SCy4aBYM
 rrBw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778696239; x=1779301039;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=55fVMlPyWSXlho+Y9ocnkwyPPV90rIgq7aP69fSqEsU=;
 b=Fs0dVbL077w7ViRx/odXaqVfio2buXSqlVP6xRLRxLsgZ/QRWIvIX1nK03Tblf4yd/
 FOLxV3qjQQOPoZEl8gS+e6qQEBZ74MYP5LudOAx7L6ZTIogX6B/5zM841mxRVDto9TJ2
 lo3UStx4nGH+XgWrvuxaVLDlwC9mmyBxjUaQ0/sUowJIIEGNI2ARLbqZUQLWNeW8aRIx
 6tM+Gj+bnVUFGK7t+pyOzDNlWLyMe7mnxgKoloflc5Eg0vXcfQQRqzbx/zsArL638UFm
 em4RrS3dyu/VMt5ZsdODpTG6nZeooeDGWDngjJYFsUFSsSLiLfyH8FFwH/6RkDmgopxW
 VG5Q==
X-Gm-Message-State: AOJu0YwIDEa65bX4AQzE2eLz1m93+pWL4t+BSVd2limgt65JIz+bfUCm
 xKOovpn+xdXi5kkT694Cq1v65LMH68TrP8t8LzL6g49sgsX5F/AouJi7kvjjD1FIv2jel2BvTWg
 2yaYm0+9GBiyCbsC04ISkBuOUb1E+74U=
X-Gm-Gg: Acq92OF9rwFyPI/ZHNK50iemE+TDKa0J0VZi6+HxEvPAP6z94y97MsVuYW+sE6fBvPW
 lYvaiJc4Pv4cCZRbxTcJ71Rhvy/wxhfemFmxZ+27DbIMeNiLyMhtrdNwM/DLzouTuyqRGwLullT
 IlsibdzVNVivL/6qhNaAV8Y1CYyEIpCIacr6Y6MW8LbuxOwhuWMUr01WgTRAoVqeLh5yNUFk4w0
 9T23jbpKgXnycBakajGmIq2+L3QsCpgrY6WuytKawEY8wUNPbtvquVeyXqPCKSLb5emiQOlXCwV
 FjgI
X-Received: by 2002:a05:6820:f005:b0:69b:544c:bb94 with SMTP id
 006d021491bc7-69b78d347e5mr2480708eaf.6.1778696239148; Wed, 13 May 2026
 11:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
 <20260512-virglrenderer-v5-5-1806e588eb59@gmail.com>
 <5bd5971c-17c5-4ebb-85d3-3944efb39a7c@smile.fr>
In-Reply-To: <5bd5971c-17c5-4ebb-85d3-3944efb39a7c@smile.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 13 May 2026 11:16:42 -0700
X-Gm-Features: AVHnY4K7aEn5V5MT15BQiQzC8WeGAMrCMl5pw05TNQ4MZ9lYd6mA5ruYXmWHQmc
Message-ID: <CAMWSM7gneUcaExHXk5=O0TwwUUXGpX=c_jdFNB_=TNS5UMJU+g@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778696239; x=1779301039; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=55fVMlPyWSXlho+Y9ocnkwyPPV90rIgq7aP69fSqEsU=;
 b=RWRIujm+0DfNt9dxNxc+ghNNu9uGPrR0a/FShui6a+AkzEp5TdV0Cq1eWQXq5Pdihg
 /73regsaKmS0LmjEKKy5n55Xlu3X8mCLhYOkit88JTDUlqNyTmOy756b13ZImiYfRFci
 +hMkcU0o/vgW21Uib25b3VgAVIR0BDghpbYYGAMMF+NDXaGTBt/M8t0hRNe+VM8y4M9Z
 QNQ7xFq4DtTiNF8FSj+0T3C0Tuzn4QLd3Hh9Qvm342xrnXATyOv74En/LmbpeZClJQf4
 sNZEsfM0X/sI3Yw7XSgljxz0CGu+jbYnAfAtkS/zl7aTUetkfUshXk4V299mNYhQ62dn
 wE4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=RWRIujm+
Subject: Re: [Buildroot] [PATCH RESEND v5 5/5] package/qemu: add
 virglrenderer support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUm9tYWluLAoKT24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMTA6MTfigK9BTSBSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4KPiA+ICtjb25maWcgQlIyX1BB
Q0tBR0VfUUVNVV9WSVJHTFJFTkRFUkVSCj4gPiArICAgICBib29sICJFbmFibGUgdmlyZ2xyZW5k
ZXJlciIKPiA+ICsgICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSEFTX0xJQkVHTCB8fCBCUjJf
UEFDS0FHRV9IQVNfTElCR0wKPiA+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VX09QRU5H
TAo+ID4gKyAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1ZJUkdMUkVOREVSRVIKPgo+IEFsbCB0aGlz
IGVmZm9ydCB0byBidWlsZCB2aXJnbHJlbmRlcmVyIHdpdGhvdXQgZWdsIG9yIGdsIHRvIHVzZSBp
dCAoc2VsZWN0IGl0KQo+IHVuZGVyIGFuIG9wdGlvbiB0aGF0IGRlcGVuZHMgb24gZWdsIG9yIGds
Pwo+Cj4gSSdsbCBoYXZlIGEgc2Vjb25kIGxvb2suCj4KCkluZGVlZCwgdmlyZ2xyZW5kZXJlciBp
cyB1c2VkIGJ5IG1vcmUgdGhhbiBqdXN0IHFlbXUuIEl0J3MgYWxzbyB1c2VkCmJ5IG11dm0vbGli
a3J1biwgYW5kIG90aGVyIFZNTXMgbGlrZSBjcm9zdm0gZm9yIGNvbXB1dGUvZ3JhcGhpY3MuIFRo
ZQpydXRhYmFnYV9nZnggYmFja2VuZCBpbiBxZW11IGNhbiBhbHNvIG9wdGlvbmFsbHkgdXNlIHZp
cmdscmVuZGVyZXIuCgpGb3IgcWVtdSwgdGhlcmUncyBjdXJyZW50bHkgYSBkZXBlbmRlbmN5IG9u
IHRoZSBkaXNwbGF5IGhhdmluZyBHTAplbmFibGVkIHRvIHVzZSB2aXJnbHJlbmRlcmVyIHdpdGgg
dGhlIHZpcnRpby1ncHUgZGV2aWNlLiBJIGJlbGlldmUKdGhpcyBpcyBhIGhpc3RvcmljYWwgcmVs
aWMuIEFzIHRoZSBuYW1lIHN1Z2dlc3RzLCB2aXJnbHJlbmRlcmVyIHdhcwpjcmVhdGVkIHRvIGV4
cG9zZSBhIHZpcnR1YWwgR1BVIHRvIGd1ZXN0cyBnaXZpbmcgdGhlbSBoYXJkd2FyZQphY2NlbGVy
YXRlZCBHTCB0aHJvdWdoIGEgcmVuZGVyZXIgb24gdGhlIGhvc3QuIFRoZXJlZm9yZSwgaXQgd2Fz
CnJlYXNvbmFibGUgZm9yIHRoZSBob3N0J3MgZGlzcGxheSBmcm9udGVuZCB0byBhbHNvIGRlcGVu
ZCBvbiBsaWJHTC4KCkxhdGVyLCB2aXJnbHJlbmRlcmVyIGdyZXcgbW9yZSBjYXBhYmxlLCBnYWlu
aW5nIHN1cHBvcnQgZm9yIFZ1bGthbiwKYW5kIGxhdGVyIGhvc3QgbmF0aXZlIGNvbnRleHQuIFRo
aXMgYWxsb3dlZCBndWVzdHMgdG8gcnVuIHRoZSBNZXNhClVNRHMgZGlyZWN0bHksIHdpdGhvdXQg
YW55IGFzc3VtcHRpb24gb2YgaG9zdCByZW5kZXJpbmcgY2FwYWJpbGl0aWVzLgoKUGF0Y2hlcyBb
MF0gb24gdGhlIHFlbXUtZGV2ZWwgbWFpbGluZyBsaXN0IGFpbSB0byBkZWNvdXBsZQpjb21wdXRl
L3JlbmRlcmluZyBpbiB0aGUgZ3Vlc3QgZnJvbSB0aGUgaG9zdCdzIGRpc3BsYXkgcGlwZWxpbmUu
IFRoaXMKbWVhbnMgd2UgY291bGQgcnVuIHFlbXUgb24gYSBob3N0IHdpdGhvdXQgbGliR0wgYW5k
IHN0aWxsIGRvCmNvbXB1dGUvcmVuZGVyaW5nIGluc2lkZSB0aGUgZ3Vlc3QuCgpQcm9qZWN0cyBs
aWtlIG11dm0gYWxyZWFkeSB3b3JrIHdpdGggaGVhZGxlc3MgZ3JhcGhpY3MvY29tcHV0ZSBpbgpn
dWVzdHMgdGhyb3VnaCB2aXJnbHJlbmRlcmVyLiBUaGlzIGNoYW5nZSBzdXBwb3J0cyB0aGVzZSBr
aW5kcyBvZgphcHBsaWNhdGlvbnMgYW5kIHVzZSBjYXNlcy4KCllvdSBmb2xsb3dlZCB1cCB3aGls
ZSBJIHdhcyBkcmFmdGluZyBteSBvd24gcmVwbHkuIDopCgpPbiBXZWQsIE1heSAxMywgMjAyNiBh
dCAxMTowNuKAr0FNIFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToK
Pgo+IE9rIEkgZ2V0IGl0LCBidWlsZGluZyBsaWJlcG94eSB3aXRob3V0IGVnbCBvciBnbCBkZXBl
bmRlbmN5IG1ha2VzIHNlbnMgd2hpbGUKPiBidWlsZGluZyB3aXRoIG9ubHkgdmVudXMgKHZ1bGth
bikuIGxpYmVwb3h5IGlzIGEgbWFuZGF0b3J5IGRlcGVuZGVuY3kgb2YKPiB2aXJnbHJlbmRlcmVy
IGV2ZW4gaWYgb25seSB2ZW51cyAodnVsa2FuKSBpcyBlbmFibGVkIGluIHRoZSBkZWZjb25maWcu
Cj4KPiBUaGUgQlIyX1BBQ0tBR0VfVklSR0xSRU5ERVJFUl9WRU5VUyBvcHRpb24gaXMgbm90IHVz
ZWQgYnkgUWVtdSBidXQgY291bGQgYmUgdXNlZAo+IGluIGJ5IGFub3RoZXIgcGFja2FnZSBvciBk
ZWZjb25maWcuCgpFeGFjdGx5LCB2aXJnbHJlbmRlcmVyIGFsd2F5cyBkZXBlbmRzIG9uIGxpYmVw
b3h5LCB3aGljaCBjYW4gYmUgYnVpbHQKd2l0aG91dCBHTC9FR0wuIFdlIG1heSB3YW50IHRvIGJ1
aWxkIHZpcmdscmVuZGVyZXIgd2l0aCBWZW51cyBhbmQvb3IKRFJNIHN1cHBvcnQsIHdoaWNoIHdv
dWxkIGVuYWJsZSBndWVzdHMgdG8gZG8gY29tcHV0ZS9yZW5kZXJpbmcgZWl0aGVyCmhlYWRsZXNz
LCBvciBmb3IgZGlzcGxheSBvbiB0aGUgaG9zdCB0aHJvdWdoIFZ1bGthbi4KClRoZSB2aXJnbHJl
bmRlcmVyIHBhY2thZ2UgZGVmYXVsdHMgVmlyR0wgc3VwcG9ydCB0byB5IHdoZW4gbGliR0wgaXMK
cHJlc2VudC4gVGhpcyBpcyB0aGUgY2FzZSB3aGVuIHdlIHNlbGVjdCB2aXJnbHJlbmRlcmVyIHN1
cHBvcnQgaW4KcWVtdSwgYXMgZXhwbGFpbmVkIGFib3ZlLgoKUGVyaGFwcyB3ZSBjb3VsZCBjbGFy
aWZ5IHRoaXMgYnkgZXhwYW5kaW5nIHRoZSBoZWxwIG1lc3NhZ2UgdW5kZXIKcWVtdSdzIHZpcmds
cmVuZGVyZXIgY29uZmlnIHRvIGV4cGxhaW4gdGhhdCB2aXJnbHJlbmRlcmVyIGl0c2VsZiBoYXMK
YWRkaXRpb25hbCBvcHRpb25zLgoKQmVzdCByZWdhcmRzLApKb3NlcGgKClswXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9xZW11LWRldmVsLzIwMjYwMzE3MTgyMDQ5LjMzODQ4LTEtbHVjYWFhbWFy
YWxAZ21haWwuY29tLwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
