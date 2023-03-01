Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48153C64ED6
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 08:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D433F40C95;
	Wed,  1 Mar 2023 08:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D433F40C95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lXUAMMSniXWO; Wed,  1 Mar 2023 08:57:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1255B4058E;
	Wed,  1 Mar 2023 08:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1255B4058E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5449F1BF859
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 08:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2644360597
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 08:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2644360597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x-21bu0UF-4L for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 08:57:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D286560594
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D286560594
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 08:57:39 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id d10so7269075pgt.12
 for <buildroot@buildroot.org>; Wed, 01 Mar 2023 00:57:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677661059;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uQ4BQSICBoZajfhxxpp3SI57+Kp2yih8Z4paJEAMdgQ=;
 b=VXEO2fes+bFo7WNkO8NewvdGKmTCbpP5pkN01WYjkXNNTkvTpfC5nwGIRFEpiuE1WR
 4x+JxlZxExGw/FoEYkMILS5GrMC4wQFWnjWDhoX/N0nG9gAiMcPviG4CQcdgREzgpdU8
 FpSiIYiCSooLIsleShD5+5X308Pv99wnORMIoFc5/FSiMLmQxs7Np4szRMuvStUnqJFd
 fv/gTzYH+gYFoluPtC6eZJn0itoDmbaqGij809ldLegI3Yfiv6r574K7/4AZt6zqtYXg
 rv+4NYSIgatm+ihZzXVRS7d3ZQwYOruGFuEq4bSY8OIFIucqC68YgK0OCQqkp8e2qvuj
 J4CQ==
X-Gm-Message-State: AO0yUKXTVSidHvTe32hREDRXlMEPBrtrkyuAXNJAR5IKRD8Uq2PbWpgY
 KrPvmTTU8x+wtJYerS77WiNFvo5yEoYBHfQmJlNpew==
X-Google-Smtp-Source: AK7set9b3Pz1uY3+y0hNZQ5wYgSiOpljwEpKXX/LtaLO+0EwXlX1uDmHIqfyjSN8Kqfz/SJXNqdnDUhdCfCidOVDvSk=
X-Received: by 2002:a62:c582:0:b0:5e5:7675:88e3 with SMTP id
 j124-20020a62c582000000b005e5767588e3mr2109445pfg.5.1677661059202; Wed, 01
 Mar 2023 00:57:39 -0800 (PST)
MIME-Version: 1.0
References: <20221224171920.11256-1-raphael.pavlidis@gmail.com>
 <20230222232157.380b6109@windsurf>
 <20230228130843.GC32199@carcass.dev.6wind.com>
 <CANqv2T3GWoqn6an34HQUW6njK2g=YZCqvoDMh-kfKooVacRMpA@mail.gmail.com>
 <886d6be9-94ba-2bc9-5583-4c9400bf3a76@gmail.com>
 <CANqv2T2r0sbnwdMinzdw7ryw9CUsx=jwCD0hvA3FT2mxVFQz8g@mail.gmail.com>
 <CANqv2T0Riojve2sNUNky28Vt8A=sMwVuZEsTZv66Zace1JnRWA@mail.gmail.com>
 <16816a3d-c62a-c1e9-9409-78541956b1ba@gmail.com>
 <CANqv2T2odbOu-B-ErOUA+07sdMPEWc8-T695zqumrB-wT6gmXg@mail.gmail.com>
