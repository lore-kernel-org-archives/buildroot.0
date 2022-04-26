Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AD5C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 20:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 454FD417B0;
	Tue, 26 Apr 2022 20:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UlUgzRQe4TNr; Tue, 26 Apr 2022 20:58:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12781415FB;
	Tue, 26 Apr 2022 20:58:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 399BB1BF5AD
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 20:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3073481BC2
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 20:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CiuW4QKnIeK7 for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 20:58:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8528181A6F
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 20:58:46 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-e5ca5c580fso20705002fac.3
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 13:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PGdcKwTyPTYCuUqVKxjz50RDmTzeNLaGekP2Cg6dVGY=;
 b=Xu+bNhfKrhrj0svcP51cl57xt+yGDvFZqkqc0E55rAXaS8hnWozIQdOgxbtcmkGQTw
 S/6iteXvNqm+ULvLJRO3LwRLBC0pF6elu0pKXftmW3cyIUG+XatBxcIRSO8MQJhPp0VN
 sO4qswSysretZStLNNtBiyVq1OjmpI4e5ScJ+Qq+5H1gywnLRUhVdAzzfIGk7ZAzmPL4
 bbEBAX/BDvuP/MtUxHiBXG/9s/FD5p5nXEINTjiFT/hiQK0RsAlcdshkGWyHdTVXEg6y
 naWk5aXnezw4lDhPbN9u4wMKLoEZvE8JOjm+/CnFRo+elq8DIn09R7K6biKccxaQMnfo
 WVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PGdcKwTyPTYCuUqVKxjz50RDmTzeNLaGekP2Cg6dVGY=;
 b=nnywnGUSYBdc7KSW9SHZlcliSOAW0i1a4aVDLHfv26G5JgGOcqVOTyRs+bFA42kehn
 cP7XsaeCTl3c5CbP2eXBI83FE+6uWoxHdfBLcNrjUl3h5YV43uJOcBgqoIAkbRXhpAAq
 NJh2SWdzI6AEDAQWyd3jNs4iSGbezncARwz+94rdvTRCP2Ftq30+ruORQzq1kLwx0EHx
 NTD1CasX/ecfeSO1NhlVLrj2vsL+iklsBxQWKEqfQTYJm2WO9LLk23CGF8ifltNItf64
 x/yvfhkynraPgWY1KjB2h4Y/0iF70Kj2LI2s6bGloZQw4Pc9JVnLE6C1XEil19fiJNXh
 Re5Q==
X-Gm-Message-State: AOAM530BZxNF7q5OnhLQIItuuE51S5RqMxfbG9aw8GwMDqHBOtG4GTfY
 QqG0JLWC6Isrxj+w6vnttwu1WoMPWtPh/tRKT9n8E/Yd
X-Google-Smtp-Source: ABdhPJxrLMXGvYUG6+odll7+B3Y44jGZtW/mAniX0VgCxI54vUlSkTh5xD/xRUzxIDAXkraSDyfny6mlXIlGs4swvhQ=
X-Received: by 2002:a05:6871:70a:b0:e9:17b3:53c with SMTP id
 f10-20020a056871070a00b000e917b3053cmr7172206oap.228.1651006725579; Tue, 26
 Apr 2022 13:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220406172934.4009018-1-fontaine.fabrice@gmail.com>
 <9406710d-ed6f-d0cd-4a7a-60480a4d4872@mind.be>
 <87bkwnk1tp.fsf@dell.be.48ers.dk>
In-Reply-To: <87bkwnk1tp.fsf@dell.be.48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 26 Apr 2022 22:56:37 +0200
Message-ID: <CAPi7W81Yf2t3LK=zyVhKMXL_O+3eyJ9gXPxfNba5HtxLc6jM-A@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: drop versioned layout
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWFyLiAyNiBhdnIuIDIwMjIgw6AgMjI6NDksIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4gYSDDqWNyaXQgOgo+Cj4gPj4+Pj4gIkFybm91dCIgPT0gQXJub3V0IFZhbmRl
Y2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiB3cml0ZXM6Cj4KPiAgPiBPbiAwNi8wNC8yMDIyIDE5
OjI5LCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+ICA+PiBib29zdC5tNCBlbWJlZGRlZCBieSBj
Yy10b29sIGlzIG5vdCBhYmxlIHRvIGZpbmQgYm9vc3QgbGlicmFyaWVzIHdoZW4KPiAgPj4gdGhl
eSBhcmUgdmVyc2lvbm5lZCAoZS5nLiBsaWJib29zdF9wcm9ncmFtX29wdGlvbnMtZ2NjOS1tdC1z
ZC0xXzc4LmEpOgo+ICA+PiBjb25maWd1cmU6IGVycm9yOiBjYW5ub3QgZmluZCB0aGUgZmxhZ3Mg
dG8gbGluayB3aXRoIEJvb3N0Cj4gID4+IHByb2dyYW1fb3B0aW9ucwo+ICA+PiBhem1xIGFuZCBp
MnBkIGFsc28gaGF2ZSB0aGUgc2FtZSBpc3N1ZToKPiAgPj4gQ01ha2UgRXJyb3IgYXQKPiAgPj4g
L252bWVkYXRhL2F1dG9idWlsZC9pbnN0YW5jZS04L291dHB1dC0xL2hvc3Qvc2hhcmUvY21ha2Ut
My4xOC9Nb2R1bGVzL0ZpbmRQYWNrYWdlSGFuZGxlU3RhbmRhcmRBcmdzLmNtYWtlOjE2NQo+ICA+
PiAobWVzc2FnZSk6Cj4gID4+IENvdWxkIE5PVCBmaW5kIEJvb3N0IChtaXNzaW5nOiBCb29zdF9J
TkNMVURFX0RJUiBzeXN0ZW0gZGF0ZV90aW1lIHRocmVhZAo+ICA+PiBjaHJvbm8gcmFuZG9tKSAo
UmVxdWlyZWQgaXMgYXQgbGVhc3QgdmVyc2lvbiAiMS40OCIpCj4gID4+IFNvIGRyb3AgdmVyc2lv
bmVkIGxheW91dCBvcHRpb24KPgo+ICA+ICBUaGlzIGlzIHByb2JhYmx5IGdvaW5nIHRvIGNhdXNl
IHByb2JsZW1zIGZvciBzb21lIGN1c3RvbSBwYWNrYWdlcwo+ICA+ICB0aGF0IGhhdmUgYSBzaW1w
bGUgYnVpbGQgc3lzdGVtIHRoYXQgYXNzdW1lcyB0aGUgdmVyc2lvbmVkIGxheW91dC4gT2gKPiAg
PiB3ZWxsLCBiYWQgbHVjay4KPgo+IFNvIHdoYXQgZG8gd2UgZG8gZm9yIDIwMjIuMDIueD8gV2Ug
cHJlc3VtYWJseSBoYXZlIHRoZSBzYW1lIGlzc3VlCj4gdGhlcmUuIERyb3AgaXQgYXMgd2VsbD8K
CklNSE8gd2Ugc2hvdWxkIGRyb3AgaXQgYXMgd2VsbCBhcyB0aGUgdGFnZ2VkIGxheW91dC4KCj4K
PiAtLQo+IEJ5ZSwgUGV0ZXIgS29yc2dhYXJkCgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
