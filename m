Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEA9D132BF
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 13:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 280C1402F7;
	Mon,  4 Nov 2024 13:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5IZ8-Cxqq6TU; Mon,  4 Nov 2024 13:23:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB2174030B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB2174030B;
	Mon,  4 Nov 2024 13:23:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CFD4B8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 13:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18AF5403EB
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 13:23:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2YIP_om0LHu4 for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 13:23:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A170F403FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A170F403FE
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A170F403FE
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 13:23:26 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2fb51f39394so33565901fa.2
 for <buildroot@buildroot.org>; Mon, 04 Nov 2024 05:23:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730726604; x=1731331404;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x+YujVWr5iSmPxGd6wjKIVYaKp7/98HUHXmqy3IRD1E=;
 b=kKBBR/8JQ99Ky+zXG3/mbWA4QlZLdQjHkpQpUhcEnfJOuWw5OdDx7AJ7H1lsHS7hcS
 wbdbsJn62EnRcU287ET19ctbCQdtP3QZtzlWiZcQSeJ02McbioLMJD7SHcaGOkjQ4AhW
 SAs+0F7wmVkP8uvISwSa9pV1+dxws1QDmJ1BTrsObpjrp13Axpj8915XsXjS1lisiSb7
 xRTg0x05cekc89X8t9FSAUzPyflPcCtVFVLG8Tng8duvnz3O7fCKbGEyZZtf+hRPxnYE
 ceit3t4nAUYwAmROMulOY1nI7QbFbSwD9gtQtD6HRHzLSA/1SjPrWTbBeBKnIyrvH0Zw
 eHqA==
X-Gm-Message-State: AOJu0Yx98yAyuqfmxYos/8flCZwFHnMuTh3136LDL/HKHYSIl7FYkIXm
 UrUh8gqeDgn3NAduCqHVrgJD1uq5eZ60F8KXeVHPnsaxFtdbzUlYsp8bx3DN/+63LIDXfNPxYZT
 qGMjeH6lqb+cDUlkCd99C32aitvFA5wu0
X-Google-Smtp-Source: AGHT+IGWtDDXSUvloFnXbbTnBLpy/wqMteB46RMiBsPHMrlc2lqgvNAEfd8KESBr9OytzZzwHDguz3Ue+Ka2J4QgbMI=
X-Received: by 2002:a2e:be20:0:b0:2fb:3a12:a582 with SMTP id
 38308e7fff4ca-2fcbe004c83mr148100591fa.23.1730726603859; Mon, 04 Nov 2024
 05:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20241030002020.73963-1-fancp2007@gmail.com>
 <20241031191844.60ba9a59@windsurf>
 <CAFkzVZbczGknp7uz78yCHo+8aW3RbjQG0ns4fGPv=Gakb02fWw@mail.gmail.com>
In-Reply-To: <CAFkzVZbczGknp7uz78yCHo+8aW3RbjQG0ns4fGPv=Gakb02fWw@mail.gmail.com>
From: Scott Fan <fancp2007@gmail.com>
Date: Mon, 4 Nov 2024 21:23:11 +0800
Message-ID: <CAFkzVZYn43BjDV+ogd=N1MH0d0vO5aYPV3TSPT6Q1sCOoxnmEQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730726604; x=1731331404; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x+YujVWr5iSmPxGd6wjKIVYaKp7/98HUHXmqy3IRD1E=;
 b=bbYWBR3lclyvS5E5lYkcdR8aZvanOgV3LfyxAFmpkjazicdjD/Zv/bpDpn4k4mLQCh
 zp3bJ3vcLnjLTGFnnHiWPwPY8c/xEjdUcmgECYHNdYptDp0Zagz3H7oXztNktYKhLcD2
 wfcaqKg3Z2sfh2Odz4qSYE17H7aZsLAn+w5thOR935SMZwRRC9sUaEVnHXSU+ruJHcs9
 R+RdTNgG3wE91HF0YBXQSmPWEAOJ+pj4QzFK3bV3qktYCG2TZW8jX4vNXVuUh5vR9JSC
 Fr7llKP3KqMKI0LM0Vgb9p2tkrQLoeMizF0R9lepENZ8tdvrUGSOsc9AMbqMRYmlaChX
 1w4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bbYWBR3l
Subject: Re: [Buildroot] [PATCH] package/procps-ng: fix pidfd_open checking
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

