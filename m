Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B41C46467
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 10:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A69F6060A;
	Tue, 10 Jan 2023 10:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A69F6060A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P8GXjJq421d4; Tue, 10 Jan 2023 10:52:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABFB360DF4;
	Tue, 10 Jan 2023 10:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABFB360DF4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B20531BF294
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 10:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A771405BB
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 10:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A771405BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R2xbwYUyVzmk for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 10:52:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA68C400A6
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA68C400A6
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 10:52:17 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id p17so8333273qvn.1
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 02:52:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6z9StVN0mL6jXJwf0l5I2g9Yya3ICYV/ci6ug3dV7FU=;
 b=RAB5KWiGdg93H6UnvKC6xxGGOZPWaX58QvEQ7afpWRd1BPI6ixe+f39PNjg8QLPzBT
 tgcc4lMGLb1Xjxy+PX1RQ381EBXrS98mxH4dhHhAYbospDS3Guw+t8WUt5faRd4Sh76e
 Sdffe/T3KLlgejzQAx2kfBTbKsMH8Zp8OjbzamA9Pk1SIDfEDN4opUGv9F001RtJJtk2
 FG5sjJ4Rg1EGYtLgQqR7uMRsBC1xYYBa1s/fQeNjdLGlW2fU1vxaOR0o0QaHPjAfYfeA
 4b16Z6egrixFjy+5Jwr67/yOgzHq86XuLxYNU7HflhPiYb+bjkG/qqoLps6du5RY4Iwy
 SKTA==
X-Gm-Message-State: AFqh2kqY337yuw+bW2Kb2X9PiAQG7AKMC6BxUBnLXDeKXNxGTKKmiPqf
 tQ+3SUUEHYhFw4BgLOOO2TXdSmux43Jg7YZ5Kc4=
X-Google-Smtp-Source: AMrXdXunOLmIxs3Hz/ezfx7dTsxACUyQSI4NbghE12MhhjFsywmFGPqRCBm4BTRO+lMR/HNAhMD6aPVchr15M1A8D8k=
X-Received: by 2002:a0c:be83:0:b0:4c7:8888:a5d8 with SMTP id
 n3-20020a0cbe83000000b004c78888a5d8mr4090433qvi.27.1673347936546; Tue, 10 Jan
 2023 02:52:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1672006091.git.yann.morin.1998@free.fr>
 <2f9e844a3580077442585e16a137eb5a9161121e.1672006091.git.yann.morin.1998@free.fr>
 <CADYdroMyvHUSu58zbQc7s64j7LTHtJh0zCWX_xSnZH=ayt59hQ@mail.gmail.com>
 <32427_1673339047_63BD20A7_32427_170_1_20230110082405.GA2889@tl-lnx-nyma7486>
In-Reply-To: <32427_1673339047_63BD20A7_32427_170_1_20230110082405.GA2889@tl-lnx-nyma7486>
From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 10 Jan 2023 11:52:05 +0100
Message-ID: <CADYdroM_XVh=gqHjKdQNW5OXKhKiBEa_gqDtp6fPyGyA3GOqRQ@mail.gmail.com>
To: yann.morin@orange.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6z9StVN0mL6jXJwf0l5I2g9Yya3ICYV/ci6ug3dV7FU=;
 b=RPWI7ctEsNKG1taUl8WkNdiXIx755fzkCGctABIqYuK6Yce3acPLLavVCRpNnf264A
 gF1Q6JAQ+dRQildEvahx2pZn+PMHpDhySOI2ofxrGQzv60x9m60qWnVNG3SX8cIwJHSm
 cbR/vlmbROl9lDse77C6SnrpaBuCHrGbCqPqeqZmwBEy1MPDi7HE7/qnLisnUMjniGzh
 IqjOnHzmkTvfOs7/74J58iB8+dIOMxR78yS8WfdDRcamxHvMtxTYktaMl2/YjNgOjLzO
 28gPT0xE7rwyd0XQshUKdYnPIAuGMV7QSU7AL+gN08jkIs8ZNthURQDHbW2+U4P7upTJ
 qPEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RPWI7ctE
