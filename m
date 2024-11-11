Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA0CD12D49
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 14:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 073FD60676;
	Mon, 11 Nov 2024 14:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olVdNB2jbIrK; Mon, 11 Nov 2024 14:37:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 059B56067A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 059B56067A;
	Mon, 11 Nov 2024 14:37:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DAA76C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BAD64024E
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNAQjPgCoQh2 for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 14:37:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 469D3401EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 469D3401EE
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 469D3401EE
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:37:48 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2e91403950dso3432815a91.3
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 06:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731335867; x=1731940667;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TMQcyeidcVAMdyjMiXdM02UL5S3VhzUb5h02CO2EQx4=;
 b=iGjY2XViRfPzK2JGOYP/crIR3et+mfm+PD3ZEC5gZOTSWUBNYl6RfJPkeyT6i0XXSW
 fbApvY0/sEqMhgeP9b68n8qAYtPvgpT4cjJ2u+2Jfvndb9Fzm21mTja5Hn9a9s11lhQt
 xfUhEZEzEReMo34wp2v7Xg0bxuB0etRTPHWx3G20IDaOEG++6oLQcaWkbQ1pg5aTkl/X
 kmnwCNssCW8y8iYahvv8UKsuASofDaBqcB2H8UHVNJPB3jXi0ylI5WnTklDxTPRkHMUA
 fMEPz0/TUFrR1S00NXwoyfkWkKBONKF2c4hifC1D84C53r1cHwOmuqhKUUF/mtw20GJf
 LEgg==
X-Gm-Message-State: AOJu0YwvAsiRXFnn3V5LZez/JFWPzJh7MZI130qf86Had2aB8KLGofyh
 vrSuic1uhUujNV0SWFZCNdiewp3Vef3+D3fQIZQ6SDLA+UqnqycX5eTBoudpzJ3+BBce8dGc5es
 vEeiVP5+10VcDGMZ+kPoodqW1Tt4=
X-Google-Smtp-Source: AGHT+IHhT5dqkQ0iVjDIVchnZKIs/IGafIp/nRq71QV8OwkjzkfGsoBQ2VHUlr/bqoM5e87f6vLUQCIAIpoG2eO0YKk=
X-Received: by 2002:a17:90b:52c3:b0:2e2:e5d0:dabc with SMTP id
 98e67ed59e1d1-2e9b171635bmr17649404a91.11.1731335867372; Mon, 11 Nov 2024
 06:37:47 -0800 (PST)
MIME-Version: 1.0
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
 <ZzIH0atHhpuyJ5U1@ryzen>
In-Reply-To: <ZzIH0atHhpuyJ5U1@ryzen>
From: Brandon Maier <brandon.maier@gmail.com>
Date: Mon, 11 Nov 2024 08:37:35 -0600
Message-ID: <CADwxmTnkrLpWj2Br4=p9xusWoFDRc_w=0qAWGGZ3Rsa87gpuGg@mail.gmail.com>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Niklas Cassel <cassel@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731335867; x=1731940667; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TMQcyeidcVAMdyjMiXdM02UL5S3VhzUb5h02CO2EQx4=;
 b=jDHQXWIwdM1L2NjT5Qy7pCNZ/jKmeRTJkmMEkYcxfMmiFPLpVaCzAi+YH0ElBT6unV
 /IKa7Y/iXNrbnsdl5ISi5B9MBCyMGtDjFjDkwHqJGS3q1iyjP4/izvqI6qc/JCitoCW7
 uQcsGs62pdrU9iSyLSgPRVtu/VoLxTIP1J7v89nLU/zRjZy615NaReZees0iE/6jghJN
 UB1SkfgAcfeYYAhs3RtAS3uhENduOn8PSPVQNcHp7CsqL5MHkIsuQoCJSSs/ooCa+17v
 lpeLc6TTfj5+wZpNOKEMp7HL03w7x5uH8Lkre1HEbr3PRvt7rtHWZHaBNDID9N0c8+zr
 km5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jDHQXWIw
Subject: Re: [Buildroot] [PATCH 00/17] board: cleanup genimage
 partition-type-uuid shortcuts
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