In-Reply-To: <CANqv2T2odbOu-B-ErOUA+07sdMPEWc8-T695zqumrB-wT6gmXg@mail.gmail.com>
From: stephane gonauer <stephane.gonauer@6wind.com>
Date: Wed, 1 Mar 2023 09:57:28 +0100
Message-ID: <CANqv2T3_VzUCxFaBYpFj=mp7Tm=RXQ5nFSNPr_nWDa44KBQKSw@mail.gmail.com>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=6wind.com; s=google; t=1677661059;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uQ4BQSICBoZajfhxxpp3SI57+Kp2yih8Z4paJEAMdgQ=;
 b=kAlenSLe0z74axP/F1p9Ge6Cmd91N52eKwCIPpoEaHvl3H8p+BkBGNcWqwnb5D1vHv
 95pddQLCovTLQYoxknh0FE4mQJHl4RmV4IeT2HnZYoyqyaF+25ssqlTGns96eEp8jvPW
 NBiBNU4oSUs+JOU61M9CCIL+kfH5PyfgEM/LZNzRpuSw0/5Jfrh5/oXx2zWV++45uZUe
 abzmrxur1maNT6oUGsfkE4NKKnKKk14JSDnKf7t92uO+EFkswLeT/EAwPbGtoCC5/nOk
 RYHFc/BccTwfBB2u/SP13MMR7+fHH/EFqO4kA2qdgPnzVFY9NvOwpwTdnWVqgDQCqM1O
 Y12g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com
 header.a=rsa-sha256 header.s=google header.b=kAlenSLe