Subject: Re: [Buildroot] [PATCH 1/3 v4] system: introduce a choice for /var
 management
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
Cc: Romain Naour <romain.naour@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gRGkuLCAxMC4gSmFuLiAyMDIzIHVtIDA5OjI0IFVociBzY2hyaWViIDx5YW5uLm1vcmluQG9y
YW5nZS5jb20+Ogo+Cj4gTm9yYmVydCwgQWxsLAo+Cj4gT24gMjAyMy0wMS0wOSAwMDoyMiArMDEw
MCwgTm9yYmVydCBMYW5nZSBzcGFrZSB0aHVzbHk6Cj4gPiBBbSBTby4sIDI1LiBEZXouIDIwMjIg
dW0gMjM6MDggVWhyIHNjaHJpZWIgWWFubiBFLiBNT1JJTgo+ID4gPHlhbm4ubW9yaW4uMTk5OEBm
cmVlLmZyPjoKPiA+ID4gRnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9yYW5nZS5j
b20+Cj4gPiA+Cj4gPiA+IEN1cnJlbnRseSwgd2UgaGF2ZSBhIHNpbmdsZSBzb2x1dGlvbiB0byBo
YW5kbGUgdGhlIC92YXIgY29udGVudCBvbiBhCj4gPiA+IHJlYWQtb25seSByb290IGZpbGVzeXN0
ZW0sIGFuZCB1c2VycyBjYW4gb3B0IG91dCBvZiB1c2luZyBpdC4KPiA+ID4KPiA+ID4gV2UncmUg
Z29pbmcgdG8gaW50cm9kdWNlIGFub3RoZXIgc29sdXRpb24gKGJhc2VkIG9uIGFuIG92ZXJsYXlm
cyksIHdoaWNoCj4gPiA+IGlzIGluY29tcGF0aWJsZSB3aXRoIHVzaW5nIHRoZSBmYWN0b3J5LCBz
byB3ZSdsbCBoYXZlIGEgY2hvaWNlIG9mIHRocmVlCj4gPiA+IG11dHVhbGx5IGV4Y2x1c2l2ZSBv
cHRpb25zLgo+ID4gPgo+ID4gPiBJbnRyb2R1Y2UgdGhhdCBjaG9pY2Ugbm93IHdpdGgganVzdCB0
aGUgZXhpc3RpbmcgL3ZhciBmYWN0b3J5LCBhbmQgYSBuZXcKPiA+ID4gb3B0aW9uIHRvIG9wdCBv
dXQgb2YgaXQuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4u
bW9yaW5Ab3JhbmdlLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFu
bi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4gPiA+IENjOiBOb3JiZXJ0IExhbmdlIDxub2xhbmdlNzlA
Z21haWwuY29tPgo+ID4gPiBDYzogQXJub3V0IFZhbmRlY2FwcGVsbGUgKEVzc2Vuc2l1bS9NaW5k
KSA8YXJub3V0QG1pbmQuYmU+Cj4gPiA+IENjOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBz
bWlsZS5mcj4KPiA+ID4gQ2MgOiBKZcyBcmXMgW15IFJvc2VuIDxqZXJlbXkucm9zZW5Ac21pbGUu
ZnI+Cj4gPiA+IEFja2VkLWJ5OiBOb3JiZXJ0IExhbmdlIDxub2xhbmdlNzlAZ21haWwuY29tPgo+
ID4KPiA+IEhlbGxvIFlhbm4sCj4gPgo+ID4gSSBrbm93IEkgYWxyZWFkeSBhY2tlZCB0aGlzLCBi
dXQuLi4KPgo+IEFzIGxvbmcgYXMgdGhlIHBhdGNoIGhhcyBub3QgYmVlbiBhcHBsaWVkLCBpdCBp
cyBuZXZlciB0b28gbGF0ZSB0bwo+IHByb3ZpZGUgZmVlZGJhY2suIDotKQo+Cj4gPiA+IC0tLQo+
ID4gPiAgc3lzdGVtL0NvbmZpZy5pbiB8IDIyICsrKysrKysrKysrKysrKysrKystLS0KPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gPgo+
ID4gPiBkaWZmIC0tZ2l0IGEvc3lzdGVtL0NvbmZpZy5pbiBiL3N5c3RlbS9Db25maWcuaW4KPiA+
ID4gaW5kZXggODA2YTc0NzMxNS4uODdkZjAzMTU0NSAxMDA2NDQKPiA+ID4gLS0tIGEvc3lzdGVt
L0NvbmZpZy5pbgo+ID4gPiArKysgYi9zeXN0ZW0vQ29uZmlnLmluCj4gPiA+IEBAIC0xNTYsMTAg
KzE1NiwxNiBAQCBlbmRjaG9pY2UKPiA+ID4KPiA+ID4gIGlmIEJSMl9JTklUX1NZU1RFTUQKPiA+
ID4KPiA+ID4gLWNvbmZpZyBCUjJfSU5JVF9TWVNURU1EX1ZBUl9GQUNUT1JZCj4gPiA+IC0gICAg
ICAgYm9vbCAiYnVpbGQgYSBmYWN0b3J5IHRvIHBvcHVsYXRlIGEgdG1wZnMgb24gL3ZhciIKPiA+
ID4gLSAgICAgICBkZWZhdWx0IHkgICMgbGVnYWN5Cj4gPiA+ICtjaG9pY2UKPiA+ID4gKyAgICAg
ICBib29sICIvdmFyIG1hbmFnZW1lbnQiCj4gPiA+ICsgICAgICAgZGVmYXVsdCBCUjJfSU5JVF9T
WVNURU1EX1ZBUl9GQUNUT1JZICAjIGxlZ2FjeQo+ID4gPiAgICAgICAgIGRlcGVuZHMgb24gIUJS
Ml9UQVJHRVRfR0VORVJJQ19SRU1PVU5UX1JPT1RGU19SVwo+ID4KPiA+IENvbnNpZGVyIHRoYXQg
dGhlIG9wdGlvbiBpcyB1c2VkIHRvICpyZW1vdW50KiB0aGUgZmlsZXN5c3RlbSwKPiA+IGJ1dCB5
b3UgY291bGQgbW91bnQgdGhlIGZpbGVzeXN0ZW0gcmVhZC13cml0ZSwgaW4gd2hpY2ggY2FzZSB5
b3UKPiA+IHByb2JhYmx5ICpkb250IHdhbnQqIHNvbWUgc3BlY2lmaWMgdmFyIGhhbmRsaW5nLgo+
Cj4gU29ycnksIEkgYW0gbm90IHN1cmUgSSBmb2xsb3dlZCB5b3UgdGhlcmUuIERpZCB5b3UgbWVh
biAicGFzc2luZyAncncnIG9uCj4gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUiLCAiZGlyZWN0bHkg
bW91bnRpbmcgci93IGZyb20gYW4gaW5pdHJkIiwgb3IKPiBzb21ldGhpbmcgYWxvbmcgdGhvc2Ug
bGluZXM/CgpZZXMsIGJhc2ljYWxseSBubyByZW1vdW50IG5lY2Vzc2FyeSwgdGhlIG9wdGlvbiBz
ZWVtcyB0byBhc3N1bWUgdGhhdAp0aGUgcm9vdGZzIGlzIGFsd2F5cyBtb3VudGVkIHJvIGJlZm9y
ZSBzeXN0ZW1kIHRha2VzIG92ZXIsCndoaWNoIG1pZ2h0IG5vdCBiZSB0aGUgY2FzZSBmb3IgbXVs
dGlwbGUgcmVhc29ucy4KCj4KPiA+IFNvIG1heWJlOgo+ID4KPiA+IGRyb3AgICdkZXBlbmRzIG9u
ICFCUjJfVEFSR0VUX0dFTkVSSUNfUkVNT1VOVF9ST09URlNfUlcnCj4gPgo+ID4gaWYgIUJSMl9U
QVJHRVRfR0VORVJJQ19SRU1PVU5UX1JPT1RGU19SVwo+ID4gbWFrZSB0aGUgZGVmYXVsdCBCUjJf
SU5JVF9TWVNURU1EX1ZBUl9GQUNUT1JZCj4gPiBvdGhlcndpc2UKPiA+IG1ha2UgdGhlIGRlZmF1
bHQgQlIyX0lOSVRfU1lTVEVNRF9WQVJfTk9ORQo+ID4KPiA+IEkgYmVsaWV2ZSB0aGUgY2hvaWNl
IHNob3VsZCBiZSBhbHdheXMgdGhlcmUuCj4KPiBUaGlzIGNoYW5nZSBpcyBtZWFudCBzbyB0aGF0
IHRoZSBiZWhhdmlvdXIgYnkgZGVmYXVsdCBkb2VzIG5vdCBjaGFuZ2UuCj4gUHJldmlvdXNseSwg
b3VyIC92YXIgZmFjdG9yeSB3YXMgYWx3YXlzIGNyZWF0ZWQgd2hlbiwgYW5kIG9ubHkgY3JlYXRl
ZAo+IHdoZW4sIEJSMl9UQVJHRVRfR0VORVJJQ19SRU1PVU5UX1JPT1RGU19SVyB3YXMgbm90IHNl
dC4KPgo+IFNvLCB0aGlzIG5ldyBjaG9pY2UgcmVmbGVjdHMgdGhhdC4gU2luY2UgdGhlIG9ubHkg
b3B0aW9uIGFwYXJ0IGZyb20gdGhlCj4gL3ZhciBmYWN0b3J5LCBpcyB0byBkbyBub3RoaW5nLCB0
aGVyZSBpcyBubyBwb2ludCBpbiBleHBvc2luZyB0aGUgY2hvaWNlCj4gYWx0b2dldGhlci4KPgo+
IElmIHdlIHdhbnQgdG8gYWx3YXlzIGV4cG9zZSB0aGUgY2hvaWNlLCB0aGVuIEkgYmVsaWV2ZSB0
aGlzIHNob3VsZCBiZQo+IGRvbmUgaW4gYSBkaWZmZXJlbnQgcGF0Y2guIEF0IHdoaWNoIHBvaW50
IHdlIGNvdWxkIGRvIGFzIHlvdSBzdWdnZXN0LgoKT2ssIHRob3VnaCBJIGRvbnQgdW5kZXJzdGFu
ZCB0aGUgcmVhc29uaW5nIGZvciB0aGUgc3BsaXQuCldpdGggb3Igd2l0aG91dCB0aG9zZSBtb2Rp
ZmljYXRpb25zIChzdWJtZW51IGFsd2F5cyBhdmFpbGFibGUgb3IgY29uZGl0aW9uYWwpLAp0aGUg
YmVoYXZpb3IgaXMgdGhlIHNhbWUgYXMgYmVmb3JlICpmb3IgZXhpc3RpbmcgY29uZmlncyo/Cgo+
IE5vdGUgdGhhdCBJIGFtIG5vdCB0b28gZm9uZCBvZiBCUjJfVEFSR0VUX0dFTkVSSUNfUkVNT1VO
VF9ST09URlNfUlcgdG8KPiBiZWdpbiB3aXRoLCBiZWNhdXNlIGl0cyBzZW1hbnRpY3MgYXJlIG5v
dCB2ZXJ5IHN0cm9uZy4KPgo+IEZpcnN0LCBpdCBpcyBwb3NzaWJsZSB0byBzZWxlY3QgaXQsIGV2
ZW4gdGhvdWdoIHRoZSByb290ZnMgd2lsbCBiZSBieQo+IGRlc2lnbiByZWFkLW9ubHkgKGUuZy4g
c3F1YXNoZnMpLCBzbyBpdCBkb2VzIG5vdCBtYWtlIHNlbnNlIHRvIHNldAo+IEJSMl9UQVJHRVRf
R0VORVJJQ19SRU1PVU5UX1JPT1RGU19SVz15IGluIHRoYXQgY2FzZS4KPgo+IFNlY29uZCwgYXMg
eW91IG1lbnRpb25lZCBhYm92ZSwgaXQgaXMgYWxzbyBwb3NzaWJsZSB0aGF0IHRoZSByb290ZnMg
aXMKPiBydywgZWl0aGVyIGJlY2F1c2Ugb2YgdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUsIG9yIGJl
Y2F1c2Ugb2YgYW4gaW5pdHJkCj4gdGhhdCBhcnJhbmdlZCBmb3IgaXQgdG8gYmUgcncgKGUuZy4g
YnkgYWN0dWFsbHkgbW91bnRpbmcgcncgYSBydy1jYXBhYmxlCj4gZnMsIG9yIGJ5IG1vdW50aW5n
IGEgcnctY2FwYWJsZSBvdmVybGF5ZnMgb3ZlciBhbiBvdGhlcndpc2Ugcm8KPiBmaWxlc3lzdGVt
KSwgYWxsIHdpdGhvdXQgc2V0dGluZyBCUjJfVEFSR0VUX0dFTkVSSUNfUkVNT1VOVF9ST09URlNf
Ulc9eS4KPgo+IFNvLCB1bHRpbWF0ZWx5LCBJIGFncmVlIHRoYXQgd2Ugc2hvdWxkIHN0b3AgdXNp
bmcKPiBCUjJfVEFSR0VUX0dFTkVSSUNfUkVNT1VOVF9ST09URlNfUlcgdG8gZGlzY3JpbWluYXRl
IGJldHdlZW4gcnVubmluZyBvbgo+IGEgcncgb3Igcm8gcm9vdGZzLCBidXQgc28gZmFyIHRoYXQn
cyB0aGUgYmVzdCB3ZSBoYXZlLi4uIEFuZCBhZ2FpbiwgaXQKPiBrZWVwcyB0aGUgZGVmYXVsdCB0
aGUgc2FtZSBhcyBwcmV2aW91c2x5LgoKV2VsbCwgaWYgeW91IHBsYW4gb24gY2hhbmdpbmcgaXQg
bGF0ZXIsIHdvdWxkbid0IGl0IGJlIGJldHRlciB0byBub3QKZGVwZW5kIG9uIGl0LApidXQgYWx3
YXlzIGhhdmUgdGhlIHNwZWNpZmljIEJSMl9JTklUX1NZU1RFTURfVkFSXyogaW4geW91ciBjb25m
aWc/CgpSZWdhcmRzLCBOb3JiZXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
