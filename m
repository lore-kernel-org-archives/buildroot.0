Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3BEEB64D9
	for <buildroot@archiver.kernel.org>; Fri,  7 Jul 2023 19:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 252E9405D4;
	Fri,  7 Jul 2023 19:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 252E9405D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZoXrifRzQntj; Fri,  7 Jul 2023 19:08:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67404403A7;
	Fri,  7 Jul 2023 19:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67404403A7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C644A1BF2B6
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 19:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE366611FB
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 19:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE366611FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vozXG_GLR2Hf for <buildroot@lists.busybox.net>;
 Fri,  7 Jul 2023 19:08:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A29560F27
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A29560F27
 for <buildroot@buildroot.org>; Fri,  7 Jul 2023 19:08:07 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fa48b5dc2eso3653580e87.1
 for <buildroot@buildroot.org>; Fri, 07 Jul 2023 12:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688756885; x=1691348885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uk2B/vaRL2RIMu8jSxs95+Ttfi7Lwir2fU13c/yDySs=;
 b=E8epeHEMfjYXrmtjyh2bxRJ76X6lxaC2x4dCMCEzI5y8dkvTV+Ss1RP4wMkSkfVAAA
 S1pdnUJKpt2rsCjq5Nx2NomZBBE2vqtni5DhhVhDRIzz0eFk3gd8uYWHVJtZWfL/aBwV
 kWooT3RS5Q04jkmD583BWu1KXzWQsRfqO+9j0vsBsd3k3XAyvg0j9oLzShJmLyG35nrV
 O/R4lkWHEstaHYzh2Hd91XepbxJA9skTii+wUbKqrio3rRtUSlCuGjndQN4KliQNKGvA
 FIDiKv7CQ7LXlO0azQG+BHxTxPg5+E9prNMJsj4G1ZrabeeYesvtSjlhElDCQ/Xodr8i
 EIbw==
X-Gm-Message-State: ABy/qLY4qeQlT89ZNmPiiZK48QJ7/Z3y/DkWPigLAdJZvyMuvvkk9UN9
 P38DOxdX/c/evYK0L12ZbZzS6rwZD1Trg/i02jWRQQ==
X-Google-Smtp-Source: APBJJlHWsngUCWTtxwv/KN1shp8AxTvO9oyEAJkgmZmoJ/+vgs/fK+xaq/7jXPQeiaU9Xx3R/We8fw==
X-Received: by 2002:a05:6512:a90:b0:4f8:770f:1b08 with SMTP id
 m16-20020a0565120a9000b004f8770f1b08mr5438145lfu.13.1688756884631; 
 Fri, 07 Jul 2023 12:08:04 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 l15-20020aa7d94f000000b0051dd16f7e50sm2343883eds.44.2023.07.07.12.08.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 12:08:04 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-3fbc6ab5ff5so24395105e9.1
 for <buildroot@buildroot.org>; Fri, 07 Jul 2023 12:08:03 -0700 (PDT)
X-Received: by 2002:a1c:7c08:0:b0:3fb:b6f3:e528 with SMTP id
 x8-20020a1c7c08000000b003fbb6f3e528mr4788526wmc.25.1688756883453; Fri, 07 Jul
 2023 12:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230707185106.98208-1-ckhardin@gmail.com>
 <CA+h8R2ro85otAvxzWshcrrwPVyrAiZ0vEdtrMNKXLX8mvOBwdA@mail.gmail.com>
In-Reply-To: <CA+h8R2ro85otAvxzWshcrrwPVyrAiZ0vEdtrMNKXLX8mvOBwdA@mail.gmail.com>
Date: Fri, 7 Jul 2023 12:07:52 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qsM9OGKgvHz_oZBSD+t4-oMjK+TMu34AneoaJVnPsnDA@mail.gmail.com>
Message-ID: <CA+h8R2qsM9OGKgvHz_oZBSD+t4-oMjK+TMu34AneoaJVnPsnDA@mail.gmail.com>
To: Charles Hardin <ckhardin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1688756885; x=1691348885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uk2B/vaRL2RIMu8jSxs95+Ttfi7Lwir2fU13c/yDySs=;
 b=xfexHHQ6UTttASmSqUbEqt5fQ3ai7UppkvFWPEbr/76Q2PfFZCUg1nXK+zx6hIPzab
 T53MLQHzn67p7/Mzez3oVsXYh3Tk9gUxP2D6qMLpLrVpTelyosWpHg7Y/RotM3amnNEX
 zsBwjBtwloQ/S1vZKM39z4VtqNdrMmgVokM4qlRZpLQQ1/yFV8TtkLNufih6VCUaEjXL
 Rvn/3D9hfetVSV6tWo5raJoVHLfiexVajvAE6id5A1l6fMKJN9iDpsXjhAGy+hswIVNB
 MICFu80puhhdyM529J2mZKpl746jrURb/jT5qgZWYZ5um3jzrDBCMSB7veNp9D2XeYnY
 nuEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=xfexHHQ6