Subject: Re: [Buildroot] [PATCH v4 1/1] package/shadow: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUmFwaGFlbCwKCkkndmUgYWxzbyBub3RpY2VkIHRoYXQgQlIyX1BFUl9QQUNLQUdFX0RJUkVD
VE9SSUVTIGludHJvZHVjZXMKcmFuZG9tbmVzcyBpbiB0aGUgY29udGVudCBvZiAvZXRjL3BhbS5k
CgpXaGVuIGVuYWJsZWQgbG9naW4gd29ya3MgYmVjYXVzZSAvZXRjL3BhbS5kIG1vc3RseSBjb250
YWlucyB0aGUKZXRjL3BhbS5kIGZyb20gQlIyX1BBQ0tBR0VfTElOVVhfUEFNIGJlY2F1c2UgdGhl
eSB3ZXJlIGNvcGllZCBpbnRvCmJ1c3lib3ggdGhlbiBpbnRvIHRoZSB0YXJnZXQuCgpTbyBhbGwg
dGVzdHMgc2hvdWxkIGJlIGRvbmUgd2l0aHRvdXQgQlIyX1BFUl9QQUNLQUdFX0RJUkVDVE9SSUVT
IHRvCmhhdmUgYSBtb3JlIHJlcHJvZHVjdGlibGUgZW52aXJvbm1lbnQuCgpTdMOpcGhhbmUKCkxl
IG1lci4gMSBtYXJzIDIwMjMgw6AgMDg6NDMsIHN0ZXBoYW5lIGdvbmF1ZXIKPHN0ZXBoYW5lLmdv
bmF1ZXJANndpbmQuY29tPiBhIMOpY3JpdCA6Cj4KPiBIaSBSYXBoYWVsLAo+Cj4gVGVzdGluZyB3
aXRoIHFlbXUgaXMgcHJldHR5IGVhc3kKPiBIZXJlIGFyZSB0aGUgc3RlcCBJIGZvbGxvdyA6Cj4K
PiBnaXQgY2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL2J1aWxkcm9vdC9idWlsZHJvb3QuZ2l0Cj4g
Y2QgYnVpbGRyb290Cj4gZ2l0IGNoZWNrb3V0IC10IG5leHQKPiBtYWtlIHFlbXVfeDg2XzY0X2Rl
ZmNvbmZpZwo+IG1ha2UgbWVudWNvbmZpZyA8PSB0byBhZGQgU0hBRE9XL0xJTlVYX1BBTSBldGMK
PiBtYWtlIC1qOAo+IC4vb3V0cHV0L2ltYWdlcy9zdGFydC1xZW11LnNoCj4KPiBUaGUgc2NyaXB0
IHN0YXJ0cyBhIHZtIHdpdGggYSBzZXJpYWwgY29uc29sZSBhbmQgaXQgaXMgcGFydCBvZiB0aGUK
PiBidWlsZHJvb3QgcmVwby4KPgo+IFRoZW4gZWl0aGVyIEkgY2FuIGxvZ2luIChyb290IHdpdGhv
dXQgcGFzc3dvcmQpIG9yIG5vdAo+Cj4gU3TDqXBoYW5lCj4KPiBMZSBtYXIuIDI4IGbDqXZyLiAy
MDIzIMOgIDIxOjM4LCBSYXBoYWVsIFBhdmxpZGlzCj4gPHJhcGhhZWwucGF2bGlkaXNAZ21haWwu
Y29tPiBhIMOpY3JpdCA6Cj4gPgo+ID4gSGkgU3RlcGhhbmUsCj4gPgo+ID4gT24gMjguMDIuMjMg
MTg6MTAsIHN0ZXBoYW5lIGdvbmF1ZXIgd3JvdGU6Cj4gPiA+IEhpLAo+ID4gPgo+ID4gPiBJZiBt
eSBwcmV2aW91cyBlbWFpbCBpcyBub3QgY2xlYXIgOgo+ID4gPgo+ID4gPiAtIHFlbXVfeDg2XzY0
X2RlZmNvbmZpZyArIEJSMl9QQUNLQUdFX1NIQURPVyAtPiB3b3Jrcwo+ID4gPiAtIHFlbXVfeDg2
XzY0X2RlZmNvbmZpZyArIEJSMl9QQUNLQUdFX1NIQURPVyAgKyBCUjJfUEFDS0FHRV9MSU5VWF9Q
QU0KPiA+ID4gLT4gZmFpbHMgYW5kIHRoZXJlIGlzIG5vICJzeXN0ZW0tYXV0aCIgZmlsZSBhbnl3
aGVyZSBpbiB0aGUgYnVpbGQKPiA+ID4gLSBxZW11X3g4Nl82NF9kZWZjb25maWcgKyBCUjJfUEFD
S0FHRV9TSEFET1cgICsgQlIyX1BBQ0tBR0VfTElOVVhfUEFNCj4gPiA+ICsgQlIyX0lOSVRfU1lT
VEVNRC0+IGZhaWxzLCBzeXN0ZW0tYXV0aCBpcyBub3QgaW4gL2V0Yy9wYW0uZCBpbiB0aGUKPiA+
ID4gdGFyZ2V0IGZvbGRlci4gSSBkb24ndCBrbm93IHdoYXQgaGFwcGVuIGF0IHJ1bnRpbWUgKGJl
Y2F1c2UgSSBjYW5ub3QKPiA+ID4gbG9naW4pICBpbiB0aGF0IGNhc2UgSSBhbHNvIGZpbmQKPiA+
ID4gdGFyZ2V0L3Vzci9zaGFyZS9mYWN0b3J5L2V0Yy9wYW0uZC9zeXN0ZW0tYXV0aAo+ID4KPiA+
IFRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uCj4gPgo+ID4gPgo+ID4gPiBEbyB5b3UgdGhp
bmsgd2l0aC93aXRob3V0IHN5c3RlbWQgY2FzZSBzaG91bGQgYmUgZml4ZWQgZGlmZmVyZW50bHkg
Pwo+ID4gPiBJbiBhbnkgY2FzZSB0aGUgbWlzc2luZyBmaWxlIHNlZW1zIHRvIGJlIC9ldGMvcGFt
LmQvc3lzdGVtLWF1dGguCj4gPgo+ID4gWWVzLCB0aGUgZmlsZSBpcyBwcmVzZW50IHdpdGggc3lz
dGVtZCwgYnV0IGl0IGlzIG5vdCBjb3BpZWQgZHVyaW5nIGJvb3QKPiA+IGJ5IHN5c3RlbWQtdG1w
ZmlsZXMuc2VydmljZS4KPiA+Cj4gPiA+Cj4gPiA+IFN0w6lwaGFuZQo+ID4gPgo+ID4gW1NOSVBd
Cj4gPgo+ID4gV291bGQgeW91IGxpa2UgdG8gdGVsbCBtZSwgd2hpY2ggY29tbWFuZCB5b3UgYXJl
IHVzaW5nIHdpdGggUUVNVT8gSQo+ID4gd291bGQgbGlrZSB0byBjaGVjaywgd2hhdCBoYXBwZW5l
ZCAoaWYgSSBmaW5kIHRoZSB0aW1lIHRvKS4KPiA+Cj4gPiBUaGFua3MsCj4gPiBSYXBoYWVsIFBh
dmxpZGlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