SGkgTmlrbGFzLAoKT24gTW9uLCBOb3YgMTEsIDIwMjQgYXQgNzozNOKAr0FNIE5pa2xhcyBDYXNz
ZWwgPE5pa2xhcy5DYXNzZWxAd2RjLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIE5vdiAwOSwgMjAy
NCBhdCAwNDoxNjoxNFBNIC0wNjAwLCBCcmFuZG9uIE1haWVyIHdyb3RlOgo+ID4gQnVpbGRyb290
IGJvYXJkcyB1c2luZyBnZW5pbWFnZSdzICJwYXJ0aXRpb24tdHlwZS11dWlkIiBjYW4gdXNlIGVp
dGhlciBhCj4gPiBmdWxsIEdVSUQgb3Igb25lIG9mIHRoZSBzaG9ydGN1dHMgZGVmaW5lZCBpbiBn
ZW5pbWFnZVsxXS4gVGhlIEJ1aWxkcm9vdAo+ID4gbWFudWFsIHJlY29tbWVuZHMgdXNpbmcgdGhl
ICJMIiwgIlUiLCBvciAiRiIgc2hvcnRjdXRzIG92ZXIgYSBmdWxsIEdVSUQ7Cj4gPiBidXQgZG9l
cyBub3Qgc3BlY2lmeSBob3cgYW55IG90aGVyIEdVSUQgc2hvdWxkIGJlIGRlZmluZWQuCj4gPgo+
ID4gVGhpcyBzZXJpZXMgdHJpZXMgdG8gYnJpbmcgY29uc2lzdGVuY3kgdG8gcGFydGl0aW9uLXR5
cGUtdXVpZCBieSBtYWtpbmcKPiA+IHNob3J0Y3V0cyB0aGUgcHJlZmVycmVkIG1ldGhvZC4gRmly
c3Qgd2UgdXBkYXRlIHRoZSBCdWlsZHJvb3QgbWFudWFsIHRvCj4gPiBzYXkgc2hvcnRjdXRzIHNo
b3VsZCBiZSBwcmVmZXJyZWQgd2hlbiBhdmFpbGFibGUuIFRoZW4gd2UgdXBkYXRlIGFsbAo+ID4g
Ym9hcmRzIHRvIHVzZSBzaG9ydGN1dHMuCj4gPgo+ID4gVGhpcyBzZXJpZXMgaXMgcGFydGlhbGx5
IGltcGxlbWVudGluZyBUaG9tYXMgc3VnZ2VzdGlvbiB0byBoYXZlCj4gPiBjb25zaXN0ZW5jeSB3
aGVuIHVzaW5nICJMIiB2cyAicm9vdC0ke0FSQ0h9IiB2cyBmdWxsIEdVSURzWzJdLgo+ID4KPiA+
IFsxXSBodHRwczovL2dpdGh1Yi5jb20vcGVuZ3V0cm9uaXgvZ2VuaW1hZ2UvYmxvYi9tYXN0ZXIv
aW1hZ2UtaGQuYyNMMjY0Cj4gPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290
LzIwMjQxMDIyMjI0OTQ1LjRkYzY3Yjg5QHdpbmRzdXJmLwo+Cj4gT3RoZXIgdGhhbiBzb21lIG1p
bm9yIGNvbW1lbnRzLCB0aGUgc2VyaWVzIGxvb2tzIGdvb2QgdG8gbWUuCj4gR29vZCBqb2IhCj4K
Pgo+IFlvdSBzZWVtIHRvIGhhdmUgbWlzc2VkIG9uZSBjb252ZXJzaW9uIHRob3VnaDoKPiBib2Fy
ZC9yYWR4YS9yb2NrNWIvZ2VuaW1hZ2UuY2ZnOgo+Cj4gcGFydGl0aW9uLXR5cGUtdXVpZCA9IDNk
ZTIxNzY0LTk1YmQtNTRiZC1hNWMzLTRhYmU3ODZmMzhhOAo+Cj4gY2FuIHVzZSBzaG9ydGN1dDoK
PiBwYXJ0aXRpb24tdHlwZS11dWlkID0gdS1ib290LWVudgo+Cj4KPiBCdXQgbm93IHdoZW4gSSBs
b29rIGF0IGl0LCBpdCB3YXMgeW91IHdobyBhZGRlZCB0aGlzIHRvIGdlbmltYWdlIGp1c3QgYQo+
IHdlZWsgYWdvOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9wZW5ndXRyb25peC9nZW5pbWFnZS9jb21t
aXQvM2UwYTJhZWE4ZDEwNDMxZjhjOGY2NTIxMjlmNzM1NDRjZmExNmFmMgo+Cj4gU28gd2UgbWln
aHQgbmVlZCB0byBidW1wIGdlbmltYWdlIGluIGJ1aWxkcm9vdCBiZWZvcmUgd2UgY2FuIG1ha2Ug
dXNlIG9mCj4gdGhhdCBzaG9ydGN1dC4gKEFuZCBmb3IgdGhhdCB3ZSBwcm9iYWJseSB3YW50IHRv
IHdhaXQgZm9yIGEgbmV3IHRhZ2dlZAo+IHJlbGVhc2Ugb2YgZ2VuaW1hZ2UuKQoKWWVwISBJIHdh
cyBnb2luZyB0byB3YWl0IHVudGlsIHRoaXMgc2VyaWVzIHdhcyBhY2NlcHRlZCwgdGhlbiB1cGRh
dGUKZ2VuaW1hZ2UgdG8gc3VwcG9ydCB1LWJvb3QtZW52LkkgbGVmdCBpdCBvdXQgb2YgdGhpcyBz
ZXJpZXMgdG8ga2VlcCBpdApmcm9tIGdldHRpbmcgdG9vIGNvbXBsaWNhdGVkLgoKTXkgZXZlbnR1
YWwgZ29hbCBpcyB0byBzd2l0Y2ggdGhlIFhpbGlueCBib2FyZHMgdG8gdXNpbmcgdS1ib290LWVu
di4KSGF2aW5nIHRoZSBlbnYgaW4gYSBzZXBhcmF0ZSBwYXJ0aXRpb24gaXMgYSB1c2VmdWwgZmVh
dHVyZSA6KQoKVGhhbmtzIGZvciByZXZpZXdpbmcgdGhlIHNlcmllcyEKQnJhbmRvbiBNYWllcgoK
Pgo+Cj4gS2luZCByZWdhcmRzLAo+IE5pa2xhcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
