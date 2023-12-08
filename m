Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02241C4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 11:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D4844028D;
	Fri,  8 Dec 2023 11:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D4844028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nbV2L_FeoARq; Fri,  8 Dec 2023 11:29:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5D6740248;
	Fri,  8 Dec 2023 11:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5D6740248
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9776B1BF37A
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 11:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 709D160C11
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 11:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 709D160C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bOsVgjcvOH69 for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 11:29:55 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F82660F0A
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 11:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F82660F0A
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9e1021dbd28so260176766b.3
 for <buildroot@buildroot.org>; Fri, 08 Dec 2023 03:29:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702034993; x=1702639793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LAOVzNh/ih0ZttoJLbSqBE3d2tuTN6RLaUFPAvOOWIw=;
 b=e1spsYJ27mFGNmyIcvbAE7vP9Ehz9z7+lgxLkyIZUlA9+bjIofT77fvY7iYH64k1Vw
 hsR6jB6I2lvdpp8453JrA+silBpA5ZmnxAm6A5R64gx1N9a27+Fwj1zj2Bhq2yLggAoZ
 Y3qZCgW5AXlNbo5pOMk8LdgsaK0JgssYxDk9M1JOVNZa2yEnjQUJ0koQGQeTOuBSMSq1
 jVEkzsCggdyVnN9DCJB6v4vRyDx4kfQHrd87jOcTrjwwflV2U58dxRD4zq7kWbRGmpsp
 CqaZ0400/fW6EQv6dND95Wl6M7xnZY1IwzdRYCiH9m+dd6ESIFool+rI+dSN/pVYyoWd
 cWpQ==
X-Gm-Message-State: AOJu0Yw42zh6ikn1w/yTsDq75eR3eQHhVWUJQs1Q4205bvTlHSOE04Y+
 9/beZ1/swcHc2uu3axgURw3yNsZF5qqnU83awOQ91pkRUONp3sHO3P13UA==
X-Google-Smtp-Source: AGHT+IGXUmDAwU6mOkeihLbxhgzUBQf2SC2IWgdIoIKgRkVqJWU+UUab29pvQ10Xt8q+mcSz0x5j26iYSzkLnqBjTYw=
X-Received: by 2002:a17:906:ccda:b0:a1d:2edd:d4ca with SMTP id
 ot26-20020a170906ccda00b00a1d2eddd4camr2185620ejb.65.1702034993358; Fri, 08
 Dec 2023 03:29:53 -0800 (PST)
MIME-Version: 1.0
References: <CAPn86JAC9RLnYULz=M+y55KGgzvF_yWZa3ujNSbg58aCS6KPZQ@mail.gmail.com>
In-Reply-To: <CAPn86JAC9RLnYULz=M+y55KGgzvF_yWZa3ujNSbg58aCS6KPZQ@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 8 Dec 2023 12:29:41 +0100
Message-ID: <CAOf5uwkzy_mf4YA1tJxLdVfbQ3hyR+33wui8Ns4RfixvhRUiZw@mail.gmail.com>
To: Stefano Cottafavi <stefano.cottafavi@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702034993; x=1702639793;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LAOVzNh/ih0ZttoJLbSqBE3d2tuTN6RLaUFPAvOOWIw=;
 b=kLHz0HUM1tWIn7gsKID4oWLcAA2S2l3NysYw6okPNKQ1FLhx3ApsCmgz0I8LUyels3
 AnHM40YcUe90Z8m7L6/L2yzIkCVtemI3lE66WEGPedOu5dDXctZjWe6NZosTTvkM5sNP
 5aB1T7BMyj5bkye6AkwtHeIPoEMhwTtrV0vV4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=kLHz0HUM