SGVsbG8gVGhvbWFzLAoKSSBoYXZlIHRyaWVkIHRvIHN1Ym1pdCBhIG5ldyBwYXRjaCB0byBhdXRv
bWF0aWNhbGx5IGRpc2FibGUgcGlkd2FpdAp3aGVuIHBpZGZkX29wZW4gY2hlY2sgZmFpbHMuCkFu
ZCByZXF1ZXN0ZWQgdGhlIHVwc3RyZWFtIHByb2plY3QncyBtYWludGFpbmVyIHRvIHJldmlldyBp
dC4KCkJ1dCBoZSBzYWlkOgpTaWxlbnRseSBub3QgbWFraW5nIGEgcHJvZ3JhbSBpcyBub3QgaWRl
YWwuIFlvdSBjb3VsZCBydW4gbWFrZSBvbiBhCnN5c3RlbSBhbmQgbm90IGdldCBwaWR3YWl0IGFu
ZCB0aGVuIGEgZmV3IGRheXMgbGF0ZXIgcnVuIHRoZSBzYW1lCmNvbW1hbmQgYW5kIG5vdyBwaWR3
YWl0IGFwcGVhcnMuCkl0IHJlYWxseSBzaG91bGQgYmUgZXhwbGljaXQuCgpTZWU6Cmh0dHBzOi8v
Z2l0bGFiLmNvbS9wcm9jcHMtbmcvcHJvY3BzLy0vbWVyZ2VfcmVxdWVzdHMvMjM2CgpJJ20gc29y
cnkgdG8gZ2V0IHN1Y2ggYW4gdW5zYXRpc2ZhY3RvcnkgYW5zd2VyLgoKClNjb3R0IEZhbgoKT24g
RnJpLCBOb3YgMSwgMjAyNCBhdCA5OjMx4oCvQU0gU2NvdHQgRmFuIDxmYW5jcDIwMDdAZ21haWwu
Y29tPiB3cm90ZToKPgo+IE9uIEZyaSwgTm92IDEsIDIwMjQgYXQgMjoxOOKAr0FNIFRob21hcyBQ
ZXRhenpvbmkKPiA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
U28geW91J3JlIG5vIGxvbmdlciBzZXR0aW5nIC0tZGlzYWJsZS1waWR3YWl0Li4uIGJ1dCB0aGF0
IHdpbGwgY2F1c2UgYQo+ID4gZmFpbHVyZToKPiA+Cj4gPiA+ICsrQVNfSUYoW1t0ZXN0ICJ4JGVu
YWJsZV9waWR3YWl0IiA9IHh5ZXMgLWEgIngkaGF2ZV9waWRmZF9vcGVuIiA9IHhub11dLAo+ID4g
PiArKyAgIEFDX01TR19DSEVDS0lORyhbZm9yIF9fTlJfcGlkZmRfb3Blbl0pCj4gPiA+ICsrICAg
QUNfQ09NUElMRV9JRkVMU0UoW0FDX0xBTkdfU09VUkNFKFsKPiA+ID4gKysjaW5jbHVkZSA8c3lz
L3N5c2NhbGwuaD4KPiA+ID4gKysjaWZuZGVmIF9fTlJfcGlkZmRfb3Blbgo+ID4gPiArKyNlcnJv
ciBfX05SX3BpZGZkX29wZW4gbm90IGRlZmluZWQKPiA+ID4gKysjZW5kaWYKPiA+ID4gKysgICAg
ICBdKV0sCj4gPiA+ICsrICAgICAgQUNfTVNHX1JFU1VMVChbeWVzXSksCj4gPiA+ICsrICAgICAg
QUNfTVNHX1JFU1VMVChbbm9dKQo+ID4gPiArKyAgICAgIEFDX01TR19FUlJPUihbTmVpdGhlciBw
aWRmZF9vcGVuIG9yIF9fTlJfcGlkZmRfb3BlbiBmb3VuZC4gRGlzYWJsZSBwaWR3YWl0IHdpdGgg
Y29uZmlndXJlIG9wdGlvbiAtLWRpc2FibGUtcGlkd2FpdF0pCj4gPgo+ID4KPiA+IC4uLiBoZXJl
Lgo+ID4KPiA+IFNvIEknbSBub3Qgc3VyZSBteSBwcmV2aW91cyByZXZpZXcgd2FzIGNsZWFyIGVu
b3VnaDogd2hhdCBpcyB3cm9uZyBpcwo+ID4gdGhlIHByb2Nwcy1uZyBwYXRjaCBpdHNlbGYsIGl0
IHNob3VsZG4ndCBBQ19NU0dfRVJST1IoKSwgYnV0IGluc3RlYWQgaXQKPiA+IHNob3VsZCBhdXRv
bWF0aWNhbGx5IGRpc2FibGUgcGlkd2FpdCwgYXMgaWYgdGhlIHVzZXIgaGFkIHBhc3NlZAo+ID4g
LS1kaXNhYmxlLXBpZHdhaXQuCj4gPgo+Cj4gSSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4sIGJ1
dCBJIG1heSBub3QgaGF2ZSBleHByZXNzZWQgbXkgdGhvdWdodHMgY2xlYXJseS4KPgo+IEJlZm9y
ZSB0aGlzIHBhdGNoIHdhcyBhcHBsaWVkLCBJIGdvdCBhIGNvbXBpbGUgZXJyb3IgKG5vdCBjb25m
aWd1cmUKPiBlcnJvcikgd2hlbiB0aGUgcGFja2FnZSB3YXMgYnVpbHQgd2l0aCBsaW51eC1oZWFk
ZXJzLTQuMTkuMzIyLAo+IFRoZW4gSSB0cmllZCB0byBmaWd1cmUgb3V0IHdoYXQgd2FzIGdvaW5n
IHdyb25nIGFuZCBJIGV2ZW50dWFsbHkgZm91bmQKPiB0aGlzIHBhdGNoIGZyb20gdXBzdHJlYW0u
Cj4KPiBBZnRlciB0aGlzIHBhdGNoIHdhcyBhcHBsaWVkLCBpdCB0aHJldyBhIGNvbmZpZ3VyZSBl
cnJvciAobm90IGNvbXBpbGUKPiBlcnJvciksIHdoaWNoIGlzIHdoYXQgSSBleHBlY3RlZC4KPgo+
IEFzIHRoZSBwYXRjaCBzYWlkOgo+IFRoZSBwcmV2aW91cyBidWlsZCBzZXR1cCB3b3VsZCBjaGVj
ayBmb3IgcGlkZmRfb3BlbiB1c2luZwo+IEFDX0NIRUNLX0ZVTkMgYW5kIHdvdWxkIGJlIGluY29y
cmVjdGx5IHJlcG9ydGVkIGFzIHRydWUuCj4KPiBUaGVyZWZvcmUsIEkgdGhpbmsgdGhlIGtleSB0
byB0aGlzIHBhdGNoIGlzIHRoYXQgaXQgc3VjY2Vzc2Z1bGx5IGZpeGVzCj4gdGhlIHBpZGZkX29w
ZW4gY2hlY2tpbmcgaXNzdWUuCj4KPiBJZiBwaWRmZF9vcGVuKCkgYW5kIF9fTlJfcGlkZmRfb3Bl
biB3ZXJlIG5vdCBwcmVzZW50LCBpdCB3aWxsIHJlcG9ydAo+IGFuIEFDX01TR19FUlJPUiBtZXNz
YWdlLAo+IGFuZCBnaXZlcyB1cyB0aGUgLS1kaXNhYmxlLXBpZHdhaXQgY29uZmlndXJlIG9wdGlv
biwgc28geW91IGFyZQo+IGV4cGxpY2l0IGluIG5vdCB3YW50aW5nIGFuZCBrbm93aW5nIHlvdSB3
b250IGdldCBwaWR3YWl0Lgo+Cj4gV2hlcmVhcyB5b3UgbWVhbiwgaW5zdGVhZCBvZiBBQ19NU0df
RVJST1IoKSwgaXQgc2hvdWxkIGF1dG9tYXRpY2FsbHkKPiBkaXNhYmxlIHBpZHdhaXQsIGFzIGlm
IHRoZSB1c2VyIGhhZCBwYXNzZWQgLS1kaXNhYmxlLXBpZHdhaXQuCj4gSSdtIG5vdCBzdXJlIGlm
IHRoaXMgaXMgYWNjZXB0YWJsZSB0byB0aGUgdXBzdHJlYW0gbWFpbnRhaW5lcnMsIHdobwo+IHdh
bnQgeW91IHRvIGJlIGNsZWFyIGFib3V0IHRoZSBwdXJwb3NlIG9mIHRoZSBvcHRpb24geW91IHBh
c3NlZC4KPiBFdmVuIGlmIGl0IGlzIGFwcHJvdmVkICwgaXQgd291bGQgcmVxdWlyZSBhIG5ldyBw
YXRjaCB0byBpbXByb3ZlIHRoaXMgYmVoYXZpb3IuCj4KPgo+IFRvIHNvbHZlIG15IGNvbXBpbGF0
aW9uIHByb2JsZW0gKHdpdGggbGludXgtaGVhZGVycy00LjE5LjMyMiksIGluIHRoZQo+IGN1cnJl
bnQgY2FzZSwgSSBoYWQgdG8gcGFzcyB0aGUgLS1kaXNhYmxlLXBpZHdhaXQgb3B0aW9uLgo+IElm
IGF0IHNvbWUgcG9pbnQgaW4gdGhlIGZ1dHVyZSwgd2hlbiB0aGUgcGF0Y2ggeW91IGV4cGVjdCBp
cwo+IHN1Y2Nlc3NmdWxseSBhcHBsaWVkLCBJIHdpbGwgcmVtb3ZlIGl0Lgo+Cj4gU2NvdHQgRmFu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
