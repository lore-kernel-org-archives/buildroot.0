Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FBDC4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 08:18:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65CA960F39
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 08:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65CA960F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29D9860731;
	Sat, 31 Jul 2021 08:18:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ap_Ameg36X19; Sat, 31 Jul 2021 08:18:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E07760711;
	Sat, 31 Jul 2021 08:18:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D0DD1BF836
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 08:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18F3783C03
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 08:18:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QJ1-1blQHoA8 for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 08:18:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0268183C00
 for <buildroot@uclibc.org>; Sat, 31 Jul 2021 08:18:21 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id n6so15965108ljp.9
 for <buildroot@uclibc.org>; Sat, 31 Jul 2021 01:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FdR1b5+A9mgjRcJkBIOWnLnDSRR3pJUQF6C4MKCkON0=;
 b=fQzftVjHUXLlWrCEXAbrf2CgRtiKGC6TDBik7mohUo3TsjfU7Is7whg/TFOWC1OI+A
 Gp6iykcswGa4u9memdz2/sHgIhmg5CuFMNI1mB2LW91SPzygkdoKmI3XQtQ8lIyvpSww
 noJvHZ3b/4F372Ebl5GD4PselqHThqYW1qnLX/pNeufB/6QLgcf+rGu6bor0ysWkIaKn
 JkHhfUpaX2lbfzwUhSP40W8J2usAYzOpUFB9yMNFCdU16A53RIQpUDg7gq1nNQgrS2Wy
 m7pAGTdszHlsKmpDAjdxgeT9AYT0wJTbsrkSQsB1S1ueUinb/fAZ63omBKcKKsWGgfjV
 R4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FdR1b5+A9mgjRcJkBIOWnLnDSRR3pJUQF6C4MKCkON0=;
 b=CoL4WQ5xIsJ7FnANdwWlypIgGOSwSbU4rgqp65Llts6O5ZhhBIXAe4PMXSilqm/5KL
 A1r1cBZ+lTGR8gjP5sbVaeXBQEf1oKTRXqEsr1q3xroNoQr9+vw3rXWN1Pg8BV1fFYTO
 cSkrlTO2dbvuoYNWyM2I/g9Ixff+Zdr3P2oLF5IgyE3lM1DTTd63eXRAbL3JpeiiHBv+
 BuX118bpzLUW7xlo5Xwr9aqUi5E+PAQXcAm4YERjbd16qvrKav6+LDt6I/E4RcPZr9ll
 sbprjIQyz6NjyHWmCOFEOG4M89CZeDP7jPKYfJoZc2RII8jCDCNb7GxKDDj3G8POXr/X
 jlDQ==
X-Gm-Message-State: AOAM532/AFoZYEXp67Hfp1mlM3/ksVXIvAxbRoivP7qtg05WISFjTDdn
 N7kn4hp0GxkipVPHnUTt5idsMFeKUp54ITg0yUA=
X-Google-Smtp-Source: ABdhPJzchBfJyyaSXpDXXRgICqapMUy6zvzy16lXJZ825fGNVUNooz3BXsP4Nqu1W/Qs4TURFWRbMHrf2zPqtjm543A=
X-Received: by 2002:a2e:a78c:: with SMTP id c12mr4399023ljf.319.1627719499752; 
 Sat, 31 Jul 2021 01:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210730091005.7c91f3b7@windsurf>
 <CAPi7W80D-vTy8Hg7R-aLekkW=F5CopjwkSqjwjzrhh__-4ZunA@mail.gmail.com>
 <20210731101324.54518fbb@windsurf>
In-Reply-To: <20210731101324.54518fbb@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 31 Jul 2021 10:18:08 +0200
Message-ID: <CAPi7W80VWxDc-8Oti2QQQ_-UXzBYvjHKwGBeMO8eC-v1=w_KDw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] refpolicy build failures
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "buildroot@uclibc.org" <buildroot@uclibc.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

TGUgc2FtLiAzMSBqdWlsLiAyMDIxIMOgIDEwOjEzLCBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBIZWxsbyBGYWJyaWNlLAo+Cj4g
T24gU2F0LCAzMSBKdWwgMjAyMSAxMDowNTo1MCArMDIwMAo+IEZhYnJpY2UgRm9udGFpbmUgPGZv
bnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gSSBmaXhlZCBtaW5pZGxuYSwg
ZmV0Y2htYWlsIGFuZCBleGltLgo+Cj4gVGhhbmtzIGZvciB5b3VyIHdvcmssIEkgbWVyZ2VkIHlv
dXIgcGF0Y2hlcyBmaXhpbmcgdGhlc2UgaXNzdWVzLgo+Cj4gPiBUaGUgb3RoZXIgYnVpbGQgZmFp
bHVyZXMgYXJlIGFsbCByZWxhdGVkIHRvIHBhY2thZ2VzIHRoYXQgY2FuCj4gPiBvcHRpb25hbGx5
IHNoYXJlIGNvbnRlbnQgdGhyb3VnaCBhcGFjaGUvaHR0cGQgKGUuZy4gY29sbGVjdGQsIGN2cywK
PiA+IGdpdCwgbnV0LCBldGMuKS4KPiA+IFRoZXkncmUgcmFpc2VkIHdoZW4gYXBhY2hlIGlzIG5v
dCBlbmFibGVkIGJlY2F1c2UgdGhlaXIgZmlsZSBjb250ZXh0cwo+ID4gdW5jb25kaXRpb25hbGx5
IHVzZSBhcGFjaGUvaHR0cGQgcGFyYW1ldGVycy4KPiA+IEkgb3BlbmVkIGFuIGlzc3VlIHRvIGtu
b3cgaG93IHRvIHByb3Blcmx5IGZpeCB0aG9zZSBpc3N1ZXM6Cj4gPiBodHRwczovL2dpdGh1Yi5j
b20vU0VMaW51eFByb2plY3QvcmVmcG9saWN5L2lzc3Vlcy80MDAuCj4KPiBTaG91bGQgd2UgcmV2
ZXJ0IHRob3NlIGNoYW5nZXMgaW4gQnVpbGRyb290IGZvciB0aGUgdGltZSBiZWluZz8gT3IKPiB1
bmNvbmRpdGlvbmFsbHkgYWRkIHRoZSBhcGFjaGUvaHR0cGQgU0VMaW51eCBtb2R1bGVzIGluIGNv
bGxlY3RkLCBjdnMsCj4gZ2l0LCBudXQgPyBUaGlzIGlzIGVmZmVjdGl2ZWx5IHdoYXQgdGhlIHJl
ZnBvbGljeSByZXF1aXJlcyByaWdodCBub3cuCkluZGVlZCwgSSdsbCBzZW5kIHBhdGNoZXMgdG8g
YWRkIGFwYWNoZS9odHRwZC4gSG9wZWZ1bGx5LCB3ZSBzaG91bGQgYmUKYWJsZSB0byByZW1vdmUg
aXQgbGF0ZXIgb24uCj4KPiBCZXN0IHJlZ2FyZHMsCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQ
ZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQg
S2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpCZXN0IFJlZ2FyZHMsCgpG
YWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5i
dXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