Subject: Re: [Buildroot] help - custom user not working
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU3RlZmFubwoKSSBoYXZlIGFkZGVkIHlvdXIgZmlsZSBpbiBteSBidWlsZHJvb3QgYW5kIG1v
dW50IC1vIGxvb3AgdGhlIHJlc3VsdApmaWxlc3lzdGVtIGFuZCBJIGhhdmU6CgpzdWRvIGNhdCAv
bW50L2V0Yy9zaGFkb3cKcm9vdDo6Ojo6Ojo6CmRhZW1vbjoqOjo6Ojo6OgpiaW46Kjo6Ojo6OjoK
c3lzOio6Ojo6Ojo6CnN5bmM6Kjo6Ojo6OjoKbWFpbDoqOjo6Ojo6Ogp3d3ctZGF0YToqOjo6Ojo6
OgpvcGVyYXRvcjoqOjo6Ojo6Ogpub2JvZHk6Kjo6Ojo6OjoKZGJ1czoqOjo6Ojo6OgpwaTokNSR0
OTZoRlRvWS42WTZ5WTQkVDVOdWdBLlNsVGx1SVBvWFpXN0tSN3c4bm1PVVJXRUNtcm5RczhKbGQ5
MTo6Ojo6OjoKCnN1ZG8gY2F0IC9tbnQvZXRjL3Bhc3N3ZApyb290Ong6MDowOnJvb3Q6L3Jvb3Q6
L2Jpbi9zaApkYWVtb246eDoxOjE6ZGFlbW9uOi91c3Ivc2JpbjovYmluL2ZhbHNlCmJpbjp4OjI6
MjpiaW46L2JpbjovYmluL2ZhbHNlCnN5czp4OjM6MzpzeXM6L2RldjovYmluL2ZhbHNlCnN5bmM6
eDo0OjEwMDpzeW5jOi9iaW46L2Jpbi9zeW5jCm1haWw6eDo4Ojg6bWFpbDovdmFyL3Nwb29sL21h
aWw6L2Jpbi9mYWxzZQp3d3ctZGF0YTp4OjMzOjMzOnd3dy1kYXRhOi92YXIvd3d3Oi9iaW4vZmFs
c2UKb3BlcmF0b3I6eDozNzozNzpPcGVyYXRvcjovdmFyOi9iaW4vZmFsc2UKbm9ib2R5Ong6NjU1
MzQ6NjU1MzQ6bm9ib2R5Oi9ob21lOi9iaW4vZmFsc2UKZGJ1czp4OjEwMDoxMDE6REJ1cyBtZXNz
YWdlYnVzIHVzZXI6L3J1bi9kYnVzOi9iaW4vZmFsc2UKcGk6eDoxMDE6MTA0OjovaG9tZS9waTov
YmluL3NoCgphbmQgc2FtZSByZXN1bHQgaW4gZ3JvdXAKClRyeSB0byBwdXQKCmRpZmYgLS1naXQg
YS9zdXBwb3J0L3NjcmlwdHMvbWt1c2VycyBiL3N1cHBvcnQvc2NyaXB0cy9ta3VzZXJzCmluZGV4
IDRmYzA2ZjhmZGYuLmNiNmU4Yjc4OTQgMTAwNzU1Ci0tLSBhL3N1cHBvcnQvc2NyaXB0cy9ta3Vz
ZXJzCisrKyBiL3N1cHBvcnQvc2NyaXB0cy9ta3VzZXJzCkBAIC0xLDUgKzEsNSBAQAogIyEvdXNy
L2Jpbi9lbnYgYmFzaAotc2V0IC1lCitzZXQgLWV4CiBteW5hbWU9IiR7MCMjKi99IgoKQW5kIG1h
a2UgVj0xIHRvIHNlZSB3aGF0IHRoZSBzY3JpcHQgaXMgZG9pbmcKCk1pY2hhZWwKCk9uIEZyaSwg
RGVjIDgsIDIwMjMgYXQgMTE6NDbigK9BTSBTdGVmYW5vIENvdHRhZmF2aQo8c3RlZmFuby5jb3R0
YWZhdmlAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpLAo+IEknbSB0cnlpbmcgdG8gYWRkIGEgY3Vz
dG9tIHVzZXIgdG8gdGhlIG1pbmltYWwgInJhc3BiZXJyeXBpNF9kZWZjb25maWciIGJ1aWxkLgo+
IEknbSB1c2luZyBCdWlsZHJvb3QgMjAyMy4xMSwgZm9sbG93aW5nIHRoZSBtYW51YWwgSSd2ZSBj
cmVhdGVkIGEgInVzZXJzLnR4dCIgZmlsZSAoaW4gdGhlIGJ1aWxkcm9vdCByb290IGZvbGRlcikg
d2l0aCBqdXN0IG9uZSBsaW5lOgo+Cj4gcGkgLTEgcGkgLTEgPXJhc3BiZXJyeSAvaG9tZS9waSAv
YmluL3NoIC0KPgo+IFRoZSBjb25maWcgZmlsZSBjb250YWluczoKPgo+IEJSMl9ST09URlNfVVNF
UlNfVEFCTEVTPSJ1c2Vycy50eHQiCj4KPiBUaGUgYnVpbGQgaXMgc3VjY2Vzc2Z1bCBhbmQgbG9v
a2luZyBhbmQgdGhlICJmdWxsX3VzZXJzX3RhYmxlLnR4dCIgKG91dHB1dCBvZiB0aGUgYnVpbGQp
IEkgY2FuIHNlZSB0aGUgdXNlciBkZWZpbml0aW9uIGFib3ZlLgo+Cj4gSG93ZXZlciwgd2hlbiBJ
IHRyeSB0byBsb2cgb24gYXMgInBpIiBJIGdldCAiTG9naW4gaW5jb3JyZWN0IiBlcnJvci4KPgo+
IElmIEkgbG9naW4gYXMgcm9vdCBhbmQgY2hlY2sgdGhlIC9ldGMvcHNzd2QsIEkgRE8gTk9UIHNl
ZSB0aGUgdXNlciBwaQo+Cj4gQ2FuIHlvdSBoZWxwIG1lIHVuZGVyc3RhbmQgd2hhdCBhbSBJIG1p
c3Npbmc/Cj4KPiBDaGVlcnMKPiBTdGVmYW5vCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKCgoKLS0gCk1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaQpDby1Gb3Vu
ZGVyICYgQ2hpZWYgRXhlY3V0aXZlIE9mZmljZXIKTS4gKzM5IDM0NyA5MTMgMjE3MAptaWNoYWVs
QGFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
CkFtYXJ1bGEgU29sdXRpb25zIEJWCkpvb3AgR2Vlc2lua3dlZyAxMjUsIDExMTQgQUIsIEFtc3Rl
cmRhbSwgTkwKVC4gKzMxICgwKTg1IDExMSA5MTcyCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20K
d3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