Subject: Re: [Buildroot] [PATCH 1/1] package/go-native: add a new download
 only package for go compilers
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQ2hhcmxlcywKCgpPbiBGcmksIEp1bCA3LCAyMDIzIGF0IDEyOjA04oCvUE0gQ2hyaXN0aWFu
IFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4gVGhpcyBpcyBub3QgbmVj
ZXNzYXJ5IHdpdGggdGhpcyBwYXRjaCBzZXJpZXM6Cj4KPiBodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvP3Nlcmllcz0zNTg0NTEKPgo+IFdlIGNhbiBj
b3JyZWN0bHkgYm9vdHN0cmFwIG9uIGFybTY0LgoKSSBzaG91bGQgY2xhcmlmeTogYWN0dWFsbHkg
Z28gYm9vdHN0cmFwIHN0YWdlMSBjYW5ub3Qgd29yayBvbiBhcm02NAooeW91J3JlIGNvcnJlY3Qg
b24gdGhpcykuCgpJIGhhZCBzdWJtaXR0ZWQgdGhpcyBwYXRjaCBhcyB3ZWxsIHRvIHVzZSB0aGUg
aG9zdCAiZ28iIGluIHRoaXMgY2FzZToKCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJv
amVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMzAyMTUwNzMyNTYuMTg2NDc2LTMtY2hyaXN0aWFuQHBh
cmFsLmluLwoKU2ltaWxhciB0byBob3cgd2UgdXNlIGhvc3QgZ2NjLgoKSG93ZXZlciwgSSB1bmRl
cnN0YW5kIHRoYXQgeW91ciBzZXJpZXMgaW50ZW5kcyB0byBhZGQgZG93bmxvYWRpbmcgdGhlCmJp
bmFyaWVzIGZvciB0aGUgR28gY29tcGlsZXIgdG8gQnVpbGRyb290IGFzIHdlbGwuCgpUaGlzIGlz
IHBvdGVudGlhbGx5IHVzZWZ1bCBidXQgSSBzdGlsbCBzdWJtaXQgdGhhdCB3ZSBuZWVkIHRvIG1l
cmdlCnRoZSBhYm92ZSBzZXJpZXMgdXBkYXRpbmcgdG8gR28gMS4yMCBhbmQgc3BsaXR0aW5nIHRo
ZSBib290c3RyYXAgaW50bwp0d28gcGhhc2VzIGJlZm9yZSBtZXJnaW5nIHRoZSBnby1uYXRpdmUg
c2VyaWVzLgoKSSdsbCBzdGFydCB0ZXN0aW5nIHlvdXIgcGF0Y2ggYXMgd2VsbC4KClRoYW5rcywK
Q2hyaXN0aWFuCgo+IE9uIEZyaSwgSnVsIDcsIDIwMjMgYXQgMTE6NTHigK9BTSBDaGFybGVzIEhh
cmRpbiA8Y2toYXJkaW5AZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGUgZ28tbmF0aXZlIGlz
IG1haW5seSBmb3IgdGhlIGFhcmNoNjQgc3VwcG9ydCBzaW5jZSB0aGF0IHdhcwo+ID4gYWRkZWQg
YWZ0ZXIgdGhlIGdvLWJvb3RzdHJhcCB3cml0dGVuIGluIEMgd2FzIGRyb3BwZWQuIFNvLCB0bwo+
ID4gZ2V0IGEgY3Jvc3MgY29tcGlsZXIgZm9yIGdvIGEgaG9zdC9uYXRpdmUgY29tcGlsZXIgbmVl
ZHMgdG8gYmUKPiA+IGF2YWlsYWJsZSB0byBnZW5lcmF0ZSB0aGUgc2V0dXAgZm9yIHRoZSBuZWVk
ZWQgdGFyZ2V0LiBUaGlzIGlzCj4gPiB1c2luZyB0aGUgc2FtZSBnbyB2ZXJzaW9uIGFzIHRoZSBl
eHBlY3RlZCBjcm9zcy1jb21waWxlciB0bwo+ID4ga2VlcCB0aGUgcGFja2FnZXMgaW4gc3luYy4g
QSBzcGVjaWZpYyB2ZXJzaW9uIGNvdWxkIGJlIHVzZWQuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
